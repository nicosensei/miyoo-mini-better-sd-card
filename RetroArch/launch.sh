#!/bin/sh
echo $0 $*
RA_DIR=/mnt/SDCARD/RetroArch

CORE=$1
ROM=$2
CPU_MODE=$3

cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor >> /mnt/SDCARD/.governor

#echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
#cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

cd $RA_DIR/
HOME=$RA_DIR/ $RA_DIR/retroarch -v -L $RA_DIR/.retroarch/cores/"$CORE"_libretro.so "$ROM"