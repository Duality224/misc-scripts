# misc-scripts
A collection of shell scripts I use to automate miscellaneous tasks in Kubuntu.

---

itch-steam.sh - runs through Steam to boot the itch client from your Steam library. This script unsets a Steam variable (LD_PRELOAD) that normally prevents this working properly, and also passes up to 9 arguments through to itch. The path to the itch executable may need to be changed within the script depending on your system configuration.

rpcs3-steam.sh - runs through Steam to boot the RPCS3 emulator from your Steam library (or to boot individual PS3 games directly by adding the --no-gui flag and the path to the game's EBOOT.BIN file to the Steam target field). This script unsets a Steam variable (LD_PRELOAD) that normally prevents this working properly, and also passes up to 9 arguments through to RPCS3. The path to the RPCS3 appimage needs to be added to the script.

sound-off.sh & sound-on.sh - mutes and unmutes the system via amixer. These scripts can be added to crontab to do this automatically at specified times if the variable XDG_RUNTIME_DIR=/run/user/1000 is added immediately above each script entry.

vm-win-start.sh & vm-win-stop.sh - assembles and disassembles virtual RAID disk for a Windows VM booted from a physical disk, and in the case of the former script also boots the VM itself. VM created in accordance with the steps shown at https://lejenome.tik.tn/post/boot-physical-windows-inside-qemu-guest-machine.

updater.sh - non-interactively updates apt and flatpak packages as well as proton-ge (via protonup) and Steven Black's hosts file.
