#!/bin/bash

#checking sudo rights
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

sudo rsync -avEs --progress --delete --delete-excluded --mkpath --exclude-from='/home/me/Documents/Scripts/Other/rsync-exclusions' /home/me/ /media/me/External_Backup/Home/
