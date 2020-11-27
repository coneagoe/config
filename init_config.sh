#!/bin/bash -
#===============================================================================
#
#          FILE: init_config.sh
#
#         USAGE: ./init_config.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Coneagoe (), coneagoe@gmail.com
#  ORGANIZATION: 
#       CREATED: 10/ 3/2018 10:14:35 AM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

source $(pwd)/common.sh


#-------------------------------------------------------------------------------
# zsh
#-------------------------------------------------------------------------------
./init_zsh.sh

#-------------------------------------------------------------------------------
# z.sh
#-------------------------------------------------------------------------------
./init_z.sh

#-------------------------------------------------------------------------------
# vim
#-------------------------------------------------------------------------------
./vim_config.sh

#-------------------------------------------------------------------------------
# docker
#-------------------------------------------------------------------------------
./install_docker.sh

# ss
./ss_config.sh


#-------------------------------------------------------------------------------
# tmux
#-------------------------------------------------------------------------------
./init_tmux.sh

# powerline
apt -y install python3
pip install powerline-status

# font
#apt -y install fonts-powerline

echo "Install tmux complete"


#-------------------------------------------------------------------------------
# fzf
#-------------------------------------------------------------------------------
echo "Install fzf"

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

echo "Install fzf complete"


#-------------------------------------------------------------------------------
# ag
#-------------------------------------------------------------------------------
echo "Install ag"

apt -y install silversearcher-ag

echo "Install ag complete"


