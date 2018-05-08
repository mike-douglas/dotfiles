#!/bin/zsh

if [ -d ${HOME}/.oh-my-zsh ]; then
    plugins=(git python osx)
fi

ssh-add ~/.ssh/id_rsa 1>/dev/null 2>&1