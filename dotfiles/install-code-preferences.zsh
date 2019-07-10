#!/bin/zsh

OS=$(uname)

if [ "${OS}" = "Darwin" ]; then
    echo "      CONFIGURING VS CODE"

    if [ ${#$(command -v code)} != 0 ]; then
        # Install packages
        cat ${HOME}/.home/code/extensions.list | xargs -n1 code --install-extension
    fi

    CODE_INSTALL="${HOME}/Library/Application Support/Code/User/"

    for file in ${HOME}/.home/code/user/*.json; do
        ln -fs ${file} ${CODE_INSTALL}
    done

    # Set up repeat-on-hold for vim plugin in vscode
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
fi
