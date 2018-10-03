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


#-------------------------------------------------------------------------------
# zsh
#-------------------------------------------------------------------------------
echo "Install zsh"

apt -y install zsh git curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrusselv
oh-my-zsh/master/tools/install.sh)"

echo "Install zsh complete"


#-------------------------------------------------------------------------------
# vim
#-------------------------------------------------------------------------------
echo "Install vim"

apt -y install vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf vim_config_plug ~/.vimrc
vim +PlugInstall +qa

echo "Install vim complete"


#-------------------------------------------------------------------------------
# docker
#-------------------------------------------------------------------------------
echo "Install docker"

apt -y install docker.io
systemctl start docker
systemctl enable docker

# ss
ss_config.sh

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


