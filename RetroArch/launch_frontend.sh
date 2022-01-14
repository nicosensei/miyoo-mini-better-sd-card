#!/bin/sh

#echo $0 $*

DEV_GOVERNOR=/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
RA_DIR=/mnt/SDCARD/RetroArch

echo performance > $DEV_GOVERNOR

cd $RA_DIR/
HOME=$RA_DIR/ $RA_DIR/retroarch -v

echo ondemand > $DEV_GOVERNOR