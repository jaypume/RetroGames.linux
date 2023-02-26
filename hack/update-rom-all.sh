#!/bin/bash

ROOT_PATH=$(git rev-parse --show-toplevel)
source "$ROOT_PATH/hack/config.sh"

lines=(
    "rom/Arcade/1999 - MAME/MAME"
    "rom/Arcade/1996 - CPS3/Capcom - CPS3"
    "rom/Arcade/1993 - CPS2/Capcom - CPS2"
    "rom/Arcade/1988 - CPS1/Capcom - CPS1"
    "rom/Classic/1999 - WS/BANDAI - WS"
    "rom/Classic/1998 - NGP/SNK - NGP"
    "rom/Classic/1994 - PC-FX/NEC - PC-FX"
    "rom/Classic/1993 - 3DO/3DO - 3DO"
    "rom/Classic/1991 - NEOGEO/SNK - NeoGeo"
    "rom/Classic/1989 - LYNX/Atari - Lynx"
    "rom/Classic/1988 - PCE CD/NEC - PCE CD"
    "rom/Classic/1987 - PCE/NEC - PCE"
    "rom/Microsoft/1995 - DOS/Microsoft - DOS"
    "rom/Nintendo/2011 - 3DS/Nintendo - 3DS"
    "rom/Nintendo/2006 - WII/Nintendo - WII"
    "rom/Nintendo/2004 - NDS/Nintendo - NDS"
    "rom/Nintendo/2001 - NGC/Nintendo - NGC"
    "rom/Nintendo/2001 - GBA/Nintendo - GBA ALL"
    "rom/Nintendo/2001 - GBA/Nintendo - GBA"
    "rom/Nintendo/1998 - GBC/Nintendo - GBC"
    "rom/Nintendo/1996 - N64/Nintendo - N64 ALL"
    "rom/Nintendo/1996 - N64/Nintendo - N64"
    "rom/Nintendo/1998 - GBC/Nintendo - GBC ALL"
    "rom/Nintendo/1990 - SFC/Nintendo - SFC ALL"
    "rom/Nintendo/1990 - SFC/Nintendo - SFC"
    "rom/Nintendo/1989 - GB/Nintendo - GB ALL"
    "rom/Nintendo/1983 - FC/Nintendo - FC ALL"
    "rom/Nintendo/1983 - FC/Nintendo - FC"
    "rom/Sega/1986 - MS/Sega - MS"
    "rom/Sega/1988 - MD/Sega - MD"
    "rom/Sega/1990 - GG/Sega - GG"
    "rom/Sega/1994 - 32X/Sega - 32X"
    "rom/Sega/1994 - Saturn/Sega - Saturn"
    "rom/Sega/1998 - Dreamcast/Sega - Dreamcast"
    "rom/Sega/1998 - Naomi/Sega - Naomi"
    "rom/Sony/2004 - PSP/Sony - PSP"
    "rom/Sony/2000 - PS2/Sony - PS2"
    "rom/Sony/1994 - PS1/Sony - PS1"
)

# update emulators/RetroArch/_all_/RetroArch/
copy_rom() {
    target_path=$1
    rm -rf "$ROOT_PATH/$target_path/@ROM"
    mkdir -p "$ROOT_PATH/$target_path/@ROM"
    for elem in "${lines[@]}"; do
        emulator=$(basename "$elem")
        ln -rs "$ROOT_PATH/$elem" "$ROOT_PATH/$target_path/@ROM/$emulator"
    done
}

copy_rom_from_base() {
    platform="$1"
    target_rom_path="$ROOT_PATH/emulators/RetroArch/$platform/RetroArch.Full/@ROM"
    target_thumbnails_path="$ROOT_PATH/emulators/RetroArch/$platform/RetroArch.Full/thumbnails"
    rm -rf "$target_rom_path" && mkdir -p "$target_rom_path"
    rm -rf "$target_thumbnails_path" && mkdir -p "$target_thumbnails_path"
    # "Nintendo - GBA" in @ROM is already symbolic link
    cp -a "$ROOT_PATH/$BASE_RA_PATH/@ROM/"* "$target_rom_path/"
    # "Nintendo - GBA" in thumbnails is not symbolic link, so here add '-p'
    ln -rs "$ROOT_PATH/$BASE_RA_PATH/thumbnails"/* "$target_thumbnails_path/"
}

copy_rom_and_thumbnails_not_relpath() {
    target_path=$1
    rom_path="$ROOT_PATH/$target_path/@ROM"
    thumb_path="$ROOT_PATH/$target_path/thumbnails"
    rm -rf "$rom_path" && mkdir -p "$rom_path"
    rm -rf "$thumb_path" && mkdir -p "$thumb_path"

    # copy rom
    for elem in "${lines[@]}"; do
        emulator=$(basename "$elem")
        cp -a "$ROOT_PATH/$elem" "$rom_path/$emulator"
    done

    # copy thumbnails
    cp -a "$ROOT_PATH/$BASE_RA_PATH/thumbnails"/* "$thumb_path/"

    # fix symbolink by annex
    git add "$ROOT_PATH/$target_path"
    git annex fix "$ROOT_PATH/$target_path"
}

copy_rom "$BASE_RA_PATH"
copy_rom_from_base "Android"
copy_rom_from_base "Apple IOS"
copy_rom_from_base "Sony PSV"
copy_rom_from_base "Windows"

# for switch, it is special, because we should rename them to pinyin later.
copy_rom_and_thumbnails_not_relpath "emulators/RetroArch/Nintendo Switch/RetroArch.Full"
