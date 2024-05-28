#!/bin/zsh

if [ ${#$(command -v git)} != 0 ]; then
    if [ ! -d ${HOME}/.oh-my-zsh ]; then
        echo "-- Installing ohmyzsh"
        sh -c "$(curl -fsSL https://install.ohmyz.sh/)"
        rm ~/.zshrc
        ln -s ${HOME}/.home/zsh/zshrc.zsh ${HOME}/.zshrc
    else
        echo "** ohmyzsh is already installed; skipping"
    fi
else
    echo "!! git is not found; skipping ohmyzsh clone"
fi

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
