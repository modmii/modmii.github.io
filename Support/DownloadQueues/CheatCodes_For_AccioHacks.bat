@echo off
setlocal enabledelayedexpansion

:: ModMii v6.6.4 - Download Queue - Updated for current date
:: Backdoor to old cheat code downloader, useful for copying files in AccioHacks format

set "AdvNumber=0"
set "CurrentDate=%date%"

if /i "%GetAdvNumberOnly%" EQU "Y" goto :endofqueue

echo.
echo You've accessed ModMii's old Cheat Code downloader.
echo It's still useful for getting cheats in the right format for AccioHacks.
echo.
echo ModMii will report skipping cheat downloads, but it's also saving a copy
echo of the cheat to the correct folder for AccioHacks.
echo.
echo This could take a while. We'll download most codes zipped to speed things up.
echo.
pause

:: Queue settings
set "AccioHacks=*"
set "CheatZip=*"
set "CheatCodes=*"
set "overwritecodes=off"
set "cheatregion=All"
set "cheatlocation=B"

:: Cheat types
set "cheattypes=Wii WiiWare VCArcade WiiChannels Gamecube NES SNES N64 SMS Sega NeoGeo Commodore MSX TurboGraFX-16 TurboGraFX-CD"

:: Enable/disable cheat types
for %%c in (%cheattypes%) do (
    if /i "%%c" NEQ "VCArcade" (
        set "%%ccheat=ON"
    ) else (
        set "%%ccheat=OFF"
    )
)

:: Main download logic would go here
:: ...

:endofqueue
echo Download queue completed.
pause
