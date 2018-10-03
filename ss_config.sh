#!/bin/bash -

mirror_prefix="registry.docker-cn.com"
ss_docker_url="mritd/shadowsocks"

if [ -e /usr/config/ss/use_mirror ]; then
    ss_docker_url=$mirror_prefix/$ss_docker_url
fi

self_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )/$(basename $0)"

run_ss()
{
    my key=$(cat /usr/config/ss/key)
    if [ -e /usr/config/ss/server ]; then
        docker run -dt --name ssserver -p 6443:6443 -p 6500:6500/udp $ss_docker_url -m \
        "ss-server" -s "-s 0.0.0.0 -p 6443 -m chacha20 -k $key --fast-open" -x -e "kcpserver" \
        -k "-t 127.0.0.1:6443 -l :6500 -mode fast2"

        systemd_config "server"
    elif [ -e /usr/config/ss/client ]; then
        server_ip=$(cat /usr/config/ss/server_ip)
        docker run -dt --name ssclient -p 1080:1080 $ss_docker_url -m \
        "ss-local" -s "-s 127.0.0.1 -p 6500 -b 0.0.0.0 -l 1080 -m chacha20 -k $key --fast-open" -x \
        -e "kcpclient" -k "-r $server_ip -l :6500 -mode fast2"

        systemd_config "client"
    else
        echo "Specify ss server or client under /usr/config/ss first"
        exit 0
    fi

}


systemd_config ()
{
    local cs=$1

cat > /etc/systemd/system/ss$cs.service << EOF
[Unit]
Description=start ss $cs
Requires=docker.service
After=docker.service

[Service]
Type=oneshot
ExecStart=$self_path

[Install]
WantedBy=multi-user.target
EOF

    systemctl enable ss$cs
}	# ----------  end of function systemd_config  ----------


ss_not_run ()
{
    local ss_docker_url=$1
    [ -z $(docker container ls | grep $ss_docker_url) ]
}	# ----------  end of function ss_not_run  ----------


ss_need_update ()
{
    local ss_docker_url=$1
    local image_id=$(docker images | grep $ss_docker_url | grep 'none' | awk '{print $3}')
    if [ -n $image_id ]; then
        echo -n $image_id
        return 0
    fi

    return 1
}	# ----------  end of function ss_need_update  ----------


ss_update ()
{
    local image_id=$1
    local container_id=$(docker container ls | grep $image_id | awk '{print $1}')
    if [ -n $container_id ]; then
        echo "Update docker container $container_id"
        docker container rm -f $container_id
        docker rmi -f $image_id
        run_ss
        echo "Update docker container successfully"
    else
        return 1
    fi
}	# ----------  end of function ss_update  ----------


ss_restart ()
{
    if [ -e /usr/config/ss/server ]; then
        docker restart ssserver
    else
        docker restart ssclient
    fi
}	# ----------  end of function ss_restart  ----------


#-------------------------------------------------------------------------------
# main
#-------------------------------------------------------------------------------
echo "Config ss"
docker pull $ss_docker_url

if ss_not_run $ss_docker_url; then
    run_ss
else
    if image_id=ss_need_update $ss_docker_url; then
        ss_update $image_id
    else
        ss_restart
    fi
fi


