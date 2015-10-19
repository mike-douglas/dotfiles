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

function scptun {
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

    screen -dmS "${port}_${connection}" ssh -L "${port}:${connection}:22" "${tunnel_host}"
    screen_name=$(screen -list | grep "${port}_${connection}" | awk '{print $1}')
    sleep 3
    scp -o StrictHostKeyChecking=no -P ${port} "${connectas_user}@localhost:${file}" "${3}"
    screen -S "${screen_name}" -p 0 -X stuff "exit$(printf \\r)"
}

alias ssh="ssh -A"