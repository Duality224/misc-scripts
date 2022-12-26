#!/bin/bash

#checking sudo rights
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

#checking if backup drive is mounted to /media/me/External_Backup and if not then creating the mount directory and mounting the drive to it
if ! mountpoint -q /media/me/External_Backup ; then
    sudo mkdir -p /media/me/External_Backup
    sudo mount UUID=[Drive UUID] /media/me/External_Backup
fi

#rsyncing home directory to backup drive
sudo rsync -avEs --progress --delete --delete-excluded --mkpath --exclude-from='/home/me/Documents/Scripts/Other/rsync-exclusions' /home/me/ /media/me/External_Backup/Home/

#unmounting backup drive on completion
sudo umount /media/me/External_Backup
sudo rmdir /media/me/External_Backup
