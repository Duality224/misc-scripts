#!/bin/bash
 
#checking sudo rights
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

#assembles virtual RAID disk if not set up already
if ! test -e /dev/md0; then
sudo losetup -f /path/to/efi1
sudo losetup -f /path/to/efi2
sudo mdadm --build --verbose /dev/md0 --chunk=512 --level=linear --raid-devices=3 /dev/loop0 /dev/nvme1n1p3 /dev/loop1
sleep 1
sudo chown $USER:$USER /dev/md0
fi

#booting up VM with any arguments passed through
sudo qemu-system-x86_64 \
	-drive file=/usr/share/OVMF/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
	-bios /path/to/OVMF.fd \
	-drive file=/dev/md0,media=disk,format=raw,snapshot=off,cache=none \
	-pidfile /tmp/qemu-win.pid \
	-name win \
	-enable-kvm -cpu host -m 8192 \
	-smp 4,sockets=1,cores=4,threads=1 -mem-path /dev/hugepages \
    	-vga qxl -serial mon:stdio \
  	-rtc clock=host,base=localtime \
  	-device qemu-xhci,id=xhci \
    	-device virtio-tablet,wheel-axis=true \
	-soundhw hda \
    	-runas $SUDO_USER \
    	"$@"
