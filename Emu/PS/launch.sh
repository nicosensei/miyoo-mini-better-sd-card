#!/bin/sh
echo $0 $*
progdir=`dirname "$0"`
homedir=`dirname "$1"`
ROMNAME="$1"
BASEROMNAME=${ROMNAME##*/}
ROMNAMETMP=${BASEROMNAME%.*}

cd $progdir
if [ -f "../../Roms/PSBIOS/${ROMNAMETMP}.bios" ]; then
		cp -f "../../Roms/PSBIOS/${ROMNAMETMP}.bios" "${progdir}/bios/scph1001.bin"
else
		cp -f "../../Roms/PSBIOS/scph1001.bios" "${progdir}/bios/scph1001.bin"
fi

./cpufreq.sh

HOME=$homedir $progdir/pcsx -cdfile "$1"

#HOME=$homedir $progdir/ra32.ss -L $progdir/libpcsx.so "$1"
￥￥