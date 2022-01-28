#!/bin/bash
#removing Steam variable that prevents RPCS3 boot
unset -v LD_PRELOAD
#booting RPCS3 appimage with up to 9 arguments passed through
/path/to/RPCS3.AppImage $1 $2 $3 $4 $5 $6 $7 $8 $9
