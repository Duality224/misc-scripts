# misc-scripts
A collection of shell scripts I use to automate miscellaneous tasks in Kubuntu.

---

itch-steam.sh - run through Steam to boot the itch client from your Steam library. This script unsets a Steam variable (LD_PRELOAD) that normally prevents this working properly, and also passes up to 9 arguments through to itch.

rpcs3-steam.sh - run through Steam to boot the RPCS3 AppImage from your Steam library. This script unsets a Steam variable (LD_PRELOAD) that normally prevents this working properly, and also passes up to 9 arguments through to RPCS3.

sound-off.sh & sound-on.sh - mute and unmute the system via amixer. These scripts can be added to crontab to do this automatically at specified times if the variable XDG_RUNTIME_DIR=/run/user/1000 is added immediately above each script entry.
