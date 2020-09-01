#!/bin/bash -

mirror_prefix="registry.docker-cn.com"
ss_docker_url="mritd/shadowsocks"
ss_config_path=/usr/config/ss

if [ -e /usr/config/ss/use_mirror ]; then
    ss_docker_url=$mirror_prefix/$ss_docker_url
fi

self_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )/$(basename $0)"


older_docker ()
{
    [ $(docker -v | awk '{print $3}' | awk -F "." '{print $1}') < 14 ]
}	# ----------  end of function older_docker  ----------


run_ss()
{
    echo "Which ss do you want to create, server[s] or client[c]?"
    select sc in 's' 'c'
    do
        case sc in
            's')
                ss_type='server'
                break
                ;;
            'c')
                ss_type='client'
                break
                ;;
            *)
                echo "Which ss do you want to create, server[s] or client[c]?"
                ;;
        esac
    done

    read -p "Please input a key of encryption:" key
    mkdir -p $ss_config_path
    echo -n $key > $ss_config_path/key

    if [ $ss_type == 'server' ]; then
        docker run -dt --name ssserver -p 6443:6443 -p 6500:6500/udp $ss_docker_url -m \
        "ss-server" -s "-s 0.0.0.0 -p 6443 -m chacha20 -k $key --fast-open" -x -e "kcpserver" \
        -k "-t 127.0.0.1:6443 -l :6500 -mode fast2"

        systemd_config "server"

        restart_ss_config

        schedule_config
    else
        read -p "What's the server ip?" server_ip
        echo -n $server_ip > $ss_config_path/server_ip

        docker run -dt --name ssclient -p 1080:1080 $ss_docker_url -m \
        "ss-local" -s "-s 127.0.0.1 -p 6500 -b 0.0.0.0 -l 1080 -m chacha20 -k $key --fast-open" -x \
        -e "kcpclient" -k "-r $server_ip -l :6500 -mode fast2"

        systemd_config "client"
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


restart_ss_config ()
{
    mkdir /tools

    cat > /tools/ssserver.sh << EOF
#!/usr/bin/sh

docker restart ssserver
EOF

    chmod +x /tools/ssserver.sh
}	# ----------  end of function restart_ss_config  ----------


schedule_config ()
{
    if ! is_installed at; then  
        installer=$(get_installer)
        $installer install -y at
    fi

    echo "shutdown" | at midnight
}	# ----------  end of function schedule_config  ----------


ss_not_run ()
{
    local ss_docker_url=$1
    if older_docker; then
        [ -z $(docker ps | grep $ss_docker_url) ]
    else
        [ -z $(docker container ls | grep $ss_docker_url) ]
    fi
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
    local containers=""
    if older_docker; then
        containers=$(docker ps)
    else
        containers=$(docker container ls)
    fi
    local container_id=$(echo $containers | grep $image_id | awk '{print $1}')

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


