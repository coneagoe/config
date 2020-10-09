#!/bin/bash -
#===============================================================================
#
#          FILE: init_tmux.sh
#
#         USAGE: ./init_tmux.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Wu Xufeng (), Xufeng.Wu@nokia-sbell.com
#  ORGANIZATION: 
#       CREATED: 10/09/2020 01:46:30 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

source common.sh

if ! is_installed tmux; then
    $(get_installer) install -y tmux
fi

rm -rf $HOME/.tmux
git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
cd $HOME
ln -sf .tmux/.tmux.conf
cd -
cp .tmux.conf.local $HOME
