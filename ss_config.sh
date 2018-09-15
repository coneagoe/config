#!/bin/bash -

mirror_prefix="registry.docker-cn.com"
ss_docker_url="mritd/shadowsocks"

if [ -e /usr/config/ss/use_mirror ]; then
    ss_docker_url=$mirror_prefix/$ss_docker_url
fi

docker pull $ss_docker_url

run_ss()
{
    my key=$(cat /usr/config/ss/key)
    if [ -e /usr/config/ss/server ]; then
        docker run -dt --name ssserver -p 6443:6443 -p 6500:6500/udp $ss_docker_url -m \
        "ss-server" -s "-s 0.0.0.0 -p 6443 -m chacha20 -k $key --fast-open" -x -e "kcpserver" -k "-t 127.0.0.1:6443 -l :6500 -mode fast2"
    else
        server_ip=$(cat /usr/config/ss/server_ip)
        docker run -dt --name ssclient -p 1080:1080 $ss_docker_url -m \
        "ss-local" -s "-s 127.0.0.1 -p 6500 -b 0.0.0.0 -l 1080 -m chacha20 -k $key --fast-open" -x \
        -e "kcpclient" -k "-r $server_ip -l :6500 -mode fast2"
    fi
}

if [ -z $(docker container ls | grep $ss_docker_url) ]; then
    run_ss
else
    image_id=$(docker images | grep $ss_docker_url | grep 'none' | awk '{print $3}')
    if [ -n $image_id ]; then
        container_id=$(docker container ls | grep $image_id | awk '{print $1}')
        if [ -n $container_id ]; then
            echo "Update docker container $container_id"
            docker container rm -f $container_id
            docker rmi -f $image_id
            run_ss
        fi
    fi
fi

