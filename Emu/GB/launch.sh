#!/bin/sh
echo $0 $*
progdir=`dirname "$0"`
homedir=`dirname "$1"`
cd $progdir

./cpufreq.sh
tinymix set 6 100
HOME=$homedir $progdir/gambatte "$1"
tinymix set 6 110
