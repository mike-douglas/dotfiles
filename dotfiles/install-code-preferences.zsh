#!/bin/zsh

OS=$(uname)

if [ "${OS}" = "Darwin" ]; then
    echo "      CONFIGURING VS CODE"
    echo "      Settings Sync now handles all settings, extensions, and keybinds. Sign in using GitHub to complete this install"
    
    # Set up repeat-on-hold for vim plugin in vscode
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
fi
