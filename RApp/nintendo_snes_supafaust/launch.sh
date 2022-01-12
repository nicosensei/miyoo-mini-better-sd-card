#!/bin/sh
/mnt/SDCARD/RetroArch/launch.sh 

./cpufreq.sh
cd $RA_DIR/
HOME=$RA_DIR/ $RA_DIR/retroarch -v -L $RA_DIR/.retroarch/cores/mednafen_supafaust_libretro.so "$1"