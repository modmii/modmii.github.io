::ModMii v6.6.4 - Download Queue - Thu 05/19/2022 -  backdoor to old cheat code downloader, maybe useful to copy files in acciohacks format
set AdvNumber=0
if /i "%GetAdvNumberOnly%" EQU "Y" goto:endofqueue
::Queue
::Cheatzip gets updated daily, will speed things up
SET AccioHacks=*
SET CheatZip=*
SET CheatCodes=*
::overwritecodes can be on or off
Set overwritecodes=off
::cheatregion can be All USA PAL JPN
Set cheatregion=All
::cheatlocation can be T for txtcodes, C for codes\x\z for acciohacks, or B for Both
Set cheatlocation=B

Set wiicheat=ON
Set WiiWarecheat=ON
Set VCArcadecheat=OFF
Set WiiChannelscheat=ON
Set Gamecubecheat=ON
Set NEScheat=ON
Set SNEScheat=ON
Set N64cheat=ON
Set SMScheat=ON
Set Segacheat=ON
Set NeoGeocheat=ON
Set Commodorecheat=ON
Set MSXcheat=ON
Set TurboGraFX-16cheat=ON
Set TurboGraFX-CDcheat=ON
echo.
echo You've accessed ModMii's old Cheat Code downloader, it's still kinda useful to get cheats in the right format to use with acciohacks
echo.
echo ModMii will report that it's skipping cheat downloads but it is also saving a copy of the cheat to the right folder for AccioHacks
echo.
echo This could take awhile, we'll download most of the codes zipped all at once to speed things up a bit
echo.
pause

:endofqueue
