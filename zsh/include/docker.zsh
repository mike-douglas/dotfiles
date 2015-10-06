
# You should only need to do this once! But now you never need to google for it again <3
function docker_vm_map_ports {
    for i in {8000..9999}; do
        echo "Mapping ${i} -> ${i}"
        VBoxManage modifyvm "default" --natpf1 "tcp-port$i,tcp,,$i,,$i";
        VBoxManage modifyvm "default" --natpf1 "udp-port$i,udp,,$i,,$i";
    done
}
