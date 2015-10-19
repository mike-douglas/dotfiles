
if [ "$(uname)" = "Darwin" ]; then
    alias docker_terminal="/Applications/Docker/Docker\ Quickstart\ Terminal.app/Contents/Resources/Scripts/start.sh"
fi

# You should only need to do this once! But now you never need to google for it again <3
function docker_vm_map_ports {
    for i in {8080..8100}; do
        echo "Mapping ${i} -> ${i}"
        VBoxManage modifyvm "default" --natpf1 "tcp-port$i,tcp,,$i,,$i";
        VBoxManage modifyvm "default" --natpf1 "udp-port$i,udp,,$i,,$i";
    done
}

# Should only need to run this one too; it enables symlinks in shared folders
# and fixes the "protocol error" when trying to symlink things
function docker_vm_enable_symlinks {
    VBoxManage setextradata default VBoxInternal2/SharedFoldersEnableSymlinksCreate/Users 1
}

function docker_purge_containers {
    docker ps -a | grep Exited | grep ${@} | awk '{print $1}' | xargs docker rm
}