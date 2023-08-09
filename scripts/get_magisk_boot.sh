#!/usr/bin/bash

set -e 

if [ -z  $1 ]; then 
    echo "Usage: $0 MAGISK.APK"
    exit -1
fi 

(mkdir -p magisk && unzip $1 -d magisk/)

(mkdir -p magisk/linux && mv magisk/lib/$(arch)/libmagiskboot.so magisk/linux/magiskboot && chmod 755 magisk/linux/magiskboot)
