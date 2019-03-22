#!/bin/bash -
#===============================================================================
#
#          FILE: vim_config.sh
#
#         USAGE: ./vim_config.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Coneagoe (), coneagoe@gmail.com
#  ORGANIZATION: 
#       CREATED: 10/ 3/2018  6:29:58 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

apt -y install vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf vim_config_plug ~/.vimrc
vim +PlugInstall +qa
