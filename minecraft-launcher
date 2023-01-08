#!/bin/bash

#setting $version to the instance directory with the latest Minecraft version (sorted alphabetically) in the PrismLauncher instances folder
latestpath=$(ls -d /HOME/DIRECTORY/.var/app/org.prismlauncher.PrismLauncher/data/PrismLauncher/instances/*/ | tail -n 1)
version=$(echo $latestpath | sed 's,/HOME/DIRECTORY/.var/app/org.prismlauncher.PrismLauncher/data/PrismLauncher/instances/,,g; s,/,,g')

#booting $version instance with PrismLauncher
flatpak run org.prismlauncher.PrismLauncher -l $version -a USERNAME
