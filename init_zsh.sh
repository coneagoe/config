#!/bin/bash -
#===============================================================================
#
#          FILE: init_zsh.sh
#
#         USAGE: ./init_zsh.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2020/10/ 9  9:32:13
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

source $(pwd)/common.sh

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

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm -rf $HOME/.zshrc
ln -sf $(pwd)/.zshrc $HOME/.zshrc
