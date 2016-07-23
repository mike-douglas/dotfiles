#!/bin/zsh

if [ -d "/Applications/Sublime Text.app" ]; then
    PACKAGE_CONTROL="https://sublime.wbond.net/Package Control.sublime-package"
    SUBLIME="${HOME}/Library/Application Support/Sublime Text 3/"
    SUBLIME_INSTALLED_PACKAGES="${SUBLIME}/Installed Packages/"
    SUBLIME_USER_PACKAGE="${SUBLIME}/Packages/User/"

    mkdir -p "${SUBLIME_INSTALLED_PACKAGES}"
    mkdir -p "${SUBLIME_USER_PACKAGE}"

    echo "-- Installing Package Control" && \
        curl "${PACKAGE_CONTROL}" > "${SUBLIME_INSTALLED_PACKAGES}/Package Control.sublime-package"

    for file in ${HOME}/.home/sublime/*; do
        cp "${file}" "${SUBLIME_USER_PACKAGE}"
    done
fi
