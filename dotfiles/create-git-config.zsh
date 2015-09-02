#!/bin/zsh

echo "      CONFIGURING GIT"
echo "      ---------------"

if [ -f ${HOME}/.gitconfig ]; then
    echo "      !!!! .gitconfig already exists; skipping"
    exit
fi

echo -n "      Enter your name: "
read NAME

echo -n "      Enter your e-mail address: "
read EMAIL

${HOME}/.home/bin/mako \
        -e ${HOME}/.home/templates/gitconfig.mako \
        NAME=${NAME} EMAIL=${EMAIL} > ${HOME}/.gitconfig