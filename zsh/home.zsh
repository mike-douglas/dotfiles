#!/bin/zsh

export VIRTUALENVWRAPPER_PYTHON=$(which python3)

if [ -d ${HOME}/.oh-my-zsh ]; then
    plugins=(git python osx)
fi
