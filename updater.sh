#!/bin/bash

#checking sudo rights and asking for password if needed
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

#updating apt packages
apt-get update
apt-get upgrade -y

#updating flatpak packages
flatpak update

#updating proton-ge with protonup
~/.local/bin/protonup -y

#updating Steven Black's hosts file
cd /path/to/StevenBlack-hosts
python3 ./updateHostsFile.py --auto --replace --output /etc --flush-dns-cache --skipstatichosts --nogendata --blacklist ./blacklist --whitelist ./whitelist

#finishing up and exiting on enter keypress
echo "Updated and ready to go!"
read && exit
