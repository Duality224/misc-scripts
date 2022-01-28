#!/bin/bash
#removing Steam variable that prevents itch boot
unset -v LD_PRELOAD
#booting itch with up to 3 arguments passed through
/usr/local/bin/itch $1 $2 $3
