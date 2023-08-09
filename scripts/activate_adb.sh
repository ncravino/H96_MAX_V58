#!/usr/bin/bash

set -e 

if [ -f .env ]; then
    set -o allexport 
    source .env set
    set +o allexport
fi

if [ -z  $1 ]; then 
    echo "Usage: $0 FIRMWARE.img"
    exit -1
fi 

[[ -v RKUNPACK_BIN ]] || (echo "Please define RKUNPACK_BIN" && exit -1)
[[ -v MAGISKBOOT_BIN ]] || (echo "Please define MAGISKBOOT_BIN" && exit -1)
[[ -v RESOURCE_TOOL_BIN ]] || (echo "Please define RESOURCE_TOOL_BIN" && exit -1)

IMG_FILE=$(realpath $1)

mkdir -p workdir && cd workdir

$RKUNPACK_BIN $IMG_FILE

(mkdir -p boot && cd boot && abootimg -x ../Image/boot.img)

(mkdir -p magisk && cd magisk && $MAGISKBOOT_BIN unpack ../Image/boot.img)

(mkdir -p second && cd second && $RESOURCE_TOOL_BIN --image=../magisk/second --unpack)

dtc -I dtb -O dts second/out/rk-kernel.dtb -o second/dts  2> /dev/null

echo "dts is in workdir/second/dts: patching"
patch -b second/dts ../dts.patchfile 

mkdir -p new_second && cp second/out/* new_second/
rm new_second/rk-kernel.dtb

dtc second/dts -o new_second/rk-kernel.dtb 2> /dev/null

$RESOURCE_TOOL_BIN --image=./new_second.img --pack new_second/*

CMDLINE="console=ttyFIQ0 firmware_class.path=/vendor/etc/firmware init=/init rootwait ro loop.max_part=7 androidboot.console=ttyFIQ0 androidboot.wificountrycode=XS androidboot.hardware=rk30board androidboot.boot_devices=fe2e0000.mmc androidboot.selinux=permissive buildvariant=userdebug"

mkbootimg --kernel ./boot/zImage --ramdisk ./boot/initrd.img --second ./new_second.img -o ./new_boot.img --cmdline "$CMDLINE"

echo "New boot image in ./workdir/new_boot.img"
echo "Use: fastboot flash boot ./workdir/new_boot.img to flash to boot" 
echo "Use: adb shell 'cat /proc/device-tree/usbdrd3_0/usb@fc000000/dr_mode' to test it"