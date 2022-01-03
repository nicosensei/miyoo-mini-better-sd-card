#!/bin/sh
echo $0 $*
progdir=`dirname "$0"`

./cpufreq.sh
cd $RA_DIR/
HOME=/mnt/SDCARD/RetroArch/ $progdir/../../RetroArch/retroarch -v -L $progdir/mame2003_xtreme_libretro.so "$1"