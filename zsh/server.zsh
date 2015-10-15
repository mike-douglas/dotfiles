#!/bin/zsh

if [ -d ${HOME}/.oh-my-zsh ]; then
    plugins=(git python)
fi

function docker-deploy {
    docker_compose_file="docker-compose.production.yml"

    if [ "${1}" != "" ]; then
        docker_compose_file="$1"
    fi

    if [ ! -e "${docker_compose_file}" ]; then
        echo "Cannot continue; docker-compose file ${docker_compose_file} does not exist!"
        return
    fi

    if [ ${#$(command -v docker-compose)} != 0 ]; then
        docker-compose -f "${docker_compose_file}" down \
            && echo y | docker-compose -f "${docker_compose_file}" rm \
            && docker-compose -f "${docker_compose_file}" build \
            && docker-compose -f "${docker_compose_file}" up -d
    else
        echo "Cannot continue; you don't have docker-compose installed!"
        return
    fi
}