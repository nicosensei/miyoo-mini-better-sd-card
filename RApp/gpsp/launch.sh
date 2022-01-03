#!/bin/sh
echo $0 $*
progdir=`dirname "$0"`

./cpufreq.sh
cd $RA_DIR/
HOME=/mnt/SDCARD/RetroArch/ $progdir/../../RetroArch/retroarch -v -L $progdir/gpsp_libretro.so "$1"