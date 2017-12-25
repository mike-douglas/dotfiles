#!/bin/zsh

mkdir -p ${HOME}/.tmp/vim_backup ${HOME}/.tmp/vim_swap

if [ ${#$(command -v vim)} != 0]; then
    mkdir -p ${HOME}/.vim/pack/minpac/opt/minpac
    git clone git@github.com:k-takata/minpac.git ${HOME}/.vim/pack/minpac/opt/minpac
fi