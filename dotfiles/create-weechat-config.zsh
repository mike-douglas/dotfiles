#!/bin/zsh

if [ ${#$(command -v weechat)} != 0 ]; then
    echo "      CONFIGURING WEECHAT"
    echo "      -------------------"

    if [ -f ${HOME}/.weechat ]; then
        echo "      !!!! .weechat already exists; skipping"
        exit
    fi

    echo -n "      Enter your password for freenode: "
    read PASSWORD

    echo -n "      Enter your username for freenode: "
    read USERNAME

    echo -n "      Enter your real name for freenode: "
    read REALNAME

    mkdir -p ${HOME}/.weechat

    ${HOME}/.home/bin/mako \
            -e ${HOME}/.home/templates/weechat.mako \
            PASSWORD=${PASSWORD} USERNAME=${USERNAME} REALNAME=${REALNAME} ROLE=${ROLE} \
            > ${HOME}/.weechat/irc.conf
fi
