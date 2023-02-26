Megaman/Rockman 7 MSU-1
Version 1.0
by DarkShock

This hack adds CD quality audio to Megaman 7 and Rockman 7 using the MSU-1 chip invented by byuu. It also works with the English translation of Rockman 7
The hack has been tested on SD2SNES, bsnes-plus 073.1b and higan 094.
The patched ROM needs to be named megaman7_msu1.sfc.

Note that there's no emulator patch because the volume has been normalized to work on both emulators and SD2SNES (using +12 dBFS settings for the MSU-1 volume on Rev. F boards).

The music pack can be found here: https://www.mediafire.com/?x75lh81ua42z27c

Original ROM specs:
MEGAMAN 7
2097152 Bytes (16.0000 Mb)
Interleaved/Swapped: No
Backup unit/emulator header: No
Version: 1.0
Checksum: Ok, 0xf199 (calculated) == 0xf199 (internal)
Inverse checksum: Ok, 0x0e66 (calculated) == 0x0e66 (internal)
Checksum (CRC32): 0x2d947536

ROCKMAN 7
2097152 Bytes (16.0000 Mb)
Interleaved/Swapped: No
Backup unit/emulator header: No
Version: 1.0
Checksum: Ok, 0x44d1 (calculated) == 0x44d1 (internal)
Inverse checksum: Ok, 0xbb2e (calculated) == 0xbb2e (internal)
Checksum (CRC32): 0x31f18dda

===============
= Using BSNES =
===============
1. Patch the ROM
2. Unzip the .pcm
3. Launch the game

===============
= Using higan =
===============
1. Patch the ROM
2. Launch it using higan
3. Go to %USERPROFILE%\Emulation\Super Famicom\megaman7_msu1.sfc in Windows Explorer.
4. Copy manifest.bml and the .pcm file there
5. Run the game

====================
= Using on SD2SNES =
====================
Drop the ROM file, tmnt4_msu1.msu and the .pcm files in any folder. (I really suggest creating a folder)
Launch the game and voilà, enjoy !

The music pack has been edited to be played with the +12 dBFS settings.

===========
= Credits =
===========
* DarkShock - ASM hacking & coding, Music editing
* Krzysztof Slowikowski - Music reorchestration

Many thanks to Krzysztof who gave me in advance the whole soundtrack in WAV format, pretty cool on your part !

=========
= Music =
=========
01 = Opening Part 1 (No Loop)
02 = Title Screen (No Loop)
03 = Intro Stage
04 = Stage Select
05 = Freeze Man
06 = Cloud Man
07 = Junk Man
08 = Turbo Man
09 = Slash Man
10 = Spring Man
11 = Shade Man
12 = Burst Man
13 = Robot Museum Stage
14 = Boss Battle 1
15 = Wily Stage 1
16 = Wily Stage 2
17 = Wily Stage 3
18 = Wily Stage 4
19 = Boss Battle 2
20 = Wily Boss Battle
21 = Mega Man Jingle / Stage Selected Jingle (No Loop)
22 = Bass's Theme
23 = Protoman's Whistle (No Loop)
24 = Dr. Light Lab 1
25 = Dr. Light Lab 2 (Destroyed)
26 = You Get a Weapon
27 = Auto Shop
28 = Boss Defeated Jingle (No Loop)
29 = Dr. Wily Defeated (No Loop)
30 = Password Screen
31 = End Credits
32 = Dr. Wily Castle Jingle (No Loop)
33 = Bad Helmet (No Loop)
34 = Opening Part 2 (No Loop)
35 = Shade Man Alternate (Ghost 'n Goblins)
36 = Shade Man Alternate Stage Selected (No Loop)

=============
= Compiling =
=============
Source is availabe on GitHub: https://github.com/mlarouche/Megaman7-MSU1

To compile the hack you need

* bass v14 (http://files.byuu.org/download/bass_v14.tar.xz)
* wav2msu (https://github.com/mlarouche/wav2msu)

To distribute the hack you need

* uCON64 (http://ucon64.sourceforge.net/)
* 7-Zip (http://www.7-zip.org/)

make.bat assemble the patch
create_pcm.bat create the .pcm from the WAV files
distribute.bat distribute the patch
make_all.bat does everything
