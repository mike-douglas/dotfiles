#!/bin/zsh

OS=$(uname)

if [ "${OS}" = "Darwin" ]; then
    if [ ${#$(command -v brew)} != 0 ]; then
        cat ${HOME}/.home/osx/brew | grep ${ROLE} | grep -v \-\- | awk '-F#' '{print $1}' | xargs brew install

        # Install the packages with command line flags on their own
        cat ${HOME}/.home/osx/brew | grep ${ROLE} | grep \-\- | awk '-F#' '{print $1}' | xargs -n1 brew install
    fi

    PREFS_INSTALL="${HOME}/Library/Preferences/"

    for file in ${HOME}/.home/osx/preferences/*; do
        ln -s ${file} ${PREFS_INSTALL}
    done
fi