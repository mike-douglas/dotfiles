#!/bin/zsh

if [ -d ${HOME}/.oh-my-zsh ]; then
    plugins=(git python osx)
fi

ssh-add ~/.ssh/id_rsa 1>/dev/null 2>&1

function qalan_run {
    ssh -A dev1 "ssh -A ${@}"
}

function prodlan_run {
    ssh -A dev1 ssh -A ns2 "ssh -A ${@}"
}

alias ssh="ssh -A"
