#!/bin/zsh

if [ -d "/Applications/Sublime Text.app" ]; then
    SUBLIME_USER_PACKAGE="${HOME}/Library/Application Support/Sublime Text 3/Packages/User/"

    mkdir -p "${SUBLIME_USER_PACKAGE}"

    for file in ${HOME}/.home/sublime/*; do
        ln -s "${file}" "${SUBLIME_USER_PACKAGE}"
    done
fi