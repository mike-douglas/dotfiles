function _vmlist {
    reply=(${(f)"$(VBoxManage list vms | awk -F'\"' '{print $2}')"})
}

function listvms {
    VBoxManage list vms | awk -F'\"' '{print $2}'
}

function listrunningvms {
    VBoxManage list runningvms | awk -F'\"' '{print $2}'
}

function startvm {
    VBoxManage startvm --type headless ${@}
}

function startvmattached {
    VBoxManage startvm ${@} --type gui
}

function stopvm {
    VBoxManage controlvm ${@} poweroff
}

function pausevm {
    VBoxManage controlvm ${@} pause
}

function resumevm {
    VBoxManage controlvm ${@} resume
}

function vmip {
    VBoxManage guestproperty enumerate ${@} --pattern "/VirtualBox/GuestInfo/Net/*/*/IP"
}

compctl -Q -K _vmlist startvm startvmattached stopvm pausevm resumevm vmip
