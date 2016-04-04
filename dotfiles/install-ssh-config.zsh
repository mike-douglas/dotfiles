#!/bin/zsh

mkdir -p ${HOME}/.ssh && chmod 700 ${HOME}/.ssh

echo "      CONFIGURING SSH"
echo "      ---------------"

if [ ${#$(command -v ansible-vault)} != 0 ]; then
    if [ -f ${HOME}/.home/ssh/ssh-config.secure.${ROLE} ]; then
        ansible-vault --ask-vault-pass --output=- \
            decrypt ${HOME}/.home/ssh/ssh-config.secure.${ROLE} \
        | tee -a ${HOME}/.ssh/config \
        && echo "      ---------------" \
        && echo "      Finished adding SSH configuration"
        chmod 644 ${HOME}/.ssh/config
    fi
else
    echo "      !!!! ansible-vault doesn't exist, cannot decrypt config; skipping"
    exit
fi
