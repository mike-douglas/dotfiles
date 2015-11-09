#!/bin/zsh

if [ -d ${HOME}/.oh-my-zsh ]; then
    plugins=(git python osx)
fi

ssh-add ~/.ssh/id_rsa 1>/dev/null 2>&1

function qalan_run {
    ssh -A dev1 "ssh -A ${@}"
}

function prodlan_run {
    ssh -A dev1 ssh -A ns2 "ssh -A ${@}"
}

function _forward {
    # Usage: forward TUNNEL_HOST DESTINATION_HOST PORT/SERVICE
    # Forward a random local port > 100000 to the DESTINATION_HOST PORT through TUNNEL_HOST
    local_port=$((10000 + (${RANDOM} % 55535)))

    tunnel_host=${1}
    remote_host=${2}
    remote_port=${3}

    if [[ ! "${remote_port}" =~ '^[0-9]+$' ]]; then
        remote_port=$(egrep "${remote_port}\t" /etc/services | grep tcp | head -n1 | awk '{print $2}' | awk -F'/' '{print $1}')
    fi

    screen -dmS "${local_port}_${remote_host}" ssh -L "${local_port}:${remote_host}:${remote_port}" "${tunnel_host}"
    sleep 2
    screen_name=$(screen -list | grep "${local_port}_${remote_host}" | awk '{print $1}')
    echo "Local port ${local_port} now connects to ${remote_host}:${remote_port} on screen ${screen_name}"

    export LAST_FORWARD_SCREEN=${screen_name}
}

function forward {
    # Usage: forward HOST PORT/SERVICE
    if [[ "${1}" =~ '^\-[\-]?h[(elp)]?' ]]; then
        echo "Usage: forward DESTINATION PORT/SERVICE"
        echo "Forward a port or service to DESTINATION through dev1"
        return 1
    fi
    _forward dev1 ${1} ${2}
}

function scptun {
    if [[ "${1}" =~ '^\-[\-]?h[(elp)]?' ]]; then
        echo "Usage: scptun TUNNEL_HOST SCP_PATH DESTINATION"
        return 1
    fi

    tunnel_host=${1}
    destination=${3}

    split_input=(${(s/:/)2})
    host_user=${split_input[1]}
    file=${split_input[2]}

    split_host_user=(${(s/@/)host_user})
    p1=${split_host_user[1]}
    p2=${split_host_user[2]}
    port=$((1024 + (${RANDOM} % 64535)))

    connection="${p2}"
    connectas_user="${p1}"

    if [ "${p2}" = "" ]; then
        connection="${p1}"
        connectas_user="$(whoami)"
    fi

    _forward ${tunnel_host} ${connection} 22

    # screen -dmS "${port}_${connection}" ssh -L "${port}:${connection}:22" "${tunnel_host}"
    # screen_name=$(screen -list | grep "${port}_${connection}" | awk '{print $1}')
    # sleep 3

    scp -o StrictHostKeyChecking=no -P ${port} "${connectas_user}@localhost:${file}" "${3}"
    screen -S "${LAST_FORWARD_SCREEN}" -p 0 -X stuff "exit$(printf \\r)"
}

alias ssh="ssh -A"