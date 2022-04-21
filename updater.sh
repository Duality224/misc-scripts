#!/bin/bash

#checking sudo rights and asking for password if needed
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

#updating apt packages
apt-get update -y
apt-get upgrade -y
apt-get autoclean

#updating flatpak packages
flatpak update -y

#updating fwupdmgr firmware
fwupdmgr refresh
fwupdmgr update

#updating Steven Black's hosts file
cd /path/to/StevenBlack-hosts
python3 ./updateHostsFile.py --auto --replace --output /etc --flush-dns-cache --skipstatichosts --nogendata --blacklist ./blacklist --whitelist ./whitelist

#checking if reboot required and exiting on enter keypress
if [ -f /run/reboot-required ]; then
    echo "System updated. Please reboot."
else   
    echo "No reboot required. Updated and ready to go!"
fi
read && exit
