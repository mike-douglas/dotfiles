#!/bin/zsh

if [ -x $(command -v git) ]; then
    if [ ! -d ${HOME}/.oh-my-zsh ]; then
        echo "-- Cloning ohmyzsh"
        git clone https://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
    else
        echo "** ohmyzsh is already installed; skipping"
    fi
else
    echo "!! git is not found; skipping ohmyzsh clone"
fi

if [ -x "$(command -v pip)" ] && [ -x "$(command -v sudo)" ]; then;
    echo "-- Installing python requirements"
    $(command -v sudo) $(command -v pip) install -r ${HOME}/.home/python/requirements.txt
else
    echo "!! pip is not found; skipping python package installation"
fi

echo "-- Linking common.zsh"
rm ${HOME}/.zshrc
ln -s ${HOME}/.home/zsh/common.zsh ${HOME}/.zshrc

echo "-- Linking remaining dotfiles"
for file in ${HOME}/.home/dotfiles/* ; do
    if [ -x "${file}" ]; then
        echo "   -- Executing $(basename ${file})"
        ${file}
    else
        echo "   -- Linking $(basename ${file})"
        ln -sf ${file} ${HOME}/.$(basename ${file})
    fi
done