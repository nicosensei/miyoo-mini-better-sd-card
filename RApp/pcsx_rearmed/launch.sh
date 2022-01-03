#!/bin/sh
echo $0 $*
progdir=`dirname "$0"`

ROMNAME="$1"
BASEROMNAME=${ROMNAME##*/}
ROMNAMETMP=${BASEROMNAME%.*}

cd $progdir
if [ -f "../../Roms/PSBIOS/${ROMNAMETMP}.bios" ]; then
		cp -f "../../Roms/PSBIOS/${ROMNAMETMP}.bios" "../../RetroArch/.retroarch/system/scph101.bin"
else
		cp -f "../../Roms/PSBIOS/scph1001.bios" "../../RetroArch/.retroarch/system/scph101.bin"
fi
./cpufreq.sh
cd $RA_DIR/
HOME=/mnt/SDCARD/RetroArch/ $progdir/../../RetroArch/retroarch -v -L $progdir/pcsx_rearmed_libretro.so "$1"
#HOME=/mnt/SDCARD/RetroArch/ $progdir/../../RetroArch/retroarch -v -L $progdir/libpcsx.so "$1"
