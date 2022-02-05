# miyoo-mini-better-sd-card
An enhanced Miyoo Mini SD card package, translated, cleaned up, debloated.

## Features

- fully working RetroArch app, you can load roms and cores directly from the RetroArch menu if you want to
- only includes cores that have been tested to work
- cores and systems are properly configured (aspect ratios, video filters)
- proper key mapping for RetroArch hotkeys
- only standalone emulators are included in the _Games_ section
- the _RetroArch_ section contains links for every supported system
- _Apps_ are translated to english (_Commander_, _SDL PAL_)
- preconfigured path and emulators for every supported system
- a subset of the _libretro_ cheat database for every supported system

## How to install

- You should first update your Miyoo Mini firmware to the latest update. Updates can be downloaded from https://lemiyoo.cn/upgrade/, and a guide on the flashing procedure is found on https://media.discordapp.net/attachments/891336865540620338/931055123654905898/Miyoo_Upgrade.png. As of writing the latest update is 20220108 (January 8th 2022). It may work on other firmware version but I haven't tested it.


### Starting from scratch

On a freshly FAT32 formatted SD card, copy the contents of the release package to the root

### Updating from stock SD card

- on your SD card, backup the following folders: `App`, `Emu`,  `RApp` and `RetroArch` (located at the root)

- specifically, your _saved states_ are found in `RetroArch/.retroarch/states` and your _saved games_ are found in `RetroArch/.retroarch/saves`

- then completely wipe `App`, `Emu`,  `RApp` and `RetroArch` from the root of the SD card

- copy the contents of the release package to the root

### Updating from a previous version

- wipe `App`, `Emu`,  `RApp` and `RetroArch` from the root of the SD card
- copy the contents of the release package to the root


For obvious legal reasons, neither bios files nor roms or box art are provided in the release package, you should copy them yourself.


## Adding BIOS files

Bios files should be copied to the `roms/bios` folder on the SD card. Create it if it does not exist.

## Adding ROMs

Roms should be copied to the `roms` folder on the SD card. Create it if it does not exist.

The shortcuts in the `RetroArch` folder are configured with the following paths (you need to edit `config.json` files if you'd like to change them):

- Arcade - CPS1: `/roms/cps1`
- Arcade - CPS2: `/roms/cps2`
- Arcade - CPS3: `/roms/cps3`
- Arcade - Fina Burn Neo: `/roms/fbneo`
- Arcade - Neo-Geo: `/roms/neogeo`
- Nintendo - GameBoy: `/roms/gb`
- Nintendo - GameBoy Color: `/roms/gbc`
- Nintendo - GameBoy Advance: `/roms/gba`
- Nintendo - NES: `/roms/nes`
- Nintendo - Super Nintendo: `/roms/snes`
- Sega - Game Gear: `/roms/gamegear`
- Sega - Master System: `/roms/mastersystem`
- Sega - Megadrive: `/roms/megadrive`
- Sega - Sega CD: `/roms/segacd`
- NEC - PC Engine: `/roms/pcengine`
- RPG Make 2000/2003: `/roms/easyrpg` (unzipped)

## Ports

Some game ports are supported by RetroArch cores. The data files should be copied to the following folders:

- Doom: `/roms/doom`
- Quake: `/roms/quake`

## Default cores

The following cores are used by default:

- Arcade - CPS1: `fbalpha2012_cps1`
- Arcade - CPS2: `fbalpha2012_cps2`
- Arcade - Fina Burn Neo: `fbalpha2012`
- Arcade - Neo-Geo: `fbalpha2012_neogeo`
- Nintendo - GameBoy: `gambatte`
- Nintendo - GameBoy Color: `gambatte`
- Nintendo - GameBoy Advance: `mgba`
- Nintendo - NES: `nestopia`
- Nintendo - Super Nintendo: `snes9x2005-plus` and `mednafen_supafaust` can be chosen 
- Sega - Game Gear: `genesis_plus_gx`
- Sega - Master System: `genesis_plus_gx`
- Sega - Megadrive: `genesis_plus_gx`
- Sega - Sega CD: `genesis_plus_gx`
- NEC - PC Engine: `mednafen_pce_fast`
- RPG Maker 2000/2003: `easyrpg`

Some alternative cores are available in `RApp/backup`, if you want to try them. Simply move the relevant folder up one level. 

All cores can also be loaded directly from the RetroArch frontend (_App/RetroArch_).

## Adding box art

Box art should be copied to the `boxart` folder on the SD card. Create it if it does not exist.

Given the small size of the screen, 2D box art works the best. In any case, images should be `png` format and have a maximum width of 256 pixels.

The shortcuts in the `RetroArch` folder are configured with the following paths (you need to edit `config.json` files if you'd like to change them):

- Arcade - CPS1: `/boxart/cps1`
- Arcade - CPS2: `/boxart/cps2`
- Arcade - CPS3: `/boxart/cps2`
- Arcade - Final Burn Neo: `/boxart/fbneo`
- Arcade - Neo-Geo: `/boxart/neogeo`
- Nintendo - GameBoy: `/boxart/gb`
- Nintendo - GameBoy Color: `/boxart/gbc`
- Nintendo - GameBoy Advance: `/boxart/gba`
- Nintendo - NES: `/boxart/nes`
- Nintendo - Super Nintendo: `/boxart/snes`
- Sega - Game Gear: `/boxart/gamegear`
- Sega - Master System: `/boxart/mastersystem`
- Sega - Megadrive: `/boxart/megadrive`
- Sega - Sega CD: `/boxart/segacd`
- NEC - PC Engine: `/boxart/pcengine`
- RPG Maker 2000/2003: `/boxart/easyrpg` (unzipped)

If you have subfolders in your ROM folders (for instance, I like to have subfolders per genre), the images should all be at the root of the boxart folder.

## RetroArch hotkeys

For all RetroArch cores, the following hotkeys are preconfigured (you can change them in the RetroArch setting though, if you want another setup):

_NB_ `HK` refers to the function button (small round button just below the screen)

- Open or close RetroArch menu: `HK + X`
- Save state to the current slot: `HK + R1`
- Load state from the current slot: `HK + L1`
- Increment save slot: `HK + dpad right`
- Decrement save slot: `HK + dpad left`
- Toggle fast-forward: `HK + R2`
- Rewind: `HK + L2`
- Exit RetroArch: `HK + select`

Note that pressing `F` does not bring up the menu anymore, as it is used as the _hotkey enable_ button.

## Included resources

The following free and open-source resources are included with the package:

- `roms/bios/ecwolf.pk3`: needed to run ECWolf
- `roms/bios/prboom.wad`: needed to run PrBoom
- `roms/cavestory`: Cave Story data
- `roms/cannonball`: CannonBall data
- `roms/dinothawr`: Dinothawr data

## Credits

Credit goes to the authors of the original software and resources:

- Libretro / RetroArch developers for the source of RetroArch, cores, assets and cheats (https://github.com/libretro)
- Miyoo for the RetroArch build (https://lemiyoo.cn/)
- OnionOS for themes and the Supafaust core (https://github.com/jimgraygit/Onion)
- Lucario icons (https://github.com/DogWav3/Lucario_libretro_Miyoo_icons)
