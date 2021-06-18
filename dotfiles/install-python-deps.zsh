#!/bin/zsh

if [ ${#$(command -v pip3)} != 0 ]; then
    echo "      INSTALLING PYTHON DEPS"
    echo "      ----------------------"

    sudo pip3 install -r ${HOME}/.home/python/requirements.txt
fi