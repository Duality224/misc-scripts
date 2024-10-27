#!/bin/bash

#checking sudo rights and asking for password if needed
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

#updating system and packages
rpm-ostree upgrade
#rpm-ostree ex apply-live

#updating flatpak packages
flatpak update -y

#updating rust
sudo -u USERNAME /home/USER/.cargo/bin/rustup update

#updating tldr
sudo -u USERNAME /home/USER/.cargo/bin/tldr --update

#updating starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

#updating yt-dlp
/path/to/yt-dlp -U

#updating specified python packages in python venv
. /home/path/to/python-venv/bin/activate
pip install -U pip podman-compose
deactivate

#updating fwupdmgr firmware
#fwupdmgr refresh
#fwupdmgr update

#updating Steven Black's hosts file
cd /path/to/StevenBlack-hosts || exit
python3 ./updateHostsFile.py --auto --replace --output /etc --flush-dns-cache --skipstatichosts --nogendata --blacklist ./blacklist --whitelist ./whitelist

#checking if reboot required and exiting on any keypress
#if [ -f /run/reboot-required ]; then
#    read -rsn 1 -p "System updated. Please reboot."
#else   
#    read -rsn 1 -p "No reboot required. Updated and ready to go!"
#fi

#update confirmation
read -rsn 1 -p "System successfully updated!"
