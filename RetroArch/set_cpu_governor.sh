#!/bin/sh

#echo $0 $*

DEV_GOVERNOR=/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

if [ "$#" -ne 1 ]; then
    #echo $0 $* expected at least 1 arguments
    exit -1
fi

case "$1" in
    performance)
        echo performance > $DEV_GOVERNOR
        ;;
    *)
        echo ondemand > $DEV_GOVERNOR
esac

cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor