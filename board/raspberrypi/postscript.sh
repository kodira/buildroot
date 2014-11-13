#!/bin/sh

TARGET="${1}"

# copy System.map
cp ${TARGET}/../build/linux-*/System.map ${TARGET}/System.map

# copy kernel
cp ${TARGET}/../images/zImage ${TARGET}/../images/rpi-firmware/kernel.img

# set timezone
#ln -s ${TARGET}/usr/share/zoneinfo/Europe/Berlin ../../../../etc/localtime
# Creating relative links seems to be difficult here
cp ${TARGET}/usr/share/zoneinfo/Europe/Berlin ${TARGET}/etc/localtime

# copy config
cp board/raspberrypi/config.txt output/images/rpi-firmware
cp board/raspberrypi/cmdline.txt output/images/rpi-firmware

exit 0

