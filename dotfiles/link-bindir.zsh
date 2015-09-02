#!/bin/zsh

if [ ! -d ${HOME}/.bin ]; then
    ln -sf ${HOME}/.home/bin ${HOME}/.bin
fi
