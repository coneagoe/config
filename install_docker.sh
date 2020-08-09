#!/bin/bash -
#===============================================================================
#
#          FILE: install_docker.sh
#
#         USAGE: ./install_docker.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 08/09/2020 09:23:08 AM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

yum install -y yum-utils

yum-config-manager \
  --add-repo \
  https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io && \ 
  systemctl start docker && \
  docker run hello-world


