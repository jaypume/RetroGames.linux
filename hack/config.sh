

# This is the source root /path/to/RetroGames/
BASE_RA_PATH="emulators/RetroArch/_base_/RetroArch"
BASE_NS_PATH="emulators/RetroArch/Nintendo Switch/RetroArch.Full"


# Android: should replace XXXX-XXXX to your real SD card ID
# Windows: should replace '/' to '\\' global, the script `update-playlists.sh` will do this.
# Switch: not supports Chinese filename, for making sure it works right,
# we need to `bash hack/update-switch-rom`
# should not have space after ',', this will cause some error
platforms=(
    # platform, default_path_prefix
    # 'Android,/storage/XXXX-XXXX/RetroArch/@ROM'
    # 'Apple IOS,~/Documents/RetroArch/@ROM'
    # 'Nintendo Switch,/retroarch/@ROM'
    # 'Sony PSV,ux0:/data/retroarch/@ROM'
    'Windows,E:/RetroArch/@ROM'
)

emulators=(
    '3DO - 3DO'
    'Atari - Lynx'
    'BANDAI - WS'
    'Capcom - CPS1'
    'Capcom - CPS2'
    'Capcom - CPS3'
    'MAME'
    'Microsoft - DOS'
    'NEC - PC-FX'
    'NEC - PCE'
    'NEC - PCE CD'
    'Nintendo - 3DS'
    'Nintendo - FC'
    'Nintendo - FC ALL'
    'Nintendo - GB ALL'
    'Nintendo - GBA'
    'Nintendo - GBA ALL'
    'Nintendo - GBC'
    'Nintendo - GBC ALL'
    'Nintendo - N64'
    'Nintendo - N64 ALL'
    'Nintendo - NDS'
    'Nintendo - NGC'
    'Nintendo - SFC'
    'Nintendo - SFC ALL'
    'Nintendo - WII'
    'Sega - 32X'
    'Sega - Dreamcast'
    'Sega - GG'
    'Sega - MD'
    'Sega - MS'
    'Sega - Naomi'
    'Sega - Saturn'
    'SNK - NeoGeo'
    'SNK - NGP'
    'Sony - PS1'
    'Sony - PS2'
    'Sony - PSP'
)
