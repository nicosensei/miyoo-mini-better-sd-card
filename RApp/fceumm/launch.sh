#!/bin/sh
echo $0 $*
progdir=`dirname "$0"`

cd $RA_DIR/
HOME=/mnt/SDCARD/RetroArch/ $progdir/../../RetroArch/retroarch -v -L $progdir/fceumm_libretro.so "$1"