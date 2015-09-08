#!/bin/zsh

if [ ! -d ${HOME}/.local/share/marker ]; then
    $(command -v git) clone https://github.com/pindexis/marker ${HOME}/.marker
    cd ${HOME}/.marker \
        && ./install.py \
        && ln -sf ${HOME}/.home/marker/marks.txt ${HOME}/.local/share/marker/marks.txt
fi