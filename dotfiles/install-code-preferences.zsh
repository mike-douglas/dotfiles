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

    if [ -f ${HOME}/.home/code/projects.${ROLE}.json ]; then
        ln -sf ${HOME}/.home/code/projects.${ROLE}.json ${CODE_INSTALL}/projects.json
    else
        echo "      !!!! No projects.json for role ${ROLE}, skipping"
    fi
fi
