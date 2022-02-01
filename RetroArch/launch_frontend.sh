#!/bin/sh

#echo $0 $*

( ./set_cpu_governor.sh performance )

RA_DIR=/mnt/SDCARD/RetroArch
cd $RA_DIR/
HOME=$RA_DIR/ $RA_DIR/retroarch -v

( ./set_cpu_governor.sh ondemand )