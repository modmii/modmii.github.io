@echo off
setlocal

set ModMiipath=%cd%
set cygwin=nodosfilewarning

set currentversion=4.6.1
set agreedversion=
if exist settings.bat call settings.bat


set UPDATENAME=NUSAutoUpdate
if exist Updatetemp.bat attrib -h Updatetemp.bat
if exist Updatetemp.bat del updatetemp.bat>nul


if "%ModMiiInstallerpath%"=="" goto:notfreshinstall
if "%UPDATENAME%"=="" goto:notfreshinstall
if exist "%ModMiiInstallerpath%"\Updatetemp.bat attrib -h "%ModMiiInstallerpath%"\Updatetemp.bat
if exist "%ModMiiInstallerpath%"\Updatetemp.bat del "%ModMiiInstallerpath%"\Updatetemp.bat>nul
if exist "%ModMiiInstallerpath%"\%UPDATENAME%.bat attrib -h "%ModMiiInstallerpath%"\%UPDATENAME%.bat
if exist "%ModMiiInstallerpath%"\%UPDATENAME%.bat del "%ModMiiInstallerpath%"\%UPDATENAME%.bat>nul
:notfreshinstall

title=ModMii
mode con cols=85 lines=54
color 1f

::SET FILENAME=%~nx0 //this returns the name of the batch file running (doesn't work when packaged in an exe)
::SET PATHNAME=%0 //this returns the filename but also with absolute path


if exist skipscam.txt goto:DefaultSettings
if exist ipromisetodonate.txt goto:DefaultSettings

set warning=
echo                                        ModMii
echo                                       by XFlak
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] THIS SOFTWARE IS NOT FOR SALE.
echo.

if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 3 -w 1000> nul

echo          IF YOU PAID FOR THIS SOFTWARE OR RECEIVED IT AS PART OF A "BUNDLE"
echo       YOU HAVE BEEN SCAMMED AND YOU SHOULD DEMAND YOUR MONEY BACK IMMEDIATELY
echo.
echo.
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 5 -w 1000> nul
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] USE THIS AT YOUR OWN RISK!
echo.
echo       THIS PACKAGE COMES WITH ABSOLUTELY NO WARRANTY, NEITHER STATED NOR IMPLIED.
echo       NO ONE BUT YOURSELF IS TO BE HELD RESPONSIBLE FOR ANY DAMAGE THIS MAY CAUSE
echo                             TO YOUR NINTENDO WII CONSOLE!
echo.

echo.
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 7 -w 1000> nul
echo.
echo                 Please type the word "I" followed by the word "Agree"
echo                        with a space between those two words and
echo                             then press "Enter" to continue.
echo.
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 7 -w 1000> nul
echo                          If you can't follow those instructions,
echo                        then you have no business modding anything.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 5 -w 1000> nul

set /p warning=     Enter Selection Here: 


if /i "%warning%" EQU "skipscam" echo Having 'skipscam.txt' saved in the same folder as ModMii will skip the scam warning at startup.>skipscam.txt
if /i "%warning%" EQU "skipscam" attrib +r +h +s skipscam.txt
if /i "%warning%" EQU "skipscam" goto:DefaultSettings

if /i "%warning%" EQU "ipromisetodonate" echo Having 'ipromisetodonate.txt' saved in the same folder as ModMii will skip the scam warning at startup.>ipromisetodonate.txt
if /i "%warning%" EQU "ipromisetodonate" attrib +r +h +s ipromisetodonate.txt
if /i "%warning%" EQU "ipromisetodonate" goto:DefaultSettings


if /i "%warning%" EQU "I Agree" goto:skip
echo.
echo                                Exiting ModMii...
@ping 127.0.0.1 -n 2 -w 1000> nul
Exit
:skip

::Save version agreed to
if exist settings.bat sfk filter -quiet settings.bat -ls!"set AGREEDVERSION=" -write -yes
echo set AGREEDVERSION=%currentversion%>> settings.bat


:DefaultSettings

::----LOAD SETTINGS (if exist)----
if exist settings.bat call settings.bat

::-----default settings (default applies even if a single variable is missing from settings.bat)------
IF "%ROOTSAVE%"=="" set ROOTSAVE=off
IF "%PCSAVE%"=="" set PCSAVE=Auto
IF "%OPTION1%"=="" set OPTION1=off
IF "%OPTION36%"=="" set OPTION36=on
IF "%CMIOSOPTION%"=="" set CMIOSOPTION=off
IF "%Drive%"=="" set Drive=COPY_TO_SD
IF "%DriveU%"=="" set DriveU=COPY_TO_USB

IF "%ACTIVEIOS%"=="" set ACTIVEIOS=on
IF "%AUTOUPDATE%"=="" set AUTOUPDATE=on
IF "%ModMiiverbose%"=="" set ModMiiverbose=off
IF "%sneekverbose%"=="" set sneekverbose=off
::IF "%discexverify%"=="" set discexverify=off
IF "%SNKFONT%"=="" set SNKFONT=B
IF "%HEXEDIT%"=="" set HEXEDIT=Y
IF "%overwritecodes%"=="" set overwritecodes=off
IF "%cheatregion%"=="" set cheatregion=All
IF "%cheatlocation%"=="" set cheatlocation=B

IF "%wiicheat%"=="" set wiicheat=ON
IF "%WiiWarecheat%"=="" set WiiWarecheat=ON
IF "%VCArcadecheat%"=="" set VCArcadecheat=OFF
IF "%WiiChannelscheat%"=="" set WiiChannelscheat=ON
IF "%Gamecubecheat%"=="" set Gamecubecheat=ON
IF "%NEScheat%"=="" set NEScheat=ON
IF "%SNEScheat%"=="" set SNEScheat=ON
IF "%N64cheat%"=="" set N64cheat=ON
IF "%SMScheat%"=="" set SMScheat=ON
IF "%Segacheat%"=="" set Segacheat=ON
IF "%NeoGeocheat%"=="" set NeoGeocheat=ON
IF "%Commodorecheat%"=="" set Commodorecheat=ON
IF "%MSXcheat%"=="" set MSXcheat=ON
IF "%TurboGraFX-16cheat%"=="" set TurboGraFX-16cheat=ON
IF "%TurboGraFX-CDcheat%"=="" set TurboGraFX-CDcheat=ON


::check if drive folder exists--if second char is ":" check if drive exists
if /i "%DRIVE:~1,1%" NEQ ":" goto:skipcheck
if exist "%DRIVE:~0,2%" (goto:skipcheck) else (set DRIVE=COPY_TO_SD)
:skipcheck

::check if DRIVEU folder exists--if second char is ":" check if DRIVEU exists
if /i "%DRIVEU:~1,1%" NEQ ":" goto:skipcheck
if exist "%DRIVEU:~0,2%" (goto:skipcheck) else (set DRIVEU=COPY_TO_USB)
:skipcheck


::.NET Framework 3.5 check+installation
if exist "%windir%\Microsoft.NET\Framework\v3.5" goto:skipframeworkinstallation

echo ModMii requires .NET Framework 3.5 be installed
echo.

set FrameworkAttempt=0
:NETFRAMEWORK

SET /a FrameworkAttempt=%FrameworkAttempt%+1

if exist "temp\dotNetFx35setup.exe" goto:semiskip
echo Downloading .NET Framework 3.5 Installer
echo.

start %ModMiimin%/wait wget -t 3 "http://download.microsoft.com/download/7/0/3/703455ee-a747-4cc8-bd3e-98a615c3aedb/dotNetFx35setup.exe"

::start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait "http://download.microsoft.com/download/7/0/3/703455ee-a747-4cc8-bd3e-98a615c3aedb/dotNetFx35setup.exe"

if not exist temp mkdir temp
if exist dotNetFx35setup.exe move /y dotNetFx35setup.exe temp\dotNetFx35setup.exe
:semiskip

echo Launching installer and waiting for installation to finish...
echo.
start /wait temp\dotNetFx35setup.exe


if exist "%windir%\Microsoft.NET\Framework\v3.5" goto:skipframeworkinstallation

if /i "%FrameworkAttempt%" EQU "3" goto:GiveUpOnFramework

echo Installation Failed, retrying...
echo.
echo.
goto:NETFRAMEWORK


:GiveUpOnFramework
echo.
echo.
echo.
echo .NET Framework 3.5 Installation Failed Multiple Times
echo Alternatively, you can try installing .NET Framework 3.5 by performing a Windows Update
echo.
echo Some ModMii features may not work properly without .NET Framework 3.5 installed
echo Hit any key to use ModMii anyways
pause>nul

:skipframeworkinstallation


:Clear_Download_Log
::if exist %DRIVE%\Download_Log.md5 echo ;ModMii Log > %DRIVE%\Download_Log.md5
if exist "%Drive%"\Download_Log.md5 del "%Drive%"\Download_Log.md5>nul

::skip update when using cmd line
if /i "%one%" EQU "W" goto:MENUafterbadvars

if /i "%ModMiiverbose%" EQU "off" (set ModMiimin=/min ) else (set ModMiimin=)
if /i "%AUTOUPDATE%" EQU "on" goto:UpdateModMii

::......................................................MAIN MENU..............................................

:MENU

if exist %UPDATENAME%.bat del %UPDATENAME%.bat>nul
if exist %UPDATENAME%.txt del %UPDATENAME%.txt>nul

if exist temp\simplelog.txt del temp\simplelog.txt>nul
if exist temp\DLgotos-copy.txt del temp\DLgotos-copy.txt>nul

::----restore settings if applicable (download queue and sneek nand builder)----
IF "%MENU1%"=="" goto:NOCLEAR
if /i "%MENU1%" NEQ "O" goto:Cleartempsettings
goto:NOCLEAR
:Cleartempsettings
Set ROOTSAVE=%ROOTSAVETEMP%
Set Option1=%Option1TEMP%
:NOCLEAR

::---SET TEMP SETTINGS FOR DL QUE---
Set ROOTSAVETEMP=%ROOTSAVE%
Set Option1TEMP=%Option1%


if /i "%ModMiiverbose%" EQU "off" (set ModMiimin=/min ) else (set ModMiimin=)


::variable that interfere with cmd line wizard
SET VIRGIN=
SET FIRMSTART=
set STUB=
set PIC=
set NET=
set WEATHER=
set NEWS=
set SHOP=
set SPEAK=
set MIIQ=
set REGION=
set UpdatesIOSQ=
:MENUafterbadvars


mode con cols=85 lines=54
SET lines=54

set MORE=
SET DEC=
SET HEX=
SET VER=
SET CONFIRM=
set loadorgo=go
set SMAPP=

SET EXPLOIT=default
set exploitselection=
set COPY=
set DLTOTAL=0
set OPTIONS=
set DB=N
set FORMAT=NONE
set cfgfullrelease=NONE
set SNEEKTYPE=
if /i "%USBCONFIG%" EQU "USB" set DRIVE=%DRIVETEMP%
set USBGUIDE=
set UPAGE1=
set LOADER=
set SNEEKTYPE=
set SNEEKSELECT=
set patchIOSnum=36 or 236



::if second char is ":" check if drive exists
if /i "%DRIVE:~1,1%" NEQ ":" goto:skipcheck
if not exist "%DRIVE:~0,2%" set DRIVE=COPY_TO_SD
:skipcheck

::if second char is ":" check if driveU exists
if /i "%DRIVEU:~1,1%" NEQ ":" goto:skipcheck
if not exist "%DRIVEU:~0,2%" set DRIVE=COPY_TO_USB
:skipcheck

:CLEAR

set basewad=none
set basewadb=none

set AdvNumber=0
if exist temp\DLnamesADV.txt del temp\DLnamesADV.txt>nul
if exist temp\DLgotosADV.txt del temp\DLgotosADV.txt>nul

set EULAU=
set EULAE=
set EULAJ=
set EULAK=
set RSU=
set RSE=
set RSJ=
set RSK=
set BC=
set SM3.2U=
set SM4.1U=
set SM4.2U=
set SM4.3U=
set SM3.2E=
set SM4.1E=
set SM4.2E=
set SM4.3E=
set SM3.2J=
set SM4.1J=
set SM4.2J=
set SM4.3J=
set SM4.1K=
set SM4.2K=
set SM4.3K=
set SM4.3U-DWR=
set SM4.2U-DWR=
set SM4.1U-DWR=
set SM4.3E-DWR=
set SM4.2E-DWR=
set SM4.1E-DWR=
set SM4.3J-DWR=
set SM4.2J-DWR=
set SM4.1J-DWR=
set SM4.3K-DWR=
set SM4.2K-DWR=
set SM4.1K-DWR=

set SM4.3U-DWG=
set SM4.2U-DWG=
set SM4.1U-DWG=
set SM4.3E-DWG=
set SM4.2E-DWG=
set SM4.1E-DWG=
set SM4.3J-DWG=
set SM4.2J-DWG=
set SM4.1J-DWG=
set SM4.3K-DWG=
set SM4.2K-DWG=
set SM4.1K-DWG=

set IOS30=
set IOS30P=
set IOS30P60=
set IOS40P60=
set IOS20P60=
set IOS11P60=
set IOS50P=
set IOS52P=
set IOS60=
set IOS60P=
set IOS70=
set IOS70P=
set IOS80=
set IOS80P=
set IOS236=

set IOS70K=
set IOS80K=
set BB1=
set BB2=
set HM=
set h4=
set h5=
set h51=
set w19=
set w20=
set IOS236Installer=
set SIP=
set JOY=
set Y4M=
set dop=
set locked=
set AccioHacks=
set MyM=
set HBB=
set WII64=
set WIISX=
set bootmiisd=
set pwns=
set twi=
set YUGI=
set BATHAXX=
set ROTJ=
set TOS=
set smash=
set mmm=
set yawm=
set neogamma=
set cfg249=
set cfg222=
set usbfolder=
set WiiMC=
set fceugx=
set snes9xgx=
set vbagx=
set SGM=
set WIIX=
set cfgr=
set flow=
set wbm=
set CheatCodes=
set f32=
set USBX=
set JOYF=
set S2U=
set HBF=
set Pri=
set HAX=
set CM5=
set MP=
set MII=
set P=
set PK=
set S=
set SK=
set IU=
set IE=
set IJ=
set WU=
set WE=
set WJ=
set NU=
set NE=
set NJ=
set WSU=
set WSE=
set WSJ=
set M10=
set IOS9=
set IOS12=
set IOS13=
set IOS14=
set IOS15=
set IOS17=
set IOS21=
set IOS22=
set IOS28=
set IOS31=
set IOS33=
set IOS34=
set IOS35=
set IOS36=
set IOS36v3608=
set IOS37=
set IOS38=
set IOS41=
set IOS48v4124=
set IOS43=
set IOS45=
set IOS46=
set IOS53=
set IOS55=
set IOS56=
set IOS57=
set IOS58=
set IOS61=

set A0e=
set A0c=
set A0e_60=
set A0e_70=
set A01=
set A01_60=
set A01_70=
set A40=
set A42=
set A45=
set A70=
set A72=
set A75=
set A78=
set A7b=
set A7e=
set A84=
set A87=
set A8a=
set A94=
set A97=
set A9a=
set A81=
set A8d=
set A9d=
set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=
set RVL-cmios-v4_WiiGator_GCBL_v0.2=
set RVL-cmios-v4_Waninkoko_rev5=
set DarkWii_Red_4.3U=
set DarkWii_Red_4.2U=
set DarkWii_Red_4.1U=
set DarkWii_Red_4.3E=
set DarkWii_Red_4.2E=
set DarkWii_Red_4.1E=
set DarkWii_Red_4.3J=
set DarkWii_Red_4.2J=
set DarkWii_Red_4.1J=
set DarkWii_Red_4.3K=
set DarkWii_Red_4.2K=
set DarkWii_Red_4.1K=

set DarkWii_Green_4.3U=
set DarkWii_Green_4.2U=
set DarkWii_Green_4.1U=
set DarkWii_Green_4.3E=
set DarkWii_Green_4.2E=
set DarkWii_Green_4.1E=
set DarkWii_Green_4.3J=
set DarkWii_Green_4.2J=
set DarkWii_Green_4.1J=
set DarkWii_Green_4.3K=
set DarkWii_Green_4.2K=
set DarkWii_Green_4.1K=

set cIOS222[38]-v4=
set cIOS223[37-38]-v4=
set cIOS222[38]-v5=
set cIOS223[37]-v5=
set cIOS224[57]-v5=
set cIOS249[37]-v19=
set cIOS249[38]-v19=
set cIOS249[57]-v19=
set cIOS249[38]-v20=
set cIOS250[38]-v20=
set cIOS249[56]-v20=
set cIOS250[56]-v20=
set cIOS249[57]-v20=
set cIOS250[57]-v20=
set cIOS249-v17b=
set cIOS249-v14=
set cIOS250-v14=
set cIOS202[37]-v5=
set cIOS202[38]-v5=
set cIOS202[57]-v5=
set cIOS223[57]-v5=
set cIOS224[37]-v5=
set cIOS250[57]-v19=
set cIOS250-v17b=
set cIOS250[37]-v19=
set cIOS250[38]-v19=

set cIOS249[37]-v21=
set cIOS250[37]-v21=
set cIOS249[38]-v21=
set cIOS250[38]-v21=
set cIOS249[56]-v21=

set cIOS249[53]-v21=
set cIOS250[53]-v21=
set cIOS249[55]-v21=
set cIOS250[55]-v21=


set cIOS250[56]-v21=
set cIOS249[57]-v21=
set cIOS250[57]-v21=
set cIOS249[58]-v21=
set cIOS250[58]-v21=
set cIOS249[37]-d2x-v6=
set cIOS249[38]-d2x-v6=
set cIOS249[53]-d2x-v6=
set cIOS249[55]-d2x-v6=
set cIOS249[56]-d2x-v6=
set cIOS249[57]-d2x-v6=
set cIOS249[58]-d2x-v6=
set cIOS250[37]-d2x-v6=
set cIOS250[38]-d2x-v6=
set cIOS250[53]-d2x-v6=
set cIOS250[55]-d2x-v6=
set cIOS250[56]-d2x-v6=
set cIOS250[57]-d2x-v6=
set cIOS250[58]-d2x-v6=

if /i "%MENUREAL%" EQU "S" goto:finishsneekinstall2

if /i "%cleardownloadsettings%" EQU "yes" goto:DownloadSettings

if /i "%ADVPATCH%" EQU "B" goto:ADVANCED
if /i "%ADVSLOT%" EQU "B" goto:ADVANCED
if /i "%ADVVERSION%" EQU "B" goto:ADVANCED

if /i "%list%" EQU "C" goto:list
if /i "%oldlist%" EQU "C" goto:oldlist
if /i "%LIST3%" EQU "C" goto:LIST3
if /i "%LIST4%" EQU "C" goto:LIST4
if /i "%ADVLIST%" EQU "C" goto:ADVANCED

SET COUNT=1
SET COUNT2=1
SET COUNT3=1
SET COUNT4=1
SET COUNT5=1
SET COUNT6=1
SET COUNT7=1
SET COUNT8=1
SET CURRENTDL=0

::for cmdlineDLwizard
if /i "%one%" EQU "W" goto:DOWNLOAD

if not exist temp mkdir temp

set MENU1=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Choose an Activity:
echo.
echo           W = ModMii Wizard + Guide (Start Here to Mod Your Wii!)
echo.
echo           U = USB-Loader Setup + Guide
echo.
echo           H = HackMii Solutions (Upside-Down HBC/No Vulnerable IOS Fix) + Guide
echo.
echo           S = SNEEK Installation, Nand Builder, Game Bulk Extractor
echo.
echo.
echo           1 = Downloads Page 1 (System Menu's, IOSs, MIOSs, Channels, etc.)
echo.
echo           2 = Downloads Page 2 (Apps, USB-Loader Files, CheatCodes, etc.)
echo.
echo           3 = Downloads Page 3 (System Menu Themes)
echo.
echo           4 = Downloads Page 4 (cIOSs and cMIOSs)
echo.
echo           A = Advanced Custom Downloads
echo.
If Exist download_queue.bat echo           L = Load Download Queue
If Exist download_queue.bat echo.
echo.
echo           C = Build Config Files for BootMii, Wad Manager or Multi-Mod Manager
echo.
echo          FC = File Cleanup: Remove un-needed files after Modding
echo.
echo.
echo           O = Options
echo.
echo          CR = Credits
echo.
echo           E = Exit
echo.
echo      *********MORE INFO*********
echo.
sfk echo -spat \x20 \x20 [RED] V = Visit tinyurl.com/ModMiiNow to ask questions, provide feedback or vote
echo.
echo      Use the ModMii Wizard to automatically set-up your SD card with all you need
echo      to fully softmod your Wii and/or upgrade/downgrade your Wii and much more.
echo      When using the ModMii Wizard, a custom guide is built based on your answers
echo      to a few simple questions. Literally run the program once, let it download,
echo      and you will have all the files you need on your SD card to modify your Wii!
echo.
sfk echo -spat \x20 \x20 [RED] Donations are optional and can be made via paypal.com to XFlak40@hotmail.com
echo.
echo      ***************************
echo.
set /p MENU1=     Enter Selection Here: 


if /i "%MENU1%" EQU "W" goto:LoadWizardSettings
if /i "%MENU1%" EQU "U" goto:UPAGE1
if /i "%MENU1%" EQU "S" goto:SNKPAGE1
if /i "%MENU1%" EQU "1" goto:LIST
if /i "%MENU1%" EQU "2" goto:OLDLIST
if /i "%MENU1%" EQU "3" goto:LIST3
if /i "%MENU1%" EQU "4" goto:LIST4
if /i "%MENU1%" EQU "A" goto:ADVANCED
if /i "%MENU1%" EQU "E" goto:exitnow
if /i "%MENU1%" EQU "O" goto:OPTIONS
if /i "%MENU1%" EQU "H" goto:WPAGE2
if /i "%MENU1%" EQU "FC" set BACKB4DRIVE=Menu
if /i "%MENU1%" EQU "FC" goto:DRIVECHANGE
if /i "%MENU1%" EQU "C" goto:CONFIGFILEMENU


if /i "%MENU1%" EQU "CR" goto:Credits
if /i "%MENU1%" EQU "V" goto:openwebpage



If not Exist download_queue.bat goto:noload
if /i "%MENU1%" NEQ "L" goto:noload
if exist temp\DLnamesADV.txt del temp\DLnamesADV.txt>nul
if exist temp\DLgotosADV.txt del temp\DLgotosADV.txt>nul
set BACKB4QUEUE=Menu
call download_queue.bat
goto:DownloadQueue
:noload

:EasterEggs
if /i "%MENU1%" EQU "fuckyou" echo Fuck you too asshole!
if /i "%MENU1%" EQU "fuck you" echo Fuck you too asshole!
if /i "%MENU1%" EQU "bitch" echo I'm not a bitch, YOU'RE the Bitch!
if /i "%MENU1%" EQU "pussy" echo Well, you are what you eat ;)
if /i "%MENU1%" EQU "dick" echo Who do you think your calling a dick... DICK!
if /i "%MENU1%" EQU "help" echo Google is your friend
if /i "%MENU1%" EQU "decompiler" echo Close but no cigar!

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:MENU

:openwebpage
start www.tinyurl.com/ModMiiNow
goto:MENU

:exitnow
if exist "%DRIVE%"\Download_Log.md5 del "%DRIVE%"\Download_Log.md5>nul
if exist "%DRIVEU%"\Download_Log.md5 del "%DRIVEU%"\Download_Log.md5>nul
EXIT

::..................................................Credits.........................................................
:Credits
cls
mode con cols=85 lines=65
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                        Credits
echo   *********************************************************************************
echo   *   Special thanks to the following people, who have gone out of their way      *
echo   *              numerous times to help me when they didn't have to               *
echo   *                                                                               *
echo   *    DeadlyFoez, cwstjdenobs, Leathl, Violator, WiiCrazy, Giantpune, WiiPower   *
echo   * diddy81, DaMysteryMan, pepxl, ChokeD, longtom1, tj_cool, mauifrog  and xzxero *
echo   *********************************************************************************
echo   * Thanks to my cuz, Violator, who first got me into the Wii scene.
echo.
echo   * DeadlyFoez for always being there to bounce ModMii ideas off of.
echo.
echo   * Leathl for libwiisharp, patchios, nusfilegrabber, showmiiwads, etc.
echo.
echo   * cwstjdenobs for creating YAWMM and all his work to help support ModMii.
echo.
echo   * tj_cool, xzxero and burritoboy9984 (aka. Erik) for their awesome Guides.
echo.
echo   * Team Twiizers for creating the revolutionary HackMii Installer.
echo.
echo   * Waninkoko for creating CIOS and other excellent apps like WAD manager.
echo.
echo   * Hermes for creating his efficient CIOS 222/223/224.
echo.
echo   * davebaol and xabby666 for their cIOS rev 21d2x EHCI module.
echo.
echo   * Comex for creating the heavily utilized bannerbomb exploit.
echo.
echo   * Crediar, Daco Taco and Phpgeek for brick protection via Priiloader.
echo.
echo   * Arikado and the Dop-Mii team for Dop-Mii.
echo.
echo   * WiiWu and the Dop-Mii team for Multi-Mod Manager (MMM).
echo.
echo   * WiiNinja and WB3000 for their work on NUSD.
echo.
echo   * WiiPower for Neogamma and much more.
echo.
echo   * WiiCrazy for Crap (Forwarder Channel Maker) and Crazy Intro.
echo.
echo   * WiiGator for creating his Gamecube Backup Launcher.
echo.
echo   * oggzee, usptactical, gannon and Dr.Clipper for Configurable USB Loader.
echo.
echo   * Giantpune for USB Loader GX and much much more.
echo.
echo   * Wiimm for Wiimms ISO Tools.
echo.
echo   * diddy81 and symular syn of the Wii Theme Team for their amazing themes.
echo.
echo   * Narolez and FIX94 for their amazing Forwarder code.
echo.
echo   * WiiShizzza for the new ModMii icon and pepxl for the first ModMii icon.
echo.
echo   * mamule(F), xav91(F), ketufe(F), Wasabi(I) and Step(I) for translating ModMii.
echo.
echo   * Wii.py devs: Megazig, Omega, Xuzz, SquidMan, Matt_P and The Lemon Man
echo.
echo   * Daeken for writing Struct.py and marcan for his LZ77 code
echo.
echo Press any key to return to the Main Menu.
pause>nul

goto:menu


::..................................................OPTIONS.................................................. 
.......
:OPTIONS

Set WLAST=
Set Options=
set cheatoption=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]Enter the option # (or letter) to enable/disable it
echo.
echo           D = Change Drive letter (Current Setting: %Drive%)
echo.
echo          DU = Change Drive letter for USB (Current Setting: %DriveU%)
echo.
echo          CC = Cheat Code Options

echo.
echo          PC = PC Programs Save Location (Current Setting: %PCSAVE%)
if /i "%PCSAVE%" EQU "Local" echo               * F32 Formatter and WiiBackupManager saved to %HomeDrive%
if /i "%PCSAVE%" EQU "Local" echo               * Shortcuts will be installed to Start Menu and Desktop

if /i "%PCSAVE%" EQU "Portable" echo               * PC programs saved portably to one of the above Drive Settings

if /i "%PCSAVE%" NEQ "Auto" goto:skip
echo               * PC programs saved to %homedrive% with shortcuts if running ModMii from %homedrive%
echo               * PC programs saved portably if not running ModMii from %homedrive%
:skip

echo.
if /i "%ROOTSAVE%" EQU "ON" echo          RS = Root Save: Save IOSs\MIOSs to Root instead of WAD Folder (Enabled)
if /i "%ROOTSAVE%" EQU "OFF" echo          RS = Root Save: Save IOSs\MIOSs to Root instead of WAD Folder (Disabled)
echo               * Does NOT affect Download Wizard and only applies to IOSs\MIOSs
echo               * Useful for Wii Apps that require IOSs\MIOSs saved to Root
echo.
if /i "%OPTION1%" EQU "OFF" echo           1 = Do not Keep 00000001 or NUS Folders for IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "OFF" echo               * Folder sometimes required for offline usage of a few Wii Apps
if /i "%OPTION1%" EQU "ON" echo           1 = Keep 00000001 Folder for IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "ON" echo               * Useful for offline usage of Wii Apps like Dop-Mii

if /i "%OPTION1%" EQU "NUS" echo           1 = Keep NUS\00000001000000##v# Folder for IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "NUS" echo               * Useful for offline usage of Wii Apps like d2x\Hermes cIOS Installers

if /i "%OPTION1%" EQU "ALL" echo           1 = Keep NUS\00000001000000##v# and 00000001 Folder for IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "ALL" echo               * Useful for offline usage of a handful of Wii Apps
echo.

if /i "%ACTIVEIOS%" EQU "OFF" echo           U = Update IOSs. Wizard to download all active IOSs (Disabled)
if /i "%ACTIVEIOS%" EQU "ON" echo           U = Update IOSs. Wizard to download all active IOSs (Enabled)
echo.
if /i "%OPTION36%" EQU "OFF" echo          36 = Include IOS36v3608 in ModMii Wizard's Active IOS Downloads (Disabled)
if /i "%OPTION36%" EQU "ON" echo          36 = Include IOS36v3608 in ModMii Wizard's Active IOS Downloads (Enabled)
echo               * Your existing IOS36 may be patched. The downloaded IOS36 is not
echo.

if /i "%CMIOSOPTION%" EQU "OFF" echo          CM = cMIOS included in ModMii Wizard Guides (Disabled)
if /i "%CMIOSOPTION%" EQU "ON" echo          CM = cMIOS included in ModMii Wizard Guides (Enabled)
echo               * A cMIOS allows older non-chipped Wii's to play GameCube backup discs
echo.

if /i "%ModMiiverbose%" EQU "off" echo           V = Verbose Output maximized when using wget or Sneek Installer (Disabled)
if /i "%ModMiiverbose%" EQU "on" echo           V = Verbose Output maximized when using wget or Sneek Installer (Enabled)
echo.

if /i "%sneekverbose%" EQU "off" echo          SV = SNEEK Verbose Output (Disabled)
if /i "%sneekverbose%" EQU "on" echo          SV = SNEEK Verbose Output (Enabled)
echo.

if /i "%SNKFONT%" EQU "W" echo           F = Font.bin Colour for SNEEK+DI/UNEEK+DI (WHITE)
if /i "%SNKFONT%" EQU "B" echo           F = Font.bin Colour for SNEEK+DI/UNEEK+DI (BLACK)
echo.


if /i "%HEXEDIT%" EQU "Y" echo           H = Hex Edit cIOS Signatures and cIOS Korean Common Key (Enabled)
if /i "%HEXEDIT%" EQU "Y" echo               * Recommended Setting - change only if your PC cannot Hex Edit cIOSs
if /i "%HEXEDIT%" EQU "Y" echo                 properly even after performing windows updates
if /i "%HEXEDIT%" EQU "N" echo           H = Hex Edit cIOS Signatures and cIOS Korean Common Key (Disabled)
if /i "%HEXEDIT%" EQU "N" echo               * Warning: ModMii will not validate cIOSs but they should still work
if /i "%HEXEDIT%" EQU "N" echo               * Loaders will be unable to detect the version of the installed cIOS
if /i "%HEXEDIT%" EQU "N" echo               * Default option "Block IOS Reload = AUTO" won't work with CFG and GX
if /i "%HEXEDIT%" EQU "N" echo               * Non-Korean Wii's will not be able to load Korean games
if /i "%HEXEDIT%" EQU "S" echo           H = Hex Edit cIOS Signatures but not cIOS Korean Common Key
if /i "%HEXEDIT%" EQU "S" echo               * Warning: ModMii will not validate cIOSs but they should still work
if /i "%HEXEDIT%" EQU "S" echo               * Default option "Block IOS Reload = AUTO" won't work with CFG and GX
if /i "%HEXEDIT%" EQU "S" echo               * Non-Korean Wii's will not be able to load Korean games
if /i "%HEXEDIT%" EQU "K" echo           H = Hex Edit cIOS Korean Common Key but not cIOS Signatures
if /i "%HEXEDIT%" EQU "K" echo               * Warning: ModMii will not validate cIOSs but they should still work
if /i "%HEXEDIT%" EQU "K" echo               * Loaders will be unable to detect the version of the installed cIOS
echo.

if not exist "%DRIVE%" goto:nodrivefolder
echo           C = Create Custom.md5 file to verify all
echo               Wads, dols, elfs and apps in %DRIVE%
if exist Custom.md5 echo          C2 = Verify files in %DRIVE% against Custom.md5
:nodrivefolder
if exist Custom.md5 echo          C3 = Delete Custom.md5
echo.
if /i "%AUTOUPDATE%" EQU "OFF" echo           A = Auto-Update ModMii at program start (Disabled)
if /i "%AUTOUPDATE%" EQU "ON" echo           A = Auto-Update ModMii at program start (Enabled)
echo           N = Check for New versions of ModMii right now
echo.
echo       S = Save Settings       R = Restore Default Settings       M = Main Menu
echo.
set /p OPTIONS=     Enter Selection Here: 


if /i "%OPTIONS%" EQU "RS" goto:ROOTSAVE
if /i "%OPTIONS%" EQU "PC" goto:PCSAVE
if /i "%OPTIONS%" EQU "1" goto:Option1
if /i "%OPTIONS%" EQU "N" goto:UpdateModMii
if /i "%OPTIONS%" EQU "A" goto:AutoUpdate
if /i "%OPTIONS%" EQU "36" goto:Option36
if /i "%OPTIONS%" EQU "H" goto:HEXEDIT
if /i "%OPTIONS%" EQU "CM" goto:CMIOSOPTION
if /i "%OPTIONS%" EQU "sv" goto:OptionSneekverbose
if /i "%OPTIONS%" EQU "v" goto:OptionModMiiverbose
if /i "%OPTIONS%" EQU "f" goto:Optionfont

if not exist "%DRIVE%" goto:nodrivefolder2
::if /i "%OPTIONS%" EQU "C" sfk list "%DRIVE%" wad dol app elf +md5gento="%DRIVE%"\Custom.md5
if /i "%OPTIONS%" EQU "C" fvc -c -a MD5 -r "%DRIVE%"\*.wad>Custom.md5
if /i "%OPTIONS%" EQU "C" fvc -c -a MD5 -r "%DRIVE%"\*.dol>>Custom.md5
if /i "%OPTIONS%" EQU "C" fvc -c -a MD5 -r "%DRIVE%"\*.app>>Custom.md5
if /i "%OPTIONS%" EQU "C" fvc -c -a MD5 -r "%DRIVE%"\*.elf>>Custom.md5
if /i "%OPTIONS%" EQU "C" fvc -c -a MD5 -r "%DRIVE%"\*.bin>>Custom.md5
::if /i "%OPTIONS%" EQU "C" fvc -c -a MD5 -r "%DRIVE%"\*.exe>>Custom.md5

if /i "%OPTIONS%" EQU "C" sfk filter Custom.md5 -unique -write -yes>nul
if /i "%OPTIONS%" EQU "C" goto:Options

if not exist Custom.md5 goto:nocustomMD5
if /i "%OPTIONS%" EQU "C2" Set DB=C
if /i "%OPTIONS%" EQU "C2" goto:Finish
:nodrivefolder2

if not exist Custom.md5 goto:nocustomMD5
if /i "%OPTIONS%" EQU "C3" del Custom.md5
if /i "%OPTIONS%" EQU "C3" goto:Options
:nocustomMD5

if /i "%OPTIONS%" EQU "D" set BACKB4DRIVE=OPTIONS
if /i "%OPTIONS%" EQU "D" goto:DRIVECHANGE
if /i "%OPTIONS%" EQU "DU" set BACKB4DRIVEU=OPTIONS
if /i "%OPTIONS%" EQU "DU" goto:DRIVEUCHANGE
if /i "%OPTIONS%" EQU "CC" goto:cheatcodeoptions

if /i "%OPTIONS%" EQU "U" goto:ACTIVEIOS
if /i "%OPTIONS%" EQU "S" goto:SaveSettings
if /i "%OPTIONS%" EQU "R" goto:RestoreSettings
if /i "%OPTIONS%" EQU "M" goto:MENU
::if /i "%OPTIONS%" EQU "B" goto:MENU
if /i "%OPTIONS%" EQU "decompiler" "ModMii.exe" decompiler
if /i "%OPTIONS%" EQU "decompiler" goto:OPTIONS



echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:OPTIONS







:RestoreSettings
set ROOTSAVE=off
set PCSAVE=Auto
set OPTION1=off
set OPTION36=on
set CMIOSOPTION=off
set Drive=COPY_TO_SD
set DriveU=COPY_TO_USB
set ACTIVEIOS=on
set AUTOUPDATE=on
Set ModMiiverbose=off
Set sneekverbose=off
Set SNKFONT=B
set HEXEDIT=Y

:defaultcheatsettings
set overwritecodes=off
set cheatregion=All
set cheatlocation=B

:selectallcheats
set wiicheat=ON
set WiiWarecheat=ON
set VCArcadecheat=OFF
set WiiChannelscheat=ON
set Gamecubecheat=ON
set NEScheat=ON
set SNEScheat=ON
set N64cheat=ON
set SMScheat=ON
set Segacheat=ON
set NeoGeocheat=ON
set Commodorecheat=ON
set MSXcheat=ON
set TurboGraFX-16cheat=ON
set TurboGraFX-CDcheat=ON
if /i "%cheatoption%" EQU "A" goto:cheatcodeoptions
if /i "%cheatoption%" EQU "D" goto:cheatcodeoptions
goto:savesettingsnow




:SaveSettings
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
:savesettingsnow
echo ::ModMii Settings > settings.bat
echo ::ModMiiv%currentversion%>> settings.bat
echo Set ROOTSAVE=%ROOTSAVE%>> settings.bat
echo Set PCSAVE=%PCSAVE%>> settings.bat
echo Set Option1=%Option1%>> settings.bat
echo Set OPTION36=%OPTION36%>> settings.bat
echo Set CMIOSOPTION=%CMIOSOPTION%>> settings.bat
echo Set Drive=%DRIVE%>> settings.bat
echo Set DriveU=%DRIVEU%>> settings.bat
echo Set overwritecodes=%overwritecodes%>> settings.bat
echo Set cheatregion=%cheatregion%>> settings.bat
echo Set cheatlocation=%cheatlocation%>> settings.bat
echo Set ACTIVEIOS=%ACTIVEIOS%>> settings.bat
echo Set AUTOUPDATE=%AUTOUPDATE%>> settings.bat
echo Set ModMiiverbose=%ModMiiverbose%>> settings.bat
echo Set sneekverbose=%sneekverbose%>> settings.bat
echo Set SNKFONT=%SNKFONT%>> settings.bat
echo Set HEXEDIT=%HEXEDIT%>> settings.bat
echo Set wiicheat=%wiicheat%>> settings.bat
echo Set WiiWarecheat=%WiiWarecheat%>> settings.bat
echo Set VCArcadecheat=%VCArcadecheat%>> settings.bat
echo Set WiiChannelscheat=%WiiChannelscheat%>> settings.bat
echo Set Gamecubecheat=%Gamecubecheat%>> settings.bat
echo Set NEScheat=%NEScheat%>> settings.bat
echo Set SNEScheat=%SNEScheat%>> settings.bat
echo Set N64cheat=%N64cheat%>> settings.bat
echo Set SMScheat=%SMScheat%>> settings.bat
echo Set Segacheat=%Segacheat%>> settings.bat
echo Set NeoGeocheat=%NeoGeocheat%>> settings.bat
echo Set Commodorecheat=%Commodorecheat%>> settings.bat
echo Set MSXcheat=%MSXcheat%>> settings.bat
echo Set TurboGraFX-16cheat=%TurboGraFX-16cheat%>> settings.bat
echo Set TurboGraFX-CDcheat=%TurboGraFX-CDcheat%>> settings.bat
echo set AGREEDVERSION=%currentversion%>> settings.bat
if /i "%OPTIONS%" EQU "R" goto:OPTIONS
if exist settings.bat echo                                     Settings Saved.
echo.
@ping 127.0.0.1 -n 2 -w 1000> nul
if /i "%cheatoption%" EQU "S" goto:cheatcodeoptions
goto:OPTIONS






:ROOTSAVE
if /i "%ROOTSAVE%" EQU "ON" goto:ROOTSAVEoff
Set ROOTSAVE=ON
goto:OPTIONS

:ROOTSAVEoff
Set ROOTSAVE=OFF
goto:OPTIONS

:PCSAVE
if /i "%PCSAVE%" EQU "Auto" (set PCSAVE=Portable) & (goto:options)
if /i "%PCSAVE%" EQU "Portable" (set PCSAVE=Local) & (goto:options)
if /i "%PCSAVE%" EQU "Local" (set PCSAVE=Auto) & (goto:options)

:HEXEDIT
if /i "%HEXEDIT%" EQU "Y" (set HEXEDIT=N) & (goto:options)
if /i "%HEXEDIT%" EQU "N" (set HEXEDIT=S) & (goto:options)
if /i "%HEXEDIT%" EQU "S" (set HEXEDIT=K) & (goto:options)
if /i "%HEXEDIT%" EQU "K" (set HEXEDIT=Y) & (goto:options)


:Option1
if /i "%OPTION1%" EQU "off" (set OPTION1=on) & (goto:options)
if /i "%OPTION1%" EQU "on" (set OPTION1=nus) & (goto:options)
if /i "%OPTION1%" EQU "nus" (set OPTION1=all) & (goto:options)
if /i "%OPTION1%" EQU "all" (set OPTION1=off) & (goto:options)

:OPTION36
if /i "%OPTION36%" EQU "ON" goto:OPTION36off
Set OPTION36=ON
goto:OPTIONS

:OPTION36off
Set OPTION36=OFF
goto:OPTIONS

:CMIOSOPTION
if /i "%CMIOSOPTION%" EQU "ON" goto:CMIOSOPTIONoff
Set CMIOSOPTION=ON
goto:OPTIONS

:CMIOSOPTIONoff
Set CMIOSOPTION=OFF
goto:OPTIONS

:OptionSneekverbose
if /i "%sneekverbose%" EQU "on" goto:OptionSneekverboseoff
Set sneekverbose=on
goto:OPTIONS

:OptionSneekverboseoff
Set sneekverbose=off
goto:OPTIONS

:OptionModMiiverbose
if /i "%ModMiiverbose%" EQU "on" goto:OptionModMiiverboseoff
Set ModMiiverbose=on
goto:OPTIONS

:OptionModMiiverboseoff
Set ModMiiverbose=off
goto:OPTIONS

:Optionfont
if /i "%SNKFONT%" EQU "W" goto:OptionfontB
Set SNKFONT=W
goto:OPTIONS

:OptionfontB
Set SNKFONT=B
goto:OPTIONS

:ACTIVEIOS
if /i "%ACTIVEIOS%" EQU "ON" goto:ACTIVEIOSoff
Set ACTIVEIOS=ON
goto:OPTIONS

:ACTIVEIOSoff
Set ACTIVEIOS=OFF
goto:OPTIONS

:AUTOUPDATE
if /i "%AUTOUPDATE%" EQU "ON" goto:AUTOUPDATEoff
Set AUTOUPDATE=ON
goto:OPTIONS

:AUTOUPDATEoff
Set AUTOUPDATE=OFF
goto:OPTIONS





:cheatcodeoptions
set cheatoption=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  CHEAT CODE OPTIONS
echo.
echo.
echo           R = Region to download cheats for: (%cheatregion%)
echo.
if /i "%overwritecodes%" EQU "OFF" echo           O = Overwrite existing txtcodes (Disabled)
if /i "%overwritecodes%" EQU "ON" echo           O = Overwrite existing txtcodes (Enabled)
echo.
if /i "%cheatlocation%" EQU "B" echo           L = Location(s) to save cheats: (Both 1 and 2)
if /i "%cheatlocation%" EQU "T" echo           L = Location(s) to save cheats: (1: txtcodes)
if /i "%cheatlocation%" EQU "C" echo           L = Location(s) to save cheats: (2: codes\X\L)
echo               1: - txtcodes: location used by most apps, including CFG USB-Loader
echo               2: - codes\X\L\: location used by Accio Hacks
echo                        X = Console ID Letter (ie. Wii = R)
echo                        L = 1st letter of game title ('#' if it starts with a number)
echo.
echo.
echo                   Select or deselect consoles to download cheats for:
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Selected consoles are marked in [Green]Green
echo.
echo.
if /i "%wiicheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]1 = Wii) else (echo                 1 = Wii)
if /i "%WiiWarecheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]2 = WiiWare) else (echo                 2 = WiiWare)

::if /i "%VCArcadecheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]3 = VC Arcade)  else (echo                 3 = VC Arcade)
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]3 = VC Arcade (Disabled due to geckocodes.org error)

if /i "%WiiChannelscheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]4 = Wii Channels)  else (echo                 4 = Wii Channels)
if /i "%Gamecubecheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]5 = Gamecube)  else (echo                 5 = Gamecube)
if /i "%NEScheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]6 = NES/Famicom VC)  else (echo                 6 = NES/Famicom VC)
if /i "%SNEScheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]7 = Super NES/Famicom VC)  else (echo                 7 = Super NES/Famicom VC)
if /i "%N64cheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]8 = Nintendo 64 VC)  else (echo                 8 = Nintendo 64 VC)
if /i "%SMScheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]9 = Sega Master System VC)  else (echo                 9 = Sega Master System VC)
if /i "%Segacheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 10 = Sega Genesis/Mega Drive VC)  else (echo                10 = Sega Genesis/Mega Drive VC)
if /i "%NeoGeocheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 11 = NeoGeo VC)  else (echo                11 = NeoGeo VC)
if /i "%Commodorecheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 12 = Commodore 64 VC)  else (echo                12 = Commodore 64 VC)
if /i "%MSXcheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 13 = MSX VC)  else (echo                13 = MSX VC)
if /i "%TurboGraFX-16cheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 14 = TurboGraFX-16 VC)  else (echo                14 = TurboGraFX-16 VC)
if /i "%TurboGraFX-CDcheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 15 = TurboGraFX-CD VC)  else (echo                15 = TurboGraFX-CD VC)
echo.
echo.
echo                 A = All
echo                 C = Clear
echo.
echo                 S = Save Settings
echo                 D = Default Cheat Settings
echo.
echo                 B = Back
echo                 M = Main Menu
echo.
echo.
echo.
set /p cheatoption=     Enter Selection Here: 



if /i "%cheatoption%" EQU "1" goto:wiicheat
if /i "%cheatoption%" EQU "2" goto:WiiWarecheat
::if /i "%cheatoption%" EQU "3" goto:VCArcadecheat
if /i "%cheatoption%" EQU "4" goto:WiiChannelscheat
if /i "%cheatoption%" EQU "5" goto:Gamecubecheat
if /i "%cheatoption%" EQU "6" goto:NEScheat
if /i "%cheatoption%" EQU "7" goto:SNEScheat
if /i "%cheatoption%" EQU "8" goto:N64cheat
if /i "%cheatoption%" EQU "9" goto:SMScheat
if /i "%cheatoption%" EQU "10" goto:Segacheat
if /i "%cheatoption%" EQU "11" goto:NeoGeocheat
if /i "%cheatoption%" EQU "12" goto:Commodorecheat
if /i "%cheatoption%" EQU "13" goto:MSXcheat
if /i "%cheatoption%" EQU "14" goto:TurboGraFX-16cheat
if /i "%cheatoption%" EQU "15" goto:TurboGraFX-CDcheat
if /i "%cheatoption%" EQU "A" goto:selectallcheats
if /i "%cheatoption%" EQU "C" goto:deselectallcheats
if /i "%cheatoption%" EQU "R" goto:cheatregion
if /i "%cheatoption%" EQU "l" goto:cheatlocation
if /i "%cheatoption%" EQU "O" goto:overwritecodes
if /i "%cheatoption%" EQU "B" goto:countconsoles
if /i "%cheatoption%" EQU "M" goto:countconsoles

if /i "%cheatoption%" EQU "S" goto:SaveSettings
if /i "%cheatoption%" EQU "D" goto:defaultcheatsettings


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:cheatcodeoptions

:countconsoles
set countconsoles=0
if /i "%wiicheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%WiiWarecheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%VCArcadecheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%WiiChannelscheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%Gamecubecheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%NEScheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%SNEScheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%N64cheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%SMScheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%Segacheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%NeoGeocheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%Commodorecheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%MSXcheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%TurboGraFX-16cheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1
if /i "%TurboGraFX-CDcheat%" EQU "ON" SET /a countconsoles=%countconsoles%+1

if /i "%countconsoles%" EQU "0" echo Select at least one console to download cheats for
if /i "%countconsoles%" EQU "0" @ping 127.0.0.1 -n 3 -w 1000> nul
if /i "%countconsoles%" EQU "0" goto:cheatcodeoptions

if /i "%cheatoption%" EQU "B" goto:Options
if /i "%cheatoption%" EQU "M" goto:MENU



:overwritecodes
if /i "%overwritecodes%" EQU "ON" goto:overwritecodesoff
Set overwritecodes=ON
goto:cheatcodeoptions

:overwritecodesoff
Set overwritecodes=OFF
goto:cheatcodeoptions


:cheatregion
if /i "%cheatregion%" EQU "all" Set cheatregion=USA&&goto:cheatcodeoptions
if /i "%cheatregion%" EQU "USA" Set cheatregion=PAL&&goto:cheatcodeoptions
if /i "%cheatregion%" EQU "PAL" Set cheatregion=JAP&&goto:cheatcodeoptions
if /i "%cheatregion%" EQU "JAP" Set cheatregion=all&&goto:cheatcodeoptions


:cheatlocation
if /i "%cheatlocation%" EQU "B" Set cheatlocation=T&&goto:cheatcodeoptions
if /i "%cheatlocation%" EQU "T" Set cheatlocation=C&&goto:cheatcodeoptions
if /i "%cheatlocation%" EQU "C" Set cheatlocation=B&&goto:cheatcodeoptions




:wiicheat
if /i "%wiicheat%" EQU "OFF" (set wiicheat=ON) else (set wiicheat=OFF)
goto:cheatcodeoptions


:WiiWarecheat
if /i "%WiiWarecheat%" EQU "OFF" (set WiiWarecheat=ON) else (set WiiWarecheat=OFF)
goto:cheatcodeoptions

:VCArcadecheat
if /i "%VCArcadecheat%" EQU "OFF" (set VCArcadecheat=ON) else (set VCArcadecheat=OFF)
goto:cheatcodeoptions

:WiiChannelscheat
if /i "%WiiChannelscheat%" EQU "OFF" (set WiiChannelscheat=ON) else (set WiiChannelscheat=OFF)
goto:cheatcodeoptions

:Gamecubecheat
if /i "%Gamecubecheat%" EQU "OFF" (set Gamecubecheat=ON) else (set Gamecubecheat=OFF)
goto:cheatcodeoptions

:NEScheat
if /i "%NEScheat%" EQU "OFF" (set NEScheat=ON) else (set NEScheat=OFF)
goto:cheatcodeoptions

:SNEScheat
if /i "%SNEScheat%" EQU "OFF" (set SNEScheat=ON) else (set SNEScheat=OFF)
goto:cheatcodeoptions

:N64cheat
if /i "%N64cheat%" EQU "OFF" (set N64cheat=ON) else (set N64cheat=OFF)
goto:cheatcodeoptions

:SMScheat
if /i "%SMScheat%" EQU "OFF" (set SMScheat=ON) else (set SMScheat=OFF)
goto:cheatcodeoptions

:Segacheat
if /i "%Segacheat%" EQU "OFF" (set Segacheat=ON) else (set Segacheat=OFF)
goto:cheatcodeoptions

:NeoGeocheat
if /i "%NeoGeocheat%" EQU "OFF" (set NeoGeocheat=ON) else (set NeoGeocheat=OFF)
goto:cheatcodeoptions

:Commodorecheat
if /i "%Commodorecheat%" EQU "OFF" (set Commodorecheat=ON) else (set Commodorecheat=OFF)
goto:cheatcodeoptions

:MSXcheat
if /i "%MSXcheat%" EQU "OFF" (set MSXcheat=ON) else (set MSXcheat=OFF)
goto:cheatcodeoptions

:TurboGraFX-16cheat
if /i "%TurboGraFX-16cheat%" EQU "OFF" (set TurboGraFX-16cheat=ON) else (set TurboGraFX-16cheat=OFF)
goto:cheatcodeoptions

:TurboGraFX-CDcheat
if /i "%TurboGraFX-CDcheat%" EQU "OFF" (set TurboGraFX-CDcheat=ON) else (set TurboGraFX-CDcheat=OFF)
goto:cheatcodeoptions

:deselectallcheats
set wiicheat=OFF
set WiiWarecheat=OFF
set VCArcadecheat=OFF
set WiiChannelscheat=OFF
set Gamecubecheat=OFF
set NEScheat=OFF
set SNEScheat=OFF
set N64cheat=OFF
set SMScheat=OFF
set Segacheat=OFF
set NeoGeocheat=OFF
set Commodorecheat=OFF
set MSXcheat=OFF
set TurboGraFX-16cheat=OFF
set TurboGraFX-CDcheat=OFF
goto:cheatcodeoptions



:DRIVECHANGE
set drivetemp=%DRIVE%
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo         Enter the drive letter (or Path) to save files for your SD Card

::the below msg is only for people building a nand
if /i "%SNEEKSELECT%" EQU "2" goto:donotskip
if /i "%SNEEKSELECT%" EQU "3" (goto:donotskip) else (goto:skip)
:donotskip
echo.
echo.
echo         Note: WADs installed to emulated NAND will also be saved to this location
echo               so they will not need to be redownloaded to build future NANDs
:skip

echo.
echo.
echo             Current Setting:   %Drive%
echo.
echo.
echo         Notes: * To continue using Current Settings
echo                  leave the selection blank and hit enter.
echo.
echo                * You can drag and drop the Drive/folder into this
echo                  window to save yourself having to manually type it
echo.
echo                * If you continue to experience errors, try using default settings
echo.
echo.
echo.
echo         EXAMPLES
echo.
echo.
echo            L:
echo.
echo            %%userprofile%%\Desktop\COPY_TO_SD
echo                  Note: %%userprofile%% shortcut doesn't work on Windows XP
echo.
echo            ModMii\4.2U
echo                  Note: this creates ModMii\4.2U folders where this program is Saved
echo.
echo            C:\Users\XFlak\Desktop\New Folder
echo.
echo.
echo.
echo         D = Default Setting: COPY_TO_SD
echo.
echo.
echo         B = Back
echo.
echo         M = Main Menu
echo.
echo.
set /p Drivetemp=     Enter Selection Here: 

::remove quotes from variable (if applicable)
echo "set DRIVETEMP=%DRIVETEMP%">temp.txt
sfk filter -quiet temp.txt -rep _""""__>temp.bat
call temp.bat
del temp.bat
del temp.txt



if /i "%DRIVETEMP%" EQU "M" goto:MENU
if /i "%DRIVETEMP%" EQU "B" goto:%BACKB4DRIVE%
if /i "%DRIVETEMP%" EQU "D" set DRIVETEMP=COPY_TO_SD


:doublecheck
set fixslash=
if /i "%DRIVETEMP:~-1%" EQU "\" set fixslash=yes
if /i "%DRIVETEMP:~-1%" EQU "/" set fixslash=yes
if /i "%fixslash%" EQU "yes" set DRIVETEMP=%DRIVETEMP:~0,-1%
if /i "%fixslash%" EQU "yes" goto:doublecheck


::if second char is ":" check if drive exists
if /i "%DRIVETEMP:~1,1%" NEQ ":" goto:skipcheck
if exist "%DRIVETEMP:~0,2%" (goto:skipcheck) else (echo.)
echo %DRIVETEMP:~0,2% doesn't exist, please try again...
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DRIVECHANGE
:skipcheck


set DRIVE=%DRIVETEMP%
set REALDRIVE=%DRIVE%


::autosave drive setting to settings.bat
sfk filter settings.bat -!"Set Drive=" -write -yes>nul
echo Set Drive=%DRIVE%>>settings.bat



if exist "%Drive%"\Download_Log.md5 del "%Drive%"\Download_Log.md5>nul


if /i "%MENU1%" EQU "FC" goto:FileCleanup
if /i "%MENU1%" EQU "U" set BACKB4QUEUE=DRIVECHANGE
if /i "%MENU1%" EQU "U" goto:DOWNLOADQUEUE


if /i "%MENU1%" NEQ "W" goto:skip
if /i "%USBCONFIG%" EQU "USB" (set BACKB4QUEUE=DRIVEUCHANGE) else (set BACKB4QUEUE=DRIVECHANGE)
if /i "%USBCONFIG%" EQU "USB" (goto:DRIVEUCHANGE) else (goto:download)
:skip


if /i "%SNEEKTYPE%" EQU "U" set BACKB4DRIVEU=DRIVECHANGE
if /i "%SNEEKTYPE%" EQU "UD" set BACKB4DRIVEU=DRIVECHANGE
if /i "%SNEEKTYPE%" EQU "U" goto:DRIVEUCHANGE
if /i "%SNEEKTYPE%" EQU "UD" goto:DRIVEUCHANGE
if /i "%SNEEKSELECT%" EQU "2" set B4SNKPAGE3=DRIVECHANGE
if /i "%SNEEKSELECT%" EQU "3" set B4SNKPAGE3=DRIVECHANGE
if /i "%SNEEKSELECT%" EQU "2" goto:snkpage3
if /i "%SNEEKSELECT%" EQU "3" goto:snkpage3
if /i "%SNEEKSELECT%" EQU "1" set B4SNKCONFIRM=DRIVECHANGE
if /i "%SNEEKSELECT%" EQU "1" goto:SNKNANDCONFIRM

if /i "%MENU1%" EQU "1" goto:%BACKB4DRIVE%
if /i "%MENU1%" EQU "2" goto:%BACKB4DRIVE%
if /i "%MENU1%" EQU "3" goto:%BACKB4DRIVE%
if /i "%MENU1%" EQU "4" goto:%BACKB4DRIVE%
if /i "%MENU1%" EQU "A" goto:%BACKB4DRIVE%

goto:Options








:DRIVEUCHANGE
set driveUtemp=%DRIVEU%
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo         Enter the drive letter (or Path) to save files for your USB Hard Drive
echo.
echo.
echo             Current Setting:   %DriveU%
echo.
echo.
echo         Notes: * To continue using Current Settings
echo                  leave the selection blank and hit enter.
echo.
echo                * You can drag and drop the Drive/folder into this
echo                  window to save yourself having to manually type it
echo.
echo                * If you continue to experience errors, try using default settings
echo.
echo.
echo.
echo         EXAMPLES
echo.
echo.
echo            L:
echo.
echo            %%userprofile%%\Desktop\COPY_TO_USB
echo                  Note: %%userprofile%% shortcut doesn't work on Windows XP
echo.
echo            ModMii\4.2U
echo                  Note: this creates ModMii\4.2U folders where this program is Saved
echo.
echo            C:\Users\XFlak\Desktop\New Folder
echo.
echo.
echo.
echo         D = Default Setting: COPY_TO_USB
echo.
echo.
echo         B = Back
echo.
echo         M = Main Menu
echo.
echo.
set /p DriveUtemp=     Enter Selection Here: 


::remove quotes from variable (if applicable)
echo "set DRIVEUTEMP=%DRIVEUTEMP%">temp.txt
sfk filter -quiet temp.txt -rep _""""__>temp.bat
call temp.bat
del temp.bat
del temp.txt


if /i "%DRIVEUTEMP%" EQU "M" goto:MENU

if /i "%DRIVEUTEMP%" EQU "B" goto:%BACKB4DRIVEU%

if /i "%DRIVEUTEMP%" EQU "D" set DRIVEUTEMP=COPY_TO_USB

:doublecheckU
set fixslash=
if /i "%DRIVEUTEMP:~-1%" EQU "\" set fixslash=yes
if /i "%DRIVEUTEMP:~-1%" EQU "/" set fixslash=yes
if /i "%fixslash%" EQU "yes" set DRIVEUTEMP=%DRIVEUTEMP:~0,-1%
if /i "%fixslash%" EQU "yes" goto:doublecheckU



::if second char is ":" check if drive exists
if /i "%DRIVEUTEMP:~1,1%" NEQ ":" goto:skipcheck
if exist "%DRIVEUTEMP:~0,2%" (goto:skipcheck) else (echo.)
echo %DRIVEUTEMP:~0,2% doesn't exist, please try again...
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DRIVECHANGE
:skipcheck



set DRIVEU=%DRIVEUTEMP%

::autosave drive setting to settings.bat
sfk filter settings.bat -!"Set DriveU=" -write -yes>nul
echo Set DriveU=%DRIVEU%>>settings.bat

if exist "%DRIVEU%"\Download_Log.md5 del "%DRIVEU%"\Download_Log.md5

if /i "%SNEEKSELECT%" EQU "1" set B4SNKCONFIRM=DRIVEUCHANGE
if /i "%SNEEKSELECT%" EQU "1" goto:SNKNANDCONFIRM
if /i "%SNEEKSELECT%" EQU "2" set B4SNKPAGE3=DRIVEUCHANGE
if /i "%SNEEKSELECT%" EQU "3" set B4SNKPAGE3=DRIVEUCHANGE
if /i "%SNEEKSELECT%" EQU "2" goto:snkpage3
if /i "%SNEEKSELECT%" EQU "3" goto:snkpage3
if /i "%SNEEKSELECT%" EQU "4" goto:SNKDISCEX2

::if /i "%MENU1%" EQU "U" goto:DOWNLOADQUEUE
::if /i "%WLAST%" EQU "Y" goto:DOWNLOAD


if /i "%MENU1%" NEQ "U" goto:skip
if /i "%USBCONFIG%" EQU "USB" set DRIVE=%DRIVEU%
if /i "%USBCONFIG%" EQU "USB" set BACKB4QUEUE=DRIVEUCHANGE
if /i "%USBCONFIG%" EQU "USB" goto:DownloadQueue
:skip
if /i "%USBCONFIG%" EQU "USB" set BACKB4QUEUE=DRIVEUCHANGE
if /i "%USBCONFIG%" EQU "USB" goto:Download

goto:Options







:UpdateModMii
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                Current Version is %CurrentVersion%
echo.
echo                                 Checking for updates...
echo.


if exist list.bat del list.bat>nul

start %ModMiimin%/wait wget "http://code.google.com/p/nusad/downloads/list?can=3&q=&colspec=Filename+Summary+Uploaded+ReleaseDate+Size+DownloadCount"

if exist list* (move /y list* list.bat>nul) else (goto:updatefail)
sfk filter -quiet "list.bat" -+"%UPDATENAME%" -rep _".txt*"__ -rep _"*%UPDATENAME%-"_"set newversion="_ -rep _" </a>*"__ -write -yes
sfk filter "list.bat" -unique -write -yes>nul
call list.bat
del list.bat>nul

if %currentversion% GTR %newversion:~0,5% (echo                  This version is newer than the latest public release) & (echo.) & (echo                           You got some crazy new beta shit!) & (@ping 127.0.0.1 -n 4 -w 1000> nul) & (goto:menu)

::before %updatename% is called %newversion% can be more than 5 chars (ie. 4.6.0.1)
if %currentversion% EQU %newversion% (echo                              This version is up to date) & (@ping 127.0.0.1 -n 4 -w 1000> nul) & (goto:menu)

::if %newversion% has exactly 5 chars (#.#.#), get changelog and update
if "%newversion:~5%"=="" goto:getchangelog

::only make it this far if newversion is greater than current version (ie. not beta shit) and has >5 chars (ie. #.#.#.#). Now check if DL DB needs to be updated (ie. partial update)
set NEWDBUPDATEVERSION=%newversion%
set DBUPDATEVERSION=none
if exist temp\DBUPDATE%newversion:~0,5%.bat call temp\DBUPDATE%newversion:~0,5%.bat
if %NEWDBUPDATEVERSION% EQU %DBUPDATEVERSION% (echo                              This version is up to date) & (@ping 127.0.0.1 -n 4 -w 1000> nul) & (goto:menu)


:getchangelog
start %ModMiimin%/wait wget http://nusad.googlecode.com/files/%UPDATENAME%-%newversion%.txt
if not exist %UPDATENAME%-%newversion%.txt goto:updatefail

ren %UPDATENAME%-%newversion%.txt %UPDATENAME%.bat
call %UPDATENAME%.bat

set newversion=%newversion:~0,5%
if %currentversion% GEQ %newversion% (goto:menu) else (exit)

:updatefail
echo   Update check has failed, check your internet connection and firewall settings.
@ping 127.0.0.1 -n 4 -w 1000> nul
goto:menu





::-------------------------------File Cleanup------------------------------------
:FileCleanup
cls

set cleanitems=0
if exist "%DRIVE%"\WAD SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\00000001 SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\00010008 SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\00010002 SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\00010001 SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\private\wii\title\aktn SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\apps\DOP-Mii SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\apps\MMM SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\apps\MIOSPatcher SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\apps\Priiloader SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\apps\YAWMM SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\apps\HackMii_Installer SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\apps\IOS236-v5-Mod SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\apps\SIP SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\*.dol SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\*.elf SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\*.wad SET /a cleanitems=%cleanitems%+1
if exist "%DRIVE%"\*.md5 SET /a cleanitems=%cleanitems%+1


::smash stack USA check
set path2clean=%DRIVE%\private\wii\app\rsbe\st\st_080805_0933.bin
set md5=aa93aab9bfdd25883bbd826a62645033
set nextgoto=cleancheck1
goto:markmatch
:cleancheck1
set SmashCheck=off
if /i "%match%" EQU "YES" set SmashCheck=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::PWNS USA
set path2clean=%DRIVE%\private\wii\title\rlie\data.bin
set md5=b94f40d57a4b5577eb2479f63cbe79df
set nextgoto=cleancheck2
goto:markmatch
:cleancheck2
set PWNSU=off
if /i "%match%" EQU "YES" set PWNSU=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::PWNS JAP
set path2clean=%DRIVE%\private\wii\title\rlij\data.bin
set md5=1f7e42a30492d2fa116a2fe5ebc685d1
set nextgoto=cleancheck3
goto:markmatch
:cleancheck3
set PWNSJ=off
if /i "%match%" EQU "YES" set PWNSJ=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::PWNS EURO
set path2clean=%DRIVE%\private\wii\title\rlip\data.bin
set md5=a6b8f03f49baa471228dcd81d3fd623a
set nextgoto=cleancheck4
goto:markmatch
:cleancheck4
set PWNSE=off
if /i "%match%" EQU "YES" set PWNSE=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::TWILIGHT USA
set path2clean=%DRIVE%\private\wii\title\rzde\data.bin
set md5=02639bd145730269a98f69a4fd466225
set nextgoto=cleancheck5
goto:markmatch
:cleancheck5
set TWIU=off
if /i "%match%" EQU "YES" set TWIU=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::TWILIGHT JAP
set path2clean=%DRIVE%\private\wii\title\rzdj\data.bin
set md5=b51cd6a64bc911cc5c8e41ed5d9fd8ae
set nextgoto=cleancheck6
goto:markmatch
:cleancheck6
set TWIJ=off
if /i "%match%" EQU "YES" set TWIJ=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::TWILIGHT EURO
set path2clean=%DRIVE%\private\wii\title\rzdp\data.bin
set md5=704bd625ea5b42d7ac06fc937af74d38
set nextgoto=cleancheck7
goto:markmatch
:cleancheck7
set TWIE=off
if /i "%match%" EQU "YES" set TWIE=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1


::YUGI USA
set path2clean=%DRIVE%\private\wii\title\ryoe\data.bin
set md5=0319cb55ecb1caea34e4504aa56664ab
set nextgoto=cleancheck8
goto:markmatch
:cleancheck8
set YUGIU=off
if /i "%match%" EQU "YES" set YUGIU=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::YUGI EURO
set path2clean=%DRIVE%\private\wii\title\ryop\data.bin
set md5=8e8aca85b1106932db5ec564ac5c9f0b
set nextgoto=cleancheck9
goto:markmatch
:cleancheck9
set YUGIE=off
if /i "%match%" EQU "YES" set YUGIE=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::YUGI EURO 50hz
set path2clean=%DRIVE%\private\wii\title\ryop\data.bin
set md5=fd15710a20ec01d01324c18bf4bf3921
set nextgoto=cleancheck10
goto:markmatch
:cleancheck10
::set YUGIE=off
if /i "%match%" EQU "YES" set YUGIE=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::YUGI JAP
set path2clean=%DRIVE%\private\wii\title\ryoj\data.bin
set md5=2f7dfe45a01d01cbf7672afd70b252b4
set nextgoto=cleancheck11
goto:markmatch
:cleancheck11
set YUGIJ=off
if /i "%match%" EQU "YES" set YUGIJ=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::smash stack JAP check
set path2clean=%DRIVE%\private\wii\app\RSBJ\st\st_smashstackjp.bin
set md5=9a23e5543c65ea2090c5b66a9839216a
set nextgoto=cleancheck12
goto:markmatch
:cleancheck12
set SmashJCheck=off
if /i "%match%" EQU "YES" set SmashJCheck=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::BATHAXX USA
set path2clean=%DRIVE%\private\wii\title\rlbe\data.bin
set md5=5dac3152baabbc6ca17bedfd5b7350c9
set nextgoto=cleancheck13
goto:markmatch
:cleancheck13
set BATHAXXU=off
if /i "%match%" EQU "YES" set BATHAXXU=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::BATHAXX JAP
set path2clean=%DRIVE%\private\wii\title\rlbj\data.bin
set md5=8ce86646c463565798dda77ea93118eb
set nextgoto=cleancheck14
goto:markmatch
:cleancheck14
set BATHAXXJ=off
if /i "%match%" EQU "YES" set BATHAXXJ=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::BATHAXX EURO
set path2clean=%DRIVE%\private\wii\title\rlbp\data.bin
set md5=1f44f39d7aad36c7c93a7592e52fa217
set nextgoto=cleancheck15
goto:markmatch
:cleancheck15
set BATHAXXE=off
if /i "%match%" EQU "YES" set BATHAXXE=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::ROTJ USA
set path2clean=%DRIVE%\private\wii\title\rlge\data.bin
set md5=448a3e6bfb4b6d9fafd64c45575f9cb4
set nextgoto=cleancheck16
goto:markmatch
:cleancheck16
set ROTJU=off
if /i "%match%" EQU "YES" set ROTJU=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::ROTJ JAP
set path2clean=%DRIVE%\private\wii\title\rlgj\data.bin
set md5=b64e489f15dea67b4ab8dd5315064295
set nextgoto=cleancheck17
goto:markmatch
:cleancheck17
set ROTJJ=off
if /i "%match%" EQU "YES" set ROTJJ=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::ROTJ EURO
set path2clean=%DRIVE%\private\wii\title\rlgp\data.bin
set md5=6e225b61b74bd8529374086e476487d3
set nextgoto=cleancheck18
goto:markmatch
:cleancheck18
set ROTJE=off
if /i "%match%" EQU "YES" set ROTJE=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1


::smash stack PAL check
set path2clean=%DRIVE%\private\wii\app\RSBP\st\st_smashStackPK.bin
set md5=5ce0563bbdd394d8fd3947a413d234ab
set nextgoto=cleancheck19
goto:markmatch
:cleancheck19
set SmashPCheck=off
if /i "%match%" EQU "YES" set SmashPCheck=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::smash stack PAL - No Save - check
set path2clean=%DRIVE%\private\wii\app\RSBP\st\_st_smashStackPK_noSave.bin
set md5=208e1505a426aaa4b341921f271b2b12
set nextgoto=cleancheck20
goto:markmatch
:cleancheck20
set SmashP2Check=off
if /i "%match%" EQU "YES" set SmashP2Check=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1



::smash stack KOR check
set path2clean=%DRIVE%\private\wii\app\RSBK\st\st_smashStackPK.bin
set md5=5ce0563bbdd394d8fd3947a413d234ab
set nextgoto=cleancheck21
goto:markmatch
:cleancheck21
set SmashKCheck=off
if /i "%match%" EQU "YES" set SmashKCheck=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::smash stack KOR - No Save - check
set path2clean=%DRIVE%\private\wii\app\RSBK\st\_st_smashStackPK_noSave.bin
set md5=208e1505a426aaa4b341921f271b2b12
set nextgoto=cleancheck22
goto:markmatch
:cleancheck22
set SmashK2Check=off
if /i "%match%" EQU "YES" set SmashK2Check=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1


::Eri HaKawai USA
set path2clean=%DRIVE%\private\wii\title\rt4e\data.bin
set md5=4b62b5c6e00ee8943fec265c5d53ad19
set nextgoto=cleancheck23
goto:markmatch
:cleancheck23
set TOSU=off
if /i "%match%" EQU "YES" set TOSU=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::Eri HaKawai PAL
set path2clean=%DRIVE%\private\wii\title\rt4p\data.bin
set md5=08d01800a4703ec6349c3a8d454bf8e1
set nextgoto=cleancheck24
goto:markmatch
:cleancheck24
set TOSE=off
if /i "%match%" EQU "YES" set TOSE=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

::Eri HaKawai JAP
set path2clean=%DRIVE%\private\wii\title\rt4j\data.bin
set md5=7884370e1b8960ed09ed61395007affd
set nextgoto=cleancheck25
goto:markmatch
:cleancheck25
set TOSJ=off
if /i "%match%" EQU "YES" set TOSJ=on
if /i "%match%" EQU "YES" SET /a cleanitems=%cleanitems%+1

goto:nextpage



::----mark matches-----
:markmatch
set match=
if exist "%path2clean%" (goto:checkexisting) else (goto:nocheckexisting)
:checkexisting
set match=yes
::assume match, if its not, it will change to 'no' further below
sfk md5 -quiet -verify %md5% "%path2clean%"
if errorlevel 1 set match=no
:nocheckexisting
goto:%nextgoto%


:nextpage

if /i "%cleanitems%" NEQ "0" goto:FileCleanup2

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                     FILE CLEANUP
echo.
echo.
echo                       No Unnecessary Files Exist in %DRIVE%
echo.
echo.
echo.
echo                               Returning to Main Menu...
echo.

@ping 127.0.0.1 -n 4 -w 1000> nul
goto:MENU





:FileCleanup2
set clean=
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                     FILE CLEANUP
echo.
echo                        After you are finished modding your Wii,
echo                     you can delete certain files to free up space
echo          and ensure no one can access potentially dangerous apps on your Wii.
echo.
echo          Note: Instead of deleting apps, you can move them to a Locked Folder
echo                in the HBC (downloadable via Download Page 2).
echo.
echo.
echo          Would you like to delete the following from %DRIVE%?
echo.
if exist "%DRIVE%"\WAD echo          * WAD Folder
if exist "%DRIVE%"\00000001 echo          * 00000001 Folder
if exist "%DRIVE%"\00010008 echo          * 00010008 Folder
if exist "%DRIVE%"\00010002 echo          * 00010002 Folder
if exist "%DRIVE%"\00010001 echo          * 00010001 Folder
if exist "%DRIVE%"\private\wii\title\aktn echo          * Bannerbomb
if /i "%SmashCheck%" EQU "on" echo          * Smash Stack (USA)
if /i "%SmashJCheck%" EQU "on" echo          * Smash Stack (JAP)

if /i "%SmashPCheck%" EQU "on" echo          * Smash Stack (EURO)
if /i "%SmashP2Check%" EQU "on" echo          * Smash Stack (EURO) - No Save

if /i "%SmashKCheck%" EQU "on" echo          * Smash Stack (KOR)
if /i "%SmashK2Check%" EQU "on" echo          * Smash Stack (KOR) - No Save


if /i "%PWNSU%" EQU "on" echo          * Indiana Pwns (USA)
if /i "%PWNSE%" EQU "on" echo          * Indiana Pwns (EURO)
if /i "%PWNSJ%" EQU "on" echo          * Indiana Pwns (JAP)

if /i "%BATHAXXU%" EQU "on" echo          * BATHAXX (USA)
if /i "%BATHAXXE%" EQU "on" echo          * BATHAXX (EURO)
if /i "%BATHAXXJ%" EQU "on" echo          * BATHAXX (JAP)

if /i "%ROTJU%" EQU "on" echo          * Return of the JODI (USA)
if /i "%ROTJE%" EQU "on" echo          * Return of the JODI (EURO)
if /i "%ROTJJ%" EQU "on" echo          * Return of the JODI (JAP)

if /i "%TOSU%" EQU "on" echo          * Eri HaKawai (USA)
if /i "%TOSE%" EQU "on" echo          * Eri HaKawai (EURO)
if /i "%TOSJ%" EQU "on" echo          * Eri HaKawai (JAP)

if /i "%TWIU%" EQU "on" echo          * Twilight Hack (USA)
if /i "%TWIE%" EQU "on" echo          * Twilight Hack (EURO)
if /i "%TWIJ%" EQU "on" echo          * Twilight Hack (JAP)
if /i "%YUGIU%" EQU "on" echo          * YU-GI-OWNED (USA)
if /i "%YUGIE%" EQU "on" echo          * YU-GI-OWNED (EURO)
if /i "%YUGIJ%" EQU "on" echo          * YU-GI-OWNED (JAP)
if exist "%DRIVE%"\apps\DOP-Mii echo          * apps\DOP-Mii
if exist "%DRIVE%"\apps\MMM echo          * apps\MMM
if exist "%DRIVE%"\apps\MIOSPatcher echo          * apps\MIOSPatcher
if exist "%DRIVE%"\apps\Priiloader echo          * apps\Priiloader
if exist "%DRIVE%"\apps\YAWMM echo          * apps\YAWMM
if exist "%DRIVE%"\apps\HackMii_Installer echo          * apps\HackMii_Installer
if exist "%DRIVE%"\apps\IOS236-v5-Mod echo          * apps\IOS236-v5-Mod
if exist "%DRIVE%"\apps\SIP echo          * apps\SIP
if exist "%DRIVE%"\apps\WiiExplorer echo          * apps\WiiExplorer
if exist "%DRIVE%"\*.dol echo          * dol's from root of device
if exist "%DRIVE%"\*.elf echo          * elf's from root of device
if exist "%DRIVE%"\*.wad echo          * wad's from root of device
if exist "%DRIVE%"\*.md5 echo          * md5's from root of device
echo.
echo         Note: All the above files, with the exception of custom WADs,
echo               can be retrieved again later using ModMii
echo.
echo.
echo.
echo                Y = Yes, delete files now
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
set /p clean=     Enter Selection Here: 
if /i "%clean%" EQU "Y" goto:cleannow
if /i "%clean%" EQU "N" goto:MENU
if /i "%clean%" EQU "B" goto:MENU
if /i "%clean%" EQU "M" goto:MENU
echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:FileCleanup

:cleannow
set clean2=
echo.
echo.
echo.
echo          Are you sure you want to permanently delete the above files? (Y/N)
echo.
set /p clean2=     Enter Selection Here: 
if /i "%clean2%" EQU "Y" goto:cleannow3
if /i "%clean2%" EQU "N" goto:MENU
echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:FileCleanup

:cleannow3



cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                    CLEANING FILES...
echo.
if exist "%DRIVE%"\*.dol del "%DRIVE%"\*.dol> nul
if exist "%DRIVE%"\*.elf del "%DRIVE%"\*.elf> nul
if exist "%DRIVE%"\*.wad del "%DRIVE%"\*.wad> nul
if exist "%DRIVE%"\*.md5 del "%DRIVE%"\*.md5> nul
if exist "%DRIVE%"\WAD rd /s /q "%DRIVE%"\WAD> nul
if exist "%DRIVE%"\00000001 rd /s /q "%DRIVE%"\00000001> nul
if exist "%DRIVE%"\00010008 rd /s /q "%DRIVE%"\00010008> nul
if exist "%DRIVE%"\00010002 rd /s /q "%DRIVE%"\00010002> nul
if exist "%DRIVE%"\00010001 rd /s /q "%DRIVE%"\00010001> nul
if exist "%DRIVE%"\private\wii\title\aktn rd /s /q "%DRIVE%"\private\wii\title\aktn> nul
if exist "%DRIVE%"\apps\DOP-Mii rd /s /q "%DRIVE%"\apps\DOP-Mii> nul
if exist "%DRIVE%"\apps\MMM rd /s /q "%DRIVE%"\apps\MMM> nul
if exist "%DRIVE%"\apps\MIOSPatcher rd /s /q "%DRIVE%"\apps\MIOSPatcher> nul
if exist "%DRIVE%"\apps\Priiloader rd /s /q "%DRIVE%"\apps\Priiloader> nul
if exist "%DRIVE%"\apps\YAWMM rd /s /q "%DRIVE%"\apps\YAWMM> nul
if exist "%DRIVE%"\apps\HackMii_Installer rd /s /q "%DRIVE%"\apps\HackMii_Installer> nul
if exist "%DRIVE%"\apps\IOS236-v5-Mod rd /s /q "%DRIVE%"\apps\IOS236-v5-Mod> nul
if exist "%DRIVE%"\apps\SIP rd /s /q "%DRIVE%"\apps\SIP> nul
if exist "%DRIVE%"\apps\WiiExplorer rd /s /q "%DRIVE%"\apps\WiiExplorer> nul
if exist "%DRIVE%"\private\*.zip del "%DRIVE%"\private\*.zip> nul
if exist "%DRIVE%"\private\wii\title\RYOP-50hz rd /s /q "%DRIVE%"\private\wii\title\RYOP-50hz> nul

::advanced deletions
if /i "%SmashCheck%" EQU "on" del "%DRIVE%"\private\wii\app\rsbe\st\st_080805_0933.bin> nul
if /i "%SmashJCheck%" EQU "on" del "%DRIVE%"\private\wii\app\RSBJ\st\st_smashstackjp.bin> nul

if /i "%SmashPCheck%" EQU "on" del "%DRIVE%"\private\wii\app\RSBP\st\st_smashStackPK.bin> nul
if /i "%SmashP2Check%" EQU "on" del "%DRIVE%"\private\wii\app\RSBP\st\_st_smashStackPK_noSave.bin> nul

if /i "%SmashKCheck%" EQU "on" del "%DRIVE%"\private\wii\app\RSBK\st\st_smashStackPK.bin> nul
if /i "%SmashK2Check%" EQU "on" del "%DRIVE%"\private\wii\app\RSBK\st\_st_smashStackPK_noSave.bin> nul


if /i "%PWNSU%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rlie> nul
if /i "%PWNSJ%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rlij> nul
if /i "%PWNSE%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rlip> nul

if /i "%BATHAXXU%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rlbe> nul
if /i "%BATHAXXJ%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rlbj> nul
if /i "%BATHAXXE%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rlbp> nul

if /i "%ROTJU%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rlge> nul
if /i "%ROTJJ%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rlgj> nul
if /i "%ROTJE%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rlgp> nul

if /i "%TOSU%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rt4e> nul
if /i "%TOSE%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rt4p> nul
if /i "%TOSJ%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rt4j> nul

if /i "%TWIU%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rzde> nul
if /i "%TWIE%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rzdp> nul
if /i "%TWIJ%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\rzdj> nul
if /i "%YUGIU%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\ryoe> nul
if /i "%YUGIE%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\ryop> nul
if /i "%YUGIJ%" EQU "on" rd /s /q "%DRIVE%"\private\wii\title\ryoj> nul

echo                                    FILES CLEANED
echo.
echo.
@ping 127.0.0.1 -n 3 -w 1000> nul
goto:MENU


::--------------------Wizard Settings Detected----------------
:LoadWizardSettings
set LoadWizSettings=
if not exist Wizard_Settings.bat goto:WPAGE1

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Wizard Saved Settings Detected!
echo.
echo.
echo               Would you like to load the Wizard's Saved Settings now?
echo.
echo.
echo.
echo         Note: You will be able to view and confirm the loaded settings
echo               before starting your download
echo.
echo.
echo.
echo                Y = Yes, Load Wizard_Settings.bat
echo                N = No, Continue with the Download Wizard
echo.
echo                D = Delete Wizard_Settings.bat to stop seeing this page
echo                    in the future then continue with the Download Wizard
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p LoadWizSettings=     Enter Selection Here: 


if /i "%LoadWizSettings%" EQU "B" goto:MENU
if /i "%LoadWizSettings%" EQU "M" goto:MENU

if /i "%LoadWizSettings%" NEQ "Y" goto:skip
call Wizard_Settings.bat
IF "%USBGUIDE%"=="" set USBGUIDE=n
if /i "%ThemeSelection%" EQU "Y" set ThemeSelection=r
if /i "%Mii%" EQU "Y" set MIIQ=Y
if /i "%pri%" EQU "Y" set PRIQ=Y
if /i "%H5%" EQU "Y" set RECCIOS=Y
if /i "%HM%" EQU "Y" set HMInstaller=Y
if /i "%yawmm%" EQU "Y" set yawmq=Y
if /i "%IOS236Installer%" EQU "Y" set IOS236InstallerQ=Y
goto:WPAGELAST
:skip

if /i "%LoadWizSettings%" EQU "D" del Wizard_Settings.bat
if /i "%LoadWizSettings%" EQU "D" goto:WPAGE1
if /i "%LoadWizSettings%" EQU "N" goto:WPAGE1

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:LoadWizardSettings






::...................................Wizard Page1 - Virgin?...............................
:WPAGE1
set VIRGIN=


set Advanced=
set HMInstaller=
set RECCIOS=
set yawmQ=
set PRIQ=
set protect=
set ThemeSelection=



cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo         Is your Wii a virgin?
echo.
echo.
echo               ( ie. free of softmods / un-modified / brand new / stock )
echo.
echo.
echo.
echo            Note: Answer "Yes" even if your Wii is not a virgin in order to
echo                  upgrade ALL your Wii's softmods (aka re-hack your Wii)
echo.
echo.
echo.
echo                Y = Yes, download ALL files to hack or re-hack my Wii
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p VIRGIN=     Enter Selection Here: 


if exist Wizard_Settings.bat goto:backtoloadwiz
if /i "%VIRGIN%" EQU "B" goto:MENU
:backtoloadwiz
if /i "%VIRGIN%" EQU "B" goto:LoadWizardSettings

if /i "%VIRGIN%" EQU "M" goto:MENU
if /i "%VIRGIN%" EQU "Y" goto:WPAGE2
if /i "%VIRGIN%" EQU "N" goto:WPAGE2

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE1

::...................................Wizard Page2 - Current Firmware...............................
:WPAGE2
set FIRMSTART=

set backb4HACKMIISOLUTION=WPAGE2

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if /i "%MENU1%" EQU "H" echo                                  HackMii Solutions
if /i "%MENU1%" EQU "H" echo.
echo         What is your current firmware version?
echo.
echo.
echo.
echo         Note: to check this, turn on your wii, click the Wii button in the
echo               bottom left of the main system menu, click Wii Settings,
echo               then you should see the firmware in the top right of the screen
echo               (ie. 4.2U, 4.1J, 3.2E, etc.)

if /i "%VIRGIN%" EQU "N" goto:skipnote
echo.
echo         Note: If current firmware is v2.2 or under, you may need to use an
echo               alternate exploit [ie. Twilight Hack (U/E/J), Smash Stack (U/J)
echo               or Indiana Pwns (U/E)] instead of BannerBomb.
echo.
:skipnote
echo.
echo.
echo.
echo                4.3 = 4.3
echo                4.2 = 4.2
echo                4.1 = 4.1
echo                4.0 = 4.0
echo                3.X = 3.0-3.5
echo                  O = Other (under 2.2)

echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.

set /p FIRMSTART=     Enter Selection Here: 




if /i "%FIRMSTART%" EQU "M" goto:MENU


if /i "%FIRMSTART%" EQU "4.2" goto:WPAGE3
if /i "%FIRMSTART%" EQU "4.1" goto:WPAGE3
if /i "%FIRMSTART%" EQU "4.0" goto:WPAGE3
if /i "%FIRMSTART%" EQU "3.x" set FIRMSTART=3.X
if /i "%FIRMSTART%" EQU "3.X" goto:WPAGE3
if /i "%FIRMSTART%" EQU "O" goto:WPAGE3
if /i "%FIRMSTART%" EQU "4.3" goto:WPAGE3

if /i "%MENU1%" EQU "H" goto:HACKMIIBACK

if /i "%FIRMSTART%" EQU "B" goto:WPAGE1
goto:incorrectkey

:HACKMIIBACK
if /i "%FIRMSTART%" EQU "B" goto:MENU

:incorrectkey
echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE2


::...................................Wizard Page3 - REGION...............................
:WPAGE3
if /i "%FIRMSTART%" EQU "4.3" goto:WPAGE3hard
if /i "%FIRMSTART%" EQU "o" goto:WPAGE3hard
if /i "%MENU1%" EQU "H" goto:HACKMIISOLUTION
:WPAGE3hard
set REGION=
set REGIONCHANGE=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo         What is your Region?
echo.
echo.
echo         Note: to check this, turn on your wii, click the Wii button in the
echo               bottom left of the main system menu, click Wii Settings,
echo               then you should see the firmware in the top right of the screen
echo               (ie. 4.2U, 4.1J, 3.2E, etc.)
echo.
if /i "%MENU1%" EQU "H" echo         Note: If your Wii was Region Changed choose the region you are currently on
if /i "%MENU1%" EQU "H" goto:skipmessage
echo         Note: If your Wii is Region Changed but was originally NOT Korean,
echo               choose the region you are currently on.
echo.
echo         Note: If your not sure if your Wii was originally Korean, you can check
echo               the serial number on the Wii. Korean Wii's start with "LK".
:skipmessage
echo.
echo.

echo                U = USA
echo                E = Euro (PAL)
echo                J = JAP
echo                K = Korean
if /i "%MENU1%" NEQ "H" echo               RC = Region Changed (from Korean to another region)

echo.
echo.


if /i "%FIRMSTART%" NEQ "O" goto:skipupdatewarning
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] Note to Korean Users:
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] If you perform an online update to v4.3 you will require
sfk echo -spat \x20 \x20 \x20 \x20 [Red] a Korean copy of Super Smash Bros. Brawl to softmod your Wii
echo.
:skipupdatewarning



if /i "%VIRGIN%" NEQ "Y" goto:SkipOtherRegions
if /i "%FIRMSTART%" EQU "4.3" echo.
if /i "%FIRMSTART%" EQU "4.3" echo.
if /i "%FIRMSTART%" EQU "4.3" sfk echo -spat \x20 \x20 \x20 \x20 [Red] Note to Korean Users:
if /i "%FIRMSTART%" EQU "4.3" echo.
if /i "%FIRMSTART%" EQU "4.3" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Virgin Korean 4.3 Wii's can only be softmodded
if /i "%FIRMSTART%" EQU "4.3" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] with a Korean copy of Super Smash Bros. Brawl
:SkipOtherRegions

echo.
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.

set /p REGION=     Enter Selection Here: 

if /i "%REGION%" EQU "u" set REGION=U
if /i "%REGION%" EQU "e" set REGION=E
if /i "%REGION%" EQU "j" set REGION=J
if /i "%REGION%" EQU "k" set REGION=K

if /i "%REGION%" EQU "M" goto:MENU
if /i "%REGION%" EQU "B" goto:WPAGE2
if /i "%REGION%" EQU "U" goto:WPAGE3C
if /i "%REGION%" EQU "E" goto:WPAGE3C
if /i "%REGION%" EQU "K" goto:WPAGE3C
if /i "%REGION%" EQU "J" goto:WPAGE3C

if /i "%MENU1%" EQU "H" goto:notRC
if /i "%FIRMSTART%" EQU "o" goto:notRC
if /i "%REGION%" EQU "RC" goto:WPAGE3B
:notRC

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE3

::...................................Wizard Page3B - REGION CHANGED KOREAN...............................
:WPAGE3B
set REGIONCHANGE=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo         What has your Wii's Region been changed to?
echo.
echo.
echo.
echo         Note: to check this, turn on your wii, click the Wii button in the
echo               bottom left of the main system menu, click Wii Settings,
echo               then you should see the firmware in the top right of the screen
echo               (ie. 4.2U, 4.1J, 3.2E, etc.)
echo.
echo.
echo.
echo                U = USA
echo                E = Euro (PAL)
echo                J = JAP
echo.
echo.
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p REGIONCHANGE=     Enter Selection Here: 

if /i "%REGIONCHANGE%" EQU "u" set REGIONCHANGE=U
if /i "%REGIONCHANGE%" EQU "e" set REGIONCHANGE=E
if /i "%REGIONCHANGE%" EQU "j" set REGIONCHANGE=J

if /i "%REGIONCHANGE%" EQU "M" goto:MENU
if /i "%REGIONCHANGE%" EQU "B" goto:WPAGE3
if /i "%REGIONCHANGE%" EQU "U" goto:WPAGE3C
if /i "%REGIONCHANGE%" EQU "E" goto:WPAGE3C
if /i "%REGIONCHANGE%" EQU "J" goto:WPAGE3C

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE3b







::...................................Wizard Page3C - Exploit...............................
:WPAGE3C

SET EXPLOIT=default
set exploitselection=
if /i "%VIRGIN%" EQU "N" goto:WPAGE3D

if /i "%FIRMSTART%" EQU "4.3" goto:WPAGE3Cnext
if /i "%FIRMSTART%" EQU "o" goto:WPAGE3CnextLATER


goto:WPAGE4


::Only virgin 4.3 U/E/J wii's or <2.2 U/E/J Wii's will make it this far
:WPAGE3Cnext


::VIRGIN Korean 4.3 Wii's auto-select smashstack
if /i "%REGION%" EQU "K" set EXPLOIT=?
::this is so "B" works when selecting new firmware
if /i "%REGION%" EQU "K" set exploitselection=yes
if /i "%REGION%" EQU "K" goto:WPAGE3D

:WPAGE3CnextLATER

set backb4HACKMIISOLUTION=WPAGE3c


set exploitselection=yes

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if /i "%MENU1%" NEQ "H" echo      You must own, rent, or borrow one of the following games to mod your Wii
if /i "%MENU1%" EQU "H" echo      If your homebrew channel can't load apps properly, you must own, rent,
if /i "%MENU1%" EQU "H" echo      or borrow one of the following two games to fix the problem.
echo.
echo      Select the game you wish to use:
echo.
echo.
echo.
echo.
echo                S = Super Smash Brothers Brawl
if /i "%REGION%" NEQ "K" echo                L = LEGO Indiana Jones
if /i "%REGION%" NEQ "K" echo               LB = LEGO Batman
if /i "%REGION%" NEQ "K" echo               LS = LEGO Star Wars
if /i "%REGION%" NEQ "K" echo                Y = Yu-Gi-Oh! 5D's
if /i "%REGION%" NEQ "K" echo              TOS = Tales of Symphonia: Dawn of the New World


if /i "%FIRMSTART%" EQU "o" echo                T = Twilight Princess: The Legend of Zelda
if /i "%FIRMSTART%" EQU "o" echo.
echo                ? = If you're not sure, download all of the above and decide later
echo.
echo.
echo.
echo.


if /i "%FIRMSTART%" NEQ "o" goto:skipOmsg
sfk echo -spat \x20 [Red] Important Notes:
echo.


echo    Alternatively, you can update your Wii to v3.0-4.2 using a DISC (ie. NSMBW)
echo    then repeat the Download Wizard using your new Firmware in order to hack your
echo    Wii without requiring one of the above games
echo.
echo.

sfk echo -spat \x20 [Red] WARNING: Online update to v4.3 will require one of the above games
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 [Red] (except Twilight Princess) to mod your Wii

echo.
echo.

:skipOmsg

echo.
echo.
echo.
echo.
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p EXPLOIT=     Enter Selection Here: 

if /i "%EXPLOIT%" EQU "M" goto:MENU

if /i "%REGION%" EQU "RC" goto:backtowpage3b
if /i "%EXPLOIT%" EQU "B" goto:WPAGE3
:backtowpage3b
if /i "%EXPLOIT%" EQU "B" goto:WPAGE3B

if /i "%FIRMSTART%" NEQ "o" goto:twilightnotavailable
if /i "%EXPLOIT%" EQU "T" goto:WPAGE3D
:twilightnotavailable


if /i "%REGION%" EQU "U" goto:skip
if /i "%REGIONCHANGE%" EQU "U" goto:skip
goto:notU
:skip
:notU

if /i "%REGION%" EQU "E" goto:skip
if /i "%REGIONCHANGE%" EQU "E" goto:skip
goto:notE
:skip
:notE

if /i "%REGION%" EQU "J" goto:skip
if /i "%REGIONCHANGE%" EQU "J" goto:skip
goto:notJ
:skip
:notJ


::ALL except KOR
if /i "%REGION%" EQU "K" goto:skip

if /i "%EXPLOIT%" EQU "Y" goto:WPAGE3D
if /i "%EXPLOIT%" EQU "L" goto:WPAGE3D
if /i "%EXPLOIT%" EQU "LB" goto:WPAGE3D
if /i "%EXPLOIT%" EQU "LS" goto:WPAGE3D
if /i "%EXPLOIT%" EQU "TOS" goto:WPAGE3D
:skip
if /i "%EXPLOIT%" EQU "?" goto:WPAGE3D
if /i "%EXPLOIT%" EQU "S" goto:WPAGE3D



echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE3C





::...................................Wizard Page3C - Exploit...............................
:WPAGE3D
if /i "%MENU1%" EQU "H" goto:HACKMIISOLUTION
SET UpdatesIOSQ=

if /i "%FIRMSTART%" LSS "4.3" goto:WPAGE4
if /i "%FIRMSTART%" EQU "o" goto:WPAGE4
if /i "%ACTIVEIOS%" EQU "off" goto:WPAGE4

::Only 4.3 Wii's without active IOS "ON" will make it this far

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Would you like to download active IOSs?
echo.
echo.
echo.
echo      N = No
echo.
echo      You're on System Menu 4.3, so you likely already have the latest IOSs.
echo      If your Wii has truly never been modified before, you can say No.
echo.
echo.
echo      Y = Yes
echo.
echo      If your Wii has DarkCorp/cIOSCorp installed, you can say Yes to overwrite it.
echo      If original Wii discs or WiiWare are not working properly, say Yes to fix it.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p UpdatesIOSQ=     Enter Selection Here: 

if /i "%UpdatesIOSQ%" EQU "M" goto:MENU
if /i "%UpdatesIOSQ%" EQU "Y" goto:WPAGE4
if /i "%UpdatesIOSQ%" EQU "N" goto:WPAGE4


::if /i "%REGION%" EQU "RC" goto:backtowpage3b
if /i "%VIRGIN%" EQU "N" goto:backtowpage3
if /i "%REGION%" EQU "K" goto:backtowpage3

if /i "%UpdatesIOSQ%" EQU "B" goto:WPAGE3C

:backtowpage3
if /i "%REGION%" EQU "RC" goto:backtowpage3b
if /i "%UpdatesIOSQ%" EQU "B" goto:WPAGE3

:backtowpage3b
if /i "%UpdatesIOSQ%" EQU "B" goto:wpage3B



echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE3D











::...................................Wizard Page4 - New Firmware...............................
:WPAGE4
if /i "%MENU1%" EQU "H" goto:HACKMIISOLUTION
set FIRM=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo         Select the new firmware you would like to upgrade/downgrade to.
echo.
echo.
echo.
echo         Note: if current firmware = new firmware, a system menu is not downloaded
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 [Red] Warning:[def] installing firmware below 4.0 on boot2v4 wii's results in Brick.
echo             But, Yet Another Wad Manager (YAWMM) or MMM will not permit you to
echo             (un)install anything that will brick you.
echo             You can manually check your boot2 version using MMM, DOP-Mii or Bootmii.
echo.
echo.
echo.

::if /i "%FIRMSTART%" NEQ "4.3" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] 4.3 = 4.3 [NOT RECOMMENDED]) else (echo                4.3 = 4.3)

if /i "%FIRMSTART%" EQU "4.3" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 4.3 = 4.3 [RECOMMENDED]) else (echo                4.3 = 4.3)

if /i "%FIRMSTART%" EQU "4.2" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 4.2 = 4.2 [RECOMMENDED]) else (echo                4.2 = 4.2)

if /i "%FIRMSTART%" EQU "4.3" goto:SkipGreen4.1
if /i "%FIRMSTART%" EQU "4.2" goto:SkipGreen4.1

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 4.1 = 4.1 [RECOMMENDED]
goto:skipWhite4.1


:SkipGreen4.1
echo                4.1 = 4.1

:skipWhite4.1


echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p FIRM=     Enter Selection Here: 

if /i "%FIRM%" EQU "M" goto:MENU

if /i "%FIRM%" EQU "4.2" goto:WPAGE5
if /i "%FIRM%" EQU "4.1" goto:WPAGE5
if /i "%FIRM%" EQU "4.3" goto:WPAGE5



if /i "%REGION%" EQU "RC" goto:backtowpage3b
if /i "%exploitselection%" EQU "yes" goto:backtoExploits
if /i "%VIRGIN%" EQU "N" goto:backtoExploits

if /i "%FIRM%" EQU "B" goto:wpage3

:backtoExploits
if /i "%ACTIVEIOS%" EQU "off" goto:backtowpage3c
if /i "%FIRMSTART%" EQU "o" goto:backtowpage3c
if /i "%FIRMSTART%" NEQ "4.3" goto:backtowpage3b
if /i "%FIRM%" EQU "B" goto:wpage3D

:backtowpage3c
if /i "%FIRM%" EQU "B" goto:wpage3C

:backtowpage3b
if /i "%FIRM%" EQU "B" goto:wpage3

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE4

::...................................Wizard Page5 - MORE Channels?...............................
:WPAGE5
set MORE=
set PIC=
set NET=
set Weather=
set NEWS=
set MIIQ=
set Shop=
set Speak=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Would you like to download any of the following channels:
echo.
echo.
echo.
echo           * Photo
if /i "%REGION%" NEQ "K" echo           * Internet
if /i "%REGION%" NEQ "K" echo           * Weather
if /i "%REGION%" NEQ "K" echo           * News
echo           * Mii
echo           * Shopping
if /i "%REGION%" NEQ "K" echo           * Wii Speak
echo.
echo.
echo.
echo                A = All
echo                S = Some
echo                N = None
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p MORE=     Enter Selection Here: 

if /i "%MORE%" EQU "M" goto:MENU

if /i "%MENU1%" EQU "S" goto:forsneeknand
if /i "%MORE%" EQU "B" goto:WPAGE4
if /i "%MORE%" EQU "N" goto:WPAGE13

:forsneeknand
if /i "%MORE%" EQU "B" goto:WPAGE20
if /i "%MORE%" EQU "A" set B4SNKCONFIRM=WPAGE5
if /i "%MORE%" EQU "N" set B4SNKCONFIRM=WPAGE5
if /i "%MORE%" EQU "N" goto:SNKNANDCONFIRM

if /i "%MORE%" EQU "S" goto:WPAGE6
if /i "%MORE%" EQU "A" goto:WPAGE6

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE5




::...................................Wizard Page6 - Photo Channel...............................
:WPAGE6

if /i "%MORE%" EQU "A" set PIC=Y
if /i "%MORE%" EQU "A" goto:WPAGE7

set PIC=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Download Photo Channel?
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p PIC=     Enter Selection Here: 

if /i "%PIC%" EQU "Y" goto:WPAGE7
if /i "%PIC%" EQU "N" goto:WPAGE7
if /i "%PIC%" EQU "M" goto:MENU
if /i "%PIC%" EQU "B" goto:WPAGE5

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE6



::...................................Wizard Page7 - Internet?...............................
:WPAGE7

if /i "%REGION%" EQU "K" goto:WPAGE10

if /i "%MORE%" EQU "A" set NET=Y
if /i "%MORE%" EQU "A" goto:WPAGE8

set NET=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Download Internet Channel?
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p NET=     Enter Selection Here: 

if /i "%NET%" EQU "Y" goto:WPAGE8
if /i "%NET%" EQU "N" goto:WPAGE8
if /i "%NET%" EQU "M" goto:MENU
if /i "%NET%" EQU "B" goto:WPAGE6

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE7



::...................................Wizard Page8 - Weather...............................
:WPAGE8

if /i "%MORE%" EQU "A" set Weather=Y
if /i "%MORE%" EQU "A" goto:WPAGE9

set Weather=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Download Weather Channel?
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p WEATHER=     Enter Selection Here: 

if /i "%WEATHER%" EQU "Y" goto:WPAGE9
if /i "%WEATHER%" EQU "N" goto:WPAGE9
if /i "%WEATHER%" EQU "M" goto:MENU
if /i "%WEATHER%" EQU "B" goto:WPAGE7

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE8

::...................................Wizard Page9 - NEWS...............................
:WPAGE9

if /i "%MORE%" EQU "A" set NEWS=Y
if /i "%MORE%" EQU "A" goto:WPAGE10

set NEWS=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Download News Channel?
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p NEWS=     Enter Selection Here: 

if /i "%NEWS%" EQU "Y" goto:WPAGE10
if /i "%NEWS%" EQU "N" goto:WPAGE10
if /i "%NEWS%" EQU "M" goto:MENU
if /i "%NEWS%" EQU "B" goto:WPAGE8

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE9

::...................................Wizard Page10 - Mii...............................
:WPAGE10

if /i "%MORE%" EQU "A" set MIIQ=Y
if /i "%MORE%" EQU "A" goto:WPAGE11

set MIIQ=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Download Mii Channel?
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p MIIQ=     Enter Selection Here: 

if /i "%MIIQ%" EQU "Y" goto:WPAGE11
if /i "%MIIQ%" EQU "N" goto:WPAGE11
if /i "%MIIQ%" EQU "M" goto:MENU

if /i "%REGION%" EQU "K" goto:Koreanbacktophoto
if /i "%MIIQ%" EQU "B" goto:WPAGE9

:Koreanbacktophoto
if /i "%MIIQ%" EQU "B" goto:WPAGE6

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE10

::...................................Wizard Page11 - Shop...............................
:WPAGE11

if /i "%MORE%" EQU "A" set Shop=Y
if /i "%MORE%" EQU "A" goto:WPAGE12

set Shop=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Download Shopping Channel?
if /i "%MENU1%" NEQ "S" echo.
if /i "%MENU1%" NEQ "S" echo.
if /i "%MENU1%" NEQ "S" echo.
if /i "%MENU1%" NEQ "S" echo          Note: IOS56 will also be downloaded
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p SHOP=     Enter Selection Here: 

if /i "%Shop%" EQU "Y" goto:WPAGE12
if /i "%Shop%" EQU "N" goto:WPAGE12
if /i "%Shop%" EQU "M" goto:MENU
if /i "%Shop%" EQU "B" goto:WPAGE10

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE11


::...................................Wizard Page12 - Speak...............................
:WPAGE12
if /i "%REGION%" EQU "K" goto:WPAGE13

if /i "%MORE%" EQU "A" set Speak=Y
if /i "%MORE%" EQU "A" goto:WPAGE13

set Speak=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Download Wii Speak Channel?
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p Speak=     Enter Selection Here: 

if /i "%Speak%" EQU "Y" goto:WPAGE13
if /i "%Speak%" EQU "N" goto:WPAGE13
if /i "%Speak%" EQU "M" goto:MENU
if /i "%Speak%" EQU "B" goto:WPAGE11

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE12



::...................................Wizard Page13 - MORE Advanced Channels?...............................
:WPAGE13
if /i "%VIRGIN%" EQU "Y" goto:WPAGE19B
if /i "%MENU1%" EQU "S" set B4SNKCONFIRM=WPAGE12
if /i "%MORE%" EQU "A" set B4SNKCONFIRM=WPAGE5
if /i "%MENU1%" EQU "S" goto:SNKNANDCONFIRM

set Advanced=
set HMInstaller=
set RECCIOS=
set yawmQ=
set PRIQ=
set protect=
set ThemeSelection=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Would you like to download any of the following:
echo.
echo.
echo. 
if /i "%FIRMSTART%" EQU "3.X" echo           * HackMii Installer and BannerBomb v1 (with IOS58)
if /i "%FIRMSTART%" EQU "4.0" echo           * HackMii Installer and BannerBomb v1 (with IOS58)
if /i "%FIRMSTART%" EQU "4.1" echo           * HackMii Installer and BannerBomb v1 (with IOS58)
if /i "%FIRMSTART%" EQU "4.2" echo           * HackMii Installer and BannerBomb v2 (with IOS58)
if /i "%REGION%" EQU "K" goto:Korean2.2NoExploit
if /i "%FIRMSTART%" EQU "o" echo           * HackMii Installer with IOS58 and all available exploits
:Korean2.2NoExploit

if /i "%FIRMSTART%" NEQ "4.3" goto:skip4.3extra

echo           * Download HackMii Installer with IOS58 and all available exploits?


:skip4.3extra
echo.

if /i "%CMIOSOPTION%" EQU "on" (echo           * Recommended cIOSs and cMIOS) else (echo           * Recommended cIOSs)


echo.
echo           * Yet Another Wad Manager Mod (YAWMM)
echo.
echo           * IOS236 Installer and Simple IOS Patcher
echo             with IOS36v3351 for installing a patched IOS236
echo.
echo           * Priiloader v0.7 (236 Mod) (with hacks_hash.ini)
echo.
echo           * Extra Brick Protection
echo.
echo           * A System Menu Theme
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p Advanced=     Enter Selection Here: 

if /i "%Advanced%" EQU "M" goto:MENU

if /i "%MORE%" EQU "N" goto:BACK2MORE
if /i "%MORE%" EQU "A" goto:BACK2MORE

if /i "%REGION%" EQU "K" goto:BACK2WPAGE11
if /i "%Advanced%" EQU "B" goto:WPAGE12

:BACK2MORE
if /i "%Advanced%" EQU "B" goto:WPAGE5

:BACK2WPAGE11
if /i "%Advanced%" EQU "B" goto:WPAGE11

if /i "%Advanced%" EQU "Y" goto:WPAGE13B
if /i "%Advanced%" EQU "N" goto:WPAGELAST

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE13


::...................................Wizard Page13B - HAckMii Installer...............................
:WPAGE13B


set HMInstaller=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if /i "%FIRMSTART%" EQU "3.X" echo      Download HackMii Installer and BannerBomb v1 (with IOS58)?
if /i "%FIRMSTART%" EQU "4.0" echo      Download HackMii Installer and BannerBomb v1 (with IOS58)?
if /i "%FIRMSTART%" EQU "4.1" echo      Download HackMii Installer and BannerBomb v1 (with IOS58)?
if /i "%FIRMSTART%" EQU "4.2" echo      Download HackMii Installer and BannerBomb v2 (with IOS58)?
if /i "%FIRMSTART%" EQU "o" echo      Download HackMii Installer with IOS58 and all available exploits?

if /i "%FIRMSTART%" NEQ "4.3" goto:skip4.3extra

echo      Download HackMii Installer with IOS58 and all available exploits

:skip4.3extra
echo.
echo.
echo.
echo    Note: The Hackmii Installer can install the Homebrew Channel and/or Bootmii
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p HMInstaller=     Enter Selection Here: 

if /i "%HMInstaller%" EQU "Y" goto:WPAGE14
if /i "%HMInstaller%" EQU "N" goto:WPAGE14
if /i "%HMInstaller%" EQU "M" goto:MENU
if /i "%HMInstaller%" EQU "B" goto:WPAGE13



echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE13B


::...................................Wizard Page14 - cIOSs and cMIOSs...............................
:WPAGE14
set RECCIOS=

set d2x-beta-rev=6
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if /i "%CMIOSOPTION%" EQU "on" (echo      Download the following recommended cIOSs and cMIOS?) else (echo      Download the following recommended cIOSs?)
echo.
echo.
echo.
echo          *cIOS202[57]-v5.wad
echo.
echo          *cIOS222[38]-v5.wad
echo.
echo          *cIOS223[37-38]-v4.wad
echo.
echo          *cIOS224[57]-v5.wad
echo.
echo          *cIOS249[56]-d2x-v%d2x-beta-rev%.wad
echo.
echo          *cIOS250[57]-d2x-v%d2x-beta-rev%.wad
echo.
if /i "%CMIOSOPTION%" EQU "off" goto:quickskip
echo          *RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2.wad
:quickskip
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p RECCIOS=     Enter Selection Here: 

if /i "%RECCIOS%" EQU "Y" goto:WPAGE17
if /i "%RECCIOS%" EQU "N" goto:WPAGE17
if /i "%RECCIOS%" EQU "M" goto:MENU


if /i "%RECCIOS%" EQU "B" goto:WPAGE13B

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE14

::...................................Wizard Page15 and 16 removed...............................


::...................................Wizard Page17 - YAWMM...............................
:WPAGE17
set yawmQ=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Download Yet Another Wad Manager Mod (YAWMM)?
echo.
echo.
echo.
echo      Note: Other Wad Managers may not be compatible with cIOSs with non-IOS38 base
echo            If you're not using YAWMM as your main wad manager, you're missing out.
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p yawmQ=     Enter Selection Here: 

if /i "%yawmQ%" EQU "Y" goto:WPAGE18
if /i "%yawmQ%" EQU "N" goto:WPAGE18
if /i "%yawmQ%" EQU "M" goto:MENU
if /i "%yawmQ%" EQU "B" goto:WPAGE14

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE17


::...................................Wizard Page18 - IOS236 Installer...............................
:WPAGE18
set IOS236InstallerQ=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Download IOS236 Installer and Simple IOS Patcher (with IOS36v3351)?
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p IOS236InstallerQ=     Enter Selection Here: 

if /i "%IOS236InstallerQ%" EQU "Y" goto:WPAGE19
if /i "%IOS236InstallerQ%" EQU "N" goto:WPAGE19
if /i "%IOS236InstallerQ%" EQU "M" goto:MENU
if /i "%IOS236InstallerQ%" EQU "B" goto:WPAGE17



echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE18

::...................................Wizard Page19 - Priiloader...............................
:WPAGE19
set PRIQ=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Download Priiloader?
echo.
echo.
echo.
echo      Note: Multi-Mod Manager and Hacks.ini will also be downloaded
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.

set /p PRIQ=     Enter Selection Here: 

if /i "%PRIQ%" EQU "Y" goto:WPAGE19B
if /i "%PRIQ%" EQU "N" goto:WPAGE19B
if /i "%PRIQ%" EQU "M" goto:MENU

if /i "%PRIQ%" EQU "B" goto:WPAGE18

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE19


::...................................Wizard Page19B - Extra Brick Protection...............................
:WPAGE19B
set protect=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Download Extra Brick Protection?
echo.
echo.
echo   This will download the following System Menu IOSs which will protect all Wii's
echo   (even newer LU64 Wii's) from bricking in the event of 'accidental' up/downgrading.
echo.
echo      * IOS11v16174(IOS60v6174[FS-ES-NP]) - IOS11 required for SMv2.0-2.1
echo      * IOS20v16174(IOS60v6174[FS-ES-NP]) - IOS20 required for SMv2.2
echo      * IOS30v16174(IOS60v6174[FS-ES-NP]) - IOS30 required for SMv3.0-3.3
if /i "%REGION%" EQU "K" echo      * IOS40v16174(IOS60v6174[FS-ES-NP]) - IOS40 required for SMv3.3K
echo      * IOS50v14889(IOS50v4889[FS-ES-NP]) - IOS50 required for SMv3.4
if /i "%REGION%" EQU "K" echo      * IOS52v15661(IOS52v5661[FS-ES-NP]) - IOS52 required for SMv3.5K

echo      * IOS60v16174(IOS60v6174[FS-ES-NP]) - IOS60 required for SMv4.0-4.1

if /i "%REGION%" NEQ "RC" echo      * IOS70v16687(IOS70v6687[FS-ES-NP]) - IOS70 required for SMv4.2
if /i "%REGION%" EQU "RC" echo      * IOS70v16174(IOS60v6174[FS-ES-NP]) - IOS70 required for SMv4.2


echo      * USB-Loader Forwarder Channel
echo.
echo       You should always have at least one forwarder channel installed on your Wii,
echo       that way, in the event of accidental update, you'll be able to rehack your Wii
echo       without relying on an exploit requiring a specific Wii Game.


if /i "%REGION%" EQU "RC" echo.
if /i "%REGION%" EQU "RC" echo  Note: IOS80v16174(IOS60v6174[FS-ES-NP]) will be downloaded even if you answer no
if /i "%REGION%" EQU "RC" echo        to protect against 003 Bricks


echo.
echo.
echo     NOTES:
echo.
echo     -Version numbers have been increased to survive official updates.
echo.
echo     -With the exception of the USB-Loader Forwarder Channel,
echo      Installing these will NOT reduce the amount of memory your Wii
echo      has for Channels or Game Saves.
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p protect=     Enter Selection Here: 

if /i "%protect%" EQU "Y" goto:WPAGE20
if /i "%protect%" EQU "N" goto:WPAGE20
if /i "%protect%" EQU "M" goto:MENU


if /i "%Advanced%" EQU "Y" goto:Back2PRI
if /i "%Advanced%" EQU "N" goto:Back2Advanced2
if /i "%MORE%" EQU "N" goto:Back2MORE2
if /i "%MORE%" EQU "A" goto:Back2MORE2
if /i "%REGION%" EQU "K" goto:Back2SHOP2
if /i "%MORE%" EQU "S" goto:Back2Speak2


:BACK2PRI
if /i "%protect%" EQU "B" goto:WPAGE19

:BACK2ADVANCED2
if /i "%protect%" EQU "B" goto:WPAGE13

:BACK2SPEAK2
if /i "%protect%" EQU "B" goto:WPAGE12

:Back2SHOP2
if /i "%protect%" EQU "B" goto:WPAGE11

:BACK2MORE2
if /i "%protect%" EQU "B" goto:WPAGE5


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE19B



::...................................Wizard Page20 - Theme Selection...............................
:WPAGE20
set ThemeSelection=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.

if /i "%MENU1%" NEQ "S" goto:quickskip
echo                                  SNEEK NAND BUILDER
echo.
echo.
:quickskip

echo      Would you like to install a custom Theme on your Wii?
echo.
echo.
echo.
echo                R = DarkWii Red Theme
echo             WWWR = View DarkWii Red Theme on youtube
echo.
echo.
echo                G = DarkWii Green Theme
echo             WWWG = View DarkWii Green Theme on youtube
echo.
echo.
echo                N = No, I want the same old boring, boring System Menu
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p ThemeSelection=     Enter Selection Here: 

if /i "%ThemeSelection%" EQU "M" goto:MENU
if /i "%ThemeSelection%" EQU "WWWR" (start www.youtube.com/watch?v=qFliF-K-epM)&&(goto:WPAGE20)
if /i "%ThemeSelection%" EQU "WWWG" (start http://www.youtube.com/watch?v=Rn0CnTo5kRI)&&(goto:WPAGE20)

if /i "%MENU1%" EQU "S" goto:forsneeknand
if /i "%ThemeSelection%" EQU "B" goto:WPAGE19B
if /i "%ThemeSelection%" EQU "R" goto:WPAGE21
if /i "%ThemeSelection%" EQU "G" goto:WPAGE21
if /i "%ThemeSelection%" EQU "N" goto:WPAGE21

:forsneeknand
if /i "%ThemeSelection%" EQU "B" goto:SNKPAGE5
if /i "%ThemeSelection%" EQU "R" goto:WPAGE5
if /i "%ThemeSelection%" EQU "G" goto:WPAGE5
if /i "%ThemeSelection%" EQU "N" goto:WPAGE5


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE20


::...................................Wizard Page21 - Theme Selection...............................
:WPAGE21
set USBGUIDE=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Would you like to set up a USB-Loader now?
echo.
echo.
echo      Notes
echo      =====
echo.
echo      * A USB-Loader allows the Wii to play games off an external Hard Drive.
echo.
echo      * This step can always be done by itself later on from ModMii's Main Menu.
echo.
echo.
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p USBGUIDE=     Enter Selection Here: 

if /i "%USBGUIDE%" EQU "M" goto:MENU

if /i "%USBGUIDE%" EQU "B" goto:WPAGE20
if /i "%USBGUIDE%" EQU "Y" goto:UPAGE1
if /i "%USBGUIDE%" EQU "N" goto:WPAGELAST

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE21


::...................................Wizard Last Page - Confirmation...............................
:WPAGELAST

set WLAST=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Are these settings correct?
echo.
echo.
echo.
if /i "%VIRGIN%" EQU "Y" echo           * Wii is currently a virgin (un-modified)
if /i "%VIRGIN%" EQU "N" echo           * Wii is already modified
if /i "%REGION%" EQU "RC" goto:RCSTATUS
if /i "%FIRMSTART%" NEQ "o" echo           * Current firmware is %FIRMSTART%%REGION%
if /i "%FIRMSTART%" EQU "o" echo           * Current firmware is less than 2.2%REGION%

echo           * Desired firmware is %FIRM%%REGION%
goto:noRCSTATUS
:RCSTATUS


if /i "%FIRMSTART%" NEQ "o" echo           * Wii is Korean but has previously been region changed to %FIRMSTART%%REGIONCHANGE%
if /i "%FIRMSTART%" EQU "o" echo           * Wii is Korean but has previously been region changed to %REGIONCHANGE%
echo           * Desired firmware is %FIRM%%REGIONCHANGE%

:noRCSTATUS
echo.
if /i "%PIC%" EQU "Y" echo           * Download Photo Channel
if /i "%NET%" EQU "Y" echo           * Download Internet Channel
if /i "%WEATHER%" EQU "Y" echo           * Download Weather Channel
if /i "%NEWS%" EQU "Y" echo           * Download News Channel
if /i "%MIIQ%" EQU "Y" echo           * Download Mii Channel
if /i "%Shop%" EQU "Y" echo           * Download Shopping Channel (and IOS56)
if /i "%Speak%" EQU "Y" echo           * Download Wii Speak Channel
echo.

if /i "%HMInstaller%" NEQ "Y" goto:skip4.3extra
if /i "%FIRMSTART%" EQU "3.X" echo           * Download HackMii Installer and BannerBomb v1 (with IOS58)
if /i "%FIRMSTART%" EQU "4.0" echo           * Download HackMii Installer and BannerBomb v1 (with IOS58)
if /i "%FIRMSTART%" EQU "4.1" echo           * Download HackMii Installer and BannerBomb v1 (with IOS58)
if /i "%FIRMSTART%" EQU "4.2" echo           * Download HackMii Installer and BannerBomb v2 (with IOS58)
if /i "%FIRMSTART%" EQU "o" echo           * Download HackMii Installer with IOS58 and all available exploits

if /i "%FIRMSTART%" NEQ "4.3" goto:skip4.3extra

echo           * Download HackMii Installer with IOS58 and all available exploits


:skip4.3extra


if /i "%RECCIOS%" NEQ "Y" goto:smallskip
if /i "%CMIOSOPTION%" EQU "on" (echo           * Download recommended cIOSs and cMIOS) else (echo           * Download recommended cIOSs)
:smallskip



if /i "%yawmQ%" EQU "Y" echo           * Download Yet Another Wad Manager Mod (YAWMM)

if /i "%IOS236InstallerQ%" NEQ "Y" goto:skip
echo           * Download IOS236 Installer and Simple IOS Patcher
echo             with IOS36v3351 for installing a patched IOS236
:skip


if /i "%PRIQ%" EQU "Y" echo           * Download Priiloader
if /i "%protect%" EQU "Y" echo           * Download Extra Brick Protection

if /i "%ThemeSelection%" EQU "R" echo           * Install Dark Wii Red Theme
if /i "%ThemeSelection%" EQU "G" echo           * Install Dark Wii Green Theme

::---------
if /i "%USBGUIDE%" NEQ "Y" goto:skipusb
echo.

if /i "%FORMAT%" EQU "1" set FORMATNAME=FAT32
if /i "%FORMAT%" EQU "2" set FORMATNAME=NTFS
if /i "%FORMAT%" EQU "3" set FORMATNAME=Part FAT32 and Part NTFS
if /i "%FORMAT%" EQU "4" set FORMATNAME=WBFS
if /i "%FORMAT%" EQU "5" set FORMATNAME=Part FAT32 and Part WBFS

if /i "%FORMAT%" EQU "4" goto:skip
if /i "%FORMAT%" EQU "5" goto:skip
echo           * External Hard Drive to be Formatted as %FORMATNAME%
goto:skip2
:skip
echo           * External Hard Drive already Formatted as %FORMATNAME%
:skip2

if /i "%LOADER%" EQU "CFG" echo           * Download Configurable USB-Loader
if /i "%LOADER%" EQU "FLOW" echo           * Download WiiFlow
if /i "%LOADER%" EQU "ALL" echo           * Download Configurable USB-Loader and WiiFlow
if /i "%USBCONFIG%" EQU "USB" echo           * USB-Loader Settings and config files saved to USB Hard Drive
if /i "%USBCONFIG%" NEQ "USB" echo           * USB-Loader Settings and config files saved to SD Card


:skipusb


echo.
echo.
echo.
if /i "%LoadWizSettings%" EQU "Y" goto:skip
echo                S = Save Wizard Settings For Future Use
if exist Wizard_Settings.bat echo                    Existing Wizard_Settings.bat will be renamed
echo.
:skip
echo                Y = Yes
echo                N = No / Main Menu
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p WLAST=     Enter Selection Here: 

if /i "%LoadWizSettings%" EQU "Y" goto:skip
if /i "%WLAST%" EQU "S" goto:SaveWizardSettings
:skip
if /i "%WLAST%" EQU "Y" set BACKB4DRIVE=WPAGELAST
if /i "%WLAST%" EQU "Y" goto:DriveChange
if /i "%WLAST%" EQU "N" goto:Menu
if /i "%WLAST%" EQU "M" goto:MENU
if /i "%Advanced%" EQU "N" goto:Back2Advanced
if /i "%Advanced%" EQU "Y" goto:Back2PROTECT
if /i "%MORE%" EQU "N" goto:Back2PROTECT
if /i "%MORE%" EQU "S" goto:Back2PROTECT
if /i "%USBGUIDE%" EQU "Y" goto:backtoUpage2

:BACK2ADVANCED
if /i "%WLAST%" EQU "B" goto:WPAGE13

:BACK2SPEAK
if /i "%WLAST%" EQU "B" goto:WPAGE12

:BACK2PROTECT
if /i "%WLAST%" EQU "B" goto:WPAGE21

:backtoUpage2
if /i "%WLAST%" EQU "B" goto:UPAGE2

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGELAST



::-------------Save Wizard Settings:-------------------
:SaveWizardSettings

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.

set countwiz=0

:renameWIZARDsettings
if not exist Wizard_Settings.bat goto:skip
SET /a countwiz=%countwiz%+1
if exist Wizard_Settings%countwiz%.bat goto:renameWIZARDsettings
move Wizard_Settings.bat Wizard_Settings%countwiz%.bat
:skip


echo ::ModMii v%currentversion% - Wizard Settings - %DATE% - %TIME% >> Wizard_Settings.bat
echo set VIRGIN=%VIRGIN%>> Wizard_Settings.bat
echo set REGION=%REGION%>> Wizard_Settings.bat
echo set FIRMSTART=%FIRMSTART%>> Wizard_Settings.bat
echo set FIRM=%FIRM%>> Wizard_Settings.bat
echo set REGIONCHANGE=%REGIONCHANGE%>> Wizard_Settings.bat
echo set PIC=%PIC%>> Wizard_Settings.bat
echo set NET=%NET%>> Wizard_Settings.bat
echo set WEATHER=%WEATHER%>> Wizard_Settings.bat
echo set NEWS=%NEWS%>> Wizard_Settings.bat
echo set MIIQ=%MIIQ%>> Wizard_Settings.bat
echo set Shop=%Shop%>> Wizard_Settings.bat
echo set Speak=%Speak%>> Wizard_Settings.bat
echo set HMInstaller=%HMInstaller%>> Wizard_Settings.bat
echo set yawmQ=%yawmQ%>> Wizard_Settings.bat
echo set IOS236InstallerQ=%IOS236InstallerQ%>> Wizard_Settings.bat
echo set PRIQ=%PRIQ%>> Wizard_Settings.bat
echo set protect=%protect%>> Wizard_Settings.bat
echo set ThemeSelection=%ThemeSelection%>> Wizard_Settings.bat
echo set EXPLOIT=%EXPLOIT%>> Wizard_Settings.bat
echo set MORE=%MORE%>> Wizard_Settings.bat
echo set ADVANCED=%ADVANCED%>> Wizard_Settings.bat
echo set UpdatesIOSQ=%UpdatesIOSQ%>> Wizard_Settings.bat
echo set RECCIOS=%RECCIOS%>> Wizard_Settings.bat

echo set USBGUIDE=%USBGUIDE%>> Wizard_Settings.bat
echo set UPAGE1=%UPAGE1%>> Wizard_Settings.bat
echo set LOADER=%LOADER%>> Wizard_Settings.bat
echo set USBCONFIG=%USBCONFIG%>> Wizard_Settings.bat



if exist Wizard_Settings.bat echo                            Download Wizard Settings Saved.
@ping 127.0.0.1 -n 2 -w 1000> nul

goto:WPAGELAST

::...................................USB-Loader Setup Page1 - Format?...............................
:UPAGE1
set FORMAT=NONE
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo         How would you like your external Hard Drive Formatted?
echo.
sfk echo -spat \x20 \x20 \x20 [Green] 1 = FAT32 (RECOMMENDED)
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Green] Pros:[def] The Wii can access apps, games, covers and music stored on FAT32
echo                  Ideal if you don't always have an SD card to launch the USB-Loader
echo                  Compatible with SNEEK/Triiforce Nand Emulation.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Cons:[def] Cannot store files greater than 4GBs. The limit does not apply
echo                  to Wii games, which can be split into parts. This will likely not
echo                  affect you unless the drive is also used to store high-def videos
echo.
echo.
echo        2 = NTFS
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Green] Pros:[def] Capable of storing files greater than 4GB
echo                  CFG USB-Loader can access games, covers and music stored on NTFS
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Cons:[def] The Wii cannot access apps stored on NTFS, so an SD card
echo                  is required to run the USB-Loader (or a SM Channel)
echo                  Incompatible with SNEEK/Triiforce Nand Emulation.
echo.
echo.
echo        3 = Partioned partially as FAT32 and partially as NTFS
echo.
echo            Note: Small flash drives cannot be partitioned
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Green] Pros:[def] You can access Wii apps on the FAT32 partition while still
echo                  being able to save files greater than 4GBs on the NTFS partition
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Cons:[def] A little more work to setup than the other options
echo.
echo.
echo        4 = Drive is currently formatted as WBFS and I don't want to change
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Cons:[def] WBFS can ONLY be read by the Wii and ONLY used to store Wii Games
echo.
echo.
echo        5 = Drive is currently partitioned as FAT32/WBFS and I don't want to change
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Cons:[def] WBFS can ONLY be read by the Wii and ONLY used to store Wii Games
echo.
echo.
echo         B = Back
echo.
echo         M = Main Menu
echo.
set /p FORMAT=     Enter Selection Here: 

if /i "%FORMAT%" EQU "M" goto:MENU

if /i "%MENU1%" EQU "W" goto:skip
if /i "%FORMAT%" EQU "B" goto:MENU
:skip
if /i "%FORMAT%" EQU "B" goto:WPAGE21

if /i "%FORMAT%" EQU "1" set f32=*
if /i "%FORMAT%" EQU "3" set f32=*

if /i "%FORMAT%" EQU "1" goto:UPAGE1b
if /i "%FORMAT%" EQU "2" goto:UPAGE1b
if /i "%FORMAT%" EQU "3" goto:UPAGE1b
if /i "%FORMAT%" EQU "4" goto:UPAGE1b
if /i "%FORMAT%" EQU "5" goto:UPAGE1b

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:UPAGE1



::...................................USB-Loader Setup Page1b - Loader?...............................
:UPAGE1b
set LOADER=
set usbfolder=
set FLOW=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo         What USB-Loader would you like to use?
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 [Green] 1 = Configurable USB-Loader (RECOMMENDED)
echo.
echo.
echo        2 = WiiFlow
echo.
echo.
echo        3 = Both
echo.
echo.
echo.
echo.
echo         B = Back
echo.
echo         M = Main Menu
echo.
echo.
echo.
set /p LOADER=     Enter Selection Here: 

if /i "%LOADER%" EQU "M" goto:MENU
if /i "%LOADER%" EQU "B" goto:UPAGE1

set wbm=*

if /i "%LOADER%" EQU "1" set LOADER=CFG
if /i "%LOADER%" EQU "2" set LOADER=FLOW
if /i "%LOADER%" EQU "3" set LOADER=ALL


if /i "%LOADER%" EQU "CFG" set usbfolder=*
if /i "%LOADER%" EQU "ALL" set usbfolder=*
if /i "%LOADER%" EQU "FLOW" set FLOW=*
if /i "%LOADER%" EQU "ALL" set FLOW=*

if /i "%LOADER%" EQU "CFG" goto:nextstep
if /i "%LOADER%" EQU "FLOW" goto:nextstep
if /i "%LOADER%" NEQ "ALL" goto:skip

:nextstep
if /i "%FORMAT%" EQU "1" goto:UPAGE2
if /i "%FORMAT%" EQU "2" set BACKB4DRIVE=UPAGE1b
if /i "%FORMAT%" EQU "2" goto:DriveChange
if /i "%FORMAT%" EQU "3" goto:UPAGE2
if /i "%FORMAT%" EQU "4" set BACKB4DRIVE=UPAGE1b
if /i "%FORMAT%" EQU "4" goto:DriveChange
if /i "%FORMAT%" EQU "5" goto:UPAGE2
:skip

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:UPAGE1b



::...................................USB-Loader Setup Page2 - Config on USB vs SD?...............................
:UPAGE2
set USBCONFIG=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo        Where would you like to save your USB-Loader app, covers and config files?
echo.
echo.
sfk echo -spat \x20 \x20 \x20 [Green] USB = USB (RECOMMENDED)[def] (Files saved to "COPY_TO_USB")
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Green] Pros:[def] SD Card not required to launch USB-Loader
echo                  USB-Loader files take up a small %% of USB Hard Drive free space
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Cons:[def] Slightly slower loading time (almost negligible)
echo.
echo.
echo.
echo         SD = SD (Files saved to "%DRIVE%")
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Green] Pros:[def] Slightly faster loading time (almost negligible)
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Cons:[def] Cannot launch the USB-Loader without SD Card
echo                  USB-Loader files can take up a large %% of SD Card free space
echo.
echo.
echo.
echo.
echo         B = Back
echo.
echo         M = Main Menu
echo.
echo.
echo.
echo.
set /p USBCONFIG=     Enter Selection Here: 

if /i "%USBCONFIG%" EQU "B" goto:UPAGE1b
if /i "%USBCONFIG%" EQU "M" goto:MENU


::if using wizard+usb-loader setup, set up both drive letters
if /i "%MENU1%" NEQ "W" goto:skip
if /i "%USBCONFIG%" EQU "USB" set BACKB4DRIVE=WPAGELAST
if /i "%USBCONFIG%" EQU "USB" set BACKB4DRIVEU=DRIVECHANGE
if /i "%USBCONFIG%" EQU "USB" goto:WPAGELAST

if /i "%USBCONFIG%" EQU "SD" set BACKB4DRIVE=UPAGE2
if /i "%USBCONFIG%" EQU "SD" goto:WPAGELAST
:skip

if /i "%USBCONFIG%" EQU "USB" set DRIVETEMP=%DRIVE%
if /i "%USBCONFIG%" EQU "USB" set BACKB4DRIVEU=UPAGE2
if /i "%USBCONFIG%" EQU "USB" goto:DRIVEUCHANGE


if /i "%USBCONFIG%" EQU "SD" set BACKB4DRIVE=UPAGE2
if /i "%USBCONFIG%" EQU "SD" goto:DriveChange


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:UPAGE2



::...................................SNEEK Page1 - SNEEK SELECT...............................
:SNKPAGE1
set SNEEKSELECT=
set SNKS2U=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo         Which of the following SNEEK Actions would you like to perform?
echo.
echo.
echo.
echo                1 = SNEEK Installation
echo.
echo                2 = Emulated NAND Builder (for SNEEK)
echo.
echo                3 = All the above (Recommended for first time SNEEK users)
echo.
echo.
echo                4 = Game Bulk Extractor (for SNEEK)
echo                    * Supported formats include ISO, CISO and WBFS files
echo.
echo.
echo.
echo   Requirements:
echo.
echo         * Your Wii must have BootMii installed in order to run SNEEK. If you
echo           don't have it installed, run ModMii's Download Wizard.
echo.
echo         * UNEEK and UNEEK+DI require the External Hard Drive be formatted 
echo           as FAT32 using cluster sizes 32K or lower. If you don't know how to
echo           format your drive this way, run ModMii's USB-Loader Setup.
echo.
echo         * SNEEK+DI and UNEEK+DI always uses the 1st partition if multiple are found.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] WARNING: SNEEK is not directly supported by ModMii.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] Any problems you have with SNEEK that are not a direct result
sfk echo -spat \x20 \x20 \x20 \x20 [Red] of ModMii should be reported here: http://code.google.com/p/sneek/
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] This is also a great place to learn more about SNEEK in general.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] Another great resource is the guide here: tinyurl.com/SNEEK-DI
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p SNEEKSELECT=     Enter Selection Here: 

if /i "%SNEEKSELECT%" EQU "B" goto:MENU
if /i "%SNEEKSELECT%" EQU "M" goto:MENU
if /i "%SNEEKSELECT%" EQU "1" goto:SNKPAGE2
if /i "%SNEEKSELECT%" EQU "2" goto:SNKPAGE2
if /i "%SNEEKSELECT%" EQU "3" goto:SNKPAGE2
if /i "%SNEEKSELECT%" EQU "4" goto:SNKDISCEX

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE1



::...................................SNEEK Page2 - SNEEK TYPE...............................
:SNKPAGE2
set SNEEKTYPE=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if /i "%SNEEKSELECT%" NEQ "2" echo         What type of SNEEK would you like to install?
if /i "%SNEEKSELECT%" EQU "2" echo         What type of SNEEK would you like to build an emulated NAND for?
echo.
echo.
if /i "%SNEEKSELECT%" NEQ "1" echo   Note: NANDs built for any type of SNEEK work with any other type of SNEEK except
if /i "%SNEEKSELECT%" NEQ "1" echo           UNEEK+DI and SNEEK+DI which require 4.2U/E or 4.3U/E emulated NANDs.
if /i "%SNEEKSELECT%" NEQ "1" echo           However, ANY region Wii can use ANY region emulated NAND
if /i "%SNEEKSELECT%" NEQ "1" echo.
if /i "%SNEEKSELECT%" NEQ "1" echo   Advanced Users: If you self-compile SNEEK+DI/UNEEK+DI with hacks to support
if /i "%SNEEKSELECT%" NEQ "1" echo                   System Menu's other than those mentioned in the note above,
if /i "%SNEEKSELECT%" NEQ "1" echo                   you can select "S" or "U" to unlock more NAND building options
echo.
echo         UD = UNEEK+DI
echo              * Emulated Wii nand/memory is on FAT32 External Hard Drive
echo              * Load Wii games off your FAT32 External Hard Drive
echo              * You can load apps off an SD Card via the Homebrew Channel
echo              * DVD-Drive access is disabled for games while running UNEEK+DI
echo                but can be used in apps (ie. WiiXplorer)
echo              * Only works with 4.2U/E and 4.3E emulated NANDs
echo.
echo         SD = SNEEK+DI
echo              * Emulated Wii nand/memory is on SD Card
echo              * Load Wii games off your FAT32 External Hard Drive
echo              * You can load apps off a FAT32 USB HDD via the Homebrew Channel
echo              * DVD-Drive access is disabled for games while running SNEEK+DI
echo                but can be used in apps (ie. WiiXplorer)
echo              * Only works with 4.2U/E and 4.3E emulated NANDs
echo.
echo          U = UNEEK
echo              * Emulated Wii nand/memory is on FAT32 External Hard Drive
echo              * You cannot load any games off your Hard Drive
echo              * You can load apps off an SD Card via the Homebrew Channel
echo              * DVD-Drive access is enabled
echo              * Backup disc loading requires DarkCorp installed on emulated nand
echo                (Newer Wii's have a DVD-Drive that prevents backup disc loading)
echo.
echo          S = SNEEK
echo              * Emulated Wii nand/memory is on SD Card
::echo              * You can load ONE game at a time off your FAT32 External Hard Drive
echo              * You cannot load any games off your Hard Drive
echo              * You can load apps off a FAT32 USB HDD via the Homebrew Channel
echo              * DVD-Drive access is enabled
echo              * Backup disc loading requires DarkCorp installed on emulated nand
echo                (Newer Wii's have a DVD-Drive that prevents backup disc loading)
echo.
echo          B = Back
echo.
echo          M = Main Menu
echo.
echo.
set /p SNEEKTYPE=     Enter Selection Here: 

if /i "%SNEEKTYPE%" EQU "B" goto:SNKPAGE1
if /i "%SNEEKTYPE%" EQU "M" goto:MENU

if /i "%SNEEKTYPE%" EQU "S" set BACKB4DRIVE=SNKPAGE2
if /i "%SNEEKTYPE%" EQU "SD" set BACKB4DRIVE=SNKPAGE2
if /i "%SNEEKTYPE%" EQU "U" set BACKB4DRIVE=SNKPAGE2
if /i "%SNEEKTYPE%" EQU "UD" set BACKB4DRIVE=SNKPAGE2

if /i "%SNEEKTYPE%" EQU "SD" goto:DRIVECHANGE
if /i "%SNEEKTYPE%" EQU "S" goto:DRIVECHANGE

::if only building nand, no need to set drive, only driveU
if /i "%SNEEKSELECT%" EQU "2" goto:skip
if /i "%SNEEKTYPE%" EQU "UD" goto:DRIVECHANGE
if /i "%SNEEKTYPE%" EQU "U" goto:DRIVECHANGE
goto:skip2
:skip
if /i "%SNEEKTYPE%" EQU "U" set BACKB4DRIVEU=SNKPAGE2
if /i "%SNEEKTYPE%" EQU "UD" set BACKB4DRIVEU=SNKPAGE2
if /i "%SNEEKTYPE%" EQU "UD" goto:DRIVEUCHANGE
if /i "%SNEEKTYPE%" EQU "U" goto:DRIVEUCHANGE
:skip2

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE2





::...................................SNEEK Page3 - SNEEK REGION...............................
:SNKPAGE3

if /i "%SNEEKTYPE:~0,1%" EQU "S" set nandpath=%DRIVE%
if /i "%SNEEKTYPE:~0,1%" EQU "U" set nandpath=%DRIVEU%

set DITYPE=off
if /i "%SNEEKTYPE%" EQU "UD" set DITYPE=on
if /i "%SNEEKTYPE%" EQU "SD" set DITYPE=on


set REGION=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  SNEEK NAND BUILDER
echo.
echo.
echo         What Region would you like to make your emulated NAND?
echo.
echo.
echo         Note: SNEEK+DI and UNEEK+DI only work with 4.2U/E or 4.3U/E emulated NANDs.
echo               However, ANY region Wii can use ANY region emulated NAND.
echo.
echo.
echo         Note: If you want your wiimotes be synced up to your real NAND
echo               and your emulated NAND simultaneously, then you must choose
echo               the real region of your Wii
echo               (in addition to using the setting.txt for your Wii)
echo.
echo.

echo.
echo                U = USA
echo                E = Euro (PAL)
if /i "%DITYPE%" EQU "off" echo                J = JAP
if /i "%DITYPE%" EQU "off" echo                K = Korean
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p REGION=     Enter Selection Here: 


if /i "%REGION%" EQU "B" goto:%B4SNKPAGE3%
if /i "%REGION%" EQU "M" goto:MENU

if /i "%REGION%" EQU "u" set REGION=U
if /i "%REGION%" EQU "e" set REGION=E
if /i "%REGION%" EQU "j" set REGION=J
if /i "%REGION%" EQU "k" set REGION=K

if /i "%REGION%" EQU "U" set defaultserial=LU521175683
if /i "%REGION%" EQU "E" set defaultserial=LEH133789940
if /i "%REGION%" EQU "J" set defaultserial=LJM101175683
if /i "%REGION%" EQU "K" set defaultserial=LJM101175683


if /i "%REGION%" EQU "U" (set serialdigits=11 or 12) else (set serialdigits=12)

if /i "%REGION%" EQU "U" goto:SNKPAGE4
if /i "%REGION%" EQU "E" goto:SNKPAGE4

if /i "%DITYPE%" EQU "on" goto:skip
if /i "%REGION%" EQU "J" goto:SNKPAGE4
if /i "%REGION%" EQU "K" goto:SNKPAGE4
:skip

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE3






::...................................SNEEK Page4 - SNEEK VERSION...............................
:SNKPAGE4
set SNKVERSION=


::If region is USA and building NAND for DI, force 4.2 and go to next page
::if /i "%DITYPE%" EQU "OFF" goto:skip
::if /i "%REGION%" EQU "U" set SNKVERSION=4.2
::if /i "%REGION%" EQU "U" goto:SNKPAGE5
:::skip


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  SNEEK NAND BUILDER
echo.
echo.
echo         What Firmware Version would you like your SNEEK emulated NAND to be?
echo.
echo.
echo         Note: SNEEK+DI and UNEEK+DI only work with 4.2U/E or 4.3U/E emulated NANDs.
echo               However, ANY region Wii can use ANY region emulated NAND.
echo.
if /i "%DITYPE%" EQU "OFF" goto:skip
if /i "%REGION%" EQU "U" sfk echo -spat \x20 \x20 [Red] Warning:[def] 4.3U specifically does NOT have Region Free hacks enabled by default.
if /i "%REGION%" EQU "U" echo               This only applies to WiiWare/VC Games (aka Channels), 
if /i "%REGION%" EQU "U" echo               the DI/Game Menu can still play Wii Games of All Regions.
:skip
echo.
echo.
echo.
echo                4.3 = 4.3
echo                4.2 = 4.2
::anything under 4.2 is not an option for NANDs for DI
if /i "%DITYPE%" EQU "ON" goto:skip
echo                4.1 = 4.1
:skip
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p SNKVERSION=     Enter Selection Here: 


if /i "%SNKVERSION%" EQU "M" goto:MENU
if /i "%SNKVERSION%" EQU "B" goto:SNKPAGE3



if /i "%SNKVERSION%" EQU "4.3" goto:SNKPAGE4a
if /i "%SNKVERSION%" EQU "4.2" goto:SNKPAGE4a

if /i "%SNEEKTYPE%" EQU "SD" goto:skip
if /i "%SNEEKTYPE%" EQU "UD" goto:skip
if /i "%SNKVERSION%" EQU "4.1" goto:SNKPAGE4a
:skip

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4





::...................................SNEEK Page4a - HomeBrew Filter...............................
:SNKPAGE4a

set SNKHBF=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  SNEEK NAND BUILDER
echo.
echo.
echo         Would you like the Homebrew Filter Channel on your emulated NAND?
echo.
echo.
echo         Like the Homebrew Channel, the Homebrew Filter Channel is able to
echo         launch homebrew from an SD Card or FAT32 Hard Drive.
echo.
echo         It's not possible to install the latest version of the Homebrew Channel
echo         to emulated nands and the Homebrew Filter is a great alternative.
echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Yes
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p SNKHBF=     Enter Selection Here: 


if /i "%SNKHBF%" EQU "B" goto:SNKPAGE4
if /i "%SNKHBF%" EQU "M" goto:MENU
if /i "%SNKHBF%" EQU "Y" goto:SNKPAGE4a2
if /i "%SNKHBF%" EQU "N" goto:SNKPAGE4a2


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4a




::...................................SNEEK Page4a2 - cIOS...............................
:SNKPAGE4a2

set SNKCIOS=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  SNEEK NAND BUILDER
echo.
echo.
echo         Would you like to install cIOS249 rev14 to your emulated NAND?
echo.
echo.
echo         Some apps that require a cIOS will only work on s\uneek with cIOS rev14.
echo         For example, SaveGame Manager GX will work on s\uneek with cIOS rev14.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Yes
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p SNKCIOS=     Enter Selection Here: 


if /i "%SNKCIOS%" EQU "B" goto:SNKPAGE4a
if /i "%SNKCIOS%" EQU "M" goto:MENU
if /i "%SNKCIOS%" EQU "Y" goto:SNKPAGE4b
if /i "%SNKCIOS%" EQU "N" goto:SNKPAGE4b


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4a2




::...................................SNEEK Page4b - Priiloader For SNEEK...............................
:SNKPAGE4b

set SNKPRI=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  SNEEK NAND BUILDER
echo.
echo.
echo         Would you like Priiloader v0.4 and hacks.ini on your emulated NAND?
echo.
echo         Doing this will allow you to enable system menu hacks on your emulated NAND.
echo         It will also permit autobooting sneek to apps of your choice (ie. JoyFlow).
echo.
echo.

echo         Note: to access Priiloader on your emulated NAND, hold reset just as
echo               your emulated NAND is booting up.
echo.
echo.

sfk echo -spat \x20 \x20 [Red] WARNING: In some cases you may have about 10 seconds to exit Priiloader 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red](on your emulated NAND) before it becomes unresponsive.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]You will have to save your Priiloader settings quickly and it
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]may take a few tries to save all your settings a little bit at a time.

echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]One method of accessing Priiloader (on your emulated NAND) without the
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]10 second time limit is to quickly change its 'return to' setting to
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]'Priiloader'. Then launch the emulated system menu, hit home, then
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]select the Wii Menu. It will take you to Priiloader (on your emulated
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]NAND) bypassing the 10 second time limit. When you are finished with
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]Priiloader you can change the "return to" settings.


echo.
echo.
echo.
echo.
echo                Y = Yes
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p SNKPRI=     Enter Selection Here: 


if /i "%SNKPRI%" EQU "B" goto:SNKPAGE4a2
if /i "%SNKPRI%" EQU "M" goto:MENU
if /i "%SNKPRI%" EQU "Y" goto:SNKPAGE4c
if /i "%SNKPRI%" EQU "N" goto:SNKPAGE4c


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4b



::...................................SNEEK Page4c - JoyFlow...............................
:SNKPAGE4c

set SNKJOY=

::skip this page if sneektype not uneek or uneek+di
if /i "%SNEEKTYPE:~0,1%" EQU "S" (set SNKJOY=N) & (goto:SNKPAGE4d)


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  SNEEK NAND BUILDER
echo.
echo.
echo         Would you like a JoyFlow Forwarder Channel on your emulated NAND?
echo.
echo.

if /i "%SNKPRI%" EQU "Y" echo         Note: JoyFlow Forwarder dol will also be added as priiloader's
if /i "%SNKPRI%" EQU "Y" echo               installed file. Priiloader's autoboot settings will still need
if /i "%SNKPRI%" EQU "Y" echo               to be changed if you would like your emulated nand to autoboot
if /i "%SNKPRI%" EQU "Y" echo               the installed file.
if /i "%SNKPRI%" EQU "Y" echo.
if /i "%SNKPRI%" EQU "Y" echo.

echo         *JoyFlow is USB-Loader for UNEEK+DI that is a visually appealing
echo          alternative to loading Wii games\channels via the emulated System Menu
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Yes
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p SNKJOY=     Enter Selection Here: 


if /i "%SNKJOY%" EQU "B" goto:SNKPAGE4b
if /i "%SNKJOY%" EQU "M" goto:MENU
if /i "%SNKJOY%" EQU "Y" goto:SNKPAGE4d
if /i "%SNKJOY%" EQU "N" goto:SNKPAGE4d


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4c



::...................................SNEEK Page4d - Switch2UNEEK...............................
:SNKPAGE4d

set SNKS2U=

::skip this page if sneektype not uneek or uneek+di
if /i "%SNEEKTYPE:~0,1%" EQU "S" (set SNKS2U=N) & (goto:SNKPAGE5)


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  SNEEK NAND BUILDER
echo.
echo.
echo         Would you like to use Switch2Uneek?
echo.
echo.
echo         Switch2Uneek is a utility to help you easily switch between
echo         your Emulated Uneek Nand and your Real Nand.
echo.
echo.
echo         If you answer "Y", you must access UNEEK by launching switch2uneek
echo         from the Homebrew Channel. Alternatively, can use MMM to install
echo         the switch2uneek forwarder channel that will be saved to your SD card.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Yes
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p SNKS2U=     Enter Selection Here: 


if /i "%SNKS2U%" EQU "B" goto:SNKPAGE4c
if /i "%SNKS2U%" EQU "M" goto:MENU
if /i "%SNKS2U%" EQU "Y" goto:SNKPAGE5
if /i "%SNKS2U%" EQU "N" goto:SNKPAGE5


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4d


::...................................SNEEK Page4 - SNEEK SERIAL...............................
:SNKPAGE5

if /i "%SNEEKTYPE:~0,1%" EQU "S" set nandpath=%DRIVE%
if /i "%SNEEKTYPE:~0,1%" EQU "U" set nandpath=%DRIVEU%

if /i "%SNKS2U%" EQU "N" goto:quickskip
SET NANDcount=0
:NANDname
SET /a NANDcount=%NANDcount%+1
if not exist "%nandpath%\nands\nand%NANDcount%" (set nandpath=%nandpath%\nands\nand%NANDcount%) & goto:quickskip
goto:NANDname
:quickskip


set SNKSERIAL=

set settingtxtExist=no
if exist "%nandpath%"\title\00000001\00000002\data\setting.txt set settingtxtExist=yes

set nandexist=no
if exist "%nandpath%"\title set nandexist=yes
if exist "%nandpath%"\ticket set nandexist=yes
if exist "%nandpath%"\sys set nandexist=yes
if exist "%nandpath%"\shared1 set nandexist=yes

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  SNEEK NAND BUILDER
echo.
echo.
echo         What Serial Number Would you like to use to create setting.txt?
echo.
echo.
if /i "%settingtxtExist%" EQU "yes" sfk echo -spat \x20 [Red] setting.txt already exists in:
if /i "%settingtxtExist%" EQU "yes" echo                                  %nandpath%
if /i "%settingtxtExist%" EQU "yes" sfk echo -spat \x20 [Red] Leave the selection blank to keep using this setting.txt
if /i "%settingtxtExist%" EQU "yes" echo.
if /i "%settingtxtExist%" EQU "yes" sfk echo -spat \x20 [Red] WARNING: Existing setting.txt must be Region '%REGION%' to work
echo.
echo.
echo         Enter your %serialdigits% digit serial number now
echo.
echo               Example: %defaultserial%
echo.
echo.
echo.
echo                D = Default Serial %defaultserial%
echo.
echo.
echo                N = None, skip building setting.txt
echo.
echo.
echo.
echo         Note: setting.txt required to build nand, only select "N" if
echo               you plan to manually copy a pre-existing setting.txt
echo               to this location: %nandpath%\title\00000001\00000002\data\
echo.
echo.
echo         Note: If you want your wiimotes be synced up to your real NAND
echo               and your emulated NAND simultaneously, then you must use the
echo               serial for your Wii (or the setting.txt from your NAND Dump)
echo.
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p SNKSERIAL=     Enter Selection Here: 

if /i "%SNKSERIAL%" EQU "M" goto:MENU

if /i "%SNKSERIAL%" NEQ "B" goto:quickskip
if /i "%SNEEKTYPE:~0,1%" EQU "U" (goto:SNKPAGE4d) else (goto:SNKPAGE4b)
:quickskip


if /i "%SNKSERIAL%" EQU "N" goto:WPAGE20
if /i "%SNKSERIAL%" EQU "D" set SNKSERIAL=%defaultserial%


if /i "%settingtxtExist%" EQU "yes" goto:settingsexist
IF "%SNKSERIAL%"=="" set SNKSERIAL=9999999999999
goto:skip

:settingsexist
IF "%SNKSERIAL%"=="" set SNKSERIAL=current
if /i "%SNKSERIAL%" EQU "current" goto:WPAGE20

:skip

::limit user input to X# of digits
if "%SNKSERIAL:~2%"=="" (goto:badkey)
if "%SNKSERIAL:~3%"=="" (goto:badkey)
if "%SNKSERIAL:~4%"=="" (goto:badkey)
if "%SNKSERIAL:~5%"=="" (goto:badkey)
if "%SNKSERIAL:~6%"=="" (goto:badkey)
if "%SNKSERIAL:~7%"=="" (goto:badkey)
if "%SNKSERIAL:~8%"=="" (goto:badkey)
if "%SNKSERIAL:~9%"=="" (goto:badkey)
if "%SNKSERIAL:~10%"=="" (goto:badkey)

if /i "%REGION%" EQU "U" goto:skip
if "%SNKSERIAL:~11%"=="" (goto:badkey)
:skip

::if /i "%REGION%" NEQ "U" goto:skip
::if not "%SNKSERIAL:~11%"=="" (goto:badkey)
:::skip

if not "%SNKSERIAL:~12%"=="" (goto:badkey)

::next page
goto:WPAGE20

:badkey
echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE5





::...................................SNEEK Nand Builder Confirmation...............................
:SNKNANDCONFIRM
set SNKNANDCONFIRM=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if /i "%SNEEKSELECT%" NEQ "3" goto:notalsoinstalling
if /i "%SNEEKTYPE%" EQU "SD" echo         You are about to install SNEEK+DI and build a %SNKVERSION%%REGION% Emulated Nand
if /i "%SNEEKTYPE%" EQU "UD" echo         You are about to install UNEEK+DI and build a %SNKVERSION%%REGION% Emulated Nand
if /i "%SNEEKTYPE%" EQU "S" echo         You are about to install SNEEK and build a %SNKVERSION%%REGION% Emulated Nand
if /i "%SNEEKTYPE%" EQU "U" echo         You are about to install UNEEK and build a %SNKVERSION%%REGION% Emulated Nand
goto:skip

:notalsoinstalling

if /i "%SNEEKSELECT%" EQU "2" echo         You are about to build a %SNKVERSION%%REGION% Emulated Nand

if /i "%SNEEKSELECT%" NEQ "1" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" echo         You are about to build SNEEK+DI
if /i "%SNEEKTYPE%" EQU "UD" echo         You are about to build UNEEK+DI
if /i "%SNEEKTYPE%" EQU "U" echo         You are about to build UNEEK
if /i "%SNEEKTYPE%" EQU "S" echo         You are about to build SNEEK
echo.
echo.
echo.
echo.
goto:nonandinstallation

:skip

if not exist temp\install2sneek mkdir temp\install2sneek

echo.
echo.
echo    Install wads from: temp\install2sneek\
echo     to Emulated Nand: %nandpath%\
echo.
echo    Note: You can optionally save additional WADs you would like installed to your
echo          emulated nand to "temp\install2sneek". After they're done installing
echo          ModMii will move the WADs from "temp\install2sneek" to "temp".
echo.


if /i "%SNKSERIAL%" EQU "N" goto:none
if /i "%SNKSERIAL%" NEQ "current" echo           * setting.txt will be created using this serial number: %SNKSERIAL%
if /i "%SNKSERIAL%" EQU "current" echo           * Existing setting.txt will be kept
echo.
:none


if /i "%SNKHBF%" EQU "Y" echo           * Install Homebrew Filter Channel
if /i "%SNKHBF%" EQU "Y" echo.

if /i "%SNKCIOS%" EQU "Y" echo           * Install cIOS249 rev14
if /i "%SNKCIOS%" EQU "Y" echo.

if /i "%SNKPRI%" EQU "Y" echo           * Install Priiloader v0.4
if /i "%SNKPRI%" EQU "Y" echo.

if /i "%SNKJOY%" EQU "Y" echo           * Install JoyFlow
if /i "%SNKJOY%" EQU "Y" echo.

if /i "%SNKS2U%" EQU "Y" echo           * Install Switch2Uneek
if /i "%SNKS2U%" EQU "Y" echo.

if /i "%ThemeSelection%" EQU "R" echo           * Install Dark Wii Red Theme
if /i "%ThemeSelection%" EQU "G" echo           * Install Dark Wii Green Theme
if /i "%ThemeSelection%" NEQ "N" echo.

if /i "%PIC%" EQU "Y" echo           * Install Photo Channel
if /i "%NET%" EQU "Y" echo           * Install Internet Channel
if /i "%WEATHER%" EQU "Y" echo           * Install Weather Channel
if /i "%NEWS%" EQU "Y" echo           * Install News Channel
if /i "%MIIQ%" EQU "Y" echo           * Install Mii Channel
if /i "%Shop%" EQU "Y" echo           * Install Shopping Channel
if /i "%Speak%" EQU "Y" echo           * Install Wii Speak Channel
echo.
if /i "%nandexist%" EQU "yes" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]WARNING: An emulated nand already exists in:
if /i "%nandexist%" EQU "yes" echo                   %nandpath%
if /i "%nandexist%" EQU "yes" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]Existing emulated nand will be Deleted\Replaced
:nonandinstallation
echo.
echo                Y = Yes, do it now!
echo.
echo                N = No
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
set /p SNKNANDCONFIRM=     Enter Selection Here: 


if /i "%SNKNANDCONFIRM%" EQU "B" goto:%B4SNKCONFIRM%
if /i "%SNKNANDCONFIRM%" EQU "M" goto:MENU
if /i "%SNKNANDCONFIRM%" EQU "N" goto:MENU

if /i "%SNEEKSELECT%" EQU "1" goto:skip
if /i "%SNEEKSELECT%" EQU "3" goto:skip
if /i "%SNKNANDCONFIRM%" EQU "Y" goto:SNKNANDBUILDER
:skip
if /i "%SNKNANDCONFIRM%" EQU "Y" goto:SNEEKINSTALLER

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKNANDCONFIRM


::...................................SNEEK Nand Builder...............................
:SNKNANDBUILDER

::temporarily force wads to be saved to "root" of "temp" folder
Set ROOTSAVE=on
::set DRIVE=temp//happens later

if not exist "%nandpath%" mkdir "%nandpath%"
if not exist temp\install2sneek mkdir temp\install2sneek

::backup setting.txt if applicable
if /i "%SNKSERIAL%" EQU "current" move /y "%nandpath%"\title\00000001\00000002\data\setting.txt "%nandpath%"\setting.txt >nul
::delete existing nand if exists
if exist "%nandpath%"\title echo.
if exist "%nandpath%"\title echo Deleting existing emulated nand...
if exist "%nandpath%"\title rd /s /q "%nandpath%"\title
if exist "%nandpath%"\ticket rd /s /q "%nandpath%"\ticket
if exist "%nandpath%"\sys rd /s /q "%nandpath%"\sys
if exist "%nandpath%"\shared1 rd /s /q "%nandpath%"\shared1
::import, meta, shared2, tmp are deleted but will not be recreated by NAND Builder
if exist "%nandpath%"\import rd /s /q "%nandpath%"\import
if exist "%nandpath%"\meta rd /s /q "%nandpath%"\meta
if exist "%nandpath%"\shared2 rd /s /q "%nandpath%"\shared2
if exist "%nandpath%"\tmp rd /s /q "%nandpath%"\tmp
if exist "%nandpath%"\wfs rd /s /q "%nandpath%"\wfs



::if user selects S2U but has emulated nand on root without nandslot.bin, move existing nand to nands folder
if /i "%SNKS2U%" EQU "N" goto:quickskip
if exist "%DRIVEU%"\nandslot.bin goto:quickskip

SET /a NANDcountPLUS1=%NANDcount%+1

if not exist "%DRIVEU%"\title goto:quickskip
echo.
echo Moving existing emulated nand to \nands\%NANDcountPLUS1% folder...

if not exist "%DRIVEU%\nands\nand%NANDcountPLUS1%" mkdir "%DRIVEU%\nands\nand%NANDcountPLUS1%"

if exist "%DRIVEU%"\title move /y "%DRIVEU%"\title "%DRIVEU%\nands\nand%NANDcountPLUS1%\title"
if exist "%DRIVEU%"\ticket move /y "%DRIVEU%"\ticket "%DRIVEU%\nands\nand%NANDcountPLUS1%\ticket"
if exist "%DRIVEU%"\sys move /y "%DRIVEU%"\sys "%DRIVEU%\nands\nand%NANDcountPLUS1%\sys"
if exist "%DRIVEU%"\shared1 move /y "%DRIVEU%"\shared1 "%DRIVEU%\nands\nand%NANDcountPLUS1%\shared1"
::import, meta, shared2, tmp are deleted but will not be recreated by NAND Builder
if exist "%DRIVEU%"\import move /y "%DRIVEU%"\import "%DRIVEU%\nands\nand%NANDcountPLUS1%\import"
if exist "%DRIVEU%"\meta move /y "%DRIVEU%"\meta "%DRIVEU%\nands\nand%NANDcountPLUS1%\meta"
if exist "%DRIVEU%"\shared2 move /y "%DRIVEU%"\shared2 "%DRIVEU%\nands\nand%NANDcountPLUS1%\shared2"
if exist "%DRIVEU%"\tmp move /y "%DRIVEU%"\tmp "%DRIVEU%\nands\nand%NANDcountPLUS1%\tmp"
if exist "%DRIVEU%"\wfs move /y "%DRIVEU%"\wfs "%DRIVEU%\nands\nand%NANDcountPLUS1%\wfs"

:quickskip



::all
if /i "%MIIQ%" EQU "Y" set MII=*



if /i "%REGION%" EQU "U" goto:SNKU
if /i "%REGION%" EQU "E" goto:SNKE
if /i "%REGION%" EQU "J" goto:SNKJ
if /i "%REGION%" EQU "K" goto:SNKK

:SNKU
if /i "%SNKVERSION%" EQU "4.3" set SM4.3U=*
if /i "%SNKVERSION%" EQU "4.2" set SM4.2U=*
if /i "%SNKVERSION%" EQU "4.1" set SM4.1U=*
if /i "%ThemeSelection%" EQU "N" goto:SKIPSM

if /i "%ThemeSelection%" NEQ "R" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set DarkWii_Red_4.3U=*
if /i "%SNKVERSION%" EQU "4.2" set DarkWii_Red_4.2U=*
if /i "%SNKVERSION%" EQU "4.1" set DarkWii_Red_4.1U=*
goto:SKIPSM
:skip

if /i "%ThemeSelection%" NEQ "G" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set DarkWii_Green_4.3U=*
if /i "%SNKVERSION%" EQU "4.2" set DarkWii_Green_4.2U=*
if /i "%SNKVERSION%" EQU "4.1" set DarkWii_Green_4.1U=*
goto:SKIPSM
:skip

:SKIPSM

::SMAPP is patched for UNEEK+DI Support
if /i "%SNKVERSION%" EQU "4.3" set SMAPP=00000098
if /i "%SNKVERSION%" EQU "4.2" set SMAPP=00000088
if /i "%SNKVERSION%" EQU "4.1" set SMAPP=0000007c
if /i "%PIC%" EQU "Y" set P=*
if /i "%NET%" EQU "Y" set IU=*
if /i "%WEATHER%" EQU "Y" set WU=*
if /i "%NEWS%" EQU "Y" set NU=*
if /i "%SHOP%" EQU "Y" set S=*
if /i "%SPEAK%" EQU "Y" set WSU=*
goto:SNKBUGGEDSMIOS

:SNKE
if /i "%SNKVERSION%" EQU "4.3" set SM4.3E=*
if /i "%SNKVERSION%" EQU "4.2" set SM4.2E=*
if /i "%SNKVERSION%" EQU "4.1" set SM4.1E=*
if /i "%ThemeSelection%" EQU "N" goto:SKIPSM

if /i "%ThemeSelection%" NEQ "R" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set DarkWii_Red_4.3E=*
if /i "%SNKVERSION%" EQU "4.2" set DarkWii_Red_4.2E=*
if /i "%SNKVERSION%" EQU "4.1" set DarkWii_Red_4.1E=*
goto:SKIPSM
:skip

if /i "%ThemeSelection%" NEQ "G" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set DarkWii_Green_4.3E=*
if /i "%SNKVERSION%" EQU "4.2" set DarkWii_Green_4.2E=*
if /i "%SNKVERSION%" EQU "4.1" set DarkWii_Green_4.1E=*
goto:SKIPSM
:skip

:SKIPSM

if /i "%SNKVERSION%" EQU "4.3" set SMAPP=0000009b
if /i "%SNKVERSION%" EQU "4.2" set SMAPP=0000008b
if /i "%SNKVERSION%" EQU "4.1" set SMAPP=0000007f
if /i "%PIC%" EQU "Y" set P=*
if /i "%NET%" EQU "Y" set IE=*
if /i "%WEATHER%" EQU "Y" set WE=*
if /i "%NEWS%" EQU "Y" set NE=*
if /i "%SHOP%" EQU "Y" set S=*
if /i "%SPEAK%" EQU "Y" set WSE=*
goto:SNKBUGGEDSMIOS

:SNKJ
if /i "%SNKVERSION%" EQU "4.3" set SM4.3J=*
if /i "%SNKVERSION%" EQU "4.2" set SM4.2J=*
if /i "%SNKVERSION%" EQU "4.1" set SM4.1J=*
if /i "%ThemeSelection%" EQU "N" goto:SKIPSM

if /i "%ThemeSelection%" NEQ "R" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set DarkWii_Red_4.3J=*
if /i "%SNKVERSION%" EQU "4.2" set DarkWii_Red_4.2J=*
if /i "%SNKVERSION%" EQU "4.1" set DarkWii_Red_4.1J=*
goto:SKIPSM
:skip

if /i "%ThemeSelection%" NEQ "G" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set DarkWii_Green_4.3J=*
if /i "%SNKVERSION%" EQU "4.2" set DarkWii_Green_4.2J=*
if /i "%SNKVERSION%" EQU "4.1" set DarkWii_Green_4.1J=*
goto:SKIPSM
:skip

:SKIPSM

if /i "%SNKVERSION%" EQU "4.3" set SMAPP=00000095
if /i "%SNKVERSION%" EQU "4.2" set SMAPP=00000085
if /i "%SNKVERSION%" EQU "4.1" set SMAPP=00000079
if /i "%PIC%" EQU "Y" set P=*
if /i "%NET%" EQU "Y" set IJ=*
if /i "%WEATHER%" EQU "Y" set WJ=*
if /i "%NEWS%" EQU "Y" set NJ=*
if /i "%SHOP%" EQU "Y" set S=*
if /i "%SPEAK%" EQU "Y" set WSJ=*
goto:SNKBUGGEDSMIOS

:SNKK
if /i "%SNKVERSION%" EQU "4.3" set SM4.3K=*
if /i "%SNKVERSION%" EQU "4.2" set SM4.2K=*
if /i "%SNKVERSION%" EQU "4.1" set SM4.1K=*
if /i "%ThemeSelection%" EQU "N" goto:SKIPSM

if /i "%ThemeSelection%" NEQ "R" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set DarkWii_Red_4.3K=*
if /i "%SNKVERSION%" EQU "4.2" set DarkWii_Red_4.2K=*
if /i "%SNKVERSION%" EQU "4.1" set DarkWii_Red_4.1K=*
goto:SKIPSM
:skip

if /i "%ThemeSelection%" NEQ "G" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set DarkWii_Green_4.3K=*
if /i "%SNKVERSION%" EQU "4.2" set DarkWii_Green_4.2K=*
if /i "%SNKVERSION%" EQU "4.1" set DarkWii_Green_4.1K=*
goto:SKIPSM
:skip

:SKIPSM

if /i "%SNKVERSION%" EQU "4.3" set SMAPP=0000009e
if /i "%SNKVERSION%" EQU "4.2" set SMAPP=0000008e
if /i "%SNKVERSION%" EQU "4.1" set SMAPP=00000082
if /i "%PIC%" EQU "Y" set PK=*
if /i "%SHOP%" EQU "Y" set SK=*


:SNKBUGGEDSMIOS
if /i "%SNKVERSION%" EQU "4.1" set IOS60P=*
if /i "%SNKVERSION%" EQU "4.2" set IOS70P=*
if /i "%SNKVERSION%" EQU "4.3" set IOS80P=*



::activeios
set M10=*
set IOS9=*
set IOS12=*
set IOS13=*
set IOS14=*
set IOS15=*
set IOS17=*
set IOS21=*
set IOS22=*
set IOS28=*
set IOS31=*
set IOS33=*
set IOS34=*
set IOS35=*
set IOS36v3608=*
set IOS37=*
set IOS38=*
set ios41=*
set ios43=*
set ios45=*
set ios46=*
set IOS48v4124=*
set IOS53=*
set IOS55=*
set IOS56=*
set IOS57=*
set IOS58=*
set IOS61=*
set BC=*

if /i "%SNKCIOS%" EQU "Y" set cIOS249-v14=*

if /i "%REGION%" EQU "U" set EULAU=*
if /i "%REGION%" EQU "E" set EULAE=*
if /i "%REGION%" EQU "J" set EULAJ=*
if /i "%REGION%" EQU "K" set EULAK=*

if /i "%SNKPRI%" EQU "Y" set HAX=*
if /i "%SNKJOY%" EQU "Y" set JOYF=*
if /i "%SNKHBF%" EQU "Y" set HBF=*
if /i "%SNKS2U%" EQU "Y" set S2U=*



::subract 1 from %SMAPP% to get %SMTHEMEAPP%
sfk dec %SMAPP%>dec.txt

::Loop through the the following once for EACH line in whatever.txt
for /F "tokens=*" %%A in (dec.txt) do call :processdec %%A
goto:nextstep

:processdec
set dec=%*
goto:EOF
:nextstep

del dec.txt
SET /a dec=%dec%-1
sfk hex %dec% -digits=8 >hex.txt

::Loop through the the following once for EACH line in whatever.txt
for /F "tokens=*" %%A in (hex.txt) do call :processhex %%A
goto:nextstep

:processhex
::this is repeated for each line of the txt.file
::"%*" (no quotes) is the variable for each line as it passes through the loop
set SMTHEMEAPP=%*
goto:EOF
:nextstep

del hex.txt

::change caps to lower case for hex numbers if applicable
if /i "%SMTHEMEAPP:~-1%" EQU "A" set SMTHEMEAPP=%SMTHEMEAPP:~0,-1%a
if /i "%SMTHEMEAPP:~-1%" EQU "B" set SMTHEMEAPP=%SMTHEMEAPP:~0,-1%b
if /i "%SMTHEMEAPP:~-1%" EQU "C" set SMTHEMEAPP=%SMTHEMEAPP:~0,-1%c
if /i "%SMTHEMEAPP:~-1%" EQU "D" set SMTHEMEAPP=%SMTHEMEAPP:~0,-1%d
if /i "%SMTHEMEAPP:~-1%" EQU "E" set SMTHEMEAPP=%SMTHEMEAPP:~0,-1%e
if /i "%SMTHEMEAPP:~-1%" EQU "F" set SMTHEMEAPP=%SMTHEMEAPP:~0,-1%f


goto:DLCOUNT



::...................................SNEEK SNK DISC EXtractor...............................
:SNKDISCEX

IF "%ISOFOLDER%"=="" goto:checkwbfs
IF "%ISOFOLDER%"=="" set ISOFOLDER=%DRIVEU%\WBFS

goto:skip

:checkwbfs
if exist "A:\WBFS" set ISOFOLDER=A:\WBFS
if exist "B:\WBFS" set ISOFOLDER=B:\WBFS
if exist "C:\WBFS" set ISOFOLDER=C:\WBFS
if exist "D:\WBFS" set ISOFOLDER=D:\WBFS
if exist "E:\WBFS" set ISOFOLDER=E:\WBFS
if exist "F:\WBFS" set ISOFOLDER=F:\WBFS
if exist "G:\WBFS" set ISOFOLDER=G:\WBFS
if exist "H:\WBFS" set ISOFOLDER=H:\WBFS
if exist "I:\WBFS" set ISOFOLDER=I:\WBFS
if exist "J:\WBFS" set ISOFOLDER=J:\WBFS
if exist "K:\WBFS" set ISOFOLDER=K:\WBFS
if exist "L:\WBFS" set ISOFOLDER=L:\WBFS
if exist "M:\WBFS" set ISOFOLDER=M:\WBFS
if exist "N:\WBFS" set ISOFOLDER=N:\WBFS
if exist "O:\WBFS" set ISOFOLDER=O:\WBFS
if exist "P:\WBFS" set ISOFOLDER=P:\WBFS
if exist "Q:\WBFS" set ISOFOLDER=Q:\WBFS
if exist "R:\WBFS" set ISOFOLDER=R:\WBFS
if exist "S:\WBFS" set ISOFOLDER=S:\WBFS
if exist "T:\WBFS" set ISOFOLDER=T:\WBFS
if exist "U:\WBFS" set ISOFOLDER=U:\WBFS
if exist "V:\WBFS" set ISOFOLDER=V:\WBFS
if exist "W:\WBFS" set ISOFOLDER=W:\WBFS
if exist "X:\WBFS" set ISOFOLDER=X:\WBFS
if exist "Y:\WBFS" set ISOFOLDER=Y:\WBFS
if exist "Z:\WBFS" set ISOFOLDER=Z:\WBFS
IF "%ISOFOLDER%"=="" set ISOFOLDER=%DRIVEU%\WBFS
:skip


set drivetemp=%ISOFOLDER%

if exist gametotal.txt del gametotal.txt

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  GAME BULK EXTRACTOR
echo                                      (FOR SNEEK)
echo.
echo.
echo         Enter the Path where your Wii Games are saved
echo.
echo                * Subfolders are also scanned
echo                * Supported formats include ISO, CISO and WBFS files
echo.
echo.
echo    Current Setting:
echo.
echo         %ISOFOLDER%
echo.
echo.
echo         Notes: * To continue using Current Settings
echo                  leave the selection blank and hit enter.
echo.
echo                * You can drag and drop the Drive/folder into this
echo                  window to save yourself having to manually type it
echo.
echo.
echo.
echo         EXAMPLES
echo.
echo.
echo            L:
echo.
echo            %%userprofile%%\Desktop\WiiGames
echo                  Note: %%userprofile%% shortcut doesn't work on Windows XP
echo.
echo            WiiGames\ISOs
echo                  Note: this checks the WiiGames\ISOs folder where ModMii is saved
echo.
echo            C:\Users\XFlak\Desktop\New Folder
echo.
echo.
echo.
echo         B = Back
echo.
echo         M = Main Menu
echo.
echo.
set /p DRIVETEMP=     Enter Selection Here: 


::remove quotes from variable (if applicable)
echo "set DRIVETEMP=%DRIVETEMP%">temp.txt
sfk filter -quiet temp.txt -rep _""""__>temp.bat
call temp.bat
del temp.bat
del temp.txt

if /i "%DRIVETEMP%" EQU "B" goto:SNKPAGE1
if /i "%DRIVETEMP%" EQU "M" goto:MENU



:doublecheckISOFOLDER
set fixslash=
if /i "%DRIVETEMP:~-1%" EQU "\" set fixslash=yes
if /i "%DRIVETEMP:~-1%" EQU "/" set fixslash=yes
if /i "%fixslash%" EQU "yes" set DRIVETEMP=%DRIVETEMP:~0,-1%
if /i "%fixslash%" EQU "yes" goto:doublecheckISOFOLDER



if not exist "%DRIVETEMP%" goto:notexist


::---get game list-------
echo.
echo Scanning directory for Wii Games...
::wit list-l --unit GB --recurse "%DRIVETEMP%">gametotal.txt
wit list-l --recurse "%DRIVETEMP%">gametotal.txt
copy /y gametotal.txt gametotal.bat >nul
sfk filter gametotal.bat -ls+Total -rep _"Total: "_"set gametotal="_ -rep _" discs*"__ -write -yes>nul
call gametotal.bat
del gametotal.bat
if /i "%gametotal%" EQU "0" goto:notexistiso

set ISOFOLDER=%DRIVETEMP%
set BACKB4DRIVEU=SNKDISCEX
goto:DRIVEUCHANGE


:notexist
echo The folder you selected does not exist
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKDISCEX

:notexistiso
del gamelist.txt>nul
echo The folder you selected does not contain any ISO, CISO or WBFS Files
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKDISCEX


::...................................SNK DISC EXtractor2...............................
:SNKDISCEX2

echo.
echo Checking if enough free space exists...

::wit beta--> isosize command
::wit isosize --unit bytes -r "%ISOFOLDER%"

::---get required MB-------
copy /y gametotal.txt gametotal.bat >nul
::sfk filter gametotal.bat -ls+Total -rep _*"~ "_"set MegaBytesRequired="_ -rep _" MB*"__ -write -yes>nul
sfk filter gametotal.bat -ls+Total -rep _*", "_"set MegaBytesRequired="_ -rep _" MiB*"__ -write -yes>nul
call gametotal.bat
del gametotal.bat

if %MegaBytesRequired% GEQ 1000 (set units=GB) else (set units=MB)



::---get approx required GB-------
hy %MegaBytesRequired% 1024 />nul
::above command stores output in a "hy" file

move /y hy gigabytesrequired.txt>nul
sfk filter gigabytesrequired.txt -rep _".*"__ -write -yes>nul

::Loop through the the following once for EACH line in whatever.txt
for /F "tokens=*" %%A in (gigabytesrequired.txt) do call :process %%A
goto:nextstep

:process
::this is repeated for each line of the txt.file
::"%*" (no quotes) is the variable for each line as it passes through the loop
set GigaBytesRequired=%*
goto:EOF
:nextstep

del gigabytesrequired.txt


::---check for free space (not 100% accurate-will catch most cases without enough free space)---

if not exist "%DRIVEU%" mkdir "%DRIVEU%"
dir "%DRIVEU%">freespace.bat


sfk filter freespace.bat -+"bytes " -+"octets " -+"Directory " -!"Directory of" -!"Directory di" -rep _" byte"*__ -rep _" octets"*__ -rep _,__ -rep _.__ -rep _" "__ -rep _*")"_"set freespace="_ -rep _*"dirs"_"set freespace="_ -rep _*"Directory"_"set freespace="_ -write -yes>nul
sfk filter freespace.bat -spat -rep _\xff__ -write -yes>nul

::Italian-dir cmd: 14 Directory  546.480.881.664 byte disponibili

call freespace.bat
del freespace.bat

::Math in batch doesn't work with large numbers
::SET /a freespaceKB=%freespace%/1024


hy %freespace% 1048576 />nul
::above command stores output in a "hy" file

move /y hy megabytes.txt>nul
sfk filter megabytes.txt -rep _".*"__ -write -yes>nul

::Loop through the the following once for EACH line in whatever.txt
for /F "tokens=*" %%A in (megabytes.txt) do call :process %%A
goto:nextstep

:process
::this is repeated for each line of the txt.file
::"%*" (no quotes) is the variable for each line as it passes through the loop
set freespaceMB=%*
goto:EOF
:nextstep

del megabytes.txt

::echo MegaBytesRequired is %MegaBytesRequired%
::echo GigaBytesRequired is %GigaBytesRequired%
::echo Total Free Space is approximately %freespaceMB% MB [%freespace% bytes]
::pause


if %MegaBytesRequired% GEQ %freespaceMB% (goto:needmorespace) else (goto:DISCEXCONFIRM)


::-------------------------------------DISCEX NEED MORE SPACE!!!---------------
:needmorespace
cls
set continue=

::resize window
set lines=
set gametotal=
SET /a LINES=%gametotal%+42
if %LINES% LEQ 54 set lines=54
mode con cols=85 lines=%LINES%

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  GAME BULK EXTRACTOR
echo                                      (FOR SNEEK)
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20[Red]WARNING: YOU DO NOT HAVE ENOUGH FREE SPACE
echo.
echo.
echo.
echo         You are attempting to convert %gametotal% Wii Games
echo.
echo     From Source Folder: %ISOFOLDER%
echo       To Target Folder: %DRIVEU%\games
echo.

::Loop through the the following once for EACH line in gamelist.txt and turn each line of gamelist.txt into a variable
for /F "tokens=*" %%A in (gametotal.txt) do call :process %%A
goto:nextstep

:process
::this is repeated for each line of the txt.file
::"%*" (no quotes) is the variable for each line as it passes through the loop
echo %*
goto:EOF
:nextstep

echo.
echo.
echo.
if /i "%units%" EQU "GB" sfk echo -spat \x20 \x20 \x20 \x20[Red]"%DRIVEU%" requires approx. %GigaBytesRequired%GB of free space
if /i "%units%" EQU "MB" sfk echo -spat \x20 \x20 \x20 \x20[Red]"%DRIVEU%" requires %MegaBytesRequired%MB of free space
echo.
sfk echo -spat \x20 \x20 \x20 \x20[Red]Create more free space or select a smaller source folder and try again
echo.
echo.
echo.


echo                C = Continue anyways
echo.
echo                M = Main Menu
echo.
echo.
echo.
set /p continue=     Enter Selection Here: 

if /i "%continue%" EQU "M" del gametotal.txt
if /i "%continue%" EQU "M" goto:MENU
if /i "%continue%" EQU "C" goto:DISCEXCONFIRM

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:needmorespace



::-------------------------------------DISCEX CONFIRM---------------
:DISCEXCONFIRM
cls
set DISCEXCONFIRM=

::resize window
set lines=
set gametotal=
SET /a LINES=%gametotal%+45
if %LINES% LEQ 54 set lines=54
mode con cols=85 lines=%LINES%

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  GAME BULK EXTRACTOR
echo                                      (FOR SNEEK)
echo.
echo         You are about to convert the following %gametotal% Wii Games
echo.
echo     From Source Folder: %ISOFOLDER%
echo       To Target Folder: %DRIVEU%\games
echo.

::Loop through the the following once for EACH line in gamelist.txt and turn each line of gamelist.txt into a variable
for /F "tokens=*" %%A in (gametotal.txt) do call :process %%A
goto:nextstep

:process
::this is repeated for each line of the txt.file
::"%*" (no quotes) is the variable for each line as it passes through the loop
echo %*
goto:EOF
:nextstep


echo.
echo.
echo     Would you like to proceed?
echo.
echo.
::echo       Notes: * Each game could take approximately 5-15 minutes to convert
::echo.
::echo              * Make sure you have enough free space here: %DRIVEU%
::echo                otherwise extraction will fail when free space is depleted
echo.
echo.
echo.
echo                Y = Yes
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
set /p DISCEXCONFIRM=     Enter Selection Here: 


if /i "%DISCEXCONFIRM%" EQU "M" del gametotal.txt
if /i "%DISCEXCONFIRM%" EQU "N" del gametotal.txt
if /i "%DISCEXCONFIRM%" EQU "Y" del gametotal.txt


if /i "%DISCEXCONFIRM%" EQU "M" goto:MENU
if /i "%DISCEXCONFIRM%" EQU "N" goto:MENU
if /i "%DISCEXCONFIRM%" EQU "Y" mode con cols=85 lines=54
if /i "%DISCEXCONFIRM%" EQU "Y" goto:DISCEXSTART
if /i "%DISCEXCONFIRM%" EQU "B" mode con cols=85 lines=54
if /i "%DISCEXCONFIRM%" EQU "B" goto:DRIVEUCHANGE

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DISCEXCONFIRM



::----------------Start WIT DISCEXTRACTION---------------
:DISCEXSTART
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  GAME BULK EXTRACTOR
echo                                      (FOR SNEEK)
echo.
echo.
echo Updating Wii Game Title Database (titles.txt)
echo.
echo.

if exist titles.txt move /y titles.txt titles_old.txt >nul
start %ModMiimin%/wait wget -t 3 www.wiitdb.com/titles.txt
if exist titles.txt del titles_old.txt >nul
if not exist titles.txt move /y titles_old.txt titles.txt >nul


::rename existing games to new standard
dir "%DRIVEU%"\games /A:D /b > GameTitleIDs.txt
for /F "tokens=*" %%A in (GameTitleIDs.txt) do call :processdir %%A
goto:nextstep
:processdir
set CurrentTitleID=%*
if /i "%CurrentTitleID:~-8,1%" EQU "[" rename "%DRIVEU%\games\%CurrentTitleID%" "%CurrentTitleID:~-7,6%">nul
goto:EOF
:nextstep

if exist GameTitleIDs.txt del GameTitleIDs.txt>nul


::reverse slashes for target folder %DRIVEU%\games which becomes %DRIVEUfix%/games
echo set DRIVEUfix=%DRIVEU%>temp.bat
sfk filter temp.bat -rep _\_/_ -write -yes>nul
call temp.bat
del temp.bat

::IMPORTANT NOTE: destination directory must use "/" and not "\"
::target directory, including "games" folder, is creating automatically with the following wit command

::wit x --sneek --recurse "%ISOFOLDER%" "%DRIVEUfix%/games/%%14T [%%I]" --progress
::wit x --sneek --recurse "%ISOFOLDER%" --DEST "%DRIVEUfix%/games/%%14T [%%I]" --progress
wit x --sneek --recurse "%ISOFOLDER%" --DEST "%DRIVEUfix%/games/%%I" --progress

::an empty cygdrive folder may be created previous directory, so delete it!
cd ..
if exist cygdrive rd /s /q cygdrive
cd /d %ModMiipath%


::-----create csv list of all games in "%DRIVEU%"\games\ -----

echo @echo Off>"%DriveU%"\Game-List-Updater[ModMii].bat
echo if exist TitleID.txt del TitleID.txtredirectnul>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo if exist GameTitleIDs.txt del GameTitleIDs.txtredirectnul>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo if exist Gamelist.txt del Gamelist.txtredirectnul>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo if exist Gamelist2.txt del Gamelist2.txtredirectnul>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo if exist Gamelist-sorted.txt del Gamelist-sorted.txtredirectnul>>"%DriveU%"\Game-List-Updater[ModMii].bat


echo dir games /A:D /b redirect GameTitleIDs.txt >>"%DriveU%"\Game-List-Updater[ModMii].bat



echo for /F "tokens=*" @@@@A in (GameTitleIDs.txt) do call :processmii @@@@A>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo goto:nextstep>>"%DriveU%"\Game-List-Updater[ModMii].bat

echo :processmii>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo set CurrentTitleID=@@*>>"%DriveU%"\Game-List-Updater[ModMii].bat

echo if /i "@@CurrentTitleID:~-8,1@@" EQU "[" rename "games\@@CurrentTitleID@@" "@@CurrentTitleID:~-7,6@@"redirectnul>>"%DriveU%"\Game-List-Updater[ModMii].bat

echo if /i "@@CurrentTitleID:~-8,1@@" EQU "[" set CurrentTitleID=@@CurrentTitleID:~-7,6@@>>"%DriveU%"\Game-List-Updater[ModMii].bat

echo FINDSTR /B /C:"@@CurrentTitleID:~0,6@@" titles.txtredirectTitleID.txt>>"%DriveU%"\Game-List-Updater[ModMii].bat

::if title ID not in titles.txt just add title ID only
echo for /F @@@@A in ("TitleID.txt") do If @@@@~zA equ 0 (echo @@CurrentTitleID:~0,6@@redirectredirectGamelist.txt) else (FINDSTR /B /C:"@@CurrentTitleID:~0,6@@" titles.txtredirectredirectGamelist.txt)>>"%DriveU%"\Game-List-Updater[ModMii].bat

echo goto:EOF>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo :nextstep>>"%DriveU%"\Game-List-Updater[ModMii].bat


echo if exist TitleID.txt del TitleID.txtredirectnul>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo if exist GameTitleIDs.txt del GameTitleIDs.txtredirectnul>>"%DriveU%"\Game-List-Updater[ModMii].bat



echo for /F "tokens=*" @@@@A in (Gamelist.txt) do call :processmii2 @@@@A>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo goto:nextstep>>"%DriveU%"\Game-List-Updater[ModMii].bat

echo :processmii2>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo set Line=@@*>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo echo @@Line:~9@@,@@Line:~0,6@@redirectredirectgamelist2.txt>>"%DriveU%"\Game-List-Updater[ModMii].bat

echo goto:EOF>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo :nextstep>>"%DriveU%"\Game-List-Updater[ModMii].bat


echo if exist Gamelist.txt del Gamelist.txtredirectnul>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo sort "Gamelist2.txt" redirect "Gamelist-sorted.txt">>"%DriveU%"\Game-List-Updater[ModMii].bat
echo if exist Gamelist2.txt del Gamelist2.txtredirectnul>>"%DriveU%"\Game-List-Updater[ModMii].bat


echo echo Number,Title,Title IDredirectGame-List[ModMii].csv>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo echo ,,redirectredirectGame-List[ModMii].csv>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo set countline=0 >>"%DriveU%"\Game-List-Updater[ModMii].bat

echo for /F "tokens=*" @@@@A in (Gamelist-sorted.txt) do call :processmii3 @@@@A>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo goto:nextstep>>"%DriveU%"\Game-List-Updater[ModMii].bat

echo :processmii3>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo set Line=@@*>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo SET /a countline=@@countline@@+1>>"%DriveU%"\Game-List-Updater[ModMii].bat



echo echo @@countline@@,@@line@@redirectredirectGame-List[ModMii].csv>>"%DriveU%"\Game-List-Updater[ModMii].bat

echo goto:EOF>>"%DriveU%"\Game-List-Updater[ModMii].bat
echo :nextstep>>"%DriveU%"\Game-List-Updater[ModMii].bat

echo if exist Gamelist-sorted.txt del Gamelist-sorted.txtredirectnul>>"%DriveU%"\Game-List-Updater[ModMii].bat


sfk filter "%DriveU%"\Game-List-Updater[ModMii].bat -spat -rep _@@_%%_ -rep _"redirect"_">"_ -write -yes>nul
sfk filter -quiet titles.txt -spat -rep _,_;_ -rep _"  "_" "_ >%DriveU%\titles.txt


cd /d "%DriveU%\"
call "Game-List-Updater[ModMii].bat"
cd /d %ModMiipath%


echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20[Green]GAME BULK EXTRACTION FOR SNEEK COMPLETE
echo.
echo A list of your games can be found here: %DriveU%\Game-List[ModMii].csv
echo To update this list at any time, run %DriveU%\Game-List-Updater[ModMii].bat
echo.
echo Press any key to return to the Main Menu.
pause>nul
goto:MENU


::........................................LIST / BATCH.......................................
:LIST
Set List=
cls
echo                                        ModMii                                v%currentversion%
sfk echo -spat \x20 \x20 \x20 \x20 \x20[Red] DOWNLOAD PAGE 1 [def]\x20 \x20 \x20 \x20 \x20 \x20 \x20by XFlak
echo.
echo      Choose files to add/remove to download queue (Selected files marked with an *)
echo.
echo       D = Download Selected Files    1/2/3/4 = Page 1/2/3/4        M = Main Menu
echo       C = Clear Download Queue       (blank) = Cycle Pages        DR = Drive Menu
echo.
if exist "%Drive%"\WAD echo                R = Rename Current %Drive%\WAD folder to %Drive%\WAD#
if exist "%Drive%"\WAD echo                    (otherwise WADs are saved to existing WAD Folder)
if exist "%Drive%"\WAD echo.
sfk echo -spat \x20Select Group: [Red](A)[def]ll, [Red](U)[def]SA, [Red](E)[def]URO, [Red](J)[def]AP, [Red](K)[def]OR, Active [Red](I)[def]OSs, Extra [Red](PR)[def]otection

echo.
sfk echo -spat \x20 \x20 [Red] System Menus \x20 \x20 \x20 \x20 \x20 Non-Fakesigned IOSs\MIOS \x20 \x20 \x20 \x20 Other WADs
echo.
echo    %SM3.2U% 3.2U = 3.2U SM             %IOS9% 9 = IOS9v1034         %RSU% RSU = Region Select v2(U)
echo    %SM4.1U% 4.1U = 4.1U SM	      %IOS12% 12 = IOS12v526         %RSE% RSE = Region Select v2(E)
echo    %SM4.2U% 4.2U = 4.2U SM	      %IOS13% 13 = IOS13v1032        %RSJ% RSJ = Region Select v2(J)
echo    %SM4.3U% 4.3U = 4.3U SM            %IOS14% 14 = IOS14v1032        %RSK% RSK = Region Select v2(K)
echo    %SM3.2E% 3.2E = 3.2E SM            %IOS15% 15 = IOS15v1032         %EULAU% EU = EULA v3(U)
echo    %SM4.1E% 4.1E = 4.1E SM            %IOS17% 17 = IOS17v1032         %EULAE% EE = EULA v3(E)
echo    %SM4.2E% 4.2E = 4.2E SM            %IOS21% 21 = IOS21v1039         %EULAJ% EJ = EULA v3(J)
echo    %SM4.3E% 4.3E = 4.3E SM            %IOS22% 22 = IOS22v1294         %EULAK% EK = EULA v3(K)
echo    %SM3.2J% 3.2J = 3.2J SM            %IOS28% 28 = IOS28v1807         %BC% BC = BC v6
echo    %SM4.1J% 4.1J = 4.1J SM          %IOS30% 30NP = IOS30v2576

sfk echo -spat \x20 \x20%SM4.2J% 4.2J = 4.2J SM \x20 \x20 \x20 \x20 \x20 \x20 %IOS31% 31 = IOS31v3608\x20 \x20 \x20 \x20 \x20 \x20[Red]Fakesigned IOSs

echo    %SM4.3J% 4.3J = 4.3J SM            %IOS33% 33 = IOS33v3608        
echo    %SM4.1K% 4.1K = 4.1K SM	      %IOS34% 34 = IOS34v3608         %IOS11P60% 11 = IOS11(IOS60P)
echo    %SM4.2K% 4.2K = 4.2K SM	      %IOS35% 35 = IOS35v3608         %IOS20P60% 20 = IOS20v16174(IOS60P)
echo    %SM4.3K% 4.3K = 4.3K SM           %IOS36% 36a = IOS36v3351         %IOS30P60% 30 = IOS30(IOS60P)
echo                               %IOS36v3608% 36 = IOS36v3608        %IOS30P% 30P = IOS30-Patched
sfk echo -spat \x20 \x20 \x20 \x20 [Red] Channels[def]\x20 \x20 \x20 \x20 \x20 \x20 \x20 %IOS37% 37 = IOS37v5663\x20 \x20 \x20 \x20 \x20 %IOS40P60% 40 = IOS40(IOS60P)
echo                               %IOS38% 38 = IOS38v4124         %IOS50P% 50 = IOS50-Patched
echo     %P% P = Photo 1.1(U/E/J)     %IOS41% 41 = IOS41v3607         %IOS52P% 52 = IOS52-Patched
echo    %PK% PK = Photo 1.1 (KOR)      %IOS43% 43 = IOS43v3607         %IOS60P% 60 = IOS60-Patched
echo    %S% SH = Shopping (U/E/J)     %IOS45% 45 = IOS45v3607        %IOS70K% 70K = IOS70(IOS60P)
echo    %SK% SK = Shopping (KOR)       %IOS46% 46 = IOS46v3607         %IOS70P% 70 = IOS70-Patched
echo    %IU% IU = Internet (USA)       %IOS48v4124% 48 = IOS48v4124        %IOS80K% 80K = IOS80(IOS60P)
echo    %IE% IE = Internet (EUR)       %IOS53% 53 = IOS53v5663         %IOS80P% 80 = IOS80-Patched
echo    %IJ% IJ = Internet (JAP)       %IOS55% 55 = IOS55v5663        %IOS236% 236 = IOS236(IOS36P)
echo    %WU% WU = Weather (USA)	      %IOS56% 56 = IOS56v5662
sfk echo -spat \x20 \x20%WE% WE = Weather (EUR) \x20 \x20 \x20 \x20 %IOS57% 57 = IOS57v5919\x20 \x20 \x20 \x20 \x20 \x20[Red] (S)NEEK Files
echo    %WJ% WJ = Weather (JAP)	      %IOS58% 58 = IOS58v6176         
echo    %NU% NU = News (USA)	    %IOS60% 60NP = IOS60v6174         %A0e% 0e = 0e.app IOS80v6943
echo    %NE% NE = News (EUR)	      %IOS61% 61 = IOS61v5662      %A0e_70% 0e_70 = 0e.app IOS70v6687
echo    %NJ% NJ = News (JAP)         %IOS70% 70NP = IOS70v6687      %A0e_60% 0e_60 = 0e.app IOS60v6174
echo   %WSU% WSU = WiiSpeak(USA)      %IOS80% 80NP = IOS80v6944         %A01% 01 = 01.app IOS80v6943
echo   %WSE% WSE = WiiSpeak(EUR)       %M10% M10 = MIOSv10         %A01_70% 01_70 = 01.app IOS70v6687
echo   %WSJ% WSJ = WiiSpeak(JAP)                              %A01_60% 01_60 = 01.app IOS60v6174
echo   %MII% Mii = Mii (RF)                                      %A0c% 0c = 0c.app MIOSv10
echo.

if not exist "%Drive%"\WAD echo.
if not exist "%Drive%"\WAD echo.
if not exist "%Drive%"\WAD echo.
set /p LIST=     Enter Selection Here: 


if /i "%LIST%" EQU "M" goto:MENU
if /i "%LIST%" EQU "D" set loadorgo=go
if /i "%LIST%" EQU "D" set BACKB4QUEUE=LIST
if /i "%LIST%" EQU "D" goto:DOWNLOADQUEUE
if /i "%LIST%" EQU "DR" set BACKB4DRIVE=LIST
if /i "%LIST%" EQU "DR" goto:DRIVECHANGE
if /i "%LIST%" EQU "C" goto:CLEAR
if /i "%LIST%" EQU "R" goto:COPY2

if /i "%LIST%" EQU "1" goto:LIST
if /i "%LIST%" EQU "2" goto:OLDLIST
if /i "%LIST%" EQU "3" goto:LIST3
if /i "%LIST%" EQU "4" goto:LIST4
if /i "%LIST%" EQU "ADV" goto:Advanced
IF "%LIST%"=="" goto:OLDLIST

if /i "%LIST%" EQU "A" goto:SelectAll
if /i "%LIST%" EQU "U" goto:UALL
if /i "%LIST%" EQU "E" goto:EALL
if /i "%LIST%" EQU "J" goto:JALL
if /i "%LIST%" EQU "K" goto:KALL
if /i "%LIST%" EQU "I" goto:IOSACTIVE
if /i "%LIST%" EQU "PR" goto:PROTECTIONFILES
if /i "%LIST%" EQU "S" goto:allsneekfiles

if /i "%LIST%" EQU "4.3U" goto:Switch4.3U
if /i "%LIST%" EQU "4.3E" goto:Switch4.3E
if /i "%LIST%" EQU "4.3J" goto:Switch4.3J
if /i "%LIST%" EQU "4.3K" goto:Switch4.3K
if /i "%LIST%" EQU "3.2U" goto:Switch3.2U
if /i "%LIST%" EQU "4.1U" goto:Switch4.1U
if /i "%LIST%" EQU "4.2U" goto:Switch4.2U
if /i "%LIST%" EQU "3.2E" goto:Switch3.2E
if /i "%LIST%" EQU "4.1E" goto:Switch4.1E
if /i "%LIST%" EQU "4.2E" goto:Switch4.2E
if /i "%LIST%" EQU "3.2J" goto:Switch3.2J
if /i "%LIST%" EQU "4.1J" goto:Switch4.1J
if /i "%LIST%" EQU "4.2J" goto:Switch4.2J
if /i "%LIST%" EQU "4.1K" goto:Switch4.1K
if /i "%LIST%" EQU "4.2K" goto:Switch4.2K
if /i "%LIST%" EQU "MII" goto:SwitchMII
if /i "%LIST%" EQU "P" goto:SwitchP
if /i "%LIST%" EQU "PK" goto:SwitchPK
if /i "%LIST%" EQU "SH" goto:SwitchS
if /i "%LIST%" EQU "SK" goto:SwitchSK
if /i "%LIST%" EQU "IU" goto:SwitchIU
if /i "%LIST%" EQU "IE" goto:SwitchIE
if /i "%LIST%" EQU "IJ" goto:SwitchIJ
if /i "%LIST%" EQU "WU" goto:SwitchWU
if /i "%LIST%" EQU "WE" goto:SwitchWE
if /i "%LIST%" EQU "WJ" goto:SwitchWJ
if /i "%LIST%" EQU "NU" goto:SwitchNU
if /i "%LIST%" EQU "NE" goto:SwitchNE
if /i "%LIST%" EQU "NJ" goto:SwitchNJ
if /i "%LIST%" EQU "WSU" goto:SwitchWSU
if /i "%LIST%" EQU "WSE" goto:SwitchWSE
if /i "%LIST%" EQU "WSJ" goto:SwitchWSJ
if /i "%LIST%" EQU "M10" goto:SwitchM10


if /i "%LIST%" EQU "9" goto:Switch9
if /i "%LIST%" EQU "12" goto:Switch12
if /i "%LIST%" EQU "13" goto:Switch13
if /i "%LIST%" EQU "14" goto:Switch14
if /i "%LIST%" EQU "15" goto:Switch15

if /i "%LIST%" EQU "17" goto:Switch17
if /i "%LIST%" EQU "20" goto:Switch20P60
if /i "%LIST%" EQU "11" goto:Switch11P60
if /i "%LIST%" EQU "21" goto:Switch21
if /i "%LIST%" EQU "22" goto:Switch22
if /i "%LIST%" EQU "28" goto:Switch28
if /i "%LIST%" EQU "30" goto:Switch30P60
if /i "%LIST%" EQU "30P" goto:Switch30P
if /i "%LIST%" EQU "31" goto:Switch31
if /i "%LIST%" EQU "33" goto:Switch33
if /i "%LIST%" EQU "34" goto:Switch34
if /i "%LIST%" EQU "35" goto:Switch35
if /i "%LIST%" EQU "36a" goto:Switch36
if /i "%LIST%" EQU "37" goto:Switch37
if /i "%LIST%" EQU "38" goto:Switch38
if /i "%LIST%" EQU "36" goto:Switch36v3608

if /i "%LIST%" EQU "40" goto:Switch40P60
if /i "%LIST%" EQU "41" goto:Switch41
if /i "%LIST%" EQU "43" goto:Switch43
if /i "%LIST%" EQU "45" goto:Switch45
if /i "%LIST%" EQU "46" goto:Switch46
if /i "%LIST%" EQU "50" goto:Switch50P
if /i "%LIST%" EQU "52" goto:Switch52P
if /i "%LIST%" EQU "53" goto:Switch53
if /i "%LIST%" EQU "55" goto:Switch55
if /i "%LIST%" EQU "56" goto:Switch56
if /i "%LIST%" EQU "57" goto:Switch57
if /i "%LIST%" EQU "58" goto:Switch58
if /i "%LIST%" EQU "60" goto:Switch60P
if /i "%LIST%" EQU "61" goto:Switch61
if /i "%LIST%" EQU "70" goto:Switch70P
if /i "%LIST%" EQU "70K" goto:Switch70K
if /i "%LIST%" EQU "80K" goto:Switch80K
if /i "%LIST%" EQU "80" goto:Switch80P
if /i "%LIST%" EQU "236" goto:SwitchIOS236
if /i "%LIST%" EQU "30NP" goto:SwitchIOS30
if /i "%LIST%" EQU "48" goto:SwitchIOS48v4124
if /i "%LIST%" EQU "60NP" goto:SwitchIOS60
if /i "%LIST%" EQU "70NP" goto:SwitchIOS70
if /i "%LIST%" EQU "80NP" goto:SwitchIOS80

if /i "%LIST%" EQU "RSU" goto:SwitchRSU
if /i "%LIST%" EQU "RSE" goto:SwitchRSE
if /i "%LIST%" EQU "RSJ" goto:SwitchRSJ
if /i "%LIST%" EQU "RSK" goto:SwitchRSK
if /i "%LIST%" EQU "EU" goto:SwitchEULAU
if /i "%LIST%" EQU "EE" goto:SwitchEULAE
if /i "%LIST%" EQU "EJ" goto:SwitchEULAJ
if /i "%LIST%" EQU "EK" goto:SwitchEULAK
if /i "%LIST%" EQU "BC" goto:SwitchBC

if /i "%LIST%" EQU "0e" goto:SwitchA0e
if /i "%LIST%" EQU "01" goto:switchA01
if /i "%LIST%" EQU "0e_70" goto:SwitchA0e_70
if /i "%LIST%" EQU "01_70" goto:switchA01_70
if /i "%LIST%" EQU "0e_60" goto:SwitchA0e_60
if /i "%LIST%" EQU "01_60" goto:switchA01_60
if /i "%LIST%" EQU "0c" goto:SwitchA0c

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:list



:Switch3.2U
if /i "%SM3.2U%" EQU "*" goto:switch3.2Uoff
set SM3.2U=*
goto:list
:switch3.2Uoff
set SM3.2U=
goto:list

:Switch4.1U
if /i "%SM4.1U%" EQU "*" goto:switch4.1Uoff
set SM4.1U=*
goto:list
:switch4.1Uoff
set SM4.1U=
goto:list

:Switch4.2U
if /i "%SM4.2U%" EQU "*" goto:switch4.2Uoff
set SM4.2U=*
goto:list
:switch4.2Uoff
set SM4.2U=
goto:list

:Switch4.3U
if /i "%SM4.3U%" EQU "*" goto:switch4.3Uoff
set SM4.3U=*
goto:list
:switch4.3Uoff
set SM4.3U=
goto:list

:Switch3.2E
if /i "%SM3.2E%" EQU "*" goto:switch3.2Eoff
set SM3.2E=*
goto:list
:switch3.2Eoff
set SM3.2E=
goto:list

:Switch4.1E
if /i "%SM4.1E%" EQU "*" goto:switch4.1Eoff
set SM4.1E=*
goto:list
:switch4.1Eoff
set SM4.1E=
goto:list

:Switch4.2E
if /i "%SM4.2E%" EQU "*" goto:switch4.2Eoff
set SM4.2E=*
goto:list
:switch4.2Eoff
set SM4.2E=
goto:list

:Switch4.3E
if /i "%SM4.3E%" EQU "*" goto:switch4.3Eoff
set SM4.3E=*
goto:list
:switch4.3Eoff
set SM4.3E=
goto:list

:Switch3.2J
if /i "%SM3.2J%" EQU "*" goto:switch3.2Joff
set SM3.2J=*
goto:list
:switch3.2Joff
set SM3.2J=
goto:list

:Switch4.1J
if /i "%SM4.1J%" EQU "*" goto:switch4.1Joff
set SM4.1J=*
goto:list
:switch4.1Joff
set SM4.1J=
goto:list

:Switch4.2J
if /i "%SM4.2J%" EQU "*" goto:switch4.2Joff
set SM4.2J=*
goto:list
:switch4.2Joff
set SM4.2J=
goto:list

:Switch4.3J
if /i "%SM4.3J%" EQU "*" goto:switch4.3Joff
set SM4.3J=*
goto:list
:switch4.3Joff
set SM4.3J=
goto:list

:Switch4.1K
if /i "%SM4.1K%" EQU "*" goto:switch4.1Koff
set SM4.1K=*
goto:list
:switch4.1Koff
set SM4.1K=
goto:list

:Switch4.2K
if /i "%SM4.2K%" EQU "*" goto:switch4.2Koff
set SM4.2K=*
goto:list
:switch4.2Koff
set SM4.2K=
goto:list

:Switch4.3K
if /i "%SM4.3K%" EQU "*" goto:switch4.3Koff
set SM4.3K=*
goto:list
:switch4.3Koff
set SM4.3K=
goto:list

:SwitchMii
if /i "%Mii%" EQU "*" goto:switchMiioff
set Mii=*
goto:list
:switchMiioff
set Mii=
goto:list

:SwitchP
if /i "%P%" EQU "*" goto:switchPoff
set P=*
goto:list
:switchPoff
set P=
goto:list

:SwitchPK
if /i "%PK%" EQU "*" goto:switchPKoff
set PK=*
goto:list
:switchPKoff
set PK=
goto:list

:SwitchS
if /i "%S%" EQU "*" goto:switchSoff
set S=*
goto:list
:switchSoff
set S=
goto:list

:SwitchSK
if /i "%SK%" EQU "*" goto:switchSKoff
set SK=*
goto:list
:switchSKoff
set SK=
goto:list

:SwitchIU
if /i "%IU%" EQU "*" goto:switchIUoff
set IU=*
goto:list
:switchIUoff
set IU=
goto:list

:SwitchIE
if /i "%IE%" EQU "*" goto:switchIEoff
set IE=*
goto:list
:switchIEoff
set IE=
goto:list

:SwitchIJ
if /i "%IJ%" EQU "*" goto:switchIJoff
set IJ=*
goto:list
:switchIJoff
set IJ=
goto:list

:SwitchWU
if /i "%WU%" EQU "*" goto:switchWUoff
set WU=*
goto:list
:switchWUoff
set WU=
goto:list

:SwitchWE
if /i "%WE%" EQU "*" goto:switchWEoff
set WE=*
goto:list
:switchWEoff
set WE=
goto:list

:SwitchWJ
if /i "%WJ%" EQU "*" goto:switchWJoff
set WJ=*
goto:list
:switchWJoff
set WJ=
goto:list

:SwitchNU
if /i "%NU%" EQU "*" goto:switchNUoff
set NU=*
goto:list
:switchNUoff
set NU=
goto:list

:SwitchNE
if /i "%NE%" EQU "*" goto:switchNEoff
set NE=*
goto:list
:switchNEoff
set NE=
goto:list

:SwitchNJ
if /i "%NJ%" EQU "*" goto:switchNJoff
set NJ=*
goto:list
:switchNJoff
set NJ=
goto:list

:SwitchWSU
if /i "%WSU%" EQU "*" goto:switchWSUoff
set WSU=*
goto:list
:switchWSUoff
set WSU=
goto:list

:SwitchWSE
if /i "%WSE%" EQU "*" goto:switchWSEoff
set WSE=*
goto:list
:switchWSEoff
set WSE=
goto:list

:SwitchWSJ
if /i "%WSJ%" EQU "*" goto:switchWSJoff
set WSJ=*
goto:list
:switchWSJoff
set WSJ=
goto:list

:SwitchM10
if /i "%M10%" EQU "*" goto:switchM10off
set M10=*
goto:list
:switchM10off
set M10=
goto:list

:Switch9
if /i "%IOS9%" EQU "*" goto:switchIOS9off
set IOS9=*
goto:list
:switchIOS9off
set IOS9=
goto:list

:Switch12
if /i "%IOS12%" EQU "*" goto:switchIOS12off
set IOS12=*
goto:list
:switchIOS12off
set IOS12=
goto:list

:Switch13
if /i "%IOS13%" EQU "*" goto:switchIOS13off
set IOS13=*
goto:list
:switchIOS13off
set IOS13=
goto:list

:Switch14
if /i "%IOS14%" EQU "*" goto:switchIOS14off
set IOS14=*
goto:list
:switchIOS14off
set IOS14=
goto:list

:Switch15
if /i "%IOS15%" EQU "*" goto:switchIOS15off
set IOS15=*
goto:list
:switchIOS15off
set IOS15=
goto:list

:Switch17
if /i "%IOS17%" EQU "*" goto:switchIOS17off
set IOS17=*
goto:list
:switchIOS17off
set IOS17=
goto:list

:Switch21
if /i "%IOS21%" EQU "*" goto:switchIOS21off
set IOS21=*
goto:list
:switchIOS21off
set IOS21=
goto:list

:Switch22
if /i "%IOS22%" EQU "*" goto:switchIOS22off
set IOS22=*
goto:list
:switchIOS22off
set IOS22=
goto:list

:Switch28
if /i "%IOS28%" EQU "*" goto:switchIOS28off
set IOS28=*
goto:list
:switchIOS28off
set IOS28=
goto:list

:Switch40P60
if /i "%IOS40P60%" EQU "*" goto:switchIOS40P60off
set IOS40P60=*
goto:list
:switchIOS40P60off
set IOS40P60=
goto:list

:Switch30P60
if /i "%IOS30P60%" EQU "*" goto:switchIOS30P60off
set IOS30P60=*
goto:list
:switchIOS30P60off
set IOS30P60=
goto:list

:Switch30P
if /i "%IOS30P%" EQU "*" goto:switchIOS30Poff
set IOS30P=*
goto:list
:switchIOS30Poff
set IOS30P=
goto:list

:Switch31
if /i "%IOS31%" EQU "*" goto:switchIOS31off
set IOS31=*
goto:list
:switchIOS31off
set IOS31=
goto:list

:Switch33
if /i "%IOS33%" EQU "*" goto:switchIOS33off
set IOS33=*
goto:list
:switchIOS33off
set IOS33=
goto:list

:Switch34
if /i "%IOS34%" EQU "*" goto:switchIOS34off
set IOS34=*
goto:list
:switchIOS34off
set IOS34=
goto:list

:Switch35
if /i "%IOS35%" EQU "*" goto:switchIOS35off
set IOS35=*
goto:list
:switchIOS35off
set IOS35=
goto:list

:Switch36
if /i "%IOS36%" EQU "*" goto:switchIOS36off
set IOS36=*
goto:list
:switchIOS36off
set IOS36=
goto:list

:Switch37
if /i "%IOS37%" EQU "*" goto:switchIOS37off
set IOS37=*
goto:list
:switchIOS37off
set IOS37=
goto:list

:Switch38
if /i "%IOS38%" EQU "*" goto:switchIOS38off
set IOS38=*
goto:list
:switchIOS38off
set IOS38=
goto:list

:Switch41
if /i "%IOS41%" EQU "*" goto:switchIOS41off
set IOS41=*
goto:list
:switchIOS41off
set IOS41=
goto:list

:Switch43
if /i "%IOS43%" EQU "*" goto:switchIOS43off
set IOS43=*
goto:list
:switchIOS43off
set IOS43=
goto:list

:Switch45
if /i "%IOS45%" EQU "*" goto:switchIOS45off
set IOS45=*
goto:list
:switchIOS45off
set IOS45=
goto:list

:Switch46
if /i "%IOS46%" EQU "*" goto:switchIOS46off
set IOS46=*
goto:list
:switchIOS46off
set IOS46=
goto:list

:Switch50P
if /i "%IOS50P%" EQU "*" goto:switchIOS50Poff
set IOS50P=*
goto:list
:switchIOS50Poff
set IOS50P=
goto:list

:Switch52P
if /i "%IOS52P%" EQU "*" goto:switchIOS52Poff
set IOS52P=*
goto:list
:switchIOS52Poff
set IOS52P=
goto:list

:Switch11P60
if /i "%IOS11P60%" EQU "*" goto:switchIOS11P60off
set IOS11P60=*
goto:list
:switchIOS11P60off
set IOS11P60=
goto:list

:Switch20P60
if /i "%IOS20P60%" EQU "*" goto:switchIOS20P60off
set IOS20P60=*
goto:list
:switchIOS20P60off
set IOS20P60=
goto:list

:Switch53
if /i "%IOS53%" EQU "*" goto:switchIOS53off
set IOS53=*
goto:list
:switchIOS53off
set IOS53=
goto:list

:Switch55
if /i "%IOS55%" EQU "*" goto:switchIOS55off
set IOS55=*
goto:list
:switchIOS55off
set IOS55=
goto:list

:Switch56
if /i "%IOS56%" EQU "*" goto:switchIOS56off
set IOS56=*
goto:list
:switchIOS56off
set IOS56=
goto:list

:Switch57
if /i "%IOS57%" EQU "*" goto:switchIOS57off
set IOS57=*
goto:list
:switchIOS57off
set IOS57=
goto:list

:Switch58
if /i "%IOS58%" EQU "*" goto:switchIOS58off
set IOS58=*
goto:list
:switchIOS58off
set IOS58=
goto:list


:Switch60P
if /i "%IOS60P%" EQU "*" goto:switchIOS60Poff
set IOS60P=*
goto:list
:switchIOS60Poff
set IOS60P=
goto:list

:Switch61
if /i "%IOS61%" EQU "*" goto:switchIOS61off
set IOS61=*
goto:list
:switchIOS61off
set IOS61=
goto:list

:Switch70P
if /i "%IOS70P%" EQU "*" goto:switchIOS70Poff
set IOS70P=*
goto:list
:switchIOS70Poff
set IOS70P=
goto:list

:Switch80P
if /i "%IOS80P%" EQU "*" goto:switchIOS80Poff
set IOS80P=*
goto:list
:switchIOS80Poff
set IOS80P=
goto:list

:SwitchIOS236
if /i "%IOS236%" EQU "*" goto:switchIOS236off
set IOS236=*
goto:list
:switchIOS236off
set IOS236=
goto:list

:Switch70K
if /i "%IOS70K%" EQU "*" goto:switchIOS70Koff
set IOS70K=*
goto:list
:switchIOS70Koff
set IOS70K=
goto:list

:Switch80K
if /i "%IOS80K%" EQU "*" goto:switchIOS80Koff
set IOS80K=*
goto:list
:switchIOS80Koff
set IOS80K=
goto:list

:SwitchIOS30
if /i "%IOS30%" EQU "*" goto:switchIOS30off
set IOS30=*
goto:LIST
:switchIOS30off
set IOS30=
goto:LIST

:SwitchIOS48v4124
if /i "%IOS48v4124%" EQU "*" goto:switchIOS48v4124off
set IOS48v4124=*
goto:LIST
:switchIOS48v4124off
set IOS48v4124=
goto:LIST

:SwitchIOS60
if /i "%IOS60%" EQU "*" goto:switchIOS60off
set IOS60=*
goto:LIST
:switchIOS60off
set IOS60=
goto:LIST

:SwitchIOS70
if /i "%IOS70%" EQU "*" goto:switchIOS70off
set IOS70=*
goto:LIST
:switchIOS70off
set IOS70=
goto:LIST

:SwitchIOS80
if /i "%IOS80%" EQU "*" goto:switchIOS80off
set IOS80=*
goto:LIST
:switchIOS80off
set IOS80=
goto:LIST




:Switch36v3608
if /i "%IOS36v3608%" EQU "*" goto:switchIOS36v3608off
set IOS36v3608=*
goto:LIST
:switchIOS36v3608off
set IOS36v3608=
goto:LIST



:SwitchEULAU
if /i "%EULAU%" EQU "*" goto:switchEULAUoff
set EULAU=*
goto:LIST
:switchEULAUoff
set EULAU=
goto:LIST

:SwitchEULAE
if /i "%EULAE%" EQU "*" goto:switchEULAEoff
set EULAE=*
goto:LIST
:switchEULAEoff
set EULAE=
goto:LIST

:SwitchEULAJ
if /i "%EULAJ%" EQU "*" goto:switchEULAJoff
set EULAJ=*
goto:LIST
:switchEULAJoff
set EULAJ=
goto:LIST

:SwitchEULAK
if /i "%EULAK%" EQU "*" goto:switchEULAKoff
set EULAK=*
goto:LIST
:switchEULAKoff
set EULAK=
goto:LIST

:SwitchRSU
if /i "%RSU%" EQU "*" goto:switchRSUoff
set RSU=*
goto:LIST
:switchRSUoff
set RSU=
goto:LIST

:SwitchRSE
if /i "%RSE%" EQU "*" goto:switchRSEoff
set RSE=*
goto:LIST
:switchRSEoff
set RSE=
goto:LIST

:SwitchRSJ
if /i "%RSJ%" EQU "*" goto:switchRSJoff
set RSJ=*
goto:LIST
:switchRSJoff
set RSJ=
goto:LIST

:SwitchRSK
if /i "%RSK%" EQU "*" goto:switchRSKoff
set RSK=*
goto:LIST
:switchRSKoff
set RSK=
goto:LIST

:SwitchBC
if /i "%BC%" EQU "*" goto:switchBCoff
set BC=*
goto:LIST
:switchBCoff
set BC=
goto:LIST


:switchA0e
if /i "%A0e%" EQU "*" goto:switchA0eoff
set A0e=*
goto:LIST
:switchA0eoff
set A0e=
goto:LIST


:switchA0e_70
if /i "%A0e_70%" EQU "*" goto:switchA0e_70off
set A0e_70=*
goto:LIST
:switchA0e_70off
set A0e_70=
goto:LIST

:switchA0e_60
if /i "%A0e_60%" EQU "*" goto:switchA0e_60off
set A0e_60=*
goto:LIST
:switchA0e_60off
set A0e_60=
goto:LIST

:switchA0c
if /i "%A0c%" EQU "*" goto:switchA0coff
set A0c=*
goto:LIST
:switchA0coff
set A0c=
goto:LIST

:switchA01
if /i "%A01%" EQU "*" goto:switchA01off
set A01=*
goto:LIST
:switchA01off
set A01=
goto:LIST

:switchA01_70
if /i "%A01_70%" EQU "*" goto:switchA01_70off
set A01_70=*
goto:LIST
:switchA01_70off
set A01_70=
goto:LIST

:switchA01_60
if /i "%A01_60%" EQU "*" goto:switchA01_60off
set A01_60=*
goto:LIST
:switchA01_60off
set A01_60=
goto:LIST



:SELECTALL

:PROTECTIONFILES
set IOS11P60=*
set IOS20P60=*
set IOS30P60=*
set IOS40P60=*
set IOS50P=*
set IOS52P=*
set IOS60P=*
set IOS70K=*
set IOS80K=*

if /i "%LIST%" EQU "PR" goto:list

:UALL
set MII=*
set P=*
set S=*
set IU=*
set WU=*
set NU=*
set WSU=*
if /i "%LIST%" EQU "U" goto:list

:EALL
set MII=*
set P=*
set S=*
set IE=*
set WE=*
set NE=*
set WSE=*
if /i "%LIST%" EQU "E" goto:list

:JALL
set MII=*
set P=*
set S=*
set IJ=*
set WJ=*
set NJ=*
set WSJ=*
if /i "%LIST%" EQU "J" goto:list

:KALL
set MII=*
set PK=*
set SK=*
::set IOS70K=*
set IOS80K=*

if /i "%LIST%" EQU "K" goto:list






:BASEWADS
set IOS37=*
set IOS38=*
set IOS57=*
if /i "%LIST%" EQU "B" goto:list

:IOSACTIVE
set M10=*
set IOS9=*
set IOS12=*
set IOS13=*
set IOS14=*
set IOS15=*
set IOS17=*
set IOS21=*
set IOS22=*
set IOS28=*
set IOS31=*
set IOS33=*
set IOS34=*
set IOS35=*
set IOS36v3608=*
set IOS37=*
set IOS38=*
set IOS53=*
set IOS55=*
set IOS56=*
set IOS57=*
set IOS58=*
set IOS61=*
set IOS80P=*
set IOS41=*
set IOS43=*
set IOS45=*
set IOS46=*
set IOS48v4124=*

if /i "%LIST%" EQU "I" goto:list

:allsneekfiles
set A0e=*
set A0c=*
set A01=*
set A0e_70=*
set A01_70=*
set A0e_60=*
set A01_60=*
if /i "%LIST%" EQU "S" goto:LIST

::not in any list

set SM3.2U=*
set SM4.1U=*
set SM4.2U=*
set SM4.3U=*
set SM3.2E=*
set SM4.1E=*
set SM4.2E=*
set SM4.3E=*
set SM3.2J=*
set SM4.1J=*
set SM4.2J=*
set SM4.3J=*
set SM4.1K=*
set SM4.2K=*
set SM4.3K=*
set IOS236=*
set IOS36=*
set IOS30P=*

set IOS70P=*
set ios30=*

set ios60=*
set ios70=*
set ios80=*
set IOS36=*



set EULAU=*
set EULAE=*
set EULAJ=*
set EULAK=*
set RSU=*
set RSE=*
set RSJ=*
set RSK=*
set BC=*



goto:list



::........................................Additional OLDLIST / BATCH.......................................
:OLDLIST
Set OLDLIST=
cls
echo                                        ModMii                                v%currentversion%
sfk echo -spat \x20 \x20 \x20 \x20 \x20[Red] DOWNLOAD PAGE 2 [def]\x20 \x20 \x20 \x20 \x20 \x20 \x20by XFlak

echo.
echo      Choose files to add/remove to download queue (Selected files marked with an *)
echo.
echo       D = Download Selected Files    1/2/3/4 = Page 1/2/3/4        M = Main Menu
echo       C = Clear Download Queue       (blank) = Cycle Pages        DR = Drive Menu
echo.
if exist "%Drive%"\WAD echo                R = Rename Current %Drive%\WAD folder to %Drive%\WAD#
if exist "%Drive%"\WAD echo                    (otherwise WADs are saved to existing WAD Folder)
if exist "%Drive%"\WAD echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 Select Group: [Red](A)[def]ll, [Red](U)[def]SB-Loader, [Red](J)[def]ust for Fun, [Red](E)[def]xploits
echo.

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 [Red] USB-Loader Files  \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Just For Fun!
echo.
echo      %usbfolder% CFG = CFG-Loader (Full v249)        %WiiMC% WMC = WiiMC (Media Player)
echo   %cfg249% CFG249 = CFG-Loader (Beta v249)        %fceugx% NES = FCEUGX (NES Emulator)
echo   %cfg222% CFG222 = CFG-Loader (Beta v222)       %snes9xgx% SNES = SNES9xGX (SNES Emulator)
echo     %cfgr% CFGR = Configurator-CFG-Loader       %vbagx% VBA = VBAGX (GB/GBA Emulator)
echo      %wbm% WBM = WiiBackupManager               %WII64% W64 = Wii64 beta1.1 (N64 Emulator) 
echo     %FLOW% FLOW = WiiFlow                        %WIISX% WSX = WiiSX beta2.1 (PS1 Emulator)
echo     %USBX% USBX = USB-Loader Fwdr Chnl           %HBB% HBB = Homebrew Browser
echo      %neogamma% NEO = Neogamma Backup Disc Loader   %SGM% SGM = SaveGame Manager GX
echo       %CheatCodes% CC = %cheatregion% Region Cheat Codes         %WIIX% WX = WiiXplorer
echo       %AccioHacks% AH = AccioHacks                      %locked% LA = Locked HBC Folder (Pass: UDLRAB)
echo      %F32% F32 = FAT32 GUI Formatter            %JOYF% JFF = Joy Flow Forwarder Channel/dol
echo                                             %JOY% JF = Joy Flow
echo                                            %S2U% S2U = Switch2Uneek
echo.

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Wii Apps \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Exploits
echo.
echo       %HM% HM = HackMii Installer             %BB1% BB1 = Bannerbomb v1
echo      %bootmiisd% BSD = BootMii SD Files              %BB2% BB2 = Bannerbomb v2
echo     %yawm% YAWM = Yet Another Wad Manager Mod  %Pwns% PWNS = Indiana Pwns (USA\EUR\JAP)
echo      %MMM% MMM = Multi-Mod Manager               %Smash% SS = Smash Stack (USA\EUR\JAP\KOR)
echo      %dop% DOP = Dop-Mii                         %YUGI% YU = YU-GI-OWNED (USA\EUR\JAP)
echo      %IOS236Installer% 236 = IOS236 Installer                %BATHAXX% BH = BATHAXX (USA\EUR\JAP)
echo      %SIP% SIP = Simple IOS Patcher              %ROTJ% RJ = Return of the JODI (USA\EUR\JAP)
echo      %Pri% Pri = Priiloader v0.7 (236 Mod)      %Twi% Twi = Twilight Hack (USA\EUR\JAP)
echo      %HAX% HAX = Priiloader Hacks.ini            %TOS% EH = Eri HaKawai (USA\EUR\JAP)
echo      %W20% W20 = Wanin's cIOS v20b Installer
echo      %W19% W19 = Wanin's cIOS v19 Installer
echo       %h4% H4 = Hermes cIOS v4 Installer
echo       %H5% H5 = Hermes cIOS v5 Installer
echo      %H51% H51 = Hermes cIOS v5.1 Installer
echo       %MP% MP = MIOS Patcher 0.2 (WiiGator)
echo       %CM5% CM = cMIOS rev5 Installer (Waninkoko)
echo      %HBF% HBF = Homebrew Filter
::echo     %Y4M% Y4M = YAWMM 4 ModMii
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] LEGEND:[def] \x22=\x22 Auto-Updating Downloads
echo.



if not exist "%Drive%"\WAD echo.
if not exist "%Drive%"\WAD echo.
if not exist "%Drive%"\WAD echo.

set /p OLDLIST=     Enter Selection Here: 

if /i "%OLDLIST%" EQU "M" goto:MENU
if /i "%OLDLIST%" EQU "D" set BACKB4QUEUE=OLDLIST
if /i "%OLDLIST%" EQU "D" set loadorgo=go
if /i "%OLDLIST%" EQU "D" goto:DOWNLOADQUEUE
if /i "%OLDLIST%" EQU "DR" set BACKB4DRIVE=OLDLIST
if /i "%OLDLIST%" EQU "DR" goto:DRIVECHANGE
if /i "%OLDLIST%" EQU "C" goto:CLEAR
if /i "%OLDLIST%" EQU "R" goto:COPY2

if /i "%OLDLIST%" EQU "A" goto:SelectAllOLD
if /i "%OLDLIST%" EQU "J" goto:SelectJust4FunOLD
if /i "%OLDLIST%" EQU "U" goto:USBLOADERSELECT
if /i "%OLDLIST%" EQU "E" goto:ExploitsSELECT


if /i "%OLDLIST%" EQU "1" goto:LIST
if /i "%OLDLIST%" EQU "2" goto:OLDLIST
if /i "%OLDLIST%" EQU "3" goto:LIST3
if /i "%OLDLIST%" EQU "4" goto:LIST4
if /i "%OLDLIST%" EQU "ADV" goto:ADVANCED
IF "%OLDLIST%"=="" goto:LIST3



if /i "%OLDLIST%" EQU "h4" goto:Switchh4
if /i "%OLDLIST%" EQU "h5" goto:Switchh5
if /i "%OLDLIST%" EQU "h51" goto:Switchh51

if /i "%OLDLIST%" EQU "w19" goto:Switchw19
if /i "%OLDLIST%" EQU "w20" goto:Switchw20

if /i "%OLDLIST%" EQU "MP" goto:SwitchMP
if /i "%OLDLIST%" EQU "CM" goto:SwitchCM
if /i "%OLDLIST%" EQU "AH" goto:SwitchAccioHacks
if /i "%OLDLIST%" EQU "BSD" goto:Switchbootmiisd


if /i "%OLDLIST%" EQU "BB1" goto:SwitchBB1
if /i "%OLDLIST%" EQU "BB2" goto:SwitchBB2
if /i "%OLDLIST%" EQU "HM" goto:SwitchHM
if /i "%OLDLIST%" EQU "LA" goto:Switchlocked
if /i "%OLDLIST%" EQU "dop" goto:Switchdop
if /i "%OLDLIST%" EQU "HBB" goto:SwitchHBB
if /i "%OLDLIST%" EQU "W64" goto:SwitchWII64
if /i "%OLDLIST%" EQU "WSX" goto:SwitchWIISX
if /i "%OLDLIST%" EQU "pwns" goto:Switchpwns
if /i "%OLDLIST%" EQU "Twi" goto:SwitchTwi
if /i "%OLDLIST%" EQU "Yu" goto:SwitchYUGI
if /i "%OLDLIST%" EQU "BH" goto:SwitchBATHAXX
if /i "%OLDLIST%" EQU "RJ" goto:SwitchROTJ
if /i "%OLDLIST%" EQU "EH" goto:SwitchTOS
if /i "%OLDLIST%" EQU "ss" goto:Switchsmash
if /i "%OLDLIST%" EQU "mmm" goto:Switchmmm
if /i "%OLDLIST%" EQU "236" goto:SwitchIOS236Installer
if /i "%OLDLIST%" EQU "SIP" goto:SwitchSIP
if /i "%OLDLIST%" EQU "JF" goto:SwitchJOY
if /i "%OLDLIST%" EQU "yawm" goto:Switchyawm
if /i "%OLDLIST%" EQU "neo" goto:Switchneogamma
if /i "%OLDLIST%" EQU "cfg249" goto:Switchcfg249
if /i "%OLDLIST%" EQU "cfg222" goto:Switchcfg222
if /i "%OLDLIST%" EQU "cfg" goto:Switchusbfolder
if /i "%OLDLIST%" EQU "WMC" goto:SwitchWiiMC
if /i "%OLDLIST%" EQU "NES" goto:Switchfceugx
if /i "%OLDLIST%" EQU "SNES" goto:Switchsnes9xgx
if /i "%OLDLIST%" EQU "VBA" goto:Switchvbagx
if /i "%OLDLIST%" EQU "SGM" goto:SwitchSGM
if /i "%OLDLIST%" EQU "WX" goto:SwitchWIIX
if /i "%OLDLIST%" EQU "cfgr" goto:Switchcfgr
if /i "%OLDLIST%" EQU "wbm" goto:Switchwbm
if /i "%OLDLIST%" EQU "cc" goto:SwitchCheatCodes


if /i "%OLDLIST%" EQU "f32" goto:Switchf32
if /i "%OLDLIST%" EQU "FLOW" goto:SwitchFLOW
if /i "%OLDLIST%" EQU "USBX" goto:SwitchUSBX
if /i "%OLDLIST%" EQU "JFF" goto:SwitchJOYF
if /i "%OLDLIST%" EQU "S2U" goto:SwitchS2U
if /i "%OLDLIST%" EQU "HBF" goto:SwitchHBF
if /i "%OLDLIST%" EQU "Pri" goto:SwitchPri
if /i "%OLDLIST%" EQU "HAX" goto:SwitchHAX

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:OLDLIST


:Switchh4
if /i "%H4%" EQU "*" goto:switchH4off
set H4=*
goto:OLDLIST
:switchH4off
set H4=
goto:OLDLIST

:Switchh5
if /i "%H5%" EQU "*" goto:switchH5off
set H5=*
goto:oldlist
:switchH5off
set H5=
goto:oldlist

:SwitchH51
if /i "%H51%" EQU "*" goto:switchH51off
set H51=*
goto:OLDLIST
:switchH51off
set H51=
goto:OLDLIST

:Switchw19
if /i "%W19%" EQU "*" goto:switchW19off
set W19=*
goto:oldlist
:switchW19off
set W19=
goto:oldlist

:Switchw20
if /i "%w20%" EQU "*" goto:switchw20off
set w20=*
goto:oldlist
:switchw20off
set w20=
goto:oldlist


:SwitchCM
if /i "%CM5%" EQU "*" goto:switchCM5off
set CM5=*
goto:oldlist
:switchCM5off
set CM5=
goto:oldlist


:SwitchAccioHacks
if /i "%AccioHacks%" EQU "*" goto:switchAccioHacksoff
set AccioHacks=*
goto:oldlist
:switchAccioHacksoff
set AccioHacks=
goto:oldlist

:SwitchMP
if /i "%MP%" EQU "*" goto:switchMPoff
set MP=*
goto:oldlist
:switchMPoff
set MP=
goto:oldlist




:Switchbootmiisd
if /i "%bootmiisd%" EQU "*" goto:switchbootmiisdoff
set bootmiisd=*
goto:oldlist
:switchbootmiisdoff
set bootmiisd=
goto:oldlist




:SwitchBB1
if /i "%BB1%" EQU "*" goto:switchBB1off
set BB1=*
goto:OLDLIST
:switchBB1off
set BB1=
goto:OLDLIST

:SwitchBB2
if /i "%BB2%" EQU "*" goto:switchBB2off
set BB2=*
goto:OLDLIST
:switchBB2off
set BB2=
goto:OLDLIST

:SwitchHM
if /i "%HM%" EQU "*" goto:switchHMoff
set HM=*
goto:OLDLIST
:switchHMoff
set HM=
goto:OLDLIST

:Switchpwns
if /i "%pwns%" EQU "*" goto:switchpwnsoff
set pwns=*
goto:OLDLIST
:switchpwnsoff
set pwns=
goto:OLDLIST

:SwitchTwi
if /i "%Twi%" EQU "*" goto:switchTwioff
set Twi=*
goto:OLDLIST
:switchTwioff
set Twi=
goto:OLDLIST


:SwitchYUGI
if /i "%YUGI%" EQU "*" goto:switchYUGIoff
set YUGI=*
goto:OLDLIST
:switchYUGIoff
set YUGI=
goto:OLDLIST

:SwitchBATHAXX
if /i "%BATHAXX%" EQU "*" goto:switchBATHAXXoff
set BATHAXX=*
goto:OLDLIST
:switchBATHAXXoff
set BATHAXX=
goto:OLDLIST

:SwitchROTJ
if /i "%ROTJ%" EQU "*" goto:switchROTJoff
set ROTJ=*
goto:OLDLIST
:switchROTJoff
set ROTJ=
goto:OLDLIST

:SwitchTOS
if /i "%TOS%" EQU "*" goto:switchTOSoff
set TOS=*
goto:OLDLIST
:switchTOSoff
set TOS=
goto:OLDLIST

:Switchsmash
if /i "%smash%" EQU "*" goto:switchsmashoff
set smash=*
goto:OLDLIST
:switchsmashoff
set smash=
goto:OLDLIST


:Switchdop
if /i "%dop%" EQU "*" goto:switchdopoff
set dop=*
goto:OLDLIST
:switchdopoff
set dop=
goto:OLDLIST

:Switchlocked
if /i "%locked%" EQU "*" goto:switchlockedoff
set locked=*
goto:OLDLIST
:switchlockedoff
set locked=
goto:OLDLIST


:SwitchHBB
if /i "%HBB%" EQU "*" goto:switchHBBoff
set HBB=*
goto:OLDLIST
:switchHBBoff
set HBB=
goto:OLDLIST


:SwitchWII64
if /i "%WII64%" EQU "*" goto:switchWII64off
set WII64=*
goto:OLDLIST
:switchWII64off
set WII64=
goto:OLDLIST


:SwitchWIISX
if /i "%WIISX%" EQU "*" goto:switchWIISXoff
set WIISX=*
goto:OLDLIST
:switchWIISXoff
set WIISX=
goto:OLDLIST

:Switchmmm
if /i "%mmm%" EQU "*" goto:switchmmmoff
set mmm=*
goto:OLDLIST
:switchmmmoff
set mmm=
goto:OLDLIST


:SwitchIOS236Installer
if /i "%IOS236Installer%" EQU "*" goto:switchIOS236Installeroff
set IOS236Installer=*
goto:OLDLIST
:switchIOS236Installeroff
set IOS236Installer=
goto:OLDLIST

:SwitchSIP
if /i "%SIP%" EQU "*" (set SIP=) else (set SIP=*)
goto:OLDLIST

:SwitchJOY
if /i "%JOY%" EQU "*" (set JOY=) else (set JOY=*)
goto:OLDLIST

:Switchyawm
if /i "%yawm%" EQU "*" goto:switchyawmoff
set yawm=*
goto:OLDLIST
:switchyawmoff
set yawm=
goto:OLDLIST

:Switchneogamma
if /i "%neogamma%" EQU "*" goto:switchneogammaoff
set neogamma=*
goto:OLDLIST
:switchneogammaoff
set neogamma=
goto:OLDLIST

:Switchcfg249
if /i "%cfg249%" EQU "*" goto:switchcfg249off
set cfg249=*
goto:OLDLIST
:switchcfg249off
set cfg249=
goto:OLDLIST

:Switchcfg222
if /i "%cfg222%" EQU "*" goto:switchcfg222off
set cfg222=*
goto:OLDLIST
:switchcfg222off
set cfg222=
goto:OLDLIST

:Switchcfgr
if /i "%cfgr%" EQU "*" goto:switchcfgroff
set cfgr=*
goto:OLDLIST
:switchcfgroff
set cfgr=
goto:OLDLIST

:Switchwbm
if /i "%wbm%" EQU "*" goto:switchwbmoff
set wbm=*
goto:OLDLIST
:switchwbmoff
set wbm=
goto:OLDLIST

:SwitchCheatCodes
if /i "%CheatCodes%" EQU "*" goto:switchCheatCodesoff
set CheatCodes=*
goto:OLDLIST
:switchCheatCodesoff
set CheatCodes=
goto:OLDLIST

:SwitchF32
if /i "%F32%" EQU "*" goto:switchF32off
set F32=*
goto:OLDLIST
:switchF32off
set F32=
goto:OLDLIST

:SwitchFLOW
if /i "%FLOW%" EQU "*" goto:switchFLOWoff
set FLOW=*
goto:OLDLIST
:switchFLOWoff
set FLOW=
goto:OLDLIST

:SwitchUSBX
if /i "%USBX%" EQU "*" goto:switchUSBXoff
set USBX=*
goto:OLDLIST
:switchUSBXoff
set USBX=
goto:OLDLIST

:SwitchJOYF
if /i "%JOYF%" EQU "*" goto:switchJOYFoff
set JOYF=*
goto:OLDLIST
:switchJOYFoff
set JOYF=
goto:OLDLIST

:SwitchS2U
if /i "%S2U%" EQU "*" goto:switchS2Uoff
set S2U=*
goto:OLDLIST
:switchS2Uoff
set S2U=
goto:OLDLIST

:SwitchHBF
if /i "%HBF%" EQU "*" goto:switchHBFoff
set HBF=*
goto:OLDLIST
:switchHBFoff
set HBF=
goto:OLDLIST

:Switchusbfolder
if /i "%usbfolder%" EQU "*" goto:switchusbfolderoff
set usbfolder=*
goto:OLDLIST
:switchusbfolderoff
set usbfolder=
goto:OLDLIST

:SwitchWiiMC
if /i "%WiiMC%" EQU "*" goto:switchWiiMCoff
set WiiMC=*
goto:OLDLIST
:switchWiiMCoff
set WiiMC=
goto:OLDLIST

:Switchfceugx
if /i "%fceugx%" EQU "*" goto:switchfceugxoff
set fceugx=*
goto:OLDLIST
:switchfceugxoff
set fceugx=
goto:OLDLIST

:Switchsnes9xgx
if /i "%snes9xgx%" EQU "*" goto:switchsnes9xgxoff
set snes9xgx=*
goto:OLDLIST
:switchsnes9xgxoff
set snes9xgx=
goto:OLDLIST

:Switchvbagx
if /i "%vbagx%" EQU "*" goto:switchvbagxoff
set vbagx=*
goto:OLDLIST
:switchvbagxoff
set vbagx=
goto:OLDLIST

:SwitchSGM
if /i "%SGM%" EQU "*" goto:switchSGMoff
set SGM=*
goto:OLDLIST
:switchSGMoff
set SGM=
goto:OLDLIST

:SwitchWIIX
if /i "%WIIX%" EQU "*" goto:switchWIIXoff
set WIIX=*
goto:OLDLIST
:switchWIIXoff
set WIIX=
goto:OLDLIST

:SwitchPri
if /i "%Pri%" EQU "*" goto:switchPrioff
set Pri=*
goto:OLDLIST
:switchPrioff
set Pri=
goto:OLDLIST

:SwitchHAX
if /i "%HAX%" EQU "*" goto:switchHAXoff
set HAX=*
goto:OLDLIST
:switchHAXoff
set HAX=
goto:OLDLIST

:SwitchY4M
if /i "%Y4M%" EQU "*" goto:switchY4Moff
set Y4M=*
goto:OLDLIST
:switchY4Moff
set Y4M=
goto:OLDLIST


:SELECTALLOLD

:USBLOADERSELECT
set cfg249=*
set cfg222=*
set usbfolder=*
set cfgr=*
set wbm=*
set neogamma=*
set CheatCodes=*
set AccioHacks=*
set FLOW=*
set USBX=*
if /i "%OLDLIST%" EQU "U" goto:OLDLIST

:SelectJust4FunOLD
set WiiMC=*
set fceugx=*
set snes9xgx=*
set vbagx=*
set SGM=*
set WIIX=*
set HBB=*
set WII64=*
set WIISX=*
set locked=*
set JOYF=*
set JOY=*
set S2U=*
if /i "%OLDLIST%" EQU "J" goto:OLDLIST


:ExploitsSELECT
set BB1=*
set BB2=*
set Twi=*
set YUGI=*
set BATHAXX=*
set ROTJ=*
set TOS=*
set smash=*
set pwns=*
if /i "%OLDLIST%" EQU "E" goto:OLDLIST

::not in any list
set mmm=*
set f32=*
set HM=*
set dop=*
set yawm=*
set Pri=*
set HAX=*
::set Y4M=*
set IOS236Installer=*
set SIP=*
set h4=*
set h5=*
set h51=*
set w19=*
set w20=*
set CM5=*
set MP=*
set HBF=*
set bootmiisd=*

goto:OLDLIST




::........................................Additional LIST3 / BATCH.......................................
:LIST3
Set LIST3=
cls
echo                                        ModMii                                v%currentversion%
sfk echo -spat \x20 \x20 \x20 \x20 \x20[Red] DOWNLOAD PAGE 3 [def]\x20 \x20 \x20 \x20 \x20 \x20 \x20by XFlak

echo.
echo      Choose files to add/remove to download queue (Selected files marked with an *)
echo.
echo       D = Download Selected Files    1/2/3/4 = Page 1/2/3/4        M = Main Menu
echo       C = Clear Download Queue       (blank) = Cycle Pages        DR = Drive Menu
echo.
echo.
echo.
sfk echo -spat \x20 \x20[Red]DON'T INSTALL THEMES WITHOUT PROTECTION: BOOTMII, PRIILOADER AND NAND BACKUP
echo.
sfk echo -spat \x20 \x20[Red]ONLY INSTALL THEMES FOR YOUR SPECIFIC SYSTEM MENU VERSION AND REGION!
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20Select Group: [Red](A)[def]ll, Themes for [Red](U)[def]SA, [Red](E)[def]uro, [Red](J)[def]ap, [Red](K)[def]orean
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20System Menu's w/ Themes for [Red](US)[def]A, [Red](EU)[def]ro, [Red](JA)[def]p, [Red](KO)[def]rean
echo.
echo.
echo    %MyM% MyM = MyMenuify
echo.
echo.

if "%selectedtheme%"=="" set selectedtheme=R


if /i "%selectedtheme%" NEQ "R" goto:skipred


sfk echo -spat \x20 \x20 WWW = View [Red]DarkWii Red Theme[def] on youtube
sfk echo -spat \x20 \x20 \x20 S = Switch Download List to [Green]DarkWii Green Theme[def]
echo.
sfk echo -spat \x20 [Red]DarkWii Red CSMs \x20 \x20 \x20 \x20 \x20 DarkWii Red System Menus \x20 \x20 Original Wii Themes
echo.
echo    %DarkWii_Red_4.3U% 3U = 4.3U                    %SM4.3U-DWR% 4.3U = 4.3U            %A97% 97 = 97.app SM4.3U
echo    %DarkWii_Red_4.2U% 2U = 4.2U                    %SM4.2U-DWR% 4.2U = 4.2U            %A87% 87 = 87.app SM4.2U
echo    %DarkWii_Red_4.1U% 1U = 4.1U                    %SM4.1U-DWR% 4.1U = 4.1U            %A7b% 7b = 7b.app SM4.1U
echo                                                          %A72% 72 = 72.app SM4.0U
echo                                                          %A42% 42 = 42.app SM3.2U
echo.
echo    %DarkWii_Red_4.3E% 3E = 4.3E                    %SM4.3E-DWR% 4.3E = 4.3E            %A9a% 9a = 9a.app SM4.3E
echo    %DarkWii_Red_4.2E% 2E = 4.2E                    %SM4.2E-DWR% 4.2E = 4.2E            %A8a% 8a = 8a.app SM4.2E
echo    %DarkWii_Red_4.1E% 1E = 4.1E                    %SM4.1E-DWR% 4.1E = 4.1E            %A7e% 7e = 7e.app SM4.1E
echo                                                          %A75% 75 = 75.app SM4.0E
echo                                                          %A45% 45 = 45.app SM3.2E
echo.
echo    %DarkWii_Red_4.3J% 3J = 4.3J                    %SM4.3J-DWR% 4.3J = 4.3J            %A94% 94 = 94.app SM4.3J
echo    %DarkWii_Red_4.2J% 2J = 4.2J                    %SM4.2J-DWR% 4.2J = 4.2J            %A84% 84 = 84.app SM4.2J
echo    %DarkWii_Red_4.1J% 1J = 4.1J                    %SM4.1J-DWR% 4.1J = 4.1J            %A78% 78 = 78.app SM4.1J
echo                                                          %A70% 70 = 70.app SM4.0J
echo                                                          %A40% 40 = 40.app SM3.2J
echo.
echo    %DarkWii_Red_4.3K% 3K = 4.3K                    %SM4.3K-DWR% 4.3K = 4.3K            %A9d% 9d = 9d.app SM4.3K
echo    %DarkWii_Red_4.2K% 2K = 4.2K                    %SM4.2K-DWR% 4.2K = 4.2K            %A8d% 8d = 8d.app SM4.2K
echo    %DarkWii_Red_4.1K% 1K = 4.1K                    %SM4.1K-DWR% 4.1K = 4.1K            %A81% 81 = 81.app SM4.1K
:skipred


if /i "%selectedtheme%" NEQ "G" goto:skipgreen
sfk echo -spat \x20 \x20 WWW = View [Green]DarkWii Green Theme[def] on youtube
sfk echo -spat \x20 \x20 \x20 S = Switch Download List to [Red]DarkWii Red Theme[def]
echo.
sfk echo -spat \x20 [Red]DarkWii [Green]Green[Red] CSMs \x20 \x20 \x20 DarkWii [Green]Green[Red] System Menus \x20 \x20 Original Wii Themes
echo.
echo    %DarkWii_Green_4.3U% 3U = 4.3U                    %SM4.3U-DWG% 4.3U = 4.3U            %A97% 97 = 97.app SM4.3U
echo    %DarkWii_Green_4.2U% 2U = 4.2U                    %SM4.2U-DWG% 4.2U = 4.2U            %A87% 87 = 87.app SM4.2U
echo    %DarkWii_Green_4.1U% 1U = 4.1U                    %SM4.1U-DWG% 4.1U = 4.1U            %A7b% 7b = 7b.app SM4.1U
echo                                                          %A72% 72 = 72.app SM4.0U
echo                                                          %A42% 42 = 42.app SM3.2U
echo.
echo    %DarkWii_Green_4.3E% 3E = 4.3E                    %SM4.3E-DWG% 4.3E = 4.3E            %A9a% 9a = 9a.app SM4.3E
echo    %DarkWii_Green_4.2E% 2E = 4.2E                    %SM4.2E-DWG% 4.2E = 4.2E            %A8a% 8a = 8a.app SM4.2E
echo    %DarkWii_Green_4.1E% 1E = 4.1E                    %SM4.1E-DWG% 4.1E = 4.1E            %A7e% 7e = 7e.app SM4.1E
echo                                                          %A75% 75 = 75.app SM4.0E
echo                                                          %A45% 45 = 45.app SM3.2E
echo.
echo    %DarkWii_Green_4.3J% 3J = 4.3J                    %SM4.3J-DWG% 4.3J = 4.3J            %A94% 94 = 94.app SM4.3J
echo    %DarkWii_Green_4.2J% 2J = 4.2J                    %SM4.2J-DWG% 4.2J = 4.2J            %A84% 84 = 84.app SM4.2J
echo    %DarkWii_Green_4.1J% 1J = 4.1J                    %SM4.1J-DWG% 4.1J = 4.1J            %A78% 78 = 78.app SM4.1J
echo                                                          %A70% 70 = 70.app SM4.0J
echo                                                          %A40% 40 = 40.app SM3.2J
echo.
echo    %DarkWii_Green_4.3K% 3K = 4.3K                    %SM4.3K-DWG% 4.3K = 4.3K            %A9d% 9d = 9d.app SM4.3K
echo    %DarkWii_Green_4.2K% 2K = 4.2K                    %SM4.2K-DWG% 4.2K = 4.2K            %A8d% 8d = 8d.app SM4.2K
echo    %DarkWii_Green_4.1K% 1K = 4.1K                    %SM4.1K-DWG% 4.1K = 4.1K            %A81% 81 = 81.app SM4.1K
:skipgreen


echo.
echo.
echo.

set /p LIST3=     Enter Selection Here: 

if /i "%LIST3%" EQU "M" goto:MENU
if /i "%LIST3%" EQU "D" set BACKB4QUEUE=LIST3
if /i "%LIST3%" EQU "D" set loadorgo=go
if /i "%LIST3%" EQU "D" goto:DOWNLOADQUEUE
if /i "%LIST3%" EQU "DR" set BACKB4DRIVE=LIST3
if /i "%LIST3%" EQU "DR" goto:DRIVECHANGE
if /i "%LIST3%" EQU "C" goto:CLEAR
if /i "%LIST3%" EQU "R" goto:COPY2


if /i "%LIST3%" EQU "1" goto:LIST
if /i "%LIST3%" EQU "2" goto:OLDLIST
if /i "%LIST3%" EQU "3" goto:LIST3
if /i "%LIST3%" EQU "4" goto:LIST4
if /i "%LIST3%" EQU "ADV" goto:ADVANCED
IF "%LIST3%"=="" goto:LIST4

::common
if /i "%LIST3%" EQU "A" goto:SelectAll4
if /i "%LIST3%" EQU "U" goto:UTHEMES
if /i "%LIST3%" EQU "E" goto:ETHEMES
if /i "%LIST3%" EQU "J" goto:JTHEMES
if /i "%LIST3%" EQU "k" goto:KTHEMES
if /i "%LIST3%" EQU "US" goto:SMUTHEMES
if /i "%LIST3%" EQU "EU" goto:SMETHEMES
if /i "%LIST3%" EQU "JA" goto:SMJTHEMES
if /i "%LIST3%" EQU "KO" goto:SMKTHEMES
if /i "%LIST3%" EQU "MyM" goto:SwitchMyM
if /i "%LIST3%" EQU "70" goto:switchA70
if /i "%LIST3%" EQU "42" goto:switchA42
if /i "%LIST3%" EQU "45" goto:switchA45
if /i "%LIST3%" EQU "40" goto:switchA40
if /i "%LIST3%" EQU "72" goto:switchA72
if /i "%LIST3%" EQU "75" goto:switchA75
if /i "%LIST3%" EQU "78" goto:switchA78
if /i "%LIST3%" EQU "7b" goto:switchA7b
if /i "%LIST3%" EQU "7e" goto:switchA7e
if /i "%LIST3%" EQU "84" goto:switchA84
if /i "%LIST3%" EQU "87" goto:switchA87
if /i "%LIST3%" EQU "8a" goto:switchA8a
if /i "%LIST3%" EQU "94" goto:switchA94
if /i "%LIST3%" EQU "97" goto:switchA97
if /i "%LIST3%" EQU "9a" goto:switchA9a
if /i "%LIST3%" EQU "81" goto:switchA81
if /i "%LIST3%" EQU "8d" goto:switchA8d
if /i "%LIST3%" EQU "9d" goto:switchA9d

::Red
if /i "%selectedtheme%" NEQ "R" goto:skipred
if /i "%LIST3%" EQU "S" (set selectedtheme=G)&&(goto:LIST3)
if /i "%LIST3%" EQU "WWW" (start www.youtube.com/watch?v=qFliF-K-epM)&&(goto:LIST3)
if /i "%LIST3%" EQU "3U" goto:SwitchDarkWii_Red_4.3U
if /i "%LIST3%" EQU "2U" goto:SwitchDarkWii_Red_4.2U
if /i "%LIST3%" EQU "1U" goto:SwitchDarkWii_Red_4.1U
if /i "%LIST3%" EQU "3E" goto:SwitchDarkWii_Red_4.3E
if /i "%LIST3%" EQU "2E" goto:SwitchDarkWii_Red_4.2E
if /i "%LIST3%" EQU "1E" goto:SwitchDarkWii_Red_4.1E
if /i "%LIST3%" EQU "3J" goto:SwitchDarkWii_Red_4.3J
if /i "%LIST3%" EQU "2J" goto:SwitchDarkWii_Red_4.2J
if /i "%LIST3%" EQU "1J" goto:SwitchDarkWii_Red_4.1J
if /i "%LIST3%" EQU "3K" goto:SwitchDarkWii_Red_4.3K
if /i "%LIST3%" EQU "2K" goto:SwitchDarkWii_Red_4.2K
if /i "%LIST3%" EQU "1K" goto:SwitchDarkWii_Red_4.1K
if /i "%LIST3%" EQU "4.3U" goto:SwitchSM4.3U-DWR
if /i "%LIST3%" EQU "4.2U" goto:SwitchSM4.2U-DWR
if /i "%LIST3%" EQU "4.1U" goto:SwitchSM4.1U-DWR
if /i "%LIST3%" EQU "4.3E" goto:SwitchSM4.3E-DWR
if /i "%LIST3%" EQU "4.2E" goto:SwitchSM4.2E-DWR
if /i "%LIST3%" EQU "4.1E" goto:SwitchSM4.1E-DWR
if /i "%LIST3%" EQU "4.3J" goto:SwitchSM4.3J-DWR
if /i "%LIST3%" EQU "4.2J" goto:SwitchSM4.2J-DWR
if /i "%LIST3%" EQU "4.1J" goto:SwitchSM4.1J-DWR
if /i "%LIST3%" EQU "4.3K" goto:SwitchSM4.3K-DWR
if /i "%LIST3%" EQU "4.2K" goto:SwitchSM4.2K-DWR
if /i "%LIST3%" EQU "4.1K" goto:SwitchSM4.1K-DWR
:skipred


::Green
if /i "%selectedtheme%" NEQ "G" goto:skipgreen
if /i "%LIST3%" EQU "S" (set selectedtheme=R)&&(goto:LIST3)
if /i "%LIST3%" EQU "WWW" (start www.youtube.com/watch?v=Rn0CnTo5kRI)&&(goto:LIST3)
if /i "%LIST3%" EQU "A" goto:SelectAll4
if /i "%LIST3%" EQU "3U" goto:SwitchDarkWii_Green_4.3U
if /i "%LIST3%" EQU "2U" goto:SwitchDarkWii_Green_4.2U
if /i "%LIST3%" EQU "1U" goto:SwitchDarkWii_Green_4.1U
if /i "%LIST3%" EQU "3E" goto:SwitchDarkWii_Green_4.3E
if /i "%LIST3%" EQU "2E" goto:SwitchDarkWii_Green_4.2E
if /i "%LIST3%" EQU "1E" goto:SwitchDarkWii_Green_4.1E
if /i "%LIST3%" EQU "3J" goto:SwitchDarkWii_Green_4.3J
if /i "%LIST3%" EQU "2J" goto:SwitchDarkWii_Green_4.2J
if /i "%LIST3%" EQU "1J" goto:SwitchDarkWii_Green_4.1J
if /i "%LIST3%" EQU "3K" goto:SwitchDarkWii_Green_4.3K
if /i "%LIST3%" EQU "2K" goto:SwitchDarkWii_Green_4.2K
if /i "%LIST3%" EQU "1K" goto:SwitchDarkWii_Green_4.1K
if /i "%LIST3%" EQU "4.3U" goto:SwitchSM4.3U-DWG
if /i "%LIST3%" EQU "4.2U" goto:SwitchSM4.2U-DWG
if /i "%LIST3%" EQU "4.1U" goto:SwitchSM4.1U-DWG
if /i "%LIST3%" EQU "4.3E" goto:SwitchSM4.3E-DWG
if /i "%LIST3%" EQU "4.2E" goto:SwitchSM4.2E-DWG
if /i "%LIST3%" EQU "4.1E" goto:SwitchSM4.1E-DWG
if /i "%LIST3%" EQU "4.3J" goto:SwitchSM4.3J-DWG
if /i "%LIST3%" EQU "4.2J" goto:SwitchSM4.2J-DWG
if /i "%LIST3%" EQU "4.1J" goto:SwitchSM4.1J-DWG
if /i "%LIST3%" EQU "4.3K" goto:SwitchSM4.3K-DWG
if /i "%LIST3%" EQU "4.2K" goto:SwitchSM4.2K-DWG
if /i "%LIST3%" EQU "4.1K" goto:SwitchSM4.1K-DWG
:skipgreen


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:LIST3


:SwitchMyM
if /i "%MyM%" EQU "*" (set MyM=) else (set MyM=*)
goto:LIST3


:SwitchDarkWii_Red_4.3U
if /i "%DarkWii_Red_4.3U%" EQU "*" (set DarkWii_Red_4.3U=) else (set DarkWii_Red_4.3U=*)
goto:LIST3

:SwitchDarkWii_Red_4.2U
if /i "%DarkWii_Red_4.2U%" EQU "*" (set DarkWii_Red_4.2U=) else (set DarkWii_Red_4.2U=*)
goto:LIST3

:SwitchDarkWii_Red_4.1U
if /i "%DarkWii_Red_4.1U%" EQU "*" (set DarkWii_Red_4.1U=) else (set DarkWii_Red_4.1U=*)
goto:LIST3

:SwitchDarkWii_Red_4.3E
if /i "%DarkWii_Red_4.3E%" EQU "*" (set DarkWii_Red_4.3E=) else (set DarkWii_Red_4.3E=*)
goto:LIST3

:SwitchDarkWii_Red_4.2E
if /i "%DarkWii_Red_4.2E%" EQU "*" (set DarkWii_Red_4.2E=) else (set DarkWii_Red_4.2E=*)
goto:LIST3

:SwitchDarkWii_Red_4.1E
if /i "%DarkWii_Red_4.1E%" EQU "*" (set DarkWii_Red_4.1E=) else (set DarkWii_Red_4.1E=*)
goto:LIST3

:SwitchDarkWii_Red_4.1J
if /i "%DarkWii_Red_4.1J%" EQU "*" (set DarkWii_Red_4.1J=) else (set DarkWii_Red_4.1J=*)
goto:LIST3

:SwitchDarkWii_Red_4.2J
if /i "%DarkWii_Red_4.2J%" EQU "*" (set DarkWii_Red_4.2J=) else (set DarkWii_Red_4.2J=*)
goto:LIST3

:SwitchDarkWii_Red_4.3J
if /i "%DarkWii_Red_4.3J%" EQU "*" (set DarkWii_Red_4.3J=) else (set DarkWii_Red_4.3J=*)
goto:LIST3

:SwitchDarkWii_Red_4.1K
if /i "%DarkWii_Red_4.1K%" EQU "*" (set DarkWii_Red_4.1K=) else (set DarkWii_Red_4.1K=*)
goto:LIST3

:SwitchDarkWii_Red_4.2K
if /i "%DarkWii_Red_4.2K%" EQU "*" (set DarkWii_Red_4.2K=) else (set DarkWii_Red_4.2K=*)
goto:LIST3

:SwitchDarkWii_Red_4.3K
if /i "%DarkWii_Red_4.3K%" EQU "*" (set DarkWii_Red_4.3K=) else (set DarkWii_Red_4.3K=*)
goto:LIST3


:SwitchSM4.3U-DWR
if /i "%SM4.3U-DWR%" EQU "*" (set SM4.3U-DWR=) else (set SM4.3U-DWR=*)
goto:LIST3

:SwitchSM4.2U-DWR
if /i "%SM4.2U-DWR%" EQU "*" (set SM4.2U-DWR=) else (set SM4.2U-DWR=*)
goto:LIST3

:SwitchSM4.1U-DWR
if /i "%SM4.1U-DWR%" EQU "*" (set SM4.1U-DWR=) else (set SM4.1U-DWR=*)
goto:LIST3

:SwitchSM4.3E-DWR
if /i "%SM4.3E-DWR%" EQU "*" (set SM4.3E-DWR=) else (set SM4.3E-DWR=*)
goto:LIST3

:SwitchSM4.2E-DWR
if /i "%SM4.2E-DWR%" EQU "*" (set SM4.2E-DWR=) else (set SM4.2E-DWR=*)
goto:LIST3

:SwitchSM4.1E-DWR
if /i "%SM4.1E-DWR%" EQU "*" (set SM4.1E-DWR=) else (set SM4.1E-DWR=*)
goto:LIST3

:SwitchSM4.3J-DWR
if /i "%SM4.3J-DWR%" EQU "*" (set SM4.3J-DWR=) else (set SM4.3J-DWR=*)
goto:LIST3

:SwitchSM4.2J-DWR
if /i "%SM4.2J-DWR%" EQU "*" (set SM4.2J-DWR=) else (set SM4.2J-DWR=*)
goto:LIST3

:SwitchSM4.1J-DWR
if /i "%SM4.1J-DWR%" EQU "*" (set SM4.1J-DWR=) else (set SM4.1J-DWR=*)
goto:LIST3

:SwitchSM4.3K-DWR
if /i "%SM4.3K-DWR%" EQU "*" (set SM4.3K-DWR=) else (set SM4.3K-DWR=*)
goto:LIST3

:SwitchSM4.2K-DWR
if /i "%SM4.2K-DWR%" EQU "*" (set SM4.2K-DWR=) else (set SM4.2K-DWR=*)
goto:LIST3

:SwitchSM4.1K-DWR
if /i "%SM4.1K-DWR%" EQU "*" (set SM4.1K-DWR=) else (set SM4.1K-DWR=*)
goto:LIST3

:SwitchDarkWii_Green_4.3U
if /i "%DarkWii_Green_4.3U%" EQU "*" (set DarkWii_Green_4.3U=) else (set DarkWii_Green_4.3U=*)
goto:LIST3

:SwitchDarkWii_Green_4.2U
if /i "%DarkWii_Green_4.2U%" EQU "*" (set DarkWii_Green_4.2U=) else (set DarkWii_Green_4.2U=*)
goto:LIST3

:SwitchDarkWii_Green_4.1U
if /i "%DarkWii_Green_4.1U%" EQU "*" (set DarkWii_Green_4.1U=) else (set DarkWii_Green_4.1U=*)
goto:LIST3

:SwitchDarkWii_Green_4.3E
if /i "%DarkWii_Green_4.3E%" EQU "*" (set DarkWii_Green_4.3E=) else (set DarkWii_Green_4.3E=*)
goto:LIST3

:SwitchDarkWii_Green_4.2E
if /i "%DarkWii_Green_4.2E%" EQU "*" (set DarkWii_Green_4.2E=) else (set DarkWii_Green_4.2E=*)
goto:LIST3

:SwitchDarkWii_Green_4.1E
if /i "%DarkWii_Green_4.1E%" EQU "*" (set DarkWii_Green_4.1E=) else (set DarkWii_Green_4.1E=*)
goto:LIST3

:SwitchDarkWii_Green_4.1J
if /i "%DarkWii_Green_4.1J%" EQU "*" (set DarkWii_Green_4.1J=) else (set DarkWii_Green_4.1J=*)
goto:LIST3

:SwitchDarkWii_Green_4.2J
if /i "%DarkWii_Green_4.2J%" EQU "*" (set DarkWii_Green_4.2J=) else (set DarkWii_Green_4.2J=*)
goto:LIST3

:SwitchDarkWii_Green_4.3J
if /i "%DarkWii_Green_4.3J%" EQU "*" (set DarkWii_Green_4.3J=) else (set DarkWii_Green_4.3J=*)
goto:LIST3

:SwitchDarkWii_Green_4.1K
if /i "%DarkWii_Green_4.1K%" EQU "*" (set DarkWii_Green_4.1K=) else (set DarkWii_Green_4.1K=*)
goto:LIST3

:SwitchDarkWii_Green_4.2K
if /i "%DarkWii_Green_4.2K%" EQU "*" (set DarkWii_Green_4.2K=) else (set DarkWii_Green_4.2K=*)
goto:LIST3

:SwitchDarkWii_Green_4.3K
if /i "%DarkWii_Green_4.3K%" EQU "*" (set DarkWii_Green_4.3K=) else (set DarkWii_Green_4.3K=*)
goto:LIST3


:SwitchSM4.3U-DWG
if /i "%SM4.3U-DWG%" EQU "*" (set SM4.3U-DWG=) else (set SM4.3U-DWG=*)
goto:LIST3

:SwitchSM4.2U-DWG
if /i "%SM4.2U-DWG%" EQU "*" (set SM4.2U-DWG=) else (set SM4.2U-DWG=*)
goto:LIST3

:SwitchSM4.1U-DWG
if /i "%SM4.1U-DWG%" EQU "*" (set SM4.1U-DWG=) else (set SM4.1U-DWG=*)
goto:LIST3

:SwitchSM4.3E-DWG
if /i "%SM4.3E-DWG%" EQU "*" (set SM4.3E-DWG=) else (set SM4.3E-DWG=*)
goto:LIST3

:SwitchSM4.2E-DWG
if /i "%SM4.2E-DWG%" EQU "*" (set SM4.2E-DWG=) else (set SM4.2E-DWG=*)
goto:LIST3

:SwitchSM4.1E-DWG
if /i "%SM4.1E-DWG%" EQU "*" (set SM4.1E-DWG=) else (set SM4.1E-DWG=*)
goto:LIST3

:SwitchSM4.3J-DWG
if /i "%SM4.3J-DWG%" EQU "*" (set SM4.3J-DWG=) else (set SM4.3J-DWG=*)
goto:LIST3

:SwitchSM4.2J-DWG
if /i "%SM4.2J-DWG%" EQU "*" (set SM4.2J-DWG=) else (set SM4.2J-DWG=*)
goto:LIST3

:SwitchSM4.1J-DWG
if /i "%SM4.1J-DWG%" EQU "*" (set SM4.1J-DWG=) else (set SM4.1J-DWG=*)
goto:LIST3

:SwitchSM4.3K-DWG
if /i "%SM4.3K-DWG%" EQU "*" (set SM4.3K-DWG=) else (set SM4.3K-DWG=*)
goto:LIST3

:SwitchSM4.2K-DWG
if /i "%SM4.2K-DWG%" EQU "*" (set SM4.2K-DWG=) else (set SM4.2K-DWG=*)
goto:LIST3

:SwitchSM4.1K-DWG
if /i "%SM4.1K-DWG%" EQU "*" (set SM4.1K-DWG=) else (set SM4.1K-DWG=*)
goto:LIST3

:switchA40
if /i "%A40%" EQU "*" goto:switchA40off
set A40=*
goto:LIST3
:switchA40off
set A40=
goto:LIST3

:switchA42
if /i "%A42%" EQU "*" goto:switchA42off
set A42=*
goto:LIST3
:switchA42off
set A42=
goto:LIST3

:switchA45
if /i "%A45%" EQU "*" goto:switchA45off
set A45=*
goto:LIST3
:switchA45off
set A45=
goto:LIST3

:switchA70
if /i "%A70%" EQU "*" goto:switchA70off
set A70=*
goto:LIST3
:switchA70off
set A70=
goto:LIST3

:switchA72
if /i "%A72%" EQU "*" goto:switchA72off
set A72=*
goto:LIST3
:switchA72off
set A72=
goto:LIST3

:switchA75
if /i "%A75%" EQU "*" goto:switchA75off
set A75=*
goto:LIST3
:switchA75off
set A75=
goto:LIST3

:switchA78
if /i "%A78%" EQU "*" goto:switchA78off
set A78=*
goto:LIST3
:switchA78off
set A78=
goto:LIST3

:switchA7b
if /i "%A7b%" EQU "*" goto:switchA7boff
set A7b=*
goto:LIST3
:switchA7boff
set A7b=
goto:LIST3

:switchA7e
if /i "%A7e%" EQU "*" goto:switchA7eoff
set A7e=*
goto:LIST3
:switchA7eoff
set A7e=
goto:LIST3

:switchA84
if /i "%A84%" EQU "*" goto:switchA84off
set A84=*
goto:LIST3
:switchA84off
set A84=
goto:LIST3

:switchA87
if /i "%A87%" EQU "*" goto:switchA87off
set A87=*
goto:LIST3
:switchA87off
set A87=
goto:LIST3

:switchA8a
if /i "%A8a%" EQU "*" goto:switchA8aoff
set A8a=*
goto:LIST3
:switchA8aoff
set A8a=
goto:LIST3

:switchA94
if /i "%A94%" EQU "*" goto:switchA94off
set A94=*
goto:LIST3
:switchA94off
set A94=
goto:LIST3

:switchA97
if /i "%A97%" EQU "*" goto:switchA97off
set A97=*
goto:LIST3
:switchA97off
set A97=
goto:LIST3

:switchA9a
if /i "%A9a%" EQU "*" goto:switchA9aoff
set A9a=*
goto:LIST3
:switchA9aoff
set A9a=
goto:LIST3

:SwitchA81
if /i "%A81%" EQU "*" (set A81=) else (set A81=*)
goto:LIST3

:SwitchA8d
if /i "%A8d%" EQU "*" (set A8d=) else (set A8d=*)
goto:LIST3

:SwitchA9d
if /i "%A9d%" EQU "*" (set A9d=) else (set A9d=*)
goto:LIST3


:SelectAll4

:UTHEMES
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.3U=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.2U=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.1U=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.3U=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.2U=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.1U=*
if /i "%LIST3%" EQU "U" goto:LIST3

:ETHEMES
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.3E=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.2E=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.1E=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.3E=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.2E=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.1E=*
if /i "%LIST3%" EQU "E" goto:LIST3

:JTHEMES
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.3J=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.2J=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.1J=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.3J=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.2J=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.1J=*
if /i "%LIST3%" EQU "J" goto:LIST3

:KTHEMES
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.3K=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.2K=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.1K=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.3K=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.2K=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.1K=*
if /i "%LIST3%" EQU "K" goto:LIST3

:SMUTHEMES
if /i "%selectedtheme%" EQU "R" set SM4.3U-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.2U-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.1U-DWR=*
if /i "%selectedtheme%" EQU "G" set SM4.3U-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.2U-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.1U-DWG=*
if /i "%LIST3%" EQU "US" goto:LIST3

:SMETHEMES
if /i "%selectedtheme%" EQU "R" set SM4.3E-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.2E-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.1E-DWR=*
if /i "%selectedtheme%" EQU "G" set SM4.3E-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.2E-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.1E-DWG=*
if /i "%LIST3%" EQU "EU" goto:LIST3

:SMJTHEMES
if /i "%selectedtheme%" EQU "R" set SM4.3J-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.2J-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.1J-DWR=*
if /i "%selectedtheme%" EQU "G" set SM4.3J-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.2J-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.1J-DWG=*
if /i "%LIST3%" EQU "JA" goto:LIST3

:SMKTHEMES
if /i "%selectedtheme%" EQU "R" set SM4.3K-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.2K-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.1K-DWR=*
if /i "%selectedtheme%" EQU "G" set SM4.3K-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.2K-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.1K-DWG=*
if /i "%LIST3%" EQU "KO" goto:LIST3



::not in any list
set MyM=*

:SelectJMyMApps
set A40=*
set A70=*
set A78=*
set A84=*
set A94=*

:SelectUMyMApps
set A42=*
set A72=*
set A7b=*
set A87=*
set A97=*

:SelectKMyMApps
set A81=*
set A8d=*
set A9d=*

:SelectEMyMApps
set A45=*
set A75=*
set A7e=*
set A8a=*
set A9a=*

goto:LIST3




::........................................Additional LIST4 / BATCH.......................................
:LIST4
Set LIST4=
cls
echo                                        ModMii                                v%currentversion%
sfk echo -spat \x20 \x20 \x20 \x20 \x20[Red] DOWNLOAD PAGE 4 [def]\x20 \x20 \x20 \x20 \x20 \x20 \x20by XFlak

echo.
echo      Choose files to add/remove to download queue (Selected files marked with an *)
echo.
echo       D = Download Selected Files    1/2/3/4 = Page 1/2/3/4        M = Main Menu
echo       C = Clear Download Queue       (blank) = Cycle Pages        DR = Drive Menu
echo.
if exist "%Drive%"\WAD echo                R = Rename Current %Drive%\WAD folder to %Drive%\WAD#
if exist "%Drive%"\WAD echo                    (otherwise WADs are saved to existing WAD Folder)
if exist "%Drive%"\WAD echo.
sfk echo -spat \x20 \x20Select Group: [Red](A)[def]ll, [Red](REC)[def]ommended CIOSs, [Red](cM)[def]IOSs, [Red](v4)[def] cIOSs, [Red](v5)[def] cIOSs
sfk echo -spat \x20 \x20 [Red](v14)[def] cIOSs, [Red](v17b)[def] cIOSs, [Red](v19)[def] cIOSs, [Red](v20)[def] cIOSs, [Red](v21)[def] cIOSs, v21[Red](d2x)[def] cIOSs
echo.



sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Waninkoko v17b cIOSs \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Hermes v4 cIOSs
echo              %cIOS249-v17b% 24917 = cIOS249-v17b              %cIOS223[37-38]-v4% 223 = cIOS223[37-38]-v4
echo              %cIOS250-v17b% 25017 = cIOS250-v17b             %cIOS222[38]-v4% 2224 = cIOS222[38]-v4
echo.

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Waninkoko v19 cIOSs \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Hermes v5 cIOSs
echo            %cIOS249[37]-v19% 2491937 = cIOS249[37]-v19           %cIOS202[57]-v5% 202 = cIOS202[57]-v5
echo            %cIOS250[37]-v19% 2501937 = cIOS250[37]-v19           %cIOS222[38]-v5% 222 = cIOS222[38]-v5
echo            %cIOS249[38]-v19% 2491938 = cIOS249[38]-v19         %cIOS223[37]-v5% 22337 = cIOS223[37]-v5
echo            %cIOS250[38]-v19% 2501938 = cIOS250[38]-v19         %cIOS223[57]-v5% 22357 = cIOS223[57]-v5
echo            %cIOS249[57]-v19% 2491957 = cIOS249[57]-v19         %cIOS224[37]-v5% 22437 = cIOS224[37]-v5
echo            %cIOS250[57]-v19% 2501957 = cIOS250[57]-v19           %cIOS224[57]-v5% 224 = cIOS224[57]-v5
echo.

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Waninkoko v20 cIOSs \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 cMIOSs
echo            %cIOS249[38]-v20% 2492038 = cIOS249[38]-v20    %RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2% 10 = WiiGator+WiiPower cMIOS-v65535(v10)
echo            %cIOS250[38]-v20% 2502038 = cIOS250[38]-v20   %RVL-cmios-v4_WiiGator_GCBL_v0.2% 0.2 = WiiGator cMIOS-v4 v0.2
echo            %cIOS249[56]-v20% 2492056 = cIOS249[56]-v20     %RVL-cmios-v4_Waninkoko_rev5% 5 = Waninkoko cMIOS-v4 rev5
echo            %cIOS250[56]-v20% 2502056 = cIOS250[56]-v20

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20%cIOS249[57]-v20% 2492057 = cIOS249[57]-v20 \x20 \x20 \x20 \x20 [Red] Waninkoko v14 cIOSs
echo            %cIOS250[57]-v20% 2502057 = cIOS250[57]-v20         %cIOS249-v14% 24914 = cIOS249-v14
echo                                               %cIOS250-v14% 25014 = cIOS250-v14
echo.


set d2x-beta-rev=6
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Waninkoko v21 cIOSs \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 d2x cIOSs
echo            %cIOS249[37]-v21% 2492137 = cIOS249[37]-v21      %cIOS249[37]-d2x-v6% 249d2x37 = cIOS249[37]-d2x-v%d2x-beta-rev%
echo            %cIOS250[37]-v21% 2502137 = cIOS250[37]-v21      %cIOS250[37]-d2x-v6% 250d2x37 = cIOS250[37]-d2x-v%d2x-beta-rev%
echo            %cIOS249[38]-v21% 2492138 = cIOS249[38]-v21      %cIOS249[38]-d2x-v6% 249d2x38 = cIOS249[38]-d2x-v%d2x-beta-rev%
echo            %cIOS250[38]-v21% 2502138 = cIOS250[38]-v21      %cIOS250[38]-d2x-v6% 250d2x38 = cIOS250[38]-d2x-v%d2x-beta-rev%

echo            %cIOS249[53]-v21% 2492153 = cIOS249[53]-v21      %cIOS249[53]-d2x-v6% 249d2x53 = cIOS249[53]-d2x-v%d2x-beta-rev%
echo            %cIOS250[53]-v21% 2502153 = cIOS250[53]-v21      %cIOS250[53]-d2x-v6% 250d2x53 = cIOS250[53]-d2x-v%d2x-beta-rev%

echo            %cIOS249[55]-v21% 2492155 = cIOS249[55]-v21      %cIOS249[55]-d2x-v6% 249d2x55 = cIOS249[55]-d2x-v%d2x-beta-rev%
echo            %cIOS250[55]-v21% 2502155 = cIOS250[55]-v21      %cIOS250[55]-d2x-v6% 250d2x55 = cIOS250[55]-d2x-v%d2x-beta-rev%


echo            %cIOS249[56]-v21% 2492156 = cIOS249[56]-v21      %cIOS249[56]-d2x-v6% 249d2x56 = cIOS249[56]-d2x-v%d2x-beta-rev%
echo            %cIOS250[56]-v21% 2502156 = cIOS250[56]-v21      %cIOS250[56]-d2x-v6% 250d2x56 = cIOS250[56]-d2x-v%d2x-beta-rev%
echo            %cIOS249[57]-v21% 2492157 = cIOS249[57]-v21      %cIOS249[57]-d2x-v6% 249d2x57 = cIOS249[57]-d2x-v%d2x-beta-rev%
echo            %cIOS250[57]-v21% 2502157 = cIOS250[57]-v21      %cIOS250[57]-d2x-v6% 250d2x57 = cIOS250[57]-d2x-v%d2x-beta-rev%
echo            %cIOS249[58]-v21% 2492158 = cIOS249[58]-v21      %cIOS249[58]-d2x-v6% 249d2x58 = cIOS249[58]-d2x-v%d2x-beta-rev%
echo            %cIOS250[58]-v21% 2502158 = cIOS250[58]-v21      %cIOS250[58]-d2x-v6% 250d2x58 = cIOS250[58]-d2x-v%d2x-beta-rev%


if not exist modules\More-cIOSs echo.
if exist modules\More-cIOSs echo                                                 BETA = d2x beta settings



if not exist "%Drive%"\WAD echo.
if not exist "%Drive%"\WAD echo.
if not exist "%Drive%"\WAD echo.

set /p LIST4=     Enter Selection Here: 

if /i "%LIST4%" EQU "M" goto:MENU
if /i "%LIST4%" EQU "D" set BACKB4QUEUE=LIST4
if /i "%LIST4%" EQU "D" set loadorgo=go
if /i "%LIST4%" EQU "D" goto:DOWNLOADQUEUE
if /i "%LIST4%" EQU "DR" set BACKB4DRIVE=LIST4
if /i "%LIST4%" EQU "DR" goto:DRIVECHANGE
if /i "%LIST4%" EQU "C" goto:CLEAR
if /i "%LIST4%" EQU "R" goto:COPY2

if /i "%LIST4%" EQU "A" goto:SelectAllLIST4
if /i "%LIST4%" EQU "REC" goto:RECOMMENDEDCIOSS

if not exist modules\More-cIOSs goto:quickskip
if /i "%LIST4%" EQU "BETA" (set backbeforebetaswitch=LIST4) & (goto:betaswitch)
:quickskip


if /i "%LIST4%" EQU "v4" goto:v4cIOSs
if /i "%LIST4%" EQU "v5" goto:v5cIOSs
if /i "%LIST4%" EQU "v17b" goto:v17bcIOSs
if /i "%LIST4%" EQU "v14" goto:v14cIOSs
if /i "%LIST4%" EQU "v19" goto:v19cIOSs
if /i "%LIST4%" EQU "v20" goto:v20cIOSs
if /i "%LIST4%" EQU "v21" goto:v21cIOSs
if /i "%LIST4%" EQU "d2x" goto:d2xcIOSs
if /i "%LIST4%" EQU "cM" goto:cMIOSs

if /i "%LIST4%" EQU "1" goto:LIST
if /i "%LIST4%" EQU "2" goto:OLDLIST
if /i "%LIST4%" EQU "3" goto:LIST3
if /i "%LIST4%" EQU "4" goto:LIST4
if /i "%LIST4%" EQU "ADV" goto:ADVANCED
IF "%LIST4%"=="" goto:LIST



if /i "%LIST4%" EQU "202" goto:SwitchcIOS202[57]-v5

if /i "%LIST4%" EQU "222" goto:SwitchcIOS222[38]-v5
if /i "%LIST4%" EQU "22337" goto:SwitchcIOS223[37]-v5
if /i "%LIST4%" EQU "22357" goto:SwitchcIOS223[57]-v5
if /i "%LIST4%" EQU "22437" goto:SwitchcIOS224[37]-v5
if /i "%LIST4%" EQU "224" goto:SwitchcIOS224[57]-v5

if /i "%LIST4%" EQU "2491937" goto:SwitchcIOS249[37]-v19
if /i "%LIST4%" EQU "2491938" goto:SwitchcIOS249[38]-v19
if /i "%LIST4%" EQU "2492038" goto:SwitchcIOS249[38]-v20
if /i "%LIST4%" EQU "2502038" goto:SwitchcIOS250[38]-v20
if /i "%LIST4%" EQU "2492056" goto:SwitchcIOS249[56]-v20
if /i "%LIST4%" EQU "2502057" goto:SwitchcIOS250[57]-v20
if /i "%LIST4%" EQU "2492057" goto:SwitchcIOS249[57]-v20
if /i "%LIST4%" EQU "2502056" goto:SwitchcIOS250[56]-v20
if /i "%LIST4%" EQU "2491957" goto:SwitchcIOS249[57]-v19

if /i "%LIST4%" EQU "2501937" goto:SwitchcIOS250[37]-v19
if /i "%LIST4%" EQU "2501938" goto:SwitchcIOS250[38]-v19
if /i "%LIST4%" EQU "2501957" goto:SwitchcIOS250[57]-v19
if /i "%LIST4%" EQU "10" goto:SwitchRVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2
if /i "%LIST4%" EQU "0.2" goto:SwitchRVL-cmios-v4_WiiGator_GCBL_v0.2
if /i "%LIST4%" EQU "5" goto:SwitchRVL-cmios-v4_Waninkoko_rev5
if /i "%LIST4%" EQU "2224" goto:SwitchcIOS222[38]-v4

if /i "%LIST4%" EQU "223" goto:SwitchcIOS223[37-38]-v4
if /i "%LIST4%" EQU "24917" goto:SwitchcIOS249-v17b
if /i "%LIST4%" EQU "25017" goto:SwitchcIOS250-v17b

if /i "%LIST4%" EQU "24914" goto:SwitchcIOS249-v14
if /i "%LIST4%" EQU "25014" goto:SwitchcIOS250-v14


if /i "%LIST4%" EQU "2492137" goto:SwitchcIOS249[37]-v21
if /i "%LIST4%" EQU "2502137" goto:SwitchcIOS250[37]-v21
if /i "%LIST4%" EQU "2492138" goto:SwitchcIOS249[38]-v21
if /i "%LIST4%" EQU "2502138" goto:SwitchcIOS250[38]-v21
if /i "%LIST4%" EQU "2492153" goto:SwitchcIOS249[53]-v21
if /i "%LIST4%" EQU "2502153" goto:SwitchcIOS250[53]-v21
if /i "%LIST4%" EQU "2492155" goto:SwitchcIOS249[55]-v21
if /i "%LIST4%" EQU "2502155" goto:SwitchcIOS250[55]-v21
if /i "%LIST4%" EQU "2492156" goto:SwitchcIOS249[56]-v21
if /i "%LIST4%" EQU "2502156" goto:SwitchcIOS250[56]-v21
if /i "%LIST4%" EQU "2492157" goto:SwitchcIOS249[57]-v21
if /i "%LIST4%" EQU "2502157" goto:SwitchcIOS250[57]-v21
if /i "%LIST4%" EQU "2492158" goto:SwitchcIOS249[58]-v21
if /i "%LIST4%" EQU "2502158" goto:SwitchcIOS250[58]-v21
if /i "%LIST4%" EQU "249d2x37" goto:SwitchcIOS249[37]-d2x-v6
if /i "%LIST4%" EQU "249d2x38" goto:SwitchcIOS249[38]-d2x-v6
if /i "%LIST4%" EQU "249d2x53" goto:SwitchcIOS249[53]-d2x-v6
if /i "%LIST4%" EQU "249d2x55" goto:SwitchcIOS249[55]-d2x-v6
if /i "%LIST4%" EQU "249d2x56" goto:SwitchcIOS249[56]-d2x-v6
if /i "%LIST4%" EQU "249d2x57" goto:SwitchcIOS249[57]-d2x-v6
if /i "%LIST4%" EQU "249d2x58" goto:SwitchcIOS249[58]-d2x-v6
if /i "%LIST4%" EQU "250d2x37" goto:SwitchcIOS250[37]-d2x-v6
if /i "%LIST4%" EQU "250d2x38" goto:SwitchcIOS250[38]-d2x-v6
if /i "%LIST4%" EQU "250d2x53" goto:SwitchcIOS250[53]-d2x-v6
if /i "%LIST4%" EQU "250d2x55" goto:SwitchcIOS250[55]-d2x-v6
if /i "%LIST4%" EQU "250d2x56" goto:SwitchcIOS250[56]-d2x-v6
if /i "%LIST4%" EQU "250d2x57" goto:SwitchcIOS250[57]-d2x-v6
if /i "%LIST4%" EQU "250d2x58" goto:SwitchcIOS250[58]-d2x-v6

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:LIST4


:SwitchcIOS202[57]-v5
if /i "%cIOS202[57]-v5%" EQU "*" goto:switchcIOS202[57]-v5off
set cIOS202[57]-v5=*
goto:LIST4
:switchcIOS202[57]-v5off
set cIOS202[57]-v5=
goto:LIST4

:SwitchcIOS222[38]-v5
if /i "%cIOS222[38]-v5%" EQU "*" goto:switchcIOS222[38]-v5off
set cIOS222[38]-v5=*
goto:LIST4
:switchcIOS222[38]-v5off
set cIOS222[38]-v5=
goto:LIST4

:SwitchcIOS223[37]-v5
if /i "%cIOS223[37]-v5%" EQU "*" goto:switchcIOS223[37]-v5off
set cIOS223[37]-v5=*
goto:LIST4
:switchcIOS223[37]-v5off
set cIOS223[37]-v5=
goto:LIST4

:SwitchcIOS223[57]-v5
if /i "%cIOS223[57]-v5%" EQU "*" goto:switchcIOS223[57]-v5off
set cIOS223[57]-v5=*
goto:LIST4
:switchcIOS223[57]-v5off
set cIOS223[57]-v5=
goto:LIST4

:SwitchcIOS224[37]-v5
if /i "%cIOS224[37]-v5%" EQU "*" goto:switchcIOS224[37]-v5off
set cIOS224[37]-v5=*
goto:LIST4
:switchcIOS224[37]-v5off
set cIOS224[37]-v5=
goto:LIST4

:SwitchcIOS224[57]-v5
if /i "%cIOS224[57]-v5%" EQU "*" goto:switchcIOS224[57]-v5off
set cIOS224[57]-v5=*
goto:LIST4
:switchcIOS224[57]-v5off
set cIOS224[57]-v5=
goto:LIST4

:SwitchcIOS249[37]-v19
if /i "%cIOS249[37]-v19%" EQU "*" goto:switchcIOS249[37]-v19off
set cIOS249[37]-v19=*
goto:LIST4
:switchcIOS249[37]-v19off
set cIOS249[37]-v19=
goto:LIST4

:SwitchcIOS249[38]-v19
if /i "%cIOS249[38]-v19%" EQU "*" goto:switchcIOS249[38]-v19off
set cIOS249[38]-v19=*
goto:LIST4
:switchcIOS249[38]-v19off
set cIOS249[38]-v19=
goto:LIST4

:SwitchcIOS249[38]-v20
if /i "%cIOS249[38]-v20%" EQU "*" goto:switchcIOS249[38]-v20off
set cIOS249[38]-v20=*
goto:LIST4
:switchcIOS249[38]-v20off
set cIOS249[38]-v20=
goto:LIST4

:SwitchcIOS250[38]-v20
if /i "%cIOS250[38]-v20%" EQU "*" goto:switchcIOS250[38]-v20off
set cIOS250[38]-v20=*
goto:LIST4
:switchcIOS250[38]-v20off
set cIOS250[38]-v20=
goto:LIST4

:SwitchcIOS249[56]-v20
if /i "%cIOS249[56]-v20%" EQU "*" goto:switchcIOS249[56]-v20off
set cIOS249[56]-v20=*
goto:LIST4
:switchcIOS249[56]-v20off
set cIOS249[56]-v20=
goto:LIST4

:SwitchcIOS249[57]-v20
if /i "%cIOS249[57]-v20%" EQU "*" goto:switchcIOS249[57]-v20off
set cIOS249[57]-v20=*
goto:LIST4
:switchcIOS249[57]-v20off
set cIOS249[57]-v20=
goto:LIST4

:SwitchcIOS250[57]-v20
if /i "%cIOS250[57]-v20%" EQU "*" goto:switchcIOS250[57]-v20off
set cIOS250[57]-v20=*
goto:LIST4
:switchcIOS250[57]-v20off
set cIOS250[57]-v20=
goto:LIST4

:SwitchcIOS250[56]-v20
if /i "%cIOS250[56]-v20%" EQU "*" goto:switchcIOS250[56]-v20off
set cIOS250[56]-v20=*
goto:LIST4
:switchcIOS250[56]-v20off
set cIOS250[56]-v20=
goto:LIST4

:SwitchcIOS249[57]-v19
if /i "%cIOS249[57]-v19%" EQU "*" goto:switchcIOS249[57]-v19off
set cIOS249[57]-v19=*
goto:LIST4
:switchcIOS249[57]-v19off
set cIOS249[57]-v19=
goto:LIST4

:SwitchcIOS250[37]-v19
if /i "%cIOS250[37]-v19%" EQU "*" goto:switchcIOS250[37]-v19off
set cIOS250[37]-v19=*
goto:LIST4
:switchcIOS250[37]-v19off
set cIOS250[37]-v19=
goto:LIST4

:SwitchcIOS250[38]-v19
if /i "%cIOS250[38]-v19%" EQU "*" goto:switchcIOS250[38]-v19off
set cIOS250[38]-v19=*
goto:LIST4
:switchcIOS250[38]-v19off
set cIOS250[38]-v19=
goto:LIST4

:SwitchcIOS250[57]-v19
if /i "%cIOS250[57]-v19%" EQU "*" goto:switchcIOS250[57]-v19off
set cIOS250[57]-v19=*
goto:LIST4
:switchcIOS250[57]-v19off
set cIOS250[57]-v19=
goto:LIST4

:SwitchRVL-cmios-v4_WiiGator_GCBL_v0.2
if /i "%RVL-cmios-v4_WiiGator_GCBL_v0.2%" EQU "*" goto:switchRVL-cmios-v4_WiiGator_GCBL_v0.2off
set RVL-cmios-v4_WiiGator_GCBL_v0.2=*
goto:LIST4
:switchRVL-cmios-v4_WiiGator_GCBL_v0.2off
set RVL-cmios-v4_WiiGator_GCBL_v0.2=
goto:LIST4

:SwitchRVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2
if /i "%RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2%" EQU "*" goto:switchRVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2off
set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=*
goto:LIST4
:switchRVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2off
set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=
goto:LIST4

:SwitchRVL-cmios-v4_Waninkoko_rev5
if /i "%RVL-cmios-v4_Waninkoko_rev5%" EQU "*" goto:switchRVL-cmios-v4_Waninkoko_rev5off
set RVL-cmios-v4_Waninkoko_rev5=*
goto:LIST4
:switchRVL-cmios-v4_Waninkoko_rev5off
set RVL-cmios-v4_Waninkoko_rev5=
goto:LIST4

:SwitchcIOS222[38]-v4
if /i "%cIOS222[38]-v4%" EQU "*" goto:switchcIOS222[38]-v4off
set cIOS222[38]-v4=*
goto:LIST4
:switchcIOS222[38]-v4off
set cIOS222[38]-v4=
goto:LIST4

:SwitchcIOS223[37-38]-v4
if /i "%cIOS223[37-38]-v4%" EQU "*" goto:switchcIOS223[37-38]-v4off
set cIOS223[37-38]-v4=*
goto:LIST4
:switchcIOS223[37-38]-v4off
set cIOS223[37-38]-v4=
goto:LIST4

:SwitchcIOS249-v17b
if /i "%cIOS249-v17b%" EQU "*" goto:switchcIOS249-v17boff
set cIOS249-v17b=*
goto:LIST4
:switchcIOS249-v17boff
set cIOS249-v17b=
goto:LIST4

:SwitchcIOS250-v17b
if /i "%cIOS250-v17b%" EQU "*" goto:switchcIOS250-v17boff
set cIOS250-v17b=*
goto:LIST4
:switchcIOS250-v17boff
set cIOS250-v17b=
goto:LIST4

:SwitchcIOS249-v14
if /i "%cIOS249-v14%" EQU "*" (set cIOS249-v14=) else (set cIOS249-v14=*)
goto:LIST4

:SwitchcIOS250-v14
if /i "%cIOS250-v14%" EQU "*" (set cIOS250-v14=) else (set cIOS250-v14=*)
goto:LIST4

:SwitchcIOS249[37]-v21
if /i "%cIOS249[37]-v21%" EQU "*" (set cIOS249[37]-v21=) else (set cIOS249[37]-v21=*)
goto:LIST4

:SwitchcIOS250[37]-v21
if /i "%cIOS250[37]-v21%" EQU "*" (set cIOS250[37]-v21=) else (set cIOS250[37]-v21=*)
goto:LIST4

:SwitchcIOS249[38]-v21
if /i "%cIOS249[38]-v21%" EQU "*" (set cIOS249[38]-v21=) else (set cIOS249[38]-v21=*)
goto:LIST4

:SwitchcIOS250[38]-v21
if /i "%cIOS250[38]-v21%" EQU "*" (set cIOS250[38]-v21=) else (set cIOS250[38]-v21=*)
goto:LIST4

:SwitchcIOS249[53]-v21
if /i "%cIOS249[53]-v21%" EQU "*" (set cIOS249[53]-v21=) else (set cIOS249[53]-v21=*)
goto:LIST4

:SwitchcIOS250[53]-v21
if /i "%cIOS250[53]-v21%" EQU "*" (set cIOS250[53]-v21=) else (set cIOS250[53]-v21=*)
goto:LIST4

:SwitchcIOS249[55]-v21
if /i "%cIOS249[55]-v21%" EQU "*" (set cIOS249[55]-v21=) else (set cIOS249[55]-v21=*)
goto:LIST4

:SwitchcIOS250[55]-v21
if /i "%cIOS250[55]-v21%" EQU "*" (set cIOS250[55]-v21=) else (set cIOS250[55]-v21=*)
goto:LIST4

:SwitchcIOS249[56]-v21
if /i "%cIOS249[56]-v21%" EQU "*" (set cIOS249[56]-v21=) else (set cIOS249[56]-v21=*)
goto:LIST4


:SwitchcIOS250[56]-v21
if /i "%cIOS250[56]-v21%" EQU "*" (set cIOS250[56]-v21=) else (set cIOS250[56]-v21=*)
goto:LIST4

:SwitchcIOS249[57]-v21
if /i "%cIOS249[57]-v21%" EQU "*" (set cIOS249[57]-v21=) else (set cIOS249[57]-v21=*)
goto:LIST4

:SwitchcIOS250[57]-v21
if /i "%cIOS250[57]-v21%" EQU "*" (set cIOS250[57]-v21=) else (set cIOS250[57]-v21=*)
goto:LIST4

:SwitchcIOS249[58]-v21
if /i "%cIOS249[58]-v21%" EQU "*" (set cIOS249[58]-v21=) else (set cIOS249[58]-v21=*)
goto:LIST4

:SwitchcIOS250[58]-v21
if /i "%cIOS250[58]-v21%" EQU "*" (set cIOS250[58]-v21=) else (set cIOS250[58]-v21=*)
goto:LIST4

:SwitchcIOS249[53]-d2x-v6
if /i "%cIOS249[53]-d2x-v6%" EQU "*" (set cIOS249[53]-d2x-v6=) else (set cIOS249[53]-d2x-v6=*)
goto:LIST4

:SwitchcIOS249[55]-d2x-v6
if /i "%cIOS249[55]-d2x-v6%" EQU "*" (set cIOS249[55]-d2x-v6=) else (set cIOS249[55]-d2x-v6=*)
goto:LIST4

:SwitchcIOS249[56]-d2x-v6
if /i "%cIOS249[56]-d2x-v6%" EQU "*" (set cIOS249[56]-d2x-v6=) else (set cIOS249[56]-d2x-v6=*)
goto:LIST4

:SwitchcIOS249[57]-d2x-v6
if /i "%cIOS249[57]-d2x-v6%" EQU "*" (set cIOS249[57]-d2x-v6=) else (set cIOS249[57]-d2x-v6=*)
goto:LIST4

:SwitchcIOS249[58]-d2x-v6
if /i "%cIOS249[58]-d2x-v6%" EQU "*" (set cIOS249[58]-d2x-v6=) else (set cIOS249[58]-d2x-v6=*)
goto:LIST4

:SwitchcIOS249[37]-d2x-v6
if /i "%cIOS249[37]-d2x-v6%" EQU "*" (set cIOS249[37]-d2x-v6=) else (set cIOS249[37]-d2x-v6=*)
goto:LIST4

:SwitchcIOS249[38]-d2x-v6
if /i "%cIOS249[38]-d2x-v6%" EQU "*" (set cIOS249[38]-d2x-v6=) else (set cIOS249[38]-d2x-v6=*)
goto:LIST4

:SwitchcIOS250[53]-d2x-v6
if /i "%cIOS250[53]-d2x-v6%" EQU "*" (set cIOS250[53]-d2x-v6=) else (set cIOS250[53]-d2x-v6=*)
goto:LIST4

:SwitchcIOS250[55]-d2x-v6
if /i "%cIOS250[55]-d2x-v6%" EQU "*" (set cIOS250[55]-d2x-v6=) else (set cIOS250[55]-d2x-v6=*)
goto:LIST4

:SwitchcIOS250[56]-d2x-v6
if /i "%cIOS250[56]-d2x-v6%" EQU "*" (set cIOS250[56]-d2x-v6=) else (set cIOS250[56]-d2x-v6=*)
goto:LIST4

:SwitchcIOS250[57]-d2x-v6
if /i "%cIOS250[57]-d2x-v6%" EQU "*" (set cIOS250[57]-d2x-v6=) else (set cIOS250[57]-d2x-v6=*)
goto:LIST4

:SwitchcIOS250[37]-d2x-v6
if /i "%cIOS250[37]-d2x-v6%" EQU "*" (set cIOS250[37]-d2x-v6=) else (set cIOS250[37]-d2x-v6=*)
goto:LIST4

:SwitchcIOS250[38]-d2x-v6
if /i "%cIOS250[38]-d2x-v6%" EQU "*" (set cIOS250[38]-d2x-v6=) else (set cIOS250[38]-d2x-v6=*)
goto:LIST4

:SwitchcIOS250[58]-d2x-v6
if /i "%cIOS250[58]-d2x-v6%" EQU "*" (set cIOS250[58]-d2x-v6=) else (set cIOS250[58]-d2x-v6=*)
goto:LIST4

:SELECTALLLIST4


:RECOMMENDEDCIOSS
set cIOS202[57]-v5=*
set cIOS222[38]-v5=*
set cIOS223[37-38]-v4=*
set cIOS224[57]-v5=*
set cIOS249[56]-d2x-v6=*
set cIOS250[57]-d2x-v6=*
set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=*
if /i "%LIST4%" EQU "REC" goto:LIST4


:v4cIOSs
set cIOS223[37-38]-v4=*
set cIOS222[38]-v4=*
if /i "%LIST4%" EQU "v4" goto:LIST4

:v5cIOSs
set cIOS202[57]-v5=*
set cIOS222[38]-v5=*
set cIOS224[57]-v5=*
set cIOS223[57]-v5=*
set cIOS224[37]-v5=*
set cIOS223[37]-v5=*
if /i "%LIST4%" EQU "v5" goto:LIST4

:v17bcIOSs
set cIOS249-v17b=*
set cIOS250-v17b=*
if /i "%LIST4%" EQU "v17b" goto:LIST4

:v14cIOSs
set cIOS249-v14=*
set cIOS250-v14=*
if /i "%LIST4%" EQU "v14" goto:LIST4

:v19cIOSs
set cIOS249[37]-v19=*
set cIOS249[38]-v19=*
set cIOS249[57]-v19=*
set cIOS250[37]-v19=*
set cIOS250[38]-v19=*
set cIOS250[57]-v19=*
if /i "%LIST4%" EQU "v19" goto:LIST4

:v20cIOSs
set cIOS249[56]-v20=*
set cIOS250[57]-v20=*
set cIOS249[38]-v20=*
set cIOS250[38]-v20=*
set cIOS250[56]-v20=*
set cIOS249[57]-v20=*
if /i "%LIST4%" EQU "v20" goto:LIST4

:v21cIOSs
set cIOS249[37]-v21=*
set cIOS250[37]-v21=*
set cIOS249[38]-v21=*
set cIOS250[38]-v21=*
set cIOS249[53]-v21=*
set cIOS250[53]-v21=*
set cIOS249[55]-v21=*
set cIOS250[55]-v21=*
set cIOS249[56]-v21=*
set cIOS250[56]-v21=*
set cIOS249[57]-v21=*
set cIOS250[57]-v21=*
set cIOS249[58]-v21=*
set cIOS250[58]-v21=*
if /i "%LIST4%" EQU "v21" goto:LIST4

:d2xcIOSs
set cIOS249[37]-d2x-v6=*
set cIOS249[38]-d2x-v6=*
set cIOS249[53]-d2x-v6=*
set cIOS249[55]-d2x-v6=*
set cIOS249[56]-d2x-v6=*
set cIOS249[57]-d2x-v6=*
set cIOS249[58]-d2x-v6=*
set cIOS250[37]-d2x-v6=*
set cIOS250[38]-d2x-v6=*
set cIOS250[53]-d2x-v6=*
set cIOS250[55]-d2x-v6=*
set cIOS250[56]-d2x-v6=*
set cIOS250[57]-d2x-v6=*
set cIOS250[58]-d2x-v6=*
if /i "%LIST4%" EQU "d2x" goto:LIST4

:cMIOSs
set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=*
set RVL-cmios-v4_WiiGator_GCBL_v0.2=*
set RVL-cmios-v4_Waninkoko_rev5=*
if /i "%LIST4%" EQU "cM" goto:LIST4

goto:LIST4





::........................................Advanced Custom Downloads........................................
:ADVANCED
cls
set loadorgo=load
if exist temp\DLnames.txt del temp\DLnames.txt>nul
if exist temp\DLgotos.txt del temp\DLgotos.txt>nul

set ADVPATCH=
set ADVSLOT=
set ADVVERSION=
set wadnameless=
::---
set name=
set wadname=
set dlname=
set ciosslot=
set ciosversion=
set md5=
set md5alt=
set basewad=none
set basewadb=none
set md5base=
set md5basealt=
set code1=
set code2=
set version=
set md5baseb=
set md5basebalt=
set code1b=
set code2b=
set path1=
set versionb=
set basecios=
set diffpath=
set code2new=
set lastbasemodule=
set category=
set wadnameless=
set patchname=
set slotname=
set slotcode=
set versionname=
set versioncode=
set DEC=
set VERFINAL=
set HEX=
set VER=
set wadfolder=
set verfinal=
set PATCHCODE=
set alreadyexists=
set patch=
set ADVTYPE=

Set ADVLIST=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                               ADVANCED CUSTOM DOWNLOADS
echo.
echo                        Choose a file for Advanced Custom Download
echo.
echo       D = Download Selected Files    1/2/3/4 = Page 1/2/3/4        M = Main Menu
echo       C = Clear Download Queue       (blank) = Cycle Pages        DR = Drive Menu
echo.
echo       Note: To return to this page from other Download Pages enter "ADV"
echo.
echo                U = User-Defined Custom Download (Very Advanced)
echo                      *Download\Patch ANY IOS, MIOS or System Menu
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] IOSs \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 cIOSs



set d2x-beta-rev=6
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat



echo                 9 = IOS9v1034		 2224 = cIOS222[38]-v4
echo                12 = IOS12v526		  222 = cIOS222[38]-v5
echo                13 = IOS13v1032		  223 = cIOS223[37-38]-v4
echo                14 = IOS14v1032		22337 = cIOS223[37]-v5
echo                15 = IOS15v1032		  224 = cIOS224[57]-v5
echo                17 = IOS17v1032
echo                21 = IOS21v1039	        24914 = cIOS249-v14
echo                22 = IOS22v1294	        24917 = cIOS249-v17b
echo                28 = IOS28v1807
echo                30 = IOS30v2576        2491937 = cIOS249[37]-v19
echo                31 = IOS31v3608	      2491938 = cIOS249[38]-v19
echo                33 = IOS33v3608	      2491957 = cIOS249[57]-v19
echo                34 = IOS34v3608	      2492038 = cIOS249[38]-v20
echo                35 = IOS35v3608	      2492056 = cIOS249[56]-v20
echo                36 = IOS36v3608	      2492057 = cIOS249[57]-v20
echo                37 = IOS37v5663
echo                38 = IOS38v4124        2492137 = cIOS249[37]-v21
echo                41 = IOS41v3607        2492138 = cIOS249[38]-v21
echo                43 = IOS43v3607        2492153 = cIOS249[53]-v21
echo                45 = IOS45v3607        2492155 = cIOS249[55]-v21
echo                46 = IOS46v3607        2492156 = cIOS249[56]-v21
echo                48 = IOS48v4124        2492157 = cIOS249[57]-v21
echo                53 = IOS53v5663        2492158 = cIOS249[58]-v21
echo                55 = IOS55v5663
echo                56 = IOS56v5662       249d2x37 = cIOS249[37]-d2x-v%d2x-beta-rev%
echo                57 = IOS57v5919       249d2x38 = cIOS249[38]-d2x-v%d2x-beta-rev%
echo                58 = IOS58v6176       249d2x53 = cIOS249[53]-d2x-v%d2x-beta-rev%
echo                60 = IOS60v6174       249d2x55 = cIOS249[55]-d2x-v%d2x-beta-rev%
echo                61 = IOS61v5662       249d2x56 = cIOS249[56]-d2x-v%d2x-beta-rev%
echo                70 = IOS70v6687       249d2x57 = cIOS249[57]-d2x-v%d2x-beta-rev%
echo                80 = IOS80v6944       249d2x58 = cIOS249[58]-d2x-v%d2x-beta-rev%

if not exist modules\More-cIOSs echo.
if exist modules\More-cIOSs echo                                          BETA = d2x beta settings

echo.
echo      %AdvNumber% Advanced Downloads in Queue
echo.
set /p ADVLIST=     Enter Selection Here: 

if /i "%ADVLIST%" EQU "M" goto:MENU

if /i "%ADVLIST%" EQU "DR" set BACKB4DRIVE=ADVANCED
if /i "%ADVLIST%" EQU "DR" goto:DRIVECHANGE

if /i "%ADVLIST%" EQU "U" goto:Custom


if /i "%ADVLIST%" EQU "1" goto:LIST
if /i "%ADVLIST%" EQU "2" goto:OLDLIST
if /i "%ADVLIST%" EQU "3" goto:LIST3
if /i "%ADVLIST%" EQU "4" goto:LIST4
if /i "%ADVLIST%" EQU "ADV" goto:ADVANCED
IF "%ADVLIST%"=="" goto:LIST


if not exist modules\More-cIOSs goto:quickskip
if /i "%ADVLIST%" EQU "BETA" (set backbeforebetaswitch=ADVANCED) & (goto:betaswitch)
:quickskip


if /i "%ADVLIST%" EQU "D" set loadorgo=go
if /i "%ADVLIST%" EQU "D" set BACKB4QUEUE=ADVANCED
if /i "%ADVLIST%" EQU "D" goto:DOWNLOADQUEUE

if /i "%ADVLIST%" EQU "C" goto:CLEAR

set ADVTYPE=IOS
if /i "%ADVLIST%" EQU "9" goto:IOS9
if /i "%ADVLIST%" EQU "12" goto:IOS12
if /i "%ADVLIST%" EQU "13" goto:IOS13
if /i "%ADVLIST%" EQU "14" goto:IOS14
if /i "%ADVLIST%" EQU "15" goto:IOS15
if /i "%ADVLIST%" EQU "17" goto:IOS17
if /i "%ADVLIST%" EQU "21" goto:IOS21
if /i "%ADVLIST%" EQU "22" goto:IOS22
if /i "%ADVLIST%" EQU "28" goto:IOS28
if /i "%ADVLIST%" EQU "30" goto:IOS30
if /i "%ADVLIST%" EQU "31" goto:IOS31
if /i "%ADVLIST%" EQU "33" goto:IOS33
if /i "%ADVLIST%" EQU "34" goto:IOS34
if /i "%ADVLIST%" EQU "35" goto:IOS35
if /i "%ADVLIST%" EQU "36" goto:IOS36v3608
if /i "%ADVLIST%" EQU "37" goto:IOS37
if /i "%ADVLIST%" EQU "38" goto:IOS38
if /i "%ADVLIST%" EQU "41" goto:IOS41
if /i "%ADVLIST%" EQU "43" goto:IOS43
if /i "%ADVLIST%" EQU "45" goto:IOS45
if /i "%ADVLIST%" EQU "46" goto:IOS46
if /i "%ADVLIST%" EQU "48" goto:IOS48v4124
if /i "%ADVLIST%" EQU "53" goto:IOS53
if /i "%ADVLIST%" EQU "55" goto:IOS55
if /i "%ADVLIST%" EQU "56" goto:IOS56
if /i "%ADVLIST%" EQU "57" goto:IOS57
if /i "%ADVLIST%" EQU "58" goto:IOS58
if /i "%ADVLIST%" EQU "60" goto:IOS60
if /i "%ADVLIST%" EQU "61" goto:IOS61
if /i "%ADVLIST%" EQU "70" goto:IOS70
if /i "%ADVLIST%" EQU "80" goto:IOS80

set ADVTYPE=CIOS
if /i "%ADVLIST%" EQU "222" goto:cIOS222[38]-v5
if /i "%ADVLIST%" EQU "22337" goto:cIOS223[37]-v5
if /i "%ADVLIST%" EQU "224" goto:cIOS224[57]-v5
if /i "%ADVLIST%" EQU "2491937" goto:cIOS249[37]-v19
if /i "%ADVLIST%" EQU "2491938" goto:cIOS249[38]-v19
if /i "%ADVLIST%" EQU "2492038" goto:cIOS249[38]-v20
if /i "%ADVLIST%" EQU "2492056" goto:cIOS249[56]-v20
if /i "%ADVLIST%" EQU "2492057" goto:cIOS249[57]-v20
if /i "%ADVLIST%" EQU "2491957" goto:cIOS249[57]-v19
if /i "%ADVLIST%" EQU "2224" goto:cIOS222[38]-v4
if /i "%ADVLIST%" EQU "223" goto:cIOS223[37-38]-v4
if /i "%ADVLIST%" EQU "24917" goto:cIOS249-v17b
if /i "%ADVLIST%" EQU "24914" goto:cIOS249-v14
if /i "%ADVLIST%" EQU "2492137" goto:cIOS249[37]-v21
if /i "%ADVLIST%" EQU "2492138" goto:cIOS249[38]-v21
if /i "%ADVLIST%" EQU "2492156" goto:cIOS249[56]-v21
if /i "%ADVLIST%" EQU "2492153" goto:cIOS249[53]-v21
if /i "%ADVLIST%" EQU "2492155" goto:cIOS249[55]-v21
if /i "%ADVLIST%" EQU "2492157" goto:cIOS249[57]-v21
if /i "%ADVLIST%" EQU "2492158" goto:cIOS249[58]-v21
if /i "%ADVLIST%" EQU "249d2x37" goto:cIOS249[37]-d2x-v6
if /i "%ADVLIST%" EQU "249d2x38" goto:cIOS249[38]-d2x-v6
if /i "%ADVLIST%" EQU "249d2x53" goto:cIOS249[53]-d2x-v6
if /i "%ADVLIST%" EQU "249d2x55" goto:cIOS249[55]-d2x-v6
if /i "%ADVLIST%" EQU "249d2x56" goto:cIOS249[56]-d2x-v6
if /i "%ADVLIST%" EQU "249d2x57" goto:cIOS249[57]-d2x-v6
if /i "%ADVLIST%" EQU "249d2x58" goto:cIOS249[58]-d2x-v6


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:ADVANCED

::------------------------
:betaswitch

dir modules\More-cIOSs /a:d /b>temp\list.txt

::count # of folders in advance to set "mode"
setlocal ENABLEDELAYEDEXPANSION
SET d2xTOTAL=0
for /f "delims=" %%i in (temp\list.txt) do set /a d2xTOTAL=!d2xTOTAL!+1
setlocal DISABLEDELAYEDEXPANSION

SET /a LINES=%d2xTOTAL%+21
if %LINES% LEQ 54 goto:noresize
mode con cols=85 lines=%LINES%
:noresize


Set betacios=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                    Select the beta d2x cIOS you would like to build:
echo.
echo.


if /i "%d2xTOTAL%" EQU "0" (echo                 No d2x-betas were found in the modules\More-cIOSs Folder) & (goto:quickskip)
echo       N = None, build the d2x cIOSs that came with ModMii v%currentversion%
echo.

set MorecIOSsNum=0

::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\list.txt) do call :processlist %%A
goto:quickskip
:processlist
set CurrentcIOS=%*
if not exist "modules\More-cIOSs\%CurrentcIOS%\d2x-beta.bat" goto:EOF
set /a MorecIOSsNum=%MorecIOSsNum%+1
echo       %MorecIOSsNum% = %CurrentcIOS%
goto:EOF
:quickskip

echo.
echo     WWW = Check for Updates at http://tinyurl.com/d2xcIOS

echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
set /p betacios=     Enter Selection Here: 

if /i "%betacios%" EQU "M" (mode con cols=85 lines=54) & (goto:MENU)
if /i "%betacios%" EQU "B" (mode con cols=85 lines=54) & (goto:%backbeforebetaswitch%)

if /i "%betacios%" EQU "WWW" (start http://gbatemp.net/t277659-ciosx-rev21d2x-v2-yet-another-hot-fix) & (goto:betaswitch)

if /i "%betacios%" EQU "N" (rd /s /q modules\d2x-beta) & (mode con cols=85 lines=54) & (goto:d2xfix)

if "%betacios%"=="" goto:badkey


if /i "%d2xTOTAL%" EQU "0" goto:badkey

echo set betacios=%betacios% >temp\temp.bat
sfk filter -quiet temp\temp.bat -rep _.__ -lerep _" "__ -write -yes
call temp\temp.bat
del temp\temp.bat>nul

if %betacios% LSS 1 goto:badkey
if /i %betacios% GTR %MorecIOSsNum% goto:badkey

::----copy folders over----
set MorecIOSsNum2=0
::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\list.txt) do call :processlist2 %%A
goto:quickskip
:processlist2
set CurrentcIOS=%*
if not exist "modules\More-cIOSs\%CurrentcIOS%\d2x-beta.bat" goto:EOF
set /a MorecIOSsNum2=%MorecIOSsNum2%+1
if /i "%MorecIOSsNum2%" EQU "%betacios%" goto:quickskip

goto:EOF
:quickskip
if exist modules\d2x-beta rd /s /q modules\d2x-beta
mkdir modules\d2x-beta
copy /y "modules\More-cIOSs\%CurrentcIOS%\*" "modules\d2x-beta">nul
del temp\list.txt>nul
mode con cols=85 lines=54
goto:d2xfix


:badkey
echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:betaswitch


::--------------
:d2xfix
::d2x check for changed DL names and md5's for Advanced downloads only

if not exist temp\DLnamesADV.txt (mode con cols=85 lines=54) & (goto:%backbeforebetaswitch%)
findStr "d2x" temp\DLnamesADV.txt >nul
IF ERRORLEVEL 1 (mode con cols=85 lines=54) & (goto:%backbeforebetaswitch%)

FINDSTR /N . temp\DLnamesADV.txt>temp\DLnamesADVcheck.txt
sfk filter -quiet temp\DLnamesADVcheck.txt -+d2x -rep _cIOS*[_cIOS249[_ -rep _"Advanced Download: "__ -write -yes

set loadorgo=load4switch

::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\DLnamesADVcheck.txt) do call :processDLCheckswitch %%A
goto:quickskip
:processDLCheckswitch

set advDLCheck=%*

echo set advDLcheckNUM=%advDLCheck%>temp\advDLcheckNUM.bat
sfk filter -quiet temp\advDLcheckNUM.bat -rep _:*__ -write -yes
call temp\advDLcheckNUM.bat
del temp\advDLcheckNUM.bat>nul

echo %advDLCheck%>temp\advDLcheck.bat
sfk filter -quiet temp\advDLcheck.bat -rep _"%advDLcheckNUM%:"_"set advDLcheck="_ -write -yes
call temp\advDLcheck.bat
del temp\advDLcheck.bat>nul


call temp\AdvDL%advDLcheckNUM%.bat
set oldfullname=%name%

set advDLCheck0=%advDLCheck%

set d2x-beta-rev=6
set advDLCheck=%advDLCheck:~0,17%%d2x-beta-rev%
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat

set string=%d2x-beta-rev%
set d2xVersionLength=0

:loopd2xVersionLength
if defined string (
    set string=%string:~1%
    set /A d2xVersionLength += 1
    goto:loopd2xVersionLength
    )

echo set alt-d2x-beta-rev=@advDLcheck0:~17,%d2xVersionLength%@>temp\d2x-beta-rev.bat
sfk filter temp\d2x-beta-rev.bat -spat -rep _@_%%_ -write -yes>nul
call temp\d2x-beta-rev.bat
del temp\d2x-beta-rev.bat>nul

if /i "%d2x-beta-rev%" EQU "%alt-d2x-beta-rev%" goto:EOF

goto:%advDLCheck%


:processDLCheck2switch

set slotnum=%slotcode:~7%
if "%slotnum%"=="" set slotnum=249
set newname=cIOS%slotnum%%basecios:~7,10%%d2x-beta-rev%

::update temp\AdvDL#.bat
sfk filter -quiet temp\AdvDL%advDLcheckNUM%.bat -rep _"set MD5="*_"set MD5=%MD5%"_ -rep _"set md5alt="*_"set md5alt=%md5alt%"_ -rep _"set ciosversion="*_"set ciosversion=%ciosversion%"_ -rep _"Advanced Download: "*_"Advanced Download: %newname%%versionname%"_ -rep _"set wadname="*_"set wadname=%wadname%"_ -rep _"set wadnameless="*_"set wadnameless=%newname%"_ -write -yes

::update temp\DLnamesADV.txt
sfk filter -quiet temp\DLnamesADV.txt -lerep _"%oldfullname%"_"Advanced Download: %newname%%versionname%"_ -write -yes
goto:EOF
:quickskip

if exist temp\DLnamesADVcheck.txt del temp\DLnamesADVcheck.txt>nul
::set loadorgo=go
mode con cols=85 lines=54
goto:%backbeforebetaswitch%
::---------------------


::------------------------------------ADVANCED page 2 - PATCH IOS--------------------------------
:ADVPAGE2
set loadorgo=go
set ADVPATCH=
set patchcode=
set patchname=
set ADVSLOT=
set SLOTCODE=
set SLOTNAME=

if /i "%ADVLIST%" EQU "U" goto:skip
set wadnameless=%wadname%
echo BLAH%wadname%>wadnametemp.bat
sfk filter wadnametemp.bat -rep _BLAH_"set wadnameless="_ -rep _-64-__ -rep _RVL-__ -rep _.wad__ -write -yes>nul
call wadnametemp.bat
del wadnametemp.bat>nul
if /i "%ADVTYPE%" EQU "CIOS" goto:ADVPAGE3
:skip

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      How would you like to patch %wadnameless%?
echo.
echo.
echo.
echo                A = All 3 available patches
echo                N = No Patches
echo.
echo               FS = FakeSigning Patch
echo               ES = ES Identify Patch
echo               NP = Nand Permission Patch
echo.
echo                X = FakeSigning Patch + ES Identify Patch
echo                Y = FakeSigning Patch + Nand Permission Patch
echo                Z = ES Identify Patch + Nand Permission Patch
echo.
echo.
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
set /p ADVPATCH=     Enter Selection Here: 



if /i "%ADVLIST%" EQU "U" goto:skip
::"B" will actually take u to the menu only to clear the download_queue, then it will return to advanced page1
if /i "%ADVPATCH%" EQU "B" goto:ADVANCED
:skip
if /i "%ADVPATCH%" EQU "B" goto:CUSTOMPAGE2
if /i "%ADVPATCH%" EQU "M" goto:MENU

if /i "%ADVPATCH%" EQU "A" set patchcode= -FS -ES -NP
if /i "%ADVPATCH%" EQU "N" set patchcode=
if /i "%ADVPATCH%" EQU "FS" set patchcode= -FS
if /i "%ADVPATCH%" EQU "ES" set patchcode= -ES
if /i "%ADVPATCH%" EQU "NP" set patchcode= -NP
if /i "%ADVPATCH%" EQU "X" set patchcode= -FS -ES
if /i "%ADVPATCH%" EQU "Y" set patchcode= -FS -NP
if /i "%ADVPATCH%" EQU "Z" set patchcode= -ES -NP

if /i "%ADVPATCH%" EQU "A" set patchname=[FS-ES-NP]
if /i "%ADVPATCH%" EQU "N" set patchname=
if /i "%ADVPATCH%" EQU "FS" set patchname=[FS]
if /i "%ADVPATCH%" EQU "ES" set patchname=[ES]
if /i "%ADVPATCH%" EQU "NP" set patchname=[NP]
if /i "%ADVPATCH%" EQU "X" set patchname=[FS-ES]
if /i "%ADVPATCH%" EQU "Y" set patchname=[FS-NP]
if /i "%ADVPATCH%" EQU "Z" set patchname=[ES-NP]

if /i "%ADVPATCH%" EQU "A" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "N" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "X" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "Y" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "Z" goto:ADVPAGE3

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:ADVPAGE2


::------------------------------------ADVANCED page 3 - SLOT--------------------------------
:ADVPAGE3
set ADVSLOT=
set SLOTCODE=
set SLOTNAME=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo            To change the IOS slot # for %wadnameless%%patchname%
echo.
echo            Enter a new IOS slot # now
echo.
echo.
echo.
echo.
sfk echo -spat \x20 [Red] WARNING: Be careful what IOS slot # you choose, if it overwrites a crucial IOS 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] YOU MAY BRICK
echo.
echo.
echo.
echo              Note: Must be between 3 and 254
echo.
echo.
echo                N = No, leave slot unchanged
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
set /p ADVSLOT=     Enter Selection Here: 


::"B" will actually take u to the menu only to clear the download_queue, then it will return to advanced page1

if /i "%ADVSLOT%" EQU "M" goto:MENU


if /i "%ADVTYPE%" EQU "CIOS" goto:BACKTOMENUFIRST
if /i "%ADVSLOT%" EQU "B" goto:ADVPAGE2
:BACKTOMENUFIRST
if /i "%ADVSLOT%" EQU "B" goto:ADVANCED


set SLOTCODE= -slot %ADVSLOT%
set SLOTNAME=-slot%ADVSLOT%

if /i "%ADVSLOT%" EQU "N" goto:ADVPAGE4

::limit user input to X# of digits
if not "%ADVSLOT:~3%"=="" (
::    echo. ERROR: Name cannot be more than 8 chars
    goto:badkey
)

::Reject negative numbers - and reject 1 and 2 (LSS is less than, GTR is greater than)
if %ADVSLOT% LSS 3 (goto:badkey)



if %ADVSLOT% LEQ 254 goto:ADVPAGE4




:badkey
echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:ADVPAGE3



::------------------------------------ADVANCED page 4 - Version--------------------------------
:ADVPAGE4
Set ADVVERSION=
set VERSIONNAME=
set VERSIONCODE=


if /i "%ADVSLOT%" EQU "N" set SLOTCODE=
if /i "%ADVSLOT%" EQU "N" set SLOTNAME=



set versionreal=%version%
if /i "%ADVLIST%" EQU "2224" set versionreal=4
if /i "%ADVLIST%" EQU "223" set versionreal=4
if /i "%ADVLIST%" EQU "24914" set versionreal=14
if /i "%ADVLIST%" EQU "24917" set versionreal=17
if /i "%ADVLIST%" EQU "2491937" set versionreal=19
if /i "%ADVLIST%" EQU "2491938" set versionreal=19
if /i "%ADVLIST%" EQU "2491957" set versionreal=19
if /i "%ADVLIST%" EQU "2492056" set versionreal=20
if /i "%ADVLIST%" EQU "2492057" set versionreal=20
if /i "%ADVLIST%" EQU "2492038" set versionreal=20
if /i "%ADVLIST%" EQU "222" set versionreal=65535
if /i "%ADVLIST%" EQU "22337" set versionreal=65535
if /i "%ADVLIST%" EQU "224" set versionreal=65535

if /i "%ADVLIST%" EQU "2492137" set versionreal=21
if /i "%ADVLIST%" EQU "2492138" set versionreal=21
if /i "%ADVLIST%" EQU "2492153" set versionreal=21
if /i "%ADVLIST%" EQU "2492155" set versionreal=21
if /i "%ADVLIST%" EQU "2492156" set versionreal=21
if /i "%ADVLIST%" EQU "2492157" set versionreal=21
if /i "%ADVLIST%" EQU "2492158" set versionreal=21
if /i "%ADVLIST%" EQU "249d2x37" set versionreal=%ciosversion%
if /i "%ADVLIST%" EQU "249d2x38" set versionreal=%ciosversion%
if /i "%ADVLIST%" EQU "249d2x53" set versionreal=%ciosversion%
if /i "%ADVLIST%" EQU "249d2x55" set versionreal=%ciosversion%
if /i "%ADVLIST%" EQU "249d2x56" set versionreal=%ciosversion%
if /i "%ADVLIST%" EQU "249d2x57" set versionreal=%ciosversion%
if /i "%ADVLIST%" EQU "249d2x58" set versionreal=%ciosversion%


if /i "%ADVTYPE%" NEQ "CIOS" goto:miniskip
if /i "%ADVSLOT%" EQU "N" goto:miniskip
set wadnameless=cIOS%ADVSLOT%%wadname:~7%
set slotname=
:miniskip



set /a versionplus1=%versionreal%+1

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo        Would you like to change the version # of %wadnameless%%patchname%%slotname%
echo.
echo.
echo                                Note: MAX is 65535
echo.
echo.
echo              MAX = MAX (65535)
echo.
echo                N = No, leave version unchanged (%versionreal%)
if /i "%VER%" EQU "*" goto:bypass
if /i "%versionreal%" NEQ "65535" echo.
if /i "%versionreal%" NEQ "65535" echo               V1 = Version + 1 (%versionplus1%)
:bypass
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
set /p ADVVERSION=     Enter Selection Here: 



::"B" will actually take u to the menu only to clear the download_queue, then it will return to advanced page1



if /i "%ADVVERSION%" EQU "M" goto:MENU
if /i "%ADVVERSION%" EQU "B" goto:ADVPAGE3
if /i "%ADVVERSION%" EQU "MAX" set ADVVERSION=65535
if /i "%versionreal%" EQU "65535" goto:alreadymaxxed

if /i "%VER%" EQU "*" goto:alreadymaxxed
if /i "%ADVVERSION%" EQU "v1" set ADVVERSION=%versionplus1%
:alreadymaxxed

set versioncode= -v %ADVVERSION%
set versionname=-[v%ADVVERSION%]

if /i "%ADVLIST%" EQU "U" goto:skip
if /i "%ADVVERSION%" EQU "N" goto:ADVCONFIRM
:skip
if /i "%ADVVERSION%" EQU "N" goto:CONFIRM

::limit user input to X# of digits
if not "%ADVVERSION:~5%"=="" (
::    echo. ERROR: Name cannot be more than 8 chars
    goto:badkey
)

::Reject negative numbers (LSS is less than, GTR is greater than)
if %ADVVERSION% LSS 1 (goto:badkey)


if /i "%ADVLIST%" EQU "U" goto:skip
if %ADVVERSION% LEQ 65535 goto:ADVCONFIRM
:skip
if %ADVVERSION% LEQ 65535 goto:CONFIRM


:badkey
echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:ADVPAGE4






::------------------------------------ADVANCED page CONFIRM - Version--------------------------------
:ADVCONFIRM
set ADVCONFIRM=

if /i "%ADVVERSION%" EQU "N" set VERSIONNAME=
if /i "%ADVVERSION%" EQU "N" set VERSIONCODE=

set changes=
if /i "%wadname:~0,-4%" EQU "%wadnameless%%patchname%%slotname%%versionname%" set changes=none


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                               ADVANCED CUSTOM DOWNLOADS
echo.
echo.

if /i "%changes%" EQU "none" goto:nochanges
echo          Are these settings correct?
echo.
echo.
echo.
echo                    Download %wadname% and Patch it accordingly
echo.


if /i "%ADVTYPE%" NEQ "CIOS" goto:miniskip
if /i "%ADVSLOT%" EQU "N" goto:miniskip
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 cIOS[Red]%ADVSLOT%[def]%wadname:~7%[Red]%patchname%%slotname%%versionname%
goto:yeschanges
:miniskip

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 %wadnameless%[Red]%patchname%%slotname%%versionname%
goto:yeschanges

:nochanges
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Yellow] You have not selected any changes to be made to %wadnameless%
echo.
echo.
echo                        If you want to download %wadnameless%
echo                you can do so from the Batch/Additional Download Pages

:yeschanges
echo.
echo.
echo.
echo.

if /i "%changes%" NEQ "none" echo                Y = Yes, add Advanced Download to Queue
echo.
echo                N = No, go back to Advanced Custom Downloads Menu
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
set /p ADVCONFIRM=     Enter Selection Here: 


::"B" will actually take u to the menu only to clear the download_queue, then it will return to advanced page1
if /i "%ADVCONFIRM%" EQU "B" goto:ADVPAGE4
if /i "%ADVCONFIRM%" EQU "M" goto:MENU
if /i "%ADVCONFIRM%" EQU "N" goto:ADVANCED

if /i "%changes%" EQU "none" goto:nochanges2


if /i "%ADVCONFIRM%" EQU "Y" set /a AdvNumber=%AdvNumber%+1
if /i "%ADVCONFIRM%" EQU "Y" goto:SaveADVdlSettings

:nochanges2

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:ADVCONFIRM


:SaveADVdlSettings
echo "set name=Advanced Download: %wadnameless%%patchname%%slotname%%versionname%">temp\AdvDL%AdvNumber%.bat
echo "set wadname=%wadname%">>temp\AdvDL%AdvNumber%.bat
echo "set ciosslot=%ciosSLOT%">>temp\AdvDL%AdvNumber%.bat
echo "set ciosversion=%ciosVERSION%">>temp\AdvDL%AdvNumber%.bat
echo "set md5=%md5%">>temp\AdvDL%AdvNumber%.bat
echo "set md5alt=%md5alt%">>temp\AdvDL%AdvNumber%.bat
echo "set basewad=%basewad%">>temp\AdvDL%AdvNumber%.bat
echo "set md5base=%md5base%">>temp\AdvDL%AdvNumber%.bat
echo "set md5basealt=%md5basealt%">>temp\AdvDL%AdvNumber%.bat
echo "set code1=%code1%">>temp\AdvDL%AdvNumber%.bat
echo "set code2=%code2%">>temp\AdvDL%AdvNumber%.bat
echo "set version=%version%">>temp\AdvDL%AdvNumber%.bat
echo "set basewadb=%basewadb%">>temp\AdvDL%AdvNumber%.bat
echo "set md5baseb=%md5baseb%">>temp\AdvDL%AdvNumber%.bat
echo "set md5basebalt=%md5basebalt%">>temp\AdvDL%AdvNumber%.bat
echo "set code1b=%code1b%">>temp\AdvDL%AdvNumber%.bat
echo "set code2b=%code2b%">>temp\AdvDL%AdvNumber%.bat
echo "set versionb=%versionb%">>temp\AdvDL%AdvNumber%.bat
echo "set basecios=%basecios%">>temp\AdvDL%AdvNumber%.bat
echo "set diffpath=%diffpath%">>temp\AdvDL%AdvNumber%.bat
echo "set code2new=%code2new%">>temp\AdvDL%AdvNumber%.bat
echo "set lastbasemodule=%lastbasemodule%">>temp\AdvDL%AdvNumber%.bat
echo "set category=%category%">>temp\AdvDL%AdvNumber%.bat

echo "set wadnameless=%wadnameless%">>temp\AdvDL%AdvNumber%.bat
echo "set patchname=%patchname%">>temp\AdvDL%AdvNumber%.bat
echo "set slotname=%slotname%">>temp\AdvDL%AdvNumber%.bat
echo "set slotcode=%slotcode%">>temp\AdvDL%AdvNumber%.bat
echo "set versionname=%versionname%">>temp\AdvDL%AdvNumber%.bat
echo "set versioncode=%versioncode%">>temp\AdvDL%AdvNumber%.bat
echo "set cIOSFamilyName=%cIOSFamilyName%">>temp\AdvDL%AdvNumber%.bat
echo "set cIOSversionNum=%cIOSversionNum%">>temp\AdvDL%AdvNumber%.bat

::echo "goto:downloadstart">>temp\AdvDL%AdvNumber%.bat

echo "Advanced Download: %wadnameless%%patchname%%slotname%%versionname%">>temp\DLnamesADV.txt
echo "temp\AdvDL%AdvNumber%.bat">>temp\DLgotosADV.txt

sfk filter -quiet "temp\AdvDL%AdvNumber%.bat" -rep _"""__ -write -yes
sfk filter -quiet "temp\DLnamesADV.txt" -rep _"""__ -write -yes
sfk filter -quiet "temp\DLgotosADV.txt" -rep _"""__ -write -yes


goto:ADVANCED

::...................................Custom- User-Defined Custom Download...............................
:CUSTOM

set DEC=none
set HEX=
set countIOS=0

set VERFINAL=
set patchname=
set slotname=
set versionname=
set HEX=
set VER=
set wadfolder=
set verfinal=
set PATCHCODE=
set slotcode=
set versioncode=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo          Enter the Number of the IOS you would like to download
::echo      either in Decimal (x,xx,xxx; ie. 9,60,249), or in Hex (xx; ie. F9=249)
echo          or enter "SM" or "MIOS" to download a System Menu or MIOS
echo.
echo.
echo.
sfk echo  -spat \x20 \x20 \x20 \x20 [Red] WARNING: Make sure the IOS number you input actually exists
echo.
echo.
echo.
echo.
echo               #  = Download the IOS number
echo.
echo              SM  = Download a System Menu
echo.
echo             MIOS = Download an MIOS
echo.
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p DEC=     Enter Selection Here: 

if /i "%DEC%" EQU "M" goto:MENU
if /i "%DEC%" EQU "B" goto:ADVANCED
if /i "%DEC%" EQU "MIOS" goto:CUSTOMPAGE2
if /i "%DEC%" EQU "SM" goto:CUSTOMPAGE2


::limit user input to X# of digits
if not "%DEC:~3%"=="" (
::    echo. ERROR: Name cannot be more than 8 chars
    goto:badkey
)

::Reject negative numbers (LSS is less than, GTR is greater than)
if %DEC% LSS 1 (goto:badkey)



if %DEC% LEQ 254 goto:CUSTOMPAGE2


:badkey
echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:CUSTOM



:CUSTOMPAGE2
set VER=
set ADVPATCH=
set patchcode=
set patchname=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if /i "%DEC%" EQU "SM" echo      What Version of the System Menu would like to download? (ie. XXX)
if /i "%DEC%" EQU "SM" goto:NEXT1
if /i "%DEC%" EQU "MIOS" echo      What Version of MIOS would like to download? (ie. 4, 5, 8, 10)
if /i "%DEC%" EQU "MIOS" goto:NEXT1
echo      What Version of IOS %DEC% would like to download?
:NEXT1
echo.
echo.
echo.
sfk echo  -spat \x20 \x20 \x20 \x20 \x20 \x20 [Red] WARNINGS:[def] - Make sure the version you input actually exists
echo                        - Most recent version may be stubbed
echo.
echo.
echo.
echo.
if /i "%DEC%" NEQ "SM" echo                * = Download the most recent version
if /i "%DEC%" EQU "SM" echo                * = Download the most recent Korean System Menu
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p VER=     Enter Selection Here: 

if /i "%VER%" EQU "M" goto:MENU
if /i "%VER%" EQU "B" goto:CUSTOM

set version=%VER%
if /i "%VER%" EQU "*" goto:bypass


::limit user input to X# of digits
if not "%VER:~5%"=="" (
    goto:badkey
)


::Reject negative numbers (LSS is less than, GTR is greater than)
if %VER% LSS 1 (goto:badkey)



:bypass

if /i "%DEC%" EQU "SM" goto:nopatches
if /i "%DEC%" EQU "MIOS" goto:nopatches

::for IOSs Only
if /i "%VER%" NEQ "*" set wadnameless=IOS%DEC%-64-v%VER%
if /i "%VER%" EQU "*" set wadnameless=IOS%DEC%-64-vNEW
if /i "%VER%" EQU "*" goto:ADVPAGE2
if /i "%VER%" LSS 65536 goto:ADVPAGE2

:nopatches
if /i "%VER%" EQU "*" goto:CONFIRM
if /i "%VER%" LSS 65536 goto:CONFIRM

:badkey
echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:CUSTOMPAGE2




:CONFIRM
if /i "%ADVVERSION%" EQU "N" set VERSIONNAME=
if /i "%ADVVERSION%" EQU "N" set VERSIONCODE=


set VERFINAL=%VER%
if /i "%VER%" EQU "*" set VERFINAL=NEW



cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.

if /i "%DEC%" EQU "SM" echo      Are you sure you want to try downloading System Menu v%VER%?
if /i "%DEC%" EQU "SM" goto:NEXT2
if /i "%DEC%" EQU "MIOS" echo      Are you sure you want to try downloading MIOS v%VER%?
if /i "%DEC%" EQU "MIOS" goto:NEXT2


echo          Are you sure you want to try downloading IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%




:NEXT2
echo.
echo.
echo.
sfk echo  -spat \x20 \x20 \x20 \x20 [Red] WARNING: this download will fail if the file does not exist.
echo.
echo.
echo.
echo.
echo                Y = Yes, add Advanced Download to Queue
echo.
echo                N = No, go back to Advanced Custom Downloads Menu
echo.
echo.
echo.
echo                B = Back
echo.
echo                M = Main Menu
echo.
echo.
echo.
set /p CONFIRM=     Enter Selection Here: 

if /i "%CONFIRM%" EQU "M" goto:MENU
if /i "%CONFIRM%" EQU "N" goto:ADVANCED

::if /i "%CONFIRM%" EQU "A" goto:CUSTOMDL
if /i "%CONFIRM%" EQU "Y" set /a AdvNumber=%AdvNumber%+1
if /i "%CONFIRM%" EQU "Y" goto:SaveADVdlSettings2


if /i "%DEC%" EQU "SM" goto:skip
if /i "%DEC%" EQU "MIOS" goto:skip
if /i "%CONFIRM%" EQU "B" goto:ADVPAGE4
:skip
if /i "%CONFIRM%" EQU "B" goto:CUSTOMPAGE2

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:CONFIRM


:SaveADVdlSettings2
if /i "%DEC%" EQU "SM" (echo "set name=Advanced Download: System Menu v%VER%">temp\AdvDL%AdvNumber%.bat) & (echo "Advanced Download: System Menu v%VER%">>temp\DLnamesADV.txt) & (goto:miniskip)

if /i "%DEC%" EQU "MIOS" (echo "set name=Advanced Download: MIOS v%VER%">temp\AdvDL%AdvNumber%.bat) & (echo "Advanced Download: MIOS v%VER%">>temp\DLnamesADV.txt) & (goto:miniskip)

echo "set name=Advanced Download: IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%">temp\AdvDL%AdvNumber%.bat

echo "Advanced Download: IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%">>temp\DLnamesADV.txt

:miniskip

echo "set DEC=%DEC%">>temp\AdvDL%AdvNumber%.bat
echo "set VERFINAL=%VERFINAL%">>temp\AdvDL%AdvNumber%.bat
echo "set patchname=%patchname%">>temp\AdvDL%AdvNumber%.bat
echo "set slotname=%slotname%">>temp\AdvDL%AdvNumber%.bat
echo "set versionname=%versionname%">>temp\AdvDL%AdvNumber%.bat
echo "set HEX=%HEX%">>temp\AdvDL%AdvNumber%.bat
echo "set VER=%VER%">>temp\AdvDL%AdvNumber%.bat
echo "set wadfolder=%wadfolder%">>temp\AdvDL%AdvNumber%.bat
echo "set PATCHCODE=%PATCHCODE%">>temp\AdvDL%AdvNumber%.bat
echo "set slotcode=%slotcode%">>temp\AdvDL%AdvNumber%.bat
echo "set versioncode=%versioncode%">>temp\AdvDL%AdvNumber%.bat
echo "set category=userdefined">>temp\AdvDL%AdvNumber%.bat

::echo "Advanced Download: %wadnameless%%patchname%%slotname%%versionname%">>temp\DLnamesADV.txt

echo "temp\AdvDL%AdvNumber%.bat">>temp\DLgotosADV.txt

sfk filter -quiet "temp\AdvDL%AdvNumber%.bat" -rep _"""__ -write -yes
sfk filter -quiet "temp\DLnamesADV.txt" -rep _"""__ -write -yes
sfk filter -quiet "temp\DLgotosADV.txt" -rep _"""__ -write -yes
goto:Advanced



::...................................CONFIG File Menu...............................
:CONFIGFILEMENU
set configfile=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo          Which Wii App would you like to configure?
echo.
echo.
echo.
echo          BM = BootMii (create bootmii.ini)
echo.
echo         MMM = Multi-Mod Manager (create mmmconfig.txt)
echo.
echo          WM = Wad Manager (create wm_config.txt)
echo.
echo.
echo.
echo.
echo           B = Back
echo.
echo           M = Main Menu
echo.
echo.
echo.
echo.
set /p configfile=     Enter Selection Here: 

if /i "%configfile%" EQU "M" goto:MENU
if /i "%configfile%" EQU "B" goto:MENU

if /i "%configfile%" EQU "BM" goto:BMCONFIG
if /i "%configfile%" EQU "WM" goto:WMCONFIG
if /i "%configfile%" EQU "MMM" goto:MMMCONFIG


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:CONFIGFILEMENU




::...................................BootMii CONFIGURATOR (bootmii.ini)...............................
:BMCONFIG
set BMVIDEO=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo                 This will create a bootmii.ini file in %DRIVE%\bootmii\
echo                        to determine how BootMii is launched.
echo.
echo.
echo.
echo.
echo      Enter the Video Mode you would like BootMii to use:
echo.
echo.
echo.
echo                 N = NTSC
echo                50 = PAL50
echo                60 = PAL60
echo                 P = Progressive
echo.
echo.
echo.
echo.
echo                 B = Back
echo.
echo                 M = Main Menu
echo.
echo.
echo.
echo.
set /p BMVIDEO=     Enter Selection Here: 

if /i "%BMVIDEO%" EQU "M" goto:MENU
if /i "%BMVIDEO%" EQU "B" goto:CONFIGFILEMENU
if /i "%BMVIDEO%" EQU "N" set BMVIDEO=NTSC
if /i "%BMVIDEO%" EQU "50" set BMVIDEO=PAL50
if /i "%BMVIDEO%" EQU "60" set BMVIDEO=PAL60
if /i "%BMVIDEO%" EQU "P" set BMVIDEO=PROGRESSIVE
if /i "%BMVIDEO%" EQU "NTSC" goto:BMCONFIG2
if /i "%BMVIDEO%" EQU "PAL50" goto:BMCONFIG2
if /i "%BMVIDEO%" EQU "PAL60" goto:BMCONFIG2
if /i "%BMVIDEO%" EQU "PROGRESSIVE" goto:BMCONFIG2

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG







::...................................BootMii CONFIGURATOR (bootmii.ini)...............................
:BMCONFIG2
set BMBOOT=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      What would you like BootMii to AutoBoot?
echo.
echo.
echo.
echo                 O = OFF     (BootMii)
echo                 H = HBC     (Homebrew Channel)
echo                 S = SYSMENU (System Menu)
echo.
echo.
echo.
echo.
echo                 B = Back
echo.
echo                 M = Main Menu
echo.
echo.
echo.
echo.
set /p BMBOOT=     Enter Selection Here: 

if /i "%BMBOOT%" EQU "M" goto:MENU
if /i "%BMBOOT%" EQU "B" goto:BMCONFIG

if /i "%BMBOOT%" EQU "O" set BMBOOT=OFF
if /i "%BMBOOT%" EQU "H" set BMBOOT=HBC
if /i "%BMBOOT%" EQU "S" set BMBOOT=SYSMENU

if /i "%BMBOOT%" EQU "OFF" set BMDELAY=0
if /i "%BMBOOT%" EQU "OFF" goto:BMCONFIG4
if /i "%BMBOOT%" EQU "HBC" goto:BMCONFIG3
if /i "%BMBOOT%" EQU "SYSMENU" goto:BMCONFIG3

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG2



::...................................BootMii CONFIGURATOR (bootmii.ini)...............................
:BMCONFIG3
set BMDELAY=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
if /i "%BMBOOT%" EQU "HBC" echo      How many seconds should BootMii to wait to autoboot the HomeBrew Channel?
if /i "%BMBOOT%" EQU "SYSMENU" echo      How many seconds should BootMii to wait to autoboot the System Menu?
echo.
echo.
echo.
echo.
echo          Possible Settings:
echo.
echo                 0,1,2,3,4,5,6,7,8,9,10
echo.
echo.
echo.
echo.
echo                 B = Back
echo.
echo                 M = Main Menu
echo.
echo.
echo.
echo.
set /p BMDELAY=     Enter Selection Here: 

if /i "%BMDELAY%" EQU "M" goto:MENU
if /i "%BMDELAY%" EQU "B" goto:BMCONFIG2


if /i "%BMDELAY%" EQU "0" goto:BMCONFIG4
if /i "%BMDELAY%" EQU "1" goto:BMCONFIG4
if /i "%BMDELAY%" EQU "2" goto:BMCONFIG4
if /i "%BMDELAY%" EQU "3" goto:BMCONFIG4
if /i "%BMDELAY%" EQU "4" goto:BMCONFIG4
if /i "%BMDELAY%" EQU "5" goto:BMCONFIG4
if /i "%BMDELAY%" EQU "6" goto:BMCONFIG4
if /i "%BMDELAY%" EQU "7" goto:BMCONFIG4
if /i "%BMDELAY%" EQU "8" goto:BMCONFIG4
if /i "%BMDELAY%" EQU "9" goto:BMCONFIG4
if /i "%BMDELAY%" EQU "10" goto:BMCONFIG4

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG3





::...................................BootMii CONFIGURATOR (bootmii.ini)...............................
:BMCONFIG4
set BMSD=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      Would you also like to download BootMii SD Files required to launch BootMii?
echo.
echo.
echo.
echo          Note: these are the same files generated by the HackMii Installer
echo                by installing BootMii as Boot2 or by Preparing an SD Card
echo.
echo.
echo.
echo                 Y = Yes
echo.
echo                 N = No
echo.
echo.
echo.
echo.
echo                 B = Back
echo.
echo                 M = Main Menu
echo.
echo.
echo.
echo.
set /p BMSD=     Enter Selection Here: 

if /i "%BMSD%" EQU "M" goto:MENU

if /i "%BMBOOT%" EQU "OFF" goto:skip
if /i "%BMSD%" EQU "B" goto:BMCONFIG3
:skip
if /i "%BMSD%" EQU "B" goto:BMCONFIG2

if /i "%BMSD%" EQU "Y" goto:BMCONFIG5
if /i "%BMSD%" EQU "N" goto:BMCONFIG5


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG4






::...................................BootMii CONFIGURATOR page 5...............................
:BMCONFIG5
set BMCONFIRM=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo                              Are these settings correct?
echo.
echo.
echo      Video Mode is set to %BMVIDEO%
echo.
echo      AutoBoot is set to %BMBOOT%
if /i "%BMBOOT%" EQU "OFF" goto:nodelay
echo.
echo      AutoBoot Delay is set to %BMDELAY% seconds
:nodelay
echo.
if /i "%BMSD%" EQU "Y" echo      * Download BootMii SD Files to Launch BootMii
echo.
echo.
echo.
echo.
echo.
echo      Y = Yes, Create bootmii.ini with these settings
if exist "%Drive%"\bootmii\bootmii.ini echo           Note: existing bootmii.ini will be overwritten
echo.
echo      N = No, take me back to the Main Menu
echo.
echo.
echo.
echo      B = Back
echo.
echo      M = Main Menu
echo.
echo.
echo.
echo.
set /p BMCONFIRM=     Enter Selection Here: 

if /i "%BMCONFIRM%" EQU "B" goto:BMCONFIG4
if /i "%BMCONFIRM%" EQU "M" goto:MENU
if /i "%BMCONFIRM%" EQU "N" goto:MENU
if /i "%BMCONFIRM%" EQU "Y" goto:BUILDBMCONFIG

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG5


:BUILDBMCONFIG
if not exist "%Drive%"\bootmii mkdir "%Drive%"\bootmii


echo # BootMii Config File> "%Drive%"\bootmii\bootmii.ini
echo # Created by ModMii>> "%Drive%"\bootmii\bootmii.ini
echo #>> "%Drive%"\bootmii\bootmii.ini
echo # Video mode, possible settings:>> "%Drive%"\bootmii\bootmii.ini
echo # NTSC, PAL50, PAL60, PROGRESSIVE>> "%Drive%"\bootmii\bootmii.ini
echo VIDEO=%BMVIDEO%>> "%Drive%"\bootmii\bootmii.ini
echo #>> "%Drive%"\bootmii\bootmii.ini
echo # Autoboot, possible settings:>> "%Drive%"\bootmii\bootmii.ini
echo # SYSMENU, HBC, OFF>> "%Drive%"\bootmii\bootmii.ini
echo AUTOBOOT=%BMBOOT%>> "%Drive%"\bootmii\bootmii.ini
echo #>> "%Drive%"\bootmii\bootmii.ini
echo # BOOTDELAY, possible settings:>> "%Drive%"\bootmii\bootmii.ini
echo # 0,1,2,3,4,5,6,7,8,9,10>> "%Drive%"\bootmii\bootmii.ini
echo BOOTDELAY=BLAH>> "%Drive%"\bootmii\bootmii.ini
sfk filter "%Drive%"\bootmii\bootmii.ini -rep _BLAH_%BMDELAY%_ -write -yes>nul

start notepad "%Drive%\bootmii\bootmii.ini"

cls
if /i "%BMSD%" EQU "Y" set DLTOTAL=1
if /i "%BMSD%" EQU "Y" set bootmiisd=*
if /i "%BMSD%" EQU "Y" goto:DLSETTINGS

goto:MENU






::...................................WAD MANAGER CONFIGURATOR (wmconfig.txt)...............................
:WMCONFIG
set WMCIOS=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      This will create a wm_config.txt file in %DRIVE%\WAD\, and it is optional.
echo      You will get all the prompts if you don't have this file.
echo.
echo      Note: only works for YAWMM, Wad Manager Multi-Mod and WAD Manager Folder Mod
echo.
echo.
echo.
echo.
echo      Enter the IOS # you would like Wad Manager to load automatically
echo.
echo              Note: MAX is 254
echo                    Common choices are 36, 249, 250, etc.
echo                    NAND Emulation installation only available for 249 or 250
echo.
echo.
echo.
echo      N = None (Wad Manager will prompt you for selection)
echo.
echo.
echo.
echo      B = Back
echo.
echo      M = Main Menu
echo.
echo.
echo.
echo.
set /p WMCIOS=     Enter Selection Here: 

if /i "%WMCIOS%" EQU "M" goto:MENU
if /i "%WMCIOS%" EQU "B" goto:CONFIGFILEMENU
if /i "%WMCIOS%" EQU "N" goto:WMCONFIG2

::limit user input to X# of digits
if not "%WMCIOS:~3%"=="" (
    goto:badkey
)

::Reject negative numbers (LSS is less than, GTR is greater than)
if %WMCIOS% LSS 1 (goto:badkey)

if %WMCIOS% LEQ 254 goto:WMCONFIG2

:badkey
echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WMCONFIG


::...................................WAD MANAGER CONFIGURATOR page 2...............................
:WMCONFIG2
set WMDEVICE=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo              Enter the FAT device you would like to load automatically.
echo.
echo              Note: you can enter either the number or the word
echo.
echo.
echo.
echo.
echo      1 = SD
echo      2 = USB
echo      3 = USB2
echo      4 = GCSDA
echo      5 = GCSDA
echo.
echo      N = None (Wad Manager will prompt you for selection)
echo.
echo.
echo.
echo.
echo      B = Back
echo.
echo      M = Main Menu
echo.
echo.
echo.
echo.
set /p WMDEVICE=     Enter Selection Here: 

if /i "%WMDEVICE%" EQU "1" SET WMDEVICE=sd
if /i "%WMDEVICE%" EQU "2" SET WMDEVICE=usb
if /i "%WMDEVICE%" EQU "3" SET WMDEVICE=usb2
if /i "%WMDEVICE%" EQU "4" SET WMDEVICE=gcsda
if /i "%WMDEVICE%" EQU "5" SET WMDEVICE=gcsdb

if /i "%WMDEVICE%" EQU "sd" goto:WMCONFIG3
if /i "%WMDEVICE%" EQU "usb" goto:WMCONFIG3
if /i "%WMDEVICE%" EQU "usb2" goto:WMCONFIG3
if /i "%WMDEVICE%" EQU "gcsda" goto:WMCONFIG3
if /i "%WMDEVICE%" EQU "gcsda" goto:WMCONFIG3
if /i "%WMDEVICE%" EQU "N" goto:WMCONFIG3

if /i "%WMDEVICE%" EQU "B" goto:WMCONFIG
if /i "%WMDEVICE%" EQU "M" goto:MENU



echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WMCONFIG2


::...................................WAD MANAGER CONFIGURATOR page 3...............................
:WMCONFIG3
:: NAND Emulation installation only available if cIOS249 or cIOS250 selected
if /i "%WMCIOS%" EQU "249" goto:WMCONFIG3B
if /i "%WMCIOS%" EQU "250" goto:WMCONFIG3B
if /i "%WMCIOS%" EQU "N" goto:WMCONFIG3B
set WMNAND=N
goto:WMCONFIG4

:WMCONFIG3B

set WMNAND=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      NAND Emulation
echo.
echo      Enter the NAND device you would like to select automatically.
echo.
echo.
echo          Note: PC tools like ShowMiiWads are better at installing wads to
echo                emulated nand. So I recommend leaving NAND Emulation Disabled
echo.
echo          Note: you can enter either the number or the word
echo.
echo.
echo.
echo      1 = Disable
echo      2 = USB
echo      3 = SD
echo.
echo      N = None (Wad Manager will prompt selection if cIOS249 or cIOS250 selected)
echo.
echo.
echo.
echo.
echo      B = Back
echo.
echo      M = Main Menu
echo.
echo.
echo.
echo.
set /p WMNAND=     Enter Selection Here: 


if /i "%WMNAND%" EQU "3" SET WMNAND=SD
if /i "%WMNAND%" EQU "2" SET WMNAND=USB
if /i "%WMNAND%" EQU "1" SET WMNAND=Disable


if /i "%WMNAND%" EQU "SD" goto:WMCONFIG4
if /i "%WMNAND%" EQU "USB" goto:WMCONFIG4
if /i "%WMNAND%" EQU "Disable" goto:WMCONFIG4
if /i "%WMNAND%" EQU "N" goto:WMCONFIG4
if /i "%WMNAND%" EQU "M" goto:MENU
if /i "%WMNAND%" EQU "B" goto:WMCONFIG2


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WMCONFIG3

::...................................WAD MANAGER CONFIGURATOR page 4...............................
:WMCONFIG4
set WMPATH=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      Enter the Start-up Path you would like to load initially.
echo.
echo          Note: If you don't have a startupPath, the default is /WAD
echo.
echo          Note: Be sure that the path exists, else you will get an error.
echo.
echo.
echo.
echo.
echo          Examples:
echo                   /WAD/Forwarders
echo                   /myWad
echo                   /
echo                      Note: '/' sets the StartupPath to the root of the device
echo.
echo.
echo      N = None (the default is /WAD)
echo.
echo.
echo.
echo.
echo      B = Back
echo.
echo      M = Main Menu
echo.
echo.
echo.
echo.
set /p WMPATH=     Enter Selection Here: 


if /i "%WMPATH%" EQU "N" SET WMPATH=/WAD
if /i "%WMPATH%" EQU "B" goto:WMCONFIG4BACK
if /i "%WMPATH%" EQU "M" goto:MENU
IF "%WMPATH%"=="" echo You Have Entered an Incorrect Key
IF "%WMPATH%"=="" @ping 127.0.0.1 -n 2 -w 1000> nul
IF "%WMPATH%"=="" goto:WMCONFIG4
goto:WMCONFIG5

:WMCONFIG4BACK
if /i "%WMCIOS%" EQU "249" goto:WMCONFIG3B
if /i "%WMCIOS%" EQU "250" goto:WMCONFIG3B
if /i "%WMCIOS%" EQU "N" goto:WMCONFIG3B
goto:WMCONFIG2





::...................................WAD MANAGER CONFIGURATOR page 5...............................
:WMCONFIG5
set WMPASS=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      Enter a Password to access Wad Manager ONLY using LRUD; where
echo.
echo         L = Left
echo         R = Right
echo         U = Up
echo         D = Down
echo.
echo      Note: Password is entered on the WiiMote or GC Controller, max 10 characters
echo.
echo      Note: If you don't have a password, the default is no password
echo.
echo.
echo.
echo.
echo          Examples:
echo                   UDLR
echo                   UDLRUDLRUD
echo                   UUUUUUU
echo                   L
echo.
echo.
echo      N = None (No Password)
echo.
echo.
echo.
echo.
echo      B = Back
echo.
echo      M = Main Menu
echo.
echo.
echo.
echo.
set /p WMPASS=     Enter Selection Here: 

if /i "%WMPASS%" EQU "B" goto:WMCONFIG4
if /i "%WMPASS%" EQU "M" goto:MENU

IF "%WMPASS%"=="" echo You Have Entered an Incorrect Key
IF "%WMPASS%"=="" @ping 127.0.0.1 -n 2 -w 1000> nul
IF "%WMPASS%"=="" goto:WMCONFIG5


::limit user input to X# of digits
if not "%WMPASS:~10%"=="" (
    echo. ERROR: Password cannot be more than 10 Digits
    @ping 127.0.0.1 -n 2 -w 1000> nul
    goto:WMCONFIG5
)



::...................................WAD MANAGER CONFIGURATOR page 6...............................
:WMCONFIG6
set WMCONFIRM=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo                              Are these settings correct?
echo.
echo.
if /i "%WMCIOS%" EQU "N" echo      Prompt cIOS Selection
if /i "%WMCIOS%" NEQ "N" echo      cIOSVersion=%WMCIOS%
echo.
if /i "%WMDEVICE%" EQU "N" echo      Prompt FAT Device Selection
if /i "%WMDEVICE%" NEQ "N" echo      FatDevice=%WMDEVICE%
echo.
if /i "%WMCIOS%" EQU "249" goto:nanddevice
if /i "%WMCIOS%" EQU "250" goto:nanddevice
goto:skipnanddevice

:nanddevice
if /i "%WMNAND%" EQU "N" echo      Prompt NAND Device Selection
if /i "%WMNAND%" NEQ "N" echo      NANDDevice=%WMNAND%
echo.
:skipnanddevice

echo      StartupPath=%WMPATH%
echo.
if /i "%WMPASS%" EQU "N" echo      No Password
if /i "%WMPASS%" NEQ "N" echo      Password=%WMPASS%
echo.
echo.
echo.
echo.
echo      Y = Yes, Create wm_config.txt with these settings
if exist "%Drive%"\WAD\wm_config.txt echo           Note: existing wm_config.txt will be overwritten
echo.
echo      N = No, take me back to the main menu
echo.
echo.
echo.
echo      B = Back
echo.
echo      M = Main Menu
echo.
echo.
echo.
echo.
set /p WMCONFIRM=     Enter Selection Here: 

if /i "%WMCONFIRM%" EQU "B" goto:WMCONFIG5
if /i "%WMCONFIRM%" EQU "M" goto:MENU
if /i "%WMCONFIRM%" EQU "N" goto:MENU
if /i "%WMCONFIRM%" EQU "Y" goto:BUILDWMCONFIG

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WMCONFIG6


:BUILDWMCONFIG
if not exist "%Drive%"\WAD mkdir "%Drive%"\WAD
echo ;wm_config.txt made by ModMii> "%Drive%"\WAD\wm_config.txt
if /i "%WMCIOS%" NEQ "N" echo cIOSVersion=%WMCIOS%>> "%Drive%"\WAD\wm_config.txt
if /i "%WMDEVICE%" NEQ "N" echo FatDevice=%WMDEVICE%>> "%Drive%"\WAD\wm_config.txt
if /i "%WMNAND%" NEQ "N" echo NANDDevice=%WMNAND%>> "%Drive%"\WAD\wm_config.txt
echo StartupPath=%WMPATH%>> "%Drive%"\WAD\wm_config.txt
if /i "%WMPASS%" NEQ "N" echo Password=%WMPASS%>> "%Drive%"\WAD\wm_config.txt
start notepad "%Drive%\WAD\wm_config.txt"
goto:MENU








::...................................MMM CONFIGURATOR (mmmconfig.txt)...............................
:MMMCONFIG
set WMCIOS=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      This will create a mmmconfig.txt file in %DRIVE%\, and it is optional.
echo.
echo.
echo.
echo.
echo      Enter the IOS # you would like Multi-Mod Manager (MMM) to load automatically
echo.
echo              Note: Max is 254
echo                    Common choices are 36, 249, 250, etc.
echo.
echo.
echo.
echo      N = None (Do Not Auto-Reload IOS)
echo.
echo.
echo.
echo      B = Back
echo.
echo      M = Main Menu
echo.
echo.
echo.
echo.
set /p WMCIOS=     Enter Selection Here: 

if /i "%WMCIOS%" EQU "M" goto:MENU
if /i "%WMCIOS%" EQU "B" goto:CONFIGFILEMENU
if /i "%WMCIOS%" EQU "N" goto:MMMCONFIG2

::limit user input to X# of digits
if not "%WMCIOS:~3%"=="" (
    goto:badkey
)

::Reject negative numbers (LSS is less than, GTR is greater than)
if %WMCIOS% LSS 1 (goto:badkey)

if %WMCIOS% LEQ 254 goto:MMMCONFIG2

:badkey
echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:MMMCONFIG


::...................................MMM CONFIGURATOR (mmmconfig.txt) page 2...............................
:MMMCONFIG2
set WMDEVICE=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      Enter the FAT device you would like to load automatically.
echo.
echo          Note: you can enter either the number or the word
echo.
echo.
echo.
echo.
echo      1 = SD (default if mmmconfig.txt does not exist)
echo      2 = USB
echo      3 = SMB
echo.
echo      N = None (MMM will prompt you for selection)
echo.
echo.
echo.
echo.
echo      B = Back
echo.
echo      M = Main Menu
echo.
echo.
echo.
echo.
set /p WMDEVICE=     Enter Selection Here: 


if /i "%WMDEVICE%" EQU "1" SET WMDEVICE=sd
if /i "%WMDEVICE%" EQU "2" SET WMDEVICE=usb
if /i "%WMDEVICE%" EQU "3" SET WMDEVICE=smb

if /i "%WMDEVICE%" EQU "sd" goto:MMMCONFIG3
if /i "%WMDEVICE%" EQU "usb" goto:MMMCONFIG3
if /i "%WMDEVICE%" EQU "smb" goto:MMMCONFIG3

if /i "%WMDEVICE%" EQU "N" goto:MMMCONFIG3

if /i "%WMDEVICE%" EQU "B" goto:MMMCONFIG
if /i "%WMDEVICE%" EQU "M" goto:MENU



echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:MMMCONFIG2



::...................................MMM CONFIGURATOR (mmmconfig.txt) page 3...............................
:MMMCONFIG3
set WMPATH=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      Enter the Start-up Path you would like to load initially.
echo.
echo          Note: If you don't have a startupPath, the default is /WAD
echo.
echo          Note: Be sure that the path exists, else you will get an error.
echo.
echo.
echo.
echo.
echo          Examples:
echo                   /WAD/Forwarders
echo                   /myWad
echo                   /
echo                      Note: '/' sets the StartupPath to the root of the device
echo.
echo.
echo      N = None (the default is /WAD)
echo.
echo.
echo.
echo      B = Back
echo.
echo      M = Main Menu
echo.
echo.
echo.
echo.
set /p WMPATH=     Enter Selection Here: 


if /i "%WMPATH%" EQU "N" SET WMPATH=/WAD
if /i "%WMPATH%" EQU "B" goto:MMMCONFIG2
if /i "%WMPATH%" EQU "M" goto:MENU

IF "%WMPATH%"=="" echo You Have Entered an Incorrect Key
IF "%WMPATH%"=="" @ping 127.0.0.1 -n 2 -w 1000> nul
IF "%WMPATH%"=="" goto:MMMCONFIG3

::...................................MMM CONFIGURATOR (mmmconfig.txt) page 4...............................
:MMMCONFIG4
set WMCONFIRM=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo                              Are these settings correct?
echo.
echo.
if /i "%WMCIOS%" EQU "N" echo      Do Not Auto-Reload IOS
if /i "%WMCIOS%" NEQ "N" echo      AutoLoadIOS=%WMCIOS%
echo.
if /i "%WMDEVICE%" EQU "N" echo      Prompt FAT Device Selection
echo.
if /i "%WMDEVICE%" NEQ "N" echo      FatDevice=%WMDEVICE%

echo      StartupPath=%WMPATH%
echo.
echo.
echo.
echo.
echo      Y = Yes, Create mmmconfig.txt with these settings
if exist "%Drive%"\mmmconfig.txt echo           Note: existing mmmconfig.txt will be overwritten
echo.
echo      N = No, take me back to the main menu
echo.
echo.
echo      B = Back
echo.
echo      M = Main Menu
echo.
echo.
echo.
echo.
set /p WMCONFIRM=     Enter Selection Here: 

if /i "%WMCONFIRM%" EQU "B" goto:MMMCONFIG3
if /i "%WMCONFIRM%" EQU "M" goto:MENU
if /i "%WMCONFIRM%" EQU "N" goto:MENU
if /i "%WMCONFIRM%" EQU "Y" goto:BUILDMMMCONFIG

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:MMMCONFIG4


:BUILDMMMCONFIG
if not exist "%Drive%" mkdir "%Drive%"
echo ;mmmconfig.txt made by ModMii> "%Drive%"\mmmconfig.txt
if /i "%WMCIOS%" NEQ "N" echo AutoLoadIOS=%WMCIOS%>> "%Drive%"\mmmconfig.txt
if /i "%WMDEVICE%" NEQ "N" echo FatDevice=%WMDEVICE%>> "%Drive%"\mmmconfig.txt
if /i "%WMDEVICE%" EQU "N" echo FatDevice=>> "%Drive%"\mmmconfig.txt

echo StartupPath=%WMPATH%>> "%Drive%"\mmmconfig.txt

start notepad "%Drive%\mmmconfig.txt"
goto:MENU











::........................................HACKMII SOLUTION.......................................
:HACKMIISOLUTION
set SETTINGSHM=



set BB1=
set BB2=
set SMASH=
set PWNS=
set BATHAXX=
set ROTJ=
set TOS=
set TWI=
set YUGI=


set IOS30P60=*
set IOS31=*
set IOS33=*
set IOS34=*
set IOS35=*
set IOS36v3608=*
set IOS58=*

set HM=*
set mmm=*
if /i "%FIRMSTART%" EQU "4.1" set BB1=*
if /i "%FIRMSTART%" EQU "4.0" set BB1=*
if /i "%FIRMSTART%" EQU "3.x" set BB1=*
if /i "%FIRMSTART%" EQU "4.2" set BB2=*

if /i "%EXPLOIT%" EQU "S" set SMASH=*
if /i "%EXPLOIT%" EQU "L" set PWNS=*
if /i "%EXPLOIT%" EQU "LB" set BATHAXX=*
if /i "%EXPLOIT%" EQU "LS" set ROTJ=*
if /i "%EXPLOIT%" EQU "TOS" set TOS=*
if /i "%EXPLOIT%" EQU "T" set TWI=*
if /i "%EXPLOIT%" EQU "Y" set YUGI=*
if /i "%EXPLOIT%" EQU "LB" set BATHAXX=*

if /i "%EXPLOIT%" NEQ "?" goto:notallexploits2
if /i "%FIRMSTART%" EQU "o" set Twi=*
set SMASH=*

if /i "%REGION%" NEQ "K" set PWNS=*
if /i "%REGION%" NEQ "K" set YUGI=*
if /i "%REGION%" NEQ "K" set BATHAXX=*
if /i "%REGION%" NEQ "K" set ROTJ=*
if /i "%REGION%" NEQ "K" set TOS=*
:notallexploits2

set BACKB4QUEUE=%backb4HACKMIISOLUTION%
goto:DOWNLOADQUEUE



::...................................Download...............................
:Download

cls
set cleardownloadsettings=yes
goto:clear

:DownloadSettings
set cleardownloadsettings=

set firmwarechange=yes
if /i "%FIRM%" EQU "%FIRMSTART%" set firmwarechange=no

if /i "%REGION%" EQU "U" goto:U
if /i "%REGION%" EQU "E" goto:E
if /i "%REGION%" EQU "J" goto:J
if /i "%REGION%" EQU "K" goto:K
if /i "%REGION%" EQU "RC" goto:REGIONCHANGEDKOREAN

:REGIONCHANGEDKOREAN
if /i "%FIRMSTART%" NEQ "4.3" set IOS80K=*
if /i "%FIRM%" EQU "4.3" set IOS80K=*
if /i "%FIRM%" EQU "4.2" set IOS70K=*
if /i "%REGIONCHANGE%" EQU "U" goto:U
if /i "%REGIONCHANGE%" EQU "E" goto:E
if /i "%REGIONCHANGE%" EQU "J" goto:J


:U
if /i "%firmwarechange%" EQU "no" goto:nofirmwarechange

if /i "%ThemeSelection%" NEQ "N" goto:skip
if /i "%FIRM%" EQU "4.3" set SM4.3U=*
if /i "%FIRM%" EQU "4.2" set SM4.2U=*
if /i "%FIRM%" EQU "4.1" set SM4.1U=*
:skip

if /i "%ThemeSelection%" NEQ "R" goto:SKIPredSM
if /i "%FIRM%" EQU "4.3" set SM4.3U-DWR=*
if /i "%FIRM%" EQU "4.2" set SM4.2U-DWR=*
if /i "%FIRM%" EQU "4.1" set SM4.1U-DWR=*
goto:SKIPSM
:SKIPredSM

if /i "%ThemeSelection%" NEQ "G" goto:SKIPgreenSM
if /i "%FIRM%" EQU "4.3" set SM4.3U-DWG=*
if /i "%FIRM%" EQU "4.2" set SM4.2U-DWG=*
if /i "%FIRM%" EQU "4.1" set SM4.1U-DWG=*
goto:SKIPSM
:SKIPgreenSM

:nofirmwarechange
if /i "%ThemeSelection%" NEQ "R" goto:SKIPredSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set DarkWii_Red_4.3U=*
if /i "%FIRM%" EQU "4.2" set DarkWii_Red_4.2U=*
if /i "%FIRM%" EQU "4.1" set DarkWii_Red_4.1U=*
:SKIPredSM

if /i "%ThemeSelection%" NEQ "G" goto:SKIPgreenSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set DarkWii_Green_4.3U=*
if /i "%FIRM%" EQU "4.2" set DarkWii_Green_4.2U=*
if /i "%FIRM%" EQU "4.1" set DarkWii_Green_4.1U=*
:SKIPgreenSM
:SKIPSM

if /i "%PIC%" EQU "Y" set P=*
if /i "%NET%" EQU "Y" set IU=*
if /i "%WEATHER%" EQU "Y" set WU=*
if /i "%NEWS%" EQU "Y" set NU=*
if /i "%SHOP%" EQU "Y" set S=*
if /i "%SPEAK%" EQU "Y" set WSU=*
goto:BUGGEDSMIOS



:E
if /i "%firmwarechange%" EQU "no" goto:nofirmwarechange

if /i "%ThemeSelection%" NEQ "N" goto:skip
if /i "%FIRM%" EQU "4.3" set SM4.3E=*
if /i "%FIRM%" EQU "4.2" set SM4.2E=*
if /i "%FIRM%" EQU "4.1" set SM4.1E=*
:skip

if /i "%ThemeSelection%" NEQ "R" goto:SKIPredSM
if /i "%FIRM%" EQU "4.3" set SM4.3E-DWR=*
if /i "%FIRM%" EQU "4.2" set SM4.2E-DWR=*
if /i "%FIRM%" EQU "4.1" set SM4.1E-DWR=*
goto:SKIPSM
:SKIPredSM

if /i "%ThemeSelection%" NEQ "G" goto:SKIPgreenSM
if /i "%FIRM%" EQU "4.3" set SM4.3E-DWG=*
if /i "%FIRM%" EQU "4.2" set SM4.2E-DWG=*
if /i "%FIRM%" EQU "4.1" set SM4.1E-DWG=*
goto:SKIPSM
:SKIPgreenSM

:nofirmwarechange
if /i "%ThemeSelection%" NEQ "R" goto:SKIPredSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set DarkWii_Red_4.3E=*
if /i "%FIRM%" EQU "4.2" set DarkWii_Red_4.2E=*
if /i "%FIRM%" EQU "4.1" set DarkWii_Red_4.1E=*
:SKIPredSM

if /i "%ThemeSelection%" NEQ "G" goto:SKIPgreenSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set DarkWii_Green_4.3E=*
if /i "%FIRM%" EQU "4.2" set DarkWii_Green_4.2E=*
if /i "%FIRM%" EQU "4.1" set DarkWii_Green_4.1E=*
:SKIPgreenSM
:SKIPSM

if /i "%PIC%" EQU "Y" set P=*
if /i "%NET%" EQU "Y" set IE=*
if /i "%WEATHER%" EQU "Y" set WE=*
if /i "%NEWS%" EQU "Y" set NE=*
if /i "%SHOP%" EQU "Y" set S=*
if /i "%SPEAK%" EQU "Y" set WSE=*
goto:BUGGEDSMIOS



:J
if /i "%firmwarechange%" EQU "no" goto:nofirmwarechange

if /i "%ThemeSelection%" NEQ "N" goto:skip
if /i "%FIRM%" EQU "4.3" set SM4.3J=*
if /i "%FIRM%" EQU "4.2" set SM4.2J=*
if /i "%FIRM%" EQU "4.1" set SM4.1J=*
:skip

if /i "%ThemeSelection%" NEQ "R" goto:SKIPredSM
if /i "%FIRM%" EQU "4.3" set SM4.3J-DWR=*
if /i "%FIRM%" EQU "4.2" set SM4.2J-DWR=*
if /i "%FIRM%" EQU "4.1" set SM4.1J-DWR=*
goto:SKIPSM
:SKIPredSM

if /i "%ThemeSelection%" NEQ "G" goto:SKIPgreenSM
if /i "%FIRM%" EQU "4.3" set SM4.3J-DWG=*
if /i "%FIRM%" EQU "4.2" set SM4.2J-DWG=*
if /i "%FIRM%" EQU "4.1" set SM4.1J-DWG=*
goto:SKIPSM
:SKIPgreenSM

:nofirmwarechange
if /i "%ThemeSelection%" NEQ "R" goto:SKIPredSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set DarkWii_Red_4.3J=*
if /i "%FIRM%" EQU "4.2" set DarkWii_Red_4.2J=*
if /i "%FIRM%" EQU "4.1" set DarkWii_Red_4.1J=*
:SKIPredSM

if /i "%ThemeSelection%" NEQ "G" goto:SKIPgreenSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set DarkWii_Green_4.3J=*
if /i "%FIRM%" EQU "4.2" set DarkWii_Green_4.2J=*
if /i "%FIRM%" EQU "4.1" set DarkWii_Green_4.1J=*
:SKIPgreenSM
:SKIPSM

if /i "%PIC%" EQU "Y" set P=*
if /i "%NET%" EQU "Y" set IJ=*
if /i "%WEATHER%" EQU "Y" set WJ=*
if /i "%NEWS%" EQU "Y" set NJ=*
if /i "%SHOP%" EQU "Y" set S=*
if /i "%SPEAK%" EQU "Y" set WSJ=*
goto:BUGGEDSMIOS



:K
if /i "%firmwarechange%" EQU "no" goto:nofirmwarechange

if /i "%ThemeSelection%" NEQ "N" goto:skip
if /i "%FIRM%" EQU "4.3" set SM4.3K=*
if /i "%FIRM%" EQU "4.2" set SM4.2K=*
if /i "%FIRM%" EQU "4.1" set SM4.1K=*
:skip

if /i "%ThemeSelection%" NEQ "R" goto:SKIPredSM
if /i "%FIRM%" EQU "4.3" set SM4.3K-DWR=*
if /i "%FIRM%" EQU "4.2" set SM4.2K-DWR=*
if /i "%FIRM%" EQU "4.1" set SM4.1K-DWR=*
goto:SKIPSM
:SKIPredSM

if /i "%ThemeSelection%" NEQ "G" goto:SKIPgreenSM
if /i "%FIRM%" EQU "4.3" set SM4.3K-DWG=*
if /i "%FIRM%" EQU "4.2" set SM4.2K-DWG=*
if /i "%FIRM%" EQU "4.1" set SM4.1K-DWG=*
goto:SKIPSM
:SKIPgreenSM

:nofirmwarechange
if /i "%ThemeSelection%" NEQ "R" goto:SKIPredSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set DarkWii_Red_4.3K=*
if /i "%FIRM%" EQU "4.2" set DarkWii_Red_4.2K=*
if /i "%FIRM%" EQU "4.1" set DarkWii_Red_4.1K=*
:SKIPredSM

if /i "%ThemeSelection%" NEQ "G" goto:SKIPgreenSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set DarkWii_Green_4.3K=*
if /i "%FIRM%" EQU "4.2" set DarkWii_Green_4.2K=*
if /i "%FIRM%" EQU "4.1" set DarkWii_Green_4.1K=*
:SKIPgreenSM
:SKIPSM

if /i "%PIC%" EQU "Y" set PK=*
if /i "%SHOP%" EQU "Y" set SK=*





:BUGGEDSMIOS
if /i "%FIRM%" EQU "3.2" set IOS30P60=*
if /i "%FIRM%" EQU "4.1" set IOS60P=*
if /i "%REGION%" EQU "RC" goto:COMMONSETTINGS
if /i "%FIRM%" EQU "4.2" set IOS70P=*
if /i "%FIRM%" EQU "4.3" set IOS80P=*

:COMMONSETTINGS
if /i "%SHOP%" EQU "Y" set IOS56=*

if /i "%ACTIVEIOS%" EQU "off" goto:skipactiveios
if /i "%UpdatesIOSQ%" EQU "N" goto:skipactiveios
::if /i "%FIRMSTART%" EQU "4.3" goto:skipactiveios


:ACTIVEIOS
set M10=*
set IOS9=*
set IOS12=*
set IOS13=*
set IOS14=*
set IOS15=*
set IOS17=*
set IOS21=*
set IOS22=*
set IOS28=*
set IOS31=*
set IOS33=*
set IOS34=*
set IOS35=*
if /i "%OPTION36%" EQU "on" set IOS36v3608=*
set IOS37=*
set IOS38=*
set ios41=*
set ios43=*
set ios45=*
set ios46=*
set IOS48v4124=*
set IOS53=*
set IOS55=*
set IOS56=*
set IOS57=*
set IOS58=*
set IOS61=*
:skipactiveios

if /i "%MIIQ%" EQU "Y" set Mii=*



if /i "%protect%" NEQ "Y" goto:NoExtraProtection
set IOS11P60=*
set IOS20P60=*
set IOS30P60=*
if /i "%REGION%" EQU "K" set IOS40P60=*
set IOS50P=*
if /i "%REGION%" EQU "K" set IOS52P=*
set IOS60P=*
if /i "%REGION%" NEQ "RC" set IOS70P=*
if /i "%REGION%" EQU "RC" set IOS70K=*
set usbx=*
::--Note: IOS80v16174(IOS60v6174[FS-ES-NP]) will be downloaded for regionchanged korean wii's even with No Extra Brick Protection
:NoExtraProtection


if /i "%USBGUIDE%" NEQ "Y" goto:NoUSBSETUP
if /i "%LOADER%" EQU "CFG" set usbfolder=*
if /i "%LOADER%" EQU "ALL" set usbfolder=*
if /i "%LOADER%" EQU "FLOW" set FLOW=*
if /i "%LOADER%" EQU "ALL" set FLOW=*
set wbm=*
if /i "%FORMAT%" EQU "1" set f32=*
if /i "%FORMAT%" EQU "3" set f32=*
:NoUSBSETUP



if /i "%VIRGIN%" NEQ "Y" goto:notvirgin
:virgin
set HM=*
set IOS58=*
if /i "%FIRMSTART%" EQU "4.1" set BB1=*
if /i "%FIRMSTART%" EQU "4.0" set BB1=*
if /i "%FIRMSTART%" EQU "3.2" set BB1=*
if /i "%FIRMSTART%" EQU "3.x" set BB1=*
if /i "%FIRMSTART%" EQU "4.2" set BB2=*
if /i "%EXPLOIT%" EQU "S" set SMASH=*
if /i "%EXPLOIT%" EQU "L" set PWNS=*
if /i "%EXPLOIT%" EQU "T" set Twi=*
if /i "%EXPLOIT%" EQU "Y" set YUGI=*
if /i "%EXPLOIT%" EQU "LB" set BATHAXX=*
if /i "%EXPLOIT%" EQU "LS" set ROTJ=*
if /i "%EXPLOIT%" EQU "TOS" set TOS=*
if /i "%EXPLOIT%" NEQ "?" goto:notallexploits
if /i "%FIRMSTART%" EQU "o" set Twi=*
set SMASH=*
if /i "%REGION%" NEQ "K" set PWNS=*
if /i "%REGION%" NEQ "K" set YUGI=*
if /i "%REGION%" NEQ "K" set BATHAXX=*
if /i "%REGION%" NEQ "K" set ROTJ=*
if /i "%REGION%" NEQ "K" set TOS=*
:notallexploits

::set Y4M=*
::set IOS236=*
set IOS236Installer=*
set SIP=*
set IOS36=*

set cIOS202[57]-v5=*
set cIOS222[38]-v5=*
set cIOS223[37-38]-v4=*
set cIOS224[57]-v5=*
set cIOS249[56]-d2x-v6=*
set cIOS250[57]-d2x-v6=*



if /i "%CMIOSOPTION%" EQU "on" set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=*
if /i "%CMIOSOPTION%" EQU "on" set M10=
set pri=*
::set HAX=*
set mmm=*

goto:DOWNLOADQUEUE



:notvirgin

set mmm=*
::set Y4M=*



if /i "%HMInstaller%" NEQ "Y" goto:noHMInstallerforNonVirgin
set HM=*
set IOS58=*
if /i "%FIRMSTART%" EQU "4.1" set BB1=*
if /i "%FIRMSTART%" EQU "4.0" set BB1=*
if /i "%FIRMSTART%" EQU "3.x" set BB1=*
if /i "%FIRMSTART%" EQU "3.2" set BB1=*
if /i "%FIRMSTART%" EQU "4.2" set BB2=*

if /i "%FIRMSTART%" EQU "o" goto:gonow
if /i "%FIRMSTART%" EQU "4.3" goto:gonow
goto:skipextra2

:gonow
if /i "%FIRMSTART%" EQU "o" set TWI=*
set SMASH=*
if /i "%REGION%" NEQ "K" set PWNS=*
if /i "%REGION%" NEQ "K" set YUGI=*
if /i "%REGION%" NEQ "K" set BATHAXX=*
if /i "%REGION%" NEQ "K" set ROTJ=*
if /i "%REGION%" NEQ "K" set TOS=*
:skipextra2

:noHMInstallerforNonVirgin

if /i "%IOS236InstallerQ%" EQU "Y" set SIP=*
if /i "%IOS236InstallerQ%" EQU "Y" set IOS36=*
if /i "%IOS236InstallerQ%" EQU "Y" set IOS236Installer=*

if /i "%RECCIOS%" EQU "Y" set cIOS202[57]-v5=*
if /i "%RECCIOS%" EQU "Y" set cIOS222[38]-v5=*
if /i "%RECCIOS%" EQU "Y" set cIOS223[37-38]-v4=*
if /i "%RECCIOS%" EQU "Y" set cIOS224[57]-v5=*
if /i "%RECCIOS%" EQU "Y" set cIOS249[56]-d2x-v6=*
if /i "%RECCIOS%" EQU "Y" set cIOS250[57]-d2x-v6=*

if /i "%CMIOSOPTION%" EQU "off" goto:quickskip
if /i "%RECCIOS%" EQU "Y" set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=*
if /i "%RECCIOS%" EQU "Y" set M10=
:quickskip

if /i "%yawmQ%" EQU "Y" set YAWM=*


if /i "%PRIQ%" NEQ "Y" goto:DOWNLOADQUEUE
set pri=*
::set HAX=*
set mmm=*
::set IOS236=*
goto:DOWNLOADQUEUE




::...................................Download Queue...............................
:DOWNLOADQUEUE
set settings=

set d2x-beta-rev=6
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat

::--------------
::d2x check for changed DL names and md5's for Advanced downloads only
if /i "%MENU1%" NEQ "L" goto:DLCOUNT
if not exist temp\DLnamesADV.txt goto:DLCOUNT
findStr "d2x" temp\DLnamesADV.txt >nul
IF ERRORLEVEL 1 goto:DLCOUNT

FINDSTR /N . temp\DLnamesADV.txt>temp\DLnamesADVcheck.txt
sfk filter -quiet temp\DLnamesADVcheck.txt -+d2x -rep _cIOS*[_cIOS249[_ -rep _"Advanced Download: "__ -write -yes

set loadorgo=load4queue

::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\DLnamesADVcheck.txt) do call :processDLCheck %%A
goto:quickskip
:processDLCheck

set advDLCheck=%*

echo set advDLcheckNUM=%advDLCheck%>temp\advDLcheckNUM.bat
sfk filter -quiet temp\advDLcheckNUM.bat -rep _:*__ -write -yes
call temp\advDLcheckNUM.bat
del temp\advDLcheckNUM.bat>nul

echo %advDLCheck%>temp\advDLcheck.bat
sfk filter -quiet temp\advDLcheck.bat -rep _"%advDLcheckNUM%:"_"set advDLcheck="_ -write -yes
call temp\advDLcheck.bat
del temp\advDLcheck.bat>nul


call temp\AdvDL%advDLcheckNUM%.bat
set oldfullname=%name%

set advDLCheck0=%advDLCheck%

set d2x-beta-rev=6
set advDLCheck=%advDLCheck:~0,17%%d2x-beta-rev%
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat

set string=%d2x-beta-rev%
set d2xVersionLength=0

:loopd2xVersionLength
if defined string (
    set string=%string:~1%
    set /A d2xVersionLength += 1
    goto:loopd2xVersionLength
    )

echo set alt-d2x-beta-rev=@advDLcheck0:~17,%d2xVersionLength%@>temp\d2x-beta-rev.bat
sfk filter temp\d2x-beta-rev.bat -spat -rep _@_%%_ -write -yes>nul
call temp\d2x-beta-rev.bat
del temp\d2x-beta-rev.bat>nul

if /i "%d2x-beta-rev%" EQU "%alt-d2x-beta-rev%" goto:EOF

goto:%advDLCheck%


:processDLCheck2

set slotnum=%slotcode:~7%
if "%slotnum%"=="" set slotnum=249
set newname=cIOS%slotnum%%basecios:~7,10%%d2x-beta-rev%

::update temp\AdvDL#.bat
sfk filter -quiet temp\AdvDL%advDLcheckNUM%.bat -rep _"set MD5="*_"set MD5=%MD5%"_ -rep _"set md5alt="*_"set md5alt=%md5alt%"_ -rep _"set ciosversion="*_"set ciosversion=%ciosversion%"_ -rep _"Advanced Download: "*_"Advanced Download: %newname%%versionname%"_ -rep _"set wadname="*_"set wadname=%wadname%"_ -rep _"set wadnameless="*_"set wadnameless=%newname%"_ -write -yes

::update temp\DLnamesADV.txt
sfk filter -quiet temp\DLnamesADV.txt -lerep _"%oldfullname% "_"Advanced Download: %newname%%versionname%"_ -write -yes
goto:EOF
:quickskip

if exist temp\DLnamesADVcheck.txt del temp\DLnamesADVcheck.txt>nul
set loadorgo=go
::---------------------


::Count how many downloads there are!
:DLCOUNT

if exist temp\DLnames.txt del temp\DLnames.txt>nul
if exist temp\DLgotos.txt del temp\DLgotos.txt>nul



if /i "%EULAU%" EQU "*" (echo "EULA v3 (USA)">>temp\DLnames.txt) & (echo "EULAU">>temp\DLgotos.txt)
if /i "%EULAE%" EQU "*" (echo "EULA v3 (PAL)">>temp\DLnames.txt) & (echo "EULAE">>temp\DLgotos.txt)
if /i "%EULAJ%" EQU "*" (echo "EULA v3 (JAP)">>temp\DLnames.txt) & (echo "EULAJ">>temp\DLgotos.txt)
if /i "%EULAK%" EQU "*" (echo "EULA v3 (KOR)">>temp\DLnames.txt) & (echo "EULAK">>temp\DLgotos.txt)
if /i "%RSU%" EQU "*" (echo "Region Select v3 (USA)">>temp\DLnames.txt) & (echo "RSU">>temp\DLgotos.txt)
if /i "%RSE%" EQU "*" (echo "Region Select v3 (PAL)">>temp\DLnames.txt) & (echo "RSE">>temp\DLgotos.txt)
if /i "%RSJ%" EQU "*" (echo "Region Select v3 (JAP)">>temp\DLnames.txt) & (echo "RSJ">>temp\DLgotos.txt)
if /i "%RSK%" EQU "*" (echo "Region Select v3 (KOR)">>temp\DLnames.txt) & (echo "RSK">>temp\DLgotos.txt)
if /i "%BC%" EQU "*" (echo "BC">>temp\DLnames.txt) & (echo "BC">>temp\DLgotos.txt)

if /i "%SM3.2U%" EQU "*" (echo "System Menu 3.2U">>temp\DLnames.txt) & (echo "SM3.2U">>temp\DLgotos.txt)
if /i "%SM4.1U%" EQU "*" (echo "System Menu 4.1U">>temp\DLnames.txt) & (echo "SM4.1U">>temp\DLgotos.txt)
if /i "%SM4.2U%" EQU "*" (echo "System Menu 4.2U">>temp\DLnames.txt) & (echo "SM4.2U">>temp\DLgotos.txt)
if /i "%SM4.3U%" EQU "*" (echo "System Menu 4.3U">>temp\DLnames.txt) & (echo "SM4.3U">>temp\DLgotos.txt)
if /i "%SM3.2E%" EQU "*" (echo "System Menu 3.2E">>temp\DLnames.txt) & (echo "SM3.2E">>temp\DLgotos.txt)
if /i "%SM4.1E%" EQU "*" (echo "System Menu 4.1E">>temp\DLnames.txt) & (echo "SM4.1E">>temp\DLgotos.txt)
if /i "%SM4.2E%" EQU "*" (echo "System Menu 4.2E">>temp\DLnames.txt) & (echo "SM4.2E">>temp\DLgotos.txt)
if /i "%SM4.3E%" EQU "*" (echo "System Menu 4.3E">>temp\DLnames.txt) & (echo "SM4.3E">>temp\DLgotos.txt)
if /i "%SM3.2J%" EQU "*" (echo "System Menu 3.2J">>temp\DLnames.txt) & (echo "SM3.2J">>temp\DLgotos.txt)
if /i "%SM4.1J%" EQU "*" (echo "System Menu 4.1J">>temp\DLnames.txt) & (echo "SM4.1J">>temp\DLgotos.txt)
if /i "%SM4.2J%" EQU "*" (echo "System Menu 4.2J">>temp\DLnames.txt) & (echo "SM4.2J">>temp\DLgotos.txt)
if /i "%SM4.3J%" EQU "*" (echo "System Menu 4.3J">>temp\DLnames.txt) & (echo "SM4.3J">>temp\DLgotos.txt)
if /i "%SM4.1K%" EQU "*" (echo "System Menu 4.1K">>temp\DLnames.txt) & (echo "SM4.1K">>temp\DLgotos.txt)
if /i "%SM4.2K%" EQU "*" (echo "System Menu 4.2K">>temp\DLnames.txt) & (echo "SM4.2K">>temp\DLgotos.txt)
if /i "%SM4.3K%" EQU "*" (echo "System Menu 4.3K">>temp\DLnames.txt) & (echo "SM4.3K">>temp\DLgotos.txt)

if /i "%SM4.1U-DWR%" EQU "*" (echo "System Menu 4.1U with Dark Wii Red Theme">>temp\DLnames.txt) & (echo "SM4.1U-DWR">>temp\DLgotos.txt)
if /i "%SM4.2U-DWR%" EQU "*" (echo "System Menu 4.2U with Dark Wii Red Theme">>temp\DLnames.txt) & (echo "SM4.2U-DWR">>temp\DLgotos.txt)
if /i "%SM4.3U-DWR%" EQU "*" (echo "System Menu 4.3U with Dark Wii Red Theme">>temp\DLnames.txt) & (echo "SM4.3U-DWR">>temp\DLgotos.txt)
if /i "%SM4.1E-DWR%" EQU "*" (echo "System Menu 4.1E with Dark Wii Red Theme">>temp\DLnames.txt) & (echo "SM4.1E-DWR">>temp\DLgotos.txt)
if /i "%SM4.2E-DWR%" EQU "*" (echo "System Menu 4.2E with Dark Wii Red Theme">>temp\DLnames.txt) & (echo "SM4.2E-DWR">>temp\DLgotos.txt)
if /i "%SM4.3E-DWR%" EQU "*" (echo "System Menu 4.3E with Dark Wii Red Theme">>temp\DLnames.txt) & (echo "SM4.3E-DWR">>temp\DLgotos.txt)
if /i "%SM4.1J-DWR%" EQU "*" (echo "System Menu 4.1J with Dark Wii Red Theme">>temp\DLnames.txt) & (echo "SM4.1J-DWR">>temp\DLgotos.txt)
if /i "%SM4.2J-DWR%" EQU "*" (echo "System Menu 4.2J with Dark Wii Red Theme">>temp\DLnames.txt) & (echo "SM4.2J-DWR">>temp\DLgotos.txt)
if /i "%SM4.3J-DWR%" EQU "*" (echo "System Menu 4.3J with Dark Wii Red Theme">>temp\DLnames.txt) & (echo "SM4.3J-DWR">>temp\DLgotos.txt)
if /i "%SM4.1K-DWR%" EQU "*" (echo "System Menu 4.1K with Dark Wii Red Theme">>temp\DLnames.txt) & (echo "SM4.1K-DWR">>temp\DLgotos.txt)
if /i "%SM4.2K-DWR%" EQU "*" (echo "System Menu 4.2K with Dark Wii Red Theme">>temp\DLnames.txt) & (echo "SM4.2K-DWR">>temp\DLgotos.txt)
if /i "%SM4.3K-DWR%" EQU "*" (echo "System Menu 4.3K with Dark Wii Red Theme">>temp\DLnames.txt) & (echo "SM4.3K-DWR">>temp\DLgotos.txt)

if /i "%SM4.1U-DWG%" EQU "*" (echo "System Menu 4.1U with Dark Wii Green Theme">>temp\DLnames.txt) & (echo "SM4.1U-DWG">>temp\DLgotos.txt)
if /i "%SM4.2U-DWG%" EQU "*" (echo "System Menu 4.2U with Dark Wii Green Theme">>temp\DLnames.txt) & (echo "SM4.2U-DWG">>temp\DLgotos.txt)
if /i "%SM4.3U-DWG%" EQU "*" (echo "System Menu 4.3U with Dark Wii Green Theme">>temp\DLnames.txt) & (echo "SM4.3U-DWG">>temp\DLgotos.txt)
if /i "%SM4.1E-DWG%" EQU "*" (echo "System Menu 4.1E with Dark Wii Green Theme">>temp\DLnames.txt) & (echo "SM4.1E-DWG">>temp\DLgotos.txt)
if /i "%SM4.2E-DWG%" EQU "*" (echo "System Menu 4.2E with Dark Wii Green Theme">>temp\DLnames.txt) & (echo "SM4.2E-DWG">>temp\DLgotos.txt)
if /i "%SM4.3E-DWG%" EQU "*" (echo "System Menu 4.3E with Dark Wii Green Theme">>temp\DLnames.txt) & (echo "SM4.3E-DWG">>temp\DLgotos.txt)
if /i "%SM4.1J-DWG%" EQU "*" (echo "System Menu 4.1J with Dark Wii Green Theme">>temp\DLnames.txt) & (echo "SM4.1J-DWG">>temp\DLgotos.txt)
if /i "%SM4.2J-DWG%" EQU "*" (echo "System Menu 4.2J with Dark Wii Green Theme">>temp\DLnames.txt) & (echo "SM4.2J-DWG">>temp\DLgotos.txt)
if /i "%SM4.3J-DWG%" EQU "*" (echo "System Menu 4.3J with Dark Wii Green Theme">>temp\DLnames.txt) & (echo "SM4.3J-DWG">>temp\DLgotos.txt)
if /i "%SM4.1K-DWG%" EQU "*" (echo "System Menu 4.1K with Dark Wii Green Theme">>temp\DLnames.txt) & (echo "SM4.1K-DWG">>temp\DLgotos.txt)
if /i "%SM4.2K-DWG%" EQU "*" (echo "System Menu 4.2K with Dark Wii Green Theme">>temp\DLnames.txt) & (echo "SM4.2K-DWG">>temp\DLgotos.txt)
if /i "%SM4.3K-DWG%" EQU "*" (echo "System Menu 4.3K with Dark Wii Green Theme">>temp\DLnames.txt) & (echo "SM4.3K-DWG">>temp\DLgotos.txt)

if /i "%DarkWii_Red_4.1U%" EQU "*" (echo "DarkWii Red Theme (4.1U)">>temp\DLnames.txt) & (echo "DarkWii_Red_4.1U">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.2U%" EQU "*" (echo "DarkWii Red Theme (4.2U)">>temp\DLnames.txt) & (echo "DarkWii_Red_4.2U">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.3U%" EQU "*" (echo "DarkWii Red Theme (4.3U)">>temp\DLnames.txt) & (echo "DarkWii_Red_4.3U">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.1E%" EQU "*" (echo "DarkWii Red Theme (4.1E)">>temp\DLnames.txt) & (echo "DarkWii_Red_4.1E">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.2E%" EQU "*" (echo "DarkWii Red Theme (4.2E)">>temp\DLnames.txt) & (echo "DarkWii_Red_4.2E">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.3E%" EQU "*" (echo "DarkWii Red Theme (4.3E)">>temp\DLnames.txt) & (echo "DarkWii_Red_4.3E">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.1J%" EQU "*" (echo "DarkWii Red Theme (4.1J)">>temp\DLnames.txt) & (echo "DarkWii_Red_4.1J">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.2J%" EQU "*" (echo "DarkWii Red Theme (4.2J)">>temp\DLnames.txt) & (echo "DarkWii_Red_4.2J">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.3J%" EQU "*" (echo "DarkWii Red Theme (4.3J)">>temp\DLnames.txt) & (echo "DarkWii_Red_4.3J">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.1K%" EQU "*" (echo "DarkWii Red Theme (4.1K)">>temp\DLnames.txt) & (echo "DarkWii_Red_4.1K">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.2K%" EQU "*" (echo "DarkWii Red Theme (4.2K)">>temp\DLnames.txt) & (echo "DarkWii_Red_4.2K">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.3K%" EQU "*" (echo "DarkWii Red Theme (4.3K)">>temp\DLnames.txt) & (echo "DarkWii_Red_4.3K">>temp\DLgotos.txt)

if /i "%DarkWii_Green_4.1U%" EQU "*" (echo "DarkWii Green Theme (4.1U)">>temp\DLnames.txt) & (echo "DarkWii_Green_4.1U">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.2U%" EQU "*" (echo "DarkWii Green Theme (4.2U)">>temp\DLnames.txt) & (echo "DarkWii_Green_4.2U">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.3U%" EQU "*" (echo "DarkWii Green Theme (4.3U)">>temp\DLnames.txt) & (echo "DarkWii_Green_4.3U">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.1E%" EQU "*" (echo "DarkWii Green Theme (4.1E)">>temp\DLnames.txt) & (echo "DarkWii_Green_4.1E">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.2E%" EQU "*" (echo "DarkWii Green Theme (4.2E)">>temp\DLnames.txt) & (echo "DarkWii_Green_4.2E">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.3E%" EQU "*" (echo "DarkWii Green Theme (4.3E)">>temp\DLnames.txt) & (echo "DarkWii_Green_4.3E">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.1J%" EQU "*" (echo "DarkWii Green Theme (4.1J)">>temp\DLnames.txt) & (echo "DarkWii_Green_4.1J">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.2J%" EQU "*" (echo "DarkWii Green Theme (4.2J)">>temp\DLnames.txt) & (echo "DarkWii_Green_4.2J">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.3J%" EQU "*" (echo "DarkWii Green Theme (4.3J)">>temp\DLnames.txt) & (echo "DarkWii_Green_4.3J">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.1K%" EQU "*" (echo "DarkWii Green Theme (4.1K)">>temp\DLnames.txt) & (echo "DarkWii_Green_4.1K">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.2K%" EQU "*" (echo "DarkWii Green Theme (4.2K)">>temp\DLnames.txt) & (echo "DarkWii_Green_4.2K">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.3K%" EQU "*" (echo "DarkWii Green Theme (4.3K)">>temp\DLnames.txt) & (echo "DarkWii_Green_4.3K">>temp\DLgotos.txt)

if /i "%IOS30%" EQU "*" (echo "IOS30v2576">>temp\DLnames.txt) & (echo "IOS30">>temp\DLgotos.txt)
if /i "%IOS30P60%" EQU "*" (echo "IOS30v16174(IOS60v6174[FS-ES-NP])">>temp\DLnames.txt) & (echo "IOS30P60">>temp\DLgotos.txt)
if /i "%IOS40P60%" EQU "*" (echo "IOS40v16174(IOS60v6174[FS-ES-NP])">>temp\DLnames.txt) & (echo "IOS40P60">>temp\DLgotos.txt)
if /i "%IOS30P%" EQU "*" (echo "IOS30v12576(IOS30v2576[FS-ES-NP])">>temp\DLnames.txt) & (echo "IOS30P">>temp\DLgotos.txt)
if /i "%IOS11P60%" EQU "*" (echo "IOS11v16174(IOS60v6174[FS-ES-NP])">>temp\DLnames.txt) & (echo "IOS11P60">>temp\DLgotos.txt)
if /i "%IOS20P60%" EQU "*" (echo "IOS20v16174(IOS60v6174[FS-ES-NP])">>temp\DLnames.txt) & (echo "IOS20P60">>temp\DLgotos.txt)
if /i "%IOS50P%" EQU "*" (echo "IOS50v14889(IOS50v4889[FS-ES-NP])">>temp\DLnames.txt) & (echo "IOS50P">>temp\DLgotos.txt)
if /i "%IOS52P%" EQU "*" (echo "IOS52v15661(IOS52v5661[FS-ES-NP])">>temp\DLnames.txt) & (echo "IOS52P">>temp\DLgotos.txt)
if /i "%IOS60%" EQU "*" (echo "IOS60v6174">>temp\DLnames.txt) & (echo "IOS60">>temp\DLgotos.txt)
if /i "%IOS60P%" EQU "*" (echo "IOS60v6174[FS-ES-NP]">>temp\DLnames.txt) & (echo "IOS60P">>temp\DLgotos.txt)
if /i "%IOS70%" EQU "*" (echo "IOS70v6687">>temp\DLnames.txt) & (echo "IOS70">>temp\DLgotos.txt)
if /i "%IOS70P%" EQU "*" (echo "IOS70v16687(IOS70v6687[FS-ES-NP])">>temp\DLnames.txt) & (echo "IOS70P">>temp\DLgotos.txt)
if /i "%IOS70K%" EQU "*" (echo "IOS70v16174(IOS60v6174[FS-ES-NP])">>temp\DLnames.txt) & (echo "IOS70K">>temp\DLgotos.txt)
if /i "%IOS80K%" EQU "*" (echo "IOS80v16174(IOS60v6174[FS-ES-NP])">>temp\DLnames.txt) & (echo "IOS80K">>temp\DLgotos.txt)
if /i "%IOS80%" EQU "*" (echo "IOS80v6944">>temp\DLnames.txt) & (echo "IOS80">>temp\DLgotos.txt)
if /i "%IOS80P%" EQU "*" (echo "IOS80v6944[FS-ES-NP]">>temp\DLnames.txt) & (echo "IOS80P">>temp\DLgotos.txt)

if /i "%mmm%" EQU "*" (echo "Multi-Mod Manager (MMM) v13.4">>temp\DLnames.txt) & (echo "mmm">>temp\DLgotos.txt)
if /i "%yawm%" EQU "*" (echo "Yet Another Wad Manager Mod">>temp\DLnames.txt) & (echo "yawm">>temp\DLgotos.txt)
if /i "%Y4M%" EQU "*" (echo "YAWMM 4 ModMii">>temp\DLnames.txt) & (echo "Y4M">>temp\DLgotos.txt)
if /i "%dop%" EQU "*" (echo "Dop-Mii v13">>temp\DLnames.txt) & (echo "dopmii">>temp\DLgotos.txt)

if /i "%HM%" EQU "*" (echo "HackMii Installer">>temp\DLnames.txt) & (echo "HackmiiInstaller">>temp\DLgotos.txt)
if /i "%bootmiisd%" EQU "*" (echo "BootMii SD Files">>temp\DLnames.txt) & (echo "bootmiisd">>temp\DLgotos.txt)
if /i "%BB1%" EQU "*" (echo "Bannerbomb v1">>temp\DLnames.txt) & (echo "BannerBomb1">>temp\DLgotos.txt)
if /i "%BB2%" EQU "*" (echo "Bannerbomb v2">>temp\DLnames.txt) & (echo "BannerBomb2">>temp\DLgotos.txt)
if /i "%smash%" EQU "*" (echo "Smash Stack (USA, PAL, JAP and KOR)">>temp\DLnames.txt) & (echo "smash">>temp\DLgotos.txt)
if /i "%pwns%" EQU "*" (echo "Indiana Pwns">>temp\DLnames.txt) & (echo "pwns">>temp\DLgotos.txt)
if /i "%BATHAXX%" EQU "*" (echo "BATHAXX (USA, PAL and JAP)">>temp\DLnames.txt) & (echo "BATHAXX">>temp\DLgotos.txt)
if /i "%ROTJ%" EQU "*" (echo "Return of the JODI (USA, PAL and JAP)">>temp\DLnames.txt) & (echo "ROTJ">>temp\DLgotos.txt)
if /i "%TOS%" EQU "*" (echo "Eri HaKawai (USA, PAL and JAP)">>temp\DLnames.txt) & (echo "TOS">>temp\DLgotos.txt)
if /i "%YUGI%" EQU "*" (echo "YU-GI-OWNED (USA, PAL and JAP)">>temp\DLnames.txt) & (echo "YUGI">>temp\DLgotos.txt)
if /i "%Twi%" EQU "*" (echo "Twilight Hack v0.1 Beta1 (for Wii's 3.3 and below)">>temp\DLnames.txt) & (echo "Twi">>temp\DLgotos.txt)

if /i "%IOS236Installer%" EQU "*" (echo "IOS236 Installer v5 Mod">>temp\DLnames.txt) & (echo "IOS236Installer">>temp\DLgotos.txt)
if /i "%SIP%" EQU "*" (echo "Simple IOS Patcher v1.12">>temp\DLnames.txt) & (echo "SIP">>temp\DLgotos.txt)
if /i "%Pri%" EQU "*" (echo "Priiloader v0.7 (236 Mod)">>temp\DLnames.txt) & (echo "Priiloader">>temp\DLgotos.txt)
if /i "%HAX%" EQU "*" (echo "Priiloader Hacks">>temp\DLnames.txt) & (echo "PriiHacks">>temp\DLgotos.txt)
if /i "%MyM%" EQU "*" (echo "MyMenuify">>temp\DLnames.txt) & (echo "Mym">>temp\DLgotos.txt)



if /i "%PCSAVE%" EQU "Local" goto:local
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" EQU "%ModMiipath:~0,2%" goto:local
:skip
if /i "%f32%" EQU "*" (echo "FAT32 GUI Formatter">>temp\DLnames.txt) & (echo "F32">>temp\DLgotos.txt)
if /i "%wbm%" EQU "*" (echo "Wii Backup Manager v0.3.8 build60">>temp\DLnames.txt) & (echo "WBM">>temp\DLgotos.txt)
goto:skiplocal
:local

if /i "%f32%" EQU "*" (echo "FAT32 GUI Formatter (saved with shortcuts to %homedrive%\ModMii\Program Files)">>temp\DLnames.txt) & (echo "F32">>temp\DLgotos.txt)
if /i "%wbm%" EQU "*" (echo "Wii Backup Manager v0.3.8 build60 (saved with shortcuts to %homedrive%\ModMii\Program Files)">>temp\DLnames.txt) & (echo "WBM">>temp\DLgotos.txt)
:skiplocal



if /i "%usbfolder%" EQU "*" (echo "Configurable USB-Loader (Most recent Full 249 version)">>temp\DLnames.txt) & (echo "usbfolder">>temp\DLgotos.txt)
if /i "%cfg249%" EQU "*" (echo "Configurable USB Loader (Most recent 249 version)">>temp\DLnames.txt) & (echo "cfg249">>temp\DLgotos.txt)
if /i "%cfg222%" EQU "*" (echo "Configurable USB Loader (Most recent 222 version)">>temp\DLnames.txt) & (echo "cfg222">>temp\DLgotos.txt)
if /i "%cfgr%" EQU "*" (echo "Configurator for Configurable USB Loader (Most recent version)">>temp\DLnames.txt) & (echo "cfgr">>temp\DLgotos.txt)
if /i "%FLOW%" EQU "*" (echo "WiiFlow r304-249">>temp\DLnames.txt) & (echo "FLOW">>temp\DLgotos.txt)
if /i "%neogamma%" EQU "*" (echo "Neogamma Backup Disc Loader (most recent release)">>temp\DLnames.txt) & (echo "neogamma">>temp\DLgotos.txt)
if /i "%AccioHacks%" EQU "*" (echo "Accio Hacks">>temp\DLnames.txt) & (echo "AccioHacks">>temp\DLgotos.txt)
if /i "%CheatCodes%" EQU "*" (echo "%cheatregion% Region Cheat Codes: txtcodes from geckocodes.org">>temp\DLnames.txt) & (echo "CheatCodes">>temp\DLgotos.txt)
if /i "%USBX%" EQU "*" (echo "USB-Loader Forwarder Channel v9">>temp\DLnames.txt) & (echo "USBX">>temp\DLgotos.txt)

if /i "%JOY%" EQU "*" (echo "JoyFlow">>temp\DLnames.txt) & (echo "JOY">>temp\DLgotos.txt)
if /i "%JOYF%" EQU "*" (echo "Joy Flow Forwarder Channel\dol">>temp\DLnames.txt) & (echo "JOYF">>temp\DLgotos.txt)
if /i "%HBF%" EQU "*" (echo "Homebrew Filter r32">>temp\DLnames.txt) & (echo "HBF">>temp\DLgotos.txt)
if /i "%S2U%" EQU "*" (echo "Switch2Uneek">>temp\DLnames.txt) & (echo "S2U">>temp\DLgotos.txt)

if /i "%WiiMC%" EQU "*" (echo "WiiMC - Media Player (Most Recent Release)">>temp\DLnames.txt) & (echo "WIIMC">>temp\DLgotos.txt)
if /i "%fceugx%" EQU "*" (echo "FCEUGX - NES Emulator for the Wii (Most Recent Release)">>temp\DLnames.txt) & (echo "fceugx">>temp\DLgotos.txt)
if /i "%snes9xgx%" EQU "*" (echo "SNES9xGX - SNES Emulator for the Wii (Most Recent Release)">>temp\DLnames.txt) & (echo "snes9xgx">>temp\DLgotos.txt)
if /i "%vbagx%" EQU "*" (echo "Visual Boy Advance GX - GB/GBA Emulator for the Wii (Most Recent Release)">>temp\DLnames.txt) & (echo "vbagx">>temp\DLgotos.txt)
if /i "%WII64%" EQU "*" (echo "Wii64 beta1.1 (N64 Emulator)">>temp\DLnames.txt) & (echo "WII64">>temp\DLgotos.txt)
if /i "%WIISX%" EQU "*" (echo "WiiSX beta2.1 (Playstation 1 Emulator)">>temp\DLnames.txt) & (echo "WIISX">>temp\DLgotos.txt)
if /i "%SGM%" EQU "*" (echo "SaveGame Manager GX (Most Recent Release)">>temp\DLnames.txt) & (echo "SGM">>temp\DLgotos.txt)
if /i "%WIIX%" EQU "*" (echo "WiiXplorer (Most Recent Release)">>temp\DLnames.txt) & (echo "WIIX">>temp\DLgotos.txt)
if /i "%HBB%" EQU "*" (echo "Homebrew Browser v0.3.9c">>temp\DLnames.txt) & (echo "HBB">>temp\DLgotos.txt)
if /i "%locked%" EQU "*" (echo "Locked Apps Folder for HBC (PASS=UDLRAB)">>temp\DLnames.txt) & (echo "locked">>temp\DLgotos.txt)

if /i "%h4%" EQU "*" (echo "Hermes cIOS v4 Installer">>temp\DLnames.txt) & (echo "Hermesv4">>temp\DLgotos.txt)
if /i "%h5%" EQU "*" (echo "Hermes cIOS v5 Installer">>temp\DLnames.txt) & (echo "Hermesv5">>temp\DLgotos.txt)
if /i "%h51%" EQU "*" (echo "Hermes cIOS v5.1 Installer">>temp\DLnames.txt) & (echo "Hermesv51">>temp\DLgotos.txt)
if /i "%w19%" EQU "*" (echo "Waninkokos cIOS v19 Installer">>temp\DLnames.txt) & (echo "waninv19">>temp\DLgotos.txt)
if /i "%w20%" EQU "*" (echo "Waninkokos cIOS v20 Installer">>temp\DLnames.txt) & (echo "waninv20">>temp\DLgotos.txt)
if /i "%CM5%" EQU "*" (echo "cMIOS rev5 Installer">>temp\DLnames.txt) & (echo "cMIOSrev5">>temp\DLgotos.txt)
if /i "%MP%" EQU "*" (echo "MIOS Patcher 0.2">>temp\DLnames.txt) & (echo "MIOSPatcher">>temp\DLgotos.txt)

if /i "%MII%" EQU "*" (echo "MII Channel">>temp\DLnames.txt) & (echo "MII">>temp\DLgotos.txt)
if /i "%P%" EQU "*" (echo "Photo Channel 1.1 (USA / PAL / JAP)">>temp\DLnames.txt) & (echo "PHOTO">>temp\DLgotos.txt)
if /i "%PK%" EQU "*" (echo "KOREAN Photo Channel 1.1">>temp\DLnames.txt) & (echo "PHOTO_K">>temp\DLgotos.txt)
if /i "%S%" EQU "*" (echo "Shopping Channel (USA / PAL / JAP)">>temp\DLnames.txt) & (echo "SHOP">>temp\DLgotos.txt)
if /i "%SK%" EQU "*" (echo "KOREAN Shopping Channel">>temp\DLnames.txt) & (echo "SHOP_K">>temp\DLgotos.txt)
if /i "%IU%" EQU "*" (echo "USA Internet Channel">>temp\DLnames.txt) & (echo "NET_U">>temp\DLgotos.txt)
if /i "%IE%" EQU "*" (echo "PAL Internet Channel">>temp\DLnames.txt) & (echo "NET_E">>temp\DLgotos.txt)
if /i "%IJ%" EQU "*" (echo "JAP Internet Channel">>temp\DLnames.txt) & (echo "NET_J">>temp\DLgotos.txt)
if /i "%WU%" EQU "*" (echo "USA Weather Channel">>temp\DLnames.txt) & (echo "WEATHER_U">>temp\DLgotos.txt)
if /i "%WE%" EQU "*" (echo "PAL Weather Channel">>temp\DLnames.txt) & (echo "WEATHER_E">>temp\DLgotos.txt)
if /i "%WJ%" EQU "*" (echo "JAP Weather Channel">>temp\DLnames.txt) & (echo "WEATHER_J">>temp\DLgotos.txt)
if /i "%NU%" EQU "*" (echo "USA NEWS Channel">>temp\DLnames.txt) & (echo "NEWS_U">>temp\DLgotos.txt)
if /i "%NE%" EQU "*" (echo "PAl NEWS Channel">>temp\DLnames.txt) & (echo "NEWS_E">>temp\DLgotos.txt)
if /i "%NJ%" EQU "*" (echo "JAP NEWS Channel">>temp\DLnames.txt) & (echo "NEWS_J">>temp\DLgotos.txt)
if /i "%WSU%" EQU "*" (echo "USA Wii Speak Channel">>temp\DLnames.txt) & (echo "SPEAK_U">>temp\DLgotos.txt)
if /i "%WSE%" EQU "*" (echo "PAL Wii Speak Channel">>temp\DLnames.txt) & (echo "SPEAK_E">>temp\DLgotos.txt)
if /i "%WSJ%" EQU "*" (echo "JAP Wii Speak Channel">>temp\DLnames.txt) & (echo "SPEAK_J">>temp\DLgotos.txt)

if /i "%M10%" EQU "*" (echo "MIOSv10">>temp\DLnames.txt) & (echo "M10">>temp\DLgotos.txt)
if /i "%IOS9%" EQU "*" (echo "IOS9">>temp\DLnames.txt) & (echo "IOS9">>temp\DLgotos.txt)
if /i "%IOS12%" EQU "*" (echo "IOS12">>temp\DLnames.txt) & (echo "IOS12">>temp\DLgotos.txt)
if /i "%IOS13%" EQU "*" (echo "IOS13">>temp\DLnames.txt) & (echo "IOS13">>temp\DLgotos.txt)
if /i "%IOS14%" EQU "*" (echo "IOS14">>temp\DLnames.txt) & (echo "IOS14">>temp\DLgotos.txt)
if /i "%IOS15%" EQU "*" (echo "IOS15">>temp\DLnames.txt) & (echo "IOS15">>temp\DLgotos.txt)
if /i "%IOS17%" EQU "*" (echo "IOS17">>temp\DLnames.txt) & (echo "IOS17">>temp\DLgotos.txt)
if /i "%IOS21%" EQU "*" (echo "IOS21">>temp\DLnames.txt) & (echo "IOS21">>temp\DLgotos.txt)
if /i "%IOS22%" EQU "*" (echo "IOS22">>temp\DLnames.txt) & (echo "IOS22">>temp\DLgotos.txt)
if /i "%IOS28%" EQU "*" (echo "IOS28">>temp\DLnames.txt) & (echo "IOS28">>temp\DLgotos.txt)
if /i "%IOS31%" EQU "*" (echo "IOS31">>temp\DLnames.txt) & (echo "IOS31">>temp\DLgotos.txt)
if /i "%IOS33%" EQU "*" (echo "IOS33">>temp\DLnames.txt) & (echo "IOS33">>temp\DLgotos.txt)
if /i "%IOS34%" EQU "*" (echo "IOS34">>temp\DLnames.txt) & (echo "IOS34">>temp\DLgotos.txt)
if /i "%IOS35%" EQU "*" (echo "IOS35">>temp\DLnames.txt) & (echo "IOS35">>temp\DLgotos.txt)
if /i "%IOS36%" EQU "*" (echo "IOS36v3351">>temp\DLnames.txt) & (echo "IOS36">>temp\DLgotos.txt)
if /i "%IOS36v3608%" EQU "*" (echo "IOS36v3608">>temp\DLnames.txt) & (echo "IOS36v3608">>temp\DLgotos.txt)
if /i "%IOS37%" EQU "*" (echo "IOS37">>temp\DLnames.txt) & (echo "IOS37">>temp\DLgotos.txt)
if /i "%IOS38%" EQU "*" (echo "IOS38">>temp\DLnames.txt) & (echo "IOS38">>temp\DLgotos.txt)
if /i "%IOS41%" EQU "*" (echo "IOS41">>temp\DLnames.txt) & (echo "IOS41">>temp\DLgotos.txt)
if /i "%IOS43%" EQU "*" (echo "IOS43">>temp\DLnames.txt) & (echo "IOS43">>temp\DLgotos.txt)
if /i "%IOS45%" EQU "*" (echo "IOS45">>temp\DLnames.txt) & (echo "IOS45">>temp\DLgotos.txt)
if /i "%IOS46%" EQU "*" (echo "IOS46">>temp\DLnames.txt) & (echo "IOS46">>temp\DLgotos.txt)
if /i "%IOS48v4124%" EQU "*" (echo "IOS48">>temp\DLnames.txt) & (echo "IOS48v4124">>temp\DLgotos.txt)
if /i "%IOS53%" EQU "*" (echo "IOS53">>temp\DLnames.txt) & (echo "IOS53">>temp\DLgotos.txt)
if /i "%IOS55%" EQU "*" (echo "IOS55">>temp\DLnames.txt) & (echo "IOS55">>temp\DLgotos.txt)
if /i "%IOS56%" EQU "*" (echo "IOS56">>temp\DLnames.txt) & (echo "IOS56">>temp\DLgotos.txt)
if /i "%IOS57%" EQU "*" (echo "IOS57">>temp\DLnames.txt) & (echo "IOS57">>temp\DLgotos.txt)
if /i "%IOS58%" EQU "*" (echo "IOS58">>temp\DLnames.txt) & (echo "IOS58">>temp\DLgotos.txt)
if /i "%IOS61%" EQU "*" (echo "IOS61">>temp\DLnames.txt) & (echo "IOS61">>temp\DLgotos.txt)
if /i "%A0e%" EQU "*" (echo "0000000e.app from IOS80 v6943 (SNEEK)">>temp\DLnames.txt) & (echo "NUSGRABBER0e">>temp\DLgotos.txt)

if /i "%A01%" EQU "*" (echo "00000001.app from IOS80 v6687 (SNEEK)">>temp\DLnames.txt) & (echo "NUSGRABBER01">>temp\DLgotos.txt)
if /i "%A0e_70%" EQU "*" (echo "0000000e.app from IOS70 v6687 (SNEEK)">>temp\DLnames.txt) & (echo "NUSGRABBER0e_70">>temp\DLgotos.txt)
if /i "%A01_70%" EQU "*" (echo "00000001.app from IOS70 v6687 (SNEEK)">>temp\DLnames.txt) & (echo "NUSGRABBER01_70">>temp\DLgotos.txt)
if /i "%A0e_60%" EQU "*" (echo "0000000e.app from IOS60 v6174 (SNEEK)">>temp\DLnames.txt) & (echo "NUSGRABBER0e_60">>temp\DLgotos.txt)
if /i "%A0c%" EQU "*" (echo "0000000c.app from MIOS v10 (DIOS MIOS)">>temp\DLnames.txt) & (echo "NUSGRABBER0c">>temp\DLgotos.txt)
if /i "%A01_60%" EQU "*" (echo "00000001.app from IOS60 v6174 (SNEEK)">>temp\DLnames.txt) & (echo "NUSGRABBER01_60">>temp\DLgotos.txt)
if /i "%A40%" EQU "*" (echo "00000040.app from System Menu 3.2J (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER40">>temp\DLgotos.txt)
if /i "%A42%" EQU "*" (echo "00000042.app from System Menu 3.2U (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER42">>temp\DLgotos.txt)
if /i "%A45%" EQU "*" (echo "00000045.app from System Menu 3.2E (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER45">>temp\DLgotos.txt)
if /i "%A70%" EQU "*" (echo "00000070.app from System Menu 4.0J (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER70">>temp\DLgotos.txt)
if /i "%A72%" EQU "*" (echo "00000072.app from System Menu 4.0U (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER72">>temp\DLgotos.txt)
if /i "%A75%" EQU "*" (echo "00000075.app from System Menu 4.0E (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER75">>temp\DLgotos.txt)
if /i "%A78%" EQU "*" (echo "00000078.app from System Menu 4.1J (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER78">>temp\DLgotos.txt)
if /i "%A7b%" EQU "*" (echo "0000007b.app from System Menu 4.1U (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER7b">>temp\DLgotos.txt)
if /i "%A7e%" EQU "*" (echo "0000007e.app from System Menu 4.1E (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER7e">>temp\DLgotos.txt)
if /i "%A81%" EQU "*" (echo "00000081.app from System Menu 4.1K (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER81">>temp\DLgotos.txt)
if /i "%A84%" EQU "*" (echo "00000084.app from System Menu 4.2J (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER84">>temp\DLgotos.txt)
if /i "%A87%" EQU "*" (echo "00000087.app from System Menu 4.2U (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER87">>temp\DLgotos.txt)
if /i "%A8a%" EQU "*" (echo "0000008a.app from System Menu 4.2E (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER8a">>temp\DLgotos.txt)
if /i "%A8d%" EQU "*" (echo "0000008d.app from System Menu 4.2K (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER8d">>temp\DLgotos.txt)
if /i "%A94%" EQU "*" (echo "00000094.app from System Menu 4.3J (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER94">>temp\DLgotos.txt)
if /i "%A97%" EQU "*" (echo "00000097.app from System Menu 4.3U (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER97">>temp\DLgotos.txt)
if /i "%A9a%" EQU "*" (echo "0000009a.app from System Menu 4.3E (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER9a">>temp\DLgotos.txt)
if /i "%A9d%" EQU "*" (echo "0000009d.app from System Menu 4.3K (for MyMenuify)">>temp\DLnames.txt) & (echo "NUSGRABBER9d">>temp\DLgotos.txt)

if /i "%IOS236%" EQU "*" (echo "IOS236v65535(IOS36v3351[FS-ES-NP])">>temp\DLnames.txt) & (echo "IOS236">>temp\DLgotos.txt)

if /i "%cIOS249[37]-d2x-v6%" EQU "*" (echo "cIOS249[37]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS249[37]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS249[38]-d2x-v6%" EQU "*" (echo "cIOS249[38]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS249[38]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS249[53]-d2x-v6%" EQU "*" (echo "cIOS249[53]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS249[53]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS249[55]-d2x-v6%" EQU "*" (echo "cIOS249[55]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS249[55]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS249[56]-d2x-v6%" EQU "*" (echo "cIOS249[56]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS249[56]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS249[57]-d2x-v6%" EQU "*" (echo "cIOS249[57]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS249[57]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS249[58]-d2x-v6%" EQU "*" (echo "cIOS249[58]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS249[58]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS250[37]-d2x-v6%" EQU "*" (echo "cIOS250[37]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS250[37]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS250[38]-d2x-v6%" EQU "*" (echo "cIOS250[38]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS250[38]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS250[53]-d2x-v6%" EQU "*" (echo "cIOS250[53]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS250[53]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS250[55]-d2x-v6%" EQU "*" (echo "cIOS250[55]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS250[55]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS250[56]-d2x-v6%" EQU "*" (echo "cIOS250[56]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS250[56]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS250[57]-d2x-v6%" EQU "*" (echo "cIOS250[57]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS250[57]-d2x-v6">>temp\DLgotos.txt)
if /i "%cIOS250[58]-d2x-v6%" EQU "*" (echo "cIOS250[58]-d2x-v%d2x-beta-rev%">>temp\DLnames.txt) & (echo "cIOS250[58]-d2x-v6">>temp\DLgotos.txt)

if /i "%cIOS222[38]-v4%" EQU "*" (echo "cIOS222[38]-v4">>temp\DLnames.txt) & (echo "cIOS222[38]-v4">>temp\DLgotos.txt)
if /i "%cIOS223[37-38]-v4%" EQU "*" (echo "cIOS223[37-38]-v4">>temp\DLnames.txt) & (echo "cIOS223[37-38]-v4">>temp\DLgotos.txt)

if /i "%cIOS202[37]-v5%" EQU "*" (echo "cIOS202[37]-v5">>temp\DLnames.txt) & (echo "cIOS202[37]-v5">>temp\DLgotos.txt)
if /i "%cIOS202[38]-v5%" EQU "*" (echo "cIOS202[38]-v5">>temp\DLnames.txt) & (echo "cIOS202[38]-v5">>temp\DLgotos.txt)
if /i "%cIOS202[57]-v5%" EQU "*" (echo "cIOS202[57]-v5">>temp\DLnames.txt) & (echo "cIOS202[57]-v5">>temp\DLgotos.txt)

if /i "%cIOS222[38]-v5%" EQU "*" (echo "cIOS222[38]-v5">>temp\DLnames.txt) & (echo "cIOS222[38]-v5">>temp\DLgotos.txt)
if /i "%cIOS223[37]-v5%" EQU "*" (echo "cIOS223[37]-v5">>temp\DLnames.txt) & (echo "cIOS223[37]-v5">>temp\DLgotos.txt)
if /i "%cIOS223[57]-v5%" EQU "*" (echo "cIOS223[57]-v5">>temp\DLnames.txt) & (echo "cIOS223[57]-v5">>temp\DLgotos.txt)
if /i "%cIOS224[37]-v5%" EQU "*" (echo "cIOS224[37]-v5">>temp\DLnames.txt) & (echo "cIOS224[37]-v5">>temp\DLgotos.txt)
if /i "%cIOS224[57]-v5%" EQU "*" (echo "cIOS224[57]-v5">>temp\DLnames.txt) & (echo "cIOS224[57]-v5">>temp\DLgotos.txt)

if /i "%cIOS249-v14%" EQU "*" (echo "cIOS249-v14">>temp\DLnames.txt) & (echo "cIOS249-v14">>temp\DLgotos.txt)
if /i "%cIOS250-v14%" EQU "*" (echo "cIOS250-v14">>temp\DLnames.txt) & (echo "cIOS250-v14">>temp\DLgotos.txt)

if /i "%cIOS249-v17b%" EQU "*" (echo "cIOS249-v17b">>temp\DLnames.txt) & (echo "cIOS249-v17b">>temp\DLgotos.txt)
if /i "%cIOS250-v17b%" EQU "*" (echo "cIOS250-v17b">>temp\DLnames.txt) & (echo "cIOS250-v17b">>temp\DLgotos.txt)

if /i "%cIOS249[37]-v19%" EQU "*" (echo "cIOS249[37]-v19">>temp\DLnames.txt) & (echo "cIOS249[37]-v19">>temp\DLgotos.txt)
if /i "%cIOS249[38]-v19%" EQU "*" (echo "cIOS249[38]-v19">>temp\DLnames.txt) & (echo "cIOS249[38]-v19">>temp\DLgotos.txt)
if /i "%cIOS249[57]-v19%" EQU "*" (echo "cIOS249[57]-v19">>temp\DLnames.txt) & (echo "cIOS249[57]-v19">>temp\DLgotos.txt)
if /i "%cIOS250[37]-v19%" EQU "*" (echo "cIOS250[37]-v19">>temp\DLnames.txt) & (echo "cIOS250[37]-v19">>temp\DLgotos.txt)
if /i "%cIOS250[38]-v19%" EQU "*" (echo "cIOS250[38]-v19">>temp\DLnames.txt) & (echo "cIOS250[38]-v19">>temp\DLgotos.txt)
if /i "%cIOS250[57]-v19%" EQU "*" (echo "cIOS250[57]-v19">>temp\DLnames.txt) & (echo "cIOS250[57]-v19">>temp\DLgotos.txt)

if /i "%cIOS249[38]-v20%" EQU "*" (echo "cIOS249[38]-v20">>temp\DLnames.txt) & (echo "cIOS249[38]-v20">>temp\DLgotos.txt)
if /i "%cIOS249[56]-v20%" EQU "*" (echo "cIOS249[56]-v20">>temp\DLnames.txt) & (echo "cIOS249[56]-v20">>temp\DLgotos.txt)
if /i "%cIOS249[57]-v20%" EQU "*" (echo "cIOS249[57]-v20">>temp\DLnames.txt) & (echo "cIOS249[57]-v20">>temp\DLgotos.txt)
if /i "%cIOS250[38]-v20%" EQU "*" (echo "cIOS250[38]-v20">>temp\DLnames.txt) & (echo "cIOS250[38]-v20">>temp\DLgotos.txt)
if /i "%cIOS250[56]-v20%" EQU "*" (echo "cIOS250[56]-v20">>temp\DLnames.txt) & (echo "cIOS250[56]-v20">>temp\DLgotos.txt)
if /i "%cIOS250[57]-v20%" EQU "*" (echo "cIOS250[57]-v20">>temp\DLnames.txt) & (echo "cIOS250[57]-v20">>temp\DLgotos.txt)

if /i "%cIOS249[37]-v21%" EQU "*" (echo "cIOS249[37]-v21">>temp\DLnames.txt) & (echo "cIOS249[37]-v21">>temp\DLgotos.txt)
if /i "%cIOS249[38]-v21%" EQU "*" (echo "cIOS249[38]-v21">>temp\DLnames.txt) & (echo "cIOS249[38]-v21">>temp\DLgotos.txt)
if /i "%cIOS249[53]-v21%" EQU "*" (echo "cIOS249[53]-v21">>temp\DLnames.txt) & (echo "cIOS249[53]-v21">>temp\DLgotos.txt)
if /i "%cIOS249[55]-v21%" EQU "*" (echo "cIOS249[55]-v21">>temp\DLnames.txt) & (echo "cIOS249[55]-v21">>temp\DLgotos.txt)
if /i "%cIOS249[56]-v21%" EQU "*" (echo "cIOS249[56]-v21">>temp\DLnames.txt) & (echo "cIOS249[56]-v21">>temp\DLgotos.txt)
if /i "%cIOS249[57]-v21%" EQU "*" (echo "cIOS249[57]-v21">>temp\DLnames.txt) & (echo "cIOS249[57]-v21">>temp\DLgotos.txt)
if /i "%cIOS249[58]-v21%" EQU "*" (echo "cIOS249[58]-v21">>temp\DLnames.txt) & (echo "cIOS249[58]-v21">>temp\DLgotos.txt)
if /i "%cIOS250[37]-v21%" EQU "*" (echo "cIOS250[37]-v21">>temp\DLnames.txt) & (echo "cIOS250[37]-v21">>temp\DLgotos.txt)
if /i "%cIOS250[38]-v21%" EQU "*" (echo "cIOS250[38]-v21">>temp\DLnames.txt) & (echo "cIOS250[38]-v21">>temp\DLgotos.txt)
if /i "%cIOS250[53]-v21%" EQU "*" (echo "cIOS250[53]-v21">>temp\DLnames.txt) & (echo "cIOS250[53]-v21">>temp\DLgotos.txt)
if /i "%cIOS250[55]-v21%" EQU "*" (echo "cIOS250[55]-v21">>temp\DLnames.txt) & (echo "cIOS250[55]-v21">>temp\DLgotos.txt)
if /i "%cIOS250[56]-v21%" EQU "*" (echo "cIOS250[56]-v21">>temp\DLnames.txt) & (echo "cIOS250[56]-v21">>temp\DLgotos.txt)
if /i "%cIOS250[57]-v21%" EQU "*" (echo "cIOS250[57]-v21">>temp\DLnames.txt) & (echo "cIOS250[57]-v21">>temp\DLgotos.txt)
if /i "%cIOS250[58]-v21%" EQU "*" (echo "cIOS250[58]-v21">>temp\DLnames.txt) & (echo "cIOS250[58]-v21">>temp\DLgotos.txt)

if /i "%RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2%" EQU "*" (echo "WiiGator+WiiPower cMIOS-v65535(v10)">>temp\DLnames.txt) & (echo "RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2">>temp\DLgotos.txt)
if /i "%RVL-cmios-v4_WiiGator_GCBL_v0.2%" EQU "*" (echo "cMIOS-v4 WiiGator GCBL v0.2">>temp\DLnames.txt) & (echo "RVL-cmios-v4_WiiGator_GCBL_v0.2">>temp\DLgotos.txt)
if /i "%RVL-cmios-v4_Waninkoko_rev5%" EQU "*" (echo "cMIOS-v4 Waninkoko rev5">>temp\DLnames.txt) & (echo "RVL-cmios-v4_Waninkoko_rev5">>temp\DLgotos.txt)


if exist temp\DLnames.txt sfk filter -quiet "temp\DLnames.txt" -rep _"""__ -write -yes
if exist temp\DLgotos.txt sfk filter -quiet "temp\DLgotos.txt" -rep _"""__ -write -yes

if not exist temp\DLGotosADV.txt goto:quickskip
::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\DLGotosADV.txt) do call :processDLGotosADV %%A
goto:quickskip
:processDLGotosADV
echo %*>>temp\DLgotos.txt
goto:EOF
:quickskip

if not exist temp\DLnamesADV.txt goto:quickskip
::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\DLnamesADV.txt) do call :processDLnamesADV %%A
goto:quickskip
:processDLnamesADV
echo %*>>temp\DLnames.txt
goto:EOF
:quickskip

if exist "temp\DLgotos.txt" copy /y "temp\DLgotos.txt" "temp\DLgotos-copy.txt">nul


if not exist temp\DLnames.txt goto:miniskip
setlocal ENABLEDELAYEDEXPANSION
SET DLTOTAL=0
for /f "delims=" %%i in (temp\DLnames.txt) do set /a DLTOTAL=!DLTOTAL!+1
setlocal DISABLEDELAYEDEXPANSION
:miniskip



if /i "%MENU1%" EQU "S" goto:DLSETTINGS
if /i "%MENUREAL%" EQU "S" goto:DLSETTINGS

SET /a LINES=%DLTOTAL%+20

if /i "%MENU1%" EQU "L" SET /a LINES=%LINES%+12

if %LINES% LEQ 54 goto:noresize
mode con cols=85 lines=%LINES%
:noresize

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
if /i "%MENU1%" EQU "H" echo                                  HackMii Solutions
if /i "%MENU1%" EQU "H" echo.


::-----------DL QUEUE SETTINGS---------
if /i "%MENU1%" NEQ "L" goto:skiploadDLcue

if /i "%ROOTSAVE%" EQU "%ROOTSAVETEMP%" set matchrs=Green
if /i "%ROOTSAVE%" NEQ "%ROOTSAVETEMP%" set matchrs=Red

if /i "%OPTION1%" EQU "%OPTION1TEMP%" set match1=Green
if /i "%OPTION1%" NEQ "%OPTION1TEMP%" set match1=Red

echo.
echo                                 Download Queue Loaded
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Queue Options appear [Red]Red [def]when they differ from
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 your saved settings and [Green]Green [def]if they match
echo.
if /i "%ROOTSAVE%" EQU "ON" sfk echo -spat \x20 \x20 [%matchrs%]Root Save: Save IOSs\MIOSs to Root instead of WAD Folder (Enabled)
if /i "%ROOTSAVE%" EQU "OFF" sfk echo -spat \x20 \x20 [%matchrs%]Root Save: Save IOSs\MIOSs to Root instead of WAD Folder (Disabled)
echo               * Useful for Wii Apps that require IOSs\MIOSs saved to Root
echo.
if /i "%OPTION1%" EQU "OFF" sfk echo -spat \x20 \x20 [%match1%]Do not Keep 00000001 Folder for IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "OFF" echo               * Folder sometimes required for offline usage of a few Wii Apps
if /i "%OPTION1%" EQU "ON" sfk echo -spat \x20 \x20 [%match1%]Keep 00000001 Folder for IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "ON" echo               * Useful for offline usage of Wii Apps like Dop-Mii



if /i "%OPTION1%" EQU "NUS" sfk echo -spat \x20 \x20 [%match1%]Keep NUS\00000001000000##v# Folder for IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "NUS" echo               * Useful for offline usage of Wii Apps like d2x\Hermes cIOS Installers

if /i "%OPTION1%" EQU "ALL" sfk echo -spat \x20 \x20 [%match1%]Keep NUS\00000001000000##v# and 00000001 Folder for IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "ALL" echo               * Useful for offline usage of a handful of Wii Apps
echo.
echo.

:skiploadDLcue

if /i "%DLTOTAL%" EQU "0" echo      No files were marked for download
if /i "%DLTOTAL%" EQU "0" goto:skipall

if /i "%USBGUIDE%" NEQ "Y" goto:skip
if /i "%USBCONFIG%" EQU "USB" (echo      The following %DLTOTAL% files will be downloaded to "%DRIVE%" or "%DRIVEU%":) else (echo      The following %DLTOTAL% files will be downloaded to "%DRIVE%":)
goto:skipall
:skip

echo      The following %DLTOTAL% files will be downloaded to "%DRIVE%":
:skipall

echo.

SET DLNUM=0

::Loop through the the following once for EACH line in *.txt
if not exist temp\DLnames.txt goto:nextstep
for /F "tokens=*" %%A in (temp\DLnames.txt) do call :processDLlist %%A
goto:nextstep
:processDLlist
SET /a DLNUM=%DLNUM%+1
echo      %DLNUM%) %*
goto:EOF
:nextstep


echo.

echo      Begin Downloading now?
echo.
if /i "%DLTOTAL%" EQU "0" goto:zerodownloads
if /i "%MENU1%" EQU "W" goto:WorUSB
if /i "%MENU1%" EQU "U" goto:WorUSB
if /i "%MENU1%" EQU "H" goto:WorUSB

echo           Y = Yes, Begin Downloading

:WorUSB
if /i "%MENU1%" EQU "W" echo           Y = Yes, Generate Guide and Begin Downloading
if /i "%MENU1%" EQU "W" echo           G = Generate Guide Only
if /i "%MENU1%" EQU "U" echo           Y = Yes, Generate Guide and Begin Downloading
if /i "%MENU1%" EQU "U" echo           G = Generate Guide Only
if /i "%MENU1%" EQU "H" echo           Y = Yes, Generate Guide and Begin Downloading
if /i "%MENU1%" EQU "H" echo           G = Generate Guide Only


:zerodownloads

if /i "%MENU1%" EQU "1" echo           A = Add more files to batch download list
if /i "%MENU1%" EQU "2" echo           A = Add more files to batch download list
if /i "%MENU1%" EQU "3" echo           A = Add more files to batch download list
if /i "%MENU1%" EQU "4" echo           A = Add more files to batch download list
if /i "%MENU1%" EQU "A" echo           A = Add more files to batch download list
if /i "%MENU1%" EQU "L" echo           A = Add more files to batch download list
echo.

if /i "%BACKB4QUEUE%" NEQ "Menu" goto:yessave
if /i "%MENU1%" EQU "L" goto:NoNewDownloads
:yessave
If not Exist download_queue.bat echo           S = Save Download Queue
If Exist download_queue.bat echo           S  = Save Download Queue (existing Download Queue will be renamed)
if /i "%MENU1%" EQU "L" echo.
if /i "%MENU1%" EQU "L" goto:NoNewDownloads
If Exist download_queue.bat echo           S+ = Save Download Queue+ (add above files to existing Download Queue)
echo.
:NoNewDownloads

echo           B = Back
echo           M = Main Menu
echo.
set /p SETTINGS=     Enter Selection Here: 




if /i "%SETTINGS%" EQU "B" mode con cols=85 lines=54
if /i "%SETTINGS%" EQU "B" goto:%BACKB4QUEUE%
if /i "%SETTINGS%" EQU "M" goto:MENU

if /i "%BACKB4QUEUE%" NEQ "Menu" goto:yessave
if /i "%MENU1%" EQU "L" goto:noexistingqueue
:yessave
if /i "%SETTINGS%" EQU "S" goto:SaveDownloadQueue

if /i "%MENU1%" EQU "L" goto:noexistingqueue
If not Exist download_queue.bat goto:noexistingqueue
if /i "%SETTINGS%" EQU "S+" goto:SaveDownloadQueue
:noexistingqueue


if /i "%MENU1%" NEQ "L" goto:notbatch
if /i "%SETTINGS%" EQU "A" mode con cols=85 lines=54
if /i "%SETTINGS%" EQU "A" goto:LIST
if /i "%DLTOTAL%" EQU "0" goto:badkey
if /i "%SETTINGS%" EQU "Y" (mode con cols=85 lines=54) & (goto:DLSETTINGS)
:notbatch


if /i "%MENU1%" NEQ "1" goto:notbatch
if /i "%SETTINGS%" EQU "A" mode con cols=85 lines=54
if /i "%SETTINGS%" EQU "A" goto:%BACKB4QUEUE%
if /i "%DLTOTAL%" EQU "0" goto:badkey
if /i "%SETTINGS%" EQU "Y" (mode con cols=85 lines=54) & (goto:DLSETTINGS)
:notbatch

if /i "%MENU1%" NEQ "2" goto:notoldbatch
if /i "%SETTINGS%" EQU "A" mode con cols=85 lines=54
if /i "%SETTINGS%" EQU "A" set lines=54
if /i "%SETTINGS%" EQU "A" goto:%BACKB4QUEUE%
if /i "%DLTOTAL%" EQU "0" goto:badkey
if /i "%SETTINGS%" EQU "Y" (mode con cols=85 lines=54) & (goto:DLSETTINGS)
:notoldbatch

if /i "%MENU1%" NEQ "3" goto:NotBatchApp
if /i "%SETTINGS%" EQU "A" mode con cols=85 lines=54
if /i "%SETTINGS%" EQU "A" set lines=54
if /i "%SETTINGS%" EQU "A" goto:%BACKB4QUEUE%
if /i "%DLTOTAL%" EQU "0" goto:badkey
if /i "%SETTINGS%" EQU "Y" (mode con cols=85 lines=54) & (goto:DLSETTINGS)
:NotBatchApp

if /i "%MENU1%" NEQ "4" goto:NotLIST4
if /i "%SETTINGS%" EQU "A" mode con cols=85 lines=54
if /i "%SETTINGS%" EQU "A" set lines=54
if /i "%SETTINGS%" EQU "A" goto:%BACKB4QUEUE%
if /i "%DLTOTAL%" EQU "0" goto:badkey
if /i "%SETTINGS%" EQU "Y" (mode con cols=85 lines=54) & (goto:DLSETTINGS)
:NotLIST4

if /i "%MENU1%" NEQ "A" goto:NotAdv
if /i "%SETTINGS%" EQU "A" mode con cols=85 lines=54
if /i "%SETTINGS%" EQU "A" set lines=54
if /i "%SETTINGS%" EQU "A" goto:%BACKB4QUEUE%
if /i "%DLTOTAL%" EQU "0" goto:badkey
if /i "%SETTINGS%" EQU "Y" (mode con cols=85 lines=54) & (goto:DLSETTINGS)
:NotAdv

if /i "%DLTOTAL%" EQU "0" goto:badkey
if /i "%SETTINGS%" EQU "Y" goto:COPY


if /i "%MENU1%" EQU "W" goto:generateguideonly
if /i "%MENU1%" EQU "U" goto:generateguideonly
if /i "%MENU1%" EQU "H" goto:generateguideonly
goto:badkey

:generateguideonly

if /i "%SETTINGS%" EQU "G" goto:guide


:badkey
echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DOWNLOADQUEUE



:SaveDownloadQueue
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                  Saving Download Queue
echo.

if /i "%SETTINGS%" EQU "S+" goto:SaveDownloadQueue2
if /i "%FINISH%" EQU "S+" goto:SaveDownloadQueue2


:renameDownloadQueue
if not exist Download_Queue.bat goto:SaveDownloadQueue2
SET /a COUNT8=%COUNT8%+1
if exist Download_Queue%COUNT8%.bat goto:renameDownloadQueue
move Download_Queue.bat Download_Queue%count8%.bat>nul

:SaveDownloadQueue2

set AdvNumberCOPY=%AdvNumber%
if /i "%SETTINGS%" EQU "S" set AdvNumberCOPY=0
if /i "%FINISH%" EQU "S" set AdvNumberCOPY=0

set GetAdvNumberOnly=Y
if exist Download_Queue.bat call Download_Queue.bat
set GetAdvNumberOnly=

set /a AdvNumberCOPY=%AdvNumberCOPY%+%AdvNumber%

set AdvNumberCOPY2=%AdvNumber%
if /i "%SETTINGS%" EQU "S" set AdvNumberCOPY2=0
if /i "%FINISH%" EQU "S" set AdvNumberCOPY2=0

set AdvNumberCOPY3=%AdvNumberCOPY2%
::set AdvNumber=0

if exist Download_Queue.bat sfk filter -quiet Download_Queue.bat -ls!":endofqueue" -write -yes
if exist Download_Queue.bat sfk filter -quiet -spat Download_Queue.bat -rep _\x22_quote_ -write -yes

echo.

echo ::ModMii v%currentversion% - Download Queue - %DATE% - %TIME% >> Download_Queue.bat

echo "set AdvNumber=%AdvNumbercopy%">>Download_Queue.bat
echo "if /i quote@GetAdvNumberOnly@quote EQU quoteYquote goto:endofqueue">>Download_Queue.bat

echo ::Queue Settings>> Download_Queue.bat
echo Set ROOTSAVE=%ROOTSAVE%>> Download_Queue.bat
echo Set Option1=%Option1%>> Download_Queue.bat

echo ::Queue>> Download_Queue.bat

::if /i "%MENU1%" EQU "W" echo SET VIRGIN=%VIRGIN%>> Download_Queue.bat
::if /i "%MENU1%" EQU "W" echo SET FIRMSTART=%FIRMSTART%>> Download_Queue.bat
::if /i "%MENU1%" EQU "W" echo SET REGION=%REGION%>> Download_Queue.bat
::if /i "%MENU1%" EQU "W" echo SET REGIONCHANGE=%REGIONCHANGE%>> Download_Queue.bat
::if /i "%MENU1%" EQU "W" echo SET FIRM=%FIRM%>> Download_Queue.bat

if /i "%EULAU%" EQU "*" echo SET EULAU=%EULAU%>> Download_Queue.bat
if /i "%EULAE%" EQU "*" echo SET EULAE=%EULAE%>> Download_Queue.bat
if /i "%EULAJ%" EQU "*" echo SET EULAJ=%EULAJ%>> Download_Queue.bat
if /i "%EULAK%" EQU "*" echo SET EULAK=%EULAK%>> Download_Queue.bat
if /i "%RSU%" EQU "*" echo SET RSU=%RSU%>> Download_Queue.bat
if /i "%RSE%" EQU "*" echo SET RSE=%RSE%>> Download_Queue.bat
if /i "%RSJ%" EQU "*" echo SET RSJ=%RSJ%>> Download_Queue.bat
if /i "%RSK%" EQU "*" echo SET RSK=%RSK%>> Download_Queue.bat
if /i "%BC%" EQU "*" echo SET BC=%BC%>> Download_Queue.bat

if /i "%SM3.2U%" EQU "*" echo SET SM3.2U=%SM3.2U%>> Download_Queue.bat
if /i "%SM4.1U%" EQU "*" echo SET SM4.1U=%SM4.1U%>> Download_Queue.bat
if /i "%SM4.2U%" EQU "*" echo SET SM4.2U=%SM4.2U%>> Download_Queue.bat
if /i "%SM4.3U%" EQU "*" echo SET SM4.3U=%SM4.3U%>> Download_Queue.bat
if /i "%SM3.2E%" EQU "*" echo SET SM3.2E=%SM3.2E%>> Download_Queue.bat
if /i "%SM4.1E%" EQU "*" echo SET SM4.1E=%SM4.1E%>> Download_Queue.bat
if /i "%SM4.2E%" EQU "*" echo SET SM4.2E=%SM4.2E%>> Download_Queue.bat
if /i "%SM4.3E%" EQU "*" echo SET SM4.3E=%SM4.3E%>> Download_Queue.bat
if /i "%SM3.2J%" EQU "*" echo SET SM3.2J=%SM3.2J%>> Download_Queue.bat
if /i "%SM4.1J%" EQU "*" echo SET SM4.1J=%SM4.1J%>> Download_Queue.bat
if /i "%SM4.2J%" EQU "*" echo SET SM4.2J=%SM4.2J%>> Download_Queue.bat
if /i "%SM4.3J%" EQU "*" echo SET SM4.3J=%SM4.3J%>> Download_Queue.bat
if /i "%SM4.1K%" EQU "*" echo SET SM4.1K=%SM4.1K%>> Download_Queue.bat
if /i "%SM4.2K%" EQU "*" echo SET SM4.2K=%SM4.2K%>> Download_Queue.bat
if /i "%SM4.3K%" EQU "*" echo SET SM4.3K=%SM4.3K%>> Download_Queue.bat
if /i "%SM4.3U-DWR%" EQU "*" echo SET SM4.3U-DWR=%SM4.3U-DWR%>> Download_Queue.bat
if /i "%SM4.2U-DWR%" EQU "*" echo SET SM4.2U-DWR=%SM4.2U-DWR%>> Download_Queue.bat
if /i "%SM4.1U-DWR%" EQU "*" echo SET SM4.1U-DWR=%SM4.1U-DWR%>> Download_Queue.bat
if /i "%SM4.3E-DWR%" EQU "*" echo SET SM4.3E-DWR=%SM4.3E-DWR%>> Download_Queue.bat
if /i "%SM4.2E-DWR%" EQU "*" echo SET SM4.2E-DWR=%SM4.2E-DWR%>> Download_Queue.bat
if /i "%SM4.1E-DWR%" EQU "*" echo SET SM4.1E-DWR=%SM4.1E-DWR%>> Download_Queue.bat
if /i "%SM4.3J-DWR%" EQU "*" echo SET SM4.3J-DWR=%SM4.3J-DWR%>> Download_Queue.bat
if /i "%SM4.2J-DWR%" EQU "*" echo SET SM4.2J-DWR=%SM4.2J-DWR%>> Download_Queue.bat
if /i "%SM4.1J-DWR%" EQU "*" echo SET SM4.1J-DWR=%SM4.1J-DWR%>> Download_Queue.bat
if /i "%SM4.3K-DWR%" EQU "*" echo SET SM4.3K-DWR=%SM4.3K-DWR%>> Download_Queue.bat
if /i "%SM4.2K-DWR%" EQU "*" echo SET SM4.2K-DWR=%SM4.2K-DWR%>> Download_Queue.bat
if /i "%SM4.1K-DWR%" EQU "*" echo SET SM4.1K-DWR=%SM4.1K-DWR%>> Download_Queue.bat

if /i "%SM4.3U-DWG%" EQU "*" echo SET SM4.3U-DWG=%SM4.3U-DWG%>> Download_Queue.bat
if /i "%SM4.2U-DWG%" EQU "*" echo SET SM4.2U-DWG=%SM4.2U-DWG%>> Download_Queue.bat
if /i "%SM4.1U-DWG%" EQU "*" echo SET SM4.1U-DWG=%SM4.1U-DWG%>> Download_Queue.bat
if /i "%SM4.3E-DWG%" EQU "*" echo SET SM4.3E-DWG=%SM4.3E-DWG%>> Download_Queue.bat
if /i "%SM4.2E-DWG%" EQU "*" echo SET SM4.2E-DWG=%SM4.2E-DWG%>> Download_Queue.bat
if /i "%SM4.1E-DWG%" EQU "*" echo SET SM4.1E-DWG=%SM4.1E-DWG%>> Download_Queue.bat
if /i "%SM4.3J-DWG%" EQU "*" echo SET SM4.3J-DWG=%SM4.3J-DWG%>> Download_Queue.bat
if /i "%SM4.2J-DWG%" EQU "*" echo SET SM4.2J-DWG=%SM4.2J-DWG%>> Download_Queue.bat
if /i "%SM4.1J-DWG%" EQU "*" echo SET SM4.1J-DWG=%SM4.1J-DWG%>> Download_Queue.bat
if /i "%SM4.3K-DWG%" EQU "*" echo SET SM4.3K-DWG=%SM4.3K-DWG%>> Download_Queue.bat
if /i "%SM4.2K-DWG%" EQU "*" echo SET SM4.2K-DWG=%SM4.2K-DWG%>> Download_Queue.bat
if /i "%SM4.1K-DWG%" EQU "*" echo SET SM4.1K-DWG=%SM4.1K-DWG%>> Download_Queue.bat

if /i "%IOS30%" EQU "*" echo SET IOS30=%IOS30%>> Download_Queue.bat
if /i "%IOS30P60%" EQU "*" echo SET IOS30P60=%IOS30P60%>> Download_Queue.bat
if /i "%IOS20P60%" EQU "*" echo SET IOS20P60=%IOS20P60%>> Download_Queue.bat
if /i "%IOS30P%" EQU "*" echo SET IOS30P=%IOS30P%>> Download_Queue.bat
if /i "%IOS11P60%" EQU "*" echo SET IOS11P60=%IOS11P60%>> Download_Queue.bat
if /i "%IOS20P60%" EQU "*" echo SET IOS20P60=%IOS20P60%>> Download_Queue.bat
if /i "%IOS50P%" EQU "*" echo SET IOS50P=%IOS50P%>> Download_Queue.bat
if /i "%IOS52P%" EQU "*" echo SET IOS52P=%IOS52P%>> Download_Queue.bat
if /i "%IOS60%" EQU "*" echo SET IOS60=%IOS60%>> Download_Queue.bat
if /i "%IOS60P%" EQU "*" echo SET IOS60P=%IOS60P%>> Download_Queue.bat
if /i "%IOS70%" EQU "*" echo SET IOS70=%IOS70%>> Download_Queue.bat
if /i "%IOS70P%" EQU "*" echo SET IOS70P=%IOS70P%>> Download_Queue.bat
if /i "%IOS70K%" EQU "*" echo SET IOS70K=%IOS70K%>> Download_Queue.bat
if /i "%IOS80%" EQU "*" echo SET IOS80=%IOS80%>> Download_Queue.bat
if /i "%IOS80P%" EQU "*" echo SET IOS80P=%IOS80P%>> Download_Queue.bat
if /i "%IOS80K%" EQU "*" echo SET IOS80K=%IOS80K%>> Download_Queue.bat
if /i "%IOS236%" EQU "*" echo SET IOS236=%IOS236%>> Download_Queue.bat
if /i "%BB1%" EQU "*" echo SET BB1=%BB1%>> Download_Queue.bat
if /i "%BB2%" EQU "*" echo SET BB2=%BB2%>> Download_Queue.bat
if /i "%HM%" EQU "*" echo SET HM=%HM%>> Download_Queue.bat
if /i "%h4%" EQU "*" echo SET h4=%h4%>> Download_Queue.bat
if /i "%h5%" EQU "*" echo SET h5=%h5%>> Download_Queue.bat
if /i "%h51%" EQU "*" echo SET h51=%h51%>> Download_Queue.bat
if /i "%CM5%" EQU "*" echo SET CM5=%CM5%>> Download_Queue.bat
if /i "%MP%" EQU "*" echo SET MP=%MP%>> Download_Queue.bat
if /i "%w19%" EQU "*" echo SET w19=%w19%>> Download_Queue.bat
if /i "%w20%" EQU "*" echo SET w20=%w20%>> Download_Queue.bat
if /i "%IOS236Installer%" EQU "*" echo SET IOS236Installer=%IOS236Installer%>> Download_Queue.bat
if /i "%SIP%" EQU "*" echo SET SIP=%SIP%>> Download_Queue.bat
if /i "%Y4M%" EQU "*" echo SET Y4M=%Y4M%>> Download_Queue.bat
if /i "%dop%" EQU "*" echo SET dop=%dop%>> Download_Queue.bat
if /i "%AccioHacks%" EQU "*" echo SET AccioHacks=%AccioHacks%>> Download_Queue.bat
if /i "%MyM%" EQU "*" echo SET MyM=%MyM%>> Download_Queue.bat
if /i "%locked%" EQU "*" echo SET locked=%locked%>> Download_Queue.bat
if /i "%HBB%" EQU "*" echo SET HBB=%HBB%>> Download_Queue.bat
if /i "%WII64%" EQU "*" echo SET WII64=%WII64%>> Download_Queue.bat
if /i "%WIISX%" EQU "*" echo SET WIISX=%WIISX%>> Download_Queue.bat
if /i "%bootmiisd%" EQU "*" echo SET bootmiisd=%bootmiisd%>> Download_Queue.bat
if /i "%pwns%" EQU "*" echo SET pwns=%pwns%>> Download_Queue.bat
if /i "%Twi%" EQU "*" echo SET Twi=%Twi%>> Download_Queue.bat
if /i "%YUGI%" EQU "*" echo SET YUGI=%YUGI%>> Download_Queue.bat
if /i "%BATHAXX%" EQU "*" echo SET BATHAXX=%BATHAXX%>> Download_Queue.bat
if /i "%ROTJ%" EQU "*" echo SET ROTJ=%ROTJ%>> Download_Queue.bat
if /i "%TOS%" EQU "*" echo SET TOS=%TOS%>> Download_Queue.bat
if /i "%smash%" EQU "*" echo SET smash=%smash%>> Download_Queue.bat
if /i "%mmm%" EQU "*" echo SET mmm=%mmm%>> Download_Queue.bat
if /i "%yawm%" EQU "*" echo SET yawm=%yawm%>> Download_Queue.bat
if /i "%neogamma%" EQU "*" echo SET neogamma=%neogamma%>> Download_Queue.bat
if /i "%cfg249%" EQU "*" echo SET cfg249=%cfg249%>> Download_Queue.bat
if /i "%cfg222%" EQU "*" echo SET cfg222=%cfg222%>> Download_Queue.bat
if /i "%usbfolder%" EQU "*" echo SET usbfolder=%usbfolder%>> Download_Queue.bat
if /i "%WiiMC%" EQU "*" echo SET WiiMC=%WiiMC%>> Download_Queue.bat
if /i "%fceugx%" EQU "*" echo SET fceugx=%fceugx%>> Download_Queue.bat
if /i "%snes9xgx%" EQU "*" echo SET snes9xgx=%snes9xgx%>> Download_Queue.bat
if /i "%vbagx%" EQU "*" echo SET vbagx=%vbagx%>> Download_Queue.bat
if /i "%SGM%" EQU "*" echo SET SGM=%SGM%>> Download_Queue.bat
if /i "%WIIX%" EQU "*" echo SET WIIX=%WIIX%>> Download_Queue.bat
if /i "%wbm%" EQU "*" echo SET wbm=%wbm%>> Download_Queue.bat
if /i "%CheatCodes%" EQU "*" echo SET CheatCodes=%CheatCodes%>> Download_Queue.bat
if /i "%f32%" EQU "*" echo SET f32=%f32%>> Download_Queue.bat
if /i "%FLOW%" EQU "*" echo SET FLOW=%FLOW%>> Download_Queue.bat
if /i "%USBX%" EQU "*" echo SET USBX=%USBX%>> Download_Queue.bat
if /i "%JOYF%" EQU "*" echo SET JOYF=%JOYF%>> Download_Queue.bat
if /i "%S2U%" EQU "*" echo SET S2U=%S2U%>> Download_Queue.bat
if /i "%HBF%" EQU "*" echo SET HBF=%HBF%>> Download_Queue.bat
if /i "%JOY%" EQU "*" echo SET JOY=%JOY%>> Download_Queue.bat
if /i "%cfgr%" EQU "*" echo SET cfgr=%cfgr%>> Download_Queue.bat
if /i "%Pri%" EQU "*" echo SET Pri=%Pri%>> Download_Queue.bat
if /i "%HAX%" EQU "*" echo SET HAX=%HAX%>> Download_Queue.bat
if /i "%MII%" EQU "*" echo SET MII=%MII%>> Download_Queue.bat
if /i "%P%" EQU "*" echo SET P=%P%>> Download_Queue.bat
if /i "%PK%" EQU "*" echo SET PK=%PK%>> Download_Queue.bat
if /i "%S%" EQU "*" echo SET S=%S%>> Download_Queue.bat
if /i "%SK%" EQU "*" echo SET SK=%SK%>> Download_Queue.bat
if /i "%IU%" EQU "*" echo SET IU=%IU%>> Download_Queue.bat
if /i "%IE%" EQU "*" echo SET IE=%IE%>> Download_Queue.bat
if /i "%IJ%" EQU "*" echo SET IJ=%IJ%>> Download_Queue.bat
if /i "%WU%" EQU "*" echo SET WU=%WU%>> Download_Queue.bat
if /i "%WE%" EQU "*" echo SET WE=%WE%>> Download_Queue.bat
if /i "%WJ%" EQU "*" echo SET WJ=%WJ%>> Download_Queue.bat
if /i "%NU%" EQU "*" echo SET NU=%NU%>> Download_Queue.bat
if /i "%NE%" EQU "*" echo SET NE=%NE%>> Download_Queue.bat
if /i "%NJ%" EQU "*" echo SET NJ=%NJ%>> Download_Queue.bat
if /i "%WSU%" EQU "*" echo SET WSU=%WSU%>> Download_Queue.bat
if /i "%WSE%" EQU "*" echo SET WSE=%WSE%>> Download_Queue.bat
if /i "%WSJ%" EQU "*" echo SET WSJ=%WSJ%>> Download_Queue.bat
if /i "%M10%" EQU "*" echo SET M10=%M10%>> Download_Queue.bat
if /i "%IOS9%" EQU "*" echo SET IOS9=%IOS9%>> Download_Queue.bat
if /i "%IOS12%" EQU "*" echo SET IOS12=%IOS12%>> Download_Queue.bat
if /i "%IOS13%" EQU "*" echo SET IOS13=%IOS13%>> Download_Queue.bat
if /i "%IOS14%" EQU "*" echo SET IOS14=%IOS14%>> Download_Queue.bat
if /i "%IOS15%" EQU "*" echo SET IOS15=%IOS15%>> Download_Queue.bat
if /i "%IOS17%" EQU "*" echo SET IOS17=%IOS17%>> Download_Queue.bat
if /i "%IOS21%" EQU "*" echo SET IOS21=%IOS21%>> Download_Queue.bat
if /i "%IOS22%" EQU "*" echo SET IOS22=%IOS22%>> Download_Queue.bat
if /i "%IOS28%" EQU "*" echo SET IOS28=%IOS28%>> Download_Queue.bat
if /i "%IOS31%" EQU "*" echo SET IOS31=%IOS31%>> Download_Queue.bat
if /i "%IOS33%" EQU "*" echo SET IOS33=%IOS33%>> Download_Queue.bat
if /i "%IOS34%" EQU "*" echo SET IOS34=%IOS34%>> Download_Queue.bat
if /i "%IOS35%" EQU "*" echo SET IOS35=%IOS35%>> Download_Queue.bat
if /i "%IOS36%" EQU "*" echo SET IOS36=%IOS36%>> Download_Queue.bat
if /i "%IOS36v3608%" EQU "*" echo SET IOS36v3608=%IOS36v3608%>> Download_Queue.bat
if /i "%IOS37%" EQU "*" echo SET IOS37=%IOS37%>> Download_Queue.bat
if /i "%IOS38%" EQU "*" echo SET IOS38=%IOS38%>> Download_Queue.bat
if /i "%IOS41%" EQU "*" echo SET IOS41=%IOS41%>> Download_Queue.bat
if /i "%IOS48v4124%" EQU "*" echo SET IOS48v4124=%IOS48v4124%>> Download_Queue.bat
if /i "%IOS43%" EQU "*" echo SET IOS43=%IOS43%>> Download_Queue.bat
if /i "%IOS45%" EQU "*" echo SET IOS45=%IOS45%>> Download_Queue.bat
if /i "%IOS46%" EQU "*" echo SET IOS46=%IOS46%>> Download_Queue.bat
if /i "%IOS53%" EQU "*" echo SET IOS53=%IOS53%>> Download_Queue.bat
if /i "%IOS55%" EQU "*" echo SET IOS55=%IOS55%>> Download_Queue.bat
if /i "%IOS56%" EQU "*" echo SET IOS56=%IOS56%>> Download_Queue.bat
if /i "%IOS57%" EQU "*" echo SET IOS57=%IOS57%>> Download_Queue.bat
if /i "%IOS58%" EQU "*" echo SET IOS58=%IOS58%>> Download_Queue.bat
if /i "%IOS61%" EQU "*" echo SET IOS61=%IOS61%>> Download_Queue.bat

if /i "%A0e%" EQU "*" echo SET A0e=%A0e%>> Download_Queue.bat
if /i "%A01%" EQU "*" echo SET A01=%A01%>> Download_Queue.bat

if /i "%A0e_70%" EQU "*" echo SET A0e_70=%A0e_70%>> Download_Queue.bat
if /i "%A01%" EQU "*" echo SET A01__60=%A01_60%>> Download_Queue.bat
if /i "%A0e_60%" EQU "*" echo SET A0e_60=%A0e_60%>> Download_Queue.bat
if /i "%A01%" EQU "*" echo SET A01=%A01%>> Download_Queue.bat
if /i "%A0c%" EQU "*" echo SET A0c=%A0c%>> Download_Queue.bat

if /i "%A40%" EQU "*" echo SET A40=%A40%>> Download_Queue.bat
if /i "%A42%" EQU "*" echo SET A42=%A42%>> Download_Queue.bat
if /i "%A45%" EQU "*" echo SET A45=%A45%>> Download_Queue.bat
if /i "%A70%" EQU "*" echo SET A70=%A70%>> Download_Queue.bat
if /i "%A72%" EQU "*" echo SET A72=%A72%>> Download_Queue.bat
if /i "%A75%" EQU "*" echo SET A75=%A75%>> Download_Queue.bat
if /i "%A78%" EQU "*" echo SET A78=%A78%>> Download_Queue.bat
if /i "%A7b%" EQU "*" echo SET A7b=%A7b%>> Download_Queue.bat
if /i "%A7e%" EQU "*" echo SET A7e=%A7e%>> Download_Queue.bat
if /i "%A84%" EQU "*" echo SET A84=%A84%>> Download_Queue.bat
if /i "%A87%" EQU "*" echo SET A87=%A87%>> Download_Queue.bat
if /i "%A8a%" EQU "*" echo SET A8a=%A8a%>> Download_Queue.bat

if /i "%A81%" EQU "*" echo SET A81=%A81%>> Download_Queue.bat
if /i "%A8d%" EQU "*" echo SET A8d=%A8d%>> Download_Queue.bat
if /i "%A9d%" EQU "*" echo SET A9d=%A9d%>> Download_Queue.bat

if /i "%A94%" EQU "*" echo SET A94=%A94%>> Download_Queue.bat
if /i "%A97%" EQU "*" echo SET A97=%A97%>> Download_Queue.bat
if /i "%A9a%" EQU "*" echo SET A9a=%A9a%>> Download_Queue.bat
if /i "%cIOS202[37]-v5%" EQU "*" echo SET cIOS202[37]-v5=%cIOS202[37]-v5%>> Download_Queue.bat
if /i "%cIOS202[38]-v5%" EQU "*" echo SET cIOS202[38]-v5=%cIOS202[38]-v5%>> Download_Queue.bat
if /i "%cIOS202[57]-v5%" EQU "*" echo SET cIOS202[57]-v5=%cIOS202[57]-v5%>> Download_Queue.bat
if /i "%cIOS222[38]-v4%" EQU "*" echo SET cIOS222[38]-v4=%cIOS222[38]-v4%>> Download_Queue.bat

if /i "%cIOS223[37-38]-v4%" EQU "*" echo SET cIOS223[37-38]-v4=%cIOS223[37-38]-v4%>> Download_Queue.bat

if /i "%cIOS222[38]-v5%" EQU "*" echo SET cIOS222[38]-v5=%cIOS222[38]-v5%>> Download_Queue.bat
if /i "%cIOS223[37]-v5%" EQU "*" echo SET cIOS223[37]-v5=%cIOS223[37]-v5%>> Download_Queue.bat
if /i "%cIOS223[57]-v5%" EQU "*" echo SET cIOS223[57]-v5=%cIOS223[57]-v5%>> Download_Queue.bat
if /i "%cIOS224[37]-v5%" EQU "*" echo SET cIOS224[37]-v5=%cIOS224[37]-v5%>> Download_Queue.bat
if /i "%cIOS224[57]-v5%" EQU "*" echo SET cIOS224[57]-v5=%cIOS224[57]-v5%>> Download_Queue.bat
if /i "%cIOS249-v14%" EQU "*" echo SET cIOS249-v14=%cIOS249-v14%>> Download_Queue.bat
if /i "%cIOS249-v17b%" EQU "*" echo SET cIOS249-v17b=%cIOS249-v17b%>> Download_Queue.bat
if /i "%cIOS249[37]-v19%" EQU "*" echo SET cIOS249[37]-v19=%cIOS249[37]-v19%>> Download_Queue.bat
if /i "%cIOS249[38]-v19%" EQU "*" echo SET cIOS249[38]-v19=%cIOS249[38]-v19%>> Download_Queue.bat
if /i "%cIOS249[57]-v19%" EQU "*" echo SET cIOS249[57]-v19=%cIOS249[57]-v19%>> Download_Queue.bat
if /i "%cIOS250-v14%" EQU "*" echo SET cIOS250-v14=%cIOS250-v14%>> Download_Queue.bat
if /i "%cIOS250-v17b%" EQU "*" echo SET cIOS250-v17b=%cIOS250-v17b%>> Download_Queue.bat
if /i "%cIOS250[37]-v19%" EQU "*" echo SET cIOS250[37]-v19=%cIOS250[37]-v19%>> Download_Queue.bat
if /i "%cIOS250[38]-v19%" EQU "*" echo SET cIOS250[38]-v19=%cIOS250[38]-v19%>> Download_Queue.bat
if /i "%cIOS250[57]-v19%" EQU "*" echo SET cIOS250[57]-v19=%cIOS250[57]-v19%>> Download_Queue.bat
if /i "%cIOS249[38]-v20%" EQU "*" echo SET cIOS249[38]-v20=%cIOS249[38]-v20%>> Download_Queue.bat
if /i "%cIOS250[38]-v20%" EQU "*" echo SET cIOS250[38]-v20=%cIOS250[38]-v20%>> Download_Queue.bat
if /i "%cIOS249[56]-v20%" EQU "*" echo SET cIOS249[56]-v20=%cIOS249[56]-v20%>> Download_Queue.bat
if /i "%cIOS250[56]-v20%" EQU "*" echo SET cIOS250[56]-v20=%cIOS250[56]-v20%>> Download_Queue.bat
if /i "%cIOS249[57]-v20%" EQU "*" echo SET cIOS249[57]-v20=%cIOS249[57]-v20%>> Download_Queue.bat
if /i "%cIOS250[57]-v20%" EQU "*" echo SET cIOS250[57]-v20=%cIOS250[57]-v20%>> Download_Queue.bat
if /i "%cIOS249[37]-v21%" EQU "*" echo SET cIOS249[37]-v21=%cIOS249[37]-v21%>> Download_Queue.bat
if /i "%cIOS250[37]-v21%" EQU "*" echo SET cIOS250[37]-v21=%cIOS250[37]-v21%>> Download_Queue.bat
if /i "%cIOS249[38]-v21%" EQU "*" echo SET cIOS249[38]-v21=%cIOS249[38]-v21%>> Download_Queue.bat
if /i "%cIOS250[38]-v21%" EQU "*" echo SET cIOS250[38]-v21=%cIOS250[38]-v21%>> Download_Queue.bat
if /i "%cIOS249[53]-v21%" EQU "*" echo SET cIOS249[53]-v21=%cIOS249[53]-v21%>> Download_Queue.bat
if /i "%cIOS250[53]-v21%" EQU "*" echo SET cIOS250[53]-v21=%cIOS250[53]-v21%>> Download_Queue.bat
if /i "%cIOS249[55]-v21%" EQU "*" echo SET cIOS249[55]-v21=%cIOS249[55]-v21%>> Download_Queue.bat
if /i "%cIOS250[55]-v21%" EQU "*" echo SET cIOS250[55]-v21=%cIOS250[55]-v21%>> Download_Queue.bat
if /i "%cIOS249[56]-v21%" EQU "*" echo SET cIOS249[56]-v21=%cIOS249[56]-v21%>> Download_Queue.bat
if /i "%cIOS250[56]-v21%" EQU "*" echo SET cIOS250[56]-v21=%cIOS250[56]-v21%>> Download_Queue.bat
if /i "%cIOS249[57]-v21%" EQU "*" echo SET cIOS249[57]-v21=%cIOS249[57]-v21%>> Download_Queue.bat
if /i "%cIOS250[57]-v21%" EQU "*" echo SET cIOS250[57]-v21=%cIOS250[57]-v21%>> Download_Queue.bat
if /i "%cIOS249[58]-v21%" EQU "*" echo SET cIOS249[58]-v21=%cIOS249[58]-v21%>> Download_Queue.bat
if /i "%cIOS250[58]-v21%" EQU "*" echo SET cIOS250[58]-v21=%cIOS250[58]-v21%>> Download_Queue.bat
if /i "%cIOS249[37]-d2x-v6%" EQU "*" echo SET cIOS249[37]-d2x-v6=%cIOS249[37]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS249[38]-d2x-v6%" EQU "*" echo SET cIOS249[38]-d2x-v6=%cIOS249[38]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS249[56]-d2x-v6%" EQU "*" echo SET cIOS249[56]-d2x-v6=%cIOS249[56]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS249[53]-d2x-v6%" EQU "*" echo SET cIOS249[53]-d2x-v6=%cIOS249[53]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS249[55]-d2x-v6%" EQU "*" echo SET cIOS249[55]-d2x-v6=%cIOS249[55]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS249[57]-d2x-v6%" EQU "*" echo SET cIOS249[57]-d2x-v6=%cIOS249[57]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS249[58]-d2x-v6%" EQU "*" echo SET cIOS249[58]-d2x-v6=%cIOS249[58]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS250[37]-d2x-v6%" EQU "*" echo SET cIOS250[37]-d2x-v6=%cIOS250[37]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS250[38]-d2x-v6%" EQU "*" echo SET cIOS250[38]-d2x-v6=%cIOS250[38]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS250[53]-d2x-v6%" EQU "*" echo SET cIOS250[53]-d2x-v6=%cIOS250[53]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS250[55]-d2x-v6%" EQU "*" echo SET cIOS250[55]-d2x-v6=%cIOS250[55]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS250[56]-d2x-v6%" EQU "*" echo SET cIOS250[56]-d2x-v6=%cIOS250[56]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS250[57]-d2x-v6%" EQU "*" echo SET cIOS250[57]-d2x-v6=%cIOS250[57]-d2x-v6%>> Download_Queue.bat
if /i "%cIOS250[58]-d2x-v6%" EQU "*" echo SET cIOS250[58]-d2x-v6=%cIOS250[58]-d2x-v6%>> Download_Queue.bat
if /i "%RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2%" EQU "*" echo SET RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=%RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2%>> Download_Queue.bat
if /i "%RVL-cmios-v4_WiiGator_GCBL_v0.2%" EQU "*" echo SET RVL-cmios-v4_WiiGator_GCBL_v0.2=%RVL-cmios-v4_WiiGator_GCBL_v0.2%>> Download_Queue.bat
if /i "%RVL-cmios-v4_Waninkoko_rev5%" EQU "*" echo SET RVL-cmios-v4_Waninkoko_rev5=%RVL-cmios-v4_Waninkoko_rev5%>> Download_Queue.bat

if /i "%DarkWii_Red_4.3U%" EQU "*" echo SET DarkWii_Red_4.3U=%DarkWii_Red_4.3U%>> Download_Queue.bat
if /i "%DarkWii_Red_4.2U%" EQU "*" echo SET DarkWii_Red_4.2U=%DarkWii_Red_4.2U%>> Download_Queue.bat
if /i "%DarkWii_Red_4.1U%" EQU "*" echo SET DarkWii_Red_4.1U=%DarkWii_Red_4.1U%>> Download_Queue.bat
if /i "%DarkWii_Red_4.3E%" EQU "*" echo SET DarkWii_Red_4.3E=%DarkWii_Red_4.3E%>> Download_Queue.bat
if /i "%DarkWii_Red_4.2E%" EQU "*" echo SET DarkWii_Red_4.2E=%DarkWii_Red_4.2E%>> Download_Queue.bat
if /i "%DarkWii_Red_4.1E%" EQU "*" echo SET DarkWii_Red_4.1E=%DarkWii_Red_4.1E%>> Download_Queue.bat
if /i "%DarkWii_Red_4.3J%" EQU "*" echo SET DarkWii_Red_4.3J=%DarkWii_Red_4.3J%>> Download_Queue.bat
if /i "%DarkWii_Red_4.2J%" EQU "*" echo SET DarkWii_Red_4.2J=%DarkWii_Red_4.2J%>> Download_Queue.bat
if /i "%DarkWii_Red_4.1J%" EQU "*" echo SET DarkWii_Red_4.1J=%DarkWii_Red_4.1J%>> Download_Queue.bat
if /i "%DarkWii_Red_4.3K%" EQU "*" echo SET DarkWii_Red_4.3K=%DarkWii_Red_4.3K%>> Download_Queue.bat
if /i "%DarkWii_Red_4.2K%" EQU "*" echo SET DarkWii_Red_4.2K=%DarkWii_Red_4.2K%>> Download_Queue.bat
if /i "%DarkWii_Red_4.1K%" EQU "*" echo SET DarkWii_Red_4.1K=%DarkWii_Red_4.1K%>> Download_Queue.bat

if /i "%DarkWii_Green_4.3U%" EQU "*" echo SET DarkWii_Green_4.3U=%DarkWii_Green_4.3U%>> Download_Queue.bat
if /i "%DarkWii_Green_4.2U%" EQU "*" echo SET DarkWii_Green_4.2U=%DarkWii_Green_4.2U%>> Download_Queue.bat
if /i "%DarkWii_Green_4.1U%" EQU "*" echo SET DarkWii_Green_4.1U=%DarkWii_Green_4.1U%>> Download_Queue.bat
if /i "%DarkWii_Green_4.3E%" EQU "*" echo SET DarkWii_Green_4.3E=%DarkWii_Green_4.3E%>> Download_Queue.bat
if /i "%DarkWii_Green_4.2E%" EQU "*" echo SET DarkWii_Green_4.2E=%DarkWii_Green_4.2E%>> Download_Queue.bat
if /i "%DarkWii_Green_4.1E%" EQU "*" echo SET DarkWii_Green_4.1E=%DarkWii_Green_4.1E%>> Download_Queue.bat
if /i "%DarkWii_Green_4.3J%" EQU "*" echo SET DarkWii_Green_4.3J=%DarkWii_Green_4.3J%>> Download_Queue.bat
if /i "%DarkWii_Green_4.2J%" EQU "*" echo SET DarkWii_Green_4.2J=%DarkWii_Green_4.2J%>> Download_Queue.bat
if /i "%DarkWii_Green_4.1J%" EQU "*" echo SET DarkWii_Green_4.1J=%DarkWii_Green_4.1J%>> Download_Queue.bat
if /i "%DarkWii_Green_4.3K%" EQU "*" echo SET DarkWii_Green_4.3K=%DarkWii_Green_4.3K%>> Download_Queue.bat
if /i "%DarkWii_Green_4.2K%" EQU "*" echo SET DarkWii_Green_4.2K=%DarkWii_Green_4.2K%>> Download_Queue.bat
if /i "%DarkWii_Green_4.1K%" EQU "*" echo SET DarkWii_Green_4.1K=%DarkWii_Green_4.1K%>> Download_Queue.bat

sfk filter Download_Queue.bat -unique -write -yes>nul


if not exist temp\DLGotosADV.txt goto:quickskip
::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\DLGotosADV.txt) do call :process1 %%A
goto:quickskip
:process1
set AdvDLX=%*
set /a AdvNumberCOPY2=%AdvNumberCOPY2%+1
echo "echo %AdvDLX:~0,10%%AdvNumberCOPY2%.batredirectredirecttemp\DLGotosADV.txt">>Download_Queue.bat
goto:EOF
:quickskip


if not exist temp\DLnamesADV.txt goto:quickskip
::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\DLnamesADV.txt) do call :process2 %%A
goto:quickskip
:process2
echo "echo %* redirectredirecttemp\DLnamesADV.txt">>Download_Queue.bat
goto:EOF
:quickskip



if not exist temp\DLGotosADV.txt goto:quickskip
copy /y temp\DLGotosADV.txt temp\DLGotosADV-copy.txt>nul
::Loop through the the following once for EACH line in *.txt
:doitagain
for /F "tokens=*" %%A in (temp\DLGotosADV-copy.txt) do call :process3 %%A
goto:quickskip
:process3
set AdvDLX=%*
set /a AdvNumberCOPY3=%AdvNumberCOPY3%+1

echo "if exist %AdvDLX:~0,10%%AdvNumberCOPY3%.bat del %AdvDLX:~0,10%%AdvNumberCOPY3%.batredirectnul">>Download_Queue.bat

for /F "tokens=*" %%A in (%AdvDLX%) do call :process4 %%A
goto:tinyskip
:process4

echo "echo quote%*quoteredirectredirect%AdvDLX:~0,10%%AdvNumberCOPY3%.bat">>Download_Queue.bat


goto:EOF
:tinyskip

sfk filter -quiet temp\DLGotosADV-copy.txt -le!"%AdvDLX:~5%" -write -yes

echo "sfk filter -quiet %AdvDLX:~0,10%%AdvNumberCOPY3%.bat -rep _quotequotequote__ -write -yes">>Download_Queue.bat


goto:doitagain
::goto:EOF
:quickskip

echo ":endofqueue">>Download_Queue.bat

sfk filter Download_Queue.bat -rep _"redirect"_">"_ -write -yes>nul
sfk filter -quiet Download_Queue.bat -rep _"""__ -write -yes
sfk filter -quiet -spat Download_Queue.bat -rep _quote_\x22_ -rep _@_%%_ -write -yes

sfk filter -quiet Download_Queue.bat -rep _"set AdvNumber="*_"set AdvNumber=%AdvNumberCOPY%"_ -write -yes


::sfk filter Download_Queue.bat -spat -rep _@_%%_ -write -yes>nul



if exist Download_Queue.bat echo                                  Download Queue Saved
@ping 127.0.0.1 -n 2 -w 1000> nul
if /i "%LIST%" EQU "S" goto:LIST
if /i "%SETTINGS%" EQU "S" goto:DOWNLOADQUEUE
if /i "%SETTINGS%" EQU "S+" goto:DOWNLOADQUEUE
if /i "%FINISH%" EQU "S" goto:FINISH
if /i "%FINISH%" EQU "S+" goto:FINISH






::...................................Copy (rename %Drive%\wad if applicable)...............................
:COPY
if not exist "%Drive%"\WAD goto:DLSettings
if /i "%USBCONFIG%" EQU "USB" goto:DLSettings
::if /i "%DRIVE%" NEQ "COPY_TO_SD" goto:DLSettings

Set COPY=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo      %Drive%\WAD Folder already exists, what would you like to do?
echo.
echo           M = Merge downloads with existing %Drive%\WAD Folder.
echo               Duplicates will be skipped.
echo.
echo           R = Rename the existing %Drive%\WAD Folder to %Drive%\WAD#
echo               and begin downloading.
echo.
echo           C = Cancel/Main Menu
echo.
echo           E = Exit
echo.
set /p COPY=     Enter Selection Here: 

if /i "%COPY%" EQU "M" goto:DLSettings
if /i "%COPY%" EQU "E" EXIT
if /i "%COPY%" EQU "C" goto:MENU

if /i "%COPY%" NEQ "R" echo You Have Entered an Incorrect Key
if /i "%COPY%" NEQ "R" @ping 127.0.0.1 -n 2 -w 1000> nul
if /i "%COPY%" NEQ "R" goto:COPY

:COPY2
SET /a COUNT=%COUNT%+1
if exist "%Drive%"\WAD%COUNT% goto:COPY2
move "%Drive%"\WAD "%Drive%"\WAD%COUNT%>nul
::rename "%Drive%"\WAD WAD%COUNT%
if /i "%LIST%" EQU "R" goto:LIST
if /i "%OLDLIST%" EQU "R" goto:OLDLIST
if /i "%list3%" EQU "R" goto:LIST3
if /i "%list4%" EQU "R" goto:LIST4
goto:DLSETTINGS


::.................................................ACTUAL DOWNLOAD CODE...........................................................................
:DOWNLOADSTART
if /i "%loadorgo%" EQU "load" goto:ADVPAGE2
if /i "%loadorgo%" EQU "load4queue" goto:processDLCheck2
if /i "%loadorgo%" EQU "load4switch" goto:processDLCheck2switch
set retry=1
set attempt=1


::DBUPDATE.bat check (added in v4.5.0)
::instead of putting out ModMii updates for minor things, the update check can be used to create\download a DBUPDATE.bat file to modify variables like "wadname", "md5", etc.
if exist "temp\DBUPDATE%currentversion%.bat" call "temp\DBUPDATE%currentversion%.bat"



:DOWNLOADSTART2

::change drive to usb if applicable
set DRIVE=%REALDRIVE%
if /i "%USBCONFIG%" NEQ "USB" goto:skipchange

if /i "%WADNAME%" EQU "WiiBackupManager.zip" set DRIVE=%DRIVEU%
if /i "%WADNAME%" EQU "Configurable USB-Loader (Most recent Full 249 version)" set DRIVE=%DRIVEU%
if /i "%PATH1%" EQU "apps\WiiFlow\" set DRIVE=%DRIVEU%
:skipchange

if /i "%MENU1%" EQU "S" set DRIVE=temp


if not exist "%Drive%" mkdir "%Drive%"
:actualDL
if /i "%retry%" EQU "1" SET /a CURRENTDL=%CURRENTDL%+1


if /i "%CURRENTDL%" NEQ "1" echo.
if /i "%retry%" EQU "1" sfk echo [Red]Downloading %CURRENTDL% of %DLTOTAL%: %name%
if /i "%retry%" NEQ "1" sfk echo [Yellow]Re-Downloading %CURRENTDL% of %DLTOTAL%: %name%
echo.

::---------Exceptions----------------
if /i "%category%" EQU "cfg" goto:CFGDOWNLOADER
if /i "%category%" EQU "cfgr" goto:CFGRDOWNLOADER
if /i "%category%" EQU "TANTRIC" goto:TANTRIC
if /i "%category%" EQU "GOOGLEUPDATE" goto:GOOGLEUPDATE
if /i "%category%" EQU "CHEATS" goto:CHEATS
if /i "%category%" EQU "ManualUpdate" goto:MANUALUPDATE
if /i "%category%" EQU "fullextract" goto:fullextract
if /i "%category%" EQU "themes" goto:THEMES
if /i "%basewad%" NEQ "none" goto:CIOSMAKER
if /i "%name%" EQU "Hackmii Installer" goto:wget
if /i "%category%" EQU "userdefined" goto:CustomDL
if /i "%wadname%" EQU "PriiloaderHacks.zip" goto:DownloadhacksToRoot




::-----------Exceptions for DL Wizard Only----------
if /i "%MENU1%" NEQ "W" goto:skipwizardexceptions

if /i "%name%" EQU "IOS36" goto:savetoroot

:skipwizardexceptions
::----------------------------


::-----ROOT SAVE OPTION for IOSs (does not apply to wizard)-----
if /i "%MENU1%" EQU "W" goto:skip
if /i "%category%" EQU "ios" goto:noskip
if /i "%category%" EQU "patchios" (goto:noskip) else (goto:skip)
:noskip
if /i "%ROOTSAVE%" EQU "ON" (goto:savetoroot) else (goto:nusd)
:skip


if /i "%code1%" EQU "SNEEKAPP" goto:DownloadApp
if /i "%code1%" EQU "MYMAPP" goto:DownloadApp
if /i "%code1%" EQU "URL" goto:DownloadURL



::--------------------------NUSD.EXE Downloader---------------
:nusd
if not exist "%Drive%"\WAD mkdir "%Drive%"\WAD

::----if exist and fails md5 check, delete and redownload----
:checkifwadexist
if not exist "%Drive%"\WAD\%wadname% goto:nocheckexisting
set md5check=
set md5altcheck=
sfk md5 -quiet -verify %md5% "%Drive%"\WAD\%wadname%
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

sfk md5 -quiet -verify %md5alt% "%Drive%"\WAD\%wadname%
if errorlevel 1 set md5altcheck=fail
IF "%md5altcheck%"=="" set md5altcheck=pass
if /i "%md5altcheck%" NEQ "fail" goto:pass

:fail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%"\WAD\%wadname%
if exist temp\%wadname% del temp\%wadname%
if exist temp\%code1%\%code2%\v%version% rd /s /q temp\%code1%\%code2%\v%version%
goto:DOWNLOADSTART2

:pass
if /i "%OPTION1%" EQU "OFF" goto:no01check
if not exist temp\%code1%\%code2%\v%version% goto:nocheckexisting

if /i "%OPTION1%" EQU "ON" goto:option1on
if /i "%OPTION1%" EQU "ALL" (goto:option1on) else (goto:option1noton)
:option1on
if not exist "%Drive%"\%code1%\%code2%\v%version% mkdir "%Drive%"\%code1%\%code2%\v%version%
copy /y temp\%code1%\%code2%\v%version% "%Drive%"\%code1%\%code2%\v%version% >nul
:option1noton

if /i "%OPTION1%" EQU "NUS" goto:option1NUS
if /i "%OPTION1%" EQU "ALL" (goto:option1NUS) else (goto:no01check)
:option1NUS
if not exist "%Drive%"\NUS\%code1%%code2%v%version% mkdir "%Drive%"\NUS\%code1%%code2%v%version%
copy /y temp\%code1%\%code2%\v%version% "%Drive%"\NUS\%code1%%code2%v%version% >nul
:no01check

sfk echo [Green]This file already exists and has been verified, Skipping download
echo.
set alreadyexists=yes
if /i "%md5check%" EQU "pass" echo %md5% *WAD\%wadname%>> "%Drive%"\Download_Log.md5
if /i "%md5altcheck%" EQU "pass" echo %md5alt% *WAD\%wadname%>> "%Drive%"\Download_Log.md5
goto:NEXT
:nocheckexisting






::--skip downloading IOS60 as base if it already exists--
if /i "%category%" NEQ "patchios" goto:notpatchingIOS60
if /i "%code2%" NEQ "0000003C" goto:notpatchingIOS60

if exist temp\IOS60v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS60v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\WAD\%wadname%>nul
if exist "%Drive%"\WAD\%wadname% goto:patchios60now
if exist temp\IOS20v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS20v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\WAD\%wadname%>nul
if exist "%Drive%"\WAD\%wadname% goto:patchios60now
if exist temp\IOS30v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS30v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\WAD\%wadname%>nul
if exist "%Drive%"\WAD\%wadname% goto:patchios60now
if exist temp\IOS70v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS70v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\WAD\%wadname%>nul
if exist "%Drive%"\WAD\%wadname% goto:patchios60now
if exist temp\IOS80v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS80v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\WAD\%wadname%>nul
if exist "%Drive%"\WAD\%wadname% goto:patchios60now
if exist temp\IOS11v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS11v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\WAD\%wadname%>nul
if exist "%Drive%"\WAD\%wadname% goto:patchios60now
if exist temp\IOS40v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS40v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\WAD\%wadname%>nul
if exist "%Drive%"\WAD\%wadname% goto:patchios60now
goto:notpatchingIOS60


:patchios60now
patchios "%Drive%"\WAD\%wadname% -slot %ciosslot% -v %ciosversion%
goto:wadverifyretry


:notpatchingIOS60
::SAVE TO WAD FOLDER ONLY

if not exist "%Drive%"\WAD mkdir "%Drive%"\WAD

if exist temp\%wadname% goto:AlreadyinTemp
echo If you encounter long periods of inactivity run UnfreezeMii.bat to continue
echo.

nusd %code1%%code2% %version%
move /y %code1%%code2%\%code1%%code2%.wad temp\%wadname%>nul

::Patchios (mostly for system menu IOSs)
if /i "%category%" NEQ "patchios" goto:skippingpatchios
patchios temp\%wadname% -FS -ES -NP -slot %ciosslot% -v %ciosversion%
:skippingpatchios

if not exist temp\%code1%\%code2%\v%version% mkdir temp\%code1%\%code2%\v%version%
copy /y %code1%%code2% temp\%code1%\%code2%\v%version%\ >nul
rd /s /q %code1%%code2%

:AlreadyinTemp
copy /y temp\%wadname% "%Drive%"\WAD\%wadname% >nul

if /i "%OPTION1%" EQU "ON" goto:option1on
if /i "%OPTION1%" EQU "ALL" (goto:option1on) else (goto:option1noton)
:option1on
if not exist "%Drive%"\%code1%\%code2%\v%version% mkdir "%Drive%"\%code1%\%code2%\v%version%
copy /y temp\%code1%\%code2%\v%version% "%Drive%"\%code1%\%code2%\v%version% >nul
:option1noton

if /i "%OPTION1%" EQU "NUS" goto:option1NUS
if /i "%OPTION1%" EQU "ALL" (goto:option1NUS) else (goto:option1notNUS)
:option1NUS
if not exist "%Drive%"\NUS\%code1%%code2%v%version% mkdir "%Drive%"\NUS\%code1%%code2%v%version%
copy /y temp\%code1%\%code2%\v%version% "%Drive%"\NUS\%code1%%code2%v%version% >nul
:option1notNUS

:wadverifyretry
::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%"\WAD\%wadname% goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
set md5check=
set md5altcheck=
sfk md5 -quiet -verify %md5% "%Drive%"\WAD\%wadname%
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass
sfk md5 -quiet -verify %md5alt% "%Drive%"\WAD\%wadname%
if errorlevel 1 set md5altcheck=fail
IF "%md5altcheck%"=="" set md5altcheck=pass
if /i "%md5altcheck%" NEQ "fail" goto:pass

:fail
echo.
::---prevent cIOSs from downloading twice when hex editing disabled---
if /i "%basewad%" EQU "none" goto:notacios
if /i "%HEXEDIT%" EQU "Y" goto:notacios
sfk echo [Yellow] Unable to verify because ModMii's Hex Editing option is not enabled
echo.
if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%DRIVE%\WAD\%wadname%" -write -yes
if /i "%name:~0,17%" NEQ "Advanced Download" echo "%DRIVE%\WAD\%wadname%: Found but unable to verify">>temp\simplelog.txt
sfk filter -quiet "temp\simplelog.txt" -rep _"""__ -write -yes
if exist "%Drive%"\Download_Log.md5 sfk filter -quiet "%Drive%"\Download_Log.md5 -ls!"%md5%" -write -yes
goto:NEXT
:notacios
:------
if /i "%attempt%" NEQ "1" goto:multiplefail
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del "%Drive%"\WAD\%wadname%
if exist temp\%wadname% del temp\%wadname%
if exist temp\%code1%\%code2%\v%version% rd /s /q temp\%code1%\%code2%\v%version%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
set multiplefail=Y
echo.
echo %md5% *WAD\%wadname%>> "%Drive%"\Download_Log.md5
goto:NEXT

:pass
echo.
sfk echo [Green]Download Successful
echo.
if /i "%md5check%" EQU "pass" echo %md5% *WAD\%wadname%>> "%Drive%"\Download_Log.md5
if /i "%md5altcheck%" EQU "pass" echo %md5alt% *WAD\%wadname%>> "%Drive%"\Download_Log.md5
goto:NEXT




:savetoroot

::----if exist and fails md5 check, delete and redownload----
if exist "%Drive%"\%wadname% (goto:checkexisting) else (goto:nocheckexisting)
:checkexisting
set md5check=
set md5altcheck=
sfk md5 -quiet -verify %md5% "%Drive%"\%wadname%
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

sfk md5 -quiet -verify %md5alt% "%Drive%"\%wadname%
if errorlevel 1 set md5altcheck=fail
IF "%md5altcheck%"=="" set md5altcheck=pass
if /i "%md5altcheck%" NEQ "fail" goto:pass

:fail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%"\%wadname%
if exist temp\%wadname% del temp\%wadname%
if exist temp\%code1%\%code2%\v%version% rd /s /q temp\%code1%\%code2%\v%version%
goto:DOWNLOADSTART2

:pass
if /i "%OPTION1%" EQU "OFF" goto:no01check
if not exist temp\%code1%\%code2%\v%version% goto:nocheckexisting

if /i "%OPTION1%" EQU "ON" goto:option1on
if /i "%OPTION1%" EQU "ALL" (goto:option1on) else (goto:option1noton)
:option1on
if not exist "%Drive%"\%code1%\%code2%\v%version% mkdir "%Drive%"\%code1%\%code2%\v%version%
copy /y temp\%code1%\%code2%\v%version% "%Drive%"\%code1%\%code2%\v%version% >nul
:option1noton

if /i "%OPTION1%" EQU "NUS" goto:option1NUS
if /i "%OPTION1%" EQU "ALL" (goto:option1NUS) else (goto:no01check)
:option1NUS
if not exist "%Drive%"\NUS\%code1%%code2%v%version% mkdir "%Drive%"\NUS\%code1%%code2%v%version%
copy /y temp\%code1%\%code2%\v%version% "%Drive%"\NUS\%code1%%code2%v%version% >nul
:no01check

sfk echo [Green]This file already exists and has been verified, Skipping download
echo.
set alreadyexists=yes
if /i "%md5check%" EQU "pass" echo %md5% *%wadname%>> "%Drive%"\Download_Log.md5
if /i "%md5altcheck%" EQU "pass" echo %md5alt% *%wadname%>> "%Drive%"\Download_Log.md5

goto:NEXT
:nocheckexisting




::--skip downloading IOS60 as base if it already exists--
if /i "%category%" NEQ "patchios" goto:notpatchingIOS60
if /i "%code2%" NEQ "0000003C" goto:notpatchingIOS60

if exist temp\IOS60v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS60v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\%wadname%>nul
if exist "%Drive%"\%wadname% goto:patchios60now
if exist temp\IOS20v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS20v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\%wadname%>nul
if exist "%Drive%"\%wadname% goto:patchios60now
if exist temp\IOS30v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS30v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\%wadname%>nul
if exist "%Drive%"\%wadname% goto:patchios60now
if exist temp\IOS70v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS70v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\%wadname%>nul
if exist "%Drive%"\%wadname% goto:patchios60now
if exist temp\IOS80v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS80v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\%wadname%>nul
if exist "%Drive%"\%wadname% goto:patchios60now
if exist temp\IOS11v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS11v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\%wadname%>nul
if exist "%Drive%"\%wadname% goto:patchios60now
if exist temp\IOS40v16174(IOS60v6174[FS-ES-NP]).wad copy /y temp\IOS40v16174(IOS60v6174[FS-ES-NP]).wad "%Drive%"\%wadname%>nul
if exist "%Drive%"\%wadname% goto:patchios60now
goto:notpatchingIOS60


:patchios60now
patchios "%Drive%"\%wadname% -slot %ciosslot% -v %ciosversion%
::echo %md5% *WAD\%wadname%>> "%Drive%"\Download_Log.md5
goto:checkretryroot

::SAVE TO ROOT FOLDER ONLY
:notpatchingIOS60


if exist temp\%wadname% goto:AlreadyinTemp
echo If you encounter long periods of inactivity run UnfreezeMii.bat to continue
echo.

nusd %code1%%code2% %version%
move /y %code1%%code2%\%code1%%code2%.wad temp\%wadname%>nul

::Patchios (mostly for system menu IOSs)
if /i "%category%" NEQ "patchios" goto:skippingpatchios
patchios temp\%wadname% -FS -ES -NP -slot %ciosslot% -v %ciosversion%
:skippingpatchios

if not exist temp\%code1%\%code2%\v%version% mkdir temp\%code1%\%code2%\v%version%
copy /y %code1%%code2% temp\%code1%\%code2%\v%version%\ >nul
rd /s /q %code1%%code2%

:AlreadyinTemp
if /i "%Drive%" NEQ "temp" copy /y temp\%wadname% "%Drive%"\%wadname% >nul

if /i "%OPTION1%" EQU "ON" goto:option1on
if /i "%OPTION1%" EQU "ALL" (goto:option1on) else (goto:option1noton)
:option1on
if not exist "%Drive%"\%code1%\%code2%\v%version% mkdir "%Drive%"\%code1%\%code2%\v%version%
copy /y temp\%code1%\%code2%\v%version% "%Drive%"\%code1%\%code2%\v%version% >nul
:option1noton

if /i "%OPTION1%" EQU "NUS" goto:option1NUS
if /i "%OPTION1%" EQU "ALL" (goto:option1NUS) else (goto:option1notNUS)
:option1NUS
if not exist "%Drive%"\NUS\%code1%%code2%v%version% mkdir "%Drive%"\NUS\%code1%%code2%v%version%
copy /y temp\%code1%\%code2%\v%version% "%Drive%"\NUS\%code1%%code2%v%version% >nul
:option1notNUS



:checkretryroot
::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%"\%wadname% goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
set md5check=
set md5altcheck=
sfk md5 -quiet -verify %md5% "%Drive%"\%wadname%
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

sfk md5 -quiet -verify %md5alt% "%Drive%"\%wadname%
if errorlevel 1 set md5altcheck=fail
IF "%md5altcheck%"=="" set md5altcheck=pass
if /i "%md5altcheck%" NEQ "fail" goto:pass

:fail
echo.
::---prevent cIOSs from downloading twice when hex editing disabled---
if /i "%basewad%" EQU "none" goto:notacios
if /i "%HEXEDIT%" EQU "Y" goto:notacios
sfk echo [Yellow] Unable to verify because ModMii's Hex Editing option is not enabled
echo.
if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%DRIVE%\%wadname%" -write -yes
if /i "%name:~0,17%" NEQ "Advanced Download" echo "%DRIVE%\%wadname%: Found but unable to verify">>temp\simplelog.txt
sfk filter -quiet "temp\simplelog.txt" -rep _"""__ -write -yes
if exist "%Drive%"\Download_Log.md5 sfk filter -quiet "%Drive%"\Download_Log.md5 -ls!"%md5%" -write -yes
goto:NEXT
:notacios
:------
if /i "%attempt%" NEQ "1" goto:multiplefail

sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del "%Drive%"\%wadname%
if exist temp\%wadname% del temp\%wadname%
if exist temp\%code1%\%code2%\v%version% rd /s /q temp\%code1%\%code2%\v%version%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
set multiplefail=Y
echo %md5% *%wadname%>> "%Drive%"\Download_Log.md5
goto:NEXT

:pass
echo.
sfk echo [Green]Download Successful
echo.
if /i "%md5check%" EQU "pass" echo %md5% *%wadname%>> "%Drive%"\Download_Log.md5
if /i "%md5altcheck%" EQU "pass" echo %md5alt% *%wadname%>> "%Drive%"\Download_Log.md5
goto:NEXT






::-------------------------------cIOS Maker-----------------------------------------------------
:CIOSMAKER

if "%wadname:~-4%" EQU ".wad" set wadname=%wadname:~0,-4%

::echo %md5% *WAD\%wadname%.wad>> "%Drive%"\Download_Log.md5

::----if exist and fails md5 check, delete and redownload----
if exist "%Drive%"\WAD\%wadname%.wad (goto:checkexisting) else (goto:nocheckexisting)
:checkexisting
set md5check=
sfk md5 -quiet -verify %md5% "%Drive%"\WAD\%wadname%.wad
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%"\WAD\%wadname%.wad
goto:DOWNLOADSTART2

:pass
sfk echo [Green]This file already exists and has been verified, Skipping download
echo.
set alreadyexists=yes
if /i "%md5check%" EQU "pass" echo %md5% *WAD\%wadname%.wad>> "%Drive%"\Download_Log.md5
goto:NEXT
:nocheckexisting



::missing modules folder error message and skip
if not exist modules sfk echo -spat [Yellow] Missing "modules" folder - Required to make cIOSs/cMIOSs
if not exist modules sfk echo -spat \x20 \x20 [Yellow] Redownload ModMii from tinyurl.com/ModMiiNow
if not exist modules sfk echo -spat \x20 \x20 [Yellow] Skipping download
if not exist modules @ping 127.0.0.1 -n 5 -w 1000> nul
if not exist modules goto:NEXT


if not exist "%Drive%"\WAD mkdir "%Drive%"\WAD


:downloadbasewad
::download base wad to "%Drive%"
echo.
echo Downloading Base Wad: %basewad%
echo.




::----Check base IOS-----------
::----if exist and fails md5 check, delete and redownload----
if exist temp\%basewad%.wad (goto:checkexisting) else (goto:nocheckexisting)
:checkexisting
set md5basecheck=
set md5basealtcheck=
sfk md5 -quiet -verify %md5base% temp\%basewad%.wad
if errorlevel 1 set md5basecheck=fail
IF "%md5basecheck%"=="" set md5basecheck=pass
if /i "%md5basecheck%" NEQ "fail" goto:pass

sfk md5 -quiet -verify %md5basealt% temp\%basewad%.wad
if errorlevel 1 set md5basealtcheck=fail
IF "%md5basealtcheck%"=="" set md5basealtcheck=pass
if /i "%md5basealtcheck%" NEQ "fail" goto:pass

:fail
echo.
sfk echo [Yellow] This base wad already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del temp\%basewad%.wad
goto:downloadbasewad

:pass
echo.
sfk echo -spat \x20 \x20 \x20 [Green] Base Wad already exists and has been verified, Continuing...
echo.
::if /i "%md5basecheck%" EQU "pass" echo %md5base% *%basewad%.wad>> "%Drive%"\Download_Log.md5
::if /i "%md5basealtcheck%" EQU "pass" echo %md5basealt% *%basewad%.wad>> "%Drive%"\Download_Log.md5
goto:basealreadythere
:nocheckexisting


echo If you encounter long periods of inactivity run UnfreezeMii.bat to continue
echo.

nusd %code1%%code2% %version%
if not exist "%Drive%"\WAD mkdir "%Drive%"\WAD
move %code1%%code2%\%code1%%code2%.wad temp\%basewad%.wad>nul
rd /s /q %code1%%code2%


::----check after downloading - if md5 check fails, delete and redownload----
if exist temp\%basewad%.wad goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The basewad is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:downloadbasewad

:checkexisting
set md5basecheck=
set md5basealtcheck=
sfk md5 -quiet -verify %md5base% temp\%basewad%.wad
if errorlevel 1 set md5basecheck=fail
IF "%md5basecheck%"=="" set md5basecheck=pass
if /i "%md5basecheck%" NEQ "fail" goto:pass

sfk md5 -quiet -verify %md5basealt% temp\%basewad%.wad
if errorlevel 1 set md5basealtcheck=fail
IF "%md5basealtcheck%"=="" set md5basealtcheck=pass
if /i "%md5basealtcheck%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del temp\%basewad%.wad
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:downloadbasewad

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
set multiplefail=Y
echo.
goto:NEXT

:pass
echo.
sfk echo -spat \x20 \x20 \x20 [Green] Base Wad has been Downloaded Successfully, Continuing...
echo.
::if /i "%md5basecheck%" EQU "pass" echo %md5base% *%basewad%.wad>> "%Drive%"\Download_Log.md5
::if /i "%md5basealtcheck%" EQU "pass" echo %md5basealt% *%basewad%.wad>> "%Drive%"\Download_Log.md5


:basealreadythere

::unpack base wad
echo.
echo Unpacking Base Wad: %basewad%
echo.

if exist %basecios% rd /s /q %basecios%
mkdir %basecios%
wadmii -in temp\%basewad%.wad -out %basecios%







:downloadbasewadb
::download SECOND base wadB to "%Drive%" (if applicable)
if /i "%basewadb%" EQU "none" goto:nobasewadb

echo.
echo Downloading Base Wad: %basewadb%
echo.


::----Check base IOS B-----------
::----if exist and fails md5 check, delete and redownload----
if exist temp\%basewadb%.wad (goto:checkexisting) else (goto:nocheckexisting)
:checkexisting
set md5basebcheck=
set md5basebaltcheck=
sfk md5 -quiet -verify %md5baseb% temp\%basewadb%.wad
if errorlevel 1 set md5basebcheck=fail
IF "%md5basebcheck%"=="" set md5basebcheck=pass
if /i "%md5basebcheck%" NEQ "fail" goto:pass

sfk md5 -quiet -verify %md5basebalt% temp\%basewadb%.wad
if errorlevel 1 set md5basebaltcheck=fail
IF "%md5basebaltcheck%"=="" set md5basebaltcheck=pass
if /i "%md5basebaltcheck%" NEQ "fail" goto:pass

:fail
echo.
sfk echo [Yellow] This base wad already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del temp\%basewadb%.wad
goto:downloadbasewadb

:pass
echo.
sfk echo -spat \x20 \x20 \x20 [Green] Base Wad already exists and has been verified, Continuing...
echo.
::if /i "%md5basebcheck%" EQU "pass" echo %md5baseb% *%basewadb%.wad>> "%Drive%"\Download_Log.md5
::if /i "%md5basebaltcheck%" EQU "pass" echo %md5basebalt% *%basewadb%.wad>> "%Drive%"\Download_Log.md5
goto:baseBalreadythere
:nocheckexisting


echo If you encounter long periods of inactivity run UnfreezeMii.bat to continue
echo.

nusd %code1b%%code2b% %versionb%
if not exist "%Drive%"\WAD mkdir "%Drive%"\WAD
move %code1b%%code2b%\%code1b%%code2b%.wad temp\%basewadb%.wad>nul
rd /s /q %code1b%%code2b%



::----check after downloading - if md5 check fails, delete and redownload----
if exist temp\%basewadb%.wad goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The basewad is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:downloadbasewadb

:checkexisting
set md5basebcheck=
set md5basebaltcheck=
sfk md5 -quiet -verify %md5baseb% temp\%basewadb%.wad
if errorlevel 1 set md5basebcheck=fail
IF "%md5basebcheck%"=="" set md5basebcheck=pass
if /i "%md5basebcheck%" NEQ "fail" goto:pass

sfk md5 -quiet -verify %md5basebalt% temp\%basewadb%.wad
if errorlevel 1 set md5basebaltcheck=fail
IF "%md5basebaltcheck%"=="" set md5basebaltcheck=pass
if /i "%md5basebaltcheck%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del temp\%basewadb%.wad
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:downloadbasewadb

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat \x20 \x20 \x20 [Green] Base Wad has been Downloaded Successfully, Continuing...
echo.
::if /i "%md5basebcheck%" EQU "pass" echo %md5base% *%basewad%.wad>> "%Drive%"\Download_Log.md5
::if /i "%md5basebaltcheck%" EQU "pass" echo %md5basealt% *%basewad%.wad>> "%Drive%"\Download_Log.md5



:baseBalreadythere

::----unpack base wad
echo.
echo Unpacking Base Wad: %basewadb%
echo.

mkdir %basewadb%
wadmii -in temp\%basewadb%.wad -out %basewadb%

::----specific for cios223v4[37+38]

::delete IOS37 modules that are from 38 and patched
del %basecios%\00000001.app
del %basecios%\%lastbasemodule%.app

move %basewadb%\00000001.app %basecios%\00000001.app>nul
move %basewadb%\%lastbasemodule%.app %basecios%\%lastbasemodule%.app>nul
rd /s /q %basewadb%

:nobasewadb





::------for theming system menu's only----------
if /i "%category%" NEQ "SMTHEME" goto:skip
goto:diff_download
:SMTHEME2

echo.
echo Patching System Theme, please wait...
echo.

rename %basecios%\00000001.app 00000001-original.app
jptch %basecios%\00000001-original.app temp\%codeURL:~34,-5%.diff %basecios%\00000001.app
del %basecios%\00000001-original.app

goto:repackwad
:skip





::-----cios/cmios stuff------------
::rename *.cert and *.footer (doesn't need to be patched), rename components that need to be patched (excluding tik and tmd)

echo.
echo Patching A handful of BaseWad Component Files
echo.

ren %basecios%\%code1%%code2%.cert %code1%%code2new%.cert
ren %basecios%\%code1%%code2%.footer %code1%%code2new%.footer

if exist modules\Diffs\%diffpath%\%diffpath%_00.diff ren %basecios%\00000000.app 00000000-original.app
if exist modules\Diffs\%diffpath%\%diffpath%_01.diff ren %basecios%\00000001.app 00000001-original.app
if exist modules\Diffs\%diffpath%\%diffpath%_02.diff ren %basecios%\00000002.app 00000002-original.app
if exist modules\Diffs\%diffpath%\%diffpath%_%lastbasemodule%.diff ren %basecios%\%lastbasemodule%.app %lastbasemodule%-original.app


::rename tik & tmd for cMIOSs
if /i "%code2%" NEQ "00000101" goto:notcMIOS

::ren %basecios%\%code1%%code2new%.tik %code1%%code2new%-original.tik
ren %basecios%\%code1%%code2new%.tmd %code1%%code2new%-original.tmd
:notcMIOS




::-------------diff patch files----------------
if exist modules\Diffs\%diffpath%\%diffpath%_00.diff jptch %basecios%\00000000-original.app modules\Diffs\%diffpath%\%diffpath%_00.diff %basecios%\00000000.app
if exist modules\Diffs\%diffpath%\%diffpath%_01.diff jptch %basecios%\00000001-original.app modules\Diffs\%diffpath%\%diffpath%_01.diff %basecios%\00000001.app
if exist modules\Diffs\%diffpath%\%diffpath%_02.diff jptch %basecios%\00000002-original.app modules\Diffs\%diffpath%\%diffpath%_02.diff %basecios%\00000002.app
if exist modules\Diffs\%diffpath%\%diffpath%_%lastbasemodule%.diff jptch %basecios%\%lastbasemodule%-original.app modules\Diffs\%diffpath%\%diffpath%_%lastbasemodule%.diff %basecios%\%lastbasemodule%.app


::patch tmd and tiks when they've been renamed to *-original.tik\tmd (for cMIOSs)
if /i "%code2%" NEQ "00000101" goto:NotRenamedOriginal

::if exist modules\Diffs\%diffpath%\%diffpath%_tik.diff jptch %basecios%\%code1%%code2%-original.tik modules\Diffs\%diffpath%\%diffpath%_tik.diff %basecios%\%code1%%code2new%.tik

if exist modules\Diffs\%diffpath%\%diffpath%_tmd.diff jptch %basecios%\%code1%%code2%-original.tmd modules\Diffs\%diffpath%\%diffpath%_tmd.diff %basecios%\%code1%%code2new%.tmd
goto:deletefiles

:NotRenamedOriginal
if exist modules\Diffs\%diffpath%\%diffpath%_tmd.diff jptch %basecios%\%code1%%code2%.tmd modules\Diffs\%diffpath%\%diffpath%_tmd.diff %basecios%\%code1%%code2new%.tmd

::use different tik diff files depending on what base wad downloaded
if /i "%md5basecheck%" EQU "pass" jptch %basecios%\%code1%%code2%.tik modules\Diffs\%diffpath%\%diffpath%_tik.diff %basecios%\%code1%%code2new%.tik
if /i "%md5basealtcheck%" EQU "pass" jptch %basecios%\%code1%%code2%.tik modules\Diffs\%diffpath%\%diffpath%_tik2.diff %basecios%\%code1%%code2new%.tik



::delete un-needed original files that have already been patched
:deletefiles


if exist %basecios%\00000000-original.app del %basecios%\00000000-original.app
if exist %basecios%\00000001-original.app del %basecios%\00000001-original.app
if exist %basecios%\00000002-original.app del %basecios%\00000002-original.app
if exist %basecios%\%lastbasemodule%-original.app del %basecios%\%lastbasemodule%-original.app

::--for cMIOS's that have tiks and tmds renamed to -original
if exist %basecios%\%code1%%code2%-original.tik del %basecios%\%code1%%code2%-original.tik
if exist %basecios%\%code1%%code2%-original.tmd del %basecios%\%code1%%code2%-original.tmd
if /i "%code2%" EQU "00000101" goto:repackwad

if exist %basecios%\%code1%%code2%.tik del %basecios%\%code1%%code2%.tik
if exist %basecios%\%code1%%code2%.tmd del %basecios%\%code1%%code2%.tmd



::Korean Key Patch

if /i "%HEXEDIT%" EQU "N" goto:nokorpatch
if /i "%HEXEDIT%" EQU "S" goto:nokorpatch

if /i "%basewad:~3,2%" EQU "38" goto:nokorpatch
if /i "%basecios%" EQU "cIOS223[37-38]-v4" goto:nokorpatch

echo.
echo Patching %lastbasemodule%.app to support the Korean Common Key

sfk hexdump -pure -nofile %basecios%\%lastbasemodule%.app>hexdump.txt
FINDSTR /N . hexdump.txt>hexdump2.txt
move /y hexdump2.txt hexdump.txt>nul

::first patch
sfk filter hexdump.txt -rep _D00A203A1C21_E00A203A1C21_ -write -yes>nul

::find line1-3
sfk filter hexdump.txt -+2C575B54E75A011F27B8A5F2 -rep _:*__>line1-3.txt

::Loop through the the following once for EACH line in whatever.txt
for /F "tokens=*" %%A in (line1-3.txt) do call :process101 %%A
goto:littleskip

:process101
set line0Num=%*
goto:EOF

:littleskip
if exist line1-3.txt del line1-3.txt>nul
set /A line1Num=%line0Num%+3
set /A line2Num=%line0Num%+4


::2nd set of patches
set line1toreplace=%line1Num%:000000000000000063B82BB4F4614E2E
set line2toreplace=%line2Num%:13F2FEFBBA4C9B7E0000000000000000



if /i "%basewad%" EQU "IOS37-64-v3869" (set line1toreplace=10127:63B82BB4F4614E2E13F2FEFBBA4C9B7E) & (set line2toreplace=)

if /i "%basewad%" EQU "IOS57-64-v5661" (set line1toreplace=10486:00000000000000000000000063B82BB4) & (set line2toreplace=10487:F4614E2E13F2FEFBBA4C9B7E00000000)


IF "%line1toreplace%"=="" goto:skip
sfk filter hexdump.txt -lsrep _%line1toreplace:~0,5%*_%line1toreplace%_ -write -yes>nul
:skip

IF "%line2toreplace%"=="" goto:skip
sfk filter hexdump.txt -lsrep _%line2toreplace:~0,5%*_%line2toreplace%_ -write -yes>nul
:skip


sfk filter hexdump.txt -rep _"*:"__ +hextobin %basecios%\%lastbasemodule%.app>nul


del hexdump.txt>nul

:nokorpatch





::copy over extra components

echo.
echo Copying over Custom Modules
echo.

::222v4
if /i "%basecios%" EQU "cIOS222[38]-v4" copy modules\Hermes\mloadv3.app %basecios%\0000000f.app

::223v4
if /i "%basecios%" EQU "cIOS223[37-38]-v4" copy modules\Hermes\mloadv3.app %basecios%\0000000f.app

::222v5
if /i "%basecios%" EQU "cIOS222[38]-v5" copy modules\Hermes\mloadv5.app %basecios%\0000000f.app

::223v5 base37
if /i "%basecios%" EQU "cIOS223[37]-v5" copy modules\Hermes\mloadv5.app %basecios%\0000000f.app

::224v5 base57
if /i "%basecios%" EQU "cIOS224[57]-v5" copy modules\Hermes\mloadv5.app %basecios%\00000013.app



::249v19 base37
if /i "%basecios%" EQU "cIOS249[37]-v19" copy modules\W19Modules\mload.app %basecios%\0000000f.app
if /i "%basecios%" EQU "cIOS249[37]-v19" copy modules\W19Modules\EHCI.app %basecios%\00000010.app
if /i "%basecios%" EQU "cIOS249[37]-v19" copy modules\W19Modules\FAT.app %basecios%\00000011.app
if /i "%basecios%" EQU "cIOS249[37]-v19" copy modules\W19Modules\SDHC.app %basecios%\00000012.app
if /i "%basecios%" EQU "cIOS249[37]-v19" copy modules\W19Modules\DIPP.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[37]-v19" copy modules\W19Modules\FFSP.app %basecios%\00000014.app

::249v19 base38
if /i "%basecios%" EQU "cIOS249[38]-v19" copy modules\W19Modules\mload.app %basecios%\0000000f.app
if /i "%basecios%" EQU "cIOS249[38]-v19" copy modules\W19Modules\EHCI.app %basecios%\00000010.app
if /i "%basecios%" EQU "cIOS249[38]-v19" copy modules\W19Modules\FAT.app %basecios%\00000011.app
if /i "%basecios%" EQU "cIOS249[38]-v19" copy modules\W19Modules\SDHC.app %basecios%\00000012.app
if /i "%basecios%" EQU "cIOS249[38]-v19" copy modules\W19Modules\DIPP.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[38]-v19" copy modules\W19Modules\FFSP.app %basecios%\00000014.app

::249v20 base38
if /i "%basecios%" EQU "cIOS249[38]-v20" copy modules\W20Modules\mload.app %basecios%\0000000f.app
if /i "%basecios%" EQU "cIOS249[38]-v20" copy modules\W20Modules\EHCI.app %basecios%\00000010.app
if /i "%basecios%" EQU "cIOS249[38]-v20" copy modules\W20Modules\FAT.app %basecios%\00000011.app
if /i "%basecios%" EQU "cIOS249[38]-v20" copy modules\W20Modules\SDHC.app %basecios%\00000012.app
if /i "%basecios%" EQU "cIOS249[38]-v20" copy modules\W20Modules\DIPP.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[38]-v20" copy modules\W20Modules\ES.app %basecios%\00000014.app
if /i "%basecios%" EQU "cIOS249[38]-v20" copy modules\W20Modules\FFSP.app %basecios%\00000015.app

::249v20 base56
if /i "%basecios%" EQU "cIOS249[56]-v20" copy modules\W20Modules\mload.app %basecios%\0000000f.app
if /i "%basecios%" EQU "cIOS249[56]-v20" copy modules\W20Modules\EHCI.app %basecios%\00000010.app
if /i "%basecios%" EQU "cIOS249[56]-v20" copy modules\W20Modules\FAT.app %basecios%\00000011.app
if /i "%basecios%" EQU "cIOS249[56]-v20" copy modules\W20Modules\SDHC.app %basecios%\00000012.app
if /i "%basecios%" EQU "cIOS249[56]-v20" copy modules\W20Modules\DIPP.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[56]-v20" copy modules\W20Modules\ES.app %basecios%\00000014.app
if /i "%basecios%" EQU "cIOS249[56]-v20" copy modules\W20Modules\FFSP.app %basecios%\00000015.app

::249v19 base57
if /i "%basecios%" EQU "cIOS249[57]-v19" copy modules\W19Modules\mload.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[57]-v19" copy modules\W19Modules\EHCI.app %basecios%\00000014.app
if /i "%basecios%" EQU "cIOS249[57]-v19" copy modules\W19Modules\FAT.app %basecios%\00000015.app
if /i "%basecios%" EQU "cIOS249[57]-v19" copy modules\W19Modules\SDHC.app %basecios%\00000016.app
if /i "%basecios%" EQU "cIOS249[57]-v19" copy modules\W19Modules\DIPP.app %basecios%\00000017.app
if /i "%basecios%" EQU "cIOS249[57]-v19" copy modules\W19Modules\FFSP.app %basecios%\00000018.app

::249v20 base57
if /i "%basecios%" EQU "cIOS249[57]-v20" copy modules\W20Modules\mload.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[57]-v20" copy modules\W20Modules\EHCI.app %basecios%\00000014.app
if /i "%basecios%" EQU "cIOS249[57]-v20" copy modules\W20Modules\FAT.app %basecios%\00000015.app
if /i "%basecios%" EQU "cIOS249[57]-v20" copy modules\W20Modules\SDHC.app %basecios%\00000016.app
if /i "%basecios%" EQU "cIOS249[57]-v20" copy modules\W20Modules\DIPP.app %basecios%\00000017.app
if /i "%basecios%" EQU "cIOS249[57]-v20" copy modules\W20Modules\ES.app %basecios%\00000018.app
if /i "%basecios%" EQU "cIOS249[57]-v20" copy modules\W20Modules\FFSP.app %basecios%\00000019.app

::249v17b
if /i "%basecios%" EQU "cIOS249-v17b" copy modules\W17bModules\0000000f.app %basecios%\0000000f.app
if /i "%basecios%" EQU "cIOS249-v17b" copy modules\W17bModules\00000010.app %basecios%\00000010.app
if /i "%basecios%" EQU "cIOS249-v17b" copy modules\W17bModules\00000011.app %basecios%\00000011.app

::249v14
if /i "%basecios%" EQU "cIOS249-v14" copy modules\W14Modules\EHCI.app %basecios%\0000000f.app
if /i "%basecios%" EQU "cIOS249-v14" copy modules\W14Modules\SDHC.app %basecios%\00000010.app
if /i "%basecios%" EQU "cIOS249-v14" copy modules\W14Modules\FAT.app %basecios%\00000011.app


::249v21 base 37/38/56
if /i "%basecios%" EQU "cIOS249[37]-v21" goto:yes
if /i "%basecios%" EQU "cIOS249[38]-v21" goto:yes
if /i "%basecios%" EQU "cIOS249[53]-v21" goto:yes
if /i "%basecios%" EQU "cIOS249[55]-v21" goto:yes
if /i "%basecios%" EQU "cIOS249[56]-v21" goto:yes
goto:skip
:yes
copy modules\W21Modules\mload.app %basecios%\0000000f.app
copy modules\W21Modules\FAT.app %basecios%\00000010.app
copy modules\W21Modules\SDHC.app %basecios%\00000011.app
copy modules\W21Modules\EHCI.app %basecios%\00000012.app
copy modules\W21Modules\DIPP.app %basecios%\00000013.app
copy modules\W21Modules\ES.app %basecios%\00000014.app
copy modules\W21Modules\FFSP.app %basecios%\00000015.app
:skip


::249v21 base57
if /i "%basecios%" EQU "cIOS249[57]-v21" copy modules\W21Modules\mload.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[57]-v21" copy modules\W21Modules\FAT.app %basecios%\00000014.app
if /i "%basecios%" EQU "cIOS249[57]-v21" copy modules\W21Modules\SDHC.app %basecios%\00000015.app
if /i "%basecios%" EQU "cIOS249[57]-v21" copy modules\W21Modules\EHCI.app %basecios%\00000016.app
if /i "%basecios%" EQU "cIOS249[57]-v21" copy modules\W21Modules\DIPP.app %basecios%\00000017.app
if /i "%basecios%" EQU "cIOS249[57]-v21" copy modules\W21Modules\ES.app %basecios%\00000018.app
if /i "%basecios%" EQU "cIOS249[57]-v21" copy modules\W21Modules\FFSP.app %basecios%\00000019.app

::249v21 base58
if /i "%basecios%" EQU "cIOS249[58]-v21" copy modules\W21Modules\mload.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[58]-v21" copy modules\W21Modules\FAT.app %basecios%\00000014.app
if /i "%basecios%" EQU "cIOS249[58]-v21" copy modules\W21Modules\SDHC.app %basecios%\00000015.app
if /i "%basecios%" EQU "cIOS249[58]-v21" copy modules\W21Modules\USBS.app %basecios%\00000016.app
if /i "%basecios%" EQU "cIOS249[58]-v21" copy modules\W21Modules\DIPP.app %basecios%\00000017.app
if /i "%basecios%" EQU "cIOS249[58]-v21" copy modules\W21Modules\ES.app %basecios%\00000018.app
if /i "%basecios%" EQU "cIOS249[58]-v21" copy modules\W21Modules\FFSP.app %basecios%\00000019.app



::249 d2x base 37/38/56
if /i "%basecios:~0,17%" EQU "cIOS249[37]-d2x-v" goto:yes
if /i "%basecios:~0,17%" EQU "cIOS249[38]-d2x-v" goto:yes
if /i "%basecios:~0,17%" EQU "cIOS249[53]-d2x-v" goto:yes
if /i "%basecios:~0,17%" EQU "cIOS249[55]-d2x-v" goto:yes
if /i "%basecios:~0,17%" EQU "cIOS249[56]-d2x-v" goto:yes
goto:skip
:yes
if exist modules\d2x-beta\mload.app (copy modules\d2x-beta\mload.app %basecios%\0000000f.app) else (copy modules\W21Modules\mload.app %basecios%\0000000f.app)

if exist modules\d2x-beta\FAT.app (copy modules\d2x-beta\FAT.app %basecios%\00000010.app) else (copy modules\d2xModules\FAT.app %basecios%\00000010.app)

if exist modules\d2x-beta\SDHC.app (copy modules\d2x-beta\SDHC.app %basecios%\00000011.app) else (copy modules\W21Modules\SDHC.app %basecios%\00000011.app)

if exist modules\d2x-beta\EHCI.app (copy modules\d2x-beta\EHCI.app %basecios%\00000012.app) else (copy modules\d2xModules\EHCI.app %basecios%\00000012.app)

if exist modules\d2x-beta\DIPP.app (copy modules\d2x-beta\DIPP.app %basecios%\00000013.app) else (copy modules\d2xModules\DIPP.app %basecios%\00000013.app)

if exist modules\d2x-beta\ES.app (copy modules\d2x-beta\ES.app %basecios%\00000014.app) else (copy modules\d2xModules\ES.app %basecios%\00000014.app)

if exist modules\d2x-beta\FFSP.app (copy modules\d2x-beta\FFSP.app %basecios%\00000015.app) else (copy modules\d2xModules\FFSP.app %basecios%\00000015.app)
:skip





::249 d2x base 57
if /i "%basecios:~0,17%" EQU "cIOS249[57]-d2x-v" goto:yes
goto:skip
:yes

if exist modules\d2x-beta\mload.app (copy modules\d2x-beta\mload.app %basecios%\00000013.app) else (copy modules\W21Modules\mload.app %basecios%\00000013.app)

if exist modules\d2x-beta\FAT.app (copy modules\d2x-beta\FAT.app %basecios%\00000014.app) else (copy modules\d2xModules\FAT.app %basecios%\00000014.app)

if exist modules\d2x-beta\SDHC.app (copy modules\d2x-beta\SDHC.app %basecios%\00000015.app) else (copy modules\W21Modules\SDHC.app %basecios%\00000015.app)

if exist modules\d2x-beta\EHCI.app (copy modules\d2x-beta\EHCI.app %basecios%\00000016.app) else (copy modules\d2xModules\EHCI.app %basecios%\00000016.app)

if exist modules\d2x-beta\DIPP.app (copy modules\d2x-beta\DIPP.app %basecios%\00000017.app) else (copy modules\d2xModules\DIPP.app %basecios%\00000017.app)

if exist modules\d2x-beta\ES.app (copy modules\d2x-beta\ES.app %basecios%\00000018.app) else (copy modules\d2xModules\ES.app %basecios%\00000018.app)

if exist modules\d2x-beta\FFSP.app (copy modules\d2x-beta\FFSP.app %basecios%\00000019.app) else (copy modules\d2xModules\FFSP.app %basecios%\00000019.app)
:skip



::249 d2x base 58
if /i "%basecios:~0,17%" EQU "cIOS249[58]-d2x-v" goto:yes
goto:skip
:yes

if exist modules\d2x-beta\mload.app (copy modules\d2x-beta\mload.app %basecios%\00000013.app) else (copy modules\W21Modules\mload.app %basecios%\00000013.app)

if exist modules\d2x-beta\FAT.app (copy modules\d2x-beta\FAT.app %basecios%\00000014.app) else (copy modules\d2xModules\FAT.app %basecios%\00000014.app)

if exist modules\d2x-beta\SDHC.app (copy modules\d2x-beta\SDHC.app %basecios%\00000015.app) else (copy modules\W21Modules\SDHC.app %basecios%\00000015.app)

if exist modules\d2x-beta\USBS.app (copy modules\d2x-beta\USBS.app %basecios%\00000016.app) else (copy modules\W21Modules\USBS.app %basecios%\00000016.app)

if exist modules\d2x-beta\DIPP.app (copy modules\d2x-beta\DIPP.app %basecios%\00000017.app) else (copy modules\d2xModules\DIPP.app %basecios%\00000017.app)

if exist modules\d2x-beta\ES.app (copy modules\d2x-beta\ES.app %basecios%\00000018.app) else (copy modules\d2xModules\ES.app %basecios%\00000018.app)

if exist modules\d2x-beta\FFSP.app (copy modules\d2x-beta\FFSP.app %basecios%\00000019.app) else (copy modules\d2xModules\FFSP.app %basecios%\00000019.app)
:skip




::------hex edit d2x 00.app---------
set d2xNumber=
set d2xhexNumber=
set baseNumber=
set basehexNumber=
set d2xsubversion=
set string=
set string1=

if /i "%HEXEDIT%" EQU "N" goto:repackwad
if /i "%HEXEDIT%" EQU "K" goto:repackwad

if /i "%code2%" EQU "00000101" goto:repackwad

echo.
echo Signing 00000000.app with cIOS details

sfk hexdump -pure -nofile %basecios%\00000000.app>hexdump.txt
FINDSTR /N . hexdump.txt>hexdump2.txt
move /y hexdump2.txt hexdump.txt>nul


::----convert some values from dec to hex----

if /i "%basecios:~12,3%" NEQ "d2x" goto:minijump
echo "set cIOSversionNum=%d2x-beta-rev%">cIOSrev.bat
sfk filter -spat cIOSrev.bat -rep _\x22__ -rep _"-*"__ -write -yes>nul
call cIOSrev.bat
del cIOSrev.bat
:minijump

sfk hex %cIOSversionNum% -digits=8 >hex.txt

::Loop through the the following once for EACH line in whatever.txt
for /F "tokens=*" %%A in (hex.txt) do call :processdec2hex %%A
goto:skiphexcalc

:processdec2hex
set cIOShexNumber=%*
goto:EOF
:skiphexcalc
if exist hex.txt del hex.txt>nul

::-----
set baseNumber=%basewad:~3,2%
::base # for 37+38=75
if /i "%basecios%" EQU "cIOS223[37-38]-v4" set baseNumber=75
sfk hex %baseNumber% -digits=8 >hex.txt

::Loop through the the following once for EACH line in whatever.txt
for /F "tokens=*" %%A in (hex.txt) do call :processdec2hex %%A
goto:skiphexcalc

:processdec2hex
set basehexNumber=%*
goto:EOF
:skiphexcalc
if exist hex.txt del hex.txt


set cIOSsubversion=
::-----cIOSFamilyName (this part required for d2x betas only)-------
if /i "%basecios:~12,3%" NEQ "d2x" goto:tinyjump
set cIOSFamilyName=d2x
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat


::-----version string (ie. beta1) (this part required for d2x betas only)------

set string1=%cIOSversionNum%
set versionlength=1
::letter by letter loop
:loopy
    if /i "%string1%" EQU "" goto:endloopy
    set string1=%string1:~1%
    set /A versionlength=%versionlength%+1
    goto loopy
:endloopy


echo set cIOSsubversion=@d2x-beta-rev:~%versionlength%,16@>cIOSsubversion.bat
sfk filter cIOSsubversion.bat -spat -rep _@_%%_ -write -yes>nul
call cIOSsubversion.bat
del cIOSsubversion.bat>nul
:tinyjump


::-----
::Loop through txt file
for /F "tokens=*" %%A in (hexdump.txt) do call :processhexedit %%A
goto:nextstep

:processhexedit
::this is repeated for each line of the txt.file
::"%*" (no quotes) is the variable for each line as it passes through the loop

set hexline=%*

if /i "%hexline:~0,2%" EQU "1:" set hexline2=1EE7C10500000001%cIOShexNumber%%basehexNumber%
if /i "%hexline:~0,2%" EQU "1:" goto:quickskip

if /i "%hexline:~0,2%" EQU "2:" set string=%cIOSFamilyName%
if /i "%hexline:~0,2%" EQU "2:" goto:string2hex

if /i "%hexline:~0,2%" EQU "3:" set string=%cIOSsubversion%
if /i "%hexline:~0,2%" EQU "3:" goto:string2hex

::if /i "%hexline:~0,2%" EQU "4:" goto:nextstep
if /i "%hexline:~0,2%" EQU "4:" set hexline2=00000000000000000000000000000000
if /i "%hexline:~0,2%" EQU "4:" goto:quickskip

::to enter in a line of hex instead of string, do the following
::if /i "%hexline:~0,2%" EQU "#:" set hexline2=%hexline:~2%
::if /i "%hexline:~0,2%" EQU "#:" goto:quickskip
::OR
::if /i "%hexline:~0,2%" EQU "#:" set hexline2=01234567891011121314151617181920
::if /i "%hexline:~0,2%" EQU "#:" goto:quickskip



:string2hex
set hexline2=
set length=0


::letter by letter loop
:loop
    if /i "%string%" EQU "" goto:endloop
    set letter=%string:~0,1%
    set string=%string:~1%
    set /A length=%length%+1

set hexvalue=00
if /i "%letter%" EQU "0" (set hexvalue=30) & (goto:gotvalue)
if /i "%letter%" EQU "1" (set hexvalue=31) & (goto:gotvalue)
if /i "%letter%" EQU "2" (set hexvalue=32) & (goto:gotvalue)
if /i "%letter%" EQU "3" (set hexvalue=33) & (goto:gotvalue)
if /i "%letter%" EQU "4" (set hexvalue=34) & (goto:gotvalue)
if /i "%letter%" EQU "5" (set hexvalue=35) & (goto:gotvalue)
if /i "%letter%" EQU "6" (set hexvalue=36) & (goto:gotvalue)
if /i "%letter%" EQU "7" (set hexvalue=37) & (goto:gotvalue)
if /i "%letter%" EQU "8" (set hexvalue=38) & (goto:gotvalue)
if /i "%letter%" EQU "9" (set hexvalue=39) & (goto:gotvalue)
if /i "%letter%" EQU "a" (set hexvalue=61) & (goto:gotvalue)
if /i "%letter%" EQU "b" (set hexvalue=62) & (goto:gotvalue)
if /i "%letter%" EQU "c" (set hexvalue=63) & (goto:gotvalue)
if /i "%letter%" EQU "d" (set hexvalue=64) & (goto:gotvalue)
if /i "%letter%" EQU "e" (set hexvalue=65) & (goto:gotvalue)
if /i "%letter%" EQU "f" (set hexvalue=66) & (goto:gotvalue)
if /i "%letter%" EQU "g" (set hexvalue=67) & (goto:gotvalue)
if /i "%letter%" EQU "h" (set hexvalue=68) & (goto:gotvalue)
if /i "%letter%" EQU "i" (set hexvalue=69) & (goto:gotvalue)
if /i "%letter%" EQU "j" (set hexvalue=6A) & (goto:gotvalue)
if /i "%letter%" EQU "k" (set hexvalue=6B) & (goto:gotvalue)
if /i "%letter%" EQU "l" (set hexvalue=6C) & (goto:gotvalue)
if /i "%letter%" EQU "m" (set hexvalue=6D) & (goto:gotvalue)
if /i "%letter%" EQU "n" (set hexvalue=6E) & (goto:gotvalue)
if /i "%letter%" EQU "o" (set hexvalue=6F) & (goto:gotvalue)
if /i "%letter%" EQU "p" (set hexvalue=70) & (goto:gotvalue)
if /i "%letter%" EQU "q" (set hexvalue=71) & (goto:gotvalue)
if /i "%letter%" EQU "r" (set hexvalue=72) & (goto:gotvalue)
if /i "%letter%" EQU "s" (set hexvalue=73) & (goto:gotvalue)
if /i "%letter%" EQU "t" (set hexvalue=74) & (goto:gotvalue)
if /i "%letter%" EQU "u" (set hexvalue=75) & (goto:gotvalue)
if /i "%letter%" EQU "v" (set hexvalue=76) & (goto:gotvalue)
if /i "%letter%" EQU "w" (set hexvalue=77) & (goto:gotvalue)
if /i "%letter%" EQU "x" (set hexvalue=78) & (goto:gotvalue)
if /i "%letter%" EQU "y" (set hexvalue=79) & (goto:gotvalue)
if /i "%letter%" EQU "z" (set hexvalue=7A) & (goto:gotvalue)
if /i "%letter%" EQU "-" (set hexvalue=2D) & (goto:gotvalue)
if /i "%letter%" EQU "+" (set hexvalue=2B) & (goto:gotvalue)
if /i "%letter%" EQU "_" (set hexvalue=5F) & (goto:gotvalue)
if /i "%letter%" EQU "(" (set hexvalue=28) & (goto:gotvalue)
if /i "%letter%" EQU ")" (set hexvalue=29) & (goto:gotvalue)
if /i "%letter%" EQU "[" (set hexvalue=5B) & (goto:gotvalue)
if /i "%letter%" EQU "]" (set hexvalue=5D) & (goto:gotvalue)

:gotvalue
set hexline2=%hexline2%%hexvalue%
    goto loop

:endloop


:add0s
if %length% EQU 16 (goto:noextra0s)
set hexline2=%hexline2%00
set /A length += 1
goto:add0s
:noextra0s



:quickskip
echo %hexline2%>>hexdump2.txt

goto:EOF


:nextstep
::copy over remaining lines (after "4:")
::sfk filter hexdump.txt -inc 4: to *>>hexdump2.txt

sfk filter hexdump2.txt -rep _"*:"__ +hextobin %basecios%\00000000.app>nul


del hexdump.txt>nul
del hexdump2.txt>nul


::---------pack files into cIOS wad---------
:repackwad
echo.
echo Repacking Wad
echo.

if /i "%ROOTSAVE%" EQU "OFF" (wadmii -in "%basecios%" -out "%Drive%\WAD\%wadname%.wad") else (wadmii -in "%basecios%" -out "%Drive%\%wadname%.wad")


::delete unpacked files
rd /s /q %basecios%

::Change version number and slot number (using patchios) only if required
:patchios

if /i "%ciosslot%" EQU "unchanged" goto:skip

echo.
echo Changing version number and/or slot number
echo.
if /i "%ROOTSAVE%" EQU "OFF" (patchios "%Drive%"\WAD\%wadname%.wad -slot %ciosslot% -v %ciosversion%) else (patchios "%Drive%"\%wadname%.wad -slot %ciosslot% -v %ciosversion%)
echo.
:skip


if "%wadname:~-4%" NEQ ".wad" set wadname=%wadname%.wad

if /i "%ROOTSAVE%" EQU "OFF" (goto:wadverifyretry) else (goto:checkretryroot)





::----------------------------------------THEMES-------------------------------------
:THEMES

if not exist "%Drive%"\MyMenuify_Themes mkdir "%Drive%"\MyMenuify_Themes


echo %md5% *MyMenuify_Themes\%wadname%.csm>> "%Drive%"\Download_Log.md5



::----if exist and fails md5 check, delete and redownload----
if exist "%Drive%"\MyMenuify_Themes\%wadname%.csm (goto:checkexisting) else (goto:nocheckexisting)
:checkexisting
set md5check=
sfk md5 -quiet -verify %md5% "%Drive%"\MyMenuify_Themes\%wadname%.csm
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%"\MyMenuify_Themes\%wadname%.csm
goto:DOWNLOADSTART2

:pass
sfk echo [Green]This file already exists and has been verified, Skipping download
echo.
::if /i "%md5check%" EQU "pass" echo %md5% *WAD\%wadname%.wad>> "%Drive%"\Download_Log.md5
goto:NEXT
:nocheckexisting





::-------------Download base app----------------------
echo.
echo Downloading Base app from System Menu %wadname:~-4%: 000000%version%.app
echo.

set dlname=000000%version%_%wadname:~-4%.app

::----if exist and fails md5 check, delete and redownload----
if not exist "%Drive%"\MyMenuify_Themes\%dlname% goto:nocheckexisting
set md5basecheck=
sfk md5 -quiet -verify %md5base% "%Drive%"\MyMenuify_Themes\%dlname%
if errorlevel 1 set md5basecheck=fail
IF "%md5basecheck%"=="" set md5basecheck=pass
if /i "%md5basecheck%" NEQ "fail" goto:pass

:fail
echo.
sfk echo [Yellow] This base app already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%"\MyMenuify_Themes\%dlname%
if exist temp\%dlname% del temp\%dlname%
goto:DOWNLOADSTART2

:pass
sfk echo -spat \x20 \x20 \x20 [Green] Base App already exists and has been verified, Continuing...
echo.
::if /i "%md5basecheck%" EQU "pass" echo %md5base% *WAD\%wadname%>> "%Drive%"\Download_Log.md5
goto:diff_download
:nocheckexisting


if exist temp\%dlname% goto:AlreadyinTemp

nusfilegrabber.exe %version%
move /Y 000000%version%.app temp\%dlname%>nul

:AlreadyinTemp
copy /y temp\%dlname% "%Drive%"\MyMenuify_Themes\%dlname% >nul




::----Check base APP-----------
::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%"\MyMenuify_Themes\%dlname% goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
set md5basecheck=

sfk md5 -quiet -verify %md5base% "%Drive%"\MyMenuify_Themes\%dlname%
if errorlevel 1 set md5basecheck=fail
IF "%md5basecheck%"=="" set md5basecheck=pass
if /i "%md5basecheck%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This base app already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del "%Drive%"\MyMenuify_Themes\%dlname%
if exist temp\%dlname% del temp\%dlname%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
::echo %md5base% *WAD\%wadname%>> "%Drive%"\Download_Log.md5
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat \x20 \x20 \x20 [Green] Base App has been Downloaded Successfully, Continuing...
echo.
::if /i "%md5basecheck%" EQU "pass" echo %md5base% *WAD\%wadname%>> "%Drive%"\Download_Log.md5
goto:diff_download





::-------------------diff download to build csm file---------------------
:diff_download

echo.
echo Downloading %codeURL:~34,-5% Diff file
echo.

::----if exist and fails md5 check, delete and redownload----
if not exist temp\%codeURL:~34,-5%.diff goto:nocheckexisting
set md5diffcheck=
sfk md5 -quiet -verify %md5diff% temp\%codeURL:~34,-5%.diff
if errorlevel 1 set md5diffcheck=fail
IF "%md5diffcheck%"=="" set md5diffcheck=pass
if /i "%md5diffcheck%" NEQ "fail" goto:pass

:fail
echo.
sfk echo [Yellow] This Diff file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del temp\%codeURL:~34,-5%.diff
goto:DOWNLOADSTART2

:pass
sfk echo -spat \x20 \x20 \x20 [Green] Diff file already exists and has been verified, Continuing...
echo.
::if /i "%md5diffcheck%" EQU "pass" echo %md5diff% *WAD\%codeURL:~34,-5%>> "%Drive%"\Download_Log.md5
if /i "%category%" EQU "SMTHEME" goto:SMTHEME2
goto:build_csm
:nocheckexisting


start %ModMiimin%/wait wget -t 3 %codeURL%
move /Y %codeURL:~34,-5%.diff temp>nul




::----Check Diff file after downloading-----------
::----check after downloading - if md5 check fails, delete and redownload----
if exist temp\%codeURL:~34,-5%.diff goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
set md5diffcheck=

sfk md5 -quiet -verify %md5diff% temp\%codeURL:~34,-5%.diff
if errorlevel 1 set md5diffcheck=fail
IF "%md5diffcheck%"=="" set md5diffcheck=pass
if /i "%md5diffcheck%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This Diff file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del temp\%codeURL:~34,-5%.diff
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
::echo %md5diff% *WAD\%codeURL:~34,-5%>> "%Drive%"\Download_Log.md5
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat \x20 \x20 \x20 [Green] Diff file has been Downloaded Successfully, Continuing...
echo.
::if /i "%md5diffcheck%" EQU "pass" echo %md5diff% *WAD\%codeURL:~34,-5%>> "%Drive%"\Download_Log.md5
if /i "%category%" EQU "SMTHEME" goto:SMTHEME2
goto:build_csm







:build_csm

echo.
echo Building Theme (%wadname%.csm), please wait...
echo.

jptch "%Drive%"\MyMenuify_Themes\%dlname% temp\%wadname%.diff "%Drive%"\MyMenuify_Themes\%wadname%.csm



::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%"\MyMenuify_Themes\%wadname%.csm goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
set md5check=
sfk md5 -quiet -verify %md5% "%Drive%"\MyMenuify_Themes\%wadname%.csm
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del "%Drive%"\MyMenuify_Themes\%wadname%.csm
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
echo %md5% *WAD\%wadname%.wad>> "%Drive%"\Download_Log.md5
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo [Green]Download Successful
echo.
goto:NEXT






::------------------------------------------CFG USB Loader Downloader--------------------------------------
:CFGDOWNLOADER

::choice=1 for most recent 249 and choice=2 for most recent 222
if /i "%cfg249%" EQU "*" set cfgchoice=1
if /i "%cfg222%" EQU "*" set cfgchoice=2
::if /i "%cfg249%" EQU "*" set cfgIOS=249
::if /i "%cfg222%" EQU "*" set cfgIOS=222


::if /i "%name%" EQU "USB-Loader Folder" goto:doesntexist

if not exist "%Drive%\apps\USBLoader_cfg\meta.xml" goto:doesntexist

echo.
echo This app already exists...


::get current version if app already exists, skip if its the most recent version
sfk filter -quiet "%Drive%\apps\USBLoader_cfg\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
echo.
echo Current version is %currentcode%
echo.
echo Checking for updates...
echo.

:doesntexist

::Download updates.txt
start %ModMiimin%/wait wget http://cfg-loader.googlecode.com/svn/trunk/updates.txt


::Most Recent Version Download Link
sfk filter updates.txt -ls+url>cfgurl.txt
FINDSTR /N url cfgurl.txt>cfgurl2.txt
sfk filter cfgurl2.txt -rep _"url = "__>cfgurl.txt
del cfgurl2.txt
sfk filter cfgurl.txt -ls+"%cfgchoice%:" -ls!"%cfgchoice%%cfgchoice%:" -lsrep _"%cfgchoice%:"_"set cfgurl="_>cfgDLsettings.bat
del cfgurl.txt

::Most Recent Version Release Number
sfk filter updates.txt -ls+release>cfgrelease.txt
FINDSTR /N release cfgrelease.txt>cfgrelease2.txt
sfk filter cfgrelease2.txt -rep _"release = "__>cfgrelease.txt
del cfgrelease2.txt
sfk filter cfgrelease.txt -ls+"%cfgchoice%:" -ls!"%cfgchoice%%cfgchoice%:" -lsrep _"%cfgchoice%:"_"set cfgrelease="_>>cfgDLsettings.bat
del cfgrelease.txt

::Most Recent Version Release Date
sfk filter updates.txt -ls+date>cfgdate.txt
FINDSTR /N date cfgdate.txt>cfgdate2.txt
sfk filter cfgdate2.txt -rep _"date = "__>cfgdate.txt
del cfgdate2.txt
sfk filter cfgdate.txt -ls+"%cfgchoice%:" -ls!"%cfgchoice%%cfgchoice%:" -lsrep _"%cfgchoice%:"_"set cfgdate="_>>cfgDLsettings.bat
del cfgdate.txt

::Most Recent FULL Version number, used to download most recent 'usb-loader' folder
sfk filter updates.txt -ls+"release = " -rep _"release = "__>cfgFullRelease.txt
sfk filter cfgFullRelease.txt ++release -write -yes>nul
FINDSTR /N release cfgFullRelease.txt>cfgFullRelease2.txt
::sfk filter cfgFullRelease2.txt -rep _" (release)"__>cfgFullRelease.txt
del cfgFullRelease.txt
sfk filter cfgFullRelease2.txt -ls+"1:" -ls!"11:" -lsrep _"1:"_"set cfgfullrelease="_>>cfgDLsettings.bat
del cfgFullRelease2.txt


del updates.txt
call cfgDLsettings.bat
del cfgDLsettings.bat


if /i "%name%" EQU "Configurable USB-Loader (Most recent Full 249 version)" goto:usbloaderFolder

if not exist "%Drive%\apps\USBLoader_cfg\meta.xml" goto:doesntalreadyexist


if "%currentcode%" EQU "%cfgrelease%" goto:noupdate

echo Updating from %currentcode% to %cfgrelease%
echo.
goto:update

:noupdate
sfk echo -spat \x20 [Green] Your current version of %currentcode% is up to date, skipping download
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next




::Download most recent version of cfg loader
:doesntalreadyexist
Echo.
Echo Downloading most recent version: %cfgrelease%

:update
start %ModMiimin%/wait wget %cfgurl%
if not exist "%Drive%"\apps\USBLoader_cfg mkdir "%Drive%"\apps\USBLoader_cfg
move /Y *.dol "%Drive%"\apps\USBLoader_cfg\boot.dol> nul


:geticon
if exist "%Drive%"\apps\USBLoader_cfg\icon.png goto:meta

if exist temp\cfgicon.png goto:skip
start %ModMiimin%/wait wget http://code.google.com/p/cfg-loader/logo?cct=1263052802
move /Y "logo@cct=1263052802" temp\cfgicon.png>nul

:skip
copy /Y temp\cfgicon.png "%Drive%"\apps\USBLoader_cfg\icon.png>nul



:meta
if exist temp\cfgtemplate_meta.xml goto:skip
start %ModMiimin%/wait wget "http://nusad.googlecode.com/files/meta.xml"
move /Y meta.xml temp\cfgtemplate_meta.xml>nul
:skip

copy /Y temp\cfgtemplate_meta.xml "%Drive%"\apps\USBLoader_cfg\meta.xml>nul
sfk filter "%Drive%"\apps\USBLoader_cfg\meta.xml -rep _cfgrelease_"%cfgrelease%"_ -rep _cfgdate_"%cfgdate%"_ -write -yes>nul


::----simple version check after downloading----
if exist "%Drive%"\apps\USBLoader_cfg\boot.dol goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
::get current version from meta.xml
sfk filter -quiet "%Drive%\apps\USBLoader_cfg\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
if "%currentcode%" EQU "%cfgrelease%" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This file already exists but it failed to update properly.
sfk echo [Yellow] Retrying to download the most recent release of the file.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo [Green]Download Successful
echo.
goto:NEXT




:usbloaderFolder


if not exist "%Drive%\apps\USBLoader_cfg\meta.xml" goto:skip

if "%currentcode%" EQU "%cfgfullrelease%" goto:noupdate

echo Updating from %currentcode% to %cfgfullrelease%
echo.

:skip

::Download most recent full version for USB-Loader Folder

echo Downloading most recent Full/Official Configurable USB-Loader: Version %cfgfullrelease%
if exist "%Drive%\usb-loader" Echo.
if exist "%Drive%\usb-loader" Echo Note: Existing USB-Loader Folder will be renamed
start %ModMiimin%/wait wget http://cfg-loader.googlecode.com/files/Cfg_USB_Loader_%cfgfullrelease:~0,-10%.zip



::rename exsiting usb-loader folder if applicable
:renameusbloader
if not exist "%Drive%\usb-loader" goto:extractusbloader
SET /a COUNT9=%COUNT9%+1
if exist "%Drive%\usb-loader%COUNT9%" goto:renameusbloader
move "%Drive%\usb-loader" "%Drive%\usb-loader%COUNT9%">nul


:extractusbloader
if not exist "%DRIVE%\usb-loader" mkdir "%DRIVE%\usb-loader"
if not exist %Drive%\apps\USBLoader_cfg mkdir %Drive%\apps\USBLoader_cfg


7za e -aoa Cfg_USB_Loader_%cfgfullrelease:~0,-10%.zip -o"%Drive%\apps\USBLoader_cfg" Cfg_USB_Loader_%cfgfullrelease:~0,-10%\inSDRoot\apps\USBLoader\* -r

7za e -aoa Cfg_USB_Loader_%cfgfullrelease:~0,-10%.zip -o"%Drive%\USB-Loader" Cfg_USB_Loader_%cfgfullrelease:~0,-10%\inSDRoot\usb-loader\* -r

del Cfg_USB_Loader_%cfgfullrelease:~0,-10%.zip>nul

::save version info for next time!---OFF----
::if exist "%DRIVE%\usb-loader\rev.txt" attrib -r -h -s "%DRIVE%\usb-loader\rev.txt"
::echo set cfgfullreleaseOLD=%cfgfullrelease:~0,-10%>"%DRIVE%\usb-loader\rev.txt"
::attrib +r +h +s "%DRIVE%\usb-loader\rev.txt"





::------extra for USB-Loader Setup Guide-------
if /i "%FORMAT%" EQU "NONE" goto:skip
::FAT or NTFS partition will only be valid if the \wbfs folder exists
if not exist "%Drive%\wbfs" mkdir "%Drive%\wbfs"
if not exist "%DRIVE%"\usb-loader\music mkdir "%DRIVE%"\usb-loader\music

echo Save music Here>"%DRIVE%\usb-loader\music\Save MP3s Here To Play at USB-Loader Menu"
if /i "%USBCONFIG%" EQU "USB" echo music = usb:/usb-loader/music>>"%DRIVE%\usb-loader\config.txt"
if /i "%USBCONFIG%" NEQ "USB" echo music = sd:/usb-loader/music>>"%DRIVE%\usb-loader\config.txt"

echo unlock_password = AAAA>>"%DRIVE%\usb-loader\config.txt"
echo disable_remove = BLAHBLAH>>"%DRIVE%\usb-loader\config.txt"
echo disable_format = BLAHBLAH>>"%DRIVE%\usb-loader\config.txt"
echo admin_unlock = BLAHBLAH>>"%DRIVE%\usb-loader\config.txt"

sfk filter -write -yes "%DRIVE%\usb-loader\config.txt" -rep _BLAHBLAH_1_> nul

:skip

if /i "%USBCONFIG%" NEQ "USB" goto:skip
echo covers_path = usb:/usb-loader/covers>>"%DRIVE%\usb-loader\config.txt"
echo covers_path_2d = usb:/usb-loader/covers/2d>>"%DRIVE%\usb-loader\config.txt"
echo covers_path_3d = usb:/usb-loader/covers/3d>>"%DRIVE%\usb-loader\config.txt"
echo covers_path_disc = usb:/usb-loader/covers/disc>>"%DRIVE%\usb-loader\config.txt"
echo covers_path_full = usb:/usb-loader/covers/full>>"%DRIVE%\usb-loader\config.txt"

if /i "%FORMAT%" EQU "2" sfk filter -write -yes "%DRIVE%\usb-loader\config.txt" -rep _usb:_ntfs:_> nul
:skip

::partition = auto is now the default value
::Will select first valid from: WBFS1, FAT1, NTFS1
::FAT or NTFS partition will only be valid if the /wbfs folder exists
::if /i "%FORMAT%" EQU "1" echo partition = FAT1>>"%DRIVE%\usb-loader\config.txt"
::if /i "%FORMAT%" EQU "2" echo partition = NTFS1>>"%DRIVE%\usb-loader\config.txt"
::if /i "%FORMAT%" EQU "3" echo partition = FAT1>>"%DRIVE%\usb-loader\config.txt"
::if /i "%FORMAT%" EQU "4" echo partition = WBFS1>>"%DRIVE%\usb-loader\config.txt"
::if /i "%FORMAT%" EQU "5" echo partition = WBFS1>>"%DRIVE%\usb-loader\config.txt"


::----simple version check after downloading----
if exist "%Drive%"\apps\USBLoader_cfg\boot.dol goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
::get current version from meta.xml
sfk filter -quiet "%Drive%\apps\USBLoader_cfg\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
if "%currentcode%" EQU "%cfgfullrelease%" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This file already exists but it failed to update properly.
sfk echo [Yellow] Retrying to download the most recent release of the file.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo [Green]Download Successful
echo.
goto:NEXT



:noupdate
sfk echo -spat \x20 [Green] Your current version of %currentcode% is up to date, skipping download
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next


::------------------------------------------CONFIGURATOR FOR CFG USB Loader Downloader--------------------------------------
:CFGRDOWNLOADER

::set DRIVETEMP=%DRIVE%
::if /i "%USBCONFIG%" EQU "USB" set DRIVE=%DRIVEU%

::Download updates.txt
start %ModMiimin%/wait wget "http://gwht.wdfiles.com/local--files/configurable-options/updates.txt"


::Most Recent Version Download Link
sfk filter updates.txt -ls+url>cfgrurl.txt
FINDSTR /N url cfgrurl.txt>cfgrurl2.txt
sfk filter cfgrurl2.txt -rep _"url = "__>cfgrurl.txt
del cfgrurl2.txt>nul
sfk filter cfgrurl.txt -ls+"1:" -ls!"11:" -lsrep _"1:"_"set cfgrurl="_>cfgrDLsettings.bat
del cfgrurl.txt>nul

::Most Recent Version Release Number
sfk filter updates.txt -ls+release>cfgrrelease.txt
FINDSTR /N release cfgrrelease.txt>cfgrrelease2.txt
sfk filter cfgrrelease2.txt -rep _" "__ -rep _"release="__>cfgrrelease.txt
del cfgrrelease2.txt>nul
sfk filter cfgrrelease.txt -ls+"1:" -ls!"11:" -lsrep _"1:"_"set cfgrrelease="_>>cfgrDLsettings.bat
del cfgrrelease.txt>nul

del updates.txt>nul
call cfgrDLsettings.bat
del cfgrDLsettings.bat>nul



::Download most recent version

if not exist "%DRIVE%\usb-loader\cfgrrev.txt" goto:skip
echo.
echo This app already exists...
echo.
set cfgrreleaseOLD=
attrib -r -h -s "%DRIVE%\usb-loader\cfgrrev.txt"
copy /y "%DRIVE%\usb-loader\cfgrrev.txt" "%DRIVE%\usb-loader\cfgrev.bat">nul
attrib +r +h +s "%DRIVE%\usb-loader\cfgrrev.txt"
call "%DRIVE%\usb-loader\cfgrev.bat"
del "%DRIVE%\usb-loader\cfgrev.bat">nul
echo Current version is %cfgrreleaseOLD%
echo.
echo Checking for updates...
echo.
if %cfgrreleaseOLD% GEQ %cfgrrelease% goto:noupdate
:skip

Echo.
Echo Downloading most recent version: %cfgrrelease%
start %ModMiimin%/wait wget %cfgrurl%
if not exist "%Drive%"\USB-Loader mkdir "%Drive%"\USB-Loader

::Move most recent usb-loader folder to root of drive
7za e -aoa CfgLoaderConfiguratorv%cfgrrelease%.zip -o"%Drive%"\usb-loader\ * -r
del CfgLoaderConfiguratorv%cfgrrelease%.zip>nul


::----simple version check after downloading----
if exist "%DRIVE%"\usb-loader\CfgLoaderConfigurator.exe goto:pass

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2


:pass
echo.
sfk echo [Green]Download Successful
echo.
::save version info for next time!
if exist "%DRIVE%\usb-loader\cfgrrev.txt" attrib -r -h -s "%DRIVE%\usb-loader\cfgrrev.txt"
echo set cfgrreleaseOLD=%cfgrrelease%>"%DRIVE%\usb-loader\cfgrrev.txt"
attrib +r +h +s "%DRIVE%\usb-loader\cfgrrev.txt"
goto:NEXT

:noupdate
sfk echo -spat \x20 [Green] Your current version of %cfgrreleaseOLD% is up to date, skipping download
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next


::--------------------------TANTRIC APPS AUTO-UDPATE------------------------
:TANTRIC


if not exist "%DRIVE%\%path1%\meta.xml" goto:doesntexist

echo.
echo This app already exists...


::get current version if app already exists, skip if its the most recent version
sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
echo.
echo Current version is %currentcode%
echo.
echo Checking for updates...
echo.

:doesntexist
start %ModMiimin%/wait wget "%updateurl%"
sfk filter -quiet update.xml -+"app version" -rep _"<app version=""_"set newcode="_ -write -yes
sfk filter -quiet update.xml -rep _">_""_ -write -yes
sfk filter -quiet update.xml -rep _""""__>code.bat
del update.xml>nul
call code.bat
del code.bat>nul

if not exist "%DRIVE%\%path1%\meta.xml" goto:doesntalreadyexist


if %currentcode% GEQ %newcode% goto:noupdate
echo Updating from %currentcode% to %newcode%
goto:update

:noupdate
sfk echo -spat \x20 [Green] Your current version of %currentcode% is up to date, skipping download
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next

:doesntalreadyexist

::Download most recent version
Echo.
Echo Downloading most recent version: %newcode%
:update
echo.
start %ModMiimin%/wait wget "%code1%%newcode%%code2%"
if not exist "%Drive%"\%path1% mkdir "%Drive%"\%path1%


set wadname="%zip1%%newcode%%zip2%"

7za x -aoa %wadname% -o"%Drive%"
::7za e -aoa %wadname% -o"%Drive%"/%path1% *.%version% -r

del %wadname%

::----simple version check after downloading----
if exist "%DRIVE%\%path1%\meta.xml" goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
::get current version from meta.xml
sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
if %currentcode% GEQ %newcode% goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This file already exists but it failed to update properly.
sfk echo [Yellow] Retrying to download the most recent release of the file.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo [Green]Download Successful
echo.
goto:NEXT







::--------------------------GOOGLE CODE 'MANUAL' AUTO-UDPATE------------------------
:GOOGLEUPDATE


if not exist "%DRIVE%\%path1%\meta.xml" goto:doesntexist

echo.
echo This app already exists...

::get current version if app already exists, skip if its the most recent version
::--------WARNING, if version doesn't start with "R", it will FAIL---------
sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>R"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
echo.
echo Current version is %currentcode%
echo.
echo Checking for updates...
echo.

:doesntexist
start %ModMiimin%/wait wget %updateurl%
move /y %updatedlname% code.bat>nul

sfk filter -quiet code.bat -rep _"*name=R"_"set newcode="_ -rep _".dol&amp;*"__ -write -yes
sfk filter -quiet code.bat -ls+"set newcode" -write -yes
sfk filter -quiet code.bat -unique -write -yes
call code.bat
del code.bat>nul

set newcode0check=%newcode:~0,1%
if /i "%newcode0check%" EQU "0" (set newcodeNoZeros=%newcode:~1,10%) else (set newcodeNoZeros=%newcode%)


if not exist "%DRIVE%\%path1%\meta.xml" goto:doesntalreadyexist

if %currentcode% GEQ %newcodeNoZeros% goto:noupdate
echo Updating from %currentcode% to %newcodeNoZeros%
goto:update

:noupdate
sfk echo -spat \x20 [Green] Your current version of %currentcode% is up to date, skipping download
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next

:doesntalreadyexist

::Download most recent version
Echo.
Echo Downloading most recent version: %newcodeNoZeros%

:update
echo.

start %ModMiimin%/wait wget "%code1%%newcode%%code2%"

if not exist "%Drive%"\%path1% mkdir "%Drive%"\%path1%

::----move file to new location!----
set wadname="%wadname1%%newcode%%wadname2%"
move /y %wadname% "%DRIVE%\%path1%\boot.dol">nul


::----not needed (yet), only applies when downloading zips, not dols---
::set wadname="%zip1%%newcode%%zip2%"
::7za x -aoa %wadname% -o"%Drive%"
::del %wadname%


::geticon if doesn't exist
if not exist "%DRIVE%\%path1%\icon.png" start %ModMiimin%/wait wget %iconurl%
if exist "icon.png" move /Y "icon.png" "%DRIVE%\%path1%\icon.png"

::meta
start %ModMiimin%/wait wget %metaurl%
move /Y meta.xml "%DRIVE%\%path1%\meta.xml"

::create "%DRIVE%\config\WiiXplorer" folder if downloading WiiXplorer
if /i "%name%" NEQ "WiiXplorer (Most Recent Release)" goto:skip
if not exist "%DRIVE%\config\WiiXplorer" mkdir "%DRIVE%\config\WiiXplorer"
:skip

::----simple version check after downloading----
if exist "%DRIVE%\%path1%\meta.xml" goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
::get current version from meta.xml
::-----warning, replacing "R" too, careful when applying to other thigns------
sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>R"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
if %currentcode% EQU %newcodeNoZeros% goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This file already exists but it failed to update properly.
sfk echo [Yellow] Retrying to download the most recent release of the file.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo [Green]Download Successful
echo.
goto:NEXT








::--------------------------------------Cheat Codes: txtcodes from geckocodes.org------------------------------
:CHEATS

::set cheatregion=all

if exist "codeindex.txt" del "codeindex.txt" >nul
if exist "codeindextemp.txt" del "codeindextemp.txt"

echo.
echo       Downloading %cheatregion% Region Cheat Codes for the following console(s):
echo.
if /i "%wiicheat%" EQU "ON" echo                * Wii
if /i "%WiiWarecheat%" EQU "ON" echo                * WiiWare
if /i "%VCArcadecheat%" EQU "ON" echo                * VC Arcade
if /i "%WiiChannelscheat%" EQU "ON" echo                * Wii Channels
if /i "%Gamecubecheat%" EQU "ON" echo                * Gamecube
if /i "%NEScheat%" EQU "ON" echo                * NES/Famicom VC
if /i "%SNEScheat%" EQU "ON" echo                * Super NES/Famicom VC
if /i "%N64cheat%" EQU "ON" echo                * Nintendo 64 VC
if /i "%SMScheat%" EQU "ON" echo                * Sega Master System VC
if /i "%Segacheat%" EQU "ON" echo                * Sega Genesis/Mega Drive VC
if /i "%NeoGeocheat%" EQU "ON" echo                * NeoGeo VC
if /i "%Commodorecheat%" EQU "ON" echo                * Commodore 64 VC
if /i "%MSXcheat%" EQU "ON" echo                * MSX VC
if /i "%TurboGraFX-16cheat%" EQU "ON" echo                * TurboGraFX-16 VC
if /i "%TurboGraFX-CDcheat%" EQU "ON" echo                * TurboGraFX-CD VC
echo.
if /i "%cheatlocation%" EQU "B" echo           Location(s) to save cheats: (txtcodes and codes\X\L)
if /i "%cheatlocation%" EQU "T" echo           Location(s) to save cheats: (txtcodes)
if /i "%cheatlocation%" EQU "C" echo           Location(s) to save cheats: (codes\X\L)
echo.
if /i "%overwritecodes%" EQU "OFF" echo           Overwrite existing txtcodes (Disabled)
if /i "%overwritecodes%" EQU "ON" echo           Overwrite existing txtcodes (Enabled)
echo.
echo       Note: The above settings can be customized in the Cheat Code Options
echo.
echo.
echo   Grabbing current list of cheats from geckocodes.org,
echo   Please wait...
echo.


::---get game/iso list and game count-------
if /i "%cheatlocation%" EQU "C" goto:skip
if not exist "%drive%"\txtcodes mkdir "%drive%"\txtcodes
:skip




::-----------used to get full list of all games---------------
goto:skipcheatrepeat
:cheatrepeat
if exist codeindex.txt copy /y codeindex.txt codeindextemp.txt >nul
if exist codeindex.txt (copy /y codeindextemp.txt+"index*=all" codeindex.txt >nul) else (move /y "index*=all" "codeindex.txt">nul)
if exist "index*=all" del "index*=all" >nul
if exist "codeindextemp.txt" del "codeindextemp.txt" >nul
goto:%nextcheatlist%
:skipcheatrepeat





::--------------ALL REGION---------------
if /i "%cheatregion%" NEQ "all" goto:skipall

::-------Wii Games--------
set nextcheatlist=allwiiwarecheats
if /i "%wiicheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=R&r=*&l=all"
goto:cheatrepeat

::-------WiiWare------
:allwiiwarecheats
set nextcheatlist=allvccheats
if /i "%WiiWarecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=W&r=*&l=all"
goto:cheatrepeat

::-------VC Arcade------
:allVCcheats
set nextcheatlist=allwiichannelcheats
if /i "%VCArcadecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=D&r=*&l=all"
goto:cheatrepeat

::-------Wii Channels------
:allwiichannelcheats
set nextcheatlist=allGCcheats
if /i "%WiiChannelscheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=H&r=*&l=all"
goto:cheatrepeat

::-------Gamecube------
:allGCcheats
set nextcheatlist=allNEScheats
if /i "%Gamecubecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=G&r=*&l=all"
goto:cheatrepeat

::-------NES------
:allNEScheats
set nextcheatlist=allSNEScheats
if /i "%NEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=F&r=*&l=all"
goto:cheatrepeat

::-------SNES------
:allSNEScheats
set nextcheatlist=allN64cheats
if /i "%SNEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=J&r=*&l=all"
goto:cheatrepeat

::-------N64------
:allN64cheats
set nextcheatlist=allSMScheats
if /i "%N64cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=N&r=*&l=all"
goto:cheatrepeat

::-------SMS------
:allSMScheats
set nextcheatlist=allGenesischeats
if /i "%SMScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=L&r=*&l=all"
goto:cheatrepeat

::-------Genesis------
:allGenesischeats
set nextcheatlist=allNEOcheats
if /i "%Segacheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=M&r=*&l=all"
goto:cheatrepeat

::-------NEO------
:allNEOcheats
set nextcheatlist=allCOMcheats
if /i "%NeoGeocheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=E&r=*&l=all"
goto:cheatrepeat

::-------COMMODORE------
:allCOMcheats
set nextcheatlist=allMSXcheats
if /i "%Commodorecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=C&r=*&l=all"
goto:cheatrepeat

::-------MSX------
:allMSXcheats
set nextcheatlist=allT16cheats
if /i "%MSXcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=X&r=*&l=all"
goto:cheatrepeat

::-------T16------
:allT16cheats
set nextcheatlist=allTCDcheats
if /i "%TurboGraFX-16cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=P&r=*&l=all"
goto:cheatrepeat

::-------TCD------
:allTCDcheats
set nextcheatlist=skipall
if /i "%TurboGraFX-CDcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=Q&r=*&l=all"
goto:cheatrepeat

:skipall



::--------------USA REGION---------------
if /i "%cheatregion%" NEQ "USA" goto:skipUSA

::-------Wii Games--------
set nextcheatlist=USAwiiwarecheats
if /i "%wiicheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=R&r=E&l=all"
goto:cheatrepeat

::-------WiiWare------
:USAwiiwarecheats
set nextcheatlist=USAvccheats
if /i "%WiiWarecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=W&r=E&l=all"
goto:cheatrepeat

::-------VC Arcade------
:USAVCcheats
set nextcheatlist=USAwiichannelcheats
if /i "%VCArcadecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=D&r=E&l=all"
goto:cheatrepeat

::-------Wii Channels------
:USAwiichannelcheats
set nextcheatlist=USAGCcheats
if /i "%WiiChannelscheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=H&r=E&l=all"
goto:cheatrepeat

::-------Gamecube------
:USAGCcheats
set nextcheatlist=USANEScheats
if /i "%Gamecubecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=G&r=E&l=all"
goto:cheatrepeat

::-------NES------
:USANEScheats
set nextcheatlist=USASNEScheats
if /i "%NEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=F&r=E&l=all"
goto:cheatrepeat

::-------SNES------
:USASNEScheats
set nextcheatlist=USAN64cheats
if /i "%SNEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=J&r=E&l=all"
goto:cheatrepeat

::-------N64------
:USAN64cheats
set nextcheatlist=USASMScheats
if /i "%N64cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=N&r=E&l=all"
goto:cheatrepeat

::-------SMS------
:USASMScheats
set nextcheatlist=USAGenesischeats
if /i "%SMScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=L&r=E&l=all"
goto:cheatrepeat

::-------Genesis------
:USAGenesischeats
set nextcheatlist=USANEOcheats
if /i "%Segacheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=M&r=E&l=all"
goto:cheatrepeat

::-------NEO------
:USANEOcheats
set nextcheatlist=USACOMcheats
if /i "%NeoGeocheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=E&r=E&l=all"
goto:cheatrepeat

::-------COMMODORE------
:USACOMcheats
set nextcheatlist=USAMSXcheats
if /i "%Commodorecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=C&r=E&l=all"
goto:cheatrepeat

::-------MSX------
:USAMSXcheats
set nextcheatlist=USAT16cheats
if /i "%MSXcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=X&r=E&l=all"
goto:cheatrepeat

::-------T16------
:USAT16cheats
set nextcheatlist=USATCDcheats
if /i "%TurboGraFX-16cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=P&r=E&l=all"
goto:cheatrepeat

::-------TCD------
:USATCDcheats
set nextcheatlist=skipUSA
if /i "%TurboGraFX-CDcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=Q&r=E&l=all"
goto:cheatrepeat

:skipUSA





::--------------PAL REGION---------------
if /i "%cheatregion%" NEQ "PAL" goto:skipPAL

::-------Wii Games--------
set nextcheatlist=PALwiiwarecheats
if /i "%wiicheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=R&r=P&l=all"
goto:cheatrepeat

::-------WiiWare------
:PALwiiwarecheats
set nextcheatlist=PALvccheats
if /i "%WiiWarecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=W&r=P&l=all"
goto:cheatrepeat

::-------VC Arcade------
:PALVCcheats
set nextcheatlist=PALwiichannelcheats
if /i "%VCArcadecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=D&r=P&l=all"
goto:cheatrepeat

::-------Wii Channels------
:PALwiichannelcheats
set nextcheatlist=PALGCcheats
if /i "%WiiChannelscheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=H&r=P&l=all"
goto:cheatrepeat

::-------Gamecube------
:PALGCcheats
set nextcheatlist=PALNEScheats
if /i "%Gamecubecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=G&r=P&l=all"
goto:cheatrepeat

::-------NES------
:PALNEScheats
set nextcheatlist=PALSNEScheats
if /i "%NEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=F&r=P&l=all"
goto:cheatrepeat

::-------SNES------
:PALSNEScheats
set nextcheatlist=PALN64cheats
if /i "%SNEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=J&r=P&l=all"
goto:cheatrepeat

::-------N64------
:PALN64cheats
set nextcheatlist=PALSMScheats
if /i "%N64cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=N&r=P&l=all"
goto:cheatrepeat

::-------SMS------
:PALSMScheats
set nextcheatlist=PALGenesischeats
if /i "%SMScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=L&r=P&l=all"
goto:cheatrepeat

::-------Genesis------
:PALGenesischeats
set nextcheatlist=PALNEOcheats
if /i "%Segacheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=M&r=P&l=all"
goto:cheatrepeat

::-------NEO------
:PALNEOcheats
set nextcheatlist=PALCOMcheats
if /i "%NeoGeocheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=E&r=P&l=all"
goto:cheatrepeat

::-------COMMODORE------
:PALCOMcheats
set nextcheatlist=PALMSXcheats
if /i "%Commodorecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=C&r=P&l=all"
goto:cheatrepeat

::-------MSX------
:PALMSXcheats
set nextcheatlist=PALT16cheats
if /i "%MSXcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=X&r=P&l=all"
goto:cheatrepeat

::-------T16------
:PALT16cheats
set nextcheatlist=PALTCDcheats
if /i "%TurboGraFX-16cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=P&r=P&l=all"
goto:cheatrepeat

::-------TCD------
:PALTCDcheats
set nextcheatlist=skipPAL
if /i "%TurboGraFX-CDcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=Q&r=P&l=all"
goto:cheatrepeat

:skipPAL





::--------------JAP REGION---------------
if /i "%cheatregion%" NEQ "JAP" goto:skipJAP

::-------Wii Games--------
set nextcheatlist=JAPwiiwarecheats
if /i "%wiicheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=R&r=J&l=all"
goto:cheatrepeat

::-------WiiWare------
:JAPwiiwarecheats
set nextcheatlist=JAPvccheats
if /i "%WiiWarecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=W&r=J&l=all"
goto:cheatrepeat

::-------VC Arcade------
:JAPVCcheats
set nextcheatlist=JAPwiichannelcheats
if /i "%VCArcadecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=D&r=J&l=all"
goto:cheatrepeat

::-------Wii Channels------
:JAPwiichannelcheats
set nextcheatlist=JAPGCcheats
if /i "%WiiChannelscheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=H&r=J&l=all"
goto:cheatrepeat

::-------Gamecube------
:JAPGCcheats
set nextcheatlist=JAPNEScheats
if /i "%Gamecubecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=G&r=J&l=all"
goto:cheatrepeat

::-------NES------
:JAPNEScheats
set nextcheatlist=JAPSNEScheats
if /i "%NEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=F&r=J&l=all"
goto:cheatrepeat

::-------SNES------
:JAPSNEScheats
set nextcheatlist=JAPN64cheats
if /i "%SNEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=J&r=J&l=all"
goto:cheatrepeat

::-------N64------
:JAPN64cheats
set nextcheatlist=JAPSMScheats
if /i "%N64cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=N&r=J&l=all"
goto:cheatrepeat

::-------SMS------
:JAPSMScheats
set nextcheatlist=JAPGenesischeats
if /i "%SMScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=L&r=J&l=all"
goto:cheatrepeat

::-------Genesis------
:JAPGenesischeats
set nextcheatlist=JAPNEOcheats
if /i "%Segacheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=M&r=J&l=all"
goto:cheatrepeat

::-------NEO------
:JAPNEOcheats
set nextcheatlist=JAPCOMcheats
if /i "%NeoGeocheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=E&r=J&l=all"
goto:cheatrepeat

::-------COMMODORE------
:JAPCOMcheats
set nextcheatlist=JAPMSXcheats
if /i "%Commodorecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=C&r=J&l=all"
goto:cheatrepeat

::-------MSX------
:JAPMSXcheats
set nextcheatlist=JAPT16cheats
if /i "%MSXcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=X&r=J&l=all"
goto:cheatrepeat

::-------T16------
:JAPT16cheats
set nextcheatlist=JAPTCDcheats
if /i "%TurboGraFX-16cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=P&r=J&l=all"
goto:cheatrepeat

::-------TCD------
:JAPTCDcheats
set nextcheatlist=skipJAP
if /i "%TurboGraFX-CDcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=Q&r=J&l=all"
goto:cheatrepeat

:skipJAP



sfk filter -quiet codeindex.txt -+"index.php?c=******" -write -yes



goto:nextstep
::----------DISABLED------------
::-----remove titles that already exist (if applicable)---------
if /i "%overwritecodes%" EQU "on" goto:nextstep
if not exist "%drive%"\txtcodes\*.txt goto:nextstep
::echo Checking for new cheat codes
::echo This could take a minute, please wait...
::echo.
echo The following cheats already exist and will be removed from the download queue:
echo.
dir /b "%drive%"\txtcodes>existingcodes.txt
sfk filter -quiet existingcodes.txt -+.txt -rep _.txt__ -write -yes
::Loop through the existing list of codes (existingcodes.txt) and remove each existing game from codeindex.txt
for /F "tokens=*" %%A in (existingcodes.txt) do call :processthis %%A
goto:nextstep

:processthis
::this is repeated for each line of the txt.file
::"%*" (no quotes) is the variable for each line as it passes through the loop

set removetitleID=%*
echo Skipping %removetitleID%.txt...
sfk filter -quiet codeindex.txt -!%removetitleID% -write -yes
goto:EOF
:nextstep


if exist existingcodes.txt del existingcodes.txt


sfk filter codeindex.txt -unique -write -yes>nul
FINDSTR /N href codeindex.txt>codeindexfull.txt
del codeindex.txt

::totalcodes
setlocal ENABLEDELAYEDEXPANSION
set totalcodes=0
set codenumber=0
for /f "delims=" %%i in (codeindexfull.txt) do set /a totalcodes=!totalcodes!+1
setlocal DISABLEDELAYEDEXPANSION

echo.
:processcode

copy /y codeindexfull.txt codeindexfull2.txt>nul

if /i "%totalcodes%" EQU "%codenumber%" goto:nextstep
set /a codenumber=%codenumber%+1

sfk filter -quiet codeindexfull2.txt -ls+"%codenumber%:<" -ls!"%codenumber%%codenumber%:<" -ls!"%codenumber%%codenumber%%codenumber%:<" -rep _"*title='*["_"set titleid="_ -rep _"] *"__ -rep _"set titleid=set titleid="_"set titleid="_ -write -yes

::sfk filter -quiet codeindexfull2.txt -ls+"%codenumber%:<" -ls!"%codenumber%%codenumber%:<" -ls!"%codenumber%%codenumber%%codenumber%:<" -rep _"*'Wii ["_"set titleid="_ -rep _"] *"__ -write -yes



FINDSTR /N set codeindexfull2.txt>codeindex.bat
del codeindexfull2.txt

sfk filter -quiet codeindex.bat -ls+"1:" -rep _"1:"__ -write -yes
call codeindex.bat
del codeindex.bat


::now get game name!!
copy /y codeindexfull.txt codeindexTitle.bat>nul
::add in delay so sfk has access to codeindexTitle.bat (Foez reported bug)
::@ping 127.0.0.1 -n 1 -w 1500> nul
sfk filter -quiet codeindexTitle.bat -+"%titleid%" -rep _"*c=%titleid%"_"set titlename="_ -rep _" [%titleid%]*"_"""_ -rep _>__ -write -yes
sfk filter -quiet codeindexTitle.bat -ls+"set titlename=" -write -yes
call codeindexTitle.bat
del codeindexTitle.bat


::if /i "%cheatlocation%" EQU "T" goto:skipconsoleinfo

::now get console!!
copy /y codeindexfull.txt codeindexConsole.bat>nul
sfk filter -quiet codeindexConsole.bat -+"%titleid%" -rep _"*sysn' title='"_"set console="_ -rep _"'>[*"_"""_ -write -yes
sfk filter -quiet codeindexConsole.bat -rep _"""__ -write -yes
sfk filter -quiet codeindexConsole.bat -ls+"set console=" -write -yes
call codeindexConsole.bat
del codeindexConsole.bat

::get console code
set consolecode=
if /i "%console%" EQU "Wii" set consolecode=R
if /i "%console%" EQU "WiiWare" set consolecode=W
if /i "%console%" EQU "VC Arcade" set consolecode=D
if /i "%console%" EQU "GameCube" set consolecode=G
::Wii Channels(H)-currently no codes, so unsure of "Wii Channels"
if /i "%console%" EQU "Wii Channels" set consolecode=H
if /i "%console%" EQU "NES/Famicom VC" set consolecode=F
if /i "%console%" EQU "Super NES/Famicom VC" set consolecode=J
if /i "%console%" EQU "Nintendo 64 VC" set consolecode=N
if /i "%console%" EQU "Sega Master System VC" set consolecode=L
if /i "%console%" EQU "Sega Genesis/Mega Drive VC" set consolecode=M
if /i "%console%" EQU "NeoGeo VC" set consolecode=E
if /i "%console%" EQU "Commodore 64 VC" set consolecode=C
if /i "%console%" EQU "MSX VC" set consolecode=X
if /i "%console%" EQU "TurboGraFX-16 VC" set consolecode=P
if /i "%console%" EQU "TurboGraFX-CD VC" set consolecode=Q

::get first letter of titlename (actually second letter cuz first one is ")
set letter1=%titlename:~1,1%
if /i "%letter1%" EQU "0" set letter1=#
if /i "%letter1%" EQU "1" set letter1=#
if /i "%letter1%" EQU "2" set letter1=#
if /i "%letter1%" EQU "3" set letter1=#
if /i "%letter1%" EQU "4" set letter1=#
if /i "%letter1%" EQU "5" set letter1=#
if /i "%letter1%" EQU "6" set letter1=#
if /i "%letter1%" EQU "7" set letter1=#
if /i "%letter1%" EQU "8" set letter1=#
if /i "%letter1%" EQU "9" set letter1=#

:skipconsoleinfo

::echo %titlename%
::echo %titleid%
::echo %console%
::echo %consolecode%
::echo %letter1%

echo.
echo Downloading Cheat %codenumber% of %totalcodes%: %titlename% [%titleid%]

if /i "%cheatlocation%" EQU "T" goto:skip
if not exist "%drive%\codes\%consolecode%\%letter1%" mkdir "%drive%\codes\%consolecode%\%letter1%"
:skip

if /i "%overwritecodes%" EQU "on" goto:overwritecheat


::----copy existing codes to alternate location if missing----
if /i "%cheatlocation%" EQU "C" goto:skip
if not exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" goto:skip
if not exist "%drive%\txtcodes\%titleid%.txt" echo Copying from codes\%consolecode%\%letter1%\%titleid%.txt to txtcodes\%titleid%.txt
if not exist "%drive%\txtcodes\%titleid%.txt" copy /y "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" "%drive%\txtcodes\%titleid%.txt">nul
:skip
if /i "%cheatlocation%" EQU "T" goto:skip
if not exist "%drive%\txtcodes\%titleid%.txt" goto:skip
if not exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" echo Copying from txtcodes\%titleid%.txt to codes\%consolecode%\%letter1%\%titleid%.txt
if not exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" copy /y "%drive%\txtcodes\%titleid%.txt" "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt">nul
:skip

if /i "%cheatlocation%" EQU "C" goto:skip
if not exist "%drive%\txtcodes\%titleid%.txt" goto:downloadcheat
:skip

if /i "%cheatlocation%" EQU "T" goto:skip
if not exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" goto:downloadcheat
:skip

echo %titleid%.txt already exists,
echo Skipping download...
echo.
goto:processcode

:overwritecheat
if /i "%cheatlocation%" EQU "C" goto:skip
if exist "%drive%\txtcodes\%titleid%.txt" echo Overwriting %drive%\txtcodes\%titleid%.txt...
:skip
if /i "%cheatlocation%" EQU "T" goto:skip
if exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" echo Overwriting %drive%\codes\%consolecode%\%letter1%\%titleid%.txt...
:skip

:downloadcheat
start %ModMiimin%/wait wget "http://www.geckocodes.org/txt.php?txt=%titleid%"

if /i "%cheatlocation%" EQU "T" move /y "txt.php@txt=%titleid%" "%drive%\txtcodes\%titleid%.txt">nul
if /i "%cheatlocation%" EQU "C" move /y "txt.php@txt=%titleid%" "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt">nul

if /i "%cheatlocation%" EQU "B" copy /y "txt.php@txt=%titleid%" "%drive%\txtcodes\%titleid%.txt">nul
if /i "%cheatlocation%" EQU "B" move /y "txt.php@txt=%titleid%" "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt">nul

::for some reason VC downloads fail, and they leave index.html as a trace instead
::if exist index.html del index.html

goto:processcode

:nextstep

del codeindexfull.txt
del codeindexfull2.txt

goto:NEXT


::--------------------------------------Manual Update for Neogamma and YAWMM------------------------------
:MANUALUPDATE

if not exist "%DRIVE%\%path1%\meta.xml" goto:UpdateCheck

echo.
echo This app already exists...


::get current version if app already exists, skip if its the most recent version
sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
echo.
echo Current version is %currentcode%
echo.
echo Checking for updates...
echo.


:UpdateCheck
start %ModMiimin%/wait wget "%updateurl%"
move /y ManualUpdate.txt ManualUpdate.bat>nul

call ManualUpdate.bat
del ManualUpdate.bat>nul

if not exist "%DRIVE%\%path1%\meta.xml" goto:Update

if /i "%currentcode%" EQU "%newcode%" goto:noupdate
::echo Updating from %currentcode% to %newcode%
echo Updating to most recent version...


goto:update

:noupdate
sfk echo -spat \x20 [Green] Your current version of %currentcode% is up to date, skipping download

@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next

::Download most recent version
:update
echo.
start %ModMiimin%/wait wget %code2%

if not exist "%Drive%"\%path1% mkdir "%Drive%"\%path1%

if /i "%path1%" NEQ "apps\neogamma" goto:normal
7za x -aoa "*-NeoGammaR9*.zip" -o"%Drive%" apps neogamma -r
7za e -aoa "*-NeoGammaR9*.zip" -o"%Drive%"/%path1% *.%version% -x!"gameconfig.txt" -x!"sourcecode" -r
goto:skip
:normal

7za e -aoa %wadname% -o"%Drive%"/%path1% *.%version% -r
:skip

del %wadname%


::----simple version check after downloading----
if exist "%DRIVE%\%path1%\meta.xml" goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
::get current version from meta.xml
sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
if /i "%currentcode%" EQU "%newcode%" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This file already exists but it failed to update properly.
sfk echo [Yellow] Retrying to download the most recent release of the file.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo [Green]Download Successful
echo.
goto:NEXT




::------------------------NUS File Grabber Downloader---------------------

:DownloadApp

if /i "%code1%" EQU "MYMAPP" goto:MYMAPP

::SNEEKAPP
if not exist "%Drive%"\SNEEKFILES mkdir "%Drive%"\SNEEKFILES
goto:skip

:MYMAPP
if not exist "%Drive%"\MyMenuify_Themes mkdir "%Drive%"\MyMenuify_Themes
:skip


set filename=%wadname%
if /i "%code1%" EQU "SNEEKAPP" set path1=SNEEKFILES\
if /i "%code1%" EQU "MYMAPP" set path1=MyMenuify_Themes\
set md5alt=%md5%
goto:DownloadURL


:DownloadApp2


set dlname=%wadname:~0,8%.app

if exist temp\%wadname% goto:AlreadyinTemp

nusfilegrabber.exe %version%
move /Y "%dlname%" temp\%wadname%

:AlreadyinTemp
if /i "%code1%" EQU "MYMAPP" copy /Y temp\"%wadname%" "%Drive%"\MyMenuify_Themes\%wadname%>nul
if /i "%code1%" EQU "SNEEKAPP" copy /Y temp\"%wadname%" "%Drive%"\SNEEKFILES\%wadname%>nul

goto:URLverifyretry




::-------------------------Download from URLs------------------------------
:DownloadURL

echo %md5% *%path1%%filename%>> "%Drive%"\Download_Log.md5

::----if exist and fails md5 check, delete and redownload----
if not exist "%Drive%\%path1%%filename%" goto:nocheckexisting
set md5check=
sfk md5 -quiet -verify %md5% "%Drive%\%path1%%filename%"
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%\%path1%%filename%"
if exist temp\%wadname% del temp\%wadname%
goto:DOWNLOADSTART2

:pass
sfk echo [Green]This file already exists and has been verified, Skipping download
echo.
goto:NEXT
:nocheckexisting

if /i "%code1%" EQU "MYMAPP" goto:DownloadApp2
if /i "%code1%" EQU "SNEEKAPP" goto:DownloadApp2


:DownloadURL2
if not exist temp\%wadname% start %ModMiimin%/wait wget %code2%
if exist %dlname% move /y %dlname% temp\%wadname%
7za e -aoa temp\%wadname% -o"%Drive%"/%path1% *.%version% -r



:URLverifyretry
if "%DRIVErestore%"=="" set DRIVErestore=%Drive%
::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%\%path1%%filename%" goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
set DRIVE=%DRIVErestore%
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
if exist temp\%wadname% del temp\%wadname%
set DRIVE=%DRIVErestore%
goto:DOWNLOADSTART2

:checkexisting
set md5check=
sfk md5 -quiet -verify %md5% "%Drive%\%path1%%filename%"
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del "%Drive%\%path1%%filename%"
if exist temp\%wadname% del temp\%wadname%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
set DRIVE=%DRIVErestore%
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
set DRIVE=%DRIVErestore%
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo [Green]Download Successful
echo.
set DRIVE=%DRIVErestore%
goto:NEXT





:fullextract

set LocalAbsolute=
set DRIVErestore=%Drive%

if /i "%wadname%" EQU "WiiBackupManager.zip" goto:doit
if /i "%wadname%" EQU "FAT32_GUI_Formatter.exe" goto:doit
goto:skip
:doit
if /i "%PCSAVE%" EQU "Local" (set DRIVE=%homedrive%\ModMii\Program Files) & (set LocalAbsolute=%homedrive%\ModMii\Program Files\)
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" EQU "%ModMiipath:~0,2%" (set DRIVE=%homedrive%\ModMii\Program Files) & (set LocalAbsolute=%homedrive%\ModMii\Program Files\)
:skip
if not exist "%Drive%" mkdir "%Drive%"
echo %md5% *%LocalAbsolute%%path1%%filename%>> "%Driverestore%"\Download_Log.md5


::----if exist and fails md5 check, delete and redownload----
if not exist "%Drive%\%path1%%filename%" goto:nocheckexisting
set md5check=
sfk md5 -quiet -verify %md5% "%Drive%\%path1%%filename%"
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%\%path1%%filename%"
if exist temp\%wadname% del temp\%wadname%
set DRIVE=%DRIVErestore%
goto:DOWNLOADSTART2

:pass
sfk echo [Green]This file already exists and has been verified, Skipping download
echo.
set DRIVE=%DRIVErestore%
goto:NEXT
:nocheckexisting


:fullextract2

if exist temp\%wadname% goto:FullExtractZipAlreadyExists

if not exist temp\%dlname% start %ModMiimin%/wait wget %code2%

if exist %dlname% move /y %dlname% temp\%wadname%

:FullExtractZipAlreadyExists

::extract selected apps differently...
if /i "%wadname%" EQU "indiana-pwns.zip" 7za X -aoa temp\%wadname% -o"%Drive%" private -r
if /i "%wadname%" EQU "indiana-pwns.zip" goto:skipnormalextraction

if /i "%wadname%" EQU "bathaxx.zip" 7za X -aoa temp\%wadname% -o"%Drive%" private -r
if /i "%wadname%" EQU "bathaxx.zip" goto:skipnormalextraction

if /i "%wadname%" EQU "return-jodi.zip" 7za X -aoa temp\%wadname% -o"%Drive%" private -r
if /i "%wadname%" EQU "return-jodi.zip" goto:skipnormalextraction

if /i "%wadname%" EQU "EriHaKawai-USA+PAL.zip" 7za X -aoa temp\%wadname% -o"%Drive%" private -r
if /i "%wadname%" EQU "EriHaKawai-USA+PAL.zip" goto:skipnormalextraction

if /i "%wadname%" EQU "USBLoader(s)-ahbprot58-SD-USB-v9-IDCL.zip" 7za e -aoa temp\%dlname% -o"%Drive%"/WAD *.%version% -r
if /i "%wadname%" EQU "USBLoader(s)-ahbprot58-SD-USB-v9-IDCL.zip" goto:skipnormalextraction


if /i "%wadname%" NEQ "JoyFlow_Forwarder_wad_dol.zip" goto:skipjoyflow
if /i "%MENU1%" EQU "S" (7za e -aoa temp\%dlname% -o"%Drive%"/ *.wad *.dol -r) else (7za X -aoa temp\%dlname% -o"%Drive%" -r)
goto:skipnormalextraction
:skipjoyflow


if /i "%wadname%" NEQ "switch2uneek_ModMiiBundle.zip" goto:skipS2U

if /i "%MENU1%" EQU "S" 7za e -aoa temp\%dlname% -o"%Drive%"/ switch2uneek(emulators)-4EMUNand-v9-S2RL.wad -r
if /i "%MENU1%" EQU "S" goto:skipnormalextraction
::for when MENU1 not equal to "S"
7za x -aoa temp\%dlname% -o"%Drive%" -r -x!switch2uneek(emulators)-4EMUNand-v9-S2RL.wad

if not exist "%DRIVEU%" mkdir "%DRIVEU%"
if not exist "%DRIVEU%"\nandpath.txt echo NOFILE>"%DRIVEU%"\nandpath.txt
if exist "%DRIVEU%"\nandslot.bin goto:skipnormalextraction
echo 00000000>dump.txt
sfk filter dump.txt +hextobin "%DRIVEU%"\nandslot.bin
del dump.txt>nul
goto:skipnormalextraction
:skipS2U

if /i "%wadname%" NEQ "Homebrew_Filter_r32.wad" goto:skipHBF

if /i "%MENU1%" EQU "S" goto:tinyskip
if not exist "%Drive%\WAD" mkdir "%Drive%\WAD"
:tinyskip

if not exist "%Drive%\%path1%%wadname%" copy /y "temp\%wadname%" "%Drive%\%path1%%wadname%">nul
goto:skipnormalextraction
:skipHBF


if /i "%wadname%" EQU "WiiBackupManager.zip" goto:doit
if /i "%wadname%" EQU "FAT32_GUI_Formatter.exe" goto:doit
goto:skip
:doit
if /i "%PCSAVE%" EQU "Local" (set DRIVE=%homedrive%\ModMii\Program Files) & (set LocalAbsolute=%homedrive%\ModMii\Program Files\)
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" EQU "%ModMiipath:~0,2%" (set DRIVE=%homedrive%\ModMii\Program Files) & (set LocalAbsolute=%homedrive%\ModMii\Program Files\)
:skip
if not exist "%Drive%" mkdir "%Drive%"
echo %md5% *%LocalAbsolute%%path1%%filename%>> "%Driverestore%"\Download_Log.md5




if /i "%filename%" NEQ "WiiBackupManager.exe" goto:notWBM
if exist "%DRIVE%"\WiiBackupManager rd /s /q "%DRIVE%"\WiiBackupManager
7za x -aoa temp\%wadname% -o"%Drive%" -r
rename "%Drive%"\%dlname:~0,-4% WiiBackupManager

if /i "%PCSAVE%" EQU "Local" goto:createshortcuts
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" EQU "%ModMiipath:~0,2%" (goto:createshortcuts) else (goto:skip)
:createshortcuts
nircmd.exe shortcut "%DRIVE%\WiiBackupManager\WiiBackupManager.exe" "~$folder.desktop$" "WiiBackupManager"
nircmd.exe shortcut "%DRIVE%\WiiBackupManager\WiiBackupManager.exe" "~$folder.programs$\WiiBackupManager" "WiiBackupManager"
:skip
goto:skipnormalextraction
:notWBM


if /i "%filename%" NEQ "FAT32_GUI_Formatter.exe" goto:notF32
if not exist "%DRIVE%"\FAT32_GUI_Formatter mkdir "%DRIVE%"\FAT32_GUI_Formatter
if /i "%Drive%" NEQ "temp" copy /y temp\%wadname% "%Drive%\%path1%FAT32_GUI_Formatter.exe">nul

if /i "%PCSAVE%" EQU "Local" goto:createshortcuts
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" EQU "%ModMiipath:~0,2%" (goto:createshortcuts) else (goto:skip)
:createshortcuts
nircmd.exe shortcut "%Drive%\%path1%FAT32_GUI_Formatter.exe" "~$folder.desktop$" "FAT32 GUI Formatter"
nircmd.exe shortcut "%Drive%\%path1%FAT32_GUI_Formatter.exe" "~$folder.programs$\FAT32 GUI Formatter" "FAT32 GUI Formatter"
:skip
goto:skipnormalextraction
:notF32

if /i "%wadname%" EQU "twilight_hack_v0.1_beta1.zip" 7za X -aoa temp\%wadname% -o"%Drive%" private -r
if /i "%wadname%" EQU "twilight_hack_v0.1_beta1.zip" goto:skipnormalextraction
if /i "%path1%" EQU "apps\homebrew_browser\" 7za X -aoa temp\%wadname% -o"%Drive%"\apps homebrew_browser -r
if /i "%path1%" EQU "apps\homebrew_browser\" goto:skipnormalextraction

if /i "%wadname%" EQU "YU-GI-OWNED-ALL.zip" 7za X -aoa temp\%wadname% -o"%Drive%" private -r
if /i "%wadname%" EQU "YU-GI-OWNED-ALL.zip" goto:skipnormalextraction

if /i "%wadname%" EQU "DOP-Mii_v13.zip" 7za e -aoa temp\%wadname% -o"%Drive%"/%path1% -x!*.cfg
if /i "%wadname%" EQU "DOP-Mii_v13.zip" rd /s /q "%Drive%\%path1%DOP-Mii" -r >nul
if /i "%wadname%" EQU "DOP-Mii_v13.zip" rd /s /q "%Drive%\%path1%DOP-Mii v13" -r >nul
if /i "%wadname%" EQU "DOP-Mii_v13.zip" rd /s /q "%Drive%\%path1%config" -r >nul
if /i "%wadname%" EQU "DOP-Mii_v13.zip" rd /s /q "%Drive%\%path1%apps" -r >nul
if /i "%wadname%" EQU "DOP-Mii_v13.zip" mkdir "%DRIVE%\config"
if /i "%wadname%" EQU "DOP-Mii_v13.zip" move /y "%Drive%\%path1%\DOP-Mii.cfg" "%Drive%\config\DOP-Mii.cfg" >nul
if /i "%wadname%" EQU "DOP-Mii_v13.zip" goto:skipnormalextraction


7za x -aoa temp\%wadname% -o"%Drive%" -x!README
:skipnormalextraction

goto:URLverifyretry
::DONE (will retry if necessary)



:DownloadhacksToRoot
echo %md5% *hacks.ini>> "%Drive%"\Download_Log.md5

::----if exist and fails md5 check, delete and redownload----
if not exist "%Drive%"\hacks.ini goto:nocheckexisting
set md5check=
sfk md5 -quiet -verify %md5% "%Drive%"\hacks.ini
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del "%Drive%"\hacks.ini
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
if exist temp\%wadname% del temp\%wadname%
goto:DOWNLOADSTART2

:pass
sfk echo [Green]This file already exists and has been verified, Skipping download
echo.
goto:NEXT
:nocheckexisting


if not exist temp\%wadname% start %ModMiimin%/wait wget %code2%
if exist %wadname% move /y %wadname% temp\%wadname%
7za e -aoa temp\%wadname% -o"%Drive%" *.%version% -r


::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%"\hacks.ini goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
if exist temp\%wadname% del temp\%wadname%
goto:DOWNLOADSTART2

:checkexisting
set md5check=
sfk md5 -quiet -verify %md5% "%Drive%"\hacks.ini
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del "%Drive%"\hacks.ini
if exist temp\%wadname% del temp\%wadname%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo [Green]Download Successful
echo.
goto:NEXT



::---------------CustomDL--------------------------
:CUSTOMDL
echo     Note that custom downloads are not verified, and are not necessarily safe.
echo     Make sure you know what you're doing! Use at your own risk!
echo.


if /i "%DEC%" EQU "SM" set HEX=00000002
if /i "%DEC%" EQU "MIOS" set HEX=00000101
if /i "%DEC%" EQU "SM" goto:skiphexcalc
if /i "%DEC%" EQU "MIOS" goto:skiphexcalc

sfk hex %DEC% -digits=8 >hex.txt


::Loop through the the following once for EACH line in whatever.txt
for /F "tokens=*" %%A in (hex.txt) do call :processhexx %%A
goto:skiphexcalc

:processhexx
::this is repeated for each line of the txt.file
::"%*" (no quotes) is the variable for each line as it passes through the loop
set hex=%*
goto:EOF


:skiphexcalc

if exist hex.txt del hex.txt>nul

if not exist "%DRIVE%"\WAD mkdir "%DRIVE%"\WAD

echo If you encounter long periods of inactivity run UnfreezeMii.bat to continue
echo.
nusd 00000001%HEX% "%VER%"


::if not exist 00000001%HEX%\00000001%HEX%.wad goto:missing


if /i "%DEC%" EQU "SM" goto:SYSMENU
if /i "%DEC%" EQU "MIOS" goto:MIOS2



::IOS

if /i "%ROOTSAVE%" EQU "OFF" (set wadfolder=WAD\) else (set wadfolder=)

if exist 00000001%HEX%\00000001%HEX%.wad move /Y 00000001%HEX%\00000001%HEX%.wad "%Drive%"\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad>nul

if /i "%verfinal%" EQU "NEW" goto:option1notNUS

if /i "%OPTION1%" EQU "ON" goto:option1on
if /i "%OPTION1%" EQU "ALL" (goto:option1on) else (goto:option1noton)
:option1on
if not exist "%Drive%"\00000001\%HEX%\v%verfinal% mkdir "%Drive%"\00000001\%HEX%\v%verfinal%
if exist 00000001%HEX% copy /Y 00000001%HEX% "%Drive%"\00000001\%HEX%\v%verfinal% >nul
:option1noton

if /i "%OPTION1%" EQU "NUS" goto:option1NUS
if /i "%OPTION1%" EQU "ALL" (goto:option1NUS) else (goto:option1notNUS)
:option1NUS
if not exist "%Drive%"\NUS\00000001%HEX%v%verfinal% mkdir "%Drive%"\NUS\00000001%HEX%v%verfinal%
copy /y 00000001%HEX% "%Drive%"\NUS\00000001%HEX%v%verfinal% >nul
:option1notNUS




if exist 00000001%HEX% rd /s /q 00000001%HEX%


echo.

if /i "IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad" EQU "IOS%DEC%v%VERFINAL%.wad" goto:nopatching


if exist "%DRIVE%"\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad (patchios "%DRIVE%"\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad%PATCHCODE%%slotcode%%versioncode%) & (echo.) & (echo Note: Patches are not always successful, read the PatchIOS log above for details)
:nopatching

if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%DRIVE%\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad" -write -yes

if exist "%DRIVE%\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad" (echo "%DRIVE%\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad: Found">>temp\simplelog.txt) else (echo "%DRIVE%\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad: Missing">>temp\simplelog.txt)

sfk filter -quiet "temp\simplelog.txt" -rep _"""__ -write -yes



if exist "%DRIVE%"\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad (goto:there) else (goto:missing)



:SYSMENU
move /Y 00000001%HEX%\00000001%HEX%.wad "%Drive%"\%wadfolder%SystemMenu-NUS-v%VERFINAL%.wad>nul

if /i "%verfinal%" EQU "NEW" goto:option1notNUS

if /i "%OPTION1%" EQU "ON" goto:option1on
if /i "%OPTION1%" EQU "ALL" (goto:option1on) else (goto:option1noton)
:option1on
if not exist "%Drive%"\00000001\%HEX%\v%verfinal% mkdir "%Drive%"\00000001\%HEX%\v%verfinal%
if exist 00000001%HEX% copy /Y 00000001%HEX% "%Drive%"\00000001\%HEX%\v%verfinal% >nul
:option1noton

if /i "%OPTION1%" EQU "NUS" goto:option1NUS
if /i "%OPTION1%" EQU "ALL" (goto:option1NUS) else (goto:option1notNUS)
:option1NUS
if not exist "%Drive%"\NUS\00000001%HEX%v%verfinal% mkdir "%Drive%"\NUS\00000001%HEX%v%verfinal%
copy /y temp\%code1%\%code2%\v%version% "%Drive%"\NUS\00000001%HEX%v%verfinal% >nul
:option1notNUS


rd /s /q 00000001%HEX%

if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%Drive%\%wadfolder%SystemMenu-NUS-v%VERFINAL%.wad" -write -yes

if exist "%Drive%"\%wadfolder%SystemMenu-NUS-v%VERFINAL%.wad (echo "%Drive%\%wadfolder%SystemMenu-NUS-v%VERFINAL%.wad: Found">>temp\simplelog.txt) else (echo "%Drive%\%wadfolder%SystemMenu-NUS-v%VERFINAL%.wad: Missing">>temp\simplelog.txt)

sfk filter -quiet "temp\simplelog.txt" -rep _"""__ -write -yes

if exist "%Drive%"\%wadfolder%SystemMenu-NUS-v%VERFINAL%.wad (goto:there) else (goto:missing)



:MIOS2
if /i "%ROOTSAVE%" EQU "OFF" (set wadfolder=WAD\) else (set wadfolder=)
move /Y 00000001%HEX%\00000001%HEX%.wad "%Drive%"\%wadfolder%RVL-mios-v%VERFINAL%.wad>nul

if /i "%verfinal%" EQU "NEW" goto:option1notNUS

if /i "%OPTION1%" EQU "ON" goto:option1on
if /i "%OPTION1%" EQU "ALL" (goto:option1on) else (goto:option1noton)
:option1on
if not exist "%Drive%"\00000001\%HEX%\v%verfinal% mkdir "%Drive%"\00000001\%HEX%\v%verfinal%
if exist 00000001%HEX% copy /Y 00000001%HEX% "%Drive%"\00000001\%HEX%\v%verfinal% >nul
:option1noton

if /i "%OPTION1%" EQU "NUS" goto:option1NUS
if /i "%OPTION1%" EQU "ALL" (goto:option1NUS) else (goto:option1notNUS)
:option1NUS
if not exist "%Drive%"\NUS\00000001%HEX%v%verfinal% mkdir "%Drive%"\NUS\00000001%HEX%v%verfinal%
copy /y temp\%code1%\%code2%\v%version% "%Drive%"\NUS\00000001%HEX%v%verfinal% >nul
:option1notNUS


rd /s /q 00000001%HEX%

if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%Drive%\%wadfolder%RVL-mios-v%VERFINAL%.wad" -write -yes

if exist "%Drive%"\%wadfolder%RVL-mios-v%VERFINAL%.wad (echo "%Drive%\%wadfolder%RVL-mios-v%VERFINAL%.wad: Found">>temp\simplelog.txt) else (echo "%Drive%\%wadfolder%RVL-mios-v%VERFINAL%.wad: Missing">>temp\simplelog.txt)

sfk filter -quiet "temp\simplelog.txt" -rep _"""__ -write -yes

if exist "%Drive%"\%wadfolder%RVL-mios-v%VERFINAL%.wad (goto:there) else (goto:missing)


::----check after downloading - if md5 check fails, delete and redownload----

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
sfk echo -spat \x20 \x20 \x20 [Magenta] Most likely reason is that the file does not exist.
sfk echo -spat \x20 \x20 \x20 [Magenta] Double check your custom values.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
::if exist temp\%wadname% del temp\%wadname%
goto:DOWNLOADSTART2

:there
echo.
sfk echo [Green]Advanced Download Successful

goto:NEXT



::---------------HackMii Installer WGET Download CODE-----------------------

:wget

echo %md5% *apps\HackMii_Installer\boot.elf>> "%Drive%"\Download_Log.md5

::----if exist and fails md5 check, delete and redownload----
if not exist "%Drive%"\apps\HackMii_Installer\boot.elf goto:nocheckexisting
set md5check=
sfk md5 -quiet -verify %md5% "%Drive%"\apps\HackMii_Installer\boot.elf
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del "%Drive%"\apps\HackMii_Installer\boot.elf
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
if exist temp\%wadname% del temp\%wadname%
goto:DOWNLOADSTART2

:pass
sfk echo [Green]This file already exists and has been verified, Skipping download
echo.
COPY /Y "%Drive%"\apps\HackMii_Installer\boot.elf "%Drive%"\boot.elf> nul
COPY /Y "%Drive%"\apps\HackMii_Installer\bootmini.elf "%Drive%"\bootmini.elf> nul
goto:alreadyhavehackmii
:nocheckexisting




if not exist temp\%wadname% start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --reject "*.html" --reject "%2A" %code2%*
move /y get.*.* temp\%wadname%

::7za e -aoa %wadname% -o"%Drive%"/%path1% *.%version% -r
if not exist "%Drive%"\apps\HackMii_Installer mkdir "%Drive%"\apps\HackMii_Installer
7za e -aoa temp\%wadname% -o"%Drive%"\apps\HackMii_Installer *.%version% *.txt -r
7za e -aoa temp\%wadname% -o"%Drive%" *.%version% -r



::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%"\apps\HackMii_Installer\boot.elf goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
goto:NEXT

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
if exist temp\%wadname% del temp\%wadname%
goto:DOWNLOADSTART2

:checkexisting
set md5check=
sfk md5 -quiet -verify %md5% "%Drive%"\apps\HackMii_Installer\boot.elf
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo [Yellow] This file already exists but it failed MD5 verification.
sfk echo [Yellow] The current version of the file will be deleted and the file will be re-downloaded.
echo.
del "%Drive%"\apps\HackMii_Installer\boot.elf
if exist temp\%wadname% del temp\%wadname%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo [Green]Download Successful
echo.
::goto:NEXT


:alreadyhavehackmii
if /i "%MENU1%" EQU "H" goto:RenameBootToHackMii
if /i "%virgin%" EQU "N" goto:next
if /i "%REGION%" EQU "K" goto:RenameBootToHackMii
goto:next


::-----Bannerbomb MMM instead of HackMii installer------
:RenameBootToHackMii
if exist "%Drive%"\apps\MMM\MMMv13.4boot.elf copy /Y "%Drive%"\apps\MMM\MMMv13.4boot.elf "%Drive%"\boot.elf >nul
goto:next


::----------------------NEXT----------------------
:NEXT

::if using nand builder, copy files to install folder
if /i "%MENU1%" NEQ "S" goto:skip
if /i "%category%" EQU "themes" goto:skip
if /i "%WADNAME%" EQU "PriiloaderHacks.zip" goto:skip
if "%wadname:~-4%" NEQ ".wad" (set movename="%wadname%.wad") else (set movename="%wadname%")
if /i "%category%" EQU "fullextract" set movename="%filename%"

:move
move /Y "%Drive%"\%movename% "%DRIVE%"\install2sneek\%movename% >nul
:skip


if /i "%category%" EQU "userdefined" goto:quickskip
if /i "%AdvancedDownload%" EQU "Y" goto:customcopyandpatch
:quickskip
sfk filter -quiet "temp\DLgotos.txt" -le!"%CurrentDLNAME%" -write -yes

goto:DLSETTINGS3






::-----------------------------------------cUSTOM COPY AND PATCH (only for advanced downloads)--------------------------------
:customcopyandpatch

if /i "%loadorgo%" EQU "load" goto:ADVPAGE2

if "%wadname:~-4%" EQU ".wad" set wadname=%wadname:~0,-4%


::remove original md5 from download_log only if it appears ONCE in the log.
::If there are 2 in the log it means the original cIOS was also in the queue
findstr %md5% "%DRIVE%\Download_Log.md5">temp\simplecountlines.txt
SET simplecountlines=0
::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\simplecountlines.txt) do call :simplecountlines %%A
goto:skip
:simplecountlines
SET /a simplecountlines=%simplecountlines%+1
goto:EOF
:skip
if exist temp\simplecountlines.txt del temp\simplecountlines.txt>nul
if /i "%simplecountlines%" EQU "1" sfk filter -quiet "%Drive%"\Download_Log.md5 -ls!"%md5%" -write -yes

::move from WAD folder
if "%alreadyexists%" EQU "yes" goto:makeacopy
if exist "%DRIVE%"\WAD\%wadname%.wad move /Y "%DRIVE%"\WAD\%wadname%.wad "%DRIVE%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad>nul
goto:nocopy

:makeacopy
if exist "%DRIVE%"\WAD\%wadname%.wad copy /Y "%DRIVE%"\WAD\%wadname%.wad "%DRIVE%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad>nul
:nocopy



if exist "%DRIVE%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad goto:copyisthere


if not exist "%DRIVE%"\WAD mkdir "%DRIVE%"\WAD >nul


::move from root
if "%alreadyexists%" EQU "yes" goto:makeacopy
if exist "%DRIVE%"\%wadname%.wad move /Y "%DRIVE%"\%wadname%.wad "%DRIVE%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad>nul
::remove original md5 from download_log
sfk filter -quiet "%Drive%"\Download_Log.md5 -le!"%wadname%.wad" -write -yes
goto:nocopy

:makeacopy
if exist "%DRIVE%"\%wadname%.wad copy /Y "%DRIVE%"\%wadname%.wad "%DRIVE%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad>nul
:nocopy



if exist "%DRIVE%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad (goto:copyisthere) else (goto:missing)



:copyisthere

echo.
patchios "%DRIVE%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad%PATCHCODE%%slotcode%%versioncode%
echo.
echo Note: Patches are not always successful, read the PatchIOS log above for details
echo.
:nopatching


if exist "%DRIVE%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad goto:there

::----check after Advanced downloading----

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo [Magenta] This file has failed to download properly multiple times, Skipping download.
echo.
sfk filter -quiet "temp\DLgotos.txt" -ls!"%CurrentDLNAME%" -write -yes

if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad" -write -yes

echo "%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad: Missing">>temp\simplelog.txt

sfk filter -quiet "temp\simplelog.txt" -rep _"""__ -write -yes

goto:DLSETTINGS3

:missingretry
echo.
sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:there

::prevent cIOSs showing error message when hex editing disabled
if /i "%basewad%" EQU "none" goto:notacios
if /i "%HEXEDIT%" EQU "Y" goto:notacios
sfk echo [Yellow] Unable to verify because ModMii's Hex Editing option is not enabled
if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad" -write -yes
echo "%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad: Found but unable to verify">>temp\simplelog.txt
goto:miniskip
:notacios

if /i "%multiplefail%" EQU "Y" (sfk echo [Magenta] Base wad failed hash check multiple times, Advanced download probably corrupted) else (sfk echo [Green]Advanced Download Successful)
echo.

if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad" -write -yes


if /i "%multiplefail%" EQU "Y" (echo "%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad: Found but potentially corrupt">>temp\simplelog.txt) else (echo "%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad: Found">>temp\simplelog.txt)

:miniskip
sfk filter -quiet "temp\simplelog.txt" -rep _"""__ -write -yes


sfk filter -quiet "temp\DLgotos.txt" -ls!"%CurrentDLNAME%" -write -yes
goto:DLSETTINGS3




::---------------------------------------SNEEKINSTALLER----------------------------------



:SNEEKINSTALLER
cls
if not exist "%DRIVE%" mkdir "%DRIVE%"
if /i "%SNEEKTYPE%" EQU "UD" goto:checkdriveU
if /i "%SNEEKTYPE%" EQU "U" (goto:checkdriveU) else (goto:skip)
:checkdriveU
if not exist "%DRIVEU%" mkdir "%DRIVEU%"
:skip


::delete all files that may interfere with SNEEK
if exist "%DRIVE%"\SNEEK\kernel.bin del "%DRIVE%"\SNEEK\kernel.bin
if exist "%DRIVE%"\SNEEK\di.bin del "%DRIVE%"\SNEEK\di.bin
if exist "%DRIVE%"\SNEEK\font.bin del "%DRIVE%"\SNEEK\font.bin




::Special handling of bootmii\armboot.bin to avoid deleting Bootmii-SD Files
if not exist "%DRIVE%"\bootmii\armboot.bin goto:skip

::No Bootmii-SD Files
if not exist "%DRIVE%"\bootmii\ppcboot.elf del "%DRIVE%"\bootmii\armboot.bin
if not exist "%DRIVE%"\bootmii\ppcboot.elf goto:skip

::RENAME Bootmii Booter Folder
set countbootmii=0
:renamebootmii
SET /a countbootmii=%countbootmii%+1
if exist "%DRIVE%"\bootmii_SDBooter%countbootmii% goto:renamebootmii
move "%DRIVE%"\bootmii "%DRIVE%"\bootmii_SDBooter%countbootmii%>nul
:skip


::Don't delete anything from USB if making Sneek or Sneek+di
if /i "%SNEEKTYPE%" EQU "SD" goto:skip
if /i "%SNEEKTYPE%" EQU "S" goto:skip
if exist "%DRIVEU%"\SNEEK\kernel.bin del "%DRIVEU%"\SNEEK\kernel.bin
if exist "%DRIVEU%"\SNEEK\di.bin del "%DRIVEU%"\SNEEK\di.bin
if exist "%DRIVEU%"\SNEEK\font.bin del "%DRIVEU%"\SNEEK\font.bin
:skip


::get sneek rev number

set sneekrev=0
set tempsneekrev=none
set usesneektemp=off

start %ModMiimin%/wait wget http://code.google.com/p/sneek/downloads/list
if exist list move /y list sneekrev.bat>nul

if not exist sneekrev.bat goto:skip
sfk filter -quiet "sneekrev.bat" -rep _"*FS-SD module r"_"set sneekrev="_ -write -yes
sfk filter -quiet "sneekrev.bat" -+"set sneekrev" -write -yes
sfk filter -quiet "sneekrev.bat" -rep _" </a>*"__ -write -yes
call sneekrev.bat
del sneekrev.bat
:skip

if not exist temp\tempsneekrev.bat goto:NoTempSneekFiles
call temp\tempsneekrev.bat

::if temp files are equal to the new ones, use temp files
if /i "%TEMPSNEEKREV%" EQU "%SNEEKREV%" set usesneektemp=on

::if no internet and temp files exist, use temp files
if /i "%SNEEKREV%" EQU "0" set usesneektemp=on
if /i "%TEMPSNEEKREV%" EQU "none" set usesneektemp=off
:NoTempSneekFiles

if /i "%SNEEKREV%" NEQ "0" echo set tempsneekrev=%sneekrev%>temp\tempsneekrev.bat
if not exist temp\tempsneekrev.bat goto:sneekwarning

if /i "%sneekrev%" EQU "0" set sneekrev=%tempsneekrev%






::get sneekY rev number

set sneekYrev=0
set tempsneekYrev=none
set usesneekYtemp=off

start %ModMiimin%/wait wget http://code.google.com/p/sneeky-compiler/downloads/list
if exist list move /y list sneekYrev.bat>nul

if not exist sneekYrev.bat goto:skip

sfk filter -quiet "sneekYrev.bat" -spat -rep _"*fsmodule-usb\x5fr"_"set sneekYrev="_ -write -yes
sfk filter -quiet "sneekYrev.bat" -+"set sneekYrev" -write -yes
sfk filter -quiet "sneekYrev.bat" -rep _" </a>*"__ -write -yes
call sneekYrev.bat
del sneekYrev.bat
:skip

if not exist temp\tempsneekYrev.bat goto:NoTempsneekYFiles
call temp\tempsneekYrev.bat

::if temp files are equal to the new ones, use temp files
if /i "%TEMPsneekYREV%" EQU "%sneekYREV%" set usesneekYtemp=on

::if no internet and temp files exist, use temp files
if /i "%sneekYREV%" EQU "0" set usesneekYtemp=on
if /i "%TEMPsneekYREV%" EQU "none" set usesneekYtemp=off
:NoTempsneekYFiles

if /i "%sneekYREV%" NEQ "0" echo set tempsneekYrev=%sneekYrev%>temp\tempsneekYrev.bat
if not exist temp\tempsneekYrev.bat goto:sneekwarning

if /i "%sneekYrev%" EQU "0" set sneekYrev=%tempsneekYrev%








if /i "%SNEEKTYPE%" EQU "SD" echo Building SNEEK+DI rev%sneekYREV%
if /i "%SNEEKTYPE%" EQU "UD" echo Building UNEEK+DI rev%sneekYREV%
if /i "%SNEEKTYPE%" EQU "U" echo Building UNEEK rev%sneekYREV%
if /i "%SNEEKTYPE%" EQU "S" echo Building SNEEK rev%sneekYREV%
echo.


echo Downloading Official Sneek Installer

set wadname=SNEEKInstallerv0.6c-cred.rar
set md5=bcdd0ddb85dc63c1ad7fad0007b6b606

if exist "temp\DBUPDATE%currentversion%.bat" call "temp\DBUPDATE%currentversion%.bat"

if not exist temp\SNEEKInstaller\SNEEKInstaller.exe goto:nocheck

set md5check=
sfk md5 -quiet -verify %md5% temp\SneekInstaller\SneekInstaller.exe

if errorlevel 1 set md5check=fail
if "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:AlreadyinTemp

:nocheck
if exist temp\SneekInstaller rd /s /q temp\SneekInstaller
mkdir temp\SneekInstaller

start %ModMiimin%/wait wget -t 3 http://sneek.googlecode.com/files/%wadname%
if exist %wadname% unrar x -y %wadname% temp\SneekInstaller
if exist %wadname% del %wadname%>nul

:AlreadyinTemp
if not exist temp\SNEEKInstaller\SNEEKInstaller.exe goto:sneekwarning


::create empty sneek installer config file
type NUL > temp\sneekinstaller\sinst.ini
echo.


echo Downloading Autoit
if exist temp\autoit3.exe goto:AlreadyinTemp
if not exist autoit-v3-sfx.exe start %ModMiimin%/wait wget -t 3 http://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3-sfx.exe
if exist autoit-v3-sfx.exe 7za e -aoa autoit-v3-sfx.exe -otemp autoit3.exe -r
if exist autoit-v3-sfx.exe del autoit-v3-sfx.exe>nul
:AlreadyinTemp
echo.


echo Downloading 0000000e.app from IOS80
if exist temp\0000000e_IOS80.app goto:AlreadyinTemp

nusfilegrabber.exe 0e
move /Y 0000000e.app temp\0000000e_IOS80.app

:AlreadyinTemp
copy /Y temp\0000000e_IOS80.app temp\0000000e.app>nul
if not exist temp\0000000e.app goto:sneekwarning
echo.

if /i "%SNEEKTYPE%" EQU "SD" goto:DL01
if /i "%SNEEKTYPE%" EQU "UD" goto:DL01
goto:skipDL01
:DL01
echo Downloading 00000001.app from IOS60
if exist temp\00000001_IOS60.app goto:AlreadyinTemp
nusfilegrabber.exe 01_60
move /Y 00000001.app temp\00000001_IOS60.app

:AlreadyinTemp
copy /Y temp\00000001_IOS60.app temp\00000001.app>nul
if not exist temp\00000001.app goto:sneekwarning
echo.


::FONT.BIN
if /i "%SNKFONT%" EQU "B" echo Downloading Black font.bin (this can be changed to White in Options)
if /i "%SNKFONT%" EQU "W" echo Downloading White font.bin (this can be changed to Black in Options)

if /i "%SNKFONT%" EQU "B" set fonturl=http://nusad.googlecode.com/files/fontb.bin
if /i "%SNKFONT%" EQU "W" set fonturl=http://nusad.googlecode.com/files/fontw.bin

if not exist temp\font%SNKFONT%.bin start %ModMiimin%/wait wget -t 3 %fonturl%

if exist font%SNKFONT%.bin move /Y font%SNKFONT%.bin temp\font%SNKFONT%.bin>nul
:skip

if /i "%SNEEKTYPE%" EQU "UD" goto:save2DriveU
if not exist "%DRIVE%"\SNEEK mkdir "%DRIVE%"\SNEEK
if exist temp\font%SNKFONT%.bin copy /Y temp\font%SNKFONT%.bin "%DRIVE%"\SNEEK\font.bin>nul
if not exist "%DRIVE%"\SNEEK\font.bin goto:sneekwarning
echo.
goto:DLDIMODULE

:save2DriveU
if not exist "%DRIVEU%"\SNEEK mkdir "%DRIVEU%"\SNEEK
if exist temp\font%SNKFONT%.bin copy /Y temp\font%SNKFONT%.bin "%DRIVEU%"\SNEEK\font.bin>nul
if not exist "%DRIVEU%"\SNEEK\font.bin goto:sneekwarning
echo.


:DLDIMODULE
echo Downloading dimodule.elf

if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/dimodule.elf


if exist dimodule.elf move /Y dimodule.elf temp\dimodule.elf

if not exist temp\dimodule.elf start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/dimodule.elf

if exist dimodule.elf move /Y dimodule.elf temp\dimodule.elf

if not exist temp\dimodule.elf goto:sneekwarning
echo.
:skipDL01



echo Downloading fsmodule-usb.elf
if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/fsmodule-usb.elf

if exist fsmodule-usb.elf move /Y fsmodule-usb.elf temp\fsmodule-usb.elf>nul

if not exist temp\fsmodule-usb.elf start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/fsmodule-usb.elf

if exist fsmodule-usb.elf move /Y fsmodule-usb.elf temp\fsmodule-usb.elf>nul

if not exist temp\fsmodule-usb.elf goto:sneekwarning
echo.



echo Downloading fsmodule-sd.elf
if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/fsmodule-sd.elf
if exist fsmodule-sd.elf move /Y fsmodule-sd.elf temp\fsmodule-sd.elf>nul

if not exist temp\fsmodule-sd.elf start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/fsmodule-sd.elf
if exist fsmodule-sd.elf move /Y fsmodule-sd.elf temp\fsmodule-sd.elf>nul

if not exist temp\fsmodule-sd.elf goto:sneekwarning
echo.


echo Downloading esmodule.elf

if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/esmodule.elf
if exist esmodule.elf move /Y esmodule.elf temp\esmodule.elf>nul

if not exist temp\esmodule.elf start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/esmodule.elf
if exist esmodule.elf move /Y esmodule.elf temp\esmodule.elf>nul

if not exist temp\esmodule.elf goto:sneekwarning
echo.

echo Downloading armboot.bin
if /i "%usesneektemp%" EQU "off" start %ModMiimin%/wait wget -t 3 http://sneek.googlecode.com/files/armboot.bin
if exist armboot.bin move /Y armboot.bin temp\armboot.bin>nul

if not exist temp\armboot.bin start %ModMiimin%/wait wget -t 3 http://sneek.googlecode.com/files/armboot.bin
if exist armboot.bin move /Y armboot.bin temp\armboot.bin>nul

if not exist temp\armboot.bin goto:sneekwarning
echo.


echo Building...
echo.

::create autoit script

echo WinWait ("SNEEK Installer","install SNEEK")>custom.au3
echo WinActivate ("SNEEK Installer","install SNEEK")>>custom.au3


if /i "%SNEEKTYPE%" EQU "S" echo ControlClick ("SNEEK Installer","SNEEK setup","SNEEK")>>custom.au3
if /i "%SNEEKTYPE%" EQU "SD" echo ControlClick ("SNEEK Installer","SNEEK setup","SNEEK+DI")>>custom.au3
if /i "%SNEEKTYPE%" EQU "U" echo ControlClick ("SNEEK Installer","SNEEK setup","UNEEK")>>custom.au3
if /i "%SNEEKTYPE%" EQU "UD" echo ControlClick ("SNEEK Installer","SNEEK setup","UNEEK+DI")>>custom.au3

if /i "%sneekverbose%" EQU "on" echo ControlClick ("SNEEK Installer","SNEEK setup","Verbose output")>>custom.au3


::ControlSetText vs ControlSend

echo ControlSetText("SNEEK Installer","","[CLASS:Edit; INSTANCE:2]","%ModMiipath%\temp")>>custom.au3
echo ControlSetText("SNEEK Installer","","[CLASS:Edit; INSTANCE:3]","%ModMiipath%\temp")>>custom.au3



if /i "%DRIVE:~1,1%" EQU ":" (set DRIVEabsolute=%DRIVE%) else (set DRIVEabsolute=%ModMiipath%\%DRIVE%)
echo ControlSetText("SNEEK Installer","","[CLASS:Edit; INSTANCE:1]","%DRIVEabsolute%")>>custom.au3

::how to only change field if empty
::echo $a = ControlGetText ("SNEEK Installer","","[CLASS:Edit; INSTANCE:1]")>>custom.au3
::echo if $a = "" Then ControlSetText("SNEEK Installer","","[CLASS:Edit; INSTANCE:1]","%DRIVEabsolute%")>>custom.au3

if /i "%SNEEKTYPE%" EQU "S" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" goto:skip

if /i "%DRIVEU:~1,1%" EQU ":" (set DRIVEUabsolute=%DRIVEU%) else (set DRIVEUabsolute=%ModMiipath%\%DRIVEU%)
echo ControlSetText("SNEEK Installer","","[CLASS:Edit; INSTANCE:4]","%DRIVEUabsolute%")>>custom.au3
:skip

echo ControlClick ("SNEEK Installer","SNEEK setup","install SNEEK")>>custom.au3




cd temp\SneekInstaller
start /I %ModMiimin%SneekInstaller.exe
cd..
cd..

echo start /wait temp\AutoIt3.exe custom.au3>run.bat
call run.bat
del run.bat

@ping 127.0.0.1 -n 3 -w 1000> nul

taskkill /im SneekInstaller.exe /f >nul
del custom.au3>nul


if /i "%SNKS2U%" EQU "Y" move /y "%DRIVE%\bootmii" "%DRIVE%\bootmiiuneek">nul


::save rev information
if /i "%sneekverbose%" EQU "on" goto:sneekverbose

if /i "%SNEEKTYPE%" EQU "SD" echo SNEEK+DI rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "S" echo SNEEK rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt

if /i "%SNEEKTYPE%" EQU "UD" echo UNEEK+DI rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "UD" echo UNEEK+DI rev%sneekYREV%>"%DRIVEU%"\sneek\rev.txt

if /i "%SNEEKTYPE%" EQU "U" echo UNEEK rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "U" echo UNEEK rev%sneekYREV%>"%DRIVEU%"\sneek\rev.txt
goto:skipsneekverbose

:sneekverbose
if /i "%SNEEKTYPE%" EQU "SD" echo SNEEK+DI (verbose) rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "S" echo SNEEK (verbose) rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt

if /i "%SNEEKTYPE%" EQU "UD" echo UNEEK+DI (verbose) rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "UD" echo UNEEK+DI (verbose) rev%sneekYREV%>"%DRIVEU%"\sneek\rev.txt

if /i "%SNEEKTYPE%" EQU "U" echo UNEEK (verbose) rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "U" echo UNEEK (verbose) rev%sneekYREV%>"%DRIVEU%"\sneek\rev.txt
:skipsneekverbose




if /i "%SNEEKSELECT%" EQU "3" goto:SNKNANDBUILDER
goto:finishsneekinstall3




:sneekwarning
if exist ioskpatch.exe del ioskpatch.exe
echo.
sfk echo -spat \x20 [Yellow] WARNING: Some files Required for the SNEEK install are missing.
sfk echo -spat \x20 \x20 \x20 \x20 [Yellow] Aborting SNEEK Installation, check your internet connection
sfk echo -spat \x20 \x20 \x20 \x20 [Yellow] Then repeat the SNEEK Installation to try again.
echo.
echo Press any key to return to the Main Menu.
pause>nul
goto:MENU





::------------------------wad2nand-install wads from install2sneek to emu nand--------------------
:wad2nand

if exist temp\common-key.bin copy /y temp\common-key.bin common-key.bin>nul

set line1="<?xml version='1.0' standalone='yes'?>"
set line2="<ShowMiiWads>"
set line3="  <Settings>"
set line4="    <Version>1.5</Version>"
set line5="    <Language>English</Language>"
set line6="    <LangFile />"
set line7="    <AutoSize>true</AutoSize>"
set line8="    <NandPath>%nandpath%</NandPath>"
set line9="    <ShowPath>true</ShowPath>"
set line10="    <AddSub>false</AddSub>"
set line11="    <Portable>False</Portable>"
set line12="    <Accepted>false</Accepted>"
set line13="    <SaveFolders>true</SaveFolders>"
set line14="    <CreateBackups>false</CreateBackups>"
set line15="    <SplashScreen>false</SplashScreen>"
set line16="    <View>ShowMiiWads</View>"
set line17="  </Settings>"
set line18="  <Window>"
set line19="    <WindowWidth>930</WindowWidth>"
set line20="    <WindowHeight>396</WindowHeight>"
set line21="    <LocationX>50</LocationX>"
set line22="    <LocationY>200</LocationY>"
set line23="    <WindowState>Normal</WindowState>"
set line24="  </Window>"
set line25="  <Folders>"
set line26="    <MRU0>temp\install2sneek</MRU0>"
set line27="    <MRU1 />"
set line28="    <MRU2 />"
set line29="    <MRU3 />"
set line30="    <MRU4 />"
set line31="    <Foldercount>1</Foldercount>"
set line32="    <Folder0>temp\install2sneek</Folder0>"
set line33="  </Folders>"
set line34="</ShowMiiWads>"


echo %line1%>ShowMiiWads.cfg
echo %line2%>>ShowMiiWads.cfg
echo %line3%>>ShowMiiWads.cfg
echo %line4%>>ShowMiiWads.cfg
echo %line5%>>ShowMiiWads.cfg
echo %line6%>>ShowMiiWads.cfg
echo %line7%>>ShowMiiWads.cfg
echo %line8%>>ShowMiiWads.cfg
echo %line9%>>ShowMiiWads.cfg
echo %line10%>>ShowMiiWads.cfg
echo %line12%>>ShowMiiWads.cfg
echo %line13%>>ShowMiiWads.cfg
echo %line14%>>ShowMiiWads.cfg
echo %line15%>>ShowMiiWads.cfg
echo %line16%>>ShowMiiWads.cfg
echo %line17%>>ShowMiiWads.cfg
echo %line18%>>ShowMiiWads.cfg
echo %line19%>>ShowMiiWads.cfg
echo %line20%>>ShowMiiWads.cfg
echo %line21%>>ShowMiiWads.cfg
echo %line22%>>ShowMiiWads.cfg
echo %line23%>>ShowMiiWads.cfg
echo %line24%>>ShowMiiWads.cfg
echo %line25%>>ShowMiiWads.cfg
echo %line26%>>ShowMiiWads.cfg
echo %line27%>>ShowMiiWads.cfg
echo %line28%>>ShowMiiWads.cfg
echo %line29%>>ShowMiiWads.cfg
echo %line30%>>ShowMiiWads.cfg
echo %line31%>>ShowMiiWads.cfg
echo %line32%>>ShowMiiWads.cfg
echo %line33%>>ShowMiiWads.cfg
echo %line34%>>ShowMiiWads.cfg


sfk filter -quiet "ShowMiiWads.cfg" -rep _"""__ -write -yes
sfk filter -quiet "ShowMiiWads.cfg" -rep _"'"_"""_ -write -yes


cls
echo Loading ShowMiiWads
echo.
echo installing wads from: temp\install2sneek\
echo     to emulated nand: %nandpath%\
echo.
echo Please wait for ShowMiiWads to finish doing it job...

SMW-Mod.exe

if exist common-key.bin move /y common-key.bin temp\common-key.bin>nul

::del "%nandpath%"\WAD\ShowMiiWads_Sneek_Mod.exe>nul

del ShowMiiWads.cfg>nul


if exist temp\install2sneek\JoyFlowHNv10-HBJF.wad del temp\install2sneek\JoyFlowHNv10-HBJF.wad>nul
if exist temp\install2sneek\switch2uneek(emulators)-4EMUNand-v9-S2RL.wad del temp\install2sneek\switch2uneek(emulators)-4EMUNand-v9-S2RL.wad>nul

move temp\install2sneek\*.wad temp\>nul

::restore setting.txt if applicable
if not exist "%nandpath%\title\00000001\00000002\data" mkdir "%nandpath%\title\00000001\00000002\data"
if /i "%SNKSERIAL%" EQU "current" move /y "%nandpath%"\setting.txt "%nandpath%"\title\00000001\00000002\data\setting.txt>nul

::Build setting.txt if applicable
if /i "%SNKSERIAL%" EQU "current" goto:skip
if /i "%SNKSERIAL%" EQU "N" goto:skip

settings %SNKSERIAL% >nul

if /i "%REGION%" EQU "K" move /y KORsetting.txt "%nandpath%"\title\00000001\00000002\data\setting.txt >nul
if /i "%REGION%" EQU "U" move /y USAsetting.txt "%nandpath%"\title\00000001\00000002\data\setting.txt >nul
if /i "%REGION%" EQU "E" move /y EURsetting.txt "%nandpath%"\title\00000001\00000002\data\setting.txt >nul
if /i "%REGION%" EQU "J" move /y JPNsetting.txt "%nandpath%"\title\00000001\00000002\data\setting.txt >nul

if /i "%REGION%" NEQ "K" del KORsetting.txt
if /i "%REGION%" NEQ "E" del EURsetting.txt
if /i "%REGION%" NEQ "J" del JPNsetting.txt
if /i "%REGION%" NEQ "U" del USAsetting.txt

:skip



::-----------patch SM .app file for UNEEK+DI... Always do this for 4.3X and 4.2U/E----------------

IF "%SMAPP%"=="" goto:finishsneekinstall

::----------always DL most recent and save with ModMii exe-----------




if /i "%ThemeSelection%" EQU "N" goto:quickskip
echo.
echo Copying over Custom Theme

::if /i "%DarkWii_Red_4.3U%" EQU "*" move /y temp\DarkWii_Red_4.3U.csm "%nandpath%"\title\00000001\00000002\content\%SMTHEMEAPP%.app

if /i "%ThemeSelection%" EQU "R" set themecolour=Red
if /i "%ThemeSelection%" EQU "G" set themecolour=Green

move /y "temp\MyMenuify_Themes\DarkWii_%themecolour%_%SNKVERSION%%REGION%.csm" "%nandpath%"\title\00000001\00000002\content\%SMTHEMEAPP%.app
:quickskip


if exist temp\MyMenuify_Themes rd /s /q temp\MyMenuify_Themes
if exist temp\WAD rd /s /q temp\WAD
if exist temp\Download_Log.md5 del temp\Download_Log.md5>nul


echo.
echo Downloading IOSKPatch.exe to Patch System Menu for UNEEK+DI Compatability
start %ModMiimin%/wait wget -t 3 http://sneek.googlecode.com/svn/trunk/IOSKpatch/IOSKPatch.exe
if exist IOSKPatch.exe move /Y IOSKPatch.exe temp\IOSKPatch.exe>nul
if exist temp\IOSKPatch.exe copy /Y temp\IOSKPatch.exe IOSKPatch.exe>nul
if not exist IOSKPatch.exe echo Unable to download IOSKPatch, System Menu will not be able to be patched
echo.

::ModMii only makes UNEEK+DI nands for 4.3U/E/J/K and 4.2U/E Nands (for now)

echo Patching System Menu %SMAPP%.app for UNEEK+DI Compatability

move /y "%nandpath%"\title\00000001\00000002\content\%SMAPP%.app "%nandpath%"\title\00000001\00000002\content\%SMAPP%_original.app >nul
ioskpatch.exe "%nandpath%"\title\00000001\00000002\content\%SMAPP%_original.app "%nandpath%"\title\00000001\00000002\content\%SMAPP%.app -p >nul

del "%nandpath%"\title\00000001\00000002\content\%SMAPP%_original.app >nul

:skippatchSMios


if /i "%SNKPRI%" NEQ "Y" goto:skipSNKpri
echo.
echo Downloading Priiloader-v0.4.app
echo.
if not exist temp\Priiloader-v0.4.app start %ModMiimin%/wait wget -t 3 http://nusad.googlecode.com/files/Priiloader-v0.4.app
if exist Priiloader-v0.4.app move /Y Priiloader-v0.4.app temp\Priiloader-v0.4.app>nul

if not exist temp\Priiloader-v0.4.app (echo Unable to download Priiloader-v0.4.app, Emulated NAND will not have priiloader installed) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:finishsneekinstall)

move /y "%nandpath%"\title\00000001\00000002\content\%SMAPP%.app "%nandpath%"\title\00000001\00000002\content\1%SMAPP:~1%.app >nul

copy /Y temp\Priiloader-v0.4.app "%nandpath%"\title\00000001\00000002\content\%SMAPP%.app>nul

if not exist "%nandpath%"\title\00000001\00000002\data mkdir "%nandpath%"\title\00000001\00000002\data >nul
move /Y temp\hacks.ini "%nandpath%"\title\00000001\00000002\data\hacks.ini >nul


if /i "%SNKJOY%" NEQ "Y" goto:skipSNKpri

echo Adding JoyFlow forwarder dol to Priiloader's installed file.
echo.

if exist temp\JoyFlow(emulators)-v9.dol move /y temp\JoyFlow(emulators)-v9.dol "%nandpath%"\title\00000001\00000002\data\main.bin

:skipSNKpri

if exist temp\JoyFlow(emulators)-v9.dol del temp\JoyFlow(emulators)-v9.dol>nul



goto:finishsneekinstall




::----------------------------------SNEEK INSTALL FINISH------------------------------------
:finishsneekinstall

if exist ioskpatch.exe del ioskpatch.exe>nul

::RESTORE DRIVE SETTINGS
set DRIVE=%REALDRIVE%

::if /i "%SNEEKSELECT%" EQU "1" goto:finishsneekinstall3

::clear download queue
set MENUREAL=S
goto:CLEAR

:finishsneekinstall2
set MENU1=1

::queue up files that need to TRULY be saved to %Drive%
if /i "%SNKJOY%" EQU "Y" set JOY=*
if /i "%SNKS2U%" EQU "Y" set S2U=*
if /i "%SNKS2U%" EQU "Y" set MMM=*

goto:DLCOUNT

:finishsneekinstall3
set MENUREAL=


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.

::both sneek install and nand build
if /i "%SNEEKSELECT%" NEQ "3" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" echo    You have successfully installed SNEEK+DI rev%sneekYREV% and built a %SNKVERSION%%REGION% Emulated Nand
if /i "%SNEEKTYPE%" EQU "UD" echo    You have installed UNEEK+DI rev%sneekYREV% and built a %SNKVERSION%%REGION% Emulated Nand
if /i "%SNEEKTYPE%" EQU "S" echo    You have installed SNEEK rev%sneekYREV% and built a %SNKVERSION%%REGION% Emulated Nand
if /i "%SNEEKTYPE%" EQU "U" echo    You have installed UNEEK rev%sneekYREV% and built a %SNKVERSION%%REGION% Emulated Nand
:skip

::only install sneek
if /i "%SNEEKSELECT%" NEQ "1" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" echo    You have successfully installed SNEEK+DI rev%sneekYREV%
if /i "%SNEEKTYPE%" EQU "UD" echo    You have successfully installed UNEEK+DI rev%sneekYREV%
if /i "%SNEEKTYPE%" EQU "U" echo    You have successfully installed UNEEK rev%sneekYREV%
if /i "%SNEEKTYPE%" EQU "S" echo    You have successfully installed SNEEK rev%sneekYREV%
:skip

::only build nand
if /i "%SNEEKSELECT%" NEQ "2" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" echo    You have successfully built a %SNKVERSION%%REGION% Emulated Nand
if /i "%SNEEKTYPE%" EQU "UD" echo    You have successfully built a %SNKVERSION%%REGION% Emulated Nand
if /i "%SNEEKTYPE%" EQU "U" echo    You have successfully built a %SNKVERSION%%REGION% Emulated Nand
if /i "%SNEEKTYPE%" EQU "S" echo    You have successfully built a %SNKVERSION%%REGION% Emulated Nand
:skip


echo.
echo.



if /i "%SNEEKSELECT%" NEQ "2" goto:skip
if /i "%SNEEKTYPE%" EQU "U" goto:skipsdmsg
if /i "%SNEEKTYPE%" EQU "UD" goto:skipsdmsg
:skip
if /i "%Drive%" EQU "COPY_TO_SD" echo    * Copy the contents of the COPY_TO_SD folder to SD Card
if /i "%Drive%" NEQ "COPY_TO_SD" echo    * Make sure that %DRIVE% is your SD card Drive Letter
if /i "%Drive%" NEQ "COPY_TO_SD" echo    * If %DRIVE% is not your SD card Drive Letter, copy the contents of
if /i "%Drive%" NEQ "COPY_TO_SD" echo      the %DRIVE% folder to your SD card
echo.
:skipsdmsg

if /i "%SNEEKTYPE%" EQU "UD" goto:UDRIVEMSG
if /i "%SNEEKTYPE%" NEQ "U" goto:skipUDRIVEMSG
:UDRIVEMSG
if /i "%DRIVEU%" EQU "COPY_TO_USB" echo    * Copy the contents of the COPY_TO_USB folder to FAT32 Hard Drive
if /i "%DRIVEU%" NEQ "COPY_TO_USB" echo    * Make sure that %DRIVEU% is your USB HDD Drive Letter
if /i "%DRIVEU%" NEQ "COPY_TO_USB" echo    * If %DRIVEU% is not your USB HDD Drive Letter, copy the contents of
if /i "%DRIVEU%" NEQ "COPY_TO_USB" echo      the %DRIVEU% folder to your USB Hard Drive
echo.
:skipUDRIVEMSG

if /i "%SNEEKSELECT%" EQU "2" goto:skip
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] WARNING: SNEEK is not directly supported by ModMii.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] Any problems you have with SNEEK that are not a direct result
sfk echo -spat \x20 \x20 \x20 \x20 [Red] of ModMii should be reported here: http://code.google.com/p/sneek/
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] This is also a great place to learn more about SNEEK in general.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] Another great resource is the guide here: tinyurl.com/SNEEK-DI
:skip

echo.
echo    SOME QUICK SNEEK TIPS:
echo.
echo        * If you have problems with S/UNEEK or Mighty Channels, copy cert.sys
echo          from an original nand dump to your emulated nand's sys folder.
echo.
echo        * When launching any form of SNEEK for the first time,
echo          it could take a long time to load the System Menu,
echo          but it will be much quicker the second time around.
echo.

if /i "%SNKS2U%" EQU "Y" goto:quickskip
echo        * If you have BootMii as Boot2, SNEEK will start immediately
echo          when the Wii powers on. To stop this from happening, rename
echo          the BootMii folder on the SD Card to something else.
echo.
echo        * If you have BootMii as IOS, you will need to launch BootMii as IOS
echo          to start SNEEK. You can do so manually from the Homebrew Channel (HBC),
echo          or automatically via Priiloader's Autoboot Settings.
echo.
:quickskip

if /i "%SNKS2U%" NEQ "Y" goto:quickskip
echo        * Access UNEEK/UNEEK+DI by launching switch2uneek from the
echo          Homebrew Channel. Alternatively, can use MMM to install the
echo          switch2uneek forwarder channel that ModMii saved to your SD card.
echo.
:quickskip

echo        * When using SNEEK+DI or UNEEK+DI, you can access the Game/DI Menu
echo          by pressing "1" on the WiiMote. To access other settings
echo          (including Region Options), you must press "+" from within the DI Menu.
echo.
echo        * To add Games to the Game/DI Menu, you can use ModMii to extract
echo          Wii Games to your FAT32 USB External Hard Drive.
echo.
echo        * ShowMiiWads can be used to decrypt your real Wii's BootMii NAND
echo          dump (nand.bin) to use as an emulated NAND, and it can add custom
echo          channels/WADs to an emulated NAND.
echo          ShowMiiWads is available here: http://code.google.com/p/showmiiwads/
echo.
echo        * For more SNEEK info, like formatting a USB Hard Drive for SNEEK,
echo          or installing the HBC to an emulated NAND, visit: tinyurl.com/SNEEK-DI
echo.
echo Press any key to return to the Main Menu.
pause>nul

goto:MENU





::.........................................FINISH / Verify..................................
:FINISH

if exist temp\DLnames.txt del temp\DLnames.txt>nul
if exist temp\DLgotos.txt del temp\DLgotos.txt>nul

if /i "%MENU1%" EQU "S" goto:wad2nand
if /i "%MENUREAL%" EQU "S" goto:finishsneekinstall3

::title=ModMii
setlocal ENABLEDELAYEDEXPANSION
set loglines=0


if /i "%DB%" EQU "N" goto:countnew
if /i "%DB%" EQU "C" goto:countcustom


:countnew
if not exist %DRIVE%\Download_Log.md5 goto:donecounting
sfk filter "%DRIVE%"\Download_Log.md5 -unique -write -yes>nul
for /f "delims=" %%i in (%DRIVE%\Download_Log.md5) do set /a loglines=!loglines!+1
set loglinesNEW=%loglines%

if exist temp\simplelog.txt for /f "delims=" %%i in (temp\simplelog.txt) do set /a loglines=!loglines!+1

If /i "%cfgr%" EQU "*" set /a loglines=%loglines%+1
If /i "%cfg249%" EQU "*" set /a loglines=%loglines%+1
If /i "%cfg222%" EQU "*" set /a loglines=%loglines%+1
If /i "%usbfolder%" EQU "*" set /a loglines=%loglines%+1
If /i "%WiiMC%" EQU "*" set /a loglines=%loglines%+1
If /i "%fceugx%" EQU "*" set /a loglines=%loglines%+1
If /i "%snes9xgx%" EQU "*" set /a loglines=%loglines%+1
If /i "%vbagx%" EQU "*" set /a loglines=%loglines%+1
If /i "%SGM%" EQU "*" set /a loglines=%loglines%+1
If /i "%WIIX%" EQU "*" set /a loglines=%loglines%+1
If /i "%CheatCodes%" EQU "*" set /a loglines=%loglines%+1
If /i "%neogamma%" EQU "*" set /a loglines=%loglines%+1
If /i "%yawm%" EQU "*" set /a loglines=%loglines%+1


goto:donecounting


:countcustom
if exist Custom.md5 for /f "delims=" %%i in (Custom.md5) do set /a loglines=!loglines!+1

:donecounting

::resize window
SET /a LINES=%loglines%+35
if %LINES% LEQ 54 set lines=54
mode con cols=85 lines=%LINES%

setlocal DISABLEDELAYEDEXPANSION


::check ACTUAL drive letter
::SD
if /i "%DRIVE:~1,1%" NEQ ":" (set ActualDrive=%ModMiipath:~0,2%) else (set ActualDrive=%DRIVE:~0,2%)
if /i "%ActualDrive%" EQU "%ModMiipath:~0,2%" (set DrivesNeedingFreeSpace=%ActualDrive%) else (set DrivesNeedingFreeSpace=%ActualDrive% and %ModMiipath:~0,2%)


::USB
if /i "%USBCONFIG%" NEQ "USB" goto:skip
if /i "%DRIVEU:~1,1%" NEQ ":" (set ActualDriveU=%ModMiipath:~0,2%) else (set ActualDriveU=%DRIVEU:~0,2%)
if /i "%ActualDriveU%" EQU "%ModMiipath:~0,2%" goto:skip
if /i "%ActualDriveU%" EQU "%ActualDrive%" goto:skip
set DrivesNeedingFreeSpace=%DrivesNeedingFreeSpace% and %ActualDriveU%
:skip

::echo %DrivesNeedingFreeSpace%


Set FINISH=
cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
if /i "%DB%" EQU "N" echo                                     DOWNLOAD LOG
if /i "%DB%" EQU "C"                      echo         DOWNLOAD LOG - Custom Log

if /i "%DB%" EQU "N" set log=download_log.md5
if /i "%DB%" EQU "C" set log=custom.md5

echo.

if not exist modules sfk echo -spat \x20 \x20 \x20 [Yellow] Missing "modules" folder - Required to verify files and make cIOSs/cMIOSs
if not exist modules sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 [Yellow] Redownload ModMii from tinyurl.com/ModMiiNow


If /i "%cfg249%" EQU "*" goto:checkcfgbootdol
If /i "%cfg222%" EQU "*" goto:checkcfgbootdol
If /i "%usbfolder%" EQU "*" goto:checkcfgbootdol
goto:next

:checkcfgbootdol
if /i "%USBCONFIG%" EQU "USB" (set driveWE=%DRIVEU%) else (set driveWE=%DRIVE%)

If not exist "%driveWE%"\apps\usbloader_cfg\meta.xml echo %driveWE%\apps\usbloader_cfg (CFG USB-Loader): Missing
If not exist "%driveWE%"\apps\usbloader_cfg\meta.xml goto:next
sfk filter -quiet "%driveWE%\apps\usbloader_cfg\meta.xml" -+"/version" -rep _"*<version>"_"set cfgcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
echo %driveWE%\apps\usbloader_cfg (CFG USB-Loader): Found Version %cfgcurrentcode%
:next


::check for configurator for configurable
If /i "%cfgr%" NEQ "*" goto:next
If not exist "%DRIVE%"\usb-loader\CfgLoaderConfigurator.exe echo %DRIVE%\usb-loader\CfgLoaderConfigurator.exe: Missing
If not exist "%DRIVE%"\usb-loader\CfgLoaderConfigurator.exe goto:next
If not exist "%DRIVE%"\usb-loader\cfgrrev.txt echo %DRIVE%\usb-loader\CfgLoaderConfigurator.exe: Found (unable to detect version)
If exist "%DRIVE%"\usb-loader\cfgrrev.txt attrib -r -h -s "%DRIVE%\usb-loader\cfgrrev.txt"
If not exist "%DRIVE%"\usb-loader\cfgrrev.txt (goto:next) else (copy /y "%DRIVE%"\usb-loader\cfgrrev.txt "%DRIVE%"\usb-loader\cfgrrev.bat>nul )
attrib +r +h +s "%DRIVE%\usb-loader\cfgrrev.txt"
call "%DRIVE%"\usb-loader\cfgrrev.bat
del "%DRIVE%"\usb-loader\cfgrrev.bat
echo %DRIVE%\usb-loader\CfgLoaderConfigurator.exe: Found Version %cfgrreleaseOLD%
:next

::check for neogamma
If /i "%neogamma%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\neogamma\meta.xml echo %DRIVE%\apps\NeoGamma: Missing
If not exist "%DRIVE%"\apps\neogamma\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\neogamma\meta.xml" -+"/version" -rep _"*<version>"_"set neocurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
echo %DRIVE%\apps\NeoGamma: Found Version %neocurrentcode%
:next

::check for yawm
If /i "%yawm%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\yawmm\meta.xml echo %DRIVE%\apps\yawmm: Missing
If not exist "%DRIVE%"\apps\yawmm\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\yawmm\meta.xml" -+"/version" -rep _"*<version>"_"set yawmcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
echo %DRIVE%\apps\yawmm: Found Version %yawmcurrentcode%
:next

::check for WiiMC
If /i "%WiiMC%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\WiiMC\meta.xml echo %DRIVE%\apps\WiiMC: Missing
If not exist "%DRIVE%"\apps\WiiMC\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\WiiMC\meta.xml" -+"/version" -rep _"*<version>"_"set WMCcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
echo %DRIVE%\apps\WiiMC: Found Version %WMCcurrentcode%
:next

::check for fceugx
If /i "%fceugx%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\fceugx\meta.xml echo %DRIVE%\apps\fceugx: Missing
If not exist "%DRIVE%"\apps\fceugx\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\fceugx\meta.xml" -+"/version" -rep _"*<version>"_"set fceugxcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
echo %DRIVE%\apps\fceugx: Found Version %fceugxcurrentcode%
:next

::check for snes9xgx
If /i "%snes9xgx%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\snes9xgx\meta.xml echo %DRIVE%\apps\snes9xgx: Missing
If not exist "%DRIVE%"\apps\snes9xgx\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\snes9xgx\meta.xml" -+"/version" -rep _"*<version>"_"set snescurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
echo %DRIVE%\apps\snes9xgx: Found Version %snescurrentcode%
:next

::check for vbagx
If /i "%vbagx%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\vbagx\meta.xml echo %DRIVE%\apps\vbagx: Missing
If not exist "%DRIVE%"\apps\vbagx\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\vbagx\meta.xml" -+"/version" -rep _"*<version>"_"set vbagxcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
echo %DRIVE%\apps\vbagx: Found Version %vbagxcurrentcode%

:next

::check for SGM
If /i "%SGM%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\SaveGameManagerGX\meta.xml echo %DRIVE%\apps\SaveGameManagerGX: Missing
If not exist "%DRIVE%"\apps\SaveGameManagerGX\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\SaveGameManagerGX\meta.xml" -+"/version" -rep _"*<version>"_"set SGMcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
echo %DRIVE%\apps\SaveGameManagerGX: Found Version %SGMcurrentcode%
:next

::check for WIIX
If /i "%WIIX%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\WiiExplorer\meta.xml echo %DRIVE%\apps\WiiExplorer: Missing
If not exist "%DRIVE%"\apps\WiiExplorer\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\WiiExplorer\meta.xml" -+"/version" -rep _"*<version>"_"set WIIXcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
echo %DRIVE%\apps\WiiExplorer: Found Version %WIIXcurrentcode%
:next

::check for CheatCodes
If /i "%CheatCodes%" NEQ "*" goto:next

if /i "%cheatlocation%" EQU "C" goto:skip
If exist "%DRIVE%"\txtcodes\*.txt echo %DRIVE%\txtcodes: Found
If not exist "%DRIVE%"\txtcodes\*.txt echo %DRIVE%\txtcodes: Missing
:skip

if /i "%cheatlocation%" EQU "T" goto:skip
If exist "%DRIVE%"\codes echo %DRIVE%\codes: Found
If not exist "%DRIVE%"\codes echo %DRIVE%\codes: Missing
:skip
:next



if exist currentcode.bat del currentcode.bat

echo.

If not exist "%DRIVE%"\Download_Log.md5 goto:SkipNewWADCheck
if /i "%DB%" NEQ "N" goto:SkipNewWADCheck
if /i "%USBGUIDE%" NEQ "Y" goto:justSDcheck
if /i "%USBCONFIG%" EQU "USB" sfk filter "%DRIVEU%"\Download_Log.md5 -unique -write -yes>nul
if /i "%USBCONFIG%" EQU "USB" fvc -x -v "%DRIVEU%"\Download_Log.md5
if /i "%DRIVEU%" EQU "%DRIVE%" goto:SkipNewWADCheck
echo.
:justSDcheck
if /i "%loglinesNEW%" NEQ "0" fvc -x -v "%DRIVE%"\Download_Log.md5
:SkipNewWADCheck

If not exist Custom.md5 goto:SkipCustomCheck
if /i "%DB%" NEQ "C" goto:SkipCustomCheck
fvc -x -v Custom.md5
:SkipCustomCheck

if exist temp\simplelog.txt (echo.) else (goto:nextstep)
::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\simplelog.txt) do call :processSimpleLog %%A
goto:nextstep

:processSimpleLog
echo %*
goto:EOF
:nextstep

echo.
if /i "%DLTOTAL%" NEQ "0" Echo    *If any files are Invalid or Missing, select Repeat Download (R).
if /i "%DLTOTAL%" EQU "0" Echo    *If any files are Invalid or Missing, retry downloading the files.
echo.

echo    *If experiencing errors, make sure you have free space here: %DrivesNeedingFreeSpace%
echo     Check internet connection (try disabling firewall/bypasing proxy if applicable).


if /i "%USBCONFIG%" EQU "USB" goto:skipcopytoSDmsg
echo.
if /i "%Drive%" EQU "COPY_TO_SD" echo    *If the files are good, copy the contents of the COPY_TO_SD folder to SD Card
if /i "%Drive%" NEQ "COPY_TO_SD" echo    *If the files are good, make sure that %DRIVE% is your SD card Drive Letter
if /i "%Drive%" NEQ "COPY_TO_SD" echo    *If %DRIVE% is not your SD card Drive Letter, copy the contents of
if /i "%Drive%" NEQ "COPY_TO_SD" echo    the %DRIVE% folder to your SD card
:skipcopytoSDmsg
echo.
echo.

if exist "%DRIVE%" echo          O = Open File Location (%Drive%)

if exist "%DRIVE%"\%log% echo          L = Log: View %Log% to see which files were checked
if exist %log% echo          L = Log: View %Log% to see which files were checked

if /i "%DLTOTAL%" EQU "0" goto:dltotaliszero
echo.
echo          R = Repeat Download (select this if you experience errors)
If not Exist download_queue.bat echo          S = Save Download Queue
If Exist download_queue.bat echo          S = Save Download Queue (existing Download Queue will be renamed)
If Exist download_queue.bat echo          S+= Save Download Queue+ (add files to existing Download Queue)
:dltotaliszero


if /i "%DB%" NEQ "N" echo.
if /i "%DB%" NEQ "N" echo          N = Verify NEW Downloads only
if /i "%DB%" EQU "C" goto:next
if exist Custom.md5 echo.
if exist Custom.md5 echo          C = Verify Files against Custom.md5
:next

if exist CUSTOM_COPY_TO_SD goto:tinyskip
if exist CUSTOM_COPY_TO_USB (goto:tinyskip) else (goto:nocustoms)
:tinyskip
echo.
if exist CUSTOM_COPY_TO_SD echo         CC = Copy Contents of CUSTOM_COPY_TO_SD to %Drive%
if exist CUSTOM_COPY_TO_USB echo        CCU = Copy Contents of CUSTOM_COPY_TO_USB to %DriveU%
:nocustoms


echo.
echo          M = Main Menu
echo          E = Exit
echo.
set /p FINISH=     Enter Selection Here: 



if /i "%FINISH%" NEQ "CC" goto:miniskip
if not exist CUSTOM_COPY_TO_SD goto:miniskip
if not exist "%DRIVE%" mkdir "%DRIVE%" >nul
xcopy /y /e "CUSTOM_COPY_TO_SD" "%DRIVE%"
goto:FINISH
:miniskip

if /i "%FINISH%" NEQ "CCU" goto:miniskip
if not exist CUSTOM_COPY_TO_USB goto:miniskip
if not exist "%DRIVEU%" mkdir "%DRIVEU%" >nul
xcopy /y /e "CUSTOM_COPY_TO_USB" "%DRIVEU%"
goto:FINISH
:miniskip


if /i "%FINISH%" EQU "M" goto:MENU
if /i "%FINISH%" EQU "E" goto:exitnow

if not exist "%DRIVE%" goto:drivedoesnotexist2
if /i "%FINISH%" EQU "O" explorer "%DRIVE%"
if /i "%FINISH%" EQU "O" goto:Finish
:drivedoesnotexist2

if /i "%DB%" EQU "C" goto:opencustommd5
if not exist "%DRIVE%\%log%" goto:nolog
if /i "%FINISH%" EQU "L" start notepad "%DRIVE%\%log%"
if /i "%FINISH%" EQU "L" goto:Finish

:opencustommd5
if not exist "%log%" goto:nolog
if /i "%FINISH%" EQU "L" start notepad "%log%"
if /i "%FINISH%" EQU "L" goto:Finish

:nolog

if not exist Custom.md5 goto:skip
if /i "%FINISH%" EQU "C" SET DB=C
if /i "%FINISH%" EQU "C" goto:Finish
:skip

if /i "%FINISH%" EQU "N" SET DB=N
if /i "%FINISH%" EQU "N" goto:FINISH

if /i "%DLTOTAL%" EQU "0" goto:dltotaliszero2


if /i "%FINISH%" EQU "R" copy /y "temp\DLgotos-copy.txt" "temp\DLgotos.txt">nul
if /i "%FINISH%" EQU "R" mode con cols=85 lines=54
if /i "%FINISH%" EQU "R" goto:DLSettings2
if /i "%FINISH%" EQU "S" goto:SaveDownloadQueue
If not Exist download_queue.bat goto:dltotaliszero2
if /i "%FINISH%" EQU "S+" goto:SaveDownloadQueue
:dltotaliszero2


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:FINISH






::..........................DOWNLOAD SETTINGS................................
:DLSETTINGS
cls

set REALDRIVE=%DRIVE%


if /i "%MENU1%" EQU "W" goto:guide
if /i "%MENU1%" EQU "H" goto:HMguide
if /i "%MENU1%" EQU "U" goto:USBguide
:DLSETTINGS2
cls
if exist "%Drive%"\Download_Log.md5 del "%Drive%"\Download_Log.md5>nul
SET CURRENTDL=0


:DLSETTINGS3
::clear a bunch of stuff
set name=
set wadname=
set dlname=
set ciosslot=
set ciosversion=
set md5=
set md5alt=
set basewad=none
set basewadb=none
set md5base=
set md5basealt=
set code1=
set code2=
set version=
set md5baseb=
set md5basebalt=
set code1b=
set code2b=
set path1=
set versionb=
set basecios=
set diffpath=
set code2new=
set lastbasemodule=
set category=
set wadnameless=
set patchname=
set slotname=
set slotcode=
set versionname=
set versioncode=
set DEC=
set VERFINAL=
set HEX=
set VER=
set wadfolder=
set verfinal=
set PATCHCODE=
set alreadyexists=
set patch=
set multiplefail=
set AdvancedDownload=

::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\DLgotos.txt) do call :processDLnext %%A
goto:Finish

:processDLnext
set CurrentDLNAME=%*

::if /i "%name:~0,17%" EQU "Advanced Download" set AdvancedDownload=Y

if /i "%CurrentDLNAME:~-4%" EQU ".bat" set AdvancedDownload=Y
if /i "%CurrentDLNAME:~-4%" EQU ".bat" call "%CurrentDLNAME%"
if /i "%CurrentDLNAME:~-4%" EQU ".bat" goto:downloadstart
goto:%CurrentDLNAME%
::goto:EOF

cls


:EULAU
set name=EULA v3 (USA)
set code1=00010008
set code2=48414B45
set version=3
set wadname=EULA-NUS-v3[U].wad
set md5=f30393cd89cb20007c501efab75dab0c
set md5alt=%md5%
set category=ios
goto:downloadstart

:EULAE
set name=EULA v3 (PAL)
set code1=00010008
set code2=48414B50
set version=3
set wadname=EULA-NUS-v3[E].wad
set md5=e835877a6460beeb0d6756c43a800465
set md5alt=%md5%
set category=ios
goto:downloadstart

:EULAJ
set name=EULA v3 (JAP)
set code1=00010008
set code2=48414B4A
set version=3
set wadname=EULA-NUS-v3[J].wad
set md5=1b73948a1b3729cd29f0939652e856b3
set md5alt=%md5%
set category=ios
goto:downloadstart

:EULAK
set name=EULA v3 (KOR)
set code1=00010008
set code2=48414B4B
set version=3
set wadname=EULA-NUS-v3[K].wad
set md5=21c48127696cf028a3bc19b3d34aef11
set md5alt=%md5%
set category=ios
goto:downloadstart

:RSU
set name=Region Select v3 (USA)
set code1=00010008
set code2=48414C45
set version=2
set wadname=Region-Select-NUS-v2[U].wad
set md5=27950cf84c554a851c42c33688f301c5
set md5alt=%md5%
set category=ios
goto:downloadstart

:RSE
set name=Region Select v3 (PAL)
set code1=00010008
set code2=48414C50
set version=2
set wadname=Region-Select-NUS-v2[E].wad
set md5=bac3441c6b6aec07a38b4b2cab103a3d
set md5alt=%md5%
set category=ios
goto:downloadstart

:RSJ
set name=Region Select v3 (JAP)
set code1=00010008
set code2=48414C4A
set version=2
set wadname=Region-Select-NUS-v2[J].wad
set md5=982d8507a94fbad1e298b073ba90c16d
set md5alt=%md5%
set category=ios
goto:downloadstart

:RSK
set name=Region Select v3 (KOR)
set code1=00010008
set code2=48414C4B
set version=2
set wadname=Region-Select-NUS-v2[K].wad
set md5=18aee652bc16bc1aa4261400758ac04a
set md5alt=%md5%
set category=ios
goto:downloadstart



:BC
set name=BC
set code1=00000001
set code2=00000100
set version=6
set wadname=BC-NUS-v6.wad
set md5=d1593a77e24ecc95af2b393abe5d92f0
set md5alt=%md5%
set category=ios
goto:downloadstart



:SM4.3U
set name=System Menu 4.3U
set code1=00000001
set code2=00000002
set version=513
set wadname=SystemMenu_4.3U_v513.wad
set md5=4f5c63e3fd1bf732067fa4c439c68a97
set md5alt=%md5%
set category=ios
goto:downloadstart


:SM4.2U
set name=System Menu 4.2U
set code1=00000001
set code2=00000002
set version=481
set wadname=SystemMenu_4.2U_v481.wad
set md5=4ac52b981845473bd3655e4836d7442b
set md5alt=%md5%
set category=ios
goto:downloadstart

:SM4.1U
set name=System Menu 4.1U
set code1=00000001
set code2=00000002
set version=449
set wadname=SystemMenu_4.1U_v449.wad
set md5=38a95a9acd257265294be41b796f6239
set md5alt=%md5%
set category=ios
goto:downloadstart

:SM3.2U
set name=System Menu 3.2U
set code1=00000001
set code2=00000002
set version=289
set wadname=SystemMenu_3.2U_v289.wad
set md5=7514582f06126aee897fc2b2e9185980
set md5alt=%md5%
set category=ios
goto:downloadstart

:SM4.3E
set name=System Menu 4.3E
set code1=00000001
set code2=00000002
set version=514
set wadname=SystemMenu_4.3E_v514.wad
set md5=2ec2e6fbdfc52fe5174749e7032f1bad
set md5alt=%md5%
set category=ios
goto:downloadstart

:SM4.2E
set name=System Menu 4.2E
set code1=00000001
set code2=00000002
set version=482
set wadname=SystemMenu_4.2E_v482.wad
set md5=7d77be8b6df5ac893d24652db33d02cd
set md5alt=%md5%
set category=ios
goto:downloadstart

:SM4.1E
set name=System Menu 4.1E
set code1=00000001
set code2=00000002
set version=450
set wadname=SystemMenu_4.1E_v450.wad
set md5=688cc78b8eab4e30da04f01a81a3739f
set md5alt=%md5%
set category=ios
goto:downloadstart

:SM3.2E
set name=System Menu 3.2E
set code1=00000001
set code2=00000002
set version=290
set wadname=SystemMenu_3.2E_v290.wad
set md5=5f0ff5a2b160f5340ccf74118edc9e33
set md5alt=%md5%
set category=ios
goto:downloadstart

:SM4.3J
set name=System Menu 4.3J
set code1=00000001
set code2=00000002
set version=512
set wadname=SystemMenu_4.3J_v512.wad
set md5=df67ed4bd8f8f117741fef7952ee5c17
set md5alt=%md5%
set category=ios
goto:downloadstart

:SM4.2J
set name=System Menu 4.2J
set code1=00000001
set code2=00000002
set version=480
set wadname=SystemMenu_4.2J_v480.wad
set md5=0413a9aed208b193fea85db908bbdabf
set md5alt=%md5%
set category=ios
goto:downloadstart

:SM4.1J
set name=System Menu 4.1J
set code1=00000001
set code2=00000002
set version=448
set wadname=SystemMenu_4.1J_v448.wad
set md5=6edb4b3f7ca26c643c6bc662d159ec2e
set md5alt=%md5%
set category=ios
goto:downloadstart

:SM3.2J
set name=System Menu 3.2J
set code1=00000001
set code2=00000002
set version=288
set wadname=SystemMenu_3.2J_v288.wad
set md5=907e4901a936337bd7188c82d449eae0
set md5alt=%md5%
set category=ios
goto:downloadstart


:SM4.3K
set name=System Menu 4.3K
set code1=00000001
set code2=00000002
set version=518
set wadname=SystemMenu_4.3K_v518.wad
set md5=6ed8f9e75b0a54eacfbacce57c20136d
set md5alt=%md5%
set category=ios
goto:downloadstart


:SM4.2K
set name=System Menu 4.2K
set code1=00000001
set code2=00000002
set version=486
set wadname=SystemMenu_4.2K_v486.wad
set md5=40c0bf90ea07b02d610edae1d7aea39f
set md5alt=%md5%
set category=ios
goto:downloadstart

:SM4.1K
set name=System Menu 4.1K
set code1=00000001
set code2=00000002
set version=454
set wadname=SystemMenu_4.1K_v454.wad
set md5=c0e5d5c4914e76e7df7495ccf28ef869
set md5alt=%md5%
set category=ios
goto:downloadstart


::System Menu wads with embedded Themes

:SM4.3U-DWR
set name=System Menu 4.3U with Dark Wii Red Theme
set wadname=SystemMenu_4.3U_v513_DarkWiiRed
set ciosslot=unchanged
set md5=c6406642c6b85a8c5816a7425f72655f
set md5alt=%md5%
set basewad=SystemMenu_4.3U_v513
set basecios=%basewad%
set md5base=4f5c63e3fd1bf732067fa4c439c68a97
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.3U.diff
set md5diff=274ffdb972cd155b3daeac9ddf34f8e5
set version=513
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2U-DWR
set name=System Menu 4.2U with Dark Wii Red Theme
set wadname=SystemMenu_4.2U_v481_DarkWiiRed
set ciosslot=unchanged
set md5=ce1c3b3404807f649b2564e3c024b98f
set md5alt=%md5%
set basewad=SystemMenu_4.2U_v481
set basecios=%basewad%
set md5base=4ac52b981845473bd3655e4836d7442b
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.2U.diff
set md5diff=173e1e45e565afe6a9c17e45b3868fe1
set version=481
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1U-DWR
set name=System Menu 4.1U with Dark Wii Red Theme
set wadname=SystemMenu_4.1U_v449_DarkWiiRed
set ciosslot=unchanged
set md5=8bf20afa9f046fd3e2c780572e483dac
set md5alt=%md5%
set basewad=SystemMenu_4.1U_v449
set basecios=%basewad%
set md5base=38a95a9acd257265294be41b796f6239
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.1U.diff
set md5diff=df64c985b671feed318ac43b0682f22c
set version=449
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3E-DWR
set name=System Menu 4.3E with Dark Wii Red Theme
set wadname=SystemMenu_4.3E_v514_DarkWiiRed
set ciosslot=unchanged
set md5=dded36962c4901dec076d77f5be34761
set md5alt=%md5%
set basewad=SystemMenu_4.3E_v514
set basecios=%basewad%
set md5base=2ec2e6fbdfc52fe5174749e7032f1bad
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.3E.diff
set md5diff=4a035087fbaf1d3e2f799cfbef8d5991
set version=514
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2E-DWR
set name=System Menu 4.2E with Dark Wii Red Theme
set wadname=SystemMenu_4.2E_v482_DarkWiiRed
set ciosslot=unchanged
set md5=7c3f054be71e076b10d55a1e3055490f
set md5alt=%md5%
set basewad=SystemMenu_4.2E_v482
set basecios=%basewad%
set md5base=7d77be8b6df5ac893d24652db33d02cd
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.2E.diff
set md5diff=e9d46b2827275468d481cf9815775fa1
set version=482
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1E-DWR
set name=System Menu 4.1E with Dark Wii Red Theme
set wadname=SystemMenu_4.1E_v450_DarkWiiRed
set ciosslot=unchanged
set md5=64ea335a386d14a0fd707ec5d0cbdd68
set md5alt=%md5%
set basewad=SystemMenu_4.1E_v450
set basecios=%basewad%
set md5base=688cc78b8eab4e30da04f01a81a3739f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.1E.diff
set md5diff=46e72e15acad77bdc6c4dc01288f0a41
set version=450
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3J-DWR
set name=System Menu 4.3J with Dark Wii Red Theme
set wadname=SystemMenu_4.3J_v512_DarkWiiRed
set ciosslot=unchanged
set md5=94028d042a9c3d3f831f88e7b34dc64b
set md5alt=%md5%
set basewad=SystemMenu_4.3J_v512
set basecios=%basewad%
set md5base=df67ed4bd8f8f117741fef7952ee5c17
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.3J.diff
set md5diff=49efc630c29dc55f27fd41b99894c5a8
set version=512
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2J-DWR
set name=System Menu 4.2J with Dark Wii Red Theme
set wadname=SystemMenu_4.2J_v480_DarkWiiRed
set ciosslot=unchanged
set md5=6ad6db286d54ee25ff13f1a3e42c3f03
set md5alt=%md5%
set basewad=SystemMenu_4.2J_v480
set basecios=%basewad%
set md5base=0413a9aed208b193fea85db908bbdabf
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.2J.diff
set md5diff=96f3db9373569a56473ae4af2597d861
set version=480
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1J-DWR
set name=System Menu 4.1J with Dark Wii Red Theme
set wadname=SystemMenu_4.1J_v448_DarkWiiRed
set ciosslot=unchanged
set md5=75d1262328629d2a4f26e40ce7bdf6ca
set md5alt=%md5%
set basewad=SystemMenu_4.1J_v448
set basecios=%basewad%
set md5base=6edb4b3f7ca26c643c6bc662d159ec2e
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.1J.diff
set md5diff=19bedd0cc5a75f9ac2b1d2c41e7aeb9c
set version=448
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart


:SM4.3K-DWR
set name=System Menu 4.3K with Dark Wii Red Theme
set wadname=SystemMenu_4.3K_v518_DarkWiiRed
set ciosslot=unchanged
set md5=48eb64aad35de4cae0e4edf6312792ea
set md5alt=%md5%
set basewad=SystemMenu_4.3K_v518
set basecios=%basewad%
set md5base=6ed8f9e75b0a54eacfbacce57c20136d
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.3K.diff
set md5diff=4c7261b30924fa7b8f4b5f2006f96353
set version=518
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2K-DWR
set name=System Menu 4.2K with Dark Wii Red Theme
set wadname=SystemMenu_4.2K_v486_DarkWiiRed
set ciosslot=unchanged
set md5=43f456c8268cc519849ae9a818d9a817
set md5alt=%md5%
set basewad=SystemMenu_4.2K_v486
set basecios=%basewad%
set md5base=40c0bf90ea07b02d610edae1d7aea39f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.2K.diff
set md5diff=7d665e22dbc159c77f61b61c5bbfbd25
set version=486
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1K-DWR
set name=System Menu 4.1K with Dark Wii Red Theme
set wadname=SystemMenu_4.1K_v454_DarkWiiRed
set ciosslot=unchanged
set md5=1183962bc43608226ac95b843c50e393
set md5alt=%md5%
set basewad=SystemMenu_4.1K_v454
set basecios=%basewad%
set md5base=c0e5d5c4914e76e7df7495ccf28ef869
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.1K.diff
set md5diff=d8ed160c71d37b4df9de3b27383f314f
set version=454
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3U-DWG
set name=System Menu 4.3U with Dark Wii Green Theme
set wadname=SystemMenu_4.3U_v513_DarkWiiGreen
set ciosslot=unchanged
set md5=7b7fb70fc4c50ebb19b16809c510f7cf
set md5alt=%md5%
set basewad=SystemMenu_4.3U_v513
set basecios=%basewad%
set md5base=4f5c63e3fd1bf732067fa4c439c68a97
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.3U.diff
set md5diff=950dc449c9078c66bce6dd3c12cf1880
set version=513
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2U-DWG
set name=System Menu 4.2U with Dark Wii Green Theme
set wadname=SystemMenu_4.2U_v481_DarkWiiGreen
set ciosslot=unchanged
set md5=284612e6594c9f84580756280e0f1edf
set md5alt=%md5%
set basewad=SystemMenu_4.2U_v481
set basecios=%basewad%
set md5base=4ac52b981845473bd3655e4836d7442b
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.2U.diff
set md5diff=c84433f008a5d8ca513b88fe158a58ef
set version=481
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1U-DWG
set name=System Menu 4.1U with Dark Wii Green Theme
set wadname=SystemMenu_4.1U_v449_DarkWiiGreen
set ciosslot=unchanged
set md5=890d1d8987eff3ae3bcce55e6631d348
set md5alt=%md5%
set basewad=SystemMenu_4.1U_v449
set basecios=%basewad%
set md5base=38a95a9acd257265294be41b796f6239
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.1U.diff
set md5diff=8d6dfa9e46848f8dac44447117609b50
set version=449
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3E-DWG
set name=System Menu 4.3E with Dark Wii Green Theme
set wadname=SystemMenu_4.3E_v514_DarkWiiGreen
set ciosslot=unchanged
set md5=33a014d9e381b7e4855d4c38e166bcf1
set md5alt=%md5%
set basewad=SystemMenu_4.3E_v514
set basecios=%basewad%
set md5base=2ec2e6fbdfc52fe5174749e7032f1bad
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.3E.diff
set md5diff=193c533783936d1e846181aafdc5c86c
set version=514
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2E-DWG
set name=System Menu 4.2E with Dark Wii Green Theme
set wadname=SystemMenu_4.2E_v482_DarkWiiGreen
set ciosslot=unchanged
set md5=c09dc36ccfc4124cd0d645eee325af05
set md5alt=%md5%
set basewad=SystemMenu_4.2E_v482
set basecios=%basewad%
set md5base=7d77be8b6df5ac893d24652db33d02cd
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.2E.diff
set md5diff=b2cc705de7c52afdcd78c404e3aeeb35
set version=482
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1E-DWG
set name=System Menu 4.1E with Dark Wii Green Theme
set wadname=SystemMenu_4.1E_v450_DarkWiiGreen
set ciosslot=unchanged
set md5=6ad47f18aa9b50704b0c39e41e210338
set md5alt=%md5%
set basewad=SystemMenu_4.1E_v450
set basecios=%basewad%
set md5base=688cc78b8eab4e30da04f01a81a3739f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.1E.diff
set md5diff=b582b9c5a802c12b21d1c82164bbb6fc
set version=450
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3J-DWG
set name=System Menu 4.3J with Dark Wii Green Theme
set wadname=SystemMenu_4.3J_v512_DarkWiiGreen
set ciosslot=unchanged
set md5=44230fb3d9960c635ea2f0073591a89f
set md5alt=%md5%
set basewad=SystemMenu_4.3J_v512
set basecios=%basewad%
set md5base=df67ed4bd8f8f117741fef7952ee5c17
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.3J.diff
set md5diff=5079f0b903bbcab6f5ba07b22b728bb4
set version=512
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2J-DWG
set name=System Menu 4.2J with Dark Wii Green Theme
set wadname=SystemMenu_4.2J_v480_DarkWiiGreen
set ciosslot=unchanged
set md5=a2b3529e1ce5468a1637d3192e933095
set md5alt=%md5%
set basewad=SystemMenu_4.2J_v480
set basecios=%basewad%
set md5base=0413a9aed208b193fea85db908bbdabf
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.2J.diff
set md5diff=3bc7f831ebe77fa02728bed66e31546f
set version=480
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1J-DWG
set name=System Menu 4.1J with Dark Wii Green Theme
set wadname=SystemMenu_4.1J_v448_DarkWiiGreen
set ciosslot=unchanged
set md5=10f93f821404fd15032a18536f831254
set md5alt=%md5%
set basewad=SystemMenu_4.1J_v448
set basecios=%basewad%
set md5base=6edb4b3f7ca26c643c6bc662d159ec2e
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.1J.diff
set md5diff=15ae33a7be1f43dece97493a2d20557f
set version=448
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart


:SM4.3K-DWG
set name=System Menu 4.3K with Dark Wii Green Theme
set wadname=SystemMenu_4.3K_v518_DarkWiiGreen
set ciosslot=unchanged
set md5=310abbb72ab785c74440164eb5560859
set md5alt=%md5%
set basewad=SystemMenu_4.3K_v518
set basecios=%basewad%
set md5base=6ed8f9e75b0a54eacfbacce57c20136d
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.3K.diff
set md5diff=b0cd220c1b5a883d3f31c0d48b14a896
set version=518
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2K-DWG
set name=System Menu 4.2K with Dark Wii Green Theme
set wadname=SystemMenu_4.2K_v486_DarkWiiGreen
set ciosslot=unchanged
set md5=d162d0270620052d35fe84fedbd9e018
set md5alt=%md5%
set basewad=SystemMenu_4.2K_v486
set basecios=%basewad%
set md5base=40c0bf90ea07b02d610edae1d7aea39f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.2K.diff
set md5diff=3056493d9b3104016b150b6933e5eeca
set version=486
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1K-DWG
set name=System Menu 4.1K with Dark Wii Green Theme
set wadname=SystemMenu_4.1K_v454_DarkWiiGreen
set ciosslot=unchanged
set md5=59f0358a5bf037b56425bf757f028fa4
set md5alt=%md5%
set basewad=SystemMenu_4.1K_v454
set basecios=%basewad%
set md5base=c0e5d5c4914e76e7df7495ccf28ef869
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.1K.diff
set md5diff=3033ea57ce850735278b5ce5a1a570c4
set version=454
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart


:MII
set name=MII Channel
set code1=00010002
set code2=48414341
set version=6
set wadname=Mii-Channel-NUS-v6.wad
set md5=5f03c5970ecf064bc520f4a11a0d3a34
set md5alt=%md5%
set category=ios
goto:downloadstart

:PHOTO
set name=Photo Channel 1.1 (USA / PAL / JAP)
set code1=00010002
set code2=48415941
set version=3
set wadname=Photo-Channel-1.1-NUS-v3.wad
set md5=ba88843d7d5d8090c6cce2c822965299
set md5alt=%md5%
set category=ios
goto:downloadstart

:PHOTO_K
set name=KOREAN Photo Channel 1.1
set code1=00010002
set code2=4841594B
set version=3
set wadname=Photo-Channel-1.1-NUS-v3[K].wad
set md5=a3aa49e803fe297c0e23dd2d6a1467b3
set md5alt=%md5%
set category=ios
goto:downloadstart

:SHOP
set name=Shopping Channel (USA / PAL / JAP)
set code1=00010002
set code2=48414241
set version=20
set wadname=Shopping-Channel-NUS-v20.wad
set md5=9eaa1e599829d59a724673349268ca60
set md5alt=39ae2f2b7eb3b1143908729b3ef0383b
set category=ios
goto:downloadstart

:SHOP_K
set name=KOREAN Shopping Channel
set code1=00010002
set code2=4841424B
set version=20
set wadname=Shopping-Channel-NUS-v20[K].wad
set md5=cd69e1971f2413fe0122dd9a43936bf3
set md5alt=%md5%
set category=ios
goto:downloadstart

:NET_U
set name=USA Internet Channel
set code1=00010001
set code2=48414445
set version=1024
set wadname=Opera-Internet-Channel-NUS[U].wad
set md5=434356a447bc01f10ea6a3289521d127
set md5alt=%md5%
set category=ios
goto:downloadstart

:NET_E
set name=PAL Internet Channel
set code1=00010001
set code2=48414450
set version=1024
set wadname=Opera-Internet-Channel-NUS[E].wad
set md5=da20d4d1aedcd4dfa281423f2152ef6e
set md5alt=%md5%
set category=ios
goto:downloadstart

:NET_J
set name=JAP Internet Channel
set code1=00010001
set code2=4841444A
set version=1024
set wadname=Opera-Internet-Channel-NUS[J].wad
set md5=2ed4f8ad0977a3073b8fdfbf76ef1ba8
set md5alt=%md5%
set category=ios
goto:downloadstart

:WEATHER_U
set name=USA Weather Channel
set code1=00010002
set code2=48414645
set version=7
set wadname=Weather-Channel-NUS-v7[U].wad
set md5=3c6c857751770fdcf3a80facbbfe3be4
set md5alt=%md5%
set category=ios
goto:downloadstart

:WEATHER_E
set name=PAL Weather Channel
set code1=00010002
set code2=48414650
set version=7
set wadname=Weather-Channel-NUS-v7[E].wad
set md5=56dd7a5a34cf4ee4ac222eb6bd01c0d9
set md5alt=%md5%
set category=ios
goto:downloadstart

:WEATHER_J
set name=JAP Weather Channel
set code1=00010002
set code2=4841464A
set version=7
set wadname=Weather-Channel-NUS-v7[J].wad
set md5=c9f5ee197779910e71f9f554f7fa64ac
set md5alt=%md5%
set category=ios
goto:downloadstart

:NEWS_U
set name=USA NEWS Channel
set code1=00010002
set code2=48414745
set version=7
set wadname=NEWS-Channel-NUS-v7[U].wad
set md5=c9fff95d6a4ca9f04dcd1fe3b28cc83a
set md5alt=%md5%
set category=ios
goto:downloadstart

:NEWS_E
set name=PAL NEWS Channel
set code1=00010002
set code2=48414750
set version=7
set wadname=NEWS-Channel-NUS-v7[E].wad
set md5=11c713ff825f918bfe2c1065e5ab9827
set md5alt=%md5%
set category=ios
goto:downloadstart

:NEWS_J
set name=JAP NEWS Channel
set code1=00010002
set code2=4841474A
set version=7
set wadname=NEWS-Channel-NUS-v7[J].wad
set md5=15dbd847c9f4b1df53cabe3fad57ad87
set md5alt=%md5%
set category=ios
goto:downloadstart

:SPEAK_U
set name=USA Wii Speak Channel
set code1=00010001
set code2=48434645
set version=512
set wadname=Wii-Speak-Channel-NUS[U].wad
set md5=0c48ace121c73f1703e8790a494712bb
set md5alt=%md5%
set category=ios
goto:downloadstart

:SPEAK_E
set name=PAL Wii Speak Channel
set code1=00010001
set code2=48434650
set version=512
set wadname=Wii-Speak-Channel-NUS[E].wad
set md5=77643094290097a2d237c78ba6e78df6
set md5alt=%md5%
set category=ios
goto:downloadstart

:SPEAK_J
set name=JAP Wii Speak Channel
set code1=00010001
set code2=4843464A
set version=512
set wadname=Wii-Speak-Channel-NUS[J].wad
set md5=a686e2934045eff007a62760272208b8
set md5alt=%md5%
set category=ios
goto:downloadstart

:IOS9
set name=IOS9
set code1=00000001
set code2=00000009
set version=1034
set wadname=IOS9-64-v1034.wad
set md5=b81f3fe9912ac711b3e6423116420bc1
set md5alt=%md5%
set category=ios
goto:downloadstart

:IOS12
set name=IOS12
set code1=00000001
set code2=0000000C
set version=526
set wadname=IOS12-64-v526.wad
set md5=60fad19280c01d5632e5a745da34640a
set md5alt=56e793bb18368b2819251682c92b4b16
set category=ios
goto:downloadstart

:IOS13
set name=IOS13
set code1=00000001
set code2=0000000D
set version=1032
set wadname=IOS13-64-v1032.wad
set md5=861b51f06dbdec73eac60a980313f604
set md5alt=%md5%
set category=ios
goto:downloadstart

:IOS14
set name=IOS14
set code1=00000001
set code2=0000000E
set version=1032
set wadname=IOS14-64-v1032.wad
set md5=48ac1dc132ca31c2520ea1a8dbc321e2
set md5alt=171a3d7fc79e502915bf7654ea3f5204
set category=ios
goto:downloadstart

:IOS15
set name=IOS15 v1032
set code1=00000001
set code2=0000000F
set version=1032
set wadname=IOS15-64-v1032.wad
set md5=4c56fd21ce0c59ad33f70497d504b10a
set md5alt=c9b8f623a294530057ddabd42da79a9b
set category=ios
goto:downloadstart


:IOS17
set name=IOS17
set code1=00000001
set code2=00000011
set version=1032
set wadname=IOS17-64-v1032.wad
set md5=5e73e5bc654d17f60db4f4426be46755
set md5alt=1b8b976c81622181df5508a8ea050cfc
set category=ios
goto:downloadstart

:IOS21
set name=IOS21
set code1=00000001
set code2=00000015
set version=1039
set wadname=IOS21-64-v1039.wad
set md5=c85f2b33b3d96f91e57deefc1dd57eee
set md5alt=86123b565792d5c103b05cd9544f98e1
set category=ios
goto:downloadstart

:IOS22
set name=IOS22
set code1=00000001
set code2=00000016
set version=1294
set wadname=IOS22-64-v1294.wad
set md5=d924051fcab6280a71b39378c754b1d9
set md5alt=e5c16a04547fd2c23da4eb93199d9fc9
set category=ios
goto:downloadstart

:IOS28
set name=IOS28
set code1=00000001
set code2=0000001C
set version=1807
set wadname=IOS28-64-v1807.wad
set md5=ae6e5fdf37bc38380b09c1d934dc60d6
set md5alt=6dfccbac761898eb8099063d5308f72f
set category=ios
goto:downloadstart

:IOS30
set name=IOS30v2576 (3.2 System Menu IOS)
set code1=00000001
set code2=0000001E
set version=2576
set wadname=IOS30-64-v2576.wad
set md5=45d7945d08eb25dc167b6f30ab8a9a9d
set md5alt=%md5%
set category=ios
goto:downloadstart

:IOS30P
set name=IOS30v12576(IOS30v2576[FS-ES-NP]) (patched 3.2 System Menu IOS for non-LU64+ Wii's)
set code1=00000001
set code2=0000001E
set version=2576
set wadname=IOS30v12576(IOS30v2576[FS-ES-NP]).wad
set md5=7af50c8602bbd32377916ddad11712ab
set md5alt=%md5%
set ciosslot=30
set ciosversion=12576
set category=patchios
goto:downloadstart

:IOS31
set name=IOS31
set code1=00000001
set code2=0000001F
set version=3608
set wadname=IOS31-64-v3608.wad
set md5=b0d71604ed554c6fd1db9bfdad0d6335
set md5alt=3555e0b6baa7e3e5043d1cf1df054b2c
set category=ios
goto:downloadstart

:IOS33
set name=IOS33
set code1=00000001
set code2=00000021
set version=3608
set wadname=IOS33-64-v3608.wad
set md5=a969609ec1a69dcc234f71443e1471f7
set md5alt=52b56a8f36c3ef5948c0d11147073e49
set category=ios
goto:downloadstart

:IOS34
set name=IOS34
set code1=00000001
set code2=00000022
set version=3608
set wadname=IOS34-64-v3608.wad
set md5=cefee27b32cee588f3bbd81d022777ad
set md5alt=b65cde9ad841561e645ecfe7b0bb9cc1
set category=ios
goto:downloadstart

:IOS35
set name=IOS35
set code1=00000001
set code2=00000023
set version=3608
set wadname=IOS35-64-v3608.wad
set md5=34cf8249ac64c252f4e5950a1fbf41a6
set md5alt=3e862b5bb75a45c544fbe588f37c60f4
set category=ios
goto:downloadstart

:IOS36
set name=IOS36
set code1=00000001
set code2=00000024
set version=3351
set wadname=IOS36-64-v3351.wad
set md5=47ef27d46fc581c520f8215f39f11ecb
set md5alt=daa08e17264c523049e395edad5a50fe
set category=ios
goto:downloadstart

:IOS36v3608
set name=IOS36v3608
set code1=00000001
set code2=00000024
set version=3608
set wadname=IOS36-64-v3608.wad
set md5=58d6f06bfea15a562713df6e33b2f18b
set md5alt=dea0c5d8e4ce7adf0e54e5890929e904
set category=ios
goto:downloadstart



:IOS37
set name=IOS37
set code1=00000001
set code2=00000025
set version=5663
set wadname=IOS37-64-v5663.wad
set md5=54dfa6105113926b1996f8bc20d99007
set md5alt=16bc6ae65e6f469631b6add48b6b22b2
set category=ios
goto:downloadstart

:IOS38
set name=IOS38
set code1=00000001
set code2=00000026
set version=4124
set wadname=IOS38-64-v4124.wad
set md5=366dc2b1f7d8000a41755ff12f63d39c
set md5alt=162f370e1ee3f0d86a3313f285fbb318
set category=ios
goto:downloadstart

:IOS41
set name=IOS41
set code1=00000001
set code2=00000029
set version=3607
set wadname=IOS41-64-v3607.wad
set md5=6256a159cf74fd7a59822cf5597c69e3
set md5alt=3610517695d246b9cb69069e77eb3ae5
set category=ios
goto:downloadstart




:IOS43
set name=IOS43
set code1=00000001
set code2=0000002B
set version=3607
set wadname=IOS43-64-v3607.wad
set md5=633aa0cecd534622df8de27cd7361194
set md5alt=%md5%
set category=ios
goto:downloadstart

:IOS45
set name=IOS45
set code1=00000001
set code2=0000002D
set version=3607
set wadname=IOS45-64-v3607.wad
set md5=e0aaa5cb0a6121ac61255f0bfe484205
set md5alt=%md5%
set category=ios
goto:downloadstart

:IOS46
set name=IOS46
set code1=00000001
set code2=0000002E
set version=3607
set wadname=IOS46-64-v3607.wad
set md5=f542b3945ba76ad60cbe21fc091f79cf
set md5alt=%md5%
set category=ios
goto:downloadstart


:IOS48v4124
set name=IOS48
set code1=00000001
set code2=00000030
set version=4124
set wadname=IOS48-64-v4124.wad
set md5=5c825044e599b78b84da74778dfe0bb7
set md5alt=%md5%
set category=ios
goto:downloadstart

:IOS50P
set name=IOS50v14889(IOS50v4889[FS-ES-NP]) (patched 3.4 System Menu IOS that even works for LU64+ Wii's)
set code1=00000001
set code2=00000032
set version=4889
set wadname=IOS50v14889(IOS50v4889[FS-ES-NP]).wad
set md5=f02db9de1d9e66bbe4fdd116e5cc22f3
set md5alt=%md5%
set ciosslot=50
set ciosversion=14889
set category=patchios
goto:downloadstart


:IOS52P
set name=IOS52v15661(IOS52v5661[FS-ES-NP]) (patched 3.5K System Menu IOS)
set code1=00000001
set code2=00000034
set version=5661
set wadname=IOS52v15661(IOS52v5661[FS-ES-NP]).wad
set md5=04d40614dee9a204d1510f6f258bd57f
set md5alt=%md5%
set ciosslot=52
set ciosversion=15661
set category=patchios
goto:downloadstart



:IOS53
set name=IOS53
set code1=00000001
set code2=00000035
set version=5663
set wadname=IOS53-64-v5663.wad
set md5=7222503d83c869b5633a8bedaae517d8
set md5alt=fb73af31ff36a6ce9e1289ba867eb2e7
set category=ios
goto:downloadstart

:IOS55
set name=IOS55
set code1=00000001
set code2=00000037
set version=5663
set wadname=IOS55-64-v5663.wad
set md5=92c8877577c68143595f5e48dfa14ed1
set md5alt=4de32047ace920a15cdd3fe24abeef50
set category=ios
goto:downloadstart

:IOS56
set name=IOS56
set code1=00000001
set code2=00000038
set version=5662
set wadname=IOS56-64-v5662.wad
set md5=e6341c6c30c44fa9735c9cc6090133d8
set md5alt=1f6487d137fcd494cb2c35986ad6b490
set category=ios
goto:downloadstart

:IOS57
set name=IOS57
set code1=00000001
set code2=00000039
set version=5919
set wadname=IOS57-64-v5919.wad
set md5=c96e3b6a0616bf9f3ae188aca92d32cc
set md5alt=41cbc739426ce5ebe3a40a5b635a4736
set category=ios
goto:downloadstart


:IOS58
set name=IOS58
set code1=00000001
set code2=0000003A
set version=6176
set wadname=IOS58-64-v6176.wad
set md5=b72783f95e1567740c1cce6dc9d3ddc8
set md5alt=c7c24f0cd2e331294e32e0325b69a6d9
set category=ios
goto:downloadstart

:IOS60
set name=IOS60v6174 (4.1 System Menu IOS)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS60-64-v6174.wad
set md5=a8cfd7a77016227203639713db5ac34e
set md5alt=%md5%
set category=ios
goto:downloadstart



:IOS60P
set name=IOS60v6174[FS-ES-NP] (patched 4.1 System Menu IOS)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS60v16174(IOS60v6174[FS-ES-NP]).wad
set md5=e4e6b5303a284789f183e71af9edd461
set md5alt=%md5%
set ciosslot=60
set ciosversion=16174
set category=patchios
goto:downloadstart


::IOS60 installed to a bunch of different SM IOS slots for brick protection
:IOS11P60
set name=IOS11v16174(IOS60v6174[FS-ES-NP]) (patched 2.0-2.1 System Menu IOS that even works for LU64+ Wii's)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS11v16174(IOS60v6174[FS-ES-NP]).wad
set md5=69b79026dc661384d0892b2100e5f3ec
set md5alt=%md5%
set ciosslot=11
set ciosversion=16174
set category=patchios
goto:downloadstart



:IOS20P60
set name=IOS20v16174(IOS60v6174[FS-ES-NP]) (patched 2.2 System Menu IOS that even works for LU64+ Wii's)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS20v16174(IOS60v6174[FS-ES-NP]).wad
set md5=8dc15c43700eb1713050aeec9181ea0b
set md5alt=%md5%
set ciosslot=20
set ciosversion=16174
set category=patchios
goto:downloadstart



:IOS30P60
set name=IOS30v16174(IOS60v6174[FS-ES-NP]) (patched 3.2 System Menu IOS that even works for LU64+ Wii's)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS30v16174(IOS60v6174[FS-ES-NP]).wad
set md5=5befd07e059d54753464956c64e071d2
set md5alt=%md5%
set ciosslot=30
set ciosversion=16174
set category=patchios
goto:downloadstart

:IOS40P60
set name=IOS40v16174(IOS60v6174[FS-ES-NP]) (patched 3.3K System Menu IOS)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS40v16174(IOS60v6174[FS-ES-NP]).wad
set md5=845254a425aea1ae7a34bcbc68cbe01c
set md5alt=%md5%
set ciosslot=40
set ciosversion=16174
set category=patchios
goto:downloadstart


:IOS70K
set name=IOS70v16174(IOS60v6174[FS-ES-NP])-for Region Changed Korean Wii's
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS70v16174(IOS60v6174[FS-ES-NP]).wad
set md5=d7fc28b7012cd1b941b8f7feaa0e1637
set md5alt=%md5%
set ciosslot=70
set ciosversion=16174
set category=patchios
goto:downloadstart


:IOS80K
set name=IOS80v16174(IOS60v6174[FS-ES-NP])-for Region Changed Korean Wii's
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS80v16174(IOS60v6174[FS-ES-NP]).wad
set md5=99b4c8ad3ac9664acb08fdc695da417c
set md5alt=%md5%
set ciosslot=80
set ciosversion=16174
set category=patchios
goto:downloadstart



:IOS61
set name=IOS61
set code1=00000001
set code2=0000003D
set version=5662
set wadname=IOS61-64-v5662.wad
set md5=54c44b17be63ea4b3b674d66f4efa7bf
set md5alt=7f79db4519182d15b1332ff06ed40880
set category=ios
goto:downloadstart


:IOS70
set name=IOS70v6687 (4.2 System Menu IOS)
set code1=00000001
set code2=00000046
set version=6687
set wadname=IOS70-64-v6687.wad
set md5=c38ff50344c00e17b7fe58c05d35a91c
set md5alt=%md5%
set category=ios
goto:downloadstart



:IOS70P
set name=IOS70v16687(IOS70v6687[FS-ES-NP]) (patched 4.2 System Menu IOS)
set code1=00000001
set code2=00000046
set version=6687
set wadname=IOS70v16687(IOS70v6687[FS-ES-NP]).wad
::IOS70-64-v6687[FS-ES-NP].wad
set md5=c513cb1684fa35401b17f690d4f327dd
set md5alt=%md5%
set ciosslot=70
set ciosversion=16687
set category=patchios
goto:downloadstart


:IOS80
set name=IOS80v6944 (4.3 System Menu IOS)
set code1=00000001
set code2=00000050
set version=6944
set wadname=IOS80-64-v6944.wad
set md5=08af8d598af53c8bc66b31228364cfd7
set md5alt=dde76a81090611406bcb3b76ac3f082c
set category=ios
goto:downloadstart


:IOS80P
set name=IOS80v6944[FS-ES-NP] (patched 4.3 System Menu IOS)
set code1=00000001
set code2=00000050
set version=6944
set wadname=IOS80-64-v6944[FS-ES-NP].wad
set md5=779b6cd4e7b3cd125616835da4c0c0b0
set md5alt=871214a3b43925780dec4c910a251caa
set ciosslot=80
set ciosversion=6944
set category=patchios
goto:downloadstart


:IOS236
set name=IOS236v65535(IOS36v3351[FS-ES-NP])
set code1=00000001
set code2=00000024
set version=3351
set wadname=IOS236v65535(IOS36v3351[FS-ES-NP]).wad
set md5=7efdac58e6f0c89dbe0b2045ac83cb36
set md5alt=%md5%
set ciosslot=236
set ciosversion=65535
set category=patchios
goto:downloadstart


:M10
set name=MIOSv10
set code1=00000001
set code2=00000101
set version=10
set wadname=RVL-mios-v10.wad
set md5=851c27dae82bc1c758be07fa964d17cb
set md5alt=%md5%
set category=ios
goto:downloadstart


:NUSGRABBER0e
set name=0000000e.app from IOS80 v6943 (SNEEK)
set code1=SNEEKAPP
::set code2=APP
set version=0e
set wadname=0000000e_IOS80.app
set md5=4b3ad6d33707d55ec27583a84b2ecf2a
goto:downloadstart


:NUSGRABBER0e_70
set name=0000000e.app from IOS70 v6687 (SNEEK)
set code1=SNEEKAPP
::set code2=APP
set version=0e_70
set wadname=0000000e_IOS70.app
set md5=7c3a8a690b6f701d2dcea082da1bd478
goto:downloadstart


:NUSGRABBER0e_60
set name=0000000e.app from IOS60 v6174 (SNEEK)
set code1=SNEEKAPP
::set code2=APP
set version=0e_60
set wadname=0000000e_IOS60.app
set md5=ddaa661a6aac528c26217eda972a1787
goto:downloadstart

:NUSGRABBER01
set name=00000001.app from IOS80 v6687 (SNEEK)
set code1=SNEEKAPP
::set code2=APP
set version=01
set wadname=00000001_IOS80.app
set md5=89f7dc21f07e2cae97c3a571b23d8abd
goto:downloadstart

:NUSGRABBER01_70
set name=00000001.app from IOS70 v6687 (SNEEK)
set code1=SNEEKAPP
::set code2=APP
set version=01_70
set wadname=00000001_IOS70.app
set md5=89f7dc21f07e2cae97c3a571b23d8abd
goto:downloadstart


:NUSGRABBER01_60
set name=00000001.app from IOS60 v6174 (SNEEK)
set code1=SNEEKAPP
::set code2=APP
set version=01_60
set wadname=00000001_IOS60.app
set md5=48e1be8f767feb59cbc51aa4329d735a
goto:downloadstart

:NUSGRABBER0c
set name=0000000c.app from MIOS v10 (DIOS MIOS)
set code1=SNEEKAPP
::set code2=APP
set version=0c
set wadname=0000000c.app
set md5=42634040d7cbb53057c577ec4c3c63f8
goto:downloadstart

:NUSGRABBER40
set name=00000040.app from System Menu 3.2J (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=40
set wadname=00000040_3.2J.app
set md5=c39e9edfc6df2264ce8ade4fd933f47f
goto:downloadstart

:NUSGRABBER42
set name=00000042.app from System Menu 3.2U (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=42
set wadname=00000042_3.2U.app
set md5=9aae1917fdb8ba4d409664c230d89b27
goto:downloadstart

:NUSGRABBER45
set name=00000045.app from System Menu 3.2E (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=45
set wadname=00000045_3.2E.app
set md5=500130276620408b47777355460193de
goto:downloadstart

:NUSGRABBER70
set name=00000070.app from System Menu 4.0J (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=70
set wadname=00000070_4.0J.app
set md5=cc23b71d9246154f289644beee1b1682
goto:downloadstart

:NUSGRABBER72
set name=00000072.app from System Menu 4.0U (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=72
set wadname=00000072_4.0U.app
set md5=611d8d5e1f7ce778ba4c44d1b4c2910b
goto:downloadstart

:NUSGRABBER75
set name=00000075.app from System Menu 4.0E (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=75
set wadname=00000075_4.0E.app
set md5=a1d5703a4a2a5d764a12224d646c2849
goto:downloadstart

:NUSGRABBER78
set name=00000078.app from System Menu 4.1J (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=78
set wadname=00000078_4.1J.app
set md5=f2eadf12d18e793373060222b870057d
goto:downloadstart

:NUSGRABBER81
set name=00000081.app from System Menu 4.1K (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=81
set wadname=00000081_4.1K.app
set md5=7eedbf1a146b29b63edbb55e04f81f98
goto:downloadstart

:NUSGRABBER7b
set name=0000007b.app from System Menu 4.1U (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=7b
set wadname=0000007b_4.1U.app
set md5=6b939de8222800733f4c44ae4eadb325
goto:downloadstart

:NUSGRABBER7e
set name=0000007e.app from System Menu 4.1E (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=7e
set wadname=0000007e_4.1E.app
set md5=574a3a144971ea0ec61bf8cef8d7ff80
goto:downloadstart

:NUSGRABBER84
set name=00000084.app from System Menu 4.2J (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=84
set wadname=00000084_4.2J.app
set md5=b08998e582c48afba3a14f6d9e1e9373
goto:downloadstart

:NUSGRABBER87
set name=00000087.app from System Menu 4.2U (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=87
set wadname=00000087_4.2U.app
set md5=7079948c6aed8aae6009e4fdf27c7171
goto:downloadstart

:NUSGRABBER8a
set name=0000008a.app from System Menu 4.2E (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=8a
set wadname=0000008a_4.2E.app
set md5=7e7994f78941afb51e9a20085deac305
goto:downloadstart


:NUSGRABBER8d
set name=0000008d.app from System Menu 4.2K (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=8d
set wadname=0000008d_4.2K.app
set md5=9d72a1966370e44cb4c456c17a077bec
goto:downloadstart


:NUSGRABBER94
set name=00000094.app from System Menu 4.3J (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=94
set wadname=00000094_4.3J.app
set md5=5b3ee6942a3cda716badbce3665076fc
goto:downloadstart

:NUSGRABBER97
set name=00000097.app from System Menu 4.3U (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=97
set wadname=00000097_4.3U.app
set md5=f388c9b11543ac2fe0912ab96064ee37
goto:downloadstart

:NUSGRABBER9a
set name=0000009a.app from System Menu 4.3E (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=9a
set wadname=0000009a_4.3E.app
set md5=41310f79497c56850c37676074ee1237
goto:downloadstart


:NUSGRABBER9d
set name=0000009d.app from System Menu 4.3K (for MyMenuify)
set code1=MYMAPP
::set code2=APP
set version=9d
set wadname=0000009d_4.3K.app
set md5=e6f2b0d4d5e0c095895f186009bf9516
goto:downloadstart


:URLDownloadDB

:BannerBomb1
set name=Bannerbomb v1 (compatible with Wii Menu version 3.0 - 4.1)
set code1=URL
set code2=http://bannerbomb.qoid.us/aads/aad1f_v108.zip
set version=bin
set dlname=aad1f_v108.zip
set wadname=BB1.zip
set md5=41d50b69c5763159afb35918c42cf320
set path1=private\wii\title\aktn\
set filename=content.bin
goto:downloadstart

:BannerBomb2
set name=Bannerbomb v2 (compatible with Wii Menu version 4.2)
set code1=URL
set code2=http://bannerbomb.qoid.us/abds/abd6a_v200.zip
set version=bin
set dlname=abd6a_v200.zip
set wadname=BB2.zip
set md5=d846f2c07c0a3be6fadca90dbb7356a7
set path1=private\wii\title\aktn\
set filename=content.bin
goto:downloadstart


:mmm
set name=Multi-Mod Manager (MMM) v13.4
set code1=URL
set code2="http://nusad.googlecode.com/files/Multi-Mod-Manager_v13.4.zip"
set version=*
set dlname="Multi-Mod-Manager_v13.4.zip"
set wadname=Multi-Mod-Manager_v13.4.zip
set filename=boot.dol
set md5=6d5167f976b5c35b2b2a12c3aa3e7766
set path1=apps\mmm\
goto:downloadstart


:HackmiiInstaller
set name=HackMii Installer
set code1=URL
::set code2="http://bootmii.org/download/"
set code2="http://bootmii.org/download/"
set version=elf
::set dlname=
set wadname=hackmii_installer_v0.8.zip
set filename=boot.dol
set path1=
set md5=8dcada755a608c70ed171ced7f9ef2f3
goto:downloadstart

:Hermesv4
set name=Hermes cIOS v4 Installer
set code1=URL
set code2=http://filetrip.net/d8367-hermes-cIOS-222223202-installer-4.html
set version=*
set dlname=8367-Hermes_cIOS_222_rev4_installer.zip
set wadname=Hermes_cIOS_v4.zip
set filename=boot.dol
set md5=a1c4a81802da20cf8990d03ebd3b3218
set path1=apps\cios_installer_v4\
goto:downloadstart

:Hermesv5
set name=Hermes cIOS v5 Installer
set code1=URL
set code2=http://filetrip.net/d9681-hermes-cIOS-Installer-5.html
set version=*
set dlname=9681-cIOS222rev5_installer.zip
set wadname=Hermes_cIOS_v5.zip
set filename=boot.dol
set md5=030a2aba6e0297080ecdfc7f7a6ba2d7
set path1=apps\cios_installer_v5\
goto:downloadstart



:Hermesv51
set name=Hermes cIOS v5.1 Installer
set code1=URL
set code2="http://nusad.googlecode.com/files/cios_installer_v5.1.zip"
set version=*
set dlname="cios_installer_v5.1.zip"
set wadname=cios_installer_v5.1.zip
set filename=boot.dol
set md5=077ac9cdffbea1155dc4bb4fb4cff6b3
set path1=apps\cios_installer_v5.1\
goto:downloadstart

:waninv19
set name=Waninkokos cIOS v19 Installer
set code1=URL
set code2=http://filetrip.net/d9911-cIOS-Installer-Xr19.html
set version=*
set dlname=9911-cIOSXrev19-Installer.zip
set wadname=cIOSX_v19.zip
set filename=boot.dol
set md5=2d678c3d4e7ea5c55a4a00472abb7421
set path1=apps\cIOSx_rev19-Installer\
goto:downloadstart


:waninv20
set name=Waninkokos cIOS v20b Installer
set code1=URL
set code2=http://filetrip.net/d12411-cIOS-Installer-Xr20b.html
set version=*
set dlname=12411-cIOSX_rev20b-Installer.zip
set wadname=cIOSX_v20b.zip
set filename=boot.dol
set md5=ea5e2e4ba67b7612be4ab9fa00b96ba0
set path1=apps\cIOSx_rev20b-Installer\
goto:downloadstart


:IOS236Installer
set name=IOS236 Installer v5 Mod
set code1=URL
set code2=http://nusad.googlecode.com/files/ios236_v5_mod.zip
set version=*
set dlname=ios236_v5_mod.zip
set wadname=ios236_v5_mod.zip
set filename=boot.dol
set md5=719a2a338121a17bedd3984faa8bd722
set path1=apps\IOS236-v5-Mod\
goto:downloadstart

:SIP
set name=Simple IOS Patcher v1.12
set code1=URL
set code2=http://nusad.googlecode.com/files/simple_ios_patcher_v1.12.zip
set version=*
set dlname=simple_ios_patcher_v1.12.zip
set wadname=simple_ios_patcher_v1.12.zip
set filename=boot.dol
set md5=f8a7771d83209595d46dcb48326cb014
set path1=apps\SIP\
goto:downloadstart

:pwns
set category=fullextract
set name=Indiana Pwns
set code1=URL
set code2="http://static.hackmii.com/indiana-pwns.zip"
set version=*
set dlname="indiana-pwns.zip"
set wadname=indiana-pwns.zip
set filename=data.bin
set md5=a6b8f03f49baa471228dcd81d3fd623a
set path1=private\wii\title\rlip\
goto:downloadstart

:Twi
set category=fullextract
set name=Twilight Hack v0.1 Beta1 (for Wii's 3.3 and below)
set code1=URL
set code2="http://filetrip.net/d2425-Twilight-Hack-v0-1-beta1.html"
set version=*
set dlname="[2711]twilight_hack_v0.1_beta1.zip"
set wadname=twilight_hack_v0.1_beta1.zip
set filename=data.bin
set md5=704bd625ea5b42d7ac06fc937af74d38
set path1=private\wii\title\rzdp\
goto:downloadstart

:BATHAXX
set category=fullextract
set name=BATHAXX (USA, PAL and JAP)
set code1=URL
set code2="http://wien.tomnetworks.com/wii/bathaxx.zip"
set version=*
set dlname="bathaxx.zip"
set wadname=bathaxx.zip
set filename=data.bin
set md5=5dac3152baabbc6ca17bedfd5b7350c9
set path1=private\wii\title\rlbe\
goto:downloadstart


:ROTJ
set category=fullextract
set name=Return of the JODI (USA, PAL and JAP)
set code1=URL
set code2="http://static.hackmii.com/return-jodi.zip"
set version=*
set dlname="return-jodi.zip"
set wadname=return-jodi.zip
set filename=data.bin
set md5=448a3e6bfb4b6d9fafd64c45575f9cb4
set path1=private\wii\title\rlge\
goto:downloadstart

:TOS
set category=fullextract
set name=Eri HaKawai (USA, PAL and JAP)
set code1=URL
set code2="http://nusad.googlecode.com/files/EriHaKawai-USA+PAL+JAP.zip"
set version=*
set dlname="EriHaKawai-USA+PAL+JAP.zip"
set wadname=EriHaKawai-USA+PAL+JAP.zip
set filename=data.bin
set md5=7884370e1b8960ed09ed61395007affd
set path1=private\wii\title\rt4j\
goto:downloadstart

:YUGI
set category=fullextract
set name=YU-GI-OWNED (USA, PAL and JAP)
set code1=URL
set code2="http://nusad.googlecode.com/files/yu-gi-vah-ALL.zip"
set version=*
set dlname="yu-gi-vah-ALL.zip"
set wadname=yu-gi-vah-ALL.zip
set filename=data.bin
set md5=0319cb55ecb1caea34e4504aa56664ab
set path1=private\wii\title\ryoe\
goto:downloadstart



:smash
set name=Smash Stack (USA, PAL, JAP and KOR)
set category=fullextract
set code1=URL
set code2="http://nusad.googlecode.com/files/Smashstack_AllRegions.zip"
set version=*
set dlname="Smashstack_AllRegions.zip"
set wadname=Smashstack_AllRegions.zip
set filename=st_080805_0933.bin
set md5=aa93aab9bfdd25883bbd826a62645033
set path1=private\wii\app\rsbe\st\
goto:downloadstart

:dopmii
set name=Dop-Mii v13
set category=fullextract
set code1=URL
set code2="http://dop-mii.googlecode.com/files/DOP-Mii v13.zip"
set version=*
set dlname="DOP-Mii v13.zip"
set wadname=DOP-Mii_v13.zip
set filename=boot.dol
set md5=7cbd40d4987d17d85d4184bafc886c1c
set path1=apps\DOP-Mii\
goto:downloadstart



:locked
set name=Locked Apps Folder for HBC (PASS=UDLRAB)
set category=fullextract
set code1=URL
set code2="http://nusad.googlecode.com/files/LockedApps(Categorii).zip"
set version=*
set dlname="LockedApps(Categorii).zip"
set wadname=LockedApps(Categorii).zip
set filename=boot.dol
set md5=6f277fd19e359db7d6f84dbad1076a29
set path1=apps\_apps_locked\
goto:downloadstart

:AccioHacks
set name=Accio Hacks
set code1=URL
set code2=http://geckocodes.org/AH.php?dl
set version=*
set dlname="AH.php@dl"
set wadname=AccioHacks.zip
set filename=boot.dol
set md5=15a27faca136b2817cee74c568ec4e64
set path1=apps\AccioHacks\
goto:downloadstart


:MyM
set name=MyMenuify
set code1=URL
set code2=http://nusad.googlecode.com/files/MyMenuify.zip
set version=*
set dlname=MyMenuify.zip
set wadname=MyMenuify.zip
set filename=boot.dol
set md5=be448c0c7b74ebc2249d5d23ceb5d325
set path1=apps\MyMenuify\
goto:downloadstart


:bootmiisd
set name=BootMii SD Files
set category=fullextract
set code1=URL
set code2="http://static.hackmii.com/bootmii_sd_files.zip"
set version=*
set dlname="bootmii_sd_files.zip"
set wadname=bootmii_sd_files.zip
set filename=ppcboot.elf
set md5=4b2ac026e3b08a588a340841244f4e98
set path1=bootmii\
goto:downloadstart

::--------Manual Update File-----
:neogamma
set category=ManualUpdate
set name=Neogamma Backup Disc Loader (most recent release)
set version=txt
set code2="http://filetrip.net/h25123270-NeoGamma.html"
set wadname="*-NeoGammaR9*.zip"
set updateurl=http://nusad.googlecode.com/files/ManualUpdate.txt
set path1=apps\neogamma
goto:downloadstart

::--------Manual Update File-----
:yawm
set category=ManualUpdate
set name=Yet Another Wad Manager Mod
set code2="http://yawmm.googlecode.com/files/YAWMM.zip"
set updateurl=http://nusad.googlecode.com/files/ManualUpdate.txt
set version=*
set wadname=yawmm.zip
set path1=apps\yawmm
goto:downloadstart



:Y4M
set name=YAWMM 4 ModMii
set code1=URL
set code2=http://yawmm.googlecode.com/files/YAWMM.zip
set version=*
set dlname="YAWMM.zip"
set wadname=YAWMM.zip
set filename=boot.dol
set md5=842507bb33184ac96bb093ceb6cd8826
set path1=apps\YAWMM4ModMii\
goto:downloadstart

:usbfolder
set name=Configurable USB-Loader (Most recent Full 249 version)
set wadname=Configurable USB-Loader (Most recent Full 249 version)
set category=cfg
goto:downloadstart

:cfg249
set name=Configurable USB Loader (Most recent 249 version)
set category=cfg
goto:downloadstart

:cfg222
set name=Configurable USB Loader (Most recent 222 version)
set category=cfg
goto:downloadstart

:cfgr
set name=Configurator for Configurable USB Loader (Most recent version)
set category=cfgr
goto:downloadstart

:FLOW
set name=WiiFlow r304-249
set code1=URL
set code2=http://wiiflow.googlecode.com/files/r304-249.zip
set version=*
set dlname=r304-249.zip
set wadname=r304-249.zip
set filename=boot.dol
set md5=33cef493e5be4a22e7f0af0fed6f4683
set path1=apps\WiiFlow\
goto:downloadstart


:CheatCodes
set name=%cheatregion% Region Cheat Codes: txtcodes from geckocodes.org
set category=CHEATS
goto:downloadstart


:WBM
set name=Wii Backup Manager v0.3.8 build60
set category=fullextract
set code1=URL
set code2="http://nusad.googlecode.com/files/WiiBackupManager-0.3.8Build60.zip"
set version=*
set dlname=WiiBackupManager-0.3.8Build60.zip
set wadname=WiiBackupManager.zip
set filename=WiiBackupManager.exe
set md5=d6619d36060f1d3215682ab860399e79
set path1=WiiBackupManager\
goto:downloadstart


:USBX
set name=USB-Loader Forwarder Channel v9
set code1=ZIP
set code2="http://nusad.googlecode.com/files/USBLoader(s)-ahbprot58-SD-USB-v9-IDCL.zip"
set version=*
set dlname=USBLoader(s)-ahbprot58-SD-USB-v9-IDCL.zip
set wadname=USBLoader(s)-ahbprot58-SD-USB-v9-IDCL.zip
set filename=USBLoader(s)-ahbprot58-SD-USB-v9-IDCL.wad
set md5=eb27717aac3ffc8bc04c4d4ebd515418
set md5alt=%md5%
set category=fullextract
set path1=WAD\
goto:downloadstart


:JOYF
set name=Joy Flow Forwarder Channel\dol
set code1=ZIP
set code2="http://nusad.googlecode.com/files/JoyFlow_Forwarder_wad_dol.zip"
set version=*
set dlname=JoyFlow_Forwarder_wad_dol.zip
set wadname=JoyFlow_Forwarder_wad_dol.zip
set filename=JoyFlowHNv10-HBJF.wad
set md5=903993f0c03ef158467187c0ed4f771d
set md5alt=%md5%
set category=fullextract
if /i "%MENU1%" EQU "S" (set path1=\) else (set path1=WAD\)
goto:downloadstart


:JOY
set name=JoyFlow
set code1=URL
set code2="http://filetrip.net/d24722-JoyFlow-1-0-rev2.html"
set version=*
set dlname=24722-JoYflow_1_0_pb_3.zip
set wadname=JoYflow_1_0_pb_3.zip
set filename=boot.dol
set md5=40aa7b59ad7e4f64ff79981761190680
set path1=apps\JoYflow\
goto:downloadstart


:S2U
set name=Switch2Uneek
set code1=ZIP
set code2="http://nusad.googlecode.com/files/switch2uneek_ModMiiBundle.zip"
set version=*
set dlname=switch2uneek_ModMiiBundle.zip
set wadname=switch2uneek_ModMiiBundle.zip
set filename=switch2uneek(emulators)-4RealNand-v9-S2UK.wad
set md5=48659d37cd1f6a09bf8d544f93f456cc
set md5alt=%md5%
set category=fullextract
set path1=WAD\
::below is for building emu nand
if /i "%MENU1%" NEQ "S" goto:downloadstart
set filename=switch2uneek(emulators)-4EMUNand-v9-S2RL.wad
set md5=d9e5ec35e112549045f9144addf06af1
set md5alt=%md5%
set path1=\
goto:downloadstart


:HBF
set name=Homebrew Filter r32
set code1=ZIP
set code2="http://nusad.googlecode.com/files/Homebrew_Filter_r32.wad"
set version=*
set dlname=Homebrew_Filter_r32.wad
set wadname=Homebrew_Filter_r32.wad
set filename=Homebrew_Filter_r32.wad
set md5=7d8c086c156890b93c26956d54a71530
set md5alt=%md5%
set category=fullextract
if /i "%MENU1%" EQU "S" (set path1=\) else (set path1=WAD\)
goto:downloadstart


:F32
set name=FAT32 GUI Formatter
set category=fullextract
set code1=URL
set code2="http://www.ridgecrop.demon.co.uk/guiformat.exe"
set version=*
set dlname=guiformat.exe
set wadname=FAT32_GUI_Formatter.exe
set filename=FAT32_GUI_Formatter.exe
set md5=daf2d9aa422c3d065c6f4e8823644944
set path1=FAT32_GUI_Formatter\
goto:downloadstart


::TANTRIC APPS!!!!

:WIIMC
set name=WiiMC - Media Player (Most Recent Release)
set category=TANTRIC
set path1=apps\WiiMC\
set updateurl=http://wiimc.googlecode.com/svn/trunk/update.xml
set code1=http://wiimc.googlecode.com/files/WiiMC 
set code2= (New Install).zip
set zip1=WiiMC 
set zip2= (New Install).zip
::set version=*
goto:downloadstart

:fceugx
set name=FCEUGX - NES Emulator for the Wii (Most Recent Release)
set category=TANTRIC
set path1=apps\fceugx\
set updateurl=http://fceugc.googlecode.com/svn/trunk/update.xml
set code1=http://fceugc.googlecode.com/files/FCE Ultra GX 
set code2=.zip
set zip1=FCE Ultra GX 
set zip2=.zip
::set version=*
goto:downloadstart

:snes9xgx
set name=SNES9xGX - SNES Emulator for the Wii (Most Recent Release)
set category=TANTRIC
set path1=apps\snes9xgx\
set updateurl=http://snes9x-gx.googlecode.com/svn/trunk/update.xml
set code1=http://snes9x-gx.googlecode.com/files/Snes9x GX 
set code2=.zip
set zip1=Snes9x GX 
set zip2=.zip
::set version=*
goto:downloadstart

:vbagx
set name=Visual Boy Advance GX - GB/GBA Emulator for the Wii (Most Recent Release)
set category=TANTRIC
set path1=apps\vbagx\
set updateurl=http://vba-wii.googlecode.com/svn/trunk/update.xml
set code1=http://vba-wii.googlecode.com/files/Visual Boy Advance GX 
set code2=.zip
set zip1=Visual Boy Advance GX 
set zip2=.zip
::set version=*
goto:downloadstart


:SGM
set name=SaveGame Manager GX (Most Recent Release)
set category=GOOGLEUPDATE
set path1=apps\SaveGameManagerGX\
set updateurl="http://code.google.com/p/savegame-manager-gx/downloads/list?can=2&q=dol+-forwarder&colspec=Filename+Summary+Uploaded+Size+DownloadCount"
set updatedlname="list@can=2&q=dol+-forwarder&colspec=Filename+Summary+Uploaded+Size+DownloadCount"
set code1="http://savegame-manager-gx.googlecode.com/files/R"
set code2=.dol
set iconurl="http://savegame-manager-gx.googlecode.com/svn/trunk/HBC/icon.png"
set metaurl="http://savegame-manager-gx.googlecode.com/svn/trunk/HBC/meta.xml"
set wadname1=R
set wadname2=.dol
goto:downloadstart

:WIIX
set name=WiiXplorer (Most Recent Release)
set category=GOOGLEUPDATE
set path1=apps\WiiExplorer\
set updateurl="http://code.google.com/p/wiixplorer/downloads/list?can=3&q=dol&colspec=Filename+Summary+Uploaded+Size+DownloadCount+UploadedBy"
set updatedlname="list@can=3&q=dol&colspec=Filename+Summary+Uploaded+Size+DownloadCount+UploadedBy"
set code1="http://wiixplorer.googlecode.com/files/R"
set code2=.dol
set iconurl="http://wiixplorer.googlecode.com/svn/trunk/HBC/icon.png"
set metaurl="http://wiixplorer.googlecode.com/svn/trunk/HBC/meta.xml"
set wadname1=R
set wadname2=.dol
goto:downloadstart


:HBB
set name=Homebrew Browser v0.3.9c
set category=fullextract
set code1=URL
set code2="http://www.codemii.com/wiihomebrew/homebrew_browser_v0.3.9c.zip"
set version=*
set dlname="homebrew_browser_v0.3.9c.zip"
set wadname=homebrew_browser_v0.3.9c.zip
set filename=boot.dol
set md5=334a432365d4054bcf972c27c54b8eac
set path1=apps\homebrew_browser\
goto:downloadstart


:WII64
set name=Wii64 beta1.1 (N64 Emulator)
set category=fullextract
set code1=URL
set code2="http://mupen64gc.googlecode.com/files/wii64-beta1.1.zip"
set version=*
set dlname="wii64-beta1.1.zip"
set wadname=wii64-beta1.1.zip
set filename=boot.dol
set md5=630dbc8b8a5be6527b76d49b65c47f23
set path1=apps\wii64\
goto:downloadstart

:WIISX
set name=WiiSX beta2.1 (Playstation 1 Emulator)
set category=fullextract
set code1=URL
set code2="http://pcsxgc.googlecode.com/files/WiiSX-beta2.1.zip"
set version=*
set dlname="WiiSX-beta2.1.zip"
set wadname=WiiSX-beta2.1.zip
set filename=boot.dol
set md5=9c245a7bcfd7b2f99ac9f01712736d43
set path1=apps\wiiSX\
goto:downloadstart


:Priiloader
set name=Priiloader v0.7 (236 Mod)
set code1=URL
set code2="http://nusad.googlecode.com/files/Priiloader-v0.7-236.zip"
set version=*
set dlname=Priiloader-v0.7-236.zip
set wadname=Priiloader-v0.7-236.zip
set filename=boot.dol
set md5=09bf03164e884bdbbd013e4ff150dd7d
set path1=apps\Priiloader\
goto:downloadstart

:PriiHacks
set name=Priiloader Hacks
set code1=URL
set code2="http://nusad.googlecode.com/files/PriiloaderHacks.zip"
set version=ini
set dlname="PriiloaderHacks.zip"
set wadname=PriiloaderHacks.zip
set md5=adeb7f5f6758ed4f866bd180b2180ed2
set path1=
goto:downloadstart

:cMIOSrev5
set name=cMIOS rev5 Installer
set code1=URL
set code2="http://nusad.googlecode.com/files/cMIOS_rev5-Installer.zip"
set version=*
set dlname="cMIOS_rev5-Installer.zip"
set wadname=cMIOS_rev5-Installer.zip
set filename=boot.dol
set md5=1c436e8134d750299138a19a433a45a6
set path1=apps\cMIOS_rev5-Installer\
goto:downloadstart


:MIOSPatcher
set name=MIOS Patcher 0.2
set code1=URL
set code2="http://filetrip.net/d8368-MIOS-Patcher-0-2.html"
set version=*
set dlname=8368-MIOSPatcher.zip
set wadname=MIOSPatcher0.2.zip
set filename=boot.dol
set md5=f2e5b95e246528488a3556608ddae217
set path1=apps\MIOSPatcher\
goto:downloadstart



::---------------------cIOSs----------------------
:CIOSDATABASE

:cIOS222[38]-v4
set name=cIOS222[38]-v4
set wadname=cIOS222[38]-v4
set ciosslot=unchanged
set ciosversion=
set md5=ab4b09e0b330be2ae957fc6847bce687
set md5alt=%md5%
set basewad=IOS38-64-v3610
set md5base=7fa5aa3ee9fbb041b69a190928029b29
set md5basealt=f31080503997c1fc29c0760b8c0cc38b
set code1=00000001
set code2=00000026
set version=3610
set basecios=cIOS222[38]-v4
set diffpath=%basecios%
set code2new=000000de
set lastbasemodule=0000000e
set cIOSFamilyName=Hermes
set cIOSversionNum=4
goto:downloadstart




:cIOS223[37-38]-v4
set name=cIOS223[37-38]-v4
set wadname=cIOS223[37-38]-v4
set ciosslot=unchanged
set ciosversion=
set md5=606d03466c6faa398525f8ab9496ee68
set md5alt=%md5%
set basewad=IOS37-64-v3612
set md5base=8af99fa502a5035e77fc80835e91faaa
set md5basealt=e240510b257b6d28beeade967ca299e6
set code1=00000001
set code2=00000025
set version=3612
set basewadb=IOS38-64-v3610
set md5baseb=7fa5aa3ee9fbb041b69a190928029b29
set md5basebalt=f31080503997c1fc29c0760b8c0cc38b
set code1b=00000001
set code2b=00000026
set versionb=3610
set basecios=cIOS223[37-38]-v4
set diffpath=%basecios%
set code2new=000000df
set lastbasemodule=0000000e
set cIOSFamilyName=Hermes
set cIOSversionNum=4
goto:downloadstart



::HERMES V5 BASE 38
:cIOS222[38]-v5
set name=cIOS222[38]-v5
set wadname=cIOS222[38]-v5
set ciosslot=unchanged
set ciosversion=
set md5=77f1df39a24d312f988cecf4dd68e582
set md5alt=%md5%
set basewad=IOS38-64-v3867
set md5base=394298e4c9ff287e69020f2405423eb4
set md5basealt=a2f935cab6a864909325cf0e8fefc349
set code1=00000001
set code2=00000026
set version=3867
set basecios=cIOS222[38]-v5
set diffpath=%basecios%
set code2new=000000de
set lastbasemodule=0000000e
set cIOSFamilyName=Hermes
set cIOSversionNum=5
goto:downloadstart


::HERMES V5 BASE 37
:cIOS223[37]-v5
set name=cIOS223[37]-v5
set wadname=cIOS223[37]-v5
set ciosslot=unchanged
set ciosversion=
set md5=a2cf208d51cea80b82059937778c15b7
set md5alt=%md5%
set basewad=IOS37-64-v3869
set md5base=5f4295741efab0d919e491b7151d5ed3
set md5basealt=47b658053d224af86ce11aa71bea0112
set code1=00000001
set code2=00000025
set version=3869
set basecios=cIOS223[37]-v5
set diffpath=%basecios%
set code2new=000000df
set lastbasemodule=0000000e
set cIOSFamilyName=Hermes
set cIOSversionNum=5
goto:downloadstart


:cIOS224[37]-v5
set name=cIOS224[37]-v5
set wadname=cIOS224[37]-v5
set ciosslot=224
set ciosversion=65535
set md5=9d1dd2463dca45962050c3a48a818504
set md5alt=%md5%
set basewad=IOS37-64-v3869
set md5base=5f4295741efab0d919e491b7151d5ed3
set md5basealt=47b658053d224af86ce11aa71bea0112
set code1=00000001
set code2=00000025
set version=3869
set basecios=cIOS223[37]-v5
set diffpath=%basecios%
set code2new=000000df
set lastbasemodule=0000000e
set cIOSFamilyName=Hermes
set cIOSversionNum=5
goto:downloadstart


::HERMES V5 BASE 57

:cIOS224[57]-v5
set name=cIOS224[57]-v5
set wadname=cIOS224[57]-v5
set ciosslot=unchanged
set ciosversion=
set md5=ce67b890fd6dd804d75ae18093fc4235
set md5alt=%md5%
set basewad=IOS57-64-v5661
set md5base=ba50f0d46290d74d020f0afa58811e2e
set md5basealt=bca6176ccca817e722d73130a9e73258
set code1=00000001
set code2=00000039
set version=5661
set basecios=cIOS224[57]-v5
set diffpath=%basecios%
set code2new=000000e0
set lastbasemodule=00000012
set cIOSFamilyName=Hermes
set cIOSversionNum=5
goto:downloadstart


:cIOS202[57]-v5
set name=cIOS202[57]-v5
set wadname=cIOS202[57]-v5
set ciosslot=202
set ciosversion=65535
set md5=5e6335412f20b6c9028d5233de03cef9
set md5alt=%md5%
set basewad=IOS57-64-v5661
set md5base=ba50f0d46290d74d020f0afa58811e2e
set md5basealt=bca6176ccca817e722d73130a9e73258
set code1=00000001
set code2=00000039
set version=5661
set basecios=cIOS224[57]-v5
set diffpath=%basecios%
set code2new=000000e0
set lastbasemodule=00000012
set cIOSFamilyName=Hermes
set cIOSversionNum=5
goto:downloadstart


:cIOS223[57]-v5
set name=cIOS249-v14
set wadname=cIOS223[57]-v5
set ciosslot=223
set ciosversion=65535
set md5=5d34d3fc2cfc8baa89630267a701d0f8
set md5alt=%md5%
set basewad=IOS57-64-v5661
set md5base=ba50f0d46290d74d020f0afa58811e2e
set md5basealt=bca6176ccca817e722d73130a9e73258
set code1=00000001
set code2=00000039
set version=5661
set basecios=cIOS224[57]-v5
set diffpath=%basecios%
set code2new=000000e0
set lastbasemodule=00000012
set cIOSFamilyName=Hermes
set cIOSversionNum=5
goto:downloadstart


::WANIN'S V14 BASE 38

:cIOS249-v14
set name=cIOS249-v14
set wadname=cIOS249-v14
set ciosslot=unchanged
set ciosversion=
set md5=8cb5ff74ec37bb0b6992353097f10318
set md5alt=%md5%
set basewad=IOS38-64-v3610
set md5base=f31080503997c1fc29c0760b8c0cc38b
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=3610
set basecios=cIOS249-v14
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=14
goto:downloadstart

:cIOS250-v14
set name=cIOS250-v14
set wadname=cIOS250-v14
set ciosslot=250
set ciosversion=65535
set md5=bf53a319daf796c7b0467194911ba33e
set md5alt=%md5%
set basewad=IOS38-64-v3610
set md5base=f31080503997c1fc29c0760b8c0cc38b
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=3610
set basecios=cIOS249-v14
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=14
goto:downloadstart


::WANIN'S V17B BASE 38

:cIOS249-v17b
set name=cIOS249-v17b
set wadname=cIOS249-v17b
set ciosslot=unchanged
set ciosversion=
set md5=dff98dfa945112aecfda31ad3900dc75
set md5alt=%md5%
set basewad=IOS38-64-v3867
set md5base=394298e4c9ff287e69020f2405423eb4
set md5basealt=a2f935cab6a864909325cf0e8fefc349
set code1=00000001
set code2=00000026
set version=3867
set basecios=cIOS249-v17b
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=17
goto:downloadstart


:cIOS250-v17b
set name=cIOS250-v17b
set wadname=cIOS250-v17b
set ciosslot=250
set ciosversion=65535
set md5=8d8a6655bf221be8897c30aa52b1c2ac
set md5alt=%md5%
set basewad=IOS38-64-v3867
set md5base=394298e4c9ff287e69020f2405423eb4
set md5basealt=a2f935cab6a864909325cf0e8fefc349
set code1=00000001
set code2=00000026
set version=3867
set basecios=cIOS249-v17b
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=17
goto:downloadstart



::WANIN'S V19 BASE 37
:cIOS249[37]-v19
set name=cIOS249[37]-v19
set wadname=cIOS249[37]-v19
set ciosslot=unchanged
set ciosversion=
set md5=b98ac3559567497cae3e0af28749bc64
set md5alt=%md5%
set basewad=IOS37-64-v3869
set md5base=5f4295741efab0d919e491b7151d5ed3
set md5basealt=47b658053d224af86ce11aa71bea0112
set code1=00000001
set code2=00000025
set version=3869
set basecios=cIOS249[37]-v19
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=19
goto:downloadstart


:cIOS250[37]-v19
set name=cIOS250[37]-v19
set wadname=cIOS250[37]-v19
set ciosslot=250
set ciosversion=65535
set md5=d203532a55358f40d2607d5435dc1574
set md5alt=%md5%
set basewad=IOS37-64-v3869
set md5base=5f4295741efab0d919e491b7151d5ed3
set md5basealt=47b658053d224af86ce11aa71bea0112
set code1=00000001
set code2=00000025
set version=3869
set basecios=cIOS249[37]-v19
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=19
goto:downloadstart



::WANIN'S V19 BASE 38
:cIOS249[38]-v19
set name=cIOS249[38]-v19
set wadname=cIOS249[38]-v19
set ciosslot=unchanged
set ciosversion=
set md5=9ba15ac66b321827e21026fa6cd1b04f
set md5alt=%md5%
set basewad=IOS38-64-v3867
set md5base=394298e4c9ff287e69020f2405423eb4
set md5basealt=a2f935cab6a864909325cf0e8fefc349
set code1=00000001
set code2=00000026
set version=3867
set basecios=cIOS249[38]-v19
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=19
goto:downloadstart


:cIOS250[38]-v19
set name=cIOS250[38]-v19
set wadname=cIOS250[38]-v19
set ciosslot=250
set ciosversion=65535
set md5=c216987bad6bac699af0ae6c6c7d5738
set md5alt=%md5%
set basewad=IOS38-64-v3867
set md5base=394298e4c9ff287e69020f2405423eb4
set md5basealt=a2f935cab6a864909325cf0e8fefc349
set code1=00000001
set code2=00000026
set version=3867
set basecios=cIOS249[38]-v19
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=19
goto:downloadstart


::WANIN'S V19 BASE 57
:cIOS249[57]-v19
set name=cIOS249[57]-v19
set wadname=cIOS249[57]-v19
set ciosslot=unchanged
set ciosversion=
set md5=5b756d6cc3ca20736bff8d925a9dd877
set md5alt=%md5%
set basewad=IOS57-64-v5661
set md5base=ba50f0d46290d74d020f0afa58811e2e
set md5basealt=bca6176ccca817e722d73130a9e73258
set basecios=cIOS249[57]-v19
set diffpath=%basecios%
set code1=00000001
set code2=00000039
set version=5661
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=Waninkoko
set cIOSversionNum=19
goto:downloadstart


:cIOS250[57]-v19
set name=cIOS250[57]-v19
set wadname=cIOS250[57]-v19
set ciosslot=250
set ciosversion=65535
set md5=1755e220b994e45120ea905289c97724
set md5alt=%md5%
set basewad=IOS57-64-v5661
set md5base=ba50f0d46290d74d020f0afa58811e2e
set md5basealt=bca6176ccca817e722d73130a9e73258
set basecios=cIOS249[57]-v19
set diffpath=%basecios%
set code1=00000001
set code2=00000039
set version=5661
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=Waninkoko
set cIOSversionNum=19
goto:downloadstart



::WANIN'S V20 BASE 38
:cIOS249[38]-v20
set name=cIOS249[38]-v20
set wadname=cIOS249[38]-v20
set ciosslot=unchanged
set ciosversion=
set md5=74b2f313224fd9ba7dec16eecea21949
set md5alt=%md5%
set basewad=IOS38-64-v4123
set md5base=fb3db1afa0685a5778cd83b148f74723
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-v20
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=20
goto:downloadstart

:cIOS250[38]-v20
set name=cIOS250[38]-v20
set wadname=cIOS250[38]-v20
set ciosslot=250
set ciosversion=65535
set md5=7a629c9288c2b89904956a2f7e07a7d0
set md5alt=%md5%
set basewad=IOS38-64-v4123
set md5base=fb3db1afa0685a5778cd83b148f74723
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-v20
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=20
goto:downloadstart


::WANIN'S V20 BASE 56
:cIOS249[56]-v20
set name=cIOS249[56]-v20
set wadname=cIOS249[56]-v20
set ciosslot=unchanged
set ciosversion=
set md5=973742ce57938744afbbe689b415da6a
set md5alt=%md5%
set basewad=IOS56-64-v5661
set md5base=726d464aa08fee191e76119ab0e0dc00
set md5basealt=%md5base%
set code1=00000001
set code2=00000038
set version=5661
set basecios=cIOS249[56]-v20
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=20
goto:downloadstart

:cIOS250[56]-v20
set name=cIOS250[56]-v20
set wadname=cIOS250[56]-v20
set ciosslot=250
set ciosversion=65535
set md5=6e8422260eb3740be64303354f37a780
set md5alt=%md5%
set basewad=IOS56-64-v5661
set md5base=726d464aa08fee191e76119ab0e0dc00
set md5basealt=%md5base%
set code1=00000001
set code2=00000038
set version=5661
set basecios=cIOS249[56]-v20
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=20
goto:downloadstart


::WANIN'S V20 BASE 57
:cIOS249[57]-v20
set name=cIOS249[57]-v20
set wadname=cIOS249[57]-v20
set ciosslot=unchanged
set ciosversion=
set md5=a1a157985cc99047712b018bd3059ef8
set md5alt=%md5%
set basewad=IOS57-64-v5918
set md5base=85e8101949d48a646448bde93640cdef
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5918
set basecios=cIOS249[57]-v20
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=Waninkoko
set cIOSversionNum=20
goto:downloadstart

:cIOS250[57]-v20
set name=cIOS250[57]-v20
set wadname=cIOS250[57]-v20
set ciosslot=250
set ciosversion=65535
set md5=128f04cca48c2bc3a2e60d7f34ce16fa
set md5alt=%md5%
set basewad=IOS57-64-v5918
set md5base=85e8101949d48a646448bde93640cdef
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5918
set basecios=cIOS249[57]-v20
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=Waninkoko
set cIOSversionNum=20
goto:downloadstart



::WANIN'S V21 BASE 37
:cIOS249[37]-v21
set name=cIOS249[37]-v21
set wadname=cIOS249[37]-v21
set ciosslot=unchanged
set ciosversion=
set md5=be4300b989dd53d71fcf5b8dbb940be8
set md5alt=%md5%
set basewad=IOS37-64-v5662
set md5base=bdeb8d02ba1f3de7b430fbe12560a3eb
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=5662
set basecios=cIOS249[37]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart

:cIOS250[37]-v21
set name=cIOS250[37]-v21
set wadname=cIOS250[37]-v21
set ciosslot=250
set ciosversion=65535
set md5=15bd9700e2025a2892ea9a8bc2e88b8b
set md5alt=%md5%
set basewad=IOS37-64-v5662
set md5base=bdeb8d02ba1f3de7b430fbe12560a3eb
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=5662
set basecios=cIOS249[37]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart


::WANIN'S V21 BASE 38
:cIOS249[38]-v21
set name=cIOS249[38]-v21
set wadname=cIOS249[38]-v21
set ciosslot=unchanged
set ciosversion=
set md5=219450b423a81517ba1d79c09947a36a
set md5alt=%md5%
set basewad=IOS38-64-v4123
set md5base=fb3db1afa0685a5778cd83b148f74723
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart

:cIOS250[38]-v21
set name=cIOS250[38]-v21
set wadname=cIOS250[38]-v21
set ciosslot=250
set ciosversion=65535
set md5=cda6cdb6bd7f9419656fed1307f80e06
set md5alt=%md5%
set basewad=IOS38-64-v4123
set md5base=fb3db1afa0685a5778cd83b148f74723
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart


::WANIN'S V21 BASE 53
:cIOS249[53]-v21
set name=cIOS249[53]-v21
set wadname=cIOS249[53]-v21
set ciosslot=unchanged
set ciosversion=
set md5=93057dccaef92e008d85ee71e55ec901
set md5alt=%md5%
set basewad=IOS53-64-v5662
set md5base=ce7a5174a863488655f9c97b59e1b380
set md5basealt=%md5base%
set code1=00000001
set code2=00000035
set version=5662
set basecios=cIOS249[53]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart

:cIOS250[53]-v21
set name=cIOS250[53]-v21
set wadname=cIOS250[53]-v21
set ciosslot=250
set ciosversion=65535
set md5=90d4ae05fdfa8165829cae2701ff0ff4
set md5alt=%md5%
set basewad=IOS53-64-v5662
set md5base=ce7a5174a863488655f9c97b59e1b380
set md5basealt=%md5base%
set code1=00000001
set code2=00000035
set version=5662
set basecios=cIOS249[53]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart


::WANIN'S V21 BASE 55
:cIOS249[55]-v21
set name=cIOS249[55]-v21
set wadname=cIOS249[55]-v21
set ciosslot=unchanged
set ciosversion=
set md5=d4a3b454438199973a1f405ce0deaed9
set md5alt=%md5%
set basewad=IOS55-64-v5662
set md5base=cf19171ee90455917e5da3ca56c52612
set md5basealt=%md5base%
set code1=00000001
set code2=00000037
set version=5662
set basecios=cIOS249[55]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart

:cIOS250[55]-v21
set name=cIOS250[55]-v21
set wadname=cIOS250[55]-v21
set ciosslot=250
set ciosversion=65535
set md5=439f8b48374ad4e43a9217edafec7952
set md5alt=%md5%
set basewad=IOS55-64-v5662
set md5base=cf19171ee90455917e5da3ca56c52612
set md5basealt=%md5base%
set code1=00000001
set code2=00000037
set version=5662
set basecios=cIOS249[55]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart


::WANIN'S V21 BASE 56
:cIOS249[56]-v21
set name=cIOS249[56]-v21
set wadname=cIOS249[56]-v21
set ciosslot=unchanged
set ciosversion=
set md5=ed58b6e48f5c83f25d2fb63393066af7
set md5alt=%md5%
set basewad=IOS56-64-v5661
set md5base=726d464aa08fee191e76119ab0e0dc00
set md5basealt=%md5base%
set code1=00000001
set code2=00000038
set version=5661
set basecios=cIOS249[56]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart

:cIOS250[56]-v21
set name=cIOS250[56]-v21
set wadname=cIOS250[56]-v21
set ciosslot=250
set ciosversion=65535
set md5=8ea19a6026eabe99b2b38c854fe73b18
set md5alt=%md5%
set basewad=IOS56-64-v5661
set md5base=726d464aa08fee191e76119ab0e0dc00
set md5basealt=%md5base%
set code1=00000001
set code2=00000038
set version=5661
set basecios=cIOS249[56]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=0000000e
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart

::WANIN'S V21 BASE 57
:cIOS249[57]-v21
set name=cIOS249[57]-v21
set wadname=cIOS249[57]-v21
set ciosslot=unchanged
set ciosversion=
set md5=ff4a32a702a435990b3d4b155112fce6
set md5alt=%md5%
set basewad=IOS57-64-v5918
set md5base=85e8101949d48a646448bde93640cdef
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5918
set basecios=cIOS249[57]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart

:cIOS250[57]-v21
set name=cIOS250[57]-v21
set wadname=cIOS250[57]-v21
set ciosslot=250
set ciosversion=65535
set md5=454a1892e7872534a5fdbedcf075aaee
set md5alt=%md5%
set basewad=IOS57-64-v5918
set md5base=85e8101949d48a646448bde93640cdef
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5918
set basecios=cIOS249[57]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart


::WANIN'S V21 BASE 58
:cIOS249[58]-v21
set name=cIOS249[58]-v21
set wadname=cIOS249[58]-v21
set ciosslot=unchanged
set ciosversion=
set md5=a05755c95e4452a0ed120d9b8de4faba
set md5alt=%md5%
set basewad=IOS58-64-v6175
set md5base=791907a4993bf018cb52bf8f963cff92
set md5basealt=%md5base%
set code1=00000001
set code2=0000003a
set version=6175
set basecios=cIOS249[58]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart

:cIOS250[58]-v21
set name=cIOS250[58]-v21
set wadname=cIOS250[58]-v21
set ciosslot=250
set ciosversion=65535
set md5=68aa669b178f2207c56d41e13acce969
set md5alt=%md5%
set basewad=IOS58-64-v6175
set md5base=791907a4993bf018cb52bf8f963cff92
set md5basealt=%md5base%
set code1=00000001
set code2=0000003a
set version=6175
set basecios=cIOS249[58]-v21
set diffpath=%basecios%
set code2new=000000f9
set lastbasemodule=00000012
set cIOSFamilyName=Waninkoko
set cIOSversionNum=21
goto:downloadstart


::d2x cIOSs

:cIOS249[37]-d2x-v6
set name=cIOS249[37]-d2x-v6
set wadname=cIOS249[37]-d2x-v6
set ciosslot=249
set ciosversion=21006
set md5=361246714da27f1bbb6391e35c995029
set md5alt=%md5%
set basewad=IOS37-64-v5662
set md5base=bdeb8d02ba1f3de7b430fbe12560a3eb
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=5662
set basecios=cIOS249[37]-d2x-v6
set diffpath=cIOS249[37]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart

:cIOS250[37]-d2x-v6
set name=cIOS250[37]-d2x-v6
set wadname=cIOS250[37]-d2x-v6
set ciosslot=250
set ciosversion=21006
set md5=0a9b027a90eba2dc86d5c0e33a1aece2
set md5alt=%md5%
set basewad=IOS37-64-v5662
set md5base=bdeb8d02ba1f3de7b430fbe12560a3eb
set md5basealt=%md5base%
set code1=00000001
set code2=00000025
set version=5662
set basecios=cIOS249[37]-d2x-v6
set diffpath=cIOS249[37]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart

:cIOS249[38]-d2x-v6
set name=cIOS249[38]-d2x-v6
set wadname=cIOS249[38]-d2x-v6
set ciosslot=249
set ciosversion=21006
set md5=39c6a822aecbdd42f37eba46955fd5f8
set md5alt=%md5%
set basewad=IOS38-64-v4123
set md5base=fb3db1afa0685a5778cd83b148f74723
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-d2x-v6
set diffpath=cIOS249[38]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart

:cIOS250[38]-d2x-v6
set name=cIOS250[38]-d2x-v6
set wadname=cIOS250[38]-d2x-v6
set ciosslot=250
set ciosversion=21006
set md5=c632be53565980b5982ef55c780ab7a9
set md5alt=%md5%
set basewad=IOS38-64-v4123
set md5base=fb3db1afa0685a5778cd83b148f74723
set md5basealt=%md5base%
set code1=00000001
set code2=00000026
set version=4123
set basecios=cIOS249[38]-d2x-v6
set diffpath=cIOS249[38]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart


:cIOS249[53]-d2x-v6
set name=cIOS249[53]-d2x-v6
set wadname=cIOS249[53]-d2x-v6
set ciosslot=249
set ciosversion=21006
set md5=e52cd78f388e15bfb69317522fb75567
set md5alt=%md5%
set basewad=IOS53-64-v5662
set md5base=ce7a5174a863488655f9c97b59e1b380
set md5basealt=%md5base%
set code1=00000001
set code2=00000035
set version=5662
set basecios=cIOS249[53]-d2x-v6
set diffpath=cIOS249[53]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart

:cIOS250[53]-d2x-v6
set name=cIOS250[53]-d2x-v6
set wadname=cIOS250[53]-d2x-v6
set ciosslot=250
set ciosversion=21006
set md5=9656c574699627621d6f417d764653ed
set md5alt=%md5%
set basewad=IOS53-64-v5662
set md5base=ce7a5174a863488655f9c97b59e1b380
set md5basealt=%md5base%
set code1=00000001
set code2=00000035
set version=5662
set basecios=cIOS249[53]-d2x-v6
set diffpath=cIOS249[53]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart


:cIOS249[55]-d2x-v6
set name=cIOS249[55]-d2x-v6
set wadname=cIOS249[55]-d2x-v6
set ciosslot=249
set ciosversion=21006
set md5=21d390182195f13d968d9d3a4ee7be39
set md5alt=%md5%
set basewad=IOS55-64-v5662
set md5base=cf19171ee90455917e5da3ca56c52612
set md5basealt=%md5base%
set code1=00000001
set code2=00000037
set version=5662
set basecios=cIOS249[55]-d2x-v6
set diffpath=cIOS249[55]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart

:cIOS250[55]-d2x-v6
set name=cIOS250[55]-d2x-v6
set wadname=cIOS250[55]-d2x-v6
set ciosslot=250
set ciosversion=21006
set md5=3f4e5dd97a398228d03a3af7510809b5
set md5alt=%md5%
set basewad=IOS55-64-v5662
set md5base=cf19171ee90455917e5da3ca56c52612
set md5basealt=%md5base%
set code1=00000001
set code2=00000037
set version=5662
set basecios=cIOS249[55]-d2x-v6
set diffpath=cIOS249[55]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart


:cIOS249[56]-d2x-v6
set name=cIOS249[56]-d2x-v6
set wadname=cIOS249[56]-d2x-v6
set ciosslot=249
set ciosversion=21006
set md5=e1c1da04f7a41d76d4c6a93a0b03d020
set md5alt=%md5%
set basewad=IOS56-64-v5661
set md5base=726d464aa08fee191e76119ab0e0dc00
set md5basealt=%md5base%
set code1=00000001
set code2=00000038
set version=5661
set basecios=cIOS249[56]-d2x-v6
set diffpath=cIOS249[56]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart

:cIOS250[56]-d2x-v6
set name=cIOS250[56]-d2x-v6
set wadname=cIOS250[56]-d2x-v6
set ciosslot=250
set ciosversion=21006
set md5=4dea4c20ad8a8ae157afd6e997a73762
set md5alt=%md5%
set basewad=IOS56-64-v5661
set md5base=726d464aa08fee191e76119ab0e0dc00
set md5basealt=%md5base%
set code1=00000001
set code2=00000038
set version=5661
set basecios=cIOS249[56]-d2x-v6
set diffpath=cIOS249[56]-v21
set code2new=000000f9
set lastbasemodule=0000000e
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart

:cIOS249[57]-d2x-v6
set name=cIOS249[57]-d2x-v6
set wadname=cIOS249[57]-d2x-v6
set ciosslot=249
set ciosversion=21006
set md5=4e339d01fdaf3a1e66c4420547e7b3b9
set md5alt=%md5%
set basewad=IOS57-64-v5918
set md5base=85e8101949d48a646448bde93640cdef
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5918
set basecios=cIOS249[57]-d2x-v6
set diffpath=cIOS249[57]-v21
set code2new=000000f9
set lastbasemodule=00000012
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart

:cIOS250[57]-d2x-v6
set name=cIOS250[57]-d2x-v6
set wadname=cIOS250[57]-d2x-v6
set ciosslot=250
set ciosversion=21006
set md5=505a0141bc37fc50517ddcf73c5ae332
set md5alt=%md5%
set basewad=IOS57-64-v5918
set md5base=85e8101949d48a646448bde93640cdef
set md5basealt=%md5base%
set code1=00000001
set code2=00000039
set version=5918
set basecios=cIOS249[57]-d2x-v6
set diffpath=cIOS249[57]-v21
set code2new=000000f9
set lastbasemodule=00000012
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart


:cIOS249[58]-d2x-v6
set name=cIOS249[58]-d2x-v6
set wadname=cIOS249[58]-d2x-v6
set ciosslot=249
set ciosversion=21006
set md5=00b209f95e36652bc30c8bd7870032aa
set md5alt=%md5%
set basewad=IOS58-64-v6175
set md5base=791907a4993bf018cb52bf8f963cff92
set md5basealt=%md5base%
set code1=00000001
set code2=0000003a
set version=6175
set basecios=cIOS249[58]-d2x-v6
set diffpath=cIOS249[58]-v21
set code2new=000000f9
set lastbasemodule=00000012
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart

:cIOS250[58]-d2x-v6
set name=cIOS250[58]-d2x-v6
set wadname=cIOS250[58]-d2x-v6
set ciosslot=250
set ciosversion=21006
set md5=a2a62c75d23d0b7f2823b34205cf4694
set md5alt=%md5%
set basewad=IOS58-64-v6175
set md5base=791907a4993bf018cb52bf8f963cff92
set md5basealt=%md5base%
set code1=00000001
set code2=0000003a
set version=6175
set basecios=cIOS249[58]-d2x-v6
set diffpath=cIOS249[58]-v21
set code2new=000000f9
set lastbasemodule=00000012
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat
goto:downloadstart


::------------------CMIOSs--------------------

:RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2
set name=WiiGator+WiiPower cMIOS-v65535(v10)
set wadname=RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2
set ciosslot=unchanged
set ciosversion=
set md5=d04d8743f86df8699f872304493f6b3a
set basewad=RVL-mios-v10
set md5base=851c27dae82bc1c758be07fa964d17cb
set code1=00000001
set code2=00000101
set version=10
set basecios=RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2
set diffpath=%basecios%
set code2new=00000101
goto:downloadstart


:RVL-cmios-v4_WiiGator_GCBL_v0.2
set name=cMIOS-v4 WiiGator GCBL v0.2
set wadname=RVL-cmios-v4_WiiGator_GCBL_v0.2
set ciosslot=unchanged
set ciosversion=
set md5=3ea68908f6fdea52de2a2a2561074660
set basewad=RVL-mios-v4
set md5base=60502dbd092d941cf627ac6db95a35cf
set code1=00000001
set code2=00000101
set version=4
set basecios=RVL-cmios-v4_WiiGator_GCBL_v0.2
set diffpath=%basecios%
set code2new=00000101
goto:downloadstart

:RVL-cmios-v4_Waninkoko_rev5
set name=cMIOS-v4 Waninkoko rev5
set wadname=RVL-cmios-v4_Waninkoko_rev5
set ciosslot=unchanged
set ciosversion=
set md5=c392d59f10fbd9f3f3f2ad405c43464a
set basewad=RVL-mios-v4
set md5base=60502dbd092d941cf627ac6db95a35cf
set code1=00000001
set code2=00000101
set version=4
set basecios=RVL-cmios-v4_Waninkoko_rev5
set diffpath=%basecios%
set code2new=00000101
goto:downloadstart


::-----------THEMES-------------

:DarkWii_Red_4.1U
set name=DarkWii Red Theme (4.1U)
set wadname=DarkWii_Red_4.1U
set md5=6ca906e74de1193f68b2d72728260823
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.1U.diff
set md5diff=df64c985b671feed318ac43b0682f22c
::000000**.app
set version=7b
set md5base=6b939de8222800733f4c44ae4eadb325
set category=themes
goto:downloadstart

:DarkWii_Red_4.2U
set name=DarkWii Red Theme (4.2U)
set wadname=DarkWii_Red_4.2U
set md5=751ccd3d7717342ba93dedd294e2c4aa
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.2U.diff
set md5diff=173e1e45e565afe6a9c17e45b3868fe1
::000000**.app
set version=87
set md5base=7079948c6aed8aae6009e4fdf27c7171
set category=themes
goto:downloadstart

:DarkWii_Red_4.3U
set name=DarkWii Red Theme (4.3U)
set wadname=DarkWii_Red_4.3U
set md5=d933cea8cb9e5972957cdc09aa42d0f3
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.3U.diff
set md5diff=274ffdb972cd155b3daeac9ddf34f8e5
::000000**.app
set version=97
set md5base=f388c9b11543ac2fe0912ab96064ee37
set category=themes
goto:downloadstart

:DarkWii_Red_4.1E
set name=DarkWii Red Theme (4.1E)
set wadname=DarkWii_Red_4.1E
set md5=765092c6de793b0a805560eaab9bd158
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.1E.diff
set md5diff=46e72e15acad77bdc6c4dc01288f0a41
::000000**.app
set version=7e
set md5base=574a3a144971ea0ec61bf8cef8d7ff80
set category=themes
goto:downloadstart

:DarkWii_Red_4.2E
set name=DarkWii Red Theme (4.2E)
set wadname=DarkWii_Red_4.2E
set md5=4815c962ff51b88353aa7127be1b8903
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.2E.diff
set md5diff=e9d46b2827275468d481cf9815775fa1
::000000**.app
set version=8a
set md5base=7e7994f78941afb51e9a20085deac305
set category=themes
goto:downloadstart

:DarkWii_Red_4.3E
set name=DarkWii Red Theme (4.3E)
set wadname=DarkWii_Red_4.3E
set md5=bc27fa6ff7804166af911cf0194fac9a
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.3E.diff
set md5diff=4a035087fbaf1d3e2f799cfbef8d5991
::000000**.app
set version=9a
set md5base=41310f79497c56850c37676074ee1237
set category=themes
goto:downloadstart

:DarkWii_Red_4.1J
set name=DarkWii Red Theme (4.1J)
set wadname=DarkWii_Red_4.1J
set md5=c6eb9dfd8a0279be749a3423ba73cc34
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.1J.diff
set md5diff=19bedd0cc5a75f9ac2b1d2c41e7aeb9c
::000000**.app
set version=78
set md5base=f2eadf12d18e793373060222b870057d
set category=themes
goto:downloadstart

:DarkWii_Red_4.2J
set name=DarkWii Red Theme (4.2J)
set wadname=DarkWii_Red_4.2J
set md5=f3dc6d6e1f436a6bb844dddbccc1f713
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.2J.diff
set md5diff=96f3db9373569a56473ae4af2597d861
::000000**.app
set version=84
set md5base=b08998e582c48afba3a14f6d9e1e9373
set category=themes
goto:downloadstart

:DarkWii_Red_4.3J
set name=DarkWii Red Theme (4.3J)
set wadname=DarkWii_Red_4.3J
set md5=e7432f52fab22cb614b2f2b567c5e2b0
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.3J.diff
set md5diff=49efc630c29dc55f27fd41b99894c5a8
::000000**.app
set version=94
set md5base=5b3ee6942a3cda716badbce3665076fc
set category=themes
goto:downloadstart

:DarkWii_Red_4.1K
set name=DarkWii Red Theme (4.1K)
set wadname=DarkWii_Red_4.1K
set md5=fb57a8c12ab39c60543851f85d6cc6ee
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.1K.diff
set md5diff=d8ed160c71d37b4df9de3b27383f314f
::000000**.app
set version=81
set md5base=7eedbf1a146b29b63edbb55e04f81f98
set category=themes
goto:downloadstart

:DarkWii_Red_4.2K
set name=DarkWii Red Theme (4.2K)
set wadname=DarkWii_Red_4.2K
set md5=8fcda05d8b4f7f969a6495e19b632145
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.2K.diff
set md5diff=7d665e22dbc159c77f61b61c5bbfbd25
::000000**.app
set version=8d
set md5base=9d72a1966370e44cb4c456c17a077bec
set category=themes
goto:downloadstart

:DarkWii_Red_4.3K
set name=DarkWii Red Theme (4.3K)
set wadname=DarkWii_Red_4.3K
set md5=d47d6eaf291b3a635e9327ebec0c6b44
set codeURL=http://nusad.googlecode.com/files/DarkWii_Red_4.3K.diff
set md5diff=4c7261b30924fa7b8f4b5f2006f96353
::000000**.app
set version=9d
set md5base=e6f2b0d4d5e0c095895f186009bf9516
set category=themes
goto:downloadstart


:DarkWii_Green_4.1U
set name=DarkWii Green Theme (4.1U)
set wadname=DarkWii_Green_4.1U
set md5=33d8bf19c41790301738bd66ef3bb679
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.1U.diff
set md5diff=8d6dfa9e46848f8dac44447117609b50
::000000**.app
set version=7b
set md5base=6b939de8222800733f4c44ae4eadb325
set category=themes
goto:downloadstart

:DarkWii_Green_4.2U
set name=DarkWii Green Theme (4.2U)
set wadname=DarkWii_Green_4.2U
set md5=a17a40c9b2609f43c246c2a2c428bf26
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.2U.diff
set md5diff=c84433f008a5d8ca513b88fe158a58ef
::000000**.app
set version=87
set md5base=7079948c6aed8aae6009e4fdf27c7171
set category=themes
goto:downloadstart

:DarkWii_Green_4.3U
set name=DarkWii Green Theme (4.3U)
set wadname=DarkWii_Green_4.3U
set md5=5a7c2f5b464360f5e44603c169bd3502
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.3U.diff
set md5diff=950dc449c9078c66bce6dd3c12cf1880
::000000**.app
set version=97
set md5base=f388c9b11543ac2fe0912ab96064ee37
set category=themes
goto:downloadstart

:DarkWii_Green_4.1E
set name=DarkWii Green Theme (4.1E)
set wadname=DarkWii_Green_4.1E
set md5=200a1be322fba14b3e143f7becae28fa
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.1E.diff
set md5diff=b582b9c5a802c12b21d1c82164bbb6fc
::000000**.app
set version=7e
set md5base=574a3a144971ea0ec61bf8cef8d7ff80
set category=themes
goto:downloadstart

:DarkWii_Green_4.2E
set name=DarkWii Green Theme (4.2E)
set wadname=DarkWii_Green_4.2E
set md5=d1ae62a181a8f08ce95fe0051703236a
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.2E.diff
set md5diff=b2cc705de7c52afdcd78c404e3aeeb35
::000000**.app
set version=8a
set md5base=7e7994f78941afb51e9a20085deac305
set category=themes
goto:downloadstart

:DarkWii_Green_4.3E
set name=DarkWii Green Theme (4.3E)
set wadname=DarkWii_Green_4.3E
set md5=a26673a0d7eb4efa26cf2ea6f172d2a4
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.3E.diff
set md5diff=193c533783936d1e846181aafdc5c86c
::000000**.app
set version=9a
set md5base=41310f79497c56850c37676074ee1237
set category=themes
goto:downloadstart

:DarkWii_Green_4.1J
set name=DarkWii Green Theme (4.1J)
set wadname=DarkWii_Green_4.1J
set md5=fddea93a6f9da9c9260a8c0eb9a26615
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.1J.diff
set md5diff=15ae33a7be1f43dece97493a2d20557f
::000000**.app
set version=78
set md5base=f2eadf12d18e793373060222b870057d
set category=themes
goto:downloadstart

:DarkWii_Green_4.2J
set name=DarkWii Green Theme (4.2J)
set wadname=DarkWii_Green_4.2J
set md5=0d8813b6a9d263677f04e657d5acf81d
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.2J.diff
set md5diff=3bc7f831ebe77fa02728bed66e31546f
::000000**.app
set version=84
set md5base=b08998e582c48afba3a14f6d9e1e9373
set category=themes
goto:downloadstart

:DarkWii_Green_4.3J
set name=DarkWii Green Theme (4.3J)
set wadname=DarkWii_Green_4.3J
set md5=e98c914c06a1fb116ad6dc738ccc577f
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.3J.diff
set md5diff=5079f0b903bbcab6f5ba07b22b728bb4
::000000**.app
set version=94
set md5base=5b3ee6942a3cda716badbce3665076fc
set category=themes
goto:downloadstart

:DarkWii_Green_4.1K
set name=DarkWii Green Theme (4.1K)
set wadname=DarkWii_Green_4.1K
set md5=dc072b23ca104eedb2fd46deafbd4f1e
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.1K.diff
set md5diff=3033ea57ce850735278b5ce5a1a570c4
::000000**.app
set version=81
set md5base=7eedbf1a146b29b63edbb55e04f81f98
set category=themes
goto:downloadstart

:DarkWii_Green_4.2K
set name=DarkWii Green Theme (4.2K)
set wadname=DarkWii_Green_4.2K
set md5=e6d03a45c9dac9aeeb670ddd487e2d38
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.2K.diff
set md5diff=3056493d9b3104016b150b6933e5eeca
::000000**.app
set version=8d
set md5base=9d72a1966370e44cb4c456c17a077bec
set category=themes
goto:downloadstart

:DarkWii_Green_4.3K
set name=DarkWii Green Theme (4.3K)
set wadname=DarkWii_Green_4.3K
set md5=d1cc289d1b9f444ae9258b98a2050a8e
set codeURL=http://nusad.googlecode.com/files/DarkWii_Green_4.3K.diff
set md5diff=b0cd220c1b5a883d3f31c0d48b14a896
::000000**.app
set version=9d
set md5base=e6f2b0d4d5e0c095895f186009bf9516
set category=themes
goto:downloadstart

::--------------------------------------Custom Guide (for DL Wizard only)-------------------------------------

:guide
set installwads=

if /i "%MENU1%" EQU "U" goto:USBguide
if /i "%MENU1%" EQU "H" goto:HMguide

:guidestart
set guidename=ModMiiGuide.txt

SET COUNT7=1
cls
if /i "%SETTINGS%" EQU "G" echo Generating Guide, please wait.
if /i "%SETTINGS%" NEQ "G" echo Generating Guide, please wait, your downloads will begin shortly.

if not exist "%DRIVE%" mkdir "%DRIVE%" >nul
if not exist "%Drive%"\%guidename% goto:norename
SET /a COUNT6=%COUNT6%+1
if exist "%DRIVE%"\ModMiiGuide%COUNT6%.txt goto:guide
move "%Drive%"\%guidename% "%DRIVE%"\ModMiiGuide%count6%.txt >nul
:norename



echo ModMii %currentversion% Custom Guide>"%Drive%"\%guidename%
echo Generated on %DATE% - %TIME%>>"%Drive%"\%guidename%
echo Check for updates at tinyurl.com/ModMiiNow>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo This Guide was generated using the following parameters:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
if /i "%VIRGIN%" EQU "Y" echo                * Wii is currently a virgin (un-modified)>>"%Drive%"\%guidename%
if /i "%VIRGIN%" EQU "N" echo                * Wii is already modified>>"%Drive%"\%guidename%

if /i "%REGION%" EQU "K" goto:Koreansetting
if /i "%REGION%" EQU "RC" goto:RCSTATUS
if /i "%FIRMSTART%" NEQ "o" echo                * Current firmware is %FIRMSTART%%REGION%>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo                * Current firmware is less than 2.2%REGION%>>"%Drive%"\%guidename%
goto:skipKoreansetting

:RCSTATUS
if /i "%FIRMSTART%" NEQ "o" echo                * Wii is Korean but has previously been region changed to %FIRMSTART%%REGIONCHANGE%>>"%DRIVE%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo                * Wii is Korean but has previously been region changed to %REGIONCHANGE%>>"%DRIVE%"\%guidename%
echo                * Desired firmware is %FIRM%%REGIONCHANGE%>>"%Drive%"\%guidename%
goto:skipKoreansetting

echo .>>"%Drive%"\%guidename%

:Koreansetting
if /i "%FIRMSTART%" NEQ "o" echo                * Current firmware is %FIRMSTART%K>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo                * Current firmware is less than 2.2K (Korean Wii's are hacked differently than Wii's from other regions.)>>"%Drive%"\%guidename%
:skipKoreansetting
if /i "%REGION%" NEQ "RC" echo                * Desired firmware is %FIRM%%REGION%>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%PIC%" EQU "Y" echo                * Download Photo Channel>>"%Drive%"\%guidename%
if /i "%NET%" EQU "Y" echo                * Download Internet Channel>>"%Drive%"\%guidename%
if /i "%WEATHER%" EQU "Y" echo                * Download Weather Channel>>"%Drive%"\%guidename%
if /i "%NEWS%" EQU "Y" echo                * Download News Channel>>"%Drive%"\%guidename%
if /i "%MIIQ%" EQU "Y" echo                * Download Mii Channel>>"%Drive%"\%guidename%
if /i "%Shop%" EQU "Y" echo                * Download Shopping Channel (and IOS56)>>"%Drive%"\%guidename%
if /i "%Speak%" EQU "Y" echo                * Download Wii Speak Channel>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
if /i "%VIRGIN%" EQU "Y" goto:skipvirginstandard


if /i "%HM%" NEQ "*" goto:skip4.3extra
if /i "%FIRMSTART%" EQU "3.X" echo                * Download HackMii Installer and BannerBomb v1 (with IOS58)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "4.0" echo                * Download HackMii Installer and BannerBomb v1 (with IOS58)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "4.1" echo                * Download HackMii Installer and BannerBomb v1 (with IOS58)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "4.2" echo                * Download HackMii Installer and BannerBomb v2 (with IOS58)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo                * Download HackMii Installer with IOS58 and all available exploits>>"%Drive%"\%guidename%


if /i "%FIRMSTART%" NEQ "4.3" goto:skip4.3extra

echo                * HackMii Installer with IOS58 and all available exploits>>"%Drive%"\%guidename%

:skip4.3extra



if /i "%RECCIOS%" NEQ "Y" goto:smallskip
if /i "%CMIOSOPTION%" EQU "on" (echo                * Download recommended cIOSs and cMIOS>>"%Drive%"\%guidename%) else (echo                * Download recommended cIOSs>>"%Drive%"\%guidename%)
:smallskip


if /i "%yawm%" EQU "*" echo                * Download Yet Another Wad Manager Mod (YAWMM)>>"%Drive%"\%guidename%

if /i "%IOS236Installer%" EQU "*" echo                * Download IOS236 Installer and Simple IOS Patcher (with IOS36v3351)?>>"%Drive%"\%guidename%

if /i "%pri%" EQU "*" echo                * Download Priiloader>>"%Drive%"\%guidename%
:skipvirginstandard
if /i "%protect%" EQU "Y" echo                * Download Extra Brick Protection>>"%Drive%"\%guidename%


if /i "%ThemeSelection%" EQU "R" echo                * Install Dark Wii Red Theme>>"%Drive%"\%guidename%
if /i "%ThemeSelection%" EQU "G" echo                * Install Dark Wii Green Theme>>"%Drive%"\%guidename%

if /i "%ACTIVEIOS%" NEQ "ON" goto:skipupdatelog
if /i "%UpdatesIOSQ%" EQU "N" goto:skipupdatelog
echo                * Update active IOSs (can be disabled in options)>>"%Drive%"\%guidename%
goto:skip
:skipupdatelog
echo                * Do not update active IOSs (can be enabled in options)>>"%Drive%"\%guidename%
:skip


if /i "%RECCIOS%" EQU "Y" goto:semiskip
if /i "%VIRGIN%" NEQ "Y" goto:tinyskip
if /i "%CMIOSOPTION%" EQU "on" echo                * Install a cMIOS (can be disabled in Options)>>"%Drive%"\%guidename%
:semiskip
if /i "%CMIOSOPTION%" EQU "off" echo                * Do not Install a cMIOS (can be enabled in Options)>>"%Drive%"\%guidename%
:tinyskip


::---------
if /i "%USBGUIDE%" NEQ "Y" goto:skipusb
echo .>>"%Drive%"\%guidename%

if /i "%FORMAT%" EQU "1" set FORMATNAME=FAT32
if /i "%FORMAT%" EQU "2" set FORMATNAME=NTFS
if /i "%FORMAT%" EQU "3" set FORMATNAME=Part FAT32 and Part NTFS
if /i "%FORMAT%" EQU "4" set FORMATNAME=WBFS
if /i "%FORMAT%" EQU "5" set FORMATNAME=Part FAT32 and Part WBFS

if /i "%FORMAT%" EQU "4" goto:skip
if /i "%FORMAT%" EQU "5" goto:skip
echo                * External Hard Drive to be Formatted as %FORMATNAME%>>"%Drive%"\%guidename%
goto:skip2
:skip
echo                * External Hard Drive already Formatted as %FORMATNAME%>>"%Drive%"\%guidename%
:skip2

if /i "%LOADER%" EQU "CFG" echo                * Download Configurable USB-Loader>>"%Drive%"\%guidename%
if /i "%LOADER%" EQU "FLOW" echo                * Download WiiFlow>>"%Drive%"\%guidename%
if /i "%LOADER%" EQU "ALL" echo                * Download Configurable USB-Loader and WiiFlow>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo                * USB-Loader Settings and config files saved to USB Hard Drive>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo                * USB-Loader Settings and config files saved to SD Card>>"%Drive%"\%guidename%
:skipusb


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo This software is not for sale. If you paid for this software or a "bundle" you have been scammed.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo THIS PACKAGE COMES WITH ABSOLUTELY NO WARRANTY, NEITHER STATED NOR IMPLIED.>>"%Drive%"\%guidename%
echo NO ONE BUT YOURSELF IS TO BE HELD RESPONSIBLE FOR ANY DAMAGE THIS MAY CAUSE TO YOUR NINTENDO WII CONSOLE!>>"%Drive%"\%guidename%
echo USE THIS AT YOUR OWN RISK!>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo IMPORTANT NOTES:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo *This guide does NOT require a Wifi connection on your Wii.>>"%Drive%"\%guidename%
echo *An SD card formatted to FAT(32) required (Best results are with non-SDHC cards, SDHC will only work on 4.0 or above).>>"%DRIVE%"\%guidename%
echo *If you get errors during any of the steps reformat your SD card as FAT or FAT32>>"%Drive%"\%guidename%
echo *Turn off WiiConnect24 and take out all gamecube memory cards/controllers when modding the Wii (unless instructed otherwise).>>"%DRIVE%"\%guidename%
echo *If your Wii ever freezes, hold the power button on the Wii for 5 seconds to power it off then try again.>>"%Drive%"\%guidename%
echo *Don’t ever accept a new Nintendo update without first googling to see if it’s safe. The last update (to 4.3) was released in late June 2010 and is NOT safe to accept. If you accept an official Nintendo update after modding the Wii, you may lose some or all of your modifications.>>"%Drive%"\%guidename%
echo *Never uninstall a system menu or IOS>>"%Drive%"\%guidename%
echo *Do not install untested wads/themes without Bootmii or Priiloader installed.>>"%Drive%"\%guidename%

::----USB-Loader Notes----
if /i "%USBGUIDE%" NEQ "Y" goto:skipall
if /i "%cIOS223[37-38]-v4%" EQU "*" goto:skipthis

echo *cIOS(s) required to use USB-Loaders, if you are missing cIOS(s) run the ModMii Wizard function to softmod your Wii before setting up your USB-Loader and/or external Hard-Drive.>>"%Drive%"\%guidename%
echo *cIOS249 rev18 or higher required to use Hard Drives Formatted as FAT32 or NTFS (cIOS222 rev4 or higher also works, but you would need to download the 222 version of configurable usb-loader or modify your config.txt file for configurable USB-Loader)>>"%Drive%"\%guidename%
:skipthis

echo *Not all external hard drive's are compatible with the Wii, for a list of which USB Hard Drive's are compatible, see this webpage: http://wiki.gbatemp.net/wiki/USB_Devices_Compatibility_List>>"%Drive%"\%guidename%
echo *If you have questions, a more detailed guide can be found here: www.sites.google.com/site/completesg/>>"%Drive%"\%guidename%
:skipall
::-------------------------

echo *This custom guide is great start, but Wii modding is always evolving. Check for updates online, and remember, google is your friend.>>"%Drive%"\%guidename%
echo *If you have questions, a more detailed guide can be found here: www.sites.google.com/site/completesg/>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%




::-----------------------------------------virgin Korean non-4.3 Wiis-----------------------------------
If /i "%VIRGIN%" NEQ "Y" goto:nonkorean
If /i "%REGION%" NEQ "K" goto:nonkorean
If /i "%FIRMSTART%" EQU "4.3" goto:nonkorean

::---------------------------------RESTORING THE TRUCHA BUG for Korean Wiis (4.2 and under)-------------------------


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) LAUNCH Multi-Mod Manager (MMM) USING BANNERBOMB>>"%Drive%"\%guidename%
echo    ===============================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%

If /i "%BB2%" EQU "*" echo Run BannerBomb v2 by selecting the SD Card Button on the main system menu screen and choosing yes to load boot.dol/elf>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo Run BannerBomb v1 by going to Settings, Data Management, Channels, SD Card and choosing yes to load boot.dol/elf>>"%Drive%"\%guidename%
echo Note: If it doesn't work for you, visit http://bannerbomb.qoid.us/ for more variations of either version of bannerbomb.>>"%DRIVE%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo This will launch Multi-Mod Manager.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



:KOREANEXTRA
echo %COUNT7%) INSTALL IOS58 USING Multi-Mod Manager (MMM)>>"%Drive%"\%guidename%
echo    ===========================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo In Multi-Mod Manager's main menu, Go down to select "WAD Manager".>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Now install IOS58v6176.>>"%Drive%"\%guidename%
echo Navigate to the wad and hit A twice to install the IOS individually.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Be careful not to install any additional wads that may have been previously saved in this folder (they may be safe, but I cannot say for sure).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


echo Make sure the file installed properly.>>"%Drive%"\%guidename%
echo Only move onto the next step after successfully installing the wad, but do NOT exit MMM.>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



echo %COUNT7%) INSTALLING THE HOMEBREW CHANNEL (HBC) and BOOTMII>>"%Drive%"\%guidename%
echo    =================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%

echo Back in the MMM main menu, choose "App Manager" and press A.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Launch the HackMii_Installer>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo This runs the Hackmii Installer (and silently/automatically installs BootMii as IOS). Use the installer to install the Homebrew Channel (HBC) and Bootmii as Boot2 if possible. If you cannot install BootMii as Boot2, you also need to 'prepare an SD Card' for BootMii (as the 'BootMii' folder is required to launch BootMii as IOS or Boot2).>>"%DRIVE%"\%guidename%

goto:nandbackup



::---------------------------virgin NON-Korean Wiis-----------------------------------

::---------------------------------HACKMII INSTALLER-----------------------------

:nonkorean

If /i "%HM%" NEQ "*" goto:TBRGUIDE

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) INSTALLING THE HOMEBREW CHANNEL (HBC) AND BOOTMII>>"%Drive%"\%guidename%
echo    =================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%


::---------------------------EXPLOITS GUIDES------------------------------
:EXPLOITS

set exploitnum=0
If /i "%BB1%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%BB2%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%TWI%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%YUGI%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%PWNS%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%SMASH%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%BATHAXX%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%ROTJ%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%TOS%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%exploitnum%" GEQ "2" echo EXPLOITS>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo -------->>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo You only need to perform ONE of the following exploits>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo.>>"%Drive%"\%guidename%


If /i "%BB1%" EQU "*" goto:skipforwardersolution
If /i "%BB2%" EQU "*" goto:skipforwardersolution
echo Note: if this Wii was previously modified, and it has either the HBC, BootMii as Boot2, or a Forwarder Channel installed, you can use that instead of an exploit (as it does not require physically owning a specific game).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo If using BootMii as Boot2 to install the HBC, copy the 'BootMii' folder from your previous BootMii install to the root of your SD Card (or download it using ModMii). Then boot your wii, BootMii will load, go To the SD menu, load bootmini.elf. This will load the Hackmii Installer allowing you to reinstall the HBC.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo If using a Forwarder Channel, just save the boot.elf/dol from the app you want to load (ie. SD:\apps\hackmii_installer\boot.elf or SD:\apps\MMM\boot.dol) to the location used by your SPECIFIC Forwarder Channel (ie. SD:\apps\usbloader\boot.dol). Then start the channel and the Hackmii Installer will load allowing you to reinstall the HBC. Note, if your forwarder channel only loads dol's and not elf's, launch MMM's boot.dol, then use its "App Manager" to load the Hackmii Installer.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


if /i "%FIRMSTART%" EQU "o" echo Alternatively, you can update your Wii to v3.0-4.2 using a DISC (ie. NSMBW). Then repeat the ModMii Wizard using your new Firmware and then you will be able to use the BannerBomb Exploit (which does not require a specific disc to work)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo.>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo WARNING: Online update to v4.3 makes Korean Wii's unhackable (unless it previously had HBC v1.0.7, BootMii as Boot2v4, or a forwarder channel installed)>>"%DRIVE%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo .>>"%Drive%"\%guidename%
:skipforwardersolution

:EXPLOITSNOW

echo.>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo Run BannerBomb v1 by going to Settings, Data Management, Channels, SD Card and choosing yes to load boot.dol/elf>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo Note: If it doesn't work for you, visit http://bannerbomb.qoid.us/ for more variations of either version of bannerbomb.>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo .>>"%Drive%"\%guidename%




If /i "%BB2%" EQU "*" echo Run BannerBomb v2 by selecting the SD Card Button on the main system menu screen and choosing yes to load boot.dol/elf>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo Note: If it doesn't work for you, visit http://bannerbomb.qoid.us/ for more variations of either version of bannerbomb.>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo .>>"%Drive%"\%guidename%



If /i "%SMASH%" NEQ "*" goto:skipSmashStackGuide

echo SMASH STACK EXPLOIT>>"%Drive%"\%guidename%
echo ------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUIREMENTS: * A copy of "Super Smash Brothers Brawl">>"%Drive%"\%guidename%
echo               * A non-SDHC card (SDHC cards don't work)>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Insert the Super Smash Brothers Brawl Game.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Launch the game withOUT the SD card in your wii, create a save file if you don't have one already,>>"%Drive%"\%guidename%
echo Then go into the stage builder and delete all the stages. Then exit the game.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Afterwards, insert your SD Card, start the game and go to the stage builder,>>"%Drive%"\%guidename%
echo it should launch the boot.elf/dol file saved on the root of your SD card.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo If you forgot to delete the stages, you will experience an annoying but harmless crash.>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipSmashStackGuide



If /i "%PWNS%" NEQ "*" goto:skipPWNSGuide

echo INDIANA PWNS EXPLOIT>>"%Drive%"\%guidename%
echo -------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUIREMENTS: * A copy of LEGO Indiana Jones>>"%Drive%"\%guidename%
echo               * A non-SDHC card (SDHC cards don't work)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Load the LEGO Indiana Jones game at least once>>"%Drive%"\%guidename%
echo    (otherwise you won't be able to copy over the hack).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Backup your personal LEGO Indiana Jones save file before copying the files to your SD Card (if applicable):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Put your SD card in your Wii and turn it on.>>"%Drive%"\%guidename%
echo   b) Go into Wii Options - Data Management - Save Data - Wii>>"%Drive%"\%guidename%
echo   c) Find your Indiana save, click on it, click "Copy", and click Yes. Now erase the save file from the Wii.>>"%Drive%"\%guidename%
echo   d) Put your SD card in your computer, and copy the "private" folder from the card to a safe place. Alternatively you can temporarily rename it.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copy the files from the %DRIVE% to the root of your SD card (if you haven’t already) and insert it into your Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Go into Wii Options - Data Management - Save Data - Wii - SD Card>>"%Drive%"\%guidename%
echo    then copy over the "Indiana Pwns" save that corresponds to your region.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Play the Lego Indiana Jones game. Load the new save file.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo    You will be in the Main hall, walk towards the camera,>>"%Drive%"\%guidename%
echo    enter the first door on the right (Indy's left) and go into the 'Courtyard'.>>"%Drive%"\%guidename%
echo    Walk to the end and enter the 'Art Room', you will see a podium with 2 characters on it, talk to the left one.>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo    Hit left twice (scrolling through his items) to choose the switch option (Black silhouette with a white arrow to another black silhouette)>>"%Drive%"\%guidename%
echo    Hit A to launch the boot.elf/dol file saved on the root of your SD card.>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipPWNSGuide



If /i "%YUGI%" NEQ "*" goto:skipYUGIGuide

echo YU-GI-OWNED EXPLOIT>>"%Drive%"\%guidename%
echo ------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUIREMENTS: * A copy of "Yu-Gi-Oh! 5D's">>"%Drive%"\%guidename%
echo               * A non-SDHC card (SDHC cards don't work)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Load the Yu-Gi-Oh game at least once>>"%Drive%"\%guidename%
echo    (otherwise you won't be able to copy over the hack).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Backup your personal Yu-Gi-Oh save file before copying the files to your SD Card (if applicable):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Put your SD card in your Wii and turn it on.>>"%Drive%"\%guidename%
echo   b) Go into Wii Options - Data Management - Save Data - Wii>>"%Drive%"\%guidename%
echo   c) Find your Yu-Gi-Oh save, click on it, click "Copy", and click Yes. Now erase the save file from the Wii.>>"%Drive%"\%guidename%
echo   d) Put your SD card in your computer, and copy the "private" folder from the card to a safe place. Alternatively you can temporarily rename it.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copy the files from the %DRIVE% to the root of your SD card (if you haven’t already) and insert it into your Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Go into Wii Options - Data Management - Save Data - Wii - SD Card>>"%Drive%"\%guidename%
echo    then copy over the "Yu-Gi-Oh" save that corresponds to your region.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Start the Yu-Gi-Oh game. The exploit is launched after continuing past the opening menu.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%REGION%" EQU "E" echo .>>"%Drive%"\%guidename%
if /i "%REGION%" EQU "E" echo Note to European Users: The default YU-GI-OWNED PAL exploit is 60Hz. If it does not work on your 50Hz TV, navigate to "SD:\private\wii\title\" and rename "RYOP" to something else then rename "RYOP-50hz" to "RYOP" and try again. >>"%Drive%"\%guidename%

If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipYUGIGuide




If /i "%BATHAXX%" NEQ "*" goto:skipBATHAXXGuide

echo BATHAXX EXPLOIT>>"%Drive%"\%guidename%
echo --------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUIREMENTS: * A copy of "LEGO Batman">>"%Drive%"\%guidename%
echo               * SD card (not SHDC) formatted as FAT16 or FAT32>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Load the LEGO Batman game at least once>>"%Drive%"\%guidename%
echo    (otherwise you won't be able to copy over the hack).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Backup your personal LEGO Batman save file before copying the files to your SD Card (if applicable):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Put your SD card in your Wii and turn it on.>>"%Drive%"\%guidename%
echo   b) Go into Wii Options - Data Management - Save Data - Wii>>"%Drive%"\%guidename%
echo   c) Find your LEGO Batman save, click on it, click "Copy", and click Yes. Now erase the save file from the Wii.>>"%Drive%"\%guidename%
echo   d) Put your SD card in your computer, and copy the "private" folder from the card to a safe place. Alternatively you can temporarily rename it.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copy the files from the %DRIVE% to the root of your SD card (if you haven’t already) and insert it into your Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Go into Wii Options - Data Management - Save Data - Wii - SD Card>>"%Drive%"\%guidename%
echo    then copy over the "LEGO Batman" save that corresponds to your region.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Start the LEGO Batman game. Load the new save file.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo    You are now in the batcave, take the elevator on the right side.>>"%Drive%"\%guidename%
echo    Then in the trophy room, go to the upper corner and go through the door>>"%Drive%"\%guidename%
echo    to the "Wayne Manor". Now you can select a character.>>"%Drive%"\%guidename%
echo    Choose the last enabled character in the lowest row to launch the exploit.>>"%Drive%"\%guidename%

If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipBATHAXXGuide


If /i "%ROTJ%" NEQ "*" goto:skipROTJGuide

echo RETURN OF THE JODI EXPLOIT>>"%Drive%"\%guidename%
echo -------------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUIREMENTS: * A copy of "LEGO Star Wars">>"%Drive%"\%guidename%
echo               * SD card (not SHDC) formatted as FAT16 or FAT32>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Load the LEGO Star Wars game at least once>>"%Drive%"\%guidename%
echo    (otherwise you won't be able to copy over the hack).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Backup your personal LEGO Star Wars save file before copying the files to your SD Card (if applicable):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Put your SD card in your Wii and turn it on.>>"%Drive%"\%guidename%
echo   b) Go into Wii Options - Data Management - Save Data - Wii>>"%Drive%"\%guidename%
echo   c) Find your LEGO Star Wars save, click on it, click "Copy", and click Yes. Now erase the save file from the Wii.>>"%Drive%"\%guidename%
echo   d) Put your SD card in your computer, and copy the "private" folder from the card to a safe place. Alternatively you can temporarily rename it.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copy the files from the %DRIVE% to the root of your SD card (if you haven’t already) and insert it into your Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Go into Wii Options - Data Management - Save Data - Wii - SD Card>>"%Drive%"\%guidename%
echo    then copy over the "LEGO Star Wars" save that corresponds to your region.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Start the LEGO Star Wars. Load the first save slot (on the left, at 0.0 percent). >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo    As soon as the level loads, run to the right and you'll see two floating characters >>"%Drive%"\%guidename%
echo    Go to the area in front of them and you'll see 'Return of JODI' show up >>"%Drive%"\%guidename%
echo    press the "A" button to launch the exploit. >>"%Drive%"\%guidename%

If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipROTJGuide


If /i "%TOS%" NEQ "*" goto:skipTOSGuide

echo ERI HAKAWAI EXPLOIT>>"%Drive%"\%guidename%
echo ------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUIREMENTS: * A copy of "Tales of Symphonia: Dawn of the New World">>"%Drive%"\%guidename%
echo               * SD card (not SHDC) formatted as FAT16 or FAT32>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Load the Tales of Symphonia game at least once>>"%Drive%"\%guidename%
echo    (otherwise you won't be able to copy over the hack).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Backup your personal Tales of Symphonia save file before copying the files to your SD Card (if applicable):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Put your SD card in your Wii and turn it on.>>"%Drive%"\%guidename%
echo   b) Go into Wii Options - Data Management - Save Data - Wii>>"%Drive%"\%guidename%
echo   c) Find your Tales of Symphonia save, click on it, click "Copy", and click Yes. Now erase the save file from the Wii.>>"%Drive%"\%guidename%
echo   d) Put your SD card in your computer, and copy the "private" folder from the card to a safe place. Alternatively you can temporarily rename it.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copy the files from the %DRIVE% to the root of your SD card (if you haven’t already) and insert it into your Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Go into Wii Options - Data Management - Save Data - Wii - SD Card>>"%Drive%"\%guidename%
echo    then copy over the "Tales of Symphonia" save that corresponds to your region.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Start Tales of Symphonia and load the save data. >>"%Drive%"\%guidename%


If /i "%REGION%" EQU "J" goto:noskip
If /i "%REGIONCHANGE%" EQU "J" (goto:noskip) else (goto:quickskip)
:noskip
echo    For Jap users, there are 2 different versions of the game.>>"%Drive%"\%guidename%
echo    If your game is version "RVL-RT4J-0A-0 JPN" use the top save,>>"%Drive%"\%guidename%
echo    if you have "RVL-RT4J-0A-1 JPN" use the second save.>>"%Drive%"\%guidename%
echo    If you have any other version of the disc, it probably won't work.>>"%Drive%"\%guidename%
:quickskip

echo .>>"%Drive%"\%guidename%
echo    Once the game starts (and you see a dog waving at you) press PLUS to enter the game's menu.>>"%Drive%"\%guidename%
echo    Scroll down to "Status" and press A.>>"%Drive%"\%guidename%


If /i "%REGION%" EQU "U" goto:noskip
If /i "%REGIONCHANGE%" EQU "U" goto:noskip
If /i "%REGION%" EQU "J" goto:noskip
If /i "%REGIONCHANGE%" EQU "J" goto:noskip
goto:quickskip
:noskip
echo    Then scroll down to the second character (named "Giantpune"). Highlight him, and press A.>>"%Drive%"\%guidename%
:quickskip

If /i "%REGION%" EQU "E" goto:noskip
If /i "%REGIONCHANGE%" EQU "E" goto:noskip
goto:quickskip
:noskip
echo    Then scroll down to the second character (named "Eri HaKawai"). Highlight him, and press A.>>"%Drive%"\%guidename%
:quickskip


If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipTOSGuide



If /i "%TWI%" NEQ "*" goto:skipTWIGuide

echo TWILIGHT HACK/EXPLOIT>>"%Drive%"\%guidename%
echo --------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUIREMENTS: * A copy of The Legend of Zelda: Twilight Princess>>"%Drive%"\%guidename%
echo               * A non-SDHC card (SDHC cards don't work)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Load the Twilight Princess game at least once>>"%Drive%"\%guidename%
echo    (otherwise you won't be able to copy over the hack).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Backup your personal Twilight Princess save file before copying the files to your SD Card (if applicable):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Put your SD card in your Wii and turn it on.>>"%Drive%"\%guidename%
echo   b) Go into Wii Options - Data Management - Save Data - Wii>>"%Drive%"\%guidename%
echo   c) Find your Twilight Princess save, click on it, click "Copy", and click Yes.>>"%Drive%"\%guidename%
echo   d) Put your SD card in your computer, and copy the "private" folder from the card to a safe place. Alternatively you can temporarily rename it.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copy the files from the %DRIVE% to the root of your SD card (if you haven’t already) and insert it into your Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Go into Wii Options - Data Management - Save Data - Wii>>"%Drive%"\%guidename%
echo    Now delete the Zelda save file on the Wii.>>"%Drive%"\%guidename%
echo    Switch to the SD card tab and select the "Twilight Hack" save that corresponds to your game region.>>"%Drive%"\%guidename%
echo    Click copy and then yes. Now exit out of the menu.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo E. Insert the The Legend of Zelda: Twilight Princess disc and run the game.>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo .>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo Note: Look at the bottom of the game disc first.>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo       If it has RVL-RZDE-0A-2 USA in its inner ring, you'll have to load TwilightHack2 in the next step.>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo       If it says something else, load TwilightHack0.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo F. On the title screen of the game, press A and B to go to the main menu.>>"%Drive%"\%guidename%
If /i "%REGION%" NEQ "U" echo    Now load the twilight hack save file.>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo    Now load the twilight hack save file (see the note above!).>>"%Drive%"\%guidename%

If /i "%REGION%" EQU "U" echo    If you accidentally load the wrong file and continue with the hack, the game will freeze but do not panic,>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo    just hold down the power button for 5 seconds to turn it off, then turn it back on, and start over.>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo G. The game will start like normal. To execute the hack, talk to the first character you see, or try to leave the room.>>"%DRIVE%"\%guidename%
:skipTWIGuide

echo .>>"%Drive%"\%guidename%

If /i "%MENU1%" EQU "H" goto:HMsolution2


:HACKMIIGUIDE
If /i "%HM%" NEQ "*" goto:PRIIGUIDE

echo .>>"%Drive%"\%guidename%
echo This runs the Hackmii Installer (and silently/automatically installs BootMii as IOS). Use the installer to install the Homebrew Channel (HBC) and Bootmii as Boot2 if possible. If you cannot install BootMii as Boot2, you also need to 'prepare an SD Card' for BootMii (as the 'BootMii' folder is required to launch BootMii as IOS or Boot2).>>"%DRIVE%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Note: If you get a 'no vulnerable IOS' error message, run ModMii again and this time select the 'Hackmii Solutions' option instead of 'ModMii Wizard' and follow the new instructions before continuing this guide.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo After you exit the hackmii installer, you will be taken to the HBC.>>"%Drive%"\%guidename%


echo Hit the home button. In the top right corner you will see the IOS used by the HBC.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo If the HBC is using an IOS other than IOS58 or your homebrew channel is upside-down, make a note of it as it applies later in the guide (you will have to reinstall the HBC).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo If it is using IOS58 and your HBC is not upside-down, you can skip the Reinstall The Homebrew Channel step when you get to it.>>"%DRIVE%"\%guidename%


echo .>>"%Drive%"\%guidename%



:nandbackup

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) MAKING A NAND BACKUP>>"%Drive%"\%guidename%
echo    ====================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%



echo While inside the Homebrew Channel, load BootMii by pressing home and clicking Launch Bootmii.>>"%Drive%"\%guidename%
echo Press the power button on the wii 3 times to get to the last option, then press the reset button. [You can also navigate with a Gamecube controller]>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Press reset to choose the first option, then follow the directions on the screen to make your NAND backup. [Bad blocks are no problem.]>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Backup the Bootmii folder, NAND.bin, and keys.bin elsewhere and erase from the sd card (or rename it). You'll need these in case of emergencies, so don't lose them.>>"%Drive%"\%guidename%
echo Go back to The Homebrew Channel.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Note: if Bootmii was installed as boot2, then it will show up as soon as the Wii is turned on AS LONG AS it finds the bootmii folder (mentioned above) on the root of the SD card.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


::----------------------------RESTORING THE TRUCHA BUG (using IOS236 Installer)--------------------------
:TBRGUIDE

If /i "%IOS236Installer%" NEQ "*" goto:PRIIGUIDE

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) INSTALL A PATCHED IOS236>>"%Drive%"\%guidename%
echo    ========================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%


echo Start the Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo VERY IMPORTANT!>>"%Drive%"\%guidename%
echo In the Homebrew channel, if you do not have a working internet connection already set up, you will see an icon flashing in the bottom right corner of the screen indicating its inability to initialize the network. You MUST wait for the icon to stop flashing OR let it flash for 30-60 seconds before proceeding otherwise these apps will error shortly after being launched. If you encounter this harmless error, power off the Wii and repeat this step from the beginning. To increase your chances of success, add a working internet connection to your Wii via the official Wii Settings Menu, but be sure to say "No" when asked to perform an update.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo You only need to perform ONE of the below methods.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Method A: Using IOS236 Installer>>"%Drive%"\%guidename%
echo -------------------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo After waiting 30-60 seconds for the HBC to attempt to initialize the network, launch "IOS236 Installer v5 MOD". >>"%Drive%"\%guidename%
echo      Note: This app must be launched using HBC v1.0.7 or higher in order to work properly.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo It should say "IOS236 installation is complete!" and return to The Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo If you experience errors, keep trying and it should eventually work.>>"%Drive%"\%guidename%
echo If you continue to experience errors you can try using Simple IOS Patcher instead.>>"%Drive%"\%guidename%
echo Once either method successfully installs IOS236, you can move onto the next step.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Method B: Using Simple IOS Patcher>>"%Drive%"\%guidename%
echo ---------------------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo After waiting 30-60 seconds for the HBC to attempt to initialize the network, launch "IOS236 Installer". >>"%Drive%"\%guidename%
echo      Note: This app must be launched using HBC v1.0.7 or higher in order to work properly.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Choose "IOS36" (already selected by default) and push A,>>"%Drive%"\%guidename%
echo Select "Install IOS to slot" and choose 236,>>"%Drive%"\%guidename%
echo Select "Install patched IOS36" leaving the 4 patches set to "yes" and press A,>>"%Drive%"\%guidename%
echo Choose "Load IOS from SD card".>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Confirm your choice with the A button,>>"%Drive%"\%guidename%
echo When prompted, push A to continue the installation.>>"%Drive%"\%guidename%
echo When the installation is over you'll be back at the Main Menu,>>"%Drive%"\%guidename%
echo Then push B button to exit.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo If you experience errors, keep trying and it should eventually work.>>"%Drive%"\%guidename%
echo If you continue to experience errors you can try using IOS236 Installer instead.>>"%Drive%"\%guidename%
echo Once either method successfully installs IOS236, you can move onto the next step.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

::--------------------------INSTALL PRIILOADER-------------------------------
:PRIIGUIDE

if /i "%installwads%" EQU "done" goto:skip
if /i "%FIRM%" NEQ "%FIRMSTART%" goto:installwads
if /i "%PRI%" NEQ "*" goto:installwads
:skip
if /i "%PRI%" NEQ "*" goto:reinstallHBC

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) INSTALL PRIILOADER>>"%Drive%"\%guidename%
echo    ==================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%

echo Launch "Priiloader 236 Mod" via the Homebrew Channel>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo After the Priiloader Installer loads, press + to install it.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo You may get an error for "loader.ini" and/or "password.txt" simply ignore these.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo After successfully installing Priiloader, access it by powering off the Wii,>>"%Drive%"\%guidename%
echo then powering it back on while holding reset until you see the Priiloader menu.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo You should install some system menu hacks now (by going to System Menu hacks option).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo RECOMMENDED HACKS: Block Disc Updates, Block Online Updates, Replace Health Screen, Auto-Press A at Health Screen, Region-Free Everything, remove no copy save file protection, and Move Disc Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo The priiloader menu is white by default, you can change it to black in the Priiloader settings if you prefer.>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%

echo One of the special functions of Priiloader is that it can autoboot any app/file instead of the system menu. Some apps (like crazyIntro) can't be used without it.>>"%Drive%"\%guidename%
echo For details on how to do so, visit www.sites.google.com/site/completesg/system-hacks/priiloader>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

if /i "%installwads%" EQU "done" goto:reinstallHBC


::----------------------Install Wads (MMM)-----------------------------

:installwads

::---------CREATE MMMCONFIG To Autoload 236--------
set patchIOSnum=236
if /i "%SETTINGS%" EQU "G" goto:skipmmmfly
if /i "%SETTINGSHM%" EQU "G" goto:skipmmmfly
echo ;MMMCONFIG (By ModMii)> "%Drive%"\mmmconfig.txt
echo AutoLoadIOS=%patchIOSnum%>> "%Drive%"\mmmconfig.txt
:skipmmmfly

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) INSTALL WADS>>"%Drive%"\%guidename%
echo    ============>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

::MMM Instructions
echo Load Multi-Mod Manager (MMM) via the HomeBrew Channel.>>"%Drive%"\%guidename%
echo If IOS%patchIOSnum% is not already loaded, select "Load another IOS", then select IOS%patchIOSnum% >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Note: If this step fails with error -ret 2011 or other, you may need to retry patching IOS%patchIOSnum%. If the Wii was previously softmodded, you can try loading cIOS250 (or others like 202,222,223,224,236,249)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo In Multi-Mod Manager's main menu, go down to select "WAD Manager".>>"%Drive%"\%guidename%


goto:skipy4m
::YAWMM 4 ModMii Instructions
echo Start the Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo VERY IMPORTANT!>>"%Drive%"\%guidename%
echo In the Homebrew channel, if you do not have an internet connection set up, you will see an icon flashing in the bottom right corner of the screen indicating its inability to initialize the network.>>"%Drive%"\%guidename%
echo You MUST wait for the icon to stop flashing OR let it flash for 30-60 seconds before proceeding otherwise this specific app will freeze shortly after being launched. >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo After waiting 30-60 seconds for the HBC to attempt to initialize the network, launch "YAWMM 4 ModMii". >>"%Drive%"\%guidename%
echo      Note: This app must be launched using HBC v1.0.7 or higher in order to work properly.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Press "A" to continue.>>"%Drive%"\%guidename%
echo Press "A" again to read from the SD slot. >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo VERY IMPORTANT!>>"%Drive%"\%guidename%
echo Wait for 30-60 seconds to see if the app freezes. If so, power off the Wii and repeat this step from the beginning. If after waiting 30-60 seconds, the app still doesn't freeze, this confirms that it is safe to use.>>"%Drive%"\%guidename%
:skipy4m




echo .>>"%Drive%"\%guidename%
echo Install the following WADs from the WAD folder (this list of WADs is unique to how you answered the Wizard's questions).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Be careful not to install any additional wads that may have been previously saved in this folder (they may be safe, but I cannot say for sure).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Hold + for 2 seconds to select all the WADs in the folder. Then Press A twice to install them all.>>"%Drive%"\%guidename%

echo If any files fail to install properly, they will remain marked for installation, so just retry installing those files.>>"%Drive%"\%guidename%
::echo After the installation finishes read the install report to make sure all the files installed properly.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo      Your unique list of wads to install are as follows:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



if /i "%IOS11P60%" EQU "*" echo      * IOS11v16174(IOS60v6174[FS-ES-NP])>>"%Drive%"\%guidename%
if /i "%IOS20P60%" EQU "*" echo      * IOS20v16174(IOS60v6174[FS-ES-NP])>>"%Drive%"\%guidename%
if /i "%IOS30P60%" EQU "*" echo      * IOS30v16174(IOS60v6174[FS-ES-NP])>>"%Drive%"\%guidename%
if /i "%IOS40P60%" EQU "*" echo      * IOS40v16174(IOS60v6174[FS-ES-NP])>>"%Drive%"\%guidename%
if /i "%IOS50P%" EQU "*" echo      * IOS50v14889(IOS50v4889[FS-ES-NP])>>"%Drive%"\%guidename%
if /i "%IOS52P%" EQU "*" echo      * IOS52v15661(IOS52v5661[FS-ES-NP])>>"%Drive%"\%guidename%
if /i "%IOS60P%" EQU "*" echo      * IOS60v16174(IOS60v6174[FS-ES-NP])>>"%Drive%"\%guidename%
if /i "%IOS70P%" EQU "*" echo      * IOS70v16687(IOS70v6687[FS-ES-NP])>>"%Drive%"\%guidename%
if /i "%IOS70K%" EQU "*" echo      * IOS70v16174(IOS60v6174[FS-ES-NP])>>"%Drive%"\%guidename%
if /i "%IOS80P%" EQU "*" echo      * IOS80v6944[FS-ES-NP]>>"%Drive%"\%guidename%
if /i "%IOS80K%" EQU "*" echo      * IOS80v16174(IOS60v6174[FS-ES-NP])>>"%Drive%"\%guidename%


if /i "%SM4.1U%" EQU "*" echo      * SystemMenu_4.1U_v449>>"%Drive%"\%guidename%
if /i "%SM4.2U%" EQU "*" echo      * SystemMenu_4.2U_v481>>"%Drive%"\%guidename%
if /i "%SM4.3U%" EQU "*" echo      * SystemMenu_4.3U_v513>>"%Drive%"\%guidename%
if /i "%SM4.1E%" EQU "*" echo      * SystemMenu_4.1E_v450>>"%Drive%"\%guidename%
if /i "%SM4.2E%" EQU "*" echo      * SystemMenu_4.2E_v482>>"%Drive%"\%guidename%
if /i "%SM4.3E%" EQU "*" echo      * SystemMenu_4.3E_v514>>"%Drive%"\%guidename%
if /i "%SM4.1J%" EQU "*" echo      * SystemMenu_4.1J_v448>>"%Drive%"\%guidename%
if /i "%SM4.2J%" EQU "*" echo      * SystemMenu_4.2J_v480>>"%Drive%"\%guidename%
if /i "%SM4.3J%" EQU "*" echo      * SystemMenu_4.3J_v512>>"%Drive%"\%guidename%
if /i "%SM4.1K%" EQU "*" echo      * SystemMenu_4.1K_v454>>"%Drive%"\%guidename%
if /i "%SM4.2K%" EQU "*" echo      * SystemMenu_4.2K_v486>>"%Drive%"\%guidename%
if /i "%SM4.3K%" EQU "*" echo      * SystemMenu_4.3K_v518>>"%Drive%"\%guidename%

if /i "%SM4.1U-DWR%" EQU "*" echo      * SystemMenu_4.1U_v449_DarkWiiRed>>"%Drive%"\%guidename%
if /i "%SM4.2U-DWR%" EQU "*" echo      * SystemMenu_4.2U_v481_DarkWiiRed>>"%Drive%"\%guidename%
if /i "%SM4.3U-DWR%" EQU "*" echo      * SystemMenu_4.3U_v513_DarkWiiRed>>"%Drive%"\%guidename%
if /i "%SM4.1E-DWR%" EQU "*" echo      * SystemMenu_4.1E_v450_DarkWiiRed>>"%Drive%"\%guidename%
if /i "%SM4.2E-DWR%" EQU "*" echo      * SystemMenu_4.2E_v482_DarkWiiRed>>"%Drive%"\%guidename%
if /i "%SM4.3E-DWR%" EQU "*" echo      * SystemMenu_4.3E_v514_DarkWiiRed>>"%Drive%"\%guidename%
if /i "%SM4.1J-DWR%" EQU "*" echo      * SystemMenu_4.1J_v448_DarkWiiRed>>"%Drive%"\%guidename%
if /i "%SM4.2J-DWR%" EQU "*" echo      * SystemMenu_4.2J_v480_DarkWiiRed>>"%Drive%"\%guidename%
if /i "%SM4.3J-DWR%" EQU "*" echo      * SystemMenu_4.3J_v512_DarkWiiRed>>"%Drive%"\%guidename%
if /i "%SM4.1K-DWR%" EQU "*" echo      * SystemMenu_4.1K_v454_DarkWiiRed>>"%Drive%"\%guidename%
if /i "%SM4.2K-DWR%" EQU "*" echo      * SystemMenu_4.2K_v486_DarkWiiRed>>"%Drive%"\%guidename%
if /i "%SM4.3K-DWR%" EQU "*" echo      * SystemMenu_4.3K_v518_DarkWiiRed>>"%Drive%"\%guidename%

if /i "%SM4.1U-DWG%" EQU "*" echo      * SystemMenu_4.1U_v449_DarkWiiGreen>>"%Drive%"\%guidename%
if /i "%SM4.2U-DWG%" EQU "*" echo      * SystemMenu_4.2U_v481_DarkWiiGreen>>"%Drive%"\%guidename%
if /i "%SM4.3U-DWG%" EQU "*" echo      * SystemMenu_4.3U_v513_DarkWiiGreen>>"%Drive%"\%guidename%
if /i "%SM4.1E-DWG%" EQU "*" echo      * SystemMenu_4.1E_v450_DarkWiiGreen>>"%Drive%"\%guidename%
if /i "%SM4.2E-DWG%" EQU "*" echo      * SystemMenu_4.2E_v482_DarkWiiGreen>>"%Drive%"\%guidename%
if /i "%SM4.3E-DWG%" EQU "*" echo      * SystemMenu_4.3E_v514_DarkWiiGreen>>"%Drive%"\%guidename%
if /i "%SM4.1J-DWG%" EQU "*" echo      * SystemMenu_4.1J_v448_DarkWiiGreen>>"%Drive%"\%guidename%
if /i "%SM4.2J-DWG%" EQU "*" echo      * SystemMenu_4.2J_v480_DarkWiiGreen>>"%Drive%"\%guidename%
if /i "%SM4.3J-DWG%" EQU "*" echo      * SystemMenu_4.3J_v512_DarkWiiGreen>>"%Drive%"\%guidename%
if /i "%SM4.1K-DWG%" EQU "*" echo      * SystemMenu_4.1K_v454_DarkWiiGreen>>"%Drive%"\%guidename%
if /i "%SM4.2K-DWG%" EQU "*" echo      * SystemMenu_4.2K_v486_DarkWiiGreen>>"%Drive%"\%guidename%
if /i "%SM4.3K-DWG%" EQU "*" echo      * SystemMenu_4.3K_v518_DarkWiiGreen>>"%Drive%"\%guidename%


if /i "%cIOS202[57]-v5%" EQU "*" echo      * cIOS202[57]-v5>>"%Drive%"\%guidename%
if /i "%cIOS222[38]-v5%" EQU "*" echo      * cIOS222[38]-v5>>"%Drive%"\%guidename%
if /i "%cIOS223[37-38]-v4%" EQU "*" echo      * cIOS223[37-38]-v4>>"%Drive%"\%guidename%
if /i "%cIOS224[57]-v5%" EQU "*" echo      * cIOS224[57]-v5>>"%Drive%"\%guidename%
if /i "%cIOS249[56]-d2x-v6%" EQU "*" echo      * cIOS249[56]-d2x-v%d2x-beta-rev%>>"%Drive%"\%guidename%
if /i "%cIOS250[57]-d2x-v6%" EQU "*" echo      * cIOS250[57]-d2x-v%d2x-beta-rev%>>"%Drive%"\%guidename%

if /i "%RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2%" EQU "*" echo      * RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2>>"%Drive%"\%guidename%



if /i "%MII%" EQU "*" echo      * Mii-Channel-NUS-v6>>"%Drive%"\%guidename%
if /i "%P%" EQU "*" echo      * Photo-Channel-1.1-NUS-v3>>"%Drive%"\%guidename%
if /i "%PK%" EQU "*" echo      * Photo-Channel-1.1-NUS-v3[K]>>"%Drive%"\%guidename%
if /i "%S%" EQU "*" echo      * Shopping-Channel-NUS-v20>>"%Drive%"\%guidename%
if /i "%SK%" EQU "*" echo      * Shopping-Channel-NUS-v20[K]>>"%Drive%"\%guidename%
if /i "%IU%" EQU "*" echo      * Opera-Internet-Channel-NUS[U]>>"%Drive%"\%guidename%
if /i "%IE%" EQU "*" echo      * Opera-Internet-Channel-NUS[E]>>"%Drive%"\%guidename%
if /i "%IJ%" EQU "*" echo      * Opera-Internet-Channel-NUS[J]>>"%Drive%"\%guidename%
if /i "%WU%" EQU "*" echo      * Weather-Channel-NUS-v7[U]>>"%Drive%"\%guidename%
if /i "%WE%" EQU "*" echo      * Weather-Channel-NUS-v7[E]>>"%Drive%"\%guidename%
if /i "%WJ%" EQU "*" echo      * Weather-Channel-NUS-v7[J]>>"%Drive%"\%guidename%
if /i "%NU%" EQU "*" echo      * NEWS-Channel-NUS-v7[U]>>"%Drive%"\%guidename%
if /i "%NE%" EQU "*" echo      * NEWS-Channel-NUS-v7[E]>>"%Drive%"\%guidename%
if /i "%NJ%" EQU "*" echo      * NEWS-Channel-NUS-v7[J]>>"%Drive%"\%guidename%
if /i "%WSU%" EQU "*" echo      * Wii-Speak-Channel-NUS[U]>>"%Drive%"\%guidename%
if /i "%WSE%" EQU "*" echo      * Wii-Speak-Channel-NUS[E]>>"%Drive%"\%guidename%
if /i "%WSJ%" EQU "*" echo      * Wii-Speak-Channel-NUS[J]>>"%Drive%"\%guidename%

if /i "%M10%" EQU "*" echo      * RVL-mios-v10>>"%Drive%"\%guidename%
if /i "%IOS9%" EQU "*" echo      * IOS9-64-v1034>>"%Drive%"\%guidename%
if /i "%IOS12%" EQU "*" echo      * IOS12-64-v526>>"%Drive%"\%guidename%
if /i "%IOS13%" EQU "*" echo      * IOS13-64-v1032>>"%Drive%"\%guidename%
if /i "%IOS14%" EQU "*" echo      * IOS14-64-v1032>>"%Drive%"\%guidename%
if /i "%IOS15%" EQU "*" echo      * IOS15-64-v1032>>"%Drive%"\%guidename%
if /i "%IOS17%" EQU "*" echo      * IOS17-64-v1032>>"%Drive%"\%guidename%
if /i "%IOS21%" EQU "*" echo      * IOS21-64-v1039>>"%Drive%"\%guidename%
if /i "%IOS22%" EQU "*" echo      * IOS22-64-v1294>>"%Drive%"\%guidename%
if /i "%IOS28%" EQU "*" echo      * IOS28-64-v1807>>"%Drive%"\%guidename%
if /i "%IOS31%" EQU "*" echo      * IOS31-64-v3608>>"%Drive%"\%guidename%
if /i "%IOS33%" EQU "*" echo      * IOS33-64-v3608>>"%Drive%"\%guidename%
if /i "%IOS34%" EQU "*" echo      * IOS34-64-v3608>>"%Drive%"\%guidename%
if /i "%IOS35%" EQU "*" echo      * IOS35-64-v3608>>"%Drive%"\%guidename%
if /i "%IOS36v3608%" EQU "*" echo      * IOS36-64-v3608>>"%Drive%"\%guidename%
if /i "%IOS37%" EQU "*" echo      * IOS37-64-v5663>>"%Drive%"\%guidename%
if /i "%IOS38%" EQU "*" echo      * IOS38-64-v4124>>"%Drive%"\%guidename%
if /i "%IOS41%" EQU "*" echo      * IOS41-64-v3607>>"%Drive%"\%guidename%
if /i "%IOS43%" EQU "*" echo      * IOS43-64-v3607>>"%Drive%"\%guidename%
if /i "%IOS45%" EQU "*" echo      * IOS45-64-v3607>>"%Drive%"\%guidename%
if /i "%IOS46%" EQU "*" echo      * IOS46-64-v3607>>"%Drive%"\%guidename%
if /i "%IOS48v4124%" EQU "*" echo      * IOS48-64-v4124>>"%Drive%"\%guidename%
if /i "%IOS53%" EQU "*" echo      * IOS53-64-v5663>>"%Drive%"\%guidename%
if /i "%IOS55%" EQU "*" echo      * IOS55-64-v5663>>"%Drive%"\%guidename%
if /i "%IOS56%" EQU "*" echo      * IOS56-64-v5662>>"%Drive%"\%guidename%
if /i "%IOS57%" EQU "*" echo      * IOS57-64-v5919>>"%Drive%"\%guidename%
if /i "%IOS58%" EQU "*" echo      * IOS58-64-v6176>>"%Drive%"\%guidename%
if /i "%IOS61%" EQU "*" echo      * IOS61-64-v5662>>"%Drive%"\%guidename%
if /i "%IOS236%" EQU "*" echo      * IOS236v65535(IOS36v3351[FS-ES-NP])>>"%Drive%"\%guidename%
if /i "%USBX%" NEQ "*" goto:nousbx
echo      * USBLoader(s)-ahbprot58-SD-USB-v9-IDCL>>"%Drive%"\%guidename%
echo        This is a forwarder channel that will load the first file it finds from the following list:>>"%Drive%"\%guidename%
echo                    SD+USB:\apps\usbloader\boot.dol>>"%Drive%"\%guidename%
echo                    SD+USB:\apps\usbloader\boot.elf>>"%Drive%"\%guidename%
echo                    SD+USB:\apps\usb-loader\boot.dol>>"%Drive%"\%guidename%
echo                    SD+USB:\apps\usb-loader\boot.elf>>"%Drive%"\%guidename%
echo                    SD+USB:\apps\usbloader_cfg\boot.dol>>"%Drive%"\%guidename%
echo                    SD+USB:\apps\usbloader_cfg\boot.elf>>"%Drive%"\%guidename%
echo                    SD+USB:\apps\WiiFlow\boot.dol>>"%Drive%"\%guidename%
echo                    SD+USB:\apps\WiiFlow\boot.elf>>"%Drive%"\%guidename%
echo                    SD+USB:\apps\usbloader_gx\boot.dol>>"%Drive%"\%guidename%
echo                    SD+USB:\apps\usbloader_gx\boot.elf>>"%Drive%"\%guidename%
echo       Notes: IOS58 is required to launch apps from an SD Card and hard drives formatted as>>"%Drive%"\%guidename%
echo              FAT32, NTFS, ext2, ext3 and ext4. It also supports meta.xml arguments>>"%Drive%"\%guidename%
echo              and is able to launch apps with direct hardware access.>>"%Drive%"\%guidename%
echo.
echo        You should always have at least one forwarder channel installed on your Wii,>>"%Drive%"\%guidename%
echo        that way, in the event of accidental update, you will be able to rehack your Wii without relying on a disc based exploit>>"%Drive%"\%guidename%
:nousbx

echo .>>"%Drive%"\%guidename%

if /i "%FIRM%" EQU "%FIRMSTART%" goto:SKIP
echo Note: Whenever you install a new System Menu, Priiloader is uninstalled. So be sure to reinstall it afterwards (especially if you do not have bootmii as boot2)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
:SKIP

set installwads=done
if /i "%FIRM%" NEQ "%FIRMSTART%" goto:PRIIGUIDE


::------------------------reinstall HBC / Fix Upsidedown homebrew channel----------------------------
:reinstallHBC
If /i "%HM%" NEQ "*" goto:MyMGuide

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) REINSTALL THE HOMEBREW CHANNEL (if applicable)>>"%Drive%"\%guidename%
echo    ==============================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%

echo Earlier you should have checked what IOS is used by the Homebrew Channel (HBC). If the IOS used by your HBC is IOS58 and your HBC is not upside-down, you can skip this step.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo If the HBC is using an IOS other than IOS58 or your HBC is upside-down, you should reinstall the HBC.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Launch the HackMii_Installer via the HBC.>>"%Drive%"\%guidename%
echo Use the Hackmii Installer to fix/re-install the HBC. Once you've successfully reinstalled the HBC, you can move onto the next step of the guide.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


::echo If you already exited MMM, you can load the HackMii_Installer from the HBC.>>"%Drive%"\%guidename%
::echo .>>"%Drive%"\%guidename%

echo If the HBC is failing to load the HackMii_Installer (just blackscreens), instead launch the Hackmii Installer using the method described in the First Step>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%



::------------------------Install Custom Theme Using MyMenuify----------------------------
:MyMGuide
If /i "%MyM%" NEQ "*" goto:noMyM

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) INSTALL CUSTOM WII MENU THEME USING MYMENUIFY (OPTIONAL)>>"%Drive%"\%guidename%
echo    ========================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%
echo WARNING: DO NOT INSTALL THEMES WITHOUT PROTECTION (BOOTMII, PRIILOADER AND NAND BACKUP)>>"%Drive%"\%guidename%
echo          AND ONLY INSTALL THEMES FOR YOUR SPECIFIC SYSTEM MENU VERSION AND REGION!>>"%Drive%"\%guidename%
echo.>>"%Drive%"\%guidename%
echo To install themes launch MyMenuify from the HBC.>>"%Drive%"\%guidename%
echo.>>"%Drive%"\%guidename%
echo Navigate to SD:\MyMenuify_Themes and select the theme you would like to install>>"%Drive%"\%guidename%
echo that corresponds to your specific System Menu Version.>>"%Drive%"\%guidename%
echo.>>"%Drive%"\%guidename%
echo If you ever decide to restore the original Menu Wii theme, you simply need>>"%Drive%"\%guidename%
echo to launch MyMenuify again and install the original .app file for your>>"%Drive%"\%guidename%
echo specific System Menu Version which was also saved to SD:\MyMenuify_Themes>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
:noMyM

if /i "%USBGUIDE%" EQU "Y" goto:USBGUIDESTEP1


::--------------------After Modding-----------------------
:AFTERMODDING

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) AFTER MODDING>>"%Drive%"\%guidename%
echo    =============>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%


echo After you are done modding your Wii, you can optionally delete any unnecesarry files>>"%Drive%"\%guidename%
echo by using ModMii's "File Cleanup" Feature. >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

If /i "%BB1%" EQU "*" echo If you choose not to use the File Cleanup feature, in order to avoid having your Wii freeze when accessing the SD Card Menu, you should delete the 'aktn' folder where bannerbomb is saved (SD:\private\wii\title\aktn), or rename the entire 'private' folder.>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo .>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo If you choose not to use the File Cleanup feature, in order to avoid having your Wii freeze when accessing the SD Card Menu, you should delete the 'aktn' folder where bannerbomb is saved (SD:\private\wii\title\aktn), or rename the entire 'private' folder.>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo .>>"%Drive%"\%guidename%

echo At this point you're practically done.>>"%Drive%"\%guidename%
echo Now you should be downloading the latest homebrew applications and setting them up on>>"%Drive%"\%guidename%
echo your SD Card (or FAT32 USB Hard Drive) so they can be launched via the HBC.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
if /i "%USBGUIDE%" EQU "Y" goto:skip
echo For playing your backups off a USB hard drive, run the USB-Loader Setup feature from ModMii's Main Menu>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
:skip

echo For downloading applications, you should:>>"%Drive%"\%guidename%
echo * Check out ModMii's batch download pages as it has many popular apps available for download.>>"%Drive%"\%guidename%
echo * Download Homebrew Browser via ModMii to get many popular apps, but this is an online only Wii application (www.sites.google.com/site/completesg/how-to-use/hbb)>>"%Drive%"\%guidename%
echo * For those without internet on their Wii, check out this list of Homebrew applications (wiibrew.org/wiki/List_of_all_homebrew).>>"%Drive%"\%guidename%
echo Another great resource is webrewwii.blogspot.com>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo After getting whatever apps you want, you should get a boot.dol file and possibly a icon.png and meta.xml.>>"%Drive%"\%guidename%
echo For HBC to read your SD/USB correctly, your card must be structured SD:/apps/application name/boot.dol>>"%Drive%"\%guidename%
echo If you have a *.dol not named boot.dol, rename it boot.dol, otherwise it will not be recognized by the HBC.>>"%Drive%"\%guidename%
echo (optional: the icon.png and meta.xml should be saved in the same place as the boot.dol)>>"%Drive%"\%guidename%


::---------------------support XFLAK-----------------------
:supportxflak

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) SUPPORT XFLAK>>"%Drive%"\%guidename%
echo    =============>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo IF MODMII WORKED FOR YOU, PLEASE VOTE IN FAVOUR OF THE PROGRAM HERE (tinyurl.com/ModMiiNow)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo DONATIONS CAN OPTIONALLY BE MADE VIA PAYPAL TO XFLAK40@HOTMAIL.COM>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo CHECK OUT MY TOP CHANNELS HERE (tinyurl.com/topchannels)>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo CHECK OUT MY CRAZY INTRO VIDEOS HERE (tinyurl.com/crazyintro)>>"%Drive%"\%guidename%

sfk filter "%Drive%"\%guidename% -lsrep _.__ -write -yes>nul
start notepad "%Drive%\%guidename%"


if /i "%SETTINGS%" EQU "G" goto:DOWNLOADQUEUE
if /i "%SETTINGSHM%" EQU "G" goto:HACKMIISOLUTION

goto:DLSETTINGS2





::--------------------------------------HACKMII SOLUTIONS GUIDE--------------------------------------
:HMguide
set guidename=ModMiiGuide_HackMiiFix.txt

SET COUNT7=1
cls
if /i "%SETTINGS%" EQU "G" echo Generating Guide, please wait.
if /i "%SETTINGS%" NEQ "G" echo Generating Guide, please wait, your downloads will begin shortly.

if not exist "%Drive%" mkdir "%Drive%" >nul
if not exist "%Drive%"\%guidename% goto:norename1
SET /a COUNT6=%COUNT6%+1
if exist "%Drive%"\ModMiiGuide_HackMiiFix%COUNT6%.txt goto:HMguide
move "%Drive%"\%guidename% "%Drive%"\ModMiiGuide_HackMiiFix%count6%.txt >nul
:norename1




echo ModMii %currentversion% HackMii Solutions Guide>"%Drive%"\%guidename%
echo Generated on %DATE% - %TIME%>>"%Drive%"\%guidename%
echo Check for updates at tinyurl.com/ModMiiNow>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo This Guide was generated using the following parameters:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%FIRMSTART%" NEQ "o" echo                * Current firmware is %FIRMSTART%%REGION%>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo                * Current firmware is less than 2.2>>"%Drive%"\%guidename%



echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo This software is not for sale. If you paid for this software or a "bundle" you have been scammed.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo THIS PACKAGE COMES WITH ABSOLUTELY NO WARRANTY, NEITHER STATED NOR IMPLIED.>>"%Drive%"\%guidename%
echo NO ONE BUT YOURSELF IS TO BE HELD RESPONSIBLE FOR ANY DAMAGE THIS MAY CAUSE TO YOUR NINTENDO WII CONSOLE!>>"%Drive%"\%guidename%
echo USE THIS AT YOUR OWN RISK!>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


echo IMPORTANT NOTES:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo *This guide does NOT require a Wifi connection on your Wii.>>"%Drive%"\%guidename%
echo *An SD card formatted to FAT(32) required (Best results are with non-SDHC cards, SDHC will only work on 4.0 or above).>>"%Drive%"\%guidename%
echo *If you get errors during any of the steps reformat your SD card as FAT or FAT32>>"%Drive%"\%guidename%
echo *Turn off WiiConnect24 and take out all gamecube memory cards/controllers when modding the Wii (unless instructed otherwise).>>"%Drive%"\%guidename%
echo *If your Wii ever freezes, hold the power button on the Wii for 5 seconds to power it off then try again.>>"%Drive%"\%guidename%
echo *Don’t ever accept a new Nintendo update without first googling to see if it’s safe. The last update (to 4.3) was released in late June 2010 and is NOT safe to accept. If you accept an official Nintendo update after modding the Wii, you may lose some or all of your modifications.>>"%Drive%"\%guidename%
echo *Never uninstall a system menu or IOS>>"%Drive%"\%guidename%
echo *Do not install untested wads/themes without Bootmii or Priiloader installed.>>"%Drive%"\%guidename%
echo *This custom guide is great start, but Wii modding is always evolving. Check for updates online, and remember, google is your friend.>>"%Drive%"\%guidename%
echo *If you have questions, a more detailed guide can be found here: www.sites.google.com/site/completesg/>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



set exploitnum=0
If /i "%BB1%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%BB2%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%TWI%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%YUGI%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%PWNS%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%SMASH%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%BATHAXX%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%ROTJ%" EQU "*" SET /a exploitnum=%exploitnum%+1
If /i "%TOS%" EQU "*" SET /a exploitnum=%exploitnum%+1

echo %COUNT7%) LAUNCH Multi-Mod Manager (MMM)>>"%Drive%"\%guidename%
echo    ==============================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Start the Homebrew Channel (HBC) and load Multi-Mod Manager (MMM). Once you've loaded MMM, move onto the next step.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo If you are missing the HBC or it is failing to load any apps (just blackscreens), you will need to launch MMM using another method.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%




If /i "%exploitnum%" GEQ "2" echo EXPLOITS>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo You only need to perform ONE of the following exploits>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo.>>"%Drive%"\%guidename%


If /i "%BB1%" EQU "*" goto:skipforwardersolution
If /i "%BB2%" EQU "*" goto:skipforwardersolution
echo Note: if this Wii was previously modified, and it still has a Forwarder Channel installed, you can use that to launch MMM instead of an exploit. Just save the boot.dol from the app you want to load (ie. SD:\apps\MMM\boot.dol) to the location used by your SPECIFIC Forwarder Channel (ie. SD:\apps\usbloader\boot.dol). Then start the channel and the app will load.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


if /i "%FIRMSTART%" EQU "o" echo Alternatively, you can update your Wii to v3.0-4.2 using a DISC (ie. NSMBW). Then repeat the ModMii Wizard using your new Firmware and then you will be able to use the BannerBomb Exploit (which does not require a specific disc to work)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo.>>"%Drive%"\%guidename%

if /i "%REGION%" EQU "U" goto:skipforwardersolution
if /i "%REGION%" EQU "E" goto:skipforwardersolution
if /i "%FIRMSTART%" EQU "o" echo WARNING: Online update to v4.3 makes Korean Wii's unhackable (unless it previously had HBC v1.0.7, BootMii as Boot2v4, or a forwarder channel installed.>>"%DRIVE%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo .>>"%Drive%"\%guidename%
:skipforwardersolution

goto:EXPLOITSNOW


:HMsolution2

::If /i "%BB2%" EQU "*" echo Run BannerBomb v2 by selecting the SD Card Button on the main system menu screen and choosing yes to load boot.dol/elf>>"%Drive%"\%guidename%
::If /i "%BB1%" EQU "*" echo Run BannerBomb v1 by going to Settings, Data Management, Channels, SD Card and choosing yes to load boot.dol/elf>>"%Drive%"\%guidename%
::echo Note: If it doesn't work for you, visit http://bannerbomb.qoid.us/ for more variations of either version of bannerbomb.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


echo %COUNT7%) INSTALL SOME IOSs USING Multi-Mod Manager (MMM)>>"%Drive%"\%guidename%
echo    ===============================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo In Multi-Mod Manager's main menu, Go down to select "WAD Manager".>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo If you cannot load your SD card, select "Load another IOS", then select IOS36.>>"%Drive%"\%guidename%
echo If the Wii was previously softmodded, try loading cIOS250 (or others like 202,222,223,224,236,249).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Now mark each of the following WADs for installation by navigating to each WAD and hitting +>>"%Drive%"\%guidename%
echo Alternatively, you can hold + to mark all the WADs in the list for installation.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%IOS30P60%" EQU "*" echo      * IOS30v16174(IOS60v6174[FS-ES-NP])>>"%Drive%"\%guidename%
if /i "%IOS31%" EQU "*" echo      * IOS31v3608>>"%Drive%"\%guidename%
if /i "%IOS33%" EQU "*" echo      * IOS33v3608>>"%Drive%"\%guidename%
if /i "%IOS34%" EQU "*" echo      * IOS34v3608>>"%Drive%"\%guidename%
if /i "%IOS35%" EQU "*" echo      * IOS35v3608>>"%Drive%"\%guidename%
if /i "%IOS36v3608%" EQU "*" echo      * IOS36v3608>>"%Drive%"\%guidename%
if /i "%IOS58%" EQU "*" echo      * IOS58v6176>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo After you've marked the above WADs, press 'A' twice to install them all.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Be careful not to install any additional wads that may have been previously saved in this folder (they may be safe, but I cannot say for sure).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


echo If any files fail to install properly, they will remain marked for installation, so just retry installing those files.>>"%Drive%"\%guidename%

echo Only move onto the next step after successfully installing the above WADs, but do NOT exit MMM.>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


echo %COUNT7%) INSTALL THE HOMEBREW CHANNEL (HBC)>>"%Drive%"\%guidename%
echo    ==================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo In MMM's main menu, select "App Manager" and then select the HackMii_Installer.>>"%Drive%"\%guidename%

echo Use the Hackmii Installer to fix/re-install the HBC. If you haven't done so already, you should also install BootMii as Boot2 (if possible).>>"%Drive%"\%guidename%


echo Once you've successfully reinstalled the HBC, you are finished with this guide.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


echo If you already exited MMM, you can load the HackMii_Installer from the Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo If the HBC is failing to load any apps (just blackscreens), instead launch MMM using the method described in Step 1, then in MMM's main menu, select "App Manager" and then select the HackMii_Installer.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo This will launch the HackMii Installer, use it to reinstall your Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

If /i "%BB1%" EQU "*" echo After you are done modding your Wii, in order to avoid having your Wii freeze when accessing the SD Card Menu, you should either delete the 'aktn' folder where  bannerbomb is saved (SD:\private\wii\title\aktn), or rename the entire 'private' folder.>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo .>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo After you are done modding your Wii, in order to avoid having your Wii freeze when accessing the SD Card Menu, you should either delete the 'aktn' folder where  bannerbomb is saved (SD:\private\wii\title\aktn), or rename the entire 'private' folder.>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo .>>"%Drive%"\%guidename%

GOTO:supportxflak



::--------------------------------------------USB-Loader Set-Up Guide------------------------------------------
:USBguide
set guidename=ModMiiGuide_USBLoaderSetup.txt

if /i "%FORMAT%" EQU "1" set FORMATNAME=FAT32
if /i "%FORMAT%" EQU "2" set FORMATNAME=NTFS
if /i "%FORMAT%" EQU "3" set FORMATNAME=Part FAT32 and Part NTFS
if /i "%FORMAT%" EQU "4" set FORMATNAME=WBFS
if /i "%FORMAT%" EQU "5" set FORMATNAME=Part FAT32 and Part WBFS


SET COUNT7=1
cls
if /i "%SETTINGS%" EQU "G" echo Generating Guide, please wait.
if /i "%SETTINGS%" NEQ "G" echo Generating Guide, please wait, your downloads will begin shortly.

if not exist "%Drive%" mkdir "%Drive%" >nul
if not exist "%Drive%"\%guidename% goto:norename
SET /a COUNT6=%COUNT6%+1
if exist "%Drive%"\ModMiiGuide_USBLoaderSetup%COUNT6%.txt goto:usbguide
move "%Drive%"\%guidename% "%Drive%"\ModMiiGuide_USBLoaderSetup%count6%.txt >nul
:norename

echo ModMii %currentversion% USB-Loader Setup Custom Guide>"%Drive%"\%guidename%
echo Generated on %DATE% - %TIME%>>"%Drive%"\%guidename%
echo Check for updates at tinyurl.com/ModMiiNow>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%





echo This Guide was generated using the following parameters:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%FORMAT%" EQU "4" goto:skip
if /i "%FORMAT%" EQU "5" goto:skip
echo                * External Hard Drive to be Formatted as %FORMATNAME%>>"%Drive%"\%guidename%
goto:skip2
:skip
echo                * External Hard Drive already Formatted as %FORMATNAME%>>"%Drive%"\%guidename%
:skip2
if /i "%USBFolder%" EQU "*" echo                * Download Configurable USB-Loader>>"%Drive%"\%guidename%
if /i "%FLOW%" EQU "*" echo                * Download WiiFlow>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo                * USB-Loader Settings and config files saved to USB Hard Drive>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo                * USB-Loader Settings and config files saved to SD Card>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo This software is not for sale. If you paid for this software or a "bundle" you have been scammed.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo THIS PACKAGE COMES WITH ABSOLUTELY NO WARRANTY, NEITHER STATED NOR IMPLIED.>>"%Drive%"\%guidename%
echo NO ONE BUT YOURSELF IS TO BE HELD RESPONSIBLE FOR ANY DAMAGE THIS MAY CAUSE TO YOUR NINTENDO WII CONSOLE!>>"%Drive%"\%guidename%
echo USE THIS AT YOUR OWN RISK!>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo IMPORTANT NOTES:>>"%Drive%"\%guidename%
echo ---------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo *cIOS(s) required to use USB-Loaders, if you are missing cIOS(s) run the ModMii Wizard function to softmod your Wii before setting up your USB-Loader and/or external Hard-Drive.>>"%Drive%"\%guidename%
echo *cIOS249 rev18 or higher required to use Hard Drives Formatted as FAT32 or NTFS (cIOS222 rev4 or higher also works, but you would need to download the 222 version of configurable usb-loader or modify your config.txt file for configurable USB-Loader)>>"%Drive%"\%guidename%
echo *Not all external hard drive's are compatible with the Wii, for a list of which USB Hard Drive's are compatible, see this webpage: http://wiki.gbatemp.net/wiki/USB_Devices_Compatibility_List>>"%Drive%"\%guidename%
echo *If you have questions, a more detailed guide can be found here: www.sites.google.com/site/completesg/>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



:USBGUIDESTEP1

if /i "%MENU1%" NEQ "W" goto:skip

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo ======================================================================================>>"%Drive%"\%guidename%
echo THE REST OF THE GUIDE IS PERFORMED ON YOUR COMPUTER IN ORDER TO SET UP YOUR USB-LOADER>>"%Drive%"\%guidename%
echo ======================================================================================>>"%Drive%"\%guidename%

:skip



if /i "%FORMAT%" NEQ "3" goto:skippartition
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) PARTITION AND FORMAT THE EXTERNAL HARD DRIVE>>"%Drive%"\%guidename%
echo    ============================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo If you have anything saved on the hard drive, you should back it up now as all the data will be lost once you complete this step.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Right-click 'My Computer' and select 'Manage', a new window will open, on left panel click 'Disk Management'.>>"%Drive%"\%guidename%
echo Right-click the drive you want to partition (make sure you select the right drive!), then select 'Delete Volume...'>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo On the lower half menu of the window, locate the unallocated space, right-click it, and select 'New Simple Volume...'>>"%Drive%"\%guidename%
echo Enter the 'volume size' you want your FAT32 partition to be, and click 'Next'.>>"%Drive%"\%guidename%
echo Choose a Drive letter for this partition, and click 'Next' (Make note of the drive letter, as it will be needed later)>>"%Drive%"\%guidename%
echo You will likely not be able to change the file system to FAT32 (it will only be an option if the volume size is under 32GB)>>"%Drive%"\%guidename%
echo If FAT32 isn't an option, select 'Do not format this volume', and click 'Next'>>"%Drive%"\%guidename%
echo (it doesn't matter if you format the volume because you are going to format it as FAT32 later on)>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%

echo On the lower half menu of the window, locate the remaining unallocated space (for the NTFS partition), right-click it, and select 'New Simple Volume....>>"%Drive%"\%guidename%
echo Click 'Next' (to format the all remaining space on the drive).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Choose a Drive letter for this partition, and click 'Next'.>>"%Drive%"\%guidename%
echo Ensure the file system is set to NTFS then name the partition/volume,>>"%Drive%"\%guidename%
echo You may optionally uncheck the 'Perform a quick format' box, click 'Next', then click 'Finish'.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

::-----FAT32 format on unformatted partition------
echo If you managed to format the first partition as FAT32, then you can skip the remainder of this step.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

::echo Launch WiiBackupManager.exe saved here:>>"%Drive%"\%guidename%
::if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::echo .>>"%Drive%"\%guidename%
::echo At the top of the WiiBackupManager window, navigate to: Tools--Format Drives...>>"%Drive%"\%guidename%
::echo Make sure you select the drive letter corresponding to the partition you want to format as FAT32.>>"%Drive%"\%guidename%
::echo Make sure the file system is set at FAT32 and the cluster size is 32KB, then click start.>>"%Drive%"\%guidename%






if /i "%PCSAVE%" EQU "Portable" goto:portableF32
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" NEQ "%ModMiipath:~0,2%" goto:portableF32
:skip

echo Launch FAT32 GUI Formatter from shortcuts on your Start Menu or Desktop>>"%Drive%"\%guidename%
goto:noportableF32

:portableF32
echo Launch FAT32_GUI_Formatter.exe saved here:>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\FAT32_GUI_Formatter\FAT32_GUI_Formatter.exe>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\FAT32_GUI_Formatter\FAT32_GUI_Formatter.exe>>"%Drive%"\%guidename%
:noportableF32



echo .>>"%Drive%"\%guidename%
echo Make sure you select the drive letter corresponding to the partition you want to format as FAT32.>>"%Drive%"\%guidename%
echo You may optionally uncheck the 'Quick Format' box, then click start.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



:skippartition


if /i "%FORMAT%" EQU "3" goto:skipformat
if /i "%FORMAT%" EQU "4" goto:skipcopytousb
if /i "%FORMAT%" EQU "5" goto:skipcopytousb

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) FORMAT THE EXTERNAL HARD DRIVE (if applicable)>>"%Drive%"\%guidename%
echo    ==============================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo First check if your drive needs to be formatted by checking the current Format\File-System of the drive.>>"%Drive%"\%guidename%
echo Open 'My Computer', right-click the external hard drive you want to use, then select 'properties'.>>"%Drive%"\%guidename%
echo Make note of the Drive Letter of the external hard drive as this will be important later.>>"%Drive%"\%guidename%
echo If the 'File-System' is already %FORMATNAME%, you can skip this step.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo If you have anything saved on the hard drive, you should back it up now as all the data will be lost once you format it.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%FORMAT%" EQU "2" goto:formatNTFS
::echo Launch WiiBackupManager.exe saved here:>>"%Drive%"\%guidename%
::if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::echo .>>"%Drive%"\%guidename%

::echo At the top of the WiiBackupManager window, navigate to: Tools--Format Drives...>>"%Drive%"\%guidename%
::echo Make sure you select the drive letter corresponding to the partition you want to format as FAT32.>>"%Drive%"\%guidename%
::echo Make sure the file system is set at FAT32 and the cluster size is 32KB, then click start.>>"%Drive%"\%guidename%


if /i "%PCSAVE%" EQU "Portable" goto:portableF32
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" NEQ "%ModMiipath:~0,2%" goto:portableF32
:skip

echo Launch FAT32 GUI Formatter from shortcuts on your Start Menu or Desktop>>"%Drive%"\%guidename%
goto:noportableF32

:portableF32
echo Launch FAT32_GUI_Formatter.exe saved here:>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\FAT32_GUI_Formatter\FAT32_GUI_Formatter.exe>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\FAT32_GUI_Formatter\FAT32_GUI_Formatter.exe>>"%Drive%"\%guidename%
:noportableF32


echo .>>"%Drive%"\%guidename%
echo Make sure you select the drive letter corresponding to your external hard drive.>>"%Drive%"\%guidename%
echo You may optionally uncheck the 'Quick Format' box, then click start.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

goto:notformatNTFS

:formatNTFS
::echo Launch WiiBackupManager.exe saved here:>>"%Drive%"\%guidename%
::if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::echo .>>"%Drive%"\%guidename%

::echo At the top of the WiiBackupManager window, navigate to: Tools--Format Drives...>>"%Drive%"\%guidename%
::echo Make sure you select the drive letter corresponding to the partition you want to format as NTFS.>>"%Drive%"\%guidename%
::echo Make sure the file system is set at NTFS, then click start.>>"%Drive%"\%guidename%

echo Right-click 'My Computer' and select 'Manage', a new window will open, on left panel click 'Disk Management'.>>"%Drive%"\%guidename%
echo Right-click the drive you want to format (make sure you select the right drive!), then select 'Format...'>>"%Drive%"\%guidename%
echo Select 'NTFS' as the File system to use and input a name for the Hard-Drive/Volume.>>"%Drive%"\%guidename%
echo You may optionally uncheck the 'Perform a quick format' box, then click 'OK', then click 'OK' again.>>"%Drive%"\%guidename%

:notformatNTFS


:skipformat


if /i "%USBCONFIG%" NEQ "USB" goto:skipcopytousb
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) COPY FILES TO HARD DRIVE>>"%Drive%"\%guidename%
echo    ========================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Copy everything inside the %DRIVEU% folder to the root of your FAT32 hard-drive\partition.>>"%Drive%"\%guidename%

:skipcopytousb



echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) MANAGE WII BACKUPS USING WII BACKUP MANAGER (OPTIONAL)>>"%Drive%"\%guidename%
echo    ======================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%


if /i "%PCSAVE%" EQU "Portable" goto:portableWBM
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" NEQ "%ModMiipath:~0,2%" goto:portableWBM
:skip

echo Launch WiiBackupManager from shortcuts on your Start Menu or Desktop>>"%Drive%"\%guidename%
goto:noportableWBM

:portableWBM
echo Launch WiiBackupManager.exe saved here:>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
:noportableWBM

echo .>>"%Drive%"\%guidename%

echo You can use this program to manage/transfer your electronic backups of Wii Games.>>"%Drive%"\%guidename%
echo It is very simple to use, but a detailed tutorial on using Wii Backup Manager can be found here:>>"%Drive%"\%guidename%
echo www.sites.google.com/site/completesg/backup-launchers/iso/wbfs-managers/wii-backup-manager>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Note: Original Wii Disc's cannot be read/copied by using a computer (unless you have one of the rare LG Drives that is capable of doing so)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo To copy ORIGINAL Wii Disc's, insert the disc into your Wii and...>>"%Drive%"\%guidename%
if /i "%USBFOLDER%" EQU "*" echo       - Launch Configurable USB-Loader, and hit the plus sign '+'.>>"%Drive%"\%guidename%
if /i "%LOADER%" EQU "ALL" echo         OR>>"%Drive%"\%guidename%
if /i "%FLOW%" EQU "*" echo       - Launch WiiFlow, go to page 2 of WiiFlow's Settings and select "Install", then select "Go".>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
if /i "%FORMAT%" EQU "2" echo Warning: Ripping to NTFS is VERY unstable, it is highly recommended to only add games to an NTFS hard drive using your computer.>>"%Drive%"\%guidename%
if /i "%FORMAT%" EQU "3" echo Warning: Ripping to NTFS is VERY unstable, it is highly recommended to only add games to an NTFS hard drive using your computer.>>"%Drive%"\%guidename%



if /i "%USBFOLDER%" NEQ "*" goto:skip
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) CONFIGURE/CUSTOMIZE CONFIGURABLE USB-LOADER (OPTIONAL)>>"%Drive%"\%guidename%
echo    ======================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo To Configure/Customize your USB-Loader, use the Configurator for Configurable USB-Loader found here:>>"%Drive%"\%guidename%

if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\usb-loader\CfgLoaderConfigurator.exe>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\usb-loader\CfgLoaderConfigurator.exe>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Optional: additional themes can be found here:>>"%Drive%"\%guidename%
echo http://wii.spiffy360.com/themes.php>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo * IMPORTANT NOTES ON DEFAULT SETTINGS:>>"%Drive%"\%guidename%
echo   ------------------------------------>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Two potentially dangerous features have been locked:>>"%Drive%"\%guidename%
echo      1) The ability to remove/delete games>>"%Drive%"\%guidename%
echo      2) the ability to format a hard drive.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo To unlock these features, while in the configurable USB-Loader menu, hold '1' for 5 seconds, then enter the password to unlock these features. The password is 'AAAA', you can change the password/settings by using the Configurator for Configurable USB-Loader. Hold '1' again for 5 seconds to lock the USB-Loader again (or it will lock automatically again once you exit the USB-Loader).>>"%Drive%"\%guidename%

:skip

if /i "%MENU1%" EQU "W" goto:AFTERMODDING

GOTO:supportxflak
