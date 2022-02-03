#!/bin/bash
 
#checking sudo rights
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

#disassembles virtual RAID disk
sudo mdadm --stop --scan
sudo losetup --detach-all

#removes temporary pid file
sudo rm /tmp/qemu-win.pid

exit
