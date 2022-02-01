#!/bin/sh

#echo $0 $*

RA_DIR=/mnt/SDCARD/RetroArch

if [ "$#" -lt 2 ]; then
    #echo $0 $* expected at least 2 arguments
    exit -1
fi

CORE=$1
ROM=$2

if [ "$#" -eq 3 ]; then
    ( ./set_cpu_governor.sh $3 )
fi

cd $RA_DIR/
HOME=$RA_DIR/ $RA_DIR/retroarch -v -L $RA_DIR/.retroarch/cores/"$CORE"_libretro.so "$ROM"

( ./set_cpu_governor.sh ondemand )