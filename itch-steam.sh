#!/bin/bash
#removing Steam variable that prevents itch boot
unset -v LD_PRELOAD
#booting itch with up to 9 arguments passed through
/usr/local/bin/itch $1 $2 $3 $4 $5 $6 $7 $8 $9
