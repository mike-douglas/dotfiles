#!/bin/zsh

if [ ! -f ${HOME}/.oh-my-zsh/custom/themes/ohmytheme.zsh-theme ]; then
    mkdir -p ${HOME}/.oh-my-zsh/custom/themes && \
        ln -s ${HOME}/.home/zsh/themes/ohmytheme.zsh-theme \
              ${HOME}/.oh-my-zsh/custom/themes/
fi