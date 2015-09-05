#!/bin/zsh

OS=$(uname)

if [ "${OS}" = "Darwin" ]; then
    if [ ${#$(command -v brew)} != 0 ]; then
        cat ${HOME}/.home/osx/brew | xargs brew install
    fi

    PREFS_INSTALL="${HOME}/Library/Preferences/"

    for file in ${HOME}/.home/osx/preferences/*; do
        ln -s ${file} ${PREFS_INSTALL}
    done
fi