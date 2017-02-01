#!/bin/zsh

OS=$(uname)

if [ "${OS}" = "Darwin" ]; then
    if [ ${#$(command -v apm)} != 0 ]; then
        # Install packages
        cat ${HOME}/.home/atom/packages.list | xargs -n1 apm install
    fi

    ATOM_INSTALL="${HOME}/.atom/"

    for file in ${HOME}/.home/atom/*.{cson,less}; do
        ln -fs ${file} ${ATOM_INSTALL}
    done
fi
