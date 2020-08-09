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
installer=$(get_installer)
if ! is_installed zsh; then
  $installer install -y zsh
fi

if ! is_installed git; then
  $installer install -y git
fi

if ! is_installed curl; then
  $installer install -y curl
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &


#-------------------------------------------------------------------------------
# vim
#-------------------------------------------------------------------------------
./vim_config.sh


#-------------------------------------------------------------------------------
# docker
#-------------------------------------------------------------------------------
echo "Install docker"

apt -y install docker.io
systemctl start docker
systemctl enable docker

# ss
./ss_config.sh

apt -y install at
echo "reboot" | at midnight

echo "Install docker complete"


#-------------------------------------------------------------------------------
# tmux
#-------------------------------------------------------------------------------
echo "Install tmux"

apt -y install tmux

# oh my tmux
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

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


