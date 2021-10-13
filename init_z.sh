#!/bin/bash -
#===============================================================================
#
#          FILE: init_z.sh
#
#         USAGE: ./init_z.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Wu Xufeng (), Xufeng.Wu@nokia-sbell.com
#  ORGANIZATION: 
#       CREATED: 11/27/2020 02:28:28 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

source $(pwd)/common.sh

#if [ ! -e z ]; then
#    git clone https://github.com/rupa/z.git
#    echo "source $(pwd)/z/z.sh" >> $HOME/.zshrc_local
#fi

git clone https://github.com/skywind3000/z.lua.git
z_path=$(pwd)/z.lua/z.lua
echo 'eval "$(lua '$z_path' --init zsh enhanced once fzf)"' >> $HOME/.zshrc_local
