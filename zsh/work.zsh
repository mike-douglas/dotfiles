#!/bin/zsh

if [ -d ${HOME}/.oh-my-zsh ]; then
    plugins=(git python osx)
fi

ssh-add ~/.ssh/id_rsa 1>/dev/null 2>&1

alias restartnetwork="vboxmanage natnetwork stop --netname IMT_VM_NAT && vboxmanage natnetwork start --netname IMT_VM_NAT"