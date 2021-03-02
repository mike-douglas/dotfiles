#!/bin/zsh

if [ ${#$(command -v git)} != 0 ]; then
    if [ ! -d ${HOME}/.oh-my-zsh ]; then
        echo "-- Cloning ohmyzsh"
        git clone https://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
    else
        echo "** ohmyzsh is already installed; skipping"
    fi
else
    echo "!! git is not found; skipping ohmyzsh clone"
fi

if [ ${#$(command -v pip3)} != 0 ] && [ ${#$(command -v sudo)} != 0 ]; then;
    echo "-- Installing python requirements"
    $(command -v sudo) $(command -v pip3) install --src /tmp -r ${HOME}/.home/python/requirements.txt
else
    echo "!! pip is not found; skipping python package installation"
fi

if [ ${#$(command -v brew)} != 0 ]; then;
    echo "-- Installing homebrew packages"
    cat ${HOME}/.home/brew/packages.txt | xargs -n1 $(command -v brew) install
else
    echo "!! brew is not installed; check brew/packages.txt for packages to install manually"
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
