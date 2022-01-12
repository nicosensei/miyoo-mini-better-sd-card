#!/bin/sh

#echo $0 $*

DEV_GOVERNOR=/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
RA_DIR=/mnt/SDCARD/RetroArch

if [ "$#" -ge 2 ]; then
    #echo $0 $* expected at least 2 arguments
    exit -1
fi

CORE=$1
ROM=$2

if [ "$#" -eq 3 ]; then
    case "$3" in
        performance)
            echo performance > $DEV_GOVERNOR
            ;;
        *)
            echo ondemand > $DEV_GOVERNOR
    esac
fi


#cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
#cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

cd $RA_DIR/
HOME=$RA_DIR/ $RA_DIR/retroarch -v -L $RA_DIR/.retroarch/cores/"$CORE"_libretro.so "$ROM"

echo ondemand > $DEV_GOVERNOR