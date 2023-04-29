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

#updating specified python packages
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
pip install --upgrade konsave sgt-launcher youtube_dl

#updating Rust
sudo -u USERNAME /home/USER/.cargo/bin/rustup update

#updating tldr
sudo -u USERNAME /home/USER/.cargo/bin/tldr --update

#updating linux-purge
sudo update-linux-purge

#updating fwupdmgr firmware
fwupdmgr refresh
fwupdmgr update

#updating Steven Black's hosts file
cd /path/to/StevenBlack-hosts
python3 ./updateHostsFile.py --auto --replace --output /etc --flush-dns-cache --skipstatichosts --nogendata --blacklist ./blacklist --whitelist ./whitelist

#checking if reboot required and exiting on any keypress
if [ -f /run/reboot-required ]; then
    read -rsn 1 -p "System updated. Please reboot."
else   
    read -rsn 1 -p "No reboot required. Updated and ready to go!"
fi
