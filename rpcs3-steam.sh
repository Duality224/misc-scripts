#!/bin/bash
#removing Steam variable that prevents RPCS3 boot
unset -v LD_PRELOAD
#booting RPCS3 appimage with up to 3 arguments passed through
/path/to/RPCS3.AppImage $1 $2 $3
