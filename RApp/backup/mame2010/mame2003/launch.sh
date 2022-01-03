#!/bin/sh
echo $0 $*
progdir=`dirname "$0"`

./cpufreq.sh
cd $RA_DIR/
HOME=/mnt/SDCARD/RetroArch/ $progdir/../../RetroArch/retroarch -v -L $progdir/fb_32b_libretro.so "$1"