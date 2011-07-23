@echo off
setlocal

set ModMiipath=%cd%
set cygwin=nodosfilewarning

set currentversion=4.6.1
set agreedversion=
if exist settings.bat call settings.bat

::Update name is also used in the following update link http://nusad.googlecode.com/files/%UPDATENAME%
set UPDATENAME=ModMiiFrenchUpdate
if exist Updatetemp.bat attrib -h Updatetemp.bat
if exist Updatetemp.bat del updatetemp.bat>nul

if "%ModMiiInstallerpath%"=="" goto:notfreshinstall
if exist "%ModMiiInstallerpath%"\Updatetemp.bat attrib -h "%ModMiiInstallerpath%"\Updatetemp.bat
if exist "%ModMiiInstallerpath%"\Updatetemp.bat del "%ModMiiInstallerpath%"\Updatetemp.bat>nul
if exist "%ModMiiInstallerpath%"\%UPDATENAME%.bat attrib -h "%ModMiiInstallerpath%"\%UPDATENAME%.bat
if exist "%ModMiiInstallerpath%"\%UPDATENAME%.bat del "%ModMiiInstallerpath%"\%UPDATENAME%.bat>nul
:notfreshinstall


title=ModMii
mode con cols=85 lines=54
color 1f

::start /? to view the different "start" parameters
::Increase your dos box size with MODE.
::mode con lines=45
::mode con cols=xxx





::SET FILENAME=%~nx0 //this returns the name of the batch file running (doesn't work when packaged in an exe)
::SET PATHNAME=%0 //this returns the filename but also with absolute path



if exist skipscam.txt goto:DefaultSettings
if exist ipromisetodonate.txt goto:DefaultSettings

set warning=
echo                                       ModMii
echo                                      par XFlak
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] CE LOGICIEL N'EST PAS PAYANT.
echo.

if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 3 -w 1000> nul

echo           SI VOUS AVEZ PAYE POUR CE LOGICIEL OU OBTENU DANS UN PACKAGE PAYANT
echo                VOUS VOUS ETES FAIT AVOIR. DEMANDEZ A ETRE REMBOURSE.
echo.
echo.
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 5 -w 1000> nul
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] VOUS ETES RESPONSABLES DE VOS ACTES!
echo.
echo              CE PACKAGE EST LIVRE SANS GARANTIE, EXPLICITE OU IMPLICITE.
echo              VOUS SEUL POUVEZ ETRE TENU RESPONSABLE DES DOMMAGES CAUSES
echo                                 A VOTRE CONSOLE WII!
echo.

echo.
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 7 -w 1000> nul
echo.
echo                             Tapez la phrase "I Agree"
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 et appuyez sur \x22Entr\xe9e\x22 pour continuer.
echo.
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 7 -w 1000> nul
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Si vous n'arrivez pas \xe0 suivre ces instructions,
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 c'est que vous n'avez rien \xe0 faire dans le hack.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 5 -w 1000> nul

set /p warning=     Entrez votre choix ici: 


if /i "%warning%" EQU "skipscam" sfk echo -spat En ayant \x22skipscam.txt\x22 sauv\xe9 dans le m\xeame dossier que ModMii, il vous \xe9vitera l'avertissement au d\xe9marrage.>skipscam.txt
if /i "%warning%" EQU "skipscam" attrib +r +h +s skipscam.txt
if /i "%warning%" EQU "skipscam" goto:DefaultSettings

if /i "%warning%" EQU "ipromisetodonate" echo En ayant \x22ipromisetodonate.txt\x22 sauv\xe9 dans le m\xeame dossier que ModMii, il vous \xe9vitera l'avertissement au d\xe9marrage.>ipromisetodonate.txt
if /i "%warning%" EQU "ipromisetodonate" attrib +r +h +s ipromisetodonate.txt
if /i "%warning%" EQU "ipromisetodonate" goto:DefaultSettings


if /i "%warning%" EQU "I Agree" goto:skip
echo.
echo                           ModMii en cours de fermeture...
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

sfk echo -spat ModMii n\xe9cessite que .NET Framework 3.5 soit install\xe9
echo.

set FrameworkAttempt=0
:NETFRAMEWORK

SET /a FrameworkAttempt=%FrameworkAttempt%+1

if exist "temp\dotNetFx35setup.exe" goto:semiskip
sfk echo -spat T\xe9l\xe9chargement de l'installeur .NET Framework 3.5
echo.

start %ModMiimin%/wait wget -t 3 "http://download.microsoft.com/download/7/0/3/703455ee-a747-4cc8-bd3e-98a615c3aedb/dotNetFx35setup.exe"

::start %ModMiimin%/wait wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait "http://download.microsoft.com/download/7/0/3/703455ee-a747-4cc8-bd3e-98a615c3aedb/dotNetFx35setup.exe"

if not exist temp mkdir temp
if exist dotNetFx35setup.exe move /y dotNetFx35setup.exe temp\dotNetFx35setup.exe
:semiskip

echo Lancement de l'installeur, veuillez attendre la fin de l'installation...
echo.
start /wait temp\dotNetFx35setup.exe


if exist "%windir%\Microsoft.NET\Framework\v3.5" goto:skipframeworkinstallation

if /i "%FrameworkAttempt%" EQU "3" goto:GiveUpOnFramework

sfk echo -spat Installation echou\xe9e, nouvel essai...
echo.
echo.
goto:NETFRAMEWORK


:GiveUpOnFramework
echo.
echo.
echo.
sfk echo -spat L'installation de .NET Framework 3.5 a echou\xe9 plusieurs fois
echo Vous pouvez essayer d'installer .NET Framework 3.5 par le biais de Windows Update
echo.
echo ModMii ne pourra pas fonctionner correctement sans .NET Framework 3.5
sfk echo -spat Appuyez sur une touche pour lancer quand m\xeame ModMii...
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
echo                                       par XFlak
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Choisir une option:
echo.
sfk echo -spat \x20 \x20 \x20 W = Assistant ModMii (pour d\xe9marrer le hack de votre Wii!)
echo.
echo       U = USB-Loader Setup + Guide
echo.
sfk echo -spat \x20 \x20 \x20 H = Solutions HackMii (HBC \xe0 l'envers \x2f Fixer les IOS non vuln\xe9rables) \x2b Guide
echo.
sfk echo -spat \x20 \x20 \x20 S = Installation de SNEEK, r\xe9cup\xe9ration de Nand, extraction de jeux
echo.
echo.
sfk echo -spat \x20 \x20 \x20 1 = Page 1 T\xe9l\xe9chargement (Menus Syst\xe8me, IOSs, MIOSs, Cha\xeenes, etc.)
echo.
sfk echo -spat \x20 \x20 \x20 2 = Page 2 T\xe9l\xe9chargement (Apps, fichiers USB-Loader, CheatCodes, etc.)
echo.
sfk echo -spat \x20 \x20 \x20 3 = Page 3 T\xe9l\xe9chargement (Th\xe8mes Menu Syst\xe8me)
echo.
sfk echo -spat \x20 \x20 \x20 4 = Page 4 T\xe9l\xe9chargement (cIOSs, cMIOSs)
echo.
sfk echo -spat \x20 \x20 \x20 A = T\xe9l\xe9chargements avanc\xe9s personnalis\xe9s
echo.
If Exist download_queue.bat echo       L = Charger les fichiers en liste d'attente
If Exist download_queue.bat echo.
echo.
sfk echo -spat \x20 \x20 \x20 C = Cr\xe9er les fichiers de configuration pour BootMii, Wad Manager ou MMM
echo.
sfk echo -spat \x20 \x20 \x20 FC = Supprimer les fichiers devenus inutiles apr\xe8s le Hack
echo.
echo.
echo       O = Options
echo.
sfk echo -spat \x20 \x20 \x20 CR = Cr\xe9dits
echo.
echo       E = Sortie
echo.
echo  *********MORE INFO*********
echo.
sfk echo [RED] V = Visitez tinyurl.com/ModMiiNow pour toutes questions, commentaires ou voter
echo.
echo Utilisez l'assistant de ModMii pour configurer automatiquement votre carte SD avec
sfk echo -spat  le n\xe9cessaire pour hacker, upgrader/downgrader votre Wii et plus encore.
sfk echo -spat  Lors de l'utilisation de l'assistant, un guide personnalis\xe9 est fait en fonction des
sfk echo -spat  r\xe9ponses que vous aurez donn\xe9. Concr\xe8tement, lancez le programme, laissez le
sfk echo -spat  t\xe9l\xe9charger et vous obtiendrez les fichiers n\xe9cessaires au hack de votre Wii!
echo.
sfk echo -spat [RED] \x20 Les dons facultatifs peuvent \xeatre fait via paypal.com \xe0 XFlak40@hotmail.com
echo.
echo  ***************************
echo.
set /p MENU1=     Entrez votre choix ici: 


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
if /i "%MENU1%" EQU "encule" echo Vas te faire enculer trou du cul!
if /i "%MENU1%" EQU "fuck you" echo Vas te faire enculer trou du cul!
if /i "%MENU1%" EQU "pute" echo Je ne suis pas une pute, TU es une pute!
if /i "%MENU1%" EQU "chatte" sfk echo -spat Eh bien, vous \xeates ce que vous mangez ;)
if /i "%MENU1%" EQU "bite" sfk echo -spat Que pensez\x2dvous quand on vous traite de bite..?
if /i "%MENU1%" EQU "aide" echo Google est ton ami!
if /i "%MENU1%" EQU "decompiler" sfk echo -spat Tu r\xeaves l'ami!

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo                                     Remerciements
echo   *********************************************************************************
sfk echo -spat \x20 *Remerciements particuliers aux personnes suivantes, qui ont consacr\xe9 leur temps*
sfk echo -spat \x20 *\x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20\xe0 m'aider quand j'en avais besoin \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 *
echo   *    DeadlyFoez, cwstjdenobs, Leathl, Violator, WiiCrazy, Giantpune, WiiPower   *
echo   * diddy81, DaMysteryMan, pepxl, ChokeD, longtom1, tj_cool, mauifrog  and xzxero *
echo   *********************************************************************************
echo.
sfk echo -spat \x20 * Merci \xe0 mon cousin, Violator, qui m'a fait entrer en premier sur la scene Wii.
echo.
sfk echo -spat \x20 * DeadlyFoez pour avoir donne des id\xe9es sur ModMii.
echo.
echo   * Leathl pour libwiisharp, patchios, nusfilegrabber, showmiiwads, etc.
echo.
sfk echo -spat \x20 * cwstjdenobs pour la cr\xe9ation de YAWMM et toute son aide sur ModMii.
echo.
echo   * tj_cool, xzxero et burritoboy9984 (aka. Erik) pour leurs guides.
echo.
sfk echo -spat \x20 * Team Twiizers pour la cr\xe9ation du r\xe9volutionnaire HackMii Installer.
echo.
echo   * Waninkoko pour ses CIOS et autres homebrews tels que WAD manager.
echo.
sfk echo -spat \x20 * Hermes pour la cr\xe9ation de son efficace CIOS 222/223/224.
echo.
echo   * davebaol et xabby666 pour leur cIOS rev 21d2x EHCI module.
echo.
sfk echo -spat \x20 * Comex pour la cr\xe9ation de son exploit tres utilis\xe9 : Bannerbomb.
echo.
echo   * Crediar, Daco Taco et Phpgeek pour la protection anti brick avec le priiloader.
echo.
echo   * Arikado et la team Dop-Mii pour Dop-Mii.
echo.
echo   * WiiWu et la team Dop-Mii pour Multi-Mod Manager (MMM).
echo.
echo   * WiiNinja et WB3000 pour leur travail sur NUSD.
echo.
echo   * WiiPower pour Neogamma et le reste.
echo.
sfk echo -spat \x20 * WiiCrazy pour Crap (fabrication de cha\xeenes Forwarder) et Crazy Intro.
echo.
sfk echo -spat \x20 * WiiGator pour la cr\xe9ation de son Gamecube Backup Launcher.
echo.
echo   * oggzee, usptactical, gannon et Dr.Clipper pour le Configurable USB Loader.
echo.
echo   * Giantpune pour l'USB Loader GX et le reste.
echo.
echo   * Wiimm pour son Wiimms ISO Tools.
echo.
sfk echo -spat \x20 * diddy81 et symular syn de la Wii Theme Team pour leurs th\xe8mes captivants.
echo.
sfk echo -spat \x20 * Narolez pour son code NForwarder et FIX94 pour m'avoir aid\xe9 \xe0 le compiler.
echo.
sfk echo -spat \x20 \x2a WiiShizzza pour la nouvelle icone ModMii et pepxl pour la premi\xe8re.
echo.
echo   * mamule (F), xav91 (F), ketufe (F), Wasabi (I) et Step (I) pour la traduction.
echo.
echo   * Wii.py devs: Megazig, Omega, Xuzz, SquidMan, Matt_P et The Lemon Man.
echo.
sfk echo -spat \x20 * Daeken pour l'\xe9criture de Struct.py et marcan pour son code LZ77.
echo.
echo Appuyez sur une touche pour revenir au menu principal.
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
echo                                       par XFlak
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]Entrer l'option # (ou la lettre) pour activer/d\xe9sactiver
echo.
sfk echo -spat \x20 \x20 D   = Changer la lettre du lecteur (R\xe9glage actuel: %Drive%)
echo.
sfk echo -spat \x20 \x20 DU = Changer la lettre pour le support USB (R\xe9glage actuel: %DriveU%)
echo.
echo     CC = Options Cheat Code


echo.
sfk echo -spat \x20 \x20 PC = Emplacement de sauvegarde des programmes PC (R\xe9glage actuel: %PCSAVE%)
if /i "%PCSAVE%" EQU "Local" sfk echo -spat \x20 \x20 \x20 \x20 \x2a F32 Formatter et WiiBackupManager enregistr\xe9s sur %HomeDrive%
if /i "%PCSAVE%" EQU "Local" sfk echo -spat \x20 \x20 \x20 \x20 \x2a Raccourcis install\xe9s sur le Menu D\xe9marrer et Bureau

if /i "%PCSAVE%" EQU "Portable" sfk echo -spat \x20 \x20 \x20 \x20 \x2a Programmes enregistr\xe9s sur support mobile avec les param\xe8tres ci-dessus

if /i "%PCSAVE%" NEQ "Auto" goto:skip
sfk echo -spat \x20 \x20 \x20 \x20 \x2a Programmes PC enregistr\xe9s sur %homedrive% avec des raccourcis 
echo           si vous utilisez ModMii sur %homedrive%
sfk echo -spat \x20 \x20 \x20 \x20 \x2a Programmes PC enregistr\xe9s sur %homedrive% ne fonctionnent pas sur support mobile 
:skip

if /i "%PCSAVE%" NEQ "Auto" echo.

if /i "%ROOTSAVE%" EQU "ON" sfk echo -spat \x20 \x20 RS = Sauvegarde \xe0 la racine (activ\xe9)
if /i "%ROOTSAVE%" EQU "OFF" sfk echo -spat \x20 \x20 RS = Sauvegarde \xe0 la racine (d\xe9sactiv\xe9)
sfk echo -spat \x20 \x20 \x20 \x20 \x2a Sauvegarde IOSs\MIOSs \xe0 la racine au lieu du dossier wad
echo         * Ne modifie pas les IOSs\MIOSs
sfk echo -spat \x20 \x20 \x20 \x20 \x2a Utile pour les homebrews Wii qui n\xe9cessitent des IOS/MIOS
sfk echo -spat \x20 \x20 \x20 \x20 \x20 plac\xe9s \xe0 la racine
echo.


if /i "%OPTION1%" EQU "OFF" echo     1 = Ne pas garder les dossiers 00000001 ou NUS pour IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "OFF" sfk echo -spat \x20 \x20 \x20 \x20 \x2a Dossiers quelques fois n\xe9cessaires pour une utilisation hors ligne de 
if /i "%OPTION1%" EQU "OFF" echo           certaines applis Wii
if /i "%OPTION1%" EQU "ON" echo     1 = Garder le dossier 00000001 pour IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "ON" echo         * Utile pour une utilisation hors ligne d'applis Wii comme Dop-Mii

if /i "%OPTION1%" EQU "NUS" echo     1 = Garder le dossier NUS0000001000000##v# pour IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "NUS" echo         * Utile pour une utilisation hors ligne d'applis Wii comme les installeurs
if /i "%OPTION1%" EQU "NUS" echo           de cIOS d2x / Hermes

if /i "%OPTION1%" EQU "ALL" echo     1 = Garder les dossiers NUS0000001000000##v# et 00000001 pour IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "ALL" echo         * Utile pour une utilisation hors ligne de quelques applis Wii


echo.
sfk echo -spat \x20 \x20 U = Mise \xe0 jour des IOSs.
if /i "%ACTIVEIOS%" EQU "OFF" sfk echo -spat \x20 \x20 \x20 \x20 Assistant de t\xe9l\xe9chargement des IOS actifs (d\xe9sactiv\xe9)
if /i "%ACTIVEIOS%" EQU "ON" sfk echo -spat \x20 \x20 \x20 \x20 Assistant de t\xe9l\xe9chargement des IOS actifs (activ\xe9)
echo.
if /i "%OPTION36%" EQU "OFF" sfk echo -spat \x20 \x20 36 = Ajouter l'IOS36v3608 dans le Guide ModMii (d\xe9sactiv\xe9)
if /i "%OPTION36%" EQU "ON" sfk echo -spat \x20 \x20 36 = Ajouter l'IOS36v3608 dans le Guide ModMii (activ\xe9)
sfk echo -spat \x20 \x20 \x20 \x20 \x2a Votre IOS36 actuel peut \xeatre patch\xe9. Pas l'IOS36 t\xe9l\xe9charg\xe9
echo.

if /i "%CMIOSOPTION%" EQU "OFF" sfk echo -spat \x20 \x20 CM = Ajouter le cMIOS dans le Guide ModMii (d\xe9sactiv\xe9)
if /i "%CMIOSOPTION%" EQU "ON" sfk echo -spat \x20 \x20 CM = Ajouter le cMIOS dans le Guide ModMii (activ\xe9)
echo         * Un cMIOS permet de lire des backups GameCube 
echo.


if /i "%ModMiiverbose%" EQU "off" sfk echo -spat \x20 \x20 V = Sortie console optimis\xe9e quand ModMii utilise wget (d\xe9sactiv\xe9)
if /i "%ModMiiverbose%" EQU "on" sfk echo -spat \x20 \x20 V = Sortie console optimis\xe9e quand ModMii utilise wget (activ\xe9)
echo.

if /i "%sneekverbose%" EQU "off" sfk echo -spat \x20 \x20 SV = Sortie console SNEEK (d\xe9sactiv\xe9)
if /i "%sneekverbose%" EQU "on" sfk echo -spat \x20 \x20 SV = Sortie console SNEEK (activ\xe9)
echo.

if /i "%SNKFONT%" EQU "W" echo     F = Couleur Font.bin pour SNEEK+DI/UNEEK+DI (BLANC)
if /i "%SNKFONT%" EQU "B" echo     F = Couleur Font.bin pour SNEEK+DI/UNEEK+DI (NOIR)
echo.


if /i "%HEXEDIT%" EQU "Y" sfk echo -spat \x20 \x20 H = Edition hexa des signatures de cIOS et cIOS Common key cor\xe9enne (activ\xe9)
if /i "%HEXEDIT%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x2a Recommand\xe9! Modifiez uniquement si votre PC ne peut \xe9diter en hexa les
if /i "%HEXEDIT%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 cIOSs correctement, m\xeame apr\xe8s avoir effectu\xe9 les mises \xe0 jour Windows
if /i "%HEXEDIT%" EQU "N" sfk echo -spat \x20 \x20 H = Edition hexa signatures de cIOS et cIOS Common key Cor\xe9enne (d\xe9sactiv\xe9)
if /i "%HEXEDIT%" EQU "N" echo         * ModMii ne validera pas les cIOSs mais ils devraient fonctionner
if /i "%HEXEDIT%" EQU "N" sfk echo -spat \x20 \x20 \x20 \x20 \x2a Les loaders seront incapables de d\xe9tecter la version du cIOS install\xe9
if /i "%HEXEDIT%" EQU "N" echo         * L'option "Block IOS Reload = AUTO" ne fonctionnera pas avec CFG et GX
if /i "%HEXEDIT%" EQU "N" sfk echo -spat \x20 \x20 \x20 \x20 \x2a  Les Wii non-Cor\xe9ennes ne seront pas en mesure de charger des jeux Cor\xe9ens
if /i "%HEXEDIT%" EQU "S" sfk echo -spat \x20 \x20 H = Edition hexa des signatures de cIOS mais pas des cIOS Common key cor\xe9enne
if /i "%HEXEDIT%" EQU "S" echo         * ModMii ne validera pas les cIOSs mais ils devraient fonctionner
if /i "%HEXEDIT%" EQU "S" echo         * L'option "Block IOS Reload = AUTO" ne fonctionnera pas avec CFG et GX
if /i "%HEXEDIT%" EQU "S" sfk echo -spat \x20 \x20 \x20 \x20 \x2a  Les Wii non-cor\xe9ennes ne seront pas en mesure de charger des jeux cor\xe9ens
if /i "%HEXEDIT%" EQU "K" sfk echo -spat \x20 \x20 H = Edition hexa des cIOS Common key cor\xe9enne mais pas des signatures de cIOS
if /i "%HEXEDIT%" EQU "K" echo         * ModMii ne validera pas les cIOSs mais ils devraient fonctionner
if /i "%HEXEDIT%" EQU "K" sfk echo -spat \x20 \x20 \x20 \x20 \x2a  Les loaders seront incapables de d\xe9tecter la version du cIOS install\xe9
echo.


if not exist "%DRIVE%" goto:nodrivefolder
sfk echo -spat \x20 \x20 \x20 \x20 C = Cr\xe9er le fichier Custom.md5 pour tout v\xe9rifier
echo               Wads, dols, elfs et apps dans %DRIVE%
if exist Custom.md5 echo          C2 = Comparer le fichier dans %DRIVE% avec Custom.md5
:nodrivefolder
if exist Custom.md5 echo          C3 = Effacer Custom.md5
if /i "%AUTOUPDATE%" EQU "OFF" sfk echo -spat \x20 \x20 A = Mise \xe0 jour de ModMii au d\xe9marrage (d\xe9sactiv\xe9)
if /i "%AUTOUPDATE%" EQU "ON" sfk echo -spat \x20 \x20 A = Mise \xe0 jour de ModMii au d\xe9marrage (activ\xe9)
echo.
sfk echo -spat \x20 \x20 N = V\xe9rifier les nouvelles versions de ModMii maintenant
echo.
sfk echo -spat \x20 S=Enregistrer les param\xe8tres\x20 R=Restaurer les param\xe8tres d\xe9faut\x20 M=Menu principal
echo.
set /p OPTIONS=     Entrez votre choix ici: 


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


echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
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
if exist settings.bat sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Param\xe8tres enregistr\xe9s.
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
echo                                       par XFlak
echo.
echo.
echo                                  OPTIONS CHEATS CODE 
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 R = T\xe9l\xe9charger des codes pour la r\xe9gion: (%cheatregion%)
echo.
if /i "%overwritecodes%" EQU "OFF" sfk echo -spat \x20 \x20 \x20 \x20 O = Ecrire les txtcodes par dessus les existants (d\xe9sactiv\xe9)
if /i "%overwritecodes%" EQU "ON" sfk echo -spat \x20 \x20 \x20 \x20 O = Ecrire les txtcodes par dessus les existants (activ\xe9)
echo.
if /i "%cheatlocation%" EQU "B" echo         L = Emplacement(s) de sauvegarde des cheats: (1 et 2)
if /i "%cheatlocation%" EQU "T" echo         L = Emplacement(s) de sauvegarde des cheats: (1: txtcodes)
if /i "%cheatlocation%" EQU "C" echo         L = Emplacement(s) de sauvegarde des cheats: (2: codes\X\L)
sfk echo -spat \x20 \x20 \x20 \x20 \x20 1: - txtcodes: Emplacement utilis\xe9 par la plupart des apps,
echo                           comme CFG USB-Loader
sfk echo -spat \x20 \x20 \x20 \x20 \x20 2: - codes\X\L\: Emplacement utilis\xe9 par Accio Hacks
echo                   X = Lettre de l'ID de la console (ie. Wii = R)
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 L = 1\xe8re lettre du titre du jeu ('#' s'il commence par un chiffre)
echo.
sfk echo -spat \x20 \x20 \x20 Console de s\xe9lection ou d\xe9s\xe9lection de t\xe9l\xe9chargement des cheats pour:
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 La console s\xe9lectionn\xe9e est en vert [Green]
echo.
echo.
if /i "%wiicheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]1 = Wii) else (echo                 1 = Wii)
if /i "%WiiWarecheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]2 = WiiWare) else (echo                 2 = WiiWare)

::if /i "%VCArcadecheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]3 = VC Arcade)  else (echo                 3 = VC Arcade)
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]3 = VC Arcade (d\xe9sactiv\xe9 \xe0 cause d'une erreur geckocodes.org)

if /i "%WiiChannelscheat%" EQU "ON" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]4 = cha\xeenes Wii)  else (echo                 4 = Chaines Wii)
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
echo                 A = Tout
echo                 C = Effacer
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 S = Sauvegarde des param\xe8tres
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 D = Param\xe8tres des Cheat par d\xe9faut
echo.
echo                 B = Retour
echo                 M = Menu principal
echo.
echo.
set /p cheatoption=     Entrez votre choix ici: 



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


echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
echo.
echo   Choisissez la destination d'enregistrement des fichiers

::the below msg is only for people building a nand
if /i "%SNEEKSELECT%" EQU "2" goto:donotskip
if /i "%SNEEKSELECT%" EQU "3" (goto:donotskip) else (goto:skip)
:donotskip
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 Note: les wads install\xe9s sur une NAND \xe9mul\xe9e seront \xe9galement enregistr\xe9s ici
sfk echo -spat \x20 \x20 \x20 \x20 Il n'y aura donc plus besoin de les re-t\xe9l\xe9charger si vous remontez une Nand
:skip

echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 R\xe9glage actuel:   %Drive%
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 Notes:* Pour continuer avec le r\xe9glage actuel, appuyez sur \x22entr\xe9e\x22
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 * Vous pouvez utiliser le glisser/d\xe9poser du dossier
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 dans cette fen\xeatre pour ne pas avoir \xe0 le faire manuellement
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 * Si vous continuez \xe0 rencontrer des erreurs, essayez d'utiliser
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 les param\xe8tres par d\xe9faut
echo.
echo.
echo.
echo         EXEMPLES
echo.
echo.
echo            L:
echo.
echo            %%userprofile%%\Desktop\COPY_TO_SD
echo                 Note: %%userprofile%% raccourci ne fonctionnant pas sous Windows XP
echo.
echo            ModMii\4.2U
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Note: cr\xe9e les dossiers ModMii\4.2U ou le programme a \xe9t\xe9 sauvegard\xe9
echo.
echo            C:\Users\XFlak\Desktop\New Folder
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 D = R\xe9glage par defaut: COPY_TO_SD
echo.
echo.
echo         B = Retour
echo.
echo         M = Menu principal
echo.
echo.
set /p Drivetemp=     Entrez votre choix ici: 


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
sfk echo -spat %DRIVETEMP:~0,2% n'existe pas, merci d'essayer \xe0 nouveau...
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
echo                                       par XFlak
echo.
echo.
echo.
echo   Choisissez la destination d'enregistrement des fichiers pour votre disque dur USB
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 R\xe9glage actuel:   %DriveU%
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 Notes:* Pour continuer avec le r\xe9glage actuel, appuyez sur \x22entr\xe9e\x22
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 * Vous pouvez utiliser le glisser/d\xe9poser du dossier
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 dans cette fen\xeatre pour ne pas avoir \xe0 le faire manuellement
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 * Si vous continuez \xe0 rencontrer des erreurs, essayez d'utiliser
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 les param\xe8tres par d\xe9faut
echo.
echo.
echo.
echo         EXEMPLES
echo.
echo.
echo            L:
echo.
echo            %%userprofile%%\Desktop\COPY_TO_SD
echo                  Note: %%userprofile%% raccourci ne fonctionnant pas sous Windows XP
echo.
echo            ModMii\4.2U
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Note: cr\xe9e les dossiers ModMii\4.2U ou le programme a \xe9t\xe9 sauvegard\xe9
echo.
echo            C:\Users\XFlak\Desktop\New Folder
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 D = R\xe9glage par defaut: COPY_TO_SD
echo.
echo.
echo         B = Retour
echo.
echo         M = Menu principal
echo.
echo.
set /p DriveUtemp=     Entrez votre choix ici: 


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
sfk echo -spat %DRIVEUTEMP:~0,2% n'existe pas, merci d'essayer \xe0 nouveau...
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
echo                                       par XFlak
echo.
echo.
echo                                Version actuelle %CurrentVersion%
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Contr\xf4le des mises \xe0 jour...
echo.

if exist list.bat del list.bat>nul

start %ModMiimin%/wait wget "http://code.google.com/p/nusad/downloads/list?can=3&q=&colspec=Filename+Summary+Uploaded+ReleaseDate+Size+DownloadCount"

if exist list* (move /y list* list.bat>nul) else (goto:updatefail)
sfk filter -quiet "list.bat" -+"%UPDATENAME%" -rep _".txt*"__ -rep _"*%UPDATENAME%-"_"set newversion="_ -rep _" </a>*"__ -write -yes
sfk filter "list.bat" -unique -write -yes>nul
call list.bat
del list.bat>nul

if %currentversion% GTR %newversion:~0,5% (echo                           Tu as une nouvelle beta de merde!) & (echo.) & (@ping 127.0.0.1 -n 4 -w 1000> nul) & (goto:menu)

::before %updatename% is called %newversion% can be more than 5 chars (ie. 4.6.0.1)
if %currentversion% EQU %newversion% (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Cette version est \xe0 jour) & (@ping 127.0.0.1 -n 4 -w 1000> nul) & (goto:menu)

::if %newversion% has exactly 5 chars (#.#.#), get changelog and update
if "%newversion:~5%"=="" goto:getchangelog

::only make it this far if newversion is greater than current version (ie. not beta shit) and has >5 chars (ie. #.#.#.#). Now check if DL DB needs to be updated (ie. partial update)
set NEWDBUPDATEVERSION=%newversion%
set DBUPDATEVERSION=none
if exist temp\DBUPDATE%newversion:~0,5%.bat call temp\DBUPDATE%newversion:~0,5%.bat
if %NEWDBUPDATEVERSION% EQU %DBUPDATEVERSION% (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Cette version est \xe0 jour) & (@ping 127.0.0.1 -n 4 -w 1000> nul) & (goto:menu)


:getchangelog
start %ModMiimin%/wait wget http://nusad.googlecode.com/files/%UPDATENAME%-%newversion%.txt
if not exist %UPDATENAME%-%newversion%.txt goto:updatefail

ren %UPDATENAME%-%newversion%.txt %UPDATENAME%.bat
call %UPDATENAME%.bat

set newversion=%newversion:~0,5%
if %currentversion% GEQ %newversion% (goto:menu) else (exit)

:updatefail
sfk echo -spat \x20  Echec du contr\xf4le des mises \xe0 jour, v\xe9rifier votre connexion internet ainsi que les r\xe9glages du firewall.
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
echo                                       par XFlak
echo.
echo.
echo                                 NETTOYAGE DES FICHIERS
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Aucun fichier inutile pr\xe9sent dans %DRIVE%
echo.
echo.
echo.
echo                               Retour au menu principal...
echo.

@ping 127.0.0.1 -n 4 -w 1000> nul
goto:MENU





:FileCleanup2
set clean=
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo                                NETTOYAGE DES FICHIERS
echo.
echo                        Lorsque vous avez fini de hacker votre Wii,
echo                vous pouvez effacer certains fichiers pour gagner de la place
echo                  et vous assurez que personnes ne pourra lancer des applis
echo                               dangereuses sur votre Wii.
echo.
sfk echo -spat \x20 Note: au lieu de supprimer des fichiers, vous pouvez les d\xe9placer dans un dossier
sfk echo -spat \x20 \x20 \x20 \x20 \x20  non accessible par l'HBC (t\xe9l\xe9chargeable via PAGE 2 TELECHARGEMENT).

echo.
echo.
sfk echo -spat \x20  Souhaitez\x2dvous supprimer les fichiers suivants %DRIVE%?
echo.
if exist "%DRIVE%"\WAD echo          * dossier WAD
if exist "%DRIVE%"\00000001 echo          * dossier 00000001
if exist "%DRIVE%"\00010008 echo          * dossier 00010008
if exist "%DRIVE%"\00010002 echo          * dossier 00010002
if exist "%DRIVE%"\00010001 echo          * dossier 00010001
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
if exist "%DRIVE%"\*.dol sfk echo -spat \x20 \x20 \x20 \x20 \x20  * dol's situ\xe9s \xe0 la racine du p\xe9riph\xe9rique
if exist "%DRIVE%"\*.elf sfk echo -spat \x20 \x20 \x20 \x20 \x20  * elf's situ\xe9s \xe0 la racine du p\xe9riph\xe9rique
if exist "%DRIVE%"\*.wad sfk echo -spat \x20 \x20 \x20 \x20 \x20  * wad's situ\xe9s \xe0 la racine du p\xe9riph\xe9rique
if exist "%DRIVE%"\*.md5 sfk echo -spat \x20 \x20 \x20 \x20 \x20  * md5's situ\xe9s \xe0 la racine du p\xe9riph\xe9rique
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 Note: Tous les fichiers ci\x2ddessus, \xe0 l'exception de vos propres WADs,
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 peuvent \xeatre r\xe9cuper\xe9s par la suite avec ModMii
echo.
echo.
echo.
echo                Y = Oui, effacer tous les fichiers
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
set /p clean=     Entrez votre choix ici: 
if /i "%clean%" EQU "Y" goto:cleannow
if /i "%clean%" EQU "N" goto:MENU
if /i "%clean%" EQU "B" goto:MENU
if /i "%clean%" EQU "M" goto:MENU
echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:FileCleanup

:cleannow
set clean2=
echo.
echo.
echo.
sfk echo -spat \x20 Etes\x2dvous sur de vouloir supprimer d\xe9finitivement les fichiers ci\x2ddessus? (Y/N)
echo.
set /p clean2=     Entrez votre choix ici: 
if /i "%clean2%" EQU "Y" goto:cleannow3
if /i "%clean2%" EQU "N" goto:MENU
echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:FileCleanup

:cleannow3



cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo                                NETTOYAGE DES FICHIERS...
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


echo                                    FICHIERS EFFACES
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
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Assistant d'enregistrement des param\xe8tres !
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 Souhaitez\x2dvous lancer l'assistant d'enregistrement des param\xe8tres maintenant?
echo.
echo.
echo.
sfk echo -spat \x20 Note: Vous pourrez visualiser et confirmer les s\xe9lections avant de lancer le t\xe9l\xe9chargement
echo               
echo.
echo.
echo.
echo               Y = Oui, charger Wizard_Settings.bat
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20  N = Non, continuer avec l'assistant de t\xe9l\xe9chargement
echo.
echo               D = Effacer Wizard_Settings.bat pour ne plus voir cette page
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \xe0 l'avenir et continuer avec l'assistant de t\xe9l\xe9chargement
echo.
echo               B = Retour
echo               M = Menu Principal
echo.
echo.
echo.
echo.
set /p LoadWizSettings=     Entrez votre choix ici: 


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

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
echo       Est-ce que votre Wii est vierge?
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 ( ie. sans hack / non modifi\xe9e / nouvelle / juste achet\xe9e )
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 Note: R\xe9pondre \x22Oui\x22 meme si votre Wii n'est pas vierge afin d'upgrader 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 tous les hacks de votre Wii (hacker \xe0 nouveau votre Wii)
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 Y = Oui, t\xe9l\xe9charger tous les fichiers n\xe9cessaires au hack ou re-hack
echo               N = Non
echo.
echo               B = Retour
echo               M = Menu principal
echo.
echo.
echo.
echo.
set /p VIRGIN=     Entrez votre choix ici: 


if exist Wizard_Settings.bat goto:backtoloadwiz
if /i "%VIRGIN%" EQU "B" goto:MENU
:backtoloadwiz
if /i "%VIRGIN%" EQU "B" goto:LoadWizardSettings

if /i "%VIRGIN%" EQU "M" goto:MENU
if /i "%VIRGIN%" EQU "Y" goto:WPAGE2
if /i "%VIRGIN%" EQU "N" goto:WPAGE2

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE1

::...................................Wizard Page2 - Current Firmware...............................
:WPAGE2
set FIRMSTART=

set backb4HACKMIISOLUTION=WPAGE2


cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
if /i "%MENU1%" EQU "H" echo                                  Solutions HackMii 
if /i "%MENU1%" EQU "H" echo.
echo         Quelle est la version du firmware de votre Wii?
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 Note: pour le v\xe9rifier, allumez votre wii, cliquez sur le bouton 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 en bas \xe0 gauche du menu, cliquez sur param\xe8tres Wii,
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 vous verrez la version du firmware en haut \xe0 droite de votre \xe9cran.
echo               (ie. 4.2U, 4.1J, 3.2E, etc.)

if /i "%VIRGIN%" EQU "N" goto:skipnote
echo.
echo         Note: si le firmware actuel est v2.2 ou moins, vous devrez utiliser un
echo               autre exploit [ie. Twilight Hack (U/E/J), Smash Stack (U/J)
echo               ou Indiana Pwns (U/E)] au lieu de BannerBomb.
echo.
:skipnote
echo.
echo.
echo.
echo                 4.3 = 4.3
echo                 4.2 = 4.2
echo                 4.1 = 4.1
echo                 4.0 = 4.0
echo                 3.X = 3.0 - 3.5
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20  O = Autre (inf\xe9rieur \xe0 2.2)
echo.
echo                 B = Retour
echo                 M = Menu Principal
echo.
echo.
echo.
echo.

set /p FIRMSTART=     Entrez votre choix ici: 




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
echo vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20  Quelle est la r\xe9gion de votre Wii?
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20  Note: pour le v\xe9rifier, allumez votre wii, cliquez sur le bouton 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 en bas \xe0 gauche du menu, cliquez sur param\xe8tres Wii,
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 vous verrez la version du firmware en haut \xe0 droite de votre \xe9cran.
echo               (ie. 4.2U, 4.1J, 3.2E, etc.)
echo.
if /i "%MENU1%" EQU "H" sfk echo -spat \x20 \x20 \x20 \x20  Note: si vous avez chang\xe9 de r\xe9gion, indiquez la r\xe9gion actuelle
if /i "%MENU1%" EQU "H" goto:skipmessage
sfk echo -spat \x20 \x20 \x20 \x20  Note: si vous avez chang\xe9 de r\xe9gion mais que votre r\xe9gion d'origine
sfk echo -spat \x20 \x20 \x20 \x20  n'est pas cor\xe9enne, indiquer la r\xe9gion actuelle.
echo.
sfk echo -spat \x20 \x20 \x20 \x20  Note: si vous n'\xeates pas sur que votre r\xe9gion d'origine est cor\xe9enne, vous
sfk echo -spat \x20 \x20 \x20 \x20  pouvez controler son num\xe9ro de s\xe9rie. Les cor\xe9ennes commencent par \x22LK\x22.
:skipmessage
echo.
echo.

echo               U = USA
echo               E = Euro (PAL)
echo               J = JAP
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 K = Cor\xe9enne
if /i "%MENU1%" NEQ "H" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 RC = la r\xe9gion a chang\xe9 (de cor\xe9enne vers une autre r\xe9gion)

echo.
echo.


if /i "%FIRMSTART%" NEQ "O" goto:skipupdatewarning
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] Note aux utilisateurs de Wii cor\xe9enne:
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] Si vous effectuez une mise \xe0 jour en ligne vers 4.3 vous
sfk echo -spat \x20 \x20 \x20 \x20 [Red] aurez besoin d'une copie cor\xe9enne de Super Smash Bros Brawl
sfk echo -spat \x20 \x20 \x20 \x20 [Red] pour hacker votre Wii
echo.
:skipupdatewarning



if /i "%VIRGIN%" NEQ "Y" goto:SkipOtherRegions
if /i "%FIRMSTART%" EQU "4.3" echo.
if /i "%FIRMSTART%" EQU "4.3" echo.
if /i "%FIRMSTART%" EQU "4.3" sfk echo -spat \x20 \x20 \x20 \x20 [Red] Note aux utilisateurs de Wii cor\xe9enne:
if /i "%FIRMSTART%" EQU "4.3" echo.
if /i "%FIRMSTART%" EQU "4.3" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Les Wii vierges 4.3 cor\xe9ennes ne peuvent \xeatre hack\xe9es
if /i "%FIRMSTART%" EQU "4.3" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] qu'avec une copie cor\xe9enne de Super Smash Bros Brawl

:SkipOtherRegions

echo.
echo.
echo               B = Retour
echo               M = Menu principal
echo.
echo.

set /p REGION=     Entrez votre choix ici: 

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

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE3

::...................................Wizard Page3B - REGION CHANGED KOREAN...............................
:WPAGE3B
set REGIONCHANGE=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 En quelle region avez-vous chang\xe9 votre Wii?
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20  Note: pour le v\xe9rifier, allumez votre Wii, cliquez sur le bouton 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20  en bas \xe0 gauche du menu, cliquez sur r\xe9glages Wii,
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20  vous verrez la version du firmware en haut \xe0 droite de votre \xe9cran.
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
echo                B = Retour
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p REGIONCHANGE=     Entrez votre choix ici: 

if /i "%REGIONCHANGE%" EQU "u" set REGIONCHANGE=U
if /i "%REGIONCHANGE%" EQU "e" set REGIONCHANGE=E
if /i "%REGIONCHANGE%" EQU "j" set REGIONCHANGE=J

if /i "%REGIONCHANGE%" EQU "M" goto:MENU
if /i "%REGIONCHANGE%" EQU "B" goto:WPAGE3
if /i "%REGIONCHANGE%" EQU "U" goto:WPAGE3C
if /i "%REGIONCHANGE%" EQU "E" goto:WPAGE3C
if /i "%REGIONCHANGE%" EQU "J" goto:WPAGE3C

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
if /i "%MENU1%" NEQ "H" sfk echo -spat \x20 \x20  Vous devez poss\xe9der un des jeux originaux ci\x2ddessous pour hacker votre Wii
if /i "%MENU1%" EQU "H" sfk echo -spat \x20 \x20  Si votre homebrew channel ne peut pas charger les applis correctement,
if /i "%MENU1%" EQU "H" sfk echo -spat \x20 \x20  vous devrez avoir un des jeux suivants pour r\xe9soudre le probl\xe8me.
echo.
echo     Indiquez le jeu que vous allez utiliser:
echo.
echo.
echo.
echo.
echo               S = Super Smash Bros Brawl
if /i "%REGION%" NEQ "K" echo               L = LEGO Indiana Jones
if /i "%REGION%" NEQ "K" echo              LB = LEGO Batman
if /i "%REGION%" NEQ "K" echo              LS = LEGO Star Wars
if /i "%REGION%" NEQ "K" echo               Y = Yu-Gi-Oh! 5D's
if /i "%REGION%" NEQ "K" echo             TOS = Tales of Symphonia: Dawn of the New World


if /i "%FIRMSTART%" EQU "o" echo               T = Twilight Princess: The Legend of Zelda
if /i "%FIRMSTART%" EQU "o" echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 ? = dans le doute, t\xe9l\xe9chargez\x2dles tous et d\xe9cidez plus tard
echo.
echo.
echo.
echo.


if /i "%FIRMSTART%" NEQ "o" goto:skipOmsg
sfk echo -spat \x20 [Red] Remarques importantes:
echo.


sfk echo -spat \x20 Vous pouvez aussi utiliser un DVD de jeu pour mettre \xe0 jour en v3.0-4.2 (ie. NSMBW)
sfk echo -spat \x20 puis r\xe9p\xe9tez l'assistant de t\xe9l\xe9chargement en utilisant votre nouveau firmware afin
sfk echo -spat \x20 de hacker votre Wii sans utiliser l'un des jeux ci\x2ddessus
echo.
echo.

sfk echo -spat \x20 [Red] ATTENTION: passer en 4.3 par internet n\xe9cessitera l'un des jeux ci\x2ddessus
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 [Red] (\xe0 l'exception de Twilight Princess) pour hacker votre Wii


echo.
echo.

:skipOmsg

echo.
echo.
echo.
echo.
echo.
echo               B = Retour
echo               M = Menu Principal
echo.
echo.
echo.
echo.
set /p EXPLOIT=     Entrez votre choix ici: 

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

echo Vous avez saisi une valeur incorrecte
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
sfk echo -spat \x20 \x20  Souhaitez\x2dvous t\xe9l\xe9charger les derniers IOS actifs?
echo.
echo.
echo.
echo         N = Non
echo.
sfk echo -spat \x20 \x20  Vous avez le Menu Syst\xe8me 4.3, alors vous avez probablement
sfk echo -spat \x20 \x20  d\xe9j\xe0 les derniers IOS. 
sfk echo -spat \x20 \x20  Si votre Wii n'a vraiment jamais \xe9t\xe9 modifi\xe9e avant, vous pouvez dire Non.
echo.
echo.
echo         Y = Oui
echo.
sfk echo -spat \x20 \x20  Si votre Wii a un DarkCorp/cIOSCorp d'install\xe9, vous pouvez dire Oui
sfk echo -spat \x20 \x20  pour l'\xe9craser.
echo.
sfk echo -spat \x20 \x20  Si vos disques originaux Wii ou WiiWare ne fonctionnent pas correctement,
sfk echo -spat \x20 \x20  s\xe9lectionnez Oui pour fixer ce probl\xe8me.
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
echo         B = Retour
echo         M = Menu principal
echo.
echo.
echo.
echo.
set /p UpdatesIOSQ=     Entrez votre choix ici: 

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



echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE3D






::...................................Wizard Page4 - New Firmware...............................
:WPAGE4
if /i "%MENU1%" EQU "H" goto:HACKMIISOLUTION
set FIRM=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo     Choisissez le nouveau firmware pour upgrader/downgrader votre Wii.
echo.
echo.
echo.
sfk echo -spat \x20 \x20  Note: si votre firmware actuel est identique au nouveau firmware, le Menu Syst\xe8me
sfk echo -spat \x20 \x20 \x20 \x20 \x20 ne sera pas t\xe9l\xe9charg\xe9
echo.
echo.
echo.
sfk echo -spat \x20 \x20 [Red] ATTENTION:[def] installer un firmware inf\xe9rieur \xe0 4.0 sur une Wii boot2v4 entrainera
echo     un Brick. Mais, Yet Another Wad Manager (YAWMM) ou MMM ne vous autorisera
sfk echo -spat \x20 \x20 pas \xe0 (des)installer quoi que ce soit de dangereux. Vous pouvez v\xe9rifier
echo     manuellement votre version de boot2 en utilisant MMM, DOP-Mii ou BootMii.
echo.
echo.
echo.

::if /i "%FIRMSTART%" NEQ "4.3" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] 4.3 = 4.3 [NON RECOMMANDE]) else (echo                4.3 = 4.3)

if /i "%FIRMSTART%" EQU "4.3" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 4.3 = 4.3 [RECOMMANDE]) else (echo                4.3 = 4.3)

if /i "%FIRMSTART%" EQU "4.2" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 4.2 = 4.2 [RECOMMANDE]) else (echo                4.2 = 4.2)

if /i "%FIRMSTART%" EQU "4.3" goto:SkipGreen4.1
if /i "%FIRMSTART%" EQU "4.2" goto:SkipGreen4.1

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 4.1 = 4.1 [RECOMMANDE]
goto:skipWhite4.1


:SkipGreen4.1
echo                4.1 = 4.1

:skipWhite4.1



echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p FIRM=     Entrez votre choix ici: 

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

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE4

::...................................Wizard Page5 - MORE Channels?...............................
:WPAGE5
set MORE=
set PIC=
set NET=
set Weather=
set NEWS=
set MiiQ=
set Shop=
set Speak=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 Souhaitez\x2dvous t\xe9l\xe9charger l'une des cha\xeenes suivantes?
echo.
echo.
echo.
echo           * Photo
if /i "%REGION%" NEQ "K" echo           * Internet
if /i "%REGION%" NEQ "K" sfk echo -spat \x20 \x20 \x20 \x20 \x20 * M\xe9t\xe9o
if /i "%REGION%" NEQ "K" echo           * News
echo           * Mii
echo           * Shopping
if /i "%REGION%" NEQ "K" echo           * Wii Speak
echo.
echo.
echo.
echo                A = Toutes
echo                S = Certaines
echo                N = Aucune
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p MORE=     Entrez votre choix ici: 

if /i "%MORE%" EQU "M" goto:MENU

if /i "%MENU1%" EQU "S" goto:forsneeknand
if /i "%MORE%" EQU "B" goto:WPAGE20
if /i "%MORE%" EQU "N" goto:WPAGE13

:forsneeknand
if /i "%MORE%" EQU "B" goto:SNKPAGE4d
if /i "%MORE%" EQU "A" set B4SNKCONFIRM=WPAGE5
if /i "%MORE%" EQU "N" set B4SNKCONFIRM=WPAGE5
if /i "%MORE%" EQU "N" goto:SNKNANDCONFIRM

if /i "%MORE%" EQU "S" goto:WPAGE6
if /i "%MORE%" EQU "A" goto:WPAGE6

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE5




::...................................Wizard Page6 - Photo Channel...............................
:WPAGE6

if /i "%MORE%" EQU "A" set PIC=Y
if /i "%MORE%" EQU "A" goto:WPAGE7

set PIC=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 T\xe9l\xe9charger la cha\xeene Photo?
echo.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p PIC=     Entrez votre choix ici: 

if /i "%PIC%" EQU "Y" goto:WPAGE7
if /i "%PIC%" EQU "N" goto:WPAGE7
if /i "%PIC%" EQU "M" goto:MENU
if /i "%PIC%" EQU "B" goto:WPAGE5

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 T\xe9l\xe9charger la cha\xeene Internet?
echo.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p NET=     Entrez votre choix ici: 

if /i "%NET%" EQU "Y" goto:WPAGE8
if /i "%NET%" EQU "N" goto:WPAGE8
if /i "%NET%" EQU "M" goto:MENU
if /i "%NET%" EQU "B" goto:WPAGE6

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE7



::...................................Wizard Page8 - Weather...............................
:WPAGE8

if /i "%MORE%" EQU "A" set Weather=Y
if /i "%MORE%" EQU "A" goto:WPAGE9

set Weather=

cls

echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 T\xe9l\xe9charger la cha\xeene M\xe9t\xe9o?
echo.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p WEATHER=     Entrez votre choix ici: 

if /i "%WEATHER%" EQU "Y" goto:WPAGE9
if /i "%WEATHER%" EQU "N" goto:WPAGE9
if /i "%WEATHER%" EQU "M" goto:MENU
if /i "%WEATHER%" EQU "B" goto:WPAGE7

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE8

::...................................Wizard Page9 - NEWS...............................
:WPAGE9

if /i "%MORE%" EQU "A" set NEWS=Y
if /i "%MORE%" EQU "A" goto:WPAGE10

set NEWS=

cls

echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 T\xe9l\xe9charger la cha\xeene News?
echo.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p NEWS=     Entrez votre choix ici: 

if /i "%NEWS%" EQU "Y" goto:WPAGE10
if /i "%NEWS%" EQU "N" goto:WPAGE10
if /i "%NEWS%" EQU "M" goto:MENU
if /i "%NEWS%" EQU "B" goto:WPAGE8

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE9

::...................................Wizard Page10 - Mii...............................
:WPAGE10

if /i "%MORE%" EQU "A" set MiiQ=Y
if /i "%MORE%" EQU "A" goto:WPAGE11

set MiiQ=

cls

echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 T\xe9l\xe9charger la cha\xeene Mii?
echo.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p MiiQ=     Entrez votre choix ici: 

if /i "%MiiQ%" EQU "Y" goto:WPAGE11
if /i "%MiiQ%" EQU "N" goto:WPAGE11
if /i "%MiiQ%" EQU "M" goto:MENU

if /i "%REGION%" EQU "K" goto:Koreanbacktophoto
if /i "%MiiQ%" EQU "B" goto:WPAGE9

:Koreanbacktophoto
if /i "%MiiQ%" EQU "B" goto:WPAGE6

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE10

::...................................Wizard Page11 - Shop...............................
:WPAGE11

if /i "%MORE%" EQU "A" set Shop=Y
if /i "%MORE%" EQU "A" goto:WPAGE12

set Shop=

cls

echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 T\xe9l\xe9charger la cha\xeene Shopping?
if /i "%MENU1%" NEQ "S" echo.
if /i "%MENU1%" NEQ "S" echo.
if /i "%MENU1%" NEQ "S" echo.
if /i "%MENU1%" NEQ "S" sfk echo -spat \x20 \x20 \x20 Note: l'IOS56 sera \xe9galement t\xe9l\xe9charg\xe9
echo.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p SHOP=     Entrez votre choix ici: 

if /i "%Shop%" EQU "Y" goto:WPAGE12
if /i "%Shop%" EQU "N" goto:WPAGE12
if /i "%Shop%" EQU "M" goto:MENU
if /i "%Shop%" EQU "B" goto:WPAGE10

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 T\xe9l\xe9charger la cha\xeene Wii Speak?
echo.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p Speak=     Entrez votre choix ici: 

if /i "%Speak%" EQU "Y" goto:WPAGE13
if /i "%Speak%" EQU "N" goto:WPAGE13
if /i "%Speak%" EQU "M" goto:MENU
if /i "%Speak%" EQU "B" goto:WPAGE11

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 Souhaitez\x2dvous t\xe9l\xe9charger un des fichiers suivants:
echo.
echo.
echo. 
if /i "%FIRMSTART%" EQU "3.X" echo           * HackMii Installer et BannerBomb v1 (avec IOS58)
if /i "%FIRMSTART%" EQU "4.0" echo           * HackMii Installer et BannerBomb v1 (avec IOS58)
if /i "%FIRMSTART%" EQU "4.1" echo           * HackMii Installer et BannerBomb v1 (avec IOS58)
if /i "%FIRMSTART%" EQU "4.2" echo           * HackMii Installer et BannerBomb v2 (avec IOS58)
if /i "%REGION%" EQU "K" goto:Korean2.2NoExploit
if /i "%FIRMSTART%" EQU "o" echo           * HackMii Installer et Twilight Hack avec IOS58 et tous les exploits disponibles
:Korean2.2NoExploit

if /i "%FIRMSTART%" NEQ "4.3" goto:skip4.3extra

sfk echo -spat \x20 \x20 \x20 \x20 \x20 * T\xe9l\xe9charger HackMii Installer avec IOS58 et tous les exploits disponibles?

:skip4.3extra
echo.
if /i "%CMIOSOPTION%" EQU "on" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 * cIOSs et cMIOS recommand\xe9s) else (sfk echo -spat \x20 \x20 \x20 \x20 \x20 * cIOSs recommand\xe9s)
echo.
echo           * Yet Another Wad Manager Mod (YAWMM)
echo.
echo           * IOS236 Installer et Simple IOS Patcher
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20  avec IOS36v3351 pour installer l'IOS236 patch\xe9
echo.
echo           * Priiloader v0.7 (236 Mod) (avec hacks_hash.ini)
echo.
echo -spat \x20 \x20 \x20 \x20 \x20 * Des protections suppl\xe9mentaires contre le brick
echo.
echo -spat \x20 \x20 \x20 \x20 \x20 * Un th\xe8me Menu Syst\xe8me  
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p Advanced=     Entrez votre choix ici: 

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

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE13


::...................................Wizard Page13B - HAckMii Installer...............................
:WPAGE13B


set HMInstaller=

cls

echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
if /i "%FIRMSTART%" EQU "3.X" sfk echo -spat \x20 T\xe9l\xe9charger HackMii Installer et BannerBomb v1 (avec IOS58)?
if /i "%FIRMSTART%" EQU "4.0" sfk echo -spat \x20 T\xe9l\xe9charger HackMii Installer et BannerBomb v1 (avec IOS58)?
if /i "%FIRMSTART%" EQU "4.1" sfk echo -spat \x20 T\xe9l\xe9charger HackMii Installer et BannerBomb v1 (avec IOS58)?
if /i "%FIRMSTART%" EQU "4.2" sfk echo -spat \x20 T\xe9l\xe9charger HackMii Installer et BannerBomb v2 (avec IOS58)?
if /i "%FIRMSTART%" EQU "o" sfk echo -spat \x20 T\xe9l\xe9charger HackMii Installer et Twilight Hack avec IOS58 et tous les exploits disponibles?


if /i "%FIRMSTART%" NEQ "4.3" goto:skip4.3extra

sfk echo -spat \x20T\xe9l\xe9charger HackMii Installer avec IOS58 et tous les exploits disponibles?

:skip4.3extra
echo.
echo.
echo.
echo    Note: Hackmii Installer peut installer l'Homebrew Channel et/ou Bootmii
echo.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p HMInstaller=     Entrez votre choix ici: 

if /i "%HMInstaller%" EQU "Y" goto:WPAGE14
if /i "%HMInstaller%" EQU "N" goto:WPAGE14
if /i "%HMInstaller%" EQU "M" goto:MENU
if /i "%HMInstaller%" EQU "B" goto:WPAGE13



echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE13B


::...................................Wizard Page14 - cIOSs and cMIOSs...............................
:WPAGE14
set RECCIOS=

set d2x-beta-rev=6
if exist modules\d2x-beta\d2x-beta.bat call modules\d2x-beta\d2x-beta.bat

cls

echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.

if /i "%CMIOSOPTION%" EQU "on" (sfk echo -spat \x20 T\xe9l\xe9charger les cIOSs et cMIOS recommand\xe9s suivants?) else (sfk echo -spat \x20 T\xe9l\xe9charger les cIOSs recommand\xe9s suivants?)
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
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p RECCIOS=     Entrez votre choix ici: 

if /i "%RECCIOS%" EQU "Y" goto:WPAGE17
if /i "%RECCIOS%" EQU "N" goto:WPAGE17
if /i "%RECCIOS%" EQU "M" goto:MENU

if /i "%RECCIOS%" EQU "B" goto:WPAGE13B

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE14

::...................................Wizard Page15 and 16 removed...............................


::...................................Wizard Page17 - YAWMM...............................
:WPAGE17
set yawmQ=

cls

echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 T\xe9l\xe9charger Yet Another Wad Manager Mod (YAWMM)?
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 Note: les autres Wad Managers peuvent ne pas \xeatre compatibles avec les
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 cIOSs qui ne sont pas bas\xe9s sur l'IOS38 si vous n'utilisez pas YAWMM
echo            comme gestionnaire principal de wad, vous ratez quelque chose.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p yawmQ=     Entrez votre choix ici: 

if /i "%yawmQ%" EQU "Y" goto:WPAGE18
if /i "%yawmQ%" EQU "N" goto:WPAGE18
if /i "%yawmQ%" EQU "M" goto:MENU
if /i "%yawmQ%" EQU "B" goto:WPAGE14

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE17


::...................................Wizard Page18 - IOS236 Installer...............................
:WPAGE18
set IOS236InstallerQ=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 T\xe9l\xe9charger IOS236 Installer et Simple IOS Patcher (avec IOS36v3351)?
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p IOS236InstallerQ=     Entrez votre choix ici: 

if /i "%IOS236InstallerQ%" EQU "Y" goto:WPAGE19
if /i "%IOS236InstallerQ%" EQU "N" goto:WPAGE19
if /i "%IOS236InstallerQ%" EQU "M" goto:MENU
if /i "%IOS236InstallerQ%" EQU "B" goto:WPAGE17

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE18

::...................................Wizard Page19 - Priiloader...............................
:WPAGE19
set PRIQ=

cls

echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 T\xe9l\xe9charger Priiloader?
echo.
echo.
echo.
sfk echo -spat \x20 Note: Multi-Mod Manager et Hacks.ini seront \xe9galement t\xe9l\xe9charg\xe9s
echo.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p PRIQ=     Entrez votre choix ici: 

if /i "%PRIQ%" EQU "Y" goto:WPAGE19B
if /i "%PRIQ%" EQU "N" goto:WPAGE19B
if /i "%PRIQ%" EQU "M" goto:MENU

if /i "%PRIQ%" EQU "B" goto:WPAGE18

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE19


::...................................Wizard Page19B - Extra Brick Protection...............................
:WPAGE19B
set protect=

cls

echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 T\xe9l\xe9charger des protections suppl\xe9mentaires contre le brick?
echo.
echo.
sfk echo -spat \x20 Ceci t\xe9l\xe9chargera les IOS des Menus Syst\xe8me suivants qui prot\xe8geront toutes les Wii
sfk echo -spat \x20 (m\xeame les LU64) des bricks lors d'accidentels up\x2fdowngrades.
echo.
echo      * IOS11v16174(IOS60v6174[FS-ES-NP]) - IOS11 requis pour SMv2.0-2.1
echo      * IOS20v16174(IOS60v6174[FS-ES-NP]) - IOS20 requis pour SMv2.2
echo      * IOS30v16174(IOS60v6174[FS-ES-NP]) - IOS30 requis pour SMv3.0-3.3
if /i "%REGION%" EQU "K" echo      * IOS40v16174(IOS60v6174[FS-ES-NP]) - IOS40 requis pour SMv3.3K
echo      * IOS50v14889(IOS50v4889[FS-ES-NP]) - IOS50 requis pour SMv3.4
if /i "%REGION%" EQU "K" echo      * IOS52v15661(IOS52v5661[FS-ES-NP]) - IOS52 requis pour SMv3.5K

echo      * IOS60v16174(IOS60v6174[FS-ES-NP]) - IOS60 requis pour SMv4.0-4.1

if /i "%REGION%" NEQ "RC" echo      * IOS70v16687(IOS70v6687[FS-ES-NP]) - IOS70 requis pour SMv4.2
if /i "%REGION%" EQU "RC" echo      * IOS70v16174(IOS60v6174[FS-ES-NP]) - IOS70 requis pour SMv4.2


echo      * USB-Loader Forwarder Channel
echo.
sfk echo -spat \x20 Vous devez toujours avoir au moins une cha\xeene forwarder install\xe9e sur votre Wii,
sfk echo -spat \x20 Ainsi, en cas de mise \xe0 jour accidentelle, vous serez en mesure de rehacker votre
sfk echo -spat \x20 Wii sans compter sur un exploit sp\xe9cifique n\xe9cessitant un jeu Wii.


if /i "%REGION%" EQU "RC" echo.
if /i "%REGION%" EQU "RC" sfk echo -spat \x20 Note: IOS80v16174(IOS60v6174[FS-ES-NP]) sera t\xe9l\xe9charg\xe9 m\xeame si vous r\xe9pondez Non
if /i "%REGION%" EQU "RC" sfk echo -spat \x20 \x20 \x20 \x20  pour vous prot\xe9ger contre les bricks avec erreurs 003 


echo.
echo.
echo   NOTES:
echo.
sfk echo -spat \x20 \x20  \x2dLes num\xe9ros de version ont \xe9t\xe9 augment\xe9s pour survivre
sfk echo -spat \x20 \x20 aux mises \xe0 jour officielles.
echo.
echo     -A l'exception des forwarders d'USB-Loader,
sfk echo -spat \x20 \x20 leur installation ne r\xe9duira pas la taille de la m\xe9moire de la wii
sfk echo -spat \x20 \x20 comme une cha\xeene ou une sauvgarde de jeu.
echo.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p protect=     Entrez votre choix ici: 

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


echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE19B


::...................................Wizard Page20 - Theme Selection...............................
:WPAGE20
set ThemeSelection=

cls

echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.

if /i "%MENU1%" NEQ "S" goto:quickskip
echo                                 CREATION DE NAND SNEEK
echo.
echo.
:quickskip


sfk echo -spat \x20 Souhaitez\x2dvous installer un th\xe8me personnalis\xe9 sur votre Wii?


echo.
echo.
echo.
echo         R = DarkWii Red Theme
echo      WWWR = Voir DarkWii Red Theme par la team Wii Theme sur youtube
echo.
echo.
echo         G = DarkWii Green Theme
echo      WWWG = Voir DarkWii Green Theme par la team Wii Theme sur youtube
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 N = Non, je veux le m\xeame vieux Menu Syst\xe8me ennuyeux 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                B = Retour
echo.
echo                M = Menu principal
echo.
echo.
echo.
echo.

set /p ThemeSelection=     Entrez votre choix ici: 

if /i "%ThemeSelection%" EQU "M" goto:MENU
if /i "%ThemeSelection%" EQU "WWWR" (start www.youtube.com/watch?v=qFliF-K-epM)&&(goto:WPAGE20)
if /i "%ThemeSelection%" EQU "WWWG" (start http://www.youtube.com/watch?v=Rn0CnTo5kRI)&&(goto:WPAGE20)

if /i "%MENU1%" EQU "S" goto:forsneeknand
if /i "%ThemeSelection%" EQU "B" goto:WPAGE19B
if /i "%ThemeSelection%" EQU "R" goto:WPAGE21
if /i "%ThemeSelection%" EQU "G" goto:WPAGE21
if /i "%ThemeSelection%" EQU "N" goto:WPAGE21

:forsneeknand
if /i "%ThemeSelection%" EQU "B" goto:SNKPAGE4B
if /i "%ThemeSelection%" EQU "R" goto:WPAGE5
if /i "%ThemeSelection%" EQU "G" goto:WPAGE5
if /i "%ThemeSelection%" EQU "N" goto:WPAGE5

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE20



::...................................Wizard Page21 - Theme Selection...............................
:WPAGE21
set USBGUIDE=

cls

echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 Souhaitez\x2dvous la mise en place d'un USB-Loader maintenant?
echo.
echo.
echo      Notes
echo      =====
echo.
echo       * Un USB Loader permet de charger des jeux Wii depuis un disque dur externe.
echo.
sfk echo -spat \x20 \x20 \x20 \x2a Cette \xe9tape peut \xeatre fait ult\xe9rieurement depuis le Menu principal de ModMii.
echo.
echo.
echo.
echo.
echo.
echo                Y = Oui
echo                N = Non
echo.
echo                B = Retour
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p USBGUIDE=     Entrez votre choix ici: 

if /i "%USBGUIDE%" EQU "M" goto:MENU

if /i "%USBGUIDE%" EQU "B" goto:WPAGE20
if /i "%USBGUIDE%" EQU "Y" goto:UPAGE1
if /i "%USBGUIDE%" EQU "N" goto:WPAGELAST

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE21


::...................................Wizard Last Page - Confirmation...............................
:WPAGELAST

set WLAST=

cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 Est\x2dce que les r\xe9glages sont corrects?
echo.
echo.
echo.
if /i "%VIRGIN%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a Wii actuellement vierge (non modifi\xe9e)
if /i "%VIRGIN%" EQU "N" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a Wii d\xe9j\xe0 modifi\xe9e
if /i "%REGION%" EQU "RC" goto:RCSTATUS
if /i "%FIRMSTART%" NEQ "o" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a Le firmware actuel est %FIRMSTART%%REGION%
if /i "%FIRMSTART%" EQU "o" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a Le firmware actuel est inf\xe9rieur \xe0 2.2%REGION%

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a Le firmware souhait\xe9 est %FIRM%%REGION%
goto:noRCSTATUS
:RCSTATUS


if /i "%FIRMSTART%" NEQ "o" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a Wii cor\xe9enne mais la r\xe9gion a d\xe9j\xe0 \xe9t\xe9 chang\xe9 en %FIRMSTART%%REGIONCHANGE%
if /i "%FIRMSTART%" EQU "o" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a Wii cor\xe9enne mais la r\xe9gion a d\xe9j\xe0 \xe9t\xe9 chang\xe9e en %REGIONCHANGE%
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a Le firmware souhait\xe9 est %FIRM%%REGIONCHANGE%

:noRCSTATUS
echo.
if /i "%PIC%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger la cha\xeene Photo
if /i "%NET%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger la cha\xeene Internet
if /i "%WEATHER%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger la cha\xeene M\xe9t\xe9o
if /i "%NEWS%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger la cha\xeene News
if /i "%MiiQ%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger la cha\xeene Mii
if /i "%Shop%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger la cha\xeene Shopping (et IOS56)
if /i "%Speak%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger la cha\xeene Wii Speak
echo.

if /i "%HMInstaller%" NEQ "Y" goto:skip4.3extra
if /i "%FIRMSTART%" EQU "3.X" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger HackMii Installer et BannerBomb v1 (avec IOS58)
if /i "%FIRMSTART%" EQU "4.0" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger HackMii Installer et BannerBomb v1 (avec IOS58)
if /i "%FIRMSTART%" EQU "4.1" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger HackMii Installer et BannerBomb v1 (avec IOS58)
if /i "%FIRMSTART%" EQU "4.2" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger HackMii Installer et BannerBomb v2 (avec IOS58)
if /i "%FIRMSTART%" EQU "o" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger HackMii Installer, Twilight Hack avec IOS58 et tous les exploits disponibles


if /i "%FIRMSTART%" NEQ "4.3" goto:skip4.3extra

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger HackMii Installer avec IOS58 et tous les exploits disponibles

:skip4.3extra


if /i "%RECCIOS%" NEQ "Y" goto:smallskip
if /i "%CMIOSOPTION%" EQU "on" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger les cIOSs et cMIOS recommand\xe9s) else (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger les cIOSs recommand\xe9s)
:smallskip

if /i "%yawmQ%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger Yet Another Wad Manager Mod (YAWMM)

if /i "%IOS236InstallerQ%" NEQ "Y" goto:skip
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger IOS236 Installer et Simple IOS Patcher
sfk echo -spat \x20 \x20 \x20 \x20 \x20 avec l'IOS36v3351 pour installer l'IOS236 patch\xe9
:skip


if /i "%PRIQ%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger Priiloader
if /i "%protect%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger des protections suppl\xe9mentaires contre les bricks

if /i "%ThemeSelection%" EQU "R" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger Dark Wii Red Theme
if /i "%ThemeSelection%" EQU "G" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger Dark Wii Green Theme

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
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a Disque dur externe format\xe9 en %FORMATNAME%
goto:skip2
:skip
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a Disque dur externe format\xe9 en %FORMATNAME%
:skip2

if /i "%LOADER%" EQU "CFG" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger Configurable USB-Loader
if /i "%LOADER%" EQU "FLOW" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger WiiFlow
if /i "%LOADER%" EQU "ALL" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger Configurable USB-Loader et WiiFlow
if /i "%USBCONFIG%" EQU "USB" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a R\xe9glages et config de l'USB-Loader sauvegard\xe9s sur disque dur USB
if /i "%USBCONFIG%" NEQ "USB" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a R\xe9glages et config de l'USB-Loader sauvegard\xe9s sur carte SD


:skipusb


echo.
echo.
echo.
if /i "%LoadWizSettings%" EQU "Y" goto:skip
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 S = Sauvegarder les r\xe9glages pour une utilisation ult\xe9rieure
if exist Wizard_Settings.bat sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Existing Wizard_Settings.bat va \xeatre renomm\xe9
echo.
:skip
echo               Y = Oui
echo               N = Non / Menu principal
echo.
echo               B = Retour
echo               M = Menu principal
echo.
echo.
echo.
echo.
set /p WLAST=     Entrez votre choix ici: 

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


echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGELAST



::-------------Save Wizard Settings:-------------------
:SaveWizardSettings

cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
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
echo set MiiQ=%MiiQ%>> Wizard_Settings.bat
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


if exist Wizard_Settings.bat sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 T\xe9l\xe9chargement des r\xe9glages sauvegard\xe9s.
@ping 127.0.0.1 -n 2 -w 1000> nul

goto:WPAGELAST

::...................................USB-Loader Setup Page1 - Format?...............................
:UPAGE1
set FORMAT=NONE
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
sfk echo -spat \x20 Comment voulez\x2dvous que votre disque dur externe soit format\xe9?
echo.
sfk echo -spat \x20 [Green] 1 = FAT32 (RECOMMANDE)
echo.
sfk echo -spat \x20 \x20 [Green] \x2b:[def] La Wii peut acc\xe9der aux apps, jeux, jaquettes et musique stock\xe9s en FAT32
sfk echo -spat \x20 \x20 \x20 \x20 Id\xe9al si vous n'avez pas toujours de carte SD pour lancer l'USB-Loader
sfk echo -spat \x20 \x20 \x20 \x20 Compatible avec l'\xe9mulation de Nand SNEEK/Triiforce.
echo.
sfk echo -spat \x20 \x20 [Red] \x2d:[def] Ne peut pas stocker des fichiers de plus de 4GB. Cette limite ne s'applique 
sfk echo -spat \x20 \x20 \x20 \x20 pas aux jeux Wii, qui peuvent \xeatre d\xe9coup\xe9s. Cela n'affectera pas non plus
sfk echo -spat \x20 \x20 \x20 \x20 les lecteurs de vid\xe9os haute d\xe9finition.
echo.
echo.
echo     2 = NTFS
echo.
sfk echo -spat \x20 \x20 [Green] \x2b:[def] Peut stocker des fichiers de plus de 4GB
sfk echo -spat \x20 \x20 \x20 \x20 CFG USB-Loader peut acc\xe9der aux jeux, jaquettes et musique stock\xe9s en NTFS
echo.
sfk echo -spat \x20 \x20 [Red] \x2d:[def] La Wii ne peut pas acc\xe9der aux apps stock\xe9es en NTFS et rend la carte SD
sfk echo -spat \x20 \x20 \x20 \x20 incompatible avec l'\xe9mulation de Nand SNEEK/Triiforce.
echo.
echo.
echo     3 = FAT32 et NTFS
sfk echo -spat \x20 \x20 \x20 \x20 Note: les petits lecteurs flash ne peuvent pas \xeatre partitionn\xe9s
echo.
sfk echo -spat \x20 \x20 [Green] \x2b:[def] Vous pouvez acc\xe9der aux apps Wii sur la partition FAT32, tout en
echo         conservant des fichiers de plus de 4 GB sur la partition NTFS
echo.
sfk echo -spat \x20 \x20 [Red] \x2d:[def] Acc\xe8s un peu plus long par rapport aux autres options
echo.
echo.
echo     4 = Actuellement en WBFS et je ne veux pas changer
echo.
sfk echo -spat \x20 \x20 [Red] \x2d:[def] WBFS peut seulement \xeatre lu par la Wii et servir \xe0 stocker des jeux Wii
echo.
echo.
echo     5 = Actuellement en FAT32/WBFS et je ne veux pas changer
echo.
sfk echo -spat \x20 \x20 [Red] \x2d:[def] WBFS peut seulement \xeatre lu par la Wii et servir \xe0 stocker des jeux Wii
echo.
echo.
echo.
echo           B = Retour
echo.
echo           M = Menu Principal
echo.
echo.
set /p FORMAT=     Entrez votre choix ici: 

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

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:UPAGE1



::...................................USB-Loader Setup Page1b - Loader?...............................
:UPAGE1b
set LOADER=
set usbfolder=
set FLOW=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo   Quel USB-Loader souhaitez-vous utiliser?
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 [Green] 1 = Configurable USB-Loader (RECOMMANDE)
echo.
echo.
echo        2 = WiiFlow
echo.
echo.
echo        3 = Les deux
echo.
echo.
echo.
echo.
echo           B = Retour
echo.
echo           M = Menu Principal
echo.
echo.
echo.
set /p LOADER=     Entrez votre choix ici: 

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

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:UPAGE1b


::...................................USB-Loader Setup Page2 - Config on USB vs SD?...............................
:UPAGE2
set USBCONFIG=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo Ou souhaitez-vous installer l'USB-Loader, les jaquettes et fichiers de configuration?
echo.
echo.
sfk echo -spat \x20 \x20 \x20 [Green] USB = USB (RECOMMANDE)[def] (fichiers enregistr\xe9s sous "COPY_TO_USB")
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Green] \x2b:[def] une Carte SD n'est pas n\xe9cessaire pour lancer un USB-Loader
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 les fichiers USB-Loader prennent un peu moins de place
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] \x2d:[def] temps de chargement un peu plus lent (presque n\xe9gligeable)
echo.
echo.
echo.
echo.
echo         SD = SD (fichiers sauves sous "%DRIVE%")
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Green] \x2b:[def] temps de chargement un peu plus lent (presque n\xe9gligeable)
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] \x2d:[def] ne peut pas lancer d'USB-Loader sans carte SD
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 les fichiers USB-Loader prennent un peu plus de place 
echo.
echo.
echo.
echo.
echo.
echo.
echo         B = Retour
echo.
echo         M = Menu principal
echo.
echo.
echo.
echo.
set /p USBCONFIG=     Entrez votre choix ici: 

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

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:UPAGE2




::...................................SNEEK Page1 - SNEEK SELECT...............................
:SNKPAGE1
set SNEEKSELECT=
set SNKS2U=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo   Que voulez-vous faire?
echo.
echo.
echo.
echo               1 = Installation de SNEEK
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 2 = Cr\xe9er une NAND \xe9mul\xe9e (pour SNEEK)
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 3 = Les 2 (recommand\xe9 pour les premi\xe8res utilisations de SNEEK)
echo.
echo               4 = Extraction de jeux (pour SNEEK)
echo                   * Supporte les formats ISO, CISO et WBFS
echo.
echo.
echo.
sfk echo -spat \x20 N\xe9cessaire:
echo.
sfk echo -spat \x20 \x20 \x20 \x2a Votre Wii doit avoir bootmii d'install\xe9 pour utiliser SNEEK. 
sfk echo -spat \x20 \x20 \x20 \x20 Si ce n'est pas le cas, lancez l'assistant de t\xe9l\xe9chargement de Modmii.
echo.
sfk echo -spat \x20 \x20 \x20 \x2a UNEEK et UNEEK+DI n\xe9cessite un disque dur externe format\xe9 en 
echo         FAT32 avec des clusters de 32K ou moins. Si vous ne savez pas comment 
echo         formater votre disque ainsi, lancez l'installation d'USB-Loader de ModMii.
echo.
sfk echo -spat \x20 \x20 \x20 \x2a SNEEK+DI et UNEEK+DI utilisent toujours la premi\xe8re partiton rencontr\xe9e.
echo.
echo.
sfk echo -spat \x20 \x20 [Red] ATTENTION: SNEEK n'est pas directement support\xe9 par ModMii.
echo.
sfk echo -spat \x20 \x20 [Red] Tous les probl\xe8mes rencontr\xe9s avec SNEEK qui ne sont pas une cons\xe9quence directe
sfk echo -spat \x20 \x20 [Red] de ModMii doivent \xeatre rapport\xe9s ici: http://code.google.com/p/sneek/
echo.
sfk echo -spat \x20 \x20 [Red] C'est \xe9galement un bon site pour en apprendre plus sur SNEEK.
echo.
sfk echo -spat \x20 \x20 [Red] Un autre site utile ici: tinyurl.com/SNEEK-DI
echo.
echo.
echo.
echo                B = Retour
echo.
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p SNEEKSELECT=     Entrez votre choix ici: 

if /i "%SNEEKSELECT%" EQU "B" goto:MENU
if /i "%SNEEKSELECT%" EQU "M" goto:MENU
if /i "%SNEEKSELECT%" EQU "1" goto:SNKPAGE2
if /i "%SNEEKSELECT%" EQU "2" goto:SNKPAGE2
if /i "%SNEEKSELECT%" EQU "3" goto:SNKPAGE2
if /i "%SNEEKSELECT%" EQU "4" goto:SNKDISCEX

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE1



::...................................SNEEK Page2 - SNEEK TYPE...............................
:SNKPAGE2
set SNEEKTYPE=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
if /i "%SNEEKSELECT%" NEQ "2" echo   Quel type de SNEEK voulez vous installer?
if /i "%SNEEKSELECT%" EQU "2" sfk echo -spat \x20 Pour quel type de SNEEK souhaitez\x2dvous cr\xe9er une NAND \xe9mul\xe9e?
echo.
if /i "%SNEEKSELECT%" NEQ "1" sfk echo -spat \x20 \x20 \x20 \x20 Note: NAND cr\xe9\xe9e compatible tout type de SNEEK sauf
if /i "%SNEEKSELECT%" NEQ "1" sfk echo -spat \x20 \x20 \x20 \x20 pour UNEEK+DI et SNEEK+DI n\xe9cessitant une Nand \xe9mul\xe9e en 4.2U/E ou 4.3U/E
if /i "%SNEEKSELECT%" NEQ "1" sfk echo -spat \x20 \x20 \x20 \x20 Toutes les Wii peuvent utiliser des r\xe9gions de NAND \xe9mul\xe9e diff\xe9rentes. 
if /i "%SNEEKSELECT%" NEQ "1" echo.
if /i "%SNEEKSELECT%" NEQ "1" sfk echo -spat \x20 \x20 \x20 \x20 Utilisateurs avanc\xe9s: si vous compilez vous\x2dm\xeame SNEEK+DI/UNEEK+DI avec 
if /i "%SNEEKSELECT%" NEQ "1" sfk echo -spat \x20 \x20 \x20 \x20 le support de Menu Syst\xe8me hackes autres que ceux cit\xe9s,
if /i "%SNEEKSELECT%" NEQ "1" sfk echo -spat \x20 \x20 \x20 \x20 vous pouvez choisir "S" ou "U" pour d\xe9bloquer plus d'options de cr\xe9ation NAND
echo.
echo       UD = UNEEK+DI
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x2a nand/m\xe9moire de Wii \xe9mul\xe9e sur HDD externe en fat32
echo             * charge les jeux Wii d'un HDD externe en fat32
echo             * vous pouvez lancer les applis de votre carte SD par l'HBC
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x2a l'acces au lecteur DVD est d\xe9sactiv\xe9 pendant l'ex\xe9cution de UNEEK+DI
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 mais peut \xeatre utilis\xe9 par des applis (ie. WiiXplorer)
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x2a fonctionne seulement sur des Nand \xe9mul\xe9es 4.2U/E et 4.3E
echo.
echo       SD = SNEEK+DI
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x2a nand/m\xe9moire de Wii \xe9mul\xe9e sur carte SD
echo             * charge des jeux Wii d'un HDD externe en fat32
echo             * vous pouvez lancer les applis sur HDD externe en fat32 par l'HBC
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x2a l'acces au lecteur DVD est d\xe9sactiv\xe9 durant l'ex\xe9cution de SNEEK+DI
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 mais peut \xeatre utilis\xe9 par des applis (ie. WiiXplorer)
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x2a fonctionne seulement sur des Nand \xe9mul\xe9es 4.2U/E et 4.3E
echo.
echo        U = UNEEK
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x2a nand/m\xe9moire de Wii \xe9mul\xe9e sur un HDD externe en fat32
echo             * vous ne pouvez pas charger les jeux de votre HDD
echo             * vous pouvez lancer des applis de votre carte SD par l'HBC
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x2a l'acces au lecteur DVD est activ\xe9
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x2a lancement de backups dvd avec Darkcorp install\xe9 sur la Nand \xe9mul\xe9e
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20(les Wii r\xe9centes ont un lecteur DVD inviolable)
echo.
echo        S = SNEEK
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x2a nand/m\xe9moire de Wii \xe9mul\xe9e sur carte SD
echo             * vous ne pouvez pas charger les jeux de votre HDD
echo             * vous pouvez lancer des applis sur HDD externe en fat32 par l'HBC
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x2a l'acces au lecteur DVD est activ\xe9
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x2a lancement de backups dvd avec Darkcorp install\xe9 sur la Nand \xe9mul\xe9e
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20(les Wii r\xe9centes ont un lecteur DVD inviolable)
echo.
echo.
echo           B = Retour
echo.
echo           M = Menu principal
echo.
echo.
set /p SNEEKTYPE=     Entrez votre choix ici: 

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

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
echo                                 CREATION DE NAND SNEEK
echo.
echo.
echo.
echo.
sfk echo -spat \x20 Choisissez la r\xe9gion pour votre Nand \xe9mul\xe9e:
echo.
echo.
echo.
sfk echo -spat \x20 \x20 Note: SNEEK+DI et UNEEK+DI ne fonctionnent que sur des Nand \xe9mul\xe9es en 
echo           4.2U/E ou 4.3U/E.
echo.
sfk echo -spat \x20 \x20 Rappel: vous pouvez utiliser une r\xe9gion diff\xe9rente que celle de votre Wii.
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \Note: si vous souhaitez synchroniser vos wiimotes avec votre Nand r\xe9elle
sfk echo -spat \x20 \x20 \x20 \x20 \x20 et votre Nand \xe9mul\xe9e, vous devrez s\xe9lectionner la r\xe9gion r\xe9elle de la 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 Wii en plus d'utiliser le setting.txt pour la Wii.
echo.               
echo.
echo.
echo.
echo               U = USA
echo               E = Euro (PAL)
if /i "%DITYPE%" EQU "off" echo               J = JAP
if /i "%DITYPE%" EQU "off" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 K = Cor\xe9enne
echo.
echo.
echo.
echo.
echo             B = Retour
echo.
echo             M = Menu principal
echo.
echo.
echo.
echo.
set /p REGION=     Entrez votre choix ici: 


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

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE3






::...................................SNEEK Page4 - SNEEK VERSION...............................
:SNKPAGE4
set SNKVERSION=


::If region is USA and building NAND for DI, force 4.2 and go to next page
::if /i "%DITYPE%" EQU "OFF" goto:skip
::if /i "%REGION%" EQU "U" set SNKVERSION=4.2
::if /i "%REGION%" EQU "U" goto:SNKPAGE4d
:::skip


cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo                                  CREATION DE NAND SNEEK
echo.
echo.
sfk echo -spat \x20 Choisissez le firmware pour votre Nand \xe9mul\xe9e:
echo.
echo.
echo.
sfk echo -spat \x20 \x20 Note: SNEEK+DI et UNEEK+DI ne fonctionnent que sur des Nand \xe9mul\xe9es en 
echo           4.2U/E ou 4.3U/E.
echo.
sfk echo -spat \x20 \x20 Rappel: vous pouvez utiliser une r\xe9gion diff\xe9rente que celle de votre Wii.
echo.
echo.
if /i "%DITYPE%" EQU "OFF" goto:skip
if /i "%REGION%" EQU "U" sfk echo -spat \x20 \x20 \x20 \x20 [Red]Attention:[def] 4.3U n'a pas le hack Region Free activ\xe9 par d\xe9faut.
if /i "%REGION%" EQU "U" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Cela s'applique uniquement aux jeux WiiWare/VC (aka cha\xeenes),
if /i "%REGION%" EQU "U" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 le menu DI/Game est compatible jeux Wii de toutes r\xe9gions.
:skip
echo.
echo.
echo.
echo                4.3 = 4.3
echo.
echo                4.2 = 4.2
echo.
::anything under 4.2 is not an option for NANDs for DI
if /i "%DITYPE%" EQU "ON" goto:skip
echo                4.1 = 4.1
:skip
echo.
echo.
echo.
echo.
echo              B = Retour
echo.
echo              M = Menu principal
echo.
echo.
echo.
echo.
set /p SNKVERSION=     Entrez votre choix ici: 


if /i "%SNKVERSION%" EQU "M" goto:MENU
if /i "%SNKVERSION%" EQU "B" goto:SNKPAGE3



if /i "%SNKVERSION%" EQU "4.3" goto:SNKPAGE4a
if /i "%SNKVERSION%" EQU "4.2" goto:SNKPAGE4a

if /i "%SNEEKTYPE%" EQU "SD" goto:skip
if /i "%SNEEKTYPE%" EQU "UD" goto:skip
if /i "%SNKVERSION%" EQU "4.1" goto:SNKPAGE4a
:skip

echo Vous avez saisi une valeur incorrecte
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
echo                                 CREATION DE NAND SNEEK
echo.
echo.
sfk echo -spat \x20 Voulez\x2dvous installer l'Homebrew Filter Channel sur votre Nand \xe9mul\xe9e?
echo.
echo.
sfk echo -spat \x20 \x20 Tout comme l'Homebrew Channel, l'Homebrew Filter Channel peut lancer des 
sfk echo -spat \x20 \x20 homebrews situ\xe9s sur carte SD ou HDD en fat32.
echo.
echo.
sfk echo -spat \x20 \x20 Il n'est pas possible d'installer la derni\xe8re version de l'Homebrew Channel
sfk echo -spat \x20 \x20 sur une Nand \xe9mul\xe9e, c'est pourquoi l'Homebrew Filter est une excellente
echo     alternative.
echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Oui
echo.
echo                N = Non
echo.
echo.
echo.
echo                B = Retour
echo.
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p SNKHBF=     Entrez votre choix ici: 


if /i "%SNKHBF%" EQU "B" goto:SNKPAGE4
if /i "%SNKHBF%" EQU "M" goto:MENU
if /i "%SNKHBF%" EQU "Y" goto:SNKPAGE4a2
if /i "%SNKHBF%" EQU "N" goto:SNKPAGE4a2


echo Vous avez saisi une valeur incorrecte
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
echo                                 CREATION DE NAND SNEEK
echo.
echo.
echo.
sfk echo -spat \x20 Voulez\x2dvous installer le cIOS249 rev14 sur votre Nand \xe9mul\xe9e?
echo.
echo.
echo         Certains homebrews fonctionneront uniquement sur SNEEK/UNEEK 
echo         avec le CIOS rev14 (exemple: SaveGame Manager GX).
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
echo                Y = Oui
echo.
echo                N = Non
echo.
echo.
echo.
echo                B = Retour
echo.
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p SNKCIOS=     Entrez votre choix ici: 


if /i "%SNKCIOS%" EQU "B" goto:SNKPAGE4a
if /i "%SNKCIOS%" EQU "M" goto:MENU
if /i "%SNKCIOS%" EQU "Y" goto:SNKPAGE4b
if /i "%SNKCIOS%" EQU "N" goto:SNKPAGE4b


echo Vous avez saisi une valeur incorrecte
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
echo                                 CREATION DE NAND SNEEK
echo.
echo.
sfk echo -spat \x20 Voulez\x2dvous installer Priiloader v0.4 et hacks.ini sur votre Nand \xe9mul\xe9e?
echo.
sfk echo -spat \x20 Cela vous permettra d'activer des hacks sur le Menu Syst\xe8me de votre Nand \xe9mul\xe9e,
sfk echo -spat \x20 mais aussi d'autobooter des applis telles que JoyFlow.
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 Note: pour acceder au Priiloader sur votre Nand \xe9mul\xe9e, maintenez \x22reset\x22 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 lors du d\xe9marrage de votre Nand \xe9mul\xe9e.
echo.
echo.

sfk echo -spat [Red] AVERTISSEMENT: Dans certains cas, vous avez environ 10 secondes pour quitter
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]Priiloader (sur votre Nand \xe9mul\xe9e) avant qu'il ne r\xe9ponde plus.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]Vous devrez enregistrer vos param\xe8tres rapidement et faire
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]plusieurs essais pour sauvegarder tous vos r\xe9glages un par un.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]Un moyen pour acc\xe9der au Priiloader (sur votre Nand \xe9mul\xe9e) sans la
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]limite de 10 secondes est de changer rapidement l'option \x22return to\x22 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]sur \x22Priiloader\x22. Lancez votre Menu Syst\xe8me \xe9mul\xe9, pressez \x22home\x22 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]et s\xe9lectionnez \x22Menu Wii\x22. Cela lancera Priiloader sur votre Nand   
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]\xe9mul\xe9e en outre passant la limite de 10 secondes. Lorsque vous aurez 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]termin\xe9 avec Priiloader, modifiez le param\xe8tre \x22return to\x22.

echo.
echo.
echo.
echo                Y = Oui
echo.
echo                N = Non
echo.
echo.
echo.
echo                B = Retour
echo.
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p SNKPRI=     Entrez votre choix ici: 


if /i "%SNKPRI%" EQU "B" goto:SNKPAGE4a2
if /i "%SNKPRI%" EQU "M" goto:MENU
if /i "%SNKPRI%" EQU "Y" goto:SNKPAGE4c
if /i "%SNKPRI%" EQU "N" goto:SNKPAGE4c


echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4b



::...................................SNEEK Page4c - JoyFlow...............................
:SNKPAGE4c
set SNKJOY=

::skip this page if sneektype not uneek or uneek+di
if /i "%SNEEKTYPE:~0,1%" EQU "S" (set SNKJOY=N) & (goto:SNKPAGE4d)


cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo                                 CREATION DE NAND SNEEK
echo.
echo.
sfk echo -spat \x20 Voulez\x2dvous une cha\xeene forwarder de JoyFlow sur votre Nand \xe9mul\xe9e?
echo.
echo.

if /i "%SNKPRI%" EQU "Y" sfk echo -spat \x20 Note: Le dol Forwarder de JoyFlow peut \xeatre ajout\xe9 au menu \x22installed file\x22 du Priiloader.
if /i "%SNKPRI%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 Les param\xe8tres d'autoboot du Priiloader devront \xeatre modifi\xe9s
if /i "%SNKPRI%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 si vous voulez que votre Nand \xe9mul\xe9e autoboot sur \x22installed file\x22 
if /i "%SNKPRI%" EQU "Y" echo.
if /i "%SNKPRI%" EQU "Y" echo.
if /i "%SNKPRI%" EQU "Y" echo.

sfk echo -spat \x20 \x20 \x20 \x20 \x2a JoyFlow, USB-Loader pour UNEEK+DI est une belle alternative
sfk echo -spat \x20 \x20 \x20 \x20 pour charger les jeux ou cha\xeenes Wii via un Menu Syst\xe8me \xe9mul\xe9
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Oui
echo.
echo                N = Non
echo.
echo.
echo.
echo                B = Retour
echo.
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p SNKJOY=     Entrez votre choix ici: 


if /i "%SNKJOY%" EQU "B" goto:SNKPAGE4b
if /i "%SNKJOY%" EQU "M" goto:MENU
if /i "%SNKJOY%" EQU "Y" goto:SNKPAGE4d
if /i "%SNKJOY%" EQU "N" goto:SNKPAGE4d


echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4c



::...................................SNEEK Page4d - SNEEK SERIAL...............................
:SNKPAGE4d


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
echo                                       par XFlak
echo.
echo.
echo                                 CREATION DE NAND SNEEK
echo.
echo.
sfk echo -spat \x20 Quel num\xe9ro de s\xe9rie souhaitez\x2dvous utiliser pour cr\xe9er le setting.txt?
echo.
echo.
if /i "%settingtxtExist%" EQU "yes" sfk echo -spat \x20 [Red] setting.txt d\x2dj\xe0 pr\x2dsent dans:
if /i "%settingtxtExist%" EQU "yes" echo                                    %nandpath%
if /i "%settingtxtExist%" EQU "yes" sfk echo -spat \x20 [Red] Laissez vide la s\x2dlection pour continuer avec ce setting.txt
if /i "%settingtxtExist%" EQU "yes" echo.
if /i "%settingtxtExist%" EQU "yes" sfk echo -spat \x20 [Red] ATTENTION: le setting.txt existant doit avoir la r\x2dgion '%REGION%' fonctionnelle
echo.
echo.
sfk echo -spat \x20 Entrez les %serialdigits% chiffres du num\xe9ro de s\xe9rie
echo.
echo               Exemple: %defaultserial%
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 D = Num\xe9ro de s\xe9rie par d\xe9faut %defaultserial%
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 N = Aucun, continuer avec la cr\xe9ation du setting.txt
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 Note: setting.txt est n\xe9cessaire \xe0 la cr\xe9ation de Nand, ne choisir "N" que
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 si vous pr\xe9voyez de copier manuellement un setting.txt existant
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \xe0 cet endroit: 
echo               %nandpath%\title\00000001\00000002\data\
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20  Note: si vous souhaitez synchroniser vos wiimotes avec votre Nand r\xe9elle
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 et votre Nand \xe9mul\xe9e, vous devrez indiquer le num\xe9ro 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 de s\xe9rie de votre Wii (ou le setting.txt du dump de votre Nand)
echo.
echo.
echo.
echo.
echo                B = Retour
echo.
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p SNKSERIAL=     Entrez votre choix ici: 

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
echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4d





::...................................SNEEK Nand Builder Confirmation...............................
:SNKNANDCONFIRM
set SNKNANDCONFIRM=

cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
if /i "%SNEEKSELECT%" NEQ "3" goto:notalsoinstalling
if /i "%SNEEKTYPE%" EQU "SD" sfk echo -spat \x20 \x20 \x20 \x20 Vous allez installer SNEEK+DI et cr\xe9er une Nand \xe9mul\xe9e %SNKVERSION%%REGION% 
if /i "%SNEEKTYPE%" EQU "UD" sfk echo -spat \x20 \x20 \x20 \x20 Vous allez installer UNEEK+DI et cr\xe9er une Nand \xe9mul\xe9e %SNKVERSION%%REGION%
if /i "%SNEEKTYPE%" EQU "S" sfk echo -spat \x20 \x20 \x20 \x20 Vous allez installer SNEEK et cr\xe9er une Nand \xe9mul\xe9e %SNKVERSION%%REGION%
if /i "%SNEEKTYPE%" EQU "U" sfk echo -spat \x20 \x20 \x20 \x20 Vous allez installer UNEEK et cr\xe9er une Nand \xe9mul\xe9e %SNKVERSION%%REGION%
goto:skip

:notalsoinstalling

if /i "%SNEEKSELECT%" EQU "2" sfk echo -spat \x20 \x20 \x20 \x20 Vous allez cr\xe9er une Nand \xe9mul\xe9e %SNKVERSION%%REGION%
if /i "%SNEEKSELECT%" NEQ "1" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" sfk echo -spat \x20 \x20 \x20 \x20 Vous allez cr\xe9er SNEEK+DI
if /i "%SNEEKTYPE%" EQU "UD" sfk echo -spat \x20 \x20 \x20 \x20 Vous allez cr\xe9er UNEEK+DI
if /i "%SNEEKTYPE%" EQU "U" sfk echo -spat \x20 \x20 \x20 \x20 Vous allez cr\xe9er UNEEK
if /i "%SNEEKTYPE%" EQU "S" sfk echo -spat \x20 \x20 \x20 \x20 Vous allez cr\xe9er SNEEK
echo.
echo.
echo.
echo.
goto:nonandinstallation

:skip

if not exist temp\install2sneek mkdir temp\install2sneek

echo.
echo.
echo     Installer les WADs de: temp\install2sneek\
sfk echo -spat \x20 \x20 pour \xe9muler la Nand: %nandpath%\
echo.

sfk echo -spat \x20 \x20 Note: Vous pouvez placer des WADs suppl\xe9mentaires dans \x22temp\x5cinstall2sneek\x22 pour les installer
sfk echo -spat \x20 \x20 \x20 \x20 \x20 sur votre Nand \xe9mul\xe9e. Une fois l'installation termin\xe9e, ModMii les d\xe9placera dans le 
echo          dossier "temp".
echo.


if /i "%SNKSERIAL%" EQU "N" goto:none
if /i "%SNKSERIAL%" NEQ "current" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a setting.txt va \xeatre cr\xe9\xe9 avec le num\xe9ro de s\xe9rie: %SNKSERIAL%
if /i "%SNKSERIAL%" EQU "current" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a le setting.txt existant va \xeatre conserv\xe9
echo.
:none

if /i "%SNKHBF%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement Homebrew Filter Channel
if /i "%SNKHBF%" EQU "Y" echo.

if /i "%SNKCIOS%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement cIOS249 rev14
if /i "%SNKCIOS%" EQU "Y" echo.

if /i "%SNKPRI%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement Priiloader v0.4
if /i "%SNKPRI%" EQU "Y" echo.

if /i "%SNKJOY%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement JoyFlow
if /i "%SNKJOY%" EQU "Y" echo.

if /i "%SNKS2U%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement Switch2Uneek
if /i "%SNKS2U%" EQU "Y" echo.


if /i "%ThemeSelection%" EQU "R" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement Dark Wii Red Theme
if /i "%ThemeSelection%" EQU "G" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement Dark Wii Green Theme
echo.
if /i "%SNKPRI%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement Priiloader v0.4
if /i "%ThemeSelection%" NEQ "N" echo.

if /i "%PIC%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene Photo
if /i "%NET%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene Internet
if /i "%WEATHER%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene M\xe9t\xe9o
if /i "%NEWS%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene News
if /i "%MiiQ%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene Mii
if /i "%Shop%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene Shopping
if /i "%Speak%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene Wii Speak

echo.
if /i "%nandexist%" EQU "yes" sfk echo -spat \x20 \x20 \x20 \x20 [Red] ATTENTION: une Nand \xe9mul\xe9e existe d\xe9ja dans:
if /i "%nandexist%" EQU "yes" echo                   %nandpath%
if /i "%nandexist%" EQU "yes" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]la Nand \xe9mul\xe9e existante va \xeatre supprim\xe9e\x2fremplac\xe9e
:nonandinstallation
echo.
echo                Y = Oui, le faire maintenant!
echo.
echo                N = Non
echo.
echo.
echo                B = Retour
echo.
echo                M = Menu principal
echo.
echo.
set /p SNKNANDCONFIRM=     Entrez votre choix ici: 


if /i "%SNKNANDCONFIRM%" EQU "B" goto:%B4SNKCONFIRM%
if /i "%SNKNANDCONFIRM%" EQU "M" goto:MENU
if /i "%SNKNANDCONFIRM%" EQU "N" goto:MENU

if /i "%SNEEKSELECT%" EQU "1" goto:skip
if /i "%SNEEKSELECT%" EQU "3" goto:skip
if /i "%SNKNANDCONFIRM%" EQU "Y" goto:SNKNANDBUILDER
:skip
if /i "%SNKNANDCONFIRM%" EQU "Y" goto:SNEEKINSTALLER

echo Vous avez saisi une valeur incorrecte
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
if exist "%nandpath%"\title sfk echo -spat Effacement de la Nand \xe9mul\xe9e existante...
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
sfk echo -spat D\xe9placement de la Nand \xe9mul\xe9e existante dans le dossier \x5cnands\x5c%NANDcountPLUS1% ...

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

echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo                                   EXTRACTEUR DE JEUX
echo                                     (POUR SNEEK)
echo.
echo.
sfk echo -spat \x20 Entrez le chemin ou vos jeux Wii sont sauv\xe9s
echo.
sfk echo -spat \x20 \x20 \x20 \x2a Les sous dossiers sont \xe9galement scann\xe9s
sfk echo -spat \x20 \x20 \x20 \x2a Les formats support\xe9s incluent les fichiers ISO, CISO et WBFS
echo.
echo.
sfk echo -spat \x20 \x20 R\xe9glage actuel:
echo.
echo         %ISOFOLDER%
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 Notes: \x2a Pour continuer avec le r\xe9glage actuel
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 laissez vide la s\xe9lection et appuyez sur \x22entr\xe9e\x22
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Vous pouvez utiliser le glisser\x2fd\xe9poser du dossier directement
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 dans cette fen\xeatre pour \xe9viter de taper le chemin
echo.
echo.
echo.
echo         EXEMPLES
echo.
echo.
echo            L:
echo.
echo            %%userprofile%%\Desktop\WiiGames
echo                 Note: %%userprofile%% raccourci ne fonctionnant pas sous Windows XP
echo.
echo            WiiGames\ISOs
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Note: Ceci controle le dossier des jeux Wii \x2fISOs ou ModMii \xe0 \xe9t\xe9 enregistr\xe9
echo.
echo            C:\Users\XFlak\Desktop\New Folder
echo.
echo.
echo.
echo         B = Retour
echo.
echo         M = Menu principal
echo.
echo.
set /p DRIVETEMP=     Entrez votre choix ici: 

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
echo Recherche des jeux Wii dans les dossiers...
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
sfk echo -spat Le dossier s\xe9lectionn\xe9 n'existe pas
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKDISCEX

:notexistiso
del gamelist.txt>nul
echo Le dossier choisi ne contient pas de fichiers ISO, CISO ou WBFS
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKDISCEX


::...................................SNK DISC EXtractor2...............................
:SNKDISCEX2

echo.
sfk echo -spat V\xe9rification de l'espace disponible...

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
echo                                       par XFlak
echo.
echo.
echo                                   EXTRACTEUR DE JEUX
echo                                      (POUR SNEEK)
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20[Red]ATTENTION: IL N'Y A PAS ASSEZ D'ESPACE LIBRE
echo.
echo.
echo.
echo         Vous allez convertir %gametotal% jeux Wii
echo.
echo         du dossier source: %ISOFOLDER%
echo         au dossier de destination: %DRIVEU%\games
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
if /i "%units%" EQU "GB" sfk echo -spat \x20 \x20 \x20 \x20[Red]"%DRIVEU%" n\xe9cessite approx. %GigaBytesRequired%GB d'espace libre
if /i "%units%" EQU "MB" sfk echo -spat \x20 \x20 \x20 \x20[Red]"%DRIVEU%" n\xe9cessite %MegaBytesRequired%MB d'espace libre
echo.
sfk echo -spat \x20 \x20 \x20 \x20[Red]Lib\xe9rez plus d'espace ou s\xe9lectionnez un dossier source plus petit et re\x2dessayez
echo.
echo.
echo.

echo                C = Continuer de toute facon
echo.
echo                M = Menu principal
echo.
echo.
echo.
set /p continue=     Entrez votre choix ici: 

if /i "%continue%" EQU "M" del gametotal.txt
if /i "%continue%" EQU "M" goto:MENU
if /i "%continue%" EQU "C" goto:DISCEXCONFIRM

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
echo                                   EXTRACTEUR DE JEUX
echo                                      (POUR SNEEK)
echo.
echo         Vous allez convertir les %gametotal% jeux Wii suivants
echo.
echo         du dossier source: %ISOFOLDER%
echo         au dossier de destination: %DRIVEU%\games
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
echo     Voulez-vous commencer?
echo.
echo.
::echo        Notes: * chaque convertion de jeu prend environ 5-15 minutes
::echo.
::echo               * assurez-vous d'avoir assez d'espace sur: %DRIVEU%
::sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 sinon l'extraction \xe9chouera d\xe8s qu'il n'y aura plus assez d'espace
echo.
echo.
echo.
echo                Y = Oui
echo.
echo                N = Non
echo.
echo.
echo.
echo                B = Retour
echo.
echo                M = Menu principal
echo.
echo.
echo.
set /p DISCEXCONFIRM=     Entrez votre choix ici: 


if /i "%DISCEXCONFIRM%" EQU "M" del gametotal.txt
if /i "%DISCEXCONFIRM%" EQU "N" del gametotal.txt
if /i "%DISCEXCONFIRM%" EQU "Y" del gametotal.txt


if /i "%DISCEXCONFIRM%" EQU "M" goto:MENU
if /i "%DISCEXCONFIRM%" EQU "N" goto:MENU
if /i "%DISCEXCONFIRM%" EQU "Y" mode con cols=85 lines=54
if /i "%DISCEXCONFIRM%" EQU "Y" goto:DISCEXSTART
if /i "%DISCEXCONFIRM%" EQU "B" mode con cols=85 lines=54
if /i "%DISCEXCONFIRM%" EQU "B" goto:DRIVEUCHANGE

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DISCEXCONFIRM



::----------------Start WIT DISCEXTRACTION---------------
:DISCEXSTART
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo                                   EXTRACTEUR DE JEUX
echo                                      (POUR SNEEK)
echo.
echo.
sfk echo -spat \x20 Mise \xe0 jour de la liste des titres des jeux Wii (titles.txt)
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
echo sort "Gamelist2.txt" -o "Gamelist-sorted.txt">>"%DriveU%"\Game-List-Updater[ModMii].bat
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
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20[Green]EXTRACTION DES JEUX POUR SNEEK TERMINEE
echo.
sfk echo -spat \x20 Une liste de vos jeux peut \xeatre trouv\xe9e ici: %DriveU%\Game-List[ModMii].csv
sfk echo -spat \x20 Pour mettre \xe0 jour cette liste \xe0 tout moment, ex\xe9cutez %DriveU%\Game-List-Updater[ModMii].bat
echo.
echo Appuyez sur une touche pour revenir au menu principal.
pause>nul
goto:MENU



::........................................LIST / BATCH.......................................
:LIST
Set List=
cls
echo                                        ModMii                                v%currentversion%
sfk echo -spat \x20 \x20 \x20 \x20 [Red] PAGE 1 TELECHARGEMENT [def] \x20 \x20 \x20 par XFlak
echo.
sfk echo -spat \x20 \x20 Choisir les fichiers \xe0 ajouter/supprimer de la liste de t\xe9l\xe9chargement
sfk echo -spat \x20 \x20 (les fichiers s\xe9lectionn\xe9s sont marqu\xe9s d'une \x2a)
echo.
sfk echo -spat D = T\xe9l\xe9charger les fichiers s\xe9lectionn\xe9s \x20 1/2/3/4 = Page 1/2/3/4 \x20 DR = Menu Drive
sfk echo -spat C = Effacer la liste de t\xe9l\xe9chargement \x20  (vide) = Page suivante \x20 M = Menu principal
echo.
if exist "%Drive%"\WAD echo           R = Renommer le dossier actuel %Drive%\WAD en %Drive%\WAD#
if exist "%Drive%"\WAD sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 (sinon les wads seront sauvegard\xe9s dans le dossier WAD actuel)
if exist "%Drive%"\WAD echo.
sfk echo -spat \x20 S\xe9lectionner un groupe: [Red](A)[def]ll, [Red](U)[def]SA, [Red](E)[def]URO, [Red](J)[def]AP, [Red](K)[def]OR, [Red](I)[def]OSs actifs, 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20[Red](PR)[def]otection suppl\xe9mentaire
echo.
sfk echo -spat \x20 \x20 [Red] Menus Syst\xe8me \x20 \x20 \x20 \x20 \x20 IOSs\MIOS Non-Fakesigned \x20 \x20 \x20 \x20 Autres WADs
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

sfk echo -spat \x20 \x20%SM4.2J% 4.2J = 4.2J SM \x20 \x20 \x20 \x20 \x20 \x20 %IOS31% 31 = IOS31v3608\x20 \x20 \x20 \x20 \x20 \x20[Red]IOSs Fakesigned 

echo    %SM4.3J% 4.3J = 4.3J SM            %IOS33% 33 = IOS33v3608        
echo    %SM4.1K% 4.1K = 4.1K SM	      %IOS34% 34 = IOS34v3608         %IOS11P60% 11 = IOS11(IOS60P)
echo    %SM4.2K% 4.2K = 4.2K SM	      %IOS35% 35 = IOS35v3608         %IOS20P60% 20 = IOS20v16174(IOS60P)
echo    %SM4.3K% 4.3K = 4.3K SM           %IOS36% 36a = IOS36v3351         %IOS30P60% 30 = IOS30(IOS60P)
echo                               %IOS36v3608% 36 = IOS36v3608        %IOS30P% 30P = IOS30-Patched
sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red]Cha\xeenes[def]\x20 \x20 \x20 \x20 \x20 \x20 \x20 %IOS37% 37 = IOS37v5663\x20 \x20 \x20 \x20 \x20 %IOS40P60% 40 = IOS40(IOS60P)
echo                               %IOS38% 38 = IOS38v4124         %IOS50P% 50 = IOS50-Patched
echo     %P% P = Photo 1.1(U/E/J)     %IOS41% 41 = IOS41v3607         %IOS52P% 52 = IOS52-Patched
echo    %PK% PK = Photo 1.1 (KOR)      %IOS43% 43 = IOS43v3607         %IOS60P% 60 = IOS60-Patched
echo    %S% SH = Shopping (U/E/J)     %IOS45% 45 = IOS45v3607        %IOS70K% 70K = IOS70(IOS60P)
echo    %SK% SK = Shopping (KOR)       %IOS46% 46 = IOS46v3607         %IOS70P% 70 = IOS70-Patched
echo    %IU% IU = Internet (USA)       %IOS48v4124% 48 = IOS48v4124        %IOS80K% 80K = IOS80(IOS60P)
echo    %IE% IE = Internet (EUR)       %IOS53% 53 = IOS53v5663         %IOS80P% 80 = IOS80-Patched
echo    %IJ% IJ = Internet (JAP)       %IOS55% 55 = IOS55v5663        %IOS236% 236 = IOS236(IOS36P)
echo    %WU% WU = Meteo (USA)	      %IOS56% 56 = IOS56v5662
sfk echo -spat \x20 \x20%WE% WE = Meteo (EUR) \x20 \x20 \x20 \x20 \x20 %IOS57% 57 = IOS57v5919\x20 \x20 \x20 \x20 \x20 \x20[Red] Fichiers SNEEK 
echo    %WJ% WJ = Meteo (JAP)	      %IOS58% 58 = IOS58v6176         
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
set /p LIST=     Entrez votre choix ici: 


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


echo Vous avez saisi une valeur incorrecte
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
sfk echo -spat \x20 \x20 \x20 \x20 [Red] PAGE 2 TELECHARGEMENT [def] \x20 \x20 \x20 par XFlak

echo.
sfk echo -spat \x20 \x20 Choisir les fichiers \xe0 ajouter/supprimer de la liste de t\xe9l\xe9chargement
sfk echo -spat \x20 \x20 (les fichiers s\xe9lectionn\xe9s sont marqu\xe9s d'une *)
echo.
sfk echo -spat D = T\xe9l\xe9charger les fichiers s\xe9lectionn\xe9s \x20 1/2/3/4 = Page 1/2/3/4 \x20 DR = Menu Drive 
sfk echo -spat C = Effacer la liste de t\xe9l\xe9chargement  \x20     (vide) = Page suivante  \x20  M = Menu principal
echo.
if exist "%Drive%"\WAD echo               R = Renommer le dossier actuel %Drive%\WAD en %Drive%\WAD#
if exist "%Drive%"\WAD sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 (sinon les wad seront sauvegard\xe9s dans le dossier WAD actuel)
if exist "%Drive%"\WAD echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 S\xe9lectionner un groupe: [Red](A)[def]ll, [Red](U)[def]SB-Loader, [Red](J)[def]ust for Fun, [Red](E)[def]xploits
echo.

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 [Red] Fichiers USB-Loader  \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Just For Fun!
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


sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Apps Wii \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Exploits
echo.
echo       %HM% HM = HackMii Installer             %BB1% BB1 = Bannerbomb v1
echo      %bootmiisd% BSD = BootMii SD Files              %BB2% BB2 = Bannerbomb v2
echo     %yawm% YAWM = Yet Another Wad Manager Mod  %Pwns% PWNS = Indiana Pwns (USA\EUR\JAP)
echo      %MMM% MMM = Multi-Mod Manager               %Smash% SS = Smash Stack (USA\EUR\JAP\KOR)
echo      %dop% DOP = Dop-Mii v13                     %YUGI% YU = YU-GI-OWNED (USA\EUR\JAP)
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
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] LEGENDE:[def] \x22=\x22 Downloads en auto update
echo.


if not exist "%Drive%"\WAD echo.
if not exist "%Drive%"\WAD echo.
if not exist "%Drive%"\WAD echo.

set /p OLDLIST=     Entrez votre choix ici: 

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


echo Vous avez saisi une valeur incorrecte
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
sfk echo -spat \x20 \x20 \x20 \x20 [Red] PAGE 3 TELECHARGEMENT [def] \x20 \x20 \x20 par XFlak

echo.
sfk echo -spat \x20 \x20 Choisir les fichiers \xe0 ajouter/supprimer de la liste de t\xe9l\xe9chargement
sfk echo -spat \x20 \x20 (les fichiers s\xe9lectionn\xe9s sont marqu\xe9s d'une \x2a)
echo.
sfk echo -spat D = T\xe9l\xe9charger les fichiers s\xe9lectionn\xe9s \x20 1/2/3/4 = Page 1/2/3/4 \x20 DR = Menu Drive 
sfk echo -spat C = Effacer la liste de t\xe9l\xe9chargement  \x20     (vide) = Page suivante  \x20  M = Menu principal
echo.
echo.
echo.
sfk echo -spat \x20[Red]NE PAS INSTALLER DES THEMES SANS PROTECTION: BOOTMII, PRIILOADER ET SAUVEGARDE NAND



echo.
sfk echo -spat \x20 \x20 \x20[Red]INSTALLER SEULEMENT DES THEMES POUR LA VERSION/REGION DE VOTRE MENU SYSTEME!
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20S\xe9lectionner un groupe: [Red](A)[def]ll, Th\xe8mes pour [Red](U)[def]SA, [Red](E)[def]uro, [Red](J)[def]ap, [Red](K)[def]orean
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20Th\xe8mes Menu Syst\xe8me originaux pour [Red](US)[def]A, [Red](EU)[def]ro, [Red](JA)[def]p, [Red](KO)[def]rean
echo.
echo.
echo    %MyM% MyM = MyMenuify
echo.
echo.


if "%selectedtheme%"=="" set selectedtheme=R


if /i "%selectedtheme%" NEQ "R" goto:skipred


sfk echo -spat \x20 \x20 WWW = Voir [Red]DarkWii Red Theme[def] sur youtube
sfk echo -spat \x20 \x20 \x20 S = Changer de liste pour t\xe9l\xe9charger [Green]DarkWii Green Theme[def]
echo.
sfk echo -spat \x20 [Red]CSMs DarkWii Red  \x20 \x20 \x20 \x20 \x20 Menus Syst\xe8me DarkWii Red \x20 \x20 Th\xe8mes Wii originaux
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

sfk echo -spat \x20 \x20 WWW = Voir [Green]DarkWii Green Theme[def] sur youtube
sfk echo -spat \x20 \x20 \x20 S = Changer de liste pour t\xe9l\xe9charger [Red]DarkWii Red Theme[def]

echo.
sfk echo -spat \x20 [Red]CSMs DarkWii [Green]Green  \x20 \x20 \x20  [Red]Menus Syst\xe8me DarkWii [Green]Green \x20 \x20 [Red]Th\xe8mes Wii originaux
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



set /p LIST3=     Entrez votre choix ici: 

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


echo Vous avez saisi une valeur incorrecte
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
sfk echo -spat \x20 \x20 \x20 \x20 [Red] PAGE 4 TELECHARGEMENT [def] \x20 \x20 \x20 par XFlak
echo.
sfk echo -spat \x20 \x20 Choisir les fichiers \xe0 ajouter/supprimer de la liste de t\xe9l\xe9chargement
sfk echo -spat \x20 \x20 (les fichiers s\xe9lectionn\xe9s sont marqu\xe9s d'une \x2a)
echo.
sfk echo -spat D = T\xe9l\xe9charger les fichiers s\xe9lectionn\xe9s \x20 1/2/3/4 = Page 1/2/3/4 \x20 DR = Menu Drive 
sfk echo -spat C = Effacer la liste de t\xe9l\xe9chargement  \x20     (vide) = Page suivante  \x20  M = Menu principal
echo.
if exist "%Drive%"\WAD echo               R = Renommer le dossier actuel %Drive%\WAD en %Drive%\WAD#
if exist "%Drive%"\WAD sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 (sinon les wad seront sauvegard\xe9s dans le dossier WAD actuel)
if exist "%Drive%"\WAD echo.
sfk echo -spat S\xe9lectionner un groupe: [Red](A)[def]ll, [Red](REC)[def]ommended CIOSs, [Red](cM)[def]IOSs, [Red](v4)[def] cIOSs, [Red](v5)[def] cIOSs
sfk echo -spat \x20 \x20 [Red](v14)[def] cIOSs, [Red](v17b)[def] cIOSs, [Red](v19)[def] cIOSs, [Red](v20)[def] cIOSs, [Red](v21)[def] cIOSs, v21[Red](d2x)[def] cIOSs
echo.

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Waninkoko v17b cIOSs \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Hermes v4 cIOSs
echo              %cIOS249-v17b% 24917 = cIOS249-v17b              %cIOS223[37-38]-v4% 223 = cIOS223[37-38]-v4
echo              %cIOS250-v17b% 25017 = cIOS250-v17b             %cIOS222[38]-v4% 2224 = cIOS222[38]-v4
echo.

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Waninkoko v19 cIOSs \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Hermes v5 cIOSs
echo              %cIOS249[37]-v19% 24937 = cIOS249[37]-v19           %cIOS202[57]-v5% 202 = cIOS202[57]-v5
echo            %cIOS249[38]-v19% 2491938 = cIOS249[38]-v19           %cIOS222[38]-v5% 222 = cIOS222[38]-v5
echo            %cIOS249[57]-v19% 2491957 = cIOS249[57]-v19         %cIOS223[37]-v5% 22337 = cIOS223[37]-v5
echo              %cIOS250[37]-v19% 25037 = cIOS250[37]-v19         %cIOS223[57]-v5% 22357 = cIOS223[57]-v5
echo            %cIOS250[38]-v19% 2501938 = cIOS250[38]-v19         %cIOS224[37]-v5% 22437 = cIOS224[37]-v5
echo              %cIOS250[57]-v19% 25057 = cIOS250[57]-v19           %cIOS224[57]-v5% 224 = cIOS224[57]-v5
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
if exist modules\More-cIOSs sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20BETA = param\xe8tres d2x beta 

if not exist "%Drive%"\WAD echo.
if not exist "%Drive%"\WAD echo.
if not exist "%Drive%"\WAD echo.

set /p LIST4=     Entrez votre choix ici: 

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

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo                          TELECHARGEMENTS AVANCES PERSONNALISES
echo.
sfk echo -spat \x20 Choisir un fichier pour le t\xe9l\xe9chargement avanc\xe9 personnalis\xe9
echo.
sfk echo -spat \x20D = T\xe9l\xe9charger les fichiers s\xe9lectionn\xe9s \x20 1/2/3/4 = Page 1/2/3/4 \x20 M = Main Menu
echo  C = Effacer la file d'attente                (vide) = Page suivante DR = Menu Drive
echo.
sfk echo -spat Note: Pour revenir \xe0 cette page depuis une autre page de t\xe9l\xe9chargement tapez \x22ADV\x22
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 U = T\xe9l\xe9chargement personnalis\xe9 (tr\xe8s avanc\xe9)
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 (t\xe9l\xe9chargement\x2fpatch d'IOS, MIOS ou Menu Syst\xe8me)
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
if exist modules\More-cIOSs sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20BETA = param\xe8tres d2x beta

echo.
sfk echo -spat \x20 \x20 \x20 %AdvNumber% t\xe9l\xe9chargements avanc\xe9s en file d'attente
echo.
set /p ADVLIST=     Entrez votre choix ici: 


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


echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 \x20 S\xe9lectionnez la beta cIOS d2x que vous voulez construire:
echo.
echo.


if /i "%d2xTOTAL%" EQU "0" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Pas de d2x-betas pr\xe9sent dans le dossier modules\x5cMore\x2dcIOSs) & (goto:quickskip)
sfk echo -spat \x20 \x20 \x20 N = Non, construire les cIOSs d2x inclus \xe0 ModMii v%currentversion%
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
sfk echo -spat \x20 \x20 WWW = V\xe9rification des mises \xe0 jour \xe0 http:\x2f\x2ftinyurl.com\x2fd2xcIOS

echo.
echo.
echo          B = Retour
echo.
echo          M = Menu principal
echo.
echo.
set /p betacios=     Entrez votre choix ici: 

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
echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
echo   Comment souhaitez-vous patcher %wadnameless%?
echo.
echo.
echo.
echo                A = Les 3 patchs disponibles
echo                N = Aucun Patch
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
echo          B = Retour
echo.
echo          M = Menu principal
echo.
echo.
echo.
set /p ADVPATCH=     Entrez votre choix ici: 



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

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:ADVPAGE2


::------------------------------------ADVANCED page 3 - SLOT--------------------------------
:ADVPAGE3
set ADVSLOT=
set SLOTCODE=
set SLOTNAME=


cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo   Changement du slot d'installation pour %wadnameless%%patchname%
echo.
echo   Entrez un nouveau slot d'installation ici
echo.
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] ATTENTION: soyez prudent avec le slot d'IOS choisi,
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20[Red] s'il \xe9crase un IOS crucial il y a un
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] RISQUE DE BRICK
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 Note: Doit \xeatre entre 3 et MAX est 254
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 N = Non, laisser le slot inchang\xe9
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo               B = Retour
echo.
echo               M = Menu principal
echo.
echo.
echo.
set /p ADVSLOT=     Entrez votre choix ici: 


::"B" will actually take u to the menu only to clear the download_queue, then it will return to advanced page1

if /i "%ADVSLOT%" EQU "M" goto:MENU


if /i "%ADVTYPE%" EQU "CIOS" goto:BACKTOMENUFIRST
if /i "%ADVSLOT%" EQU "B" goto:ADVPAGE2
:BACKTOMENUFIRST
if /i "%ADVSLOT%" EQU "B" goto:MENU


set SLOTCODE= -slot %ADVSLOT%
set SLOTNAME=slot%ADVSLOT%

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
echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
echo.
echo   Souhaitez-vous changer la version de %wadnameless%%patchname%%slotname%?
echo.
echo.
echo     Note: MAXIMUM 65535
echo.
echo.
echo.
echo.
echo               MAX = MAX (65535)
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 N = Non, laisser la version inchang\xe9e (%versionreal%)
if /i "%VER%" EQU "*" goto:bypass
if /i "%versionreal%" NEQ "65535" echo.
if /i "%versionreal%" NEQ "65535" echo                V1 = Version + 1 (%versionplus1%)
:bypass
echo.
echo.
echo.
echo                 B = Retour
echo.
echo                 M = Menu principal
echo.
echo.
echo.
set /p ADVVERSION=     Entrez votre choix ici: 


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
echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
echo                           TELECHARGEMENTS AVANCES PERSONNALISES
echo.
echo.

if /i "%changes%" EQU "none" goto:nochanges
sfk echo -spat \x20 Les r\xe9glages sont\x2dils corrects?
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 T\xe9l\xe9charger %wadname% et patcher en cons\xe9quence
echo.

if /i "%ADVTYPE%" NEQ "CIOS" goto:miniskip
if /i "%ADVSLOT%" EQU "N" goto:miniskip
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 cIOS[Red]%ADVSLOT%[def]%wadname:~7%[Red]%patchname%%slotname%%versionname%
goto:yeschanges
:miniskip

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 %wadnameless%[Red]%patchname%%slotname%%versionname%
goto:yeschanges
:nochanges

echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Yellow] Vous n'avez s\xe9lectionn\xe9 aucun changement \xe0 effectuer pour %wadnameless%
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Si vous souhaitez t\xe9l\xe9charger %wadnameless%,
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 vous pouvez le faire \xe0 partir de la page 1 de t\xe9l\xe9chargement
:yeschanges

echo.
echo.
echo.
echo.

if /i "%changes%" NEQ "none" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 Y = Oui, ajouter le t\xe9l\xe9chargement avanc\xe9 \xe0 la file d'attente
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 N = Non, retour au menu T\xe9l\xe9chargements avanc\xe9s personnalis\xe9s
echo.
echo.
echo.
echo                B = Retour
echo.
echo                M = Menu principal
echo.
echo.
echo.
set /p ADVCONFIRM=     Entrez votre choix ici: 


::"B" will actually take u to the menu only to clear the download_queue, then it will return to advanced page1
if /i "%ADVCONFIRM%" EQU "B" goto:ADVPAGE4
if /i "%ADVCONFIRM%" EQU "M" goto:MENU
if /i "%ADVCONFIRM%" EQU "N" goto:ADVANCED

if /i "%changes%" EQU "none" goto:nochanges2


if /i "%ADVCONFIRM%" EQU "Y" set /a AdvNumber=%AdvNumber%+1
if /i "%ADVCONFIRM%" EQU "Y" goto:SaveADVdlSettings

:nochanges2

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 Entrez le num\xe9ro de l'IOS que vous souhaitez t\xe9l\xe9charger
::echo         soit en Decimal (x,xx,xxx; ie. 9,60,249), soit en Hexa (xx; ie. F9=249)
sfk echo -spat \x20 ou entrez "SM" ou "MIOS" pour t\xe9l\xe9charger un Menu Syst\xe8me ou MIOS
echo.
echo.
echo.
sfk echo  -spat \x20 \x20 \x20 [Red] ATTENTION: Soyez certain que le num\xe9ro d'IOS saisi existe actuellement
echo.
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 #  = T\xe9l\xe9charger le num\xe9ro d'IOS
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 SM  = T\xe9l\xe9charger un Menu Syst\xe8me 
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 MIOS = T\xe9l\xe9charger un MIOS
echo.
echo.
echo.
echo.
echo                B = Retour
echo.
echo                M = Menu principal
echo.
echo.
echo.
echo.
set /p DEC=     Entrez votre choix ici: 

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
echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:CUSTOM



:CUSTOMPAGE2
set VER=
set ADVPATCH=
set patchcode=
set patchname=

cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
if /i "%DEC%" EQU "SM" sfk echo -spat \x20 Quelle version de Menu Syst\xe8me souhaitez\x2dvous t\xe9l\xe9charger? (ie. XXX)
if /i "%DEC%" EQU "SM" goto:NEXT1
if /i "%DEC%" EQU "MIOS" sfk echo -spat \x20 Quelle version de MIOS souhaitez\x2dvous t\xe9l\xe9charger? (ie. 4, 5, 8, 10)
if /i "%DEC%" EQU "MIOS" goto:NEXT1
sfk echo -spat \x20 \Quelle version d'IOS %DEC% souhaitez\x2dvous t\xe9l\xe9charger?
:NEXT1
echo.
echo.
echo.
sfk echo  -spat \x20 \x20 \x20 \x20 \x20 \x20 [Red] ATTENTION:[def] - Soyez certain que la version saisie existe actuellement
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2d Les versions les plus r\xe9centes peuvent \xeatre des stubs
echo.
echo.
echo.
echo.
if /i "%DEC%" NEQ "SM" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a = T\xe9l\xe9charger la version la plus r\xe9cente
if /i "%DEC%" EQU "SM" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a = T\xe9l\xe9charger le Menu Syst\xe8me cor\xe9en le plus r\xe9cent
echo.
echo.
echo               B = Retour
echo.
echo               M = Menu principal
echo.
echo.
echo.
echo.
set /p VER=     Entrez votre choix ici: 

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
echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:CUSTOMPAGE2




:CONFIRM
if /i "%ADVVERSION%" EQU "N" set VERSIONNAME=
if /i "%ADVVERSION%" EQU "N" set VERSIONCODE=


set VERFINAL=%VER%
if /i "%VER%" EQU "*" set VERFINAL=NEW



cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo.

if /i "%DEC%" EQU "SM" sfk echo -spat \x20 Etes\x2dvous certain de vouloir t\xe9l\xe9charger le Menu Syst\xe8me v%VER%?
if /i "%DEC%" EQU "SM" goto:NEXT2
if /i "%DEC%" EQU "MIOS" sfk echo -spat \x20 Etes\x2dvous certain de vouloir t\xe9l\xe9charger le MIOS v%VER%?
if /i "%DEC%" EQU "MIOS" goto:NEXT2


sfk echo -spat \x20 Etes\x2dvous certain de vouloir t\xe9l\xe9charger l'IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%




:NEXT2
echo.
echo.
echo.
sfk echo  -spat \x20 \x20 \x20 \x20 [Red]ATTENTION: ce t\xe9l\xe9chargement va \xe9chouer si le fichier n'existe pas.
echo.
echo.
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 Y = Oui, ajouter le t\xe9l\xe9chargement avanc\xe9 \xe0 la file d'attente
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 N = Non, retour au menu T\xe9l\xe9chargements avanc\xe9s personnalis\xe9s
echo.
echo.
echo.
echo               B = Retour
echo.
echo               M = Menu principal
echo.
echo.
echo.
set /p CONFIRM=     Entrez votre choix ici: 

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

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
echo.
echo  Quelle application Wii souhaitez-vous configurer?
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 BM = BootMii (cr\xe9er bootmii.ini)
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 MMM = Multi-Mod Manager (cr\xe9er mmmconfig.txt)
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 WM = Wad Manager (cr\xe9er wm_config.txt)
echo.
echo.
echo.
echo.
echo            B = Retour
echo.
echo            M = Menu principal
echo.
echo.
echo.
echo.
set /p configfile=     Entrez votre choix ici: 

if /i "%configfile%" EQU "M" goto:MENU
if /i "%configfile%" EQU "B" goto:MENU

if /i "%configfile%" EQU "BM" goto:BMCONFIG
if /i "%configfile%" EQU "WM" goto:WMCONFIG
if /i "%configfile%" EQU "MMM" goto:MMMCONFIG


echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:CONFIGFILEMENU




::...................................BootMii CONFIGURATOR (bootmii.ini)...............................
:BMCONFIG
set BMVIDEO=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20  Ceci va cr\xe9er un fichier bootmii.ini dans %DRIVE%\bootmii\
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20  pour d\xe9terminer comment BootMii sera lanc\xe9.
echo.
echo.
echo.
echo.
sfk echo -spat \x20 Choisir le mode vid\xe9o que Bootmii doit utiliser :
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
echo                 B = Retour
echo.
echo                 M = Menu principal
echo.
echo.
echo.
echo.
set /p BMVIDEO=     Entrez votre choix ici: 

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

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG







::...................................BootMii CONFIGURATOR (bootmii.ini)...............................
:BMCONFIG2
set BMBOOT=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo.
sfk echo -spat \x20 Choisissez les param\xe8tres de l'autoboot de Bootmii
echo.
echo.
echo.
echo                 O = OFF     (BootMii)
echo                 H = HBC     (Homebrew Channel)
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20  S = SYSMENU (Menu Syst\xe8me)
echo.
echo.
echo.
echo.
echo                 B = Retour
echo.
echo                 M = Menu principal
echo.
echo.
echo.
echo.
set /p BMBOOT=     Entrez votre choix ici: 

if /i "%BMBOOT%" EQU "M" goto:MENU
if /i "%BMBOOT%" EQU "B" goto:BMCONFIG

if /i "%BMBOOT%" EQU "O" set BMBOOT=OFF
if /i "%BMBOOT%" EQU "H" set BMBOOT=HBC
if /i "%BMBOOT%" EQU "S" set BMBOOT=SYSMENU

if /i "%BMBOOT%" EQU "OFF" set BMDELAY=0
if /i "%BMBOOT%" EQU "OFF" goto:BMCONFIG4
if /i "%BMBOOT%" EQU "HBC" goto:BMCONFIG3
if /i "%BMBOOT%" EQU "SYSMENU" goto:BMCONFIG3

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG2



::...................................BootMii CONFIGURATOR (bootmii.ini)...............................
:BMCONFIG3
set BMDELAY=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo.
if /i "%BMBOOT%" EQU "HBC" echo   Combien de secondes doit attendre Bootmii pour lancer l'HBC?
if /i "%BMBOOT%" EQU "SYSMENU" sfk echo -spat \x20 Combien de secondes doit attendre Bootmii pour lancer le Menu Syst\xe8me?
echo.
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 R\xe9glages possibles:
echo.
echo                 0,1,2,3,4,5,6,7,8,9,10
echo.
echo.
echo.
echo.
echo                 B = Retour
echo.
echo                 M = Menu principal
echo.
echo.
echo.
echo.
set /p BMDELAY=     Entrez votre choix ici: 

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

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG3





::...................................BootMii CONFIGURATOR (bootmii.ini)...............................
:BMCONFIG4
set BMSD=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo.
sfk echo -spat \x20 Souhaitez\x2dvous aussi t\xe9l\xe9charger les fichiers SD n\xe9cessaires au lancement 
echo   de BootMii?
echo.
echo.
echo.
sfk echo -spat \x20 Note: Ce sont les m\xeames que ceux g\xe9n\xe9r\xe9s par Hackmii installer lors de
sfk echo -spat \x20 \x20 \x20 \x20 l'installation de Bootmii en Boot2 ou en pr\xe9parant la SD
echo.
echo.
echo.
echo                 Y = Oui
echo.
echo                 N = Non
echo.
echo.
echo.
echo.
echo                 B = Retour
echo.
echo                 M = Menu principal
echo.
echo.
echo.
echo.
set /p BMSD=     Entrez votre choix ici: 

if /i "%BMSD%" EQU "M" goto:MENU

if /i "%BMBOOT%" EQU "OFF" goto:skip
if /i "%BMSD%" EQU "B" goto:BMCONFIG3
:skip
if /i "%BMSD%" EQU "B" goto:BMCONFIG2

if /i "%BMSD%" EQU "Y" goto:BMCONFIG5
if /i "%BMSD%" EQU "N" goto:BMCONFIG5


echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG4






::...................................BootMii CONFIGURATOR page 5...............................
:BMCONFIG5
set BMCONFIRM=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 Ces r\xe9glages sont\x2dils corrects?
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Mode vid\xe9o r\xe9gl\xe9 sur %BMVIDEO%
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a AutoBoot r\xe9gl\xe9 sur %BMBOOT%
if /i "%BMBOOT%" EQU "OFF" goto:nodelay
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a D\xe9lai d'AutoBoot r\xe9gl\xe9 sur %BMDELAY% secondes
:nodelay
echo.
if /i "%BMSD%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9charger les fichiers SD de Bootmii pour lancer Bootmii
echo.
echo.
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 Y = Oui, cr\xe9er bootmii.ini avec ces r\xe9glages
if exist "%Drive%"\bootmii\bootmii.ini sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 Note: le bootmii.ini existant sera \xe9cras\xe9
echo.
echo           N = Non, ramenez moi au Menu principal
echo.
echo.
echo.
echo           B = Retour
echo.
echo           M = Menu principal
echo.
echo.
echo.
echo.
set /p BMCONFIRM=     Entrez votre choix ici: 

if /i "%BMCONFIRM%" EQU "B" goto:BMCONFIG4
if /i "%BMCONFIRM%" EQU "M" goto:MENU
if /i "%BMCONFIRM%" EQU "N" goto:MENU
if /i "%BMCONFIRM%" EQU "Y" goto:BUILDBMCONFIG

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
echo.
sfk echo -spat \x20 Bien qu'optionnel, ceci va cr\xe9er un fichier wm_config.txt dans %DRIVE%\WAD\
echo   Vous verrez toutes les invites si vous n'avez pas ce fichier.
echo.
echo     Note: fonctionne uniquement avec YAWMM, Wad Manager Multi-Mod
echo           et WAD Manager Folder Mod
echo.
echo.
echo.
echo   Entrez l'IOS que doit charger Wad Manager
echo.
echo.
echo. 
echo     Note: le MAX est 254
echo           les choix courants sont 36, 249, 250, etc.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 l'installation d'\xe9mulation de Nand n'est valable que pour les 249 ou 250
echo.
echo.
echo.
echo              N = Aucun (Wad Manager vous demandera de choisir)
echo.
echo.
echo.
echo              B = Retour
echo.
echo              M = Menu principal
echo.
echo.
echo.
echo.
set /p WMCIOS=     Entrez votre choix ici: 

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
echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WMCONFIG


::...................................WAD MANAGER CONFIGURATOR page 2...............................
:WMCONFIG2
set WMDEVICE=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo.
sfk echo -spat \x20 Entrez le p\xe9riph\xe9rique FAT que vous souhaitez charger automatiquement.
echo.
echo     Note: Vous pouvez entrer soit le chiffre soit le mot
echo.
echo.
echo.
echo.
echo           1 = SD
echo           2 = USB
echo           3 = USB2
echo           4 = GCSDA
echo           5 = GCSDA
echo.
echo           N = Aucun (Wad Manager vous demandera de choisir)
echo.
echo.
echo.
echo.
echo           B = Retour
echo.
echo           M = Menu principal
echo.
echo.
echo.
echo.
set /p WMDEVICE=     Entrez votre choix ici: 

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



echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
echo                                   Emulation de Nand
echo.
echo.
sfk echo -spat \x20 Entrez le dispositif de Nand que vous souhaitez s\xe9lectionner automatiquement.
echo.
echo.
echo     Note: les outils PC tels que ShowMiiWads sont mieux pour installer des wads 
sfk echo -spat \x20 \x20 \x20 \x20 \x20 sur Nand \xe9mul\xe9e. Il est donc conseill\xe9 de laisser l'\xe9mulation de Nand 
echo           sur Disabled
echo.
echo     Note: vous pouvez entrer le chiffre ou le mot
echo.
echo.
echo.
echo             1 = Disable
echo             2 = USB
echo             3 = SD
echo.
echo             N = Aucun (Wad Manager vous demandera de choisir cIOS249 ou cIOS250)
echo.
echo.
echo.
echo.
echo             B = Retour
echo.
echo             M = Menu principal
echo.
echo.
echo.
echo.
set /p WMNAND=     Entrez votre choix ici: 


if /i "%WMNAND%" EQU "3" SET WMNAND=SD
if /i "%WMNAND%" EQU "2" SET WMNAND=USB
if /i "%WMNAND%" EQU "1" SET WMNAND=Disable


if /i "%WMNAND%" EQU "SD" goto:WMCONFIG4
if /i "%WMNAND%" EQU "USB" goto:WMCONFIG4
if /i "%WMNAND%" EQU "Disable" goto:WMCONFIG4
if /i "%WMNAND%" EQU "N" goto:WMCONFIG4
if /i "%WMNAND%" EQU "M" goto:MENU
if /i "%WMNAND%" EQU "B" goto:WMCONFIG2


echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WMCONFIG3

::...................................WAD MANAGER CONFIGURATOR page 4...............................
:WMCONFIG4
set WMPATH=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo.
echo   Entrez le chemin du dossier que vous souhaitez explorer initialement.
echo.
sfk echo -spat \x20 \x20 Note: si vous n'avez pas de dossier de d\xe9marrage,
sfk echo -spat \x20 \x20 \x20 \x20 \x20 le dossier par d\xe9faut sera /WAD
echo.
sfk echo -spat \x20 \x20 Note: soyez certain que le dossier existe, sinon vous aurez une erreur
echo.
echo.
echo.
echo.
echo     Exemples:
echo                /WAD/Forwarders
echo                /myWad
echo.                   
sfk echo -spat \x20 \x20 Note: '/' d\xe9finit un dossier de d\xe9marrage \xe0 la racine du p\xe9riph\xe9rique
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20  N = Aucun (la valeur pas d\xe9faut est /WAD)
echo.
echo.
echo.
echo.
echo           B = Retour
echo.
echo           M = Menu principal
echo.
echo.
echo.
echo.
set /p WMPATH=     Entrez votre choix ici: 


if /i "%WMPATH%" EQU "N" SET WMPATH=/WAD
if /i "%WMPATH%" EQU "B" goto:WMCONFIG4BACK
if /i "%WMPATH%" EQU "M" goto:MENU
IF "%WMPATH%"=="" echo vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
echo.
sfk echo -spat \x20 Entrez un mot de passe pour acc\xe9der \xe0 Wad Manager en utilisant LRUD
echo.
echo         L = Gauche
echo         R = Droite
echo         U = Haut
echo         D = Bas
echo.
sfk echo -spat \x20 Note: le mot de passe est entr\xe9 avec la WiiMote ou le controleur GC
sfk echo -spat \x20 \x20 \x20 \x20 max 10 caract\xe8res
echo.
sfk echo -spat \x20 Note: si vous n'avez pas de mot de passe, la valeur par d\xe9faut  est 
echo         aucun mot de passe
echo.
echo.
echo.
echo.
echo          Exemples:
echo                   UDLR
echo                   UDLRUDLRUD
echo                   UUUUUUU
echo                   L
echo.
echo.
echo             N = Aucun (sans mot de passe)
echo.
echo.
echo.
echo.
echo             B = Retour
echo.
echo             M = Menu principal
echo.
echo.
echo.
echo.
set /p WMPASS=     Entrez votre choix ici: 

if /i "%WMPASS%" EQU "B" goto:WMCONFIG4
if /i "%WMPASS%" EQU "M" goto:MENU

IF "%WMPASS%"=="" echo Vous avez saisi une valeur incorrecte
IF "%WMPASS%"=="" @ping 127.0.0.1 -n 2 -w 1000> nul
IF "%WMPASS%"=="" goto:WMCONFIG5


::limit user input to X# of digits
if not "%WMPASS:~10%"=="" (
    sfk echo -spat ERREUR: le mot de passe ne peut contenir plus de 10 caract\xe8res
    @ping 127.0.0.1 -n 2 -w 1000> nul
    goto:WMCONFIG5
)



::...................................WAD MANAGER CONFIGURATOR page 6...............................
:WMCONFIG6
set WMCONFIRM=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo.
sfk echo -spat \x20 Ces r\xe9glages sont\x2dils corrects?
echo.
echo.
if /i "%WMCIOS%" EQU "N" echo         * Aucun cIOS choisi
if /i "%WMCIOS%" NEQ "N" echo         * Version du cIOS = %WMCIOS%
echo.
if /i "%WMDEVICE%" EQU "N" sfk echo -spat \x20 \x20 \x20 \x20 \x2a Aucun p\xe9riph\xe9rique FAT choisi
if /i "%WMDEVICE%" NEQ "N" sfk echo -spat \x20 \x20 \x20 \x20 \x2a P\xe9riph\xe9rique FAT = %WMDEVICE%
echo.
if /i "%WMCIOS%" EQU "249" goto:nanddevice
if /i "%WMCIOS%" EQU "250" goto:nanddevice
goto:skipnanddevice

:nanddevice
if /i "%WMNAND%" EQU "N" sfk echo -spat \x20 \x20 \x20 \x20 \x2a Aucun p\xe9riph\xe9rique de Nand choisi
if /i "%WMNAND%" NEQ "N" sfk echo -spat \x20 \x20 \x20 \x20 \x2a P\xe9riph\xe9rique de Nand = %WMNAND%
echo.
:skipnanddevice

sfk echo -spat \x20 \x20 \x20 \x20 \x2a Dossier de d\xe9marrage = %WMPATH%
echo.
if /i "%WMPASS%" EQU "N" echo         * Aucun mot de passe
if /i "%WMPASS%" NEQ "N" echo         * Mot de passe = %WMPASS%
echo.
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 Y = Oui, cr\xe9er wm_config.txt avec ces r\xe9glages
if exist "%Drive%"\WAD\wm_config.txt sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 Note: le fichier wm_config.txt existant sera \xe9cras\xe9
echo.
echo           N = Non, ramenez moi au Menu principal.
echo.
echo.
echo           B = Retour
echo.
echo           M = Menu principal
echo.
echo.
echo.
echo.
set /p WMCONFIRM=     Entrez votre choix ici: 

if /i "%WMCONFIRM%" EQU "B" goto:WMCONFIG5
if /i "%WMCONFIRM%" EQU "M" goto:MENU
if /i "%WMCONFIRM%" EQU "N" goto:MENU
if /i "%WMCONFIRM%" EQU "Y" goto:BUILDWMCONFIG

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
echo.
echo.
sfk echo -spat \x20 Bien qu'optionnel, ceci va cr\xe9er le fichier mmmconfig.txt dans %DRIVE%\ 
echo.
echo.
echo.
echo.
sfk echo -spat \x20 Entrez l'IOS qui doit \xeatre charg\xe9 par Multi-Mod Manager (MMM)
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 Note: Doit \xeatre entre 3 et MAX est 254
echo           les choix courants sont 36, 249, 250, etc.
echo.
echo.
echo.
echo           N = Aucun (ne pas recharger d'IOS)
echo.
echo.
echo.
echo           B = Retour
echo.
echo           M = Menu principal
echo.
echo.
echo.
echo.
set /p WMCIOS=     Entrez votre choix ici: 

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
echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:MMMCONFIG


::...................................MMM CONFIGURATOR (mmmconfig.txt) page 2...............................
:MMMCONFIG2
set WMDEVICE=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo.
sfk echo -spat \x20 Entrez le p\xe9riph\xe9rique FAT que vous souhaitez lancer automatiquement.
echo.
echo     Note: vous pouvez entrer le chiffre ou le mot
echo.
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20  1 = SD (par d\xe9faut si mmmconfig.txt n'existe pas)
echo           2 = USB
echo           3 = SMB
echo.
echo           N = Aucun (MMM vous demandera de choisir)
echo.
echo.
echo.
echo.
echo           B = Retour
echo.
echo           M = Menu principal
echo.
echo.
echo.
echo.
set /p WMDEVICE=     Entrez votre choix ici: 


if /i "%WMDEVICE%" EQU "1" SET WMDEVICE=sd
if /i "%WMDEVICE%" EQU "2" SET WMDEVICE=usb
if /i "%WMDEVICE%" EQU "3" SET WMDEVICE=smb

if /i "%WMDEVICE%" EQU "sd" goto:MMMCONFIG3
if /i "%WMDEVICE%" EQU "usb" goto:MMMCONFIG3
if /i "%WMDEVICE%" EQU "smb" goto:MMMCONFIG3

if /i "%WMDEVICE%" EQU "N" goto:MMMCONFIG3

if /i "%WMDEVICE%" EQU "B" goto:MMMCONFIG
if /i "%WMDEVICE%" EQU "M" goto:MENU



echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:MMMCONFIG2



::...................................MMM CONFIGURATOR (mmmconfig.txt) page 3...............................
:MMMCONFIG3
set WMPATH=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo.
echo   Entrez le chemin du dossier que vous souhaitez explorer automatiquement.
echo.
sfk echo -spat \x20 \x20 Note: si vous n'avez pas de dossier de d\xe9marrage, celui par d\xe9faut est /WAD
echo.
echo     Note: soyez certain que le dossier existe, sinon vous aurez une erreur.
echo.
echo.
echo.
echo.
echo          Exemples:
echo                   /WAD/Forwarders
echo                   /myWad
echo.
sfk echo -spat \x20 \x20 \x20 Note: '/' d\xe9finit un dossier de d\xe9marrage \xe0 la racine du p\xe9riph\xe9rique
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 N = Aucun (par d\xe9faut ce sera /WAD)
echo.
echo.
echo.
echo             B = Retour
echo.
echo             M = Menu principal
echo.
echo.
echo.
echo.
set /p WMPATH=     Entrez votre choix ici: 


if /i "%WMPATH%" EQU "N" SET WMPATH=/WAD
if /i "%WMPATH%" EQU "B" goto:MMMCONFIG2
if /i "%WMPATH%" EQU "M" goto:MENU

IF "%WMPATH%"=="" echo Vous avez saisi une valeur incorrecte
IF "%WMPATH%"=="" @ping 127.0.0.1 -n 2 -w 1000> nul
IF "%WMPATH%"=="" goto:MMMCONFIG3

::...................................MMM CONFIGURATOR (mmmconfig.txt) page 4...............................
:MMMCONFIG4
set WMCONFIRM=
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
echo.
echo.
sfk echo -spat \x20 Ces r\xe9glages sont\x2dils corrects?
echo.
echo.
if /i "%WMCIOS%" EQU "N" echo       * Ne pas recharger d'IOS
if /i "%WMCIOS%" NEQ "N" echo       * Chargement automatique = %WMCIOS%
echo.
if /i "%WMDEVICE%" EQU "N" sfk echo -spat \x20 \x20 \x20 \x2a Aucun p\xe9riph\xe9rique FAT choisi
if /i "%WMDEVICE%" NEQ "N" sfk echo -spat \x20 \x20 \x20 \x2a P\xe9riph\xe9rique FAT choisi = %WMDEVICE%
echo.
sfk echo -spat \x20 \x20 \x20 \x2a Dossier de d\xe9marrage = %WMPATH%
echo.
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 Y = Oui, cr\xe9er mmmconfig.txt avec ces r\xe9glages
if exist "%Drive%"\mmmconfig.txt sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Note: le fichier mmmconfig.txt existant sera \xe9cras\xe9
echo.
echo           N = Non, ramenez moi au Menu principal
echo.
echo.
echo           B = Retour
echo.
echo           M = Menu principal
echo.
echo.
echo.
echo.
set /p WMCONFIRM=     Entrez votre choix ici: 

if /i "%WMCONFIRM%" EQU "B" goto:MMMCONFIG3
if /i "%WMCONFIRM%" EQU "M" goto:MENU
if /i "%WMCONFIRM%" EQU "N" goto:MENU
if /i "%WMCONFIRM%" EQU "Y" goto:BUILDMMMCONFIG

echo Vous avez saisi une valeur incorrecte
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
echo                                       par XFlak
echo.
if /i "%MENU1%" EQU "H" echo                                  Solutions HackMii 
if /i "%MENU1%" EQU "H" echo.


::-----------DL QUEUE SETTINGS---------
if /i "%MENU1%" NEQ "L" goto:skiploadDLcue

if /i "%ROOTSAVE%" EQU "%ROOTSAVETEMP%" set matchrs=Green
if /i "%ROOTSAVE%" NEQ "%ROOTSAVETEMP%" set matchrs=Red

if /i "%OPTION1%" EQU "%OPTION1TEMP%" set match1=Green
if /i "%OPTION1%" NEQ "%OPTION1TEMP%" set match1=Red

echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20  Chargement de la liste de t\xe9l\xe9chargement
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Les options de la liste appraissent en [Red]Rouge [def]quand elles sont diff\xe9rentes de
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 vos r\xe9glages sauvgard\xe9s et en [Green]vert [def] si elles correspondent
echo.
if /i "%ROOTSAVE%" EQU "ON" sfk echo -spat \x20 \x20 [%matchrs%]Sauvegarde racine: sauvegarde les IOSs\MIOSs \xe0 la racine au lieu du dossier WAD (activ\xe9)
if /i "%ROOTSAVE%" EQU "OFF" sfk echo -spat \x20 \x20 [%matchrs%]Sauvegarde racine: sauvegarde les IOSs\MIOSs \xe0 la racine au lieu du dossier WAD (d\xe9sActiv\xe9)
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Utile pour les applis Wii n\xe9cessitant des IOS \ MIOS \xe0 la racine
echo.


if /i "%OPTION1%" EQU "OFF" sfk echo -spat \x20 \x20 [%match1%]Ne pas garder les dossiers 00000001 ou NUS pour IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "OFF" sfk echo -spat \x20 \x20 \x20 * Dossiers quelques fois n\xe9cessaires pour une utilisation
if /i "%OPTION1%" EQU "OFF" sfk echo -spat \x20 \x20 \x20 \x20hors ligne de certaines applis Wii
if /i "%OPTION1%" EQU "ON" sfk echo -spat \x20 \x20 [%match1%]Garder le dossier 00000001 pour IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "ON" echo               * Utile pour une utilisation hors ligne d'applis Wii comme Dop-Mii



if /i "%OPTION1%" EQU "NUS" sfk echo -spat \x20 \x20 [%match1%]Garder le dossier NUS0000001000000##v# pour IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "NUS" echo               * Utile pour une utilisation hors ligne d'applis Wii comme les
if /i "%OPTION1%" EQU "NUS" echo                 installeurs de cIOS d2x\Hermes

if /i "%OPTION1%" EQU "ALL" sfk echo -spat \x20 \x20 [%match1%]Garder les dossiers NUS0000001000000##v# and 00000001 pour IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "ALL" echo               * Utile pour une utilisation hors ligne de quelques applis Wii
echo.
echo.

:skiploadDLcue


if /i "%DLTOTAL%" EQU "0" sfk echo -spat \x20 \x20 \x20 Aucun fichier n'a \xe9t\xe9 s\xe9lectionn\xe9 pour le t\xe9l\xe9chargement
if /i "%DLTOTAL%" EQU "0" goto:skipall

if /i "%USBGUIDE%" NEQ "Y" goto:skip
if /i "%USBCONFIG%" EQU "USB" (sfk echo -spat \x20 \x20 \x20 Les %DLTOTAL% fichiers suivants vont \xeatre t\xe9l\xe9charg\xe9s sur "%DRIVE%" ou "%DRIVEU%":) else (sfk echo -spat \x20 \x20 \x20 les %DLTOTAL% fichiers suivants vont \xeatre t\xe9l\xe9charg\xe9s sur "%DRIVE%":)
goto:skipall
:skip

sfk echo -spat \x20 \x20 \x20 Les %DLTOTAL% fichiers suivants vont \xeatre t\xe9l\xe9charg\xe9s sur "%DRIVE%":
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

sfk echo -spat \x20 D\xe9marrer maintenant le t\xe9l\xe9chargement?
echo.
echo.
if /i "%DLTOTAL%" EQU "0" goto:zerodownloads
if /i "%MENU1%" EQU "W" goto:WorUSB
if /i "%MENU1%" EQU "U" goto:WorUSB
if /i "%MENU1%" EQU "H" goto:WorUSB

sfk echo -spat \x20 \x20 \x20 \x20 \x20 Y = Oui, d\xe9marrer le t\xe9l\xe9chargement

:WorUSB
if /i "%MENU1%" EQU "W" sfk echo -spat \x20 \x20 \x20 \x20 \x20 Y = Oui, cr\xe9er le guide et d\xe9marrer le t\xe9l\xe9chargement
echo.
if /i "%MENU1%" EQU "W" sfk echo -spat \x20 \x20 \x20 \x20 \x20 G = Cr\xe9er seulement le guide
if /i "%MENU1%" EQU "U" sfk echo -spat \x20 \x20 \x20 \x20 \x20 Y = Oui, cr\xe9er le guide et d\xe9marrer le t\xe9l\xe9chargement
echo.
if /i "%MENU1%" EQU "U" sfk echo -spat \x20 \x20 \x20 \x20 \x20 G = Cr\xe9er seulement le guide
if /i "%MENU1%" EQU "H" sfk echo -spat \x20 \x20 \x20 \x20 \x20 Y = Oui, cr\xe9er le guide et d\xe9marrer le t\xe9l\xe9chargement
echo.
if /i "%MENU1%" EQU "H" sfk echo -spat \x20 \x20 \x20 \x20 \x20 G = Cr\xe9er seulement le guide
echo.

:zerodownloads

if /i "%MENU1%" EQU "1" sfk echo -spat \x20 \x20 \x20 \x20 \x20 A = Ajouter d'autres fichiers \xe0 la liste de t\xe9l\xe9chargement
if /i "%MENU1%" EQU "2" sfk echo -spat \x20 \x20 \x20 \x20 \x20 A = Ajouter d'autres fichiers \xe0 la liste de t\xe9l\xe9chargement
if /i "%MENU1%" EQU "3" sfk echo -spat \x20 \x20 \x20 \x20 \x20 A = Ajouter d'autres fichiers \xe0 la liste de t\xe9l\xe9chargement
if /i "%MENU1%" EQU "4" sfk echo -spat \x20 \x20 \x20 \x20 \x20 A = Ajouter d'autres fichiers \xe0 la liste de t\xe9l\xe9chargement
if /i "%MENU1%" EQU "A" sfk echo -spat \x20 \x20 \x20 \x20 \x20 A = Ajouter d'autres fichiers \xe0 la liste de t\xe9l\xe9chargement
if /i "%MENU1%" EQU "L" sfk echo -spat \x20 \x20 \x20 \x20 \x20 A = Ajouter d'autres fichiers \xe0 la liste de t\xe9l\xe9chargement
echo.

if /i "%BACKB4QUEUE%" NEQ "Menu" goto:yessave
if /i "%MENU1%" EQU "L" goto:NoNewDownloads
:yessave
If not Exist download_queue.bat sfk echo -spat \x20 \x20 \x20 \x20 \x20 S = Sauvegarder la liste de t\xe9l\xe9chargement
If Exist download_queue.bat sfk echo -spat \x20 \x20 \x20 \x20 \x20 S  = Sauvegarder la liste de t\xe9l\xe9chargement (la liste existante sera renomm\xe9e)
If Exist download_queue.bat sfk echo -spat \x20 \x20 \x20 \x20 \x20 S\x2b = Sauvegarder la liste de t\xe9l\xe9chargement \x2b (ajouter les fichiers existants \xe0 la liste de t\xe9l\xe9chargement)

if /i "%MENU1%" EQU "L" echo.
if /i "%MENU1%" EQU "L" goto:NoNewDownloads

echo.
:NoNewDownloads

echo           B = Retour
echo.
echo           M = Menu principal
echo.
echo.
echo.
set /p SETTINGS=     Entrez votre choix ici: 



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
echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DOWNLOADQUEUE





:SaveDownloadQueue
cls
echo                                        ModMii                                v%currentversion%
echo                                       par XFlak
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Sauvegarde de la file d'attente des t\xe9l\xe9chargements
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

echo ::ModMii v%currentversion% - telechargement liste - %DATE% - %TIME% >> Download_Queue.bat
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
if /i "%A0c%" EQU "*" echo SET A0c=%A0c%>> Download_Queue.bat
if /i "%A0e_70%" EQU "*" echo SET A0e_70=%A0e_70%>> Download_Queue.bat
if /i "%A01%" EQU "*" echo SET A01__60=%A01_60%>> Download_Queue.bat
if /i "%A0e_60%" EQU "*" echo SET A0e_60=%A0e_60%>> Download_Queue.bat
if /i "%A01%" EQU "*" echo SET A01=%A01%>> Download_Queue.bat

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


if exist Download_Queue.bat sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Liste de t\xe9l\xe9chargement sauvegard\xe9e
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
echo                                       par XFlak
echo.
echo.
sfk echo -spat \x20 Le dossier %Drive%\WAD existe d\xe9j\xe0, que voulez\x2dvous faire?
echo.
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 M = Fusionner les t\xe9l\xe9chargements dans le dossier %Drive%\WAD.
echo               Les doublons seront ignor\xe9s.
echo.
echo           R = Renommer le dossier %Drive%\WAD en %Drive%\WAD#
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 et d\xe9marrer le t\xe9l\xe9chargement
echo.
echo           C = Annuler / Menu principal
echo.
echo           E = Sortie
echo.
echo.
echo.
set /p COPY=     Entrez votre choix ici: 

if /i "%COPY%" EQU "M" goto:DLSettings
if /i "%COPY%" EQU "E" EXIT
if /i "%COPY%" EQU "C" goto:MENU

if /i "%COPY%" NEQ "R" echo Vous avez saisi une valeur incorrecte
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
if /i "%retry%" EQU "1" sfk echo -spat [Red]T\xe9l\xe9chargement %CURRENTDL% de %DLTOTAL%: %name%
if /i "%retry%" NEQ "1" sfk echo -spat [Yellow]Re\x2dt\xe9l\xe9chargement %CURRENTDL% de %DLTOTAL%: %name%
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
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
sfk echo -spat [Green]Ce fichier existe d\xe9j\xe0 et la v\xe9rification a \xe9t\xe9e faite, passer le t\xe9l\xe9chargement
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
sfk echo -spat  Si vous rencontrez une longue p\xe9riode d'inactivit\xe9, lancez UnfreezeMii.bat pour continuer
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
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, re\x2dessayez le t\xe9l\xe9chargement.
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
sfk echo -spat [Yellow] Impossible de v\xe9rifier car l'option d'\xe9dition hexa de ModMii est d\xe9sactiv\xe9e
echo.
if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%DRIVE%\WAD\%wadname%" -write -yes
if /i "%name:~0,17%" NEQ "Advanced Download" echo "%DRIVE%\WAD\%wadname%: Trouve mais impossible de verifier\x22">>temp\simplelog.txt
sfk filter -quiet "temp\simplelog.txt" -rep _"""__ -write -yes
if exist "%Drive%"\Download_Log.md5 sfk filter -quiet "%Drive%"\Download_Log.md5 -ls!"%md5%" -write -yes
goto:NEXT
:notacios
:------

if /i "%attempt%" NEQ "1" goto:multiplefail
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9lecharg\xe9.
echo.
del "%Drive%"\WAD\%wadname%
if exist temp\%wadname% del temp\%wadname%
if exist temp\%code1%\%code2%\v%version% rd /s /q temp\%code1%\%code2%\v%version%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
set multiplefail=Y
echo.
echo %md5% *WAD\%wadname%>> "%Drive%"\Download_Log.md5
goto:NEXT

:pass
echo.
sfk echo -spat [Green]T\xe9l\xe9chargement r\xe9ussi
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9lecharg\xe9.
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

sfk echo -spat [Green]Ce fichier existe d\xe9j\xe0 et a \xe9t\xe9 v\xe9rifi\xe9, passer le t\xe9l\xe9chargement
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
echo sfk echo -spat  Si vous rencontrez une longue p\xe9riode d'inactivit\xe9, lancez UnfreezeMii.bat pour continuer
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
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, relancez le t\xe9l\xe9chargement.
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
sfk echo -spat [Yellow] Impossible de v\xe9rifier car l'option d'\xe9dition hexa de ModMii est d\xe9sactiv\xe9e
echo.
if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%DRIVE%\%wadname%" -write -yes
if /i "%name:~0,17%" NEQ "Advanced Download" echo "%DRIVE%\WAD\%wadname%: Trouve mais impossible de verifier\x22">>temp\simplelog.txt
sfk filter -quiet "temp\simplelog.txt" -rep _"""__ -write -yes
if exist "%Drive%"\Download_Log.md5 sfk filter -quiet "%Drive%"\Download_Log.md5 -ls!"%md5%" -write -yes
goto:NEXT
:notacios
:------

if /i "%attempt%" NEQ "1" goto:multiplefail
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
del "%Drive%"\%wadname%
if exist temp\%wadname% del temp\%wadname%
if exist temp\%code1%\%code2%\v%version% rd /s /q temp\%code1%\%code2%\v%version%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
set multiplefail=Y
echo %md5% *%wadname%>> "%Drive%"\Download_Log.md5
goto:NEXT

:pass
echo.
sfk echo -spat [Green]T\xe9l\xe9chargement r\xe9ussi
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%"\WAD\%wadname%.wad
goto:DOWNLOADSTART2

:pass
sfk echo -spat [Green]Ce fichier existe d\xe9j\xe0 et a \xe9t\xe9 v\xe9rifi\xe9, passer le t\xe9l\xe9chargement
echo.
set alreadyexists=yes
if /i "%md5check%" EQU "pass" echo %md5% *WAD\%wadname%.wad>> "%Drive%"\Download_Log.md5
goto:NEXT
:nocheckexisting



::missing modules folder error message and skip
if not exist modules sfk echo -spat [Yellow] Dossier \x22modules\x22 manquant. Il est n\xe9cessaire pour cr\xe9er les cIOSs/cMIOSs
if not exist modules sfk echo -spat \x20 \x20 [Yellow] Re\x2dtelchargez ModMii \xe0 partir de tinyurl.com/ModMiiNow
if not exist modules sfk echo -spat \x20 \x20 [Yellow] Passer le t\xe9l\xe9chargement
if not exist modules @ping 127.0.0.1 -n 5 -w 1000> nul
if not exist modules goto:NEXT


if not exist "%Drive%"\WAD mkdir "%Drive%"\WAD

:downloadbasewad
::download base wad to "%Drive%"
echo.
sfk echo -spat T\xe9l\xe9chargement des wad de base: %basewad%
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
sfk echo -spat [Yellow] Cette base existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier va \xeatre effac\xe9e et le fichier t\xe9l\xe9charg\xe9 \xe0 nouveau.
echo.
del temp\%basewad%.wad
goto:downloadbasewad

:pass
echo.
sfk echo -spat \x20 \x20 \x20 [Green] Les wad de base existent d\xe9j\xe0 et ont \xe9t\xe9 contol\xe9s, poursuivre...
echo.
::if /i "%md5basecheck%" EQU "pass" echo %md5base% *%basewad%.wad>> "%Drive%"\Download_Log.md5
::if /i "%md5basealtcheck%" EQU "pass" echo %md5basealt% *%basewad%.wad>> "%Drive%"\Download_Log.md5
goto:basealreadythere
:nocheckexisting


sfk echo -spat Si vous rencontrez un longue p\xe9riode d'inactivit\xe9, lancez UnfreezeMii.bat pour continuer
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
sfk echo [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Les wad de base sont manquants, les t\xe9l\xe9charger \xe0 nouveau.
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier t\xe9l\xe9charg\xe9 \xe0 nouveau.
echo.
del temp\%basewad%.wad
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:downloadbasewad

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
set multiplefail=Y
echo.
goto:NEXT

:pass
echo.
sfk echo -spat \x20 \x20 \x20 [Green] Les wad de base ont \xe9t\xe9 correctement t\xe9l\xe9charg\xe9s, poursuivre...
echo.
::if /i "%md5basecheck%" EQU "pass" echo %md5base% *%basewad%.wad>> "%Drive%"\Download_Log.md5
::if /i "%md5basealtcheck%" EQU "pass" echo %md5basealt% *%basewad%.wad>> "%Drive%"\Download_Log.md5


:basealreadythere

::unpack base wad
echo.
sfk echo -spat D\xe9compactage des wad de base: %basewad%
echo.

if exist %basecios% rd /s /q %basecios%
mkdir %basecios%
wadmii -in temp\%basewad%.wad -out %basecios%



 



:downloadbasewadb
::download SECOND base wadB to "%Drive%" (if applicable)
if /i "%basewadb%" EQU "none" goto:nobasewadb

echo.
sfk echo -spat T\xe9l\xe9chargement des wad de base: %basewadb%
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
sfk echo -spat [Yellow] Ces wad de base existent d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et t\xe9l\xe9charg\xe9e \xe0 nouveau.
echo.
del temp\%basewadb%.wad
goto:downloadbasewadb

:pass
echo.
sfk echo -spat \x20 \x20 \x20 [Green] Les wad de base ont \xe9t\xe9 correctement t\xe9l\xe9charg\xe9s, poursuivre...
echo.
::if /i "%md5basebcheck%" EQU "pass" echo %md5baseb% *%basewadb%.wad>> "%Drive%"\Download_Log.md5
::if /i "%md5basebaltcheck%" EQU "pass" echo %md5basebalt% *%basewadb%.wad>> "%Drive%"\Download_Log.md5
goto:baseBalreadythere
:nocheckexisting


sfk echo -spat Si vous rencontrez un longue p\xe9riode d'inactivit\xe9, lancez UnfreezeMii.bat pour continuer
echo.

nusd %code1b%%code2b% %versionb%
if not exist temp\WAD mkdir temp\WAD
move %code1b%%code2b%\%code1b%%code2b%.wad temp\%basewadb%.wad>nul
rd /s /q %code1b%%code2b%



::----check after downloading - if md5 check fails, delete and redownload----
if exist temp\%basewadb%.wad goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Les wad de base sont manquants, les t\xe9l\xe9charger \xe0 nouveau.
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
sfk echo -spat [Yellow] Ces wad de base existent d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et t\xe9l\xe9charg\xe9e \xe0 nouveau.
echo.
del temp\%basewadb%.wad
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:downloadbasewadb

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat \x20 \x20 \x20 [Green] Les wad de base ont \xe9t\xe9 correctement t\xe9l\xe9charg\xe9s, poursuivre...
echo.
::if /i "%md5basebcheck%" EQU "pass" echo %md5base% *%basewad%.wad>> "%Drive%"\Download_Log.md5
::if /i "%md5basebaltcheck%" EQU "pass" echo %md5basealt% *%basewad%.wad>> "%Drive%"\Download_Log.md5



:baseBalreadythere

::----unpack base wad
echo.
sfk echo -spat D\xe9compactage des wad de base: %basewadb%
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
sfk echo -spat Patch du syst\xe8me pour le th\xe8me, patientez s'il vous plait...
echo.

rename %basecios%\00000001.app 00000001-original.app
jptch %basecios%\00000001-original.app temp\%codeURL:~34,-5%.diff %basecios%\00000001.app
del %basecios%\00000001-original.app

goto:repackwad
:skip





::-----cios/cmios stuff------------
::rename *.cert and *.footer (doesn't need to be patched), rename components that need to be patched (excluding tik and tmd)

echo.
echo Patch des fichiers composants de base
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
sfk echo -spat Patch de %lastbasemodule%.app pour la compatibilit\xe9 avec la Common Key Cor\xe9enne

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
sfk echo -spat Copie des modules personnalis\xe9s
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
sfk echo -spat  Signature de 00000000.app avec les d\xe9tails de cIOS

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


::---------pack files into cIOS wad---------------
:repackwad
echo.
echo Compactage des Wad
echo.

if /i "%ROOTSAVE%" EQU "OFF" (wadmii -in "%basecios%" -out "%Drive%\WAD\%wadname%.wad") else (wadmii -in "%basecios%" -out "%Drive%\%wadname%.wad")

::delete unpacked files
rd /s /q %basecios%



::Change version number and slot number (using patchios) only if required
:patchios

if /i "%ciosslot%" EQU "unchanged" goto:skip

echo.
sfk echo -spat Modification du num\xe9ro de version et/ou du num\xe9ro de slot
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%"\MyMenuify_Themes\%wadname%.csm
goto:DOWNLOADSTART2

:pass
sfk echo -spat [Green]Ce fichier existe d\xe9j\xe0 et la v\xe9rification a \xe9t\xe9 faite, passer le t\xe9l\xe9chargement
echo.
::if /i "%md5check%" EQU "pass" echo %md5% *WAD\%wadname%.wad>> "%Drive%"\Download_Log.md5
goto:NEXT
:nocheckexisting





::-------------Download base app----------------------
echo.
sfk echo -spat T\xe9l\xe9chargement du fichier app de base du Menu Syst\xe8me  %wadname:~-4%: 000000%version%.app
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
sfk echo -spat [Yellow] Ces wad de base existent d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et t\xe9l\xe9charg\xe9e \xe0 nouveau.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%"\MyMenuify_Themes\%dlname%
if exist temp\%dlname% del temp\%dlname%
goto:DOWNLOADSTART2

:pass
sfk echo -spat \x20 \x20 \x20 [Green] Les wad de base existent d\xe9j\xe0 et ont \xe9t\xe9 contol\xe9s, poursuivre... 
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
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Les wad de base sont manquants, les t\xe9l\xe9charger \xe0 nouveau.
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
del "%Drive%"\MyMenuify_Themes\%dlname%
if exist temp\%dlname% del temp\%dlname%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
::echo %md5base% *WAD\%wadname%>> "%Drive%"\Download_Log.md5
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat \x20 \x20 \x20 [Green] Les app de base ont \xe9t\xe9 correctement t\xe9l\xe9charg\xe9s, poursuivre... 
echo.
::if /i "%md5basecheck%" EQU "pass" echo %md5base% *WAD\%wadname%>> "%Drive%"\Download_Log.md5
goto:diff_download





::-------------------diff download to build csm file---------------------
:diff_download

echo.
sfk echo -spat T\xe9l\xe9chargement %codeURL:~34,-5% Diff file
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del temp\%codeURL:~34,-5%.diff
goto:DOWNLOADSTART2

:pass
sfk echo -spat \x20 \x20 \x20 [Green] Les fichiers existent d\xe9j\xe0 et ont \xe9t\xe9 contol\xe9s, poursuivre...
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
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Les wad de base sont manquants, les t\xe9l\xe9charger \xe0 nouveau.
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
del temp\%codeURL:~34,-5%.diff
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
::echo %md5diff% *WAD\%codeURL:~34,-5%>> "%Drive%"\Download_Log.md5
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat \x20 \x20 \x20 [Green] Les fichiers ont \xe9t\xe9 t\xe9l\xe9charg\xe9s correctement, poursuivre...
echo.
::if /i "%md5diffcheck%" EQU "pass" echo %md5diff% *WAD\%codeURL:~34,-5%>> "%Drive%"\Download_Log.md5
if /i "%category%" EQU "SMTHEME" goto:SMTHEME2
goto:build_csm







:build_csm

echo.
sfk echo -spat Cr\xe9ation du th\xe8me (%wadname%.csm), patientez s'il vous plait...
echo.

jptch "%Drive%"\MyMenuify_Themes\%dlname% temp\%wadname%.diff "%Drive%"\MyMenuify_Themes\%wadname%.csm



::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%"\MyMenuify_Themes\%wadname%.csm goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, le t\xe9l\xe9charger \xe0 nouveau.
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
del "%Drive%"\MyMenuify_Themes\%wadname%.csm
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
echo %md5% *WAD\%wadname%.wad>> "%Drive%"\Download_Log.md5
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat [Green]T\xe9l\xe9chargement r\xe9ussi
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
sfk echo -spat Cette appli existe d\xe9j\xe0...


::get current version if app already exists, skip if its the most recent version
sfk filter -quiet "%Drive%\apps\USBLoader_cfg\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
echo.
echo La version actuelle est %currentcode%
echo.
sfk echo -spat Contr\xf4le des mises \xe0 jour...
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

sfk echo -spat Mise \xe0 jour de %currentcode% vers %cfgrelease%
echo.
goto:update

:noupdate
sfk echo -spat \x20 [Green] Votre verion actuelle %currentcode% est \xe0 jour, passer au t\xe9l\xe9chargement
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next




::Download most recent version of cfg loader
:doesntalreadyexist
echo.
sfk echo -spat T\xe9l\xe9chargement d'une version plus r\xe9cente: %cfgrelease%
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
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, le t\xe9l\xe9charger \xe0 nouveau.
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais n'a pas pu \xeatre mis \xe0 jour correctement.
sfk echo -spat [Yellow] Re\x2dessayez de t\xe9l\xe9charger une version plus r\xe9cente du fichier.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat [Green]T\xe9l\xe9chargement r\xe9ussi
echo.
goto:NEXT




:usbloaderFolder


if not exist "%Drive%\apps\USBLoader_cfg\meta.xml" goto:skip

if "%currentcode%" EQU "%cfgfullrelease%" goto:noupdate

sfk echo -spat Mise \xe0 jour de %currentcode% vers %cfgfullrelease%
echo.

:skip


::Download most recent full version for USB-Loader Folder

sfk echo -spat T\xe9l\xe9chargement du plus r\xe9cent Configurable USB-Loader: Version %cfgfullrelease%
if exist "%Drive%\usb-loader" Echo.
if exist "%Drive%\usb-loader" sfk echo -spat Note: le dossier USB-Loader existant sera renomm\xe9
start %ModMiimin%/wait wget http://cfg-loader.googlecode.com/files/Cfg_USB_Loader_%cfgfullrelease:~0,-10%.zip



::Move most recent usb-loader folder to root of drive
7za x -aoa Cfg_USB_Loader_%cfgfullrelease:~0,-10%.zip


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

echo >"%DRIVE%\usb-loader\music\Save MP3s Here To Play at USB-Loader Menu"
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
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, le t\xe9l\xe9charger \xe0 nouveau.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
::get current version from meta.xml
sfk filter -quiet "%Drive%\apps\USBLoader_cfg\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat"
del currentcode.bat"
if "%currentcode%" EQU "%cfgfullrelease%" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
sfk echo -spat [Yellow] Ce fichier existe dej\xe0 mais n'a pas pu \xeatre mis \xe0 jour correctement.
sfk echo -spat [Yellow] Tentez de t\xe9l\xe9charger \xe0 nouveau une version plus r\xe9cente du fichier.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat [Green]T\xe9l\xe9chargement r\xe9ussi
echo.
goto:NEXT


:noupdate
sfk echo -spat \x20 [Green] Votre version actuelle %currentcode% est \xe0 jour, passer le t\xe9l\xe9chargement
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
sfk echo -spat Cette appli existe d\xe9j\xe0...
echo.
set cfgrreleaseOLD=
attrib -r -h -s "%DRIVE%\usb-loader\cfgrrev.txt"
copy /y "%DRIVE%\usb-loader\cfgrrev.txt" "%DRIVE%\usb-loader\cfgrev.bat">nul
attrib +r +h +s "%DRIVE%\usb-loader\cfgrrev.txt"
call "%DRIVE%\usb-loader\cfgrev.bat"
del "%DRIVE%\usb-loader\cfgrev.bat">nul
echo la version actuelle est %cfgrreleaseOLD%
echo.
sfk echo -spat Contr\xf4le des mises 

\xe0 jour...
echo.
if %cfgrreleaseOLD% GEQ %cfgrrelease% goto:noupdate
:skip

Echo.
sfk echo -spat T\xe9l\xe9chargement de la version la plus r\xe9cente: %cfgrrelease%
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
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, le t\xe9l\xe9charger \xe0 nouveau.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2


:pass
echo.
sfk echo -spat [Green]T\xe9l\xe9chargement r\xe9ussi
echo.
::save version info for next time!
if exist "%DRIVE%\usb-loader\cfgrrev.txt" attrib -r -h -s "%DRIVE%\usb-loader\cfgrrev.txt"
echo set cfgrreleaseOLD=%cfgrrelease%>"%DRIVE%\usb-loader\cfgrrev.txt"
attrib +r +h +s "%DRIVE%\usb-loader\cfgrrev.txt"
goto:NEXT

:noupdate
sfk echo -spat \x20 [Green] Votre version actuelle %cfgrreleaseOLD% est \xe0 jour, passer le t\xe9l\xe9chargement
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next


::--------------------------TANTRIC APPS AUTO-UDPATE------------------------
:TANTRIC


if not exist "%DRIVE%\%path1%\meta.xml" goto:doesntexist

echo.
echo cette appli existe deja...


::get current version if app already exists, skip if its the most recent version
sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
echo.
echo La version actuelle est %currentcode%
echo.
sfk echo -spat Contr\xf4le des mises \xe0 jour...
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
echo mise a jour de %currentcode% a %newcode%
goto:update

:noupdate
sfk echo -spat \x20 [Green] Votre version actuelle %currentcode% est \xe0 jour, passer le t\xe9l\xe9chargement
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next

:doesntalreadyexist

::Download most recent version
Echo.
sfk echo -spat T\xe9l\xe9chargement d'une version plus r\xe9cente: %newcode%
:update
echo.
start %ModMiimin%/wait wget "%code1%%newcode%%code2%"
if not exist "%Drive%"\%path1% mkdir "%Drive%"\%path1%


set wadname="%zip1%%newcode%%zip2%"

7za x -aoa %wadname% -o"%Drive%"
::7za e -aoa %wadname% -o"%Drive%"/%path1% *.%version% -r


::----simple version check after downloading----
if exist "%DRIVE%\%path1%\meta.xml" goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, le t\xe9l\xe9charger \xe0 nouveau.
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais n'a pas pu \xeatre mis \xe0 jour correctement.
sfk echo -spat [Yellow] Re\x2dessayez de t\xe9l\xe9charger une version plus r\xe9cente du fichier.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat [Green]T\xe9l\xe9chargement r\xe9ussi
echo.
goto:NEXT







::--------------------------GOOGLE CODE 'MANUAL' AUTO-UDPATE------------------------
:GOOGLEUPDATE


if not exist "%DRIVE%\%path1%\meta.xml" goto:doesntexist

echo.
sfk echo -spat Cette appli existe d\xe9j\xe0...

::get current version if app already exists, skip if its the most recent version
::--------WARNING, if version doesn't start with "R", it will FAIL---------
sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>R"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
echo.
echo La version actuelle est %currentcode%
echo.
sfk echo -spat Contr\xf4le des mises \xe0 jour...
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
sfk echo -spat Mise \xe0 jour %currentcode% vers %newcodeNoZeros%
goto:update

:noupdate
sfk echo -spat \x20 [Green] Votre version actuelle %currentcode% est \xe0 jour, passer le t\xe9l\xe9chargement
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next

:doesntalreadyexist

::Download most recent version
Echo.
sfk echo -spat T\xe9l\xe9chargement d'une version plus r\xe9cente: %newcodeNoZeros%

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
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, le t\xe9l\xe9charger \xe0 nouveau.
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais n'a pas pu \xeatre mis \xe0 jour correctement.
sfk echo -spat [Yellow] Re\x2dessayez de t\xe9l\xe9charger une version plus r\xe9cente du fichier. 
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat [Green]T\xe9l\xe9chargement r\xe9ussi
echo.
goto:NEXT








::--------------------------------------Cheat Codes: txtcodes from geckocodes.org------------------------------
:CHEATS

::set cheatregion=all

if exist "codeindex.txt" del "codeindex.txt" >nul
if exist "codeindextemp.txt" del "codeindextemp.txt"

echo.
sfk echo -spat \x20 \x20 T\xe9l\xe9chargement des codes r\xe9gion %cheatregion% de cheat pour les consoles suivantes:
echo.
if /i "%wiicheat%" EQU "ON" echo                 * Wii
if /i "%WiiWarecheat%" EQU "ON" echo                 * WiiWare
if /i "%VCArcadecheat%" EQU "ON" echo                 * VC Arcade
if /i "%WiiChannelscheat%" EQU "ON" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Cha\xeenes Wii 
if /i "%Gamecubecheat%" EQU "ON" echo                 * Gamecube
if /i "%NEScheat%" EQU "ON" echo                 * VC NES/Famicom 
if /i "%SNEScheat%" EQU "ON" echo                 * VC Super NES/Famicom 
if /i "%N64cheat%" EQU "ON" echo                 * VC Nintendo 64 
if /i "%SMScheat%" EQU "ON" echo                 * VC Sega Master System 
if /i "%Segacheat%" EQU "ON" echo                 * VC Sega Genesis/Mega Drive 
if /i "%NeoGeocheat%" EQU "ON" echo                 * VC NeoGeo 
if /i "%Commodorecheat%" EQU "ON" echo                 * VC Commodore 64 
if /i "%MSXcheat%" EQU "ON" echo                 * VC MSX 
if /i "%TurboGraFX-16cheat%" EQU "ON" echo                 * VC TurboGraFX-16 
if /i "%TurboGraFX-CDcheat%" EQU "ON" echo                 * VC TurboGraFX-CD 
echo.
if /i "%cheatlocation%" EQU "B" echo           Emplacement(s) de sauvegarde des cheats: (txtcodes et codes\X\L)
if /i "%cheatlocation%" EQU "T" echo           Emplacement(s) de sauvegarde des cheats: (txtcodes)
if /i "%cheatlocation%" EQU "C" echo           Emplacement(s) de sauvegarde des cheats: (codes\X\L)
echo.
if /i "%overwritecodes%" EQU "OFF" sfk echo -spat \x20 \x20 \x20 \x20 \x20 Ecrasement des txtcodes existants (d\xe9sactiv\xe9)
if /i "%overwritecodes%" EQU "ON" sfk echo -spat \x20 \x20 \x20 \x20 \x20 Ecrasement des txtcodes existants (activ\xe9)
echo.
sfk echo -spat \x20 \x20 Note: Les param\xe8tres ci\x2ddessus peuvent \xeatre personnalis\xe9s dans les options de code triche
echo.
echo.
sfk echo -spat \x20 R\xe9cup\xe9ration de la liste de triche \xe0 partir de geckocodes.org
echo   Patientez...
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
sfk echo -spat Les codes de triche suivants existent d\xe9j\xe0 et seront effac\xe9s de la liste de t\xe9l\xe9chargement:
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
echo Passer %removetitleID%.txt...
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
sfk echo -spat T\xe9l\xe9chargement code %codenumber% de %totalcodes%: %titlename% [%titleid%]

if /i "%cheatlocation%" EQU "T" goto:skip
if not exist "%drive%\codes\%consolecode%\%letter1%" mkdir "%drive%\codes\%consolecode%\%letter1%"
:skip

if /i "%overwritecodes%" EQU "on" goto:overwritecheat


::----copy existing codes to alternate location if missing----
if /i "%cheatlocation%" EQU "C" goto:skip
if not exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" goto:skip
if not exist "%drive%\txtcodes\%titleid%.txt" echo Copie de codes\%consolecode%\%letter1%\%titleid%.txt a txtcodes\%titleid%.txt
if not exist "%drive%\txtcodes\%titleid%.txt" copy /y "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" "%drive%\txtcodes\%titleid%.txt">nul
:skip
if /i "%cheatlocation%" EQU "T" goto:skip
if not exist "%drive%\txtcodes\%titleid%.txt" goto:skip
if not exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" echo Copie de txtcodes\%titleid%.txt vers codes\%consolecode%\%letter1%\%titleid%.txt
if not exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" copy /y "%drive%\txtcodes\%titleid%.txt" "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt">nul
:skip

if /i "%cheatlocation%" EQU "C" goto:skip
if not exist "%drive%\txtcodes\%titleid%.txt" goto:downloadcheat
:skip

if /i "%cheatlocation%" EQU "T" goto:skip
if not exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" goto:downloadcheat
:skip

echo %titleid%.txt existe d\xe9j\xe0
echo Passer le t\xe9l\xe9chargement...
echo.
goto:processcode

:overwritecheat
if /i "%cheatlocation%" EQU "C" goto:skip
if exist "%drive%\txtcodes\%titleid%.txt" echo Ecrasement de %drive%\txtcodes\%titleid%.txt...
:skip
if /i "%cheatlocation%" EQU "T" goto:skip
if exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" echo Ecrasement de %drive%\codes\%consolecode%\%letter1%\%titleid%.txt...
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
sfk echo -spat Cette appli existe d\xe9j\xe0...


::get current version if app already exists, skip if its the most recent version
sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat
echo.
echo La version actuelle est %currentcode%
echo.
sfk echo -spat Contr\xf4le des mises \xe0 jour...
echo.


:UpdateCheck
start %ModMiimin%/wait wget "%updateurl%"
move /y ManualUpdate.txt ManualUpdate.bat>nul

call ManualUpdate.bat
del ManualUpdate.bat>nul

if not exist "%DRIVE%\%path1%\meta.xml" goto:Update

if /i "%currentcode%" EQU "%newcode%" goto:noupdate
::echo Updating from %currentcode% to %newcode%
sfk echo -spat Mise \xe0 jour vers une version plus r\xe9cente...


goto:update

:noupdate
sfk echo -spat \x20 [Green] votre version actuelle %currentcode% est \xe0 jour, passer le t\xe9l\xe9chargement

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



::----simple version check after downloading----
if exist "%DRIVE%\%path1%\meta.xml" goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, le t\xe9l\xe9charger \xe0 nouveau.
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais n'a pas pu \xeatre mis \xe0 jour correctement.
sfk echo -spat [Yellow] Re\x2dessayez de t\xe9l\xe9charger une version plus r\xe9cente du fichier.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat [Green]T\xe9l\xe9chargement r\xe9ussi
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%\%path1%%filename%"
if exist temp\%wadname% del temp\%wadname%
goto:DOWNLOADSTART2

:pass
sfk echo -spat [Green]Ce fichier existe d\xe9j\xe0 et la v\xe9rification a \xe9t\xe9 faite, passer le t\xe9l\xe9chargement
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
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
set DRIVE=%DRIVErestore%
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, le t\xe9l\xe9charger \xe0 nouveau.
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
del "%Drive%\%path1%%filename%"
if exist temp\%wadname% del temp\%wadname%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
set DRIVE=%DRIVErestore%
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
set DRIVE=%DRIVErestore%
set DRIVE=%DRIVErestore%
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat [Green]T\xe9l\xe9chargement r\xe9ussi
echo.
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%\%path1%%filename%"
if exist temp\%wadname% del temp\%wadname%
set DRIVE=%DRIVErestore%
goto:DOWNLOADSTART2

:pass
sfk echo -spat [Green]Ce fichier existe d\xe9j\xe0 et la v\xe9rification a \xe9t\xe9 faite, passer le t\xe9l\xe9chargement
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

if /i "%SAVEZIP%" EQU "off" del %wadname%
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
del "%Drive%"\hacks.ini
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
if exist temp\%wadname% del temp\%wadname%
goto:DOWNLOADSTART2

:pass
sfk echo -spat [Green]Ce fichier existe d\xe9j\xe0 et la v\xe9rification a \xe9t\xe9 faite, passer le t\xe9l\xe9chargement
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
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, le t\xe9l\xe9charger \xe0 nouveau.
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
del "%Drive%"\hacks.ini
if exist temp\%wadname% del temp\%wadname%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat [Green]T\xe9l\xe9chargement r\xe9ussi
echo.
goto:NEXT



::---------------CustomDL--------------------------
:CUSTOMDL
sfk echo -spat \x20 \x20 \x20 Notez que ce t\xe9l\xe9chargement personnalis\xe9 n'est pas control\xe9 
sfk echo -spat \x20 \x20 \x20 et pas n\xe9cessairement s\xe9curis\xe9.
sfk echo -spat \x20 \x20 \x20 Soyez certain de savoir ce que vous faites! A vos risques et p\xe9rils!
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


sfk echo -spat Si vous rencontrez une trop grande p\xe9riode d'inactivit\xe9, lancez UnfreezeMii.bat pour continuer
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


if exist "%DRIVE%"\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad (patchios "%DRIVE%"\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad%PATCHCODE%%slotcode%%versioncode%) & (echo.) & (sfk echo -spat Note: les patchs ne sont pas toujours r\xe9ussis, lire le log PatchIOS pour plus de d\xe9tails)
:nopatching

if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%DRIVE%\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad" -write -yes

if exist "%DRIVE%\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad" (echo "%DRIVE%\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad: Trouve">>temp\simplelog.txt) else (echo "%DRIVE%\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad: Manquants">>temp\simplelog.txt)

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

if exist "%Drive%"\%wadfolder%SystemMenu-NUS-v%VERFINAL%.wad (echo "%Drive%\%wadfolder%SystemMenu-NUS-v%VERFINAL%.wad: Trouve">>temp\simplelog.txt) else (echo "%Drive%\%wadfolder%SystemMenu-NUS-v%VERFINAL%.wad: Manquants">>temp\simplelog.txt)

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

if exist "%Drive%"\%wadfolder%RVL-mios-v%VERFINAL%.wad (echo "%Drive%\%wadfolder%RVL-mios-v%VERFINAL%.wad: Trouve">>temp\simplelog.txt) else (echo "%Drive%\%wadfolder%RVL-mios-v%VERFINAL%.wad: Manquants">>temp\simplelog.txt)

sfk filter -quiet "temp\simplelog.txt" -rep _"""__ -write -yes

if exist "%Drive%"\%wadfolder%RVL-mios-v%VERFINAL%.wad (goto:there) else (goto:missing)


::----check after downloading - if md5 check fails, delete and redownload----

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
sfk echo -spat \x20 \x20 \x20 [Magenta] La raison la plus fr\xe9quente est que le fichier n'existe pas.
sfk echo -spat \x20 \x20 \x20 [Magenta] Recontr\xf4lez vos valeurs personnalis\xe9es.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, le t\xe9l\xe9charger \xe0 nouveau.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
::if exist temp\%wadname% del temp\%wadname%
goto:DOWNLOADSTART2

:there
echo.
sfk echo -spat [Green]Avances T\xe9l\xe9chargement r\xe9ussi
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
del "%Drive%"\apps\HackMii_Installer\boot.elf
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
if exist temp\%wadname% del temp\%wadname%
goto:DOWNLOADSTART2

:pass
sfk echo -spat [Green]Ce fichier existe d\xe9j\xe0 et la v\xe9rification a \xe9t\xe9 faite, passer le t\xe9l\xe9chargement
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
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
goto:NEXT

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, le t\xe9l\xe9charger \xe0 nouveau.
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
sfk echo -spat [Yellow] Ce fichier existe d\xe9j\xe0 mais \xe9chec de la v\xe9rification MD5.
sfk echo -spat [Yellow] La version actuelle du fichier sera effac\xe9e et le fichier sera re\x2dt\xe9l\xe9charg\xe9.
echo.
del "%Drive%"\apps\HackMii_Installer\boot.elf
if exist temp\%wadname% del temp\%wadname%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
sfk echo -spat [Green]T\xe9l\xe9chargement r\xe9ussi
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
sfk echo -spat Note: les patchs ne sont pas toujours r\xe9ussis, lire le log PatchIOS pour plus de d\xe9tails
echo.
:nopatching


if exist "%DRIVE%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad goto:there

::----check after Advanced downloading----

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
sfk echo -spat [Magenta] Ce fichier n'a pas pu \xeatre t\xe9l\xe9charg\xe9 correctement plusieurs fois, passer le t\xe9l\xe9chargement.
echo.
sfk filter -quiet "temp\DLgotos.txt" -ls!"%CurrentDLNAME%" -write -yes

if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad" -write -yes

echo "%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad: Manquants">>temp\simplelog.txt

sfk filter -quiet "temp\simplelog.txt" -rep _"""__ -write -yes

goto:DLSETTINGS3

:missingretry
echo.
sfk echo -spat [Yellow] Ce fichier est manquant, le t\xe9l\xe9charger \xe0 nouveau.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:there

::prevent cIOSs showing error message when hex editing disabled
if /i "%basewad%" EQU "none" goto:notacios
if /i "%HEXEDIT%" EQU "Y" goto:notacios
sfk echo -spat [Yellow] Impossible de v\xe9rifier car l'option d'\xe9dition hexa de ModMii est d\xe9sactiv\xe9e
if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad" -write -yes
echo "%DRIVE%\WAD\%wadname%: Trouve mais impossible de verifier\x22">>temp\simplelog.txt
goto:miniskip
:notacios

if /i "%multiplefail%" EQU "Y" (sfk echo -spat [Magenta] V\xe9rification du hash de la base wad \xe9chou\xe9e plusieurs fois, t\xe9l\xe9chargement avanc\xe9 probablement corrompu) else (sfk echo -spat [Green]T\xe9l\xe9chargement avanc\xe9 r\xe9ussi)
echo.

if exist temp\simplelog.txt sfk filter -quiet temp\simplelog.txt -ls!"%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad" -write -yes


if /i "%multiplefail%" EQU "Y" (sfk echo -spat \x22%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad: Trouv\xe9 mais peut\x2d\xeatre corrompu\x22>>temp\simplelog.txt) else (sfk echo -spat \x22%DRIVE%\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad: Trouve">>temp\simplelog.txt)

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
del sneekYrev.bat>nul
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





if /i "%SNEEKTYPE%" EQU "SD" echo Construction de SNEEK+DI rev%sneekYrev%
if /i "%SNEEKTYPE%" EQU "UD" echo Construction de UNEEK+DI rev%sneekYrev%
if /i "%SNEEKTYPE%" EQU "U" echo Construction de UNEEK rev%sneekYrev%
if /i "%SNEEKTYPE%" EQU "S" echo Construction de SNEEK rev%sneekYrev%
echo.

sfk echo -spat T\xe9l\xe9chargement de Sneek Installer

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


sfk echo -spat T\xe9l\xe9chargement Autoit
if exist temp\autoit3.exe goto:AlreadyinTemp
if not exist autoit-v3-sfx.exe start %ModMiimin%/wait wget -t 3 http://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3-sfx.exe
if exist autoit-v3-sfx.exe 7za e -aoa autoit-v3-sfx.exe -otemp autoit3.exe -r
if exist autoit-v3-sfx.exe del autoit-v3-sfx.exe>nul
:AlreadyinTemp
echo.


sfk echo -spat T\xe9l\xe9chargement de 0000000e.app \xe0 partir de l'IOS80
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

sfk echo -spat T\xe9l\xe9chargement de 00000001.app \xe0 partir de l'IOS60
if exist temp\00000001_IOS60.app goto:AlreadyinTemp
nusfilegrabber.exe 01_60
move /Y 00000001.app temp\00000001_IOS60.app

:AlreadyinTemp
copy /Y temp\00000001_IOS60.app temp\00000001.app>nul
if not exist temp\00000001.app goto:sneekwarning
echo.



::FONT.BIN
if /i "%SNKFONT%" EQU "B" sfk echo -spat T\xe9l\xe9chargement de font.bin \xe9criture blanche (peut \xeatre modifi\xe9e en noir dans les options)
if /i "%SNKFONT%" EQU "W" sfk echo -spat T\xe9l\xe9chargement de font.bin \xe9criture noire (tpeut \xeatre modifi\xe9e en blanc dans les options)

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
sfk echo -spat T\xe9l\xe9chargement de dimodule.elf

if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/dimodule.elf

if exist dimodule.elf move /Y dimodule.elf temp\dimodule.elf

if not exist temp\dimodule.elf start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/dimodule.elf

if exist dimodule.elf move /Y dimodule.elf temp\dimodule.elf

if not exist temp\dimodule.elf goto:sneekwarning
echo.
:skipDL01



sfk echo -spat T\xe9l\xe9chargement de fsmodule\x2dusb.elf
if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/fsmodule-usb.elf

if exist fsmodule-usb.elf move /Y fsmodule-usb.elf temp\fsmodule-usb.elf>nul

if not exist temp\fsmodule-usb.elf start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/fsmodule-usb.elf

if exist fsmodule-usb.elf move /Y fsmodule-usb.elf temp\fsmodule-usb.elf>nul

if not exist temp\fsmodule-usb.elf goto:sneekwarning
echo.



sfk echo -spat T\xe9l\xe9chargement de fsmodule\x2dsd.elf
if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/fsmodule-sd.elf
if exist fsmodule-sd.elf move /Y fsmodule-sd.elf temp\fsmodule-sd.elf>nul

if not exist temp\fsmodule-sd.elf start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/fsmodule-sd.elf
if exist fsmodule-sd.elf move /Y fsmodule-sd.elf temp\fsmodule-sd.elf>nul

if not exist temp\fsmodule-sd.elf goto:sneekwarning
echo.


sfk echo -spat T\xe9l\xe9chargement de esmodule.elf

if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/esmodule.elf
if exist esmodule.elf move /Y esmodule.elf temp\esmodule.elf>nul

if not exist temp\esmodule.elf start %ModMiimin%/wait wget -t 3 http://sneeky-compiler.googlecode.com/files/esmodule.elf
if exist esmodule.elf move /Y esmodule.elf temp\esmodule.elf>nul

if not exist temp\esmodule.elf goto:sneekwarning
echo.

sfk echo -spat T\xe9l\xe9chargement de armboot.bin
if /i "%usesneektemp%" EQU "off" start %ModMiimin%/wait wget -t 3 http://sneek.googlecode.com/files/armboot.bin
if exist armboot.bin move /Y armboot.bin temp\armboot.bin>nul

if not exist temp\armboot.bin start %ModMiimin%/wait wget -t 3 http://sneek.googlecode.com/files/armboot.bin
if exist armboot.bin move /Y armboot.bin temp\armboot.bin>nul

if not exist temp\armboot.bin goto:sneekwarning
echo.


echo En construction...
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

if /i "%SNEEKTYPE%" EQU "SD" echo SNEEK+DI rev%sneekYrev%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "S" echo SNEEK rev%sneekYrev%>"%DRIVE%"\sneek\rev.txt

if /i "%SNEEKTYPE%" EQU "UD" echo UNEEK+DI rev%sneekYrev%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "UD" echo UNEEK+DI rev%sneekYrev%>"%DRIVEU%"\sneek\rev.txt

if /i "%SNEEKTYPE%" EQU "U" echo UNEEK rev%sneekYrev%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "U" echo UNEEK rev%sneekYrev%>"%DRIVEU%"\sneek\rev.txt
goto:skipsneekverbose

:sneekverbose
if /i "%SNEEKTYPE%" EQU "SD" echo SNEEK+DI (verbose) rev%sneekYrev%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "S" echo SNEEK (verbose) rev%sneekYrev%>"%DRIVE%"\sneek\rev.txt

if /i "%SNEEKTYPE%" EQU "UD" echo UNEEK+DI (verbose) rev%sneekYrev%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "UD" echo UNEEK+DI (verbose) rev%sneekYrev%>"%DRIVEU%"\sneek\rev.txt

if /i "%SNEEKTYPE%" EQU "U" echo UNEEK (verbose) rev%sneekYrev%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "U" echo UNEEK (verbose) rev%sneekYrev%>"%DRIVEU%"\sneek\rev.txt
:skipsneekverbose




if /i "%SNEEKSELECT%" EQU "3" goto:SNKNANDBUILDER
goto:finishsneekinstall3


:sneekwarning
if exist ioskpatch.exe del ioskpatch.exe
echo.
sfk echo -spat \x20 [Yellow] ATTENTION: certains fichiers n\xe9cessaires \xe0 l'installation de SNEEK sont manquants.
sfk echo -spat \x20 \x20 \x20 \x20 [Yellow] Abandon de l'installation de SNEEK, controlez votre connexion internet
sfk echo -spat \x20 \x20 \x20 \x20 [Yellow] et tentez de re\x2dinstaller SNEEK.
echo.
echo Appuyez sur une touche pour revenir au Menu principal.
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
echo Chargement de ShowMiiWads
echo.
sfk echo -spat Installation de wads \xe0 partir de: %nandpath%\WAD\install2sneek\
sfk echo -spat pour \xe9muler la NAND: %nandpath%\
echo.
echo Attendez que ShowMiiWads finisse son travail...

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
sfk echo -spat Copie du th\xe8me custom

::if /i "%DarkWii_Red_4.3U%" EQU "*" move /y temp\DarkWii_Red_4.3U.csm "%nandpath%"\title\00000001\00000002\content\%SMTHEMEAPP%.app

if /i "%ThemeSelection%" EQU "R" set themecolour=Red
if /i "%ThemeSelection%" EQU "G" set themecolour=Green

move /y "temp\MyMenuify_Themes\DarkWii_%themecolour%_%SNKVERSION%%REGION%.csm" "%nandpath%"\title\00000001\00000002\content\%SMTHEMEAPP%.app
:quickskip


if exist temp\MyMenuify_Themes rd /s /q temp\MyMenuify_Themes
if exist temp\WAD rd /s /q temp\WAD
if exist temp\Download_Log.md5 del temp\Download_Log.md5>nul


echo.
sfk echo -spat T\xe9l\xe9chargement d'IOSKPatch.exe pour patcher le Menu Syst\xe8me pour la compatibilit\xe9 UNEEK+DI
start %ModMiimin%/wait wget -t 3 http://sneek.googlecode.com/svn/trunk/IOSKpatch/IOSKPatch.exe
if exist IOSKPatch.exe move /Y IOSKPatch.exe temp\IOSKPatch.exe>nul
if exist temp\IOSKPatch.exe copy /Y temp\IOSKPatch.exe IOSKPatch.exe>nul
if not exist IOSKPatch.exe sfk echo -spat Impossible de t\xe9l\xe9charger IOSKPatch, le Menu Syst\xe8me ne sera pas patch\xe9
echo.



::ModMii only makes UNEEK+DI nands for 4.3U/E/J/K and 4.2U/E Nands (for now)

sfk echo -spat Patch du Menu Syst\xe8me %SMAPP%.app pour la compatibilit\xe9 UNEEK+DI

move /y "%nandpath%"\title\00000001\00000002\content\%SMAPP%.app "%nandpath%"\title\00000001\00000002\content\%SMAPP%_original.app >nul
ioskpatch.exe "%nandpath%"\title\00000001\00000002\content\%SMAPP%_original.app "%nandpath%"\title\00000001\00000002\content\%SMAPP%.app -p >nul


del "%nandpath%"\title\00000001\00000002\content\%SMAPP%_original.app >nul

:skippatchSMios


if /i "%SNKPRI%" NEQ "Y" goto:skipSNKpri
echo.
sfk echo -spat T\xe9l\xe9chargement de Priiloader\x2dv0.4.app
echo.
if not exist temp\Priiloader-v0.4.app start %ModMiimin%/wait wget -t 3 http://nusad.googlecode.com/files/Priiloader-v0.4.app
if exist Priiloader-v0.4.app move /Y Priiloader-v0.4.app temp\Priiloader-v0.4.app>nul

if not exist temp\Priiloader-v0.4.app (sfk echo -spat Impossible de t\xe9l\xe9charger Priiloader-v0.4.app, Priiloader ne sera pas install\xe9 sur la Nand \xe9mul\xe9e) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:finishsneekinstall)

move /y "%nandpath%"\title\00000001\00000002\content\%SMAPP%.app "%nandpath%"\title\00000001\00000002\content\1%SMAPP:~1%.app >nul

copy /Y temp\Priiloader-v0.4.app "%nandpath%"\title\00000001\00000002\content\%SMAPP%.app>nul

if not exist "%nandpath%"\title\00000001\00000002\data mkdir "%nandpath%"\title\00000001\00000002\data >nul
move /Y temp\hacks.ini "%nandpath%"\title\00000001\00000002\data\hacks.ini >nul

if /i "%SNKJOY%" NEQ "Y" goto:skipSNKpri

sfk echo -spat Ajout du dol forwarder de JoyFlow dans \x22installed file\x22 du Priiloader.
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
echo                                       par XFlak
echo.


::both sneek install and nand build
if /i "%SNEEKSELECT%" NEQ "3" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" sfk echo -spat \x20 \x20  Vous avez install\xe9 correctement SNEEK+DI rev%sneekYrev% et construit une NAND \xe9mul\xe9e %SNKVERSION%%REGION%
if /i "%SNEEKTYPE%" EQU "UD" sfk echo -spat \x20 \x20  Vous avez install\xe9 UNEEK+DI rev%sneekYrev% et construit une NAND \xe9mul\xe9e %SNKVERSION%%REGION%
if /i "%SNEEKTYPE%" EQU "S" sfk echo -spat \x20 \x20  Vous avez install\xe9 SNEEK rev%sneekYrev% et construit une NAND \xe9mul\xe9e %SNKVERSION%%REGION%
if /i "%SNEEKTYPE%" EQU "U" sfk echo -spat \x20 \x20  Vous avez install\xe9 UNEEK rev%sneekYrev% et construit une NAND \xe9mul\xe9e %SNKVERSION%%REGION%
:skip

::only install sneek
if /i "%SNEEKSELECT%" NEQ "1" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" sfk echo -spat \x20 \x20  Vous avez install\xe9 correctement SNEEK+DI rev%sneekYrev%
if /i "%SNEEKTYPE%" EQU "UD" sfk echo -spat \x20 \x20  Vous avez install\xe9 correctement UNEEK+DI rev%sneekYrev%
if /i "%SNEEKTYPE%" EQU "U" sfk echo -spat \x20 \x20  Vous avez install\xe9 correctement UNEEK rev%sneekYrev%
if /i "%SNEEKTYPE%" EQU "S" sfk echo -spat \x20 \x20  Vous avez install\xe9 correctement SNEEK rev%sneekYrev%
:skip

::only build nand
if /i "%SNEEKSELECT%" NEQ "2" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" sfk echo -spat \x20 \x20  Vous avez correctement construit une NAND \xe9mul\xe9e %SNKVERSION%%REGION%
if /i "%SNEEKTYPE%" EQU "UD" sfk echo -spat \x20 \x20  Vous avez correctement construit une NAND \xe9mul\xe9e %SNKVERSION%%REGION%
if /i "%SNEEKTYPE%" EQU "U" sfk echo -spat \x20 \x20  Vous avez correctement construit une NAND \xe9mul\xe9e %SNKVERSION%%REGION%
if /i "%SNEEKTYPE%" EQU "S" sfk echo -spat \x20 \x20  Vous avez correctement construit une NAND \xe9mul\xe9e %SNKVERSION%%REGION%
:skip


echo.
echo.



if /i "%SNEEKSELECT%" NEQ "2" goto:skip
if /i "%SNEEKTYPE%" EQU "U" goto:skipsdmsg
if /i "%SNEEKTYPE%" EQU "UD" goto:skipsdmsg
:skip
if /i "%Drive%" EQU "COPY_TO_SD" echo    * Copiez le contenu du dossier COPY_TO_SD sur votre carte SD
if /i "%Drive%" NEQ "COPY_TO_SD" echo    * Assurez-vous que %DRIVE% est bien la lettre de votre carte SD
if /i "%Drive%" NEQ "COPY_TO_SD" echo    * Si %DRIVE% n'est pas la lettre de votre carte SD, copiez le contenu
if /i "%Drive%" NEQ "COPY_TO_SD" echo      du dossier %DRIVE% sur votre carte SD
echo.
:skipsdmsg

if /i "%SNEEKTYPE%" EQU "UD" goto:UDRIVEMSG
if /i "%SNEEKTYPE%" NEQ "U" goto:skipUDRIVEMSG
:UDRIVEMSG
if /i "%DRIVEU%" EQU "COPY_TO_USB" echo    * Copier le contenu du dossier COPY_TO_USB sur votre disque dur FAT32
if /i "%DRIVEU%" NEQ "COPY_TO_USB" echo    * Assurez-vous que %DRIVEU% est la lettre de votre disque dur
if /i "%DRIVEU%" NEQ "COPY_TO_USB" echo    * Si %DRIVEU% n'est pas la lettre de votre disque dur, copiez le contenu
if /i "%DRIVEU%" NEQ "COPY_TO_USB" echo      du dossier %DRIVEU% sur votre disque dur
echo.
:skipUDRIVEMSG

if /i "%SNEEKSELECT%" EQU "2" goto:skip
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] ATTENTION: SNEEK n'est pas directement support\xe9 par ModMii.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] Les probl\xe8mes rencontr\xe9s avec SNEEK et qui ne d\xe9coulent pas
sfk echo -spat \x20 \x20 \x20 \x20 [Red] de ModMii peut \xeatre rapport\xe9s ici: http://code.google.com/p/sneek/
echo.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] C'est aussi un endroit pour en apprendre plus sur SNEEK en g\xe9n\xe9ral.
sfk echo -spat \x20 \x20 \x20 \x20 [Red] Une autre excellente source est le guide : tinyurl.com/SNEEK-DI
:skip

echo.
echo    ASTUCES RAPIDES POUR SNEEK:
echo.
sfk echo -spat \x20 \x20 \x20 \x2a Si vous avez des probl\xe8mes avec S/UNEEK ou Mighty Channels, copiez cert.sys
sfk echo -spat \x20 \x20 \x20 \x20 issu d'un dump de Nand dans le dossier sys de votre Nand \xe9mul\xe9e.
echo.
sfk echo -spat \x20 \x20 \x20 \x2a Quand vous lancez n'importe quelle version de SNEEK pour la premiere fois,
sfk echo -spat \x20 \x20 \x20 \x20 il peut s'\xe9couler un certain temps avant le lancement du Menu Syst\xe8me,
sfk echo -spat \x20 \x20 \x20 \x20 mais il sera plus rapide d\xe8s le second lancement.
echo.
if /i "%SNKS2U%" EQU "Y" goto:quickskip
sfk echo -spat \x20 \x20 \x20 \x2a Si vous avez BootMii en Boot2, SNEEK d\xe9marrera automatiquement 
sfk echo -spat \x20 \x20 \x20 \x20 quand la Wii sera allum\xe9e. Pour ne plus avoir cette action, renommez 
sfk echo -spat \x20 \x20 \x20 \x20 autrement le dossier BootMii sur la SD.
echo.
sfk echo -spat \x20 \x20 \x20 \x2a Si vous avez BootMii en IOS, vous devrez lancer BootMii en IOS
sfk echo -spat \x20 \x20 \x20 \x20 pour d\xe9marrer SNEEK. Vous pouvez \xe9galement le faire manuellement \xe0 partir
sfk echo -spat \x20 \x20 \x20 \x20 de l'HBC ou automatiquement par les r\xe9glages de l'autoboot du Priiloader.
echo.
:quickskip

if /i "%SNKS2U%" NEQ "Y" goto:quickskip
sfk echo -spat \x20 \x20 \x20 \x2a Acc\xe9dez \xe0 UNEEK/UNEEK+DI en lan\xe7ant switch2uneek depuis l'
sfk echo -spat \x20 \x20 \x20 \x20 Homebrew Channel. Vous pouvez aussi utiliser MMM pour installer la
sfk echo -spat \x20 \x20 \x20 \x20 cha\xeene forwarder switch2uneek sauvegard\xe9e par ModMii sur la SD.
echo.
:quickskip

sfk echo -spat \x20 \x20 \x20 \x2a Quand vous utilisez SNEEK+DI ou UNEEK+DI, vous pouvez acc\xe9der au menu
sfk echo -spat \x20 \x20 \x20 \x20 jeux/DI en pressant "1" sur la WiiMote. Pour acc\xe9der aux autres r\xe9glages
sfk echo -spat \x20 \x20 \x20 \x20 (incluant les options de region), vous devez appuyer sur \x2b \xe0 partir du 
echo         menu DI.
echo.
sfk echo -spat \x20 \x20 \x20 \x2a Pour ajouter des jeux au menu jeux/DI, vous pouvez utiliser ModMii pour 
echo         extraire les jeux Wii sur votre disque dur externe USB en FAT32.
echo.
sfk echo -spat \x20 \x20 \x20 \x2a ShowMiiWads peut \xeatre utilis\xe9 pour d\xe9crypter votre dump de NAND r\xe9elle
sfk echo -spat \x20 \x20 \x20 \x20 (nand.bin) et l'utiliser comme une NAND \xe9mul\xe9e pour y ajouter ensuite
sfk echo -spat \x20 \x20 \x20 \x20 des chaines/WADs customis\xe9s.
sfk echo -spat \x20 \x20 \x20 \x20 ShowMiiWads est r\xe9cuperable ici: http://code.google.com/p/showmiiwads/
echo.
sfk echo -spat \x20 \x20 \x20 \x2a Pour plus d'infos sur SNEEK comme le formatage de disque dur USB pour SNEEK
sfk echo -spat \x20 \x20 \x20 \x20 ou l'installation d'HBC sur une NAND \xe9mul\xe9e, visitez: tinyurl.com/SNEEK-DI
echo.
echo.
echo Appuyez sur une touche pour revenir au Menu principal.
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
SET /a LINES=%loglines%+38
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
echo                                       par XFlak
echo.
if /i "%DB%" EQU "N" echo             LOG TELECHARGEMENTS
if /i "%DB%" EQU "C" echo       LOG TELECHARGEMENTS PERSONNALISES

if /i "%DB%" EQU "N" set log=download_log.md5
if /i "%DB%" EQU "C" set log=custom.md5

echo.

if not exist modules sfk echo -spat \x20 \x20 \x20 [Yellow] Le dossier "modules" est absent. Il est n\xe9cessaire pour la v\xe9rification des fichiers et pour la cr\xe9ation des cIOSs/cMIOSs
if not exist modules sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 [Yellow] Re\x2dt\xe9l\xe9chargez ModMii \xe0 partir de tinyurl.com/ModMiiNow


If /i "%cfg249%" EQU "*" goto:checkcfgbootdol
If /i "%cfg222%" EQU "*" goto:checkcfgbootdol
If /i "%usbfolder%" EQU "*" goto:checkcfgbootdol
goto:next

:checkcfgbootdol
if /i "%USBCONFIG%" EQU "USB" (set driveWE=%DRIVEU%) else (set driveWE=%DRIVE%)

If not exist "%driveWE%"\apps\usbloader_cfg\meta.xml echo %driveWE%\apps\usbloader_cfg (CFG USB-Loader): Manquant
If not exist "%driveWE%"\apps\usbloader_cfg\meta.xml goto:next
sfk filter -quiet "%driveWE%\apps\usbloader_cfg\meta.xml" -+"/version" -rep _"*<version>"_"set cfgcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
echo %driveWE%\apps\usbloader_cfg (CFG USB-Loader): Version %cfgcurrentcode% trouvee
:next

::check for configurator for configurable
If /i "%cfgr%" NEQ "*" goto:next
If not exist "%DRIVE%"\usb-loader\CfgLoaderConfigurator.exe echo %DRIVE%\usb-loader\CfgLoaderConfigurator.exe: Manquant
If not exist "%DRIVE%"\usb-loader\CfgLoaderConfigurator.exe goto:next
If not exist "%DRIVE%"\usb-loader\cfgrrev.txt sfk echo -spat %DRIVE%\usb\x2dloader\CfgLoaderConfigurator.exe: Trouv\xe9 (impossible de d\xe9tecter la version)
If exist "%DRIVE%"\usb-loader\cfgrrev.txt attrib -r -h -s "%DRIVE%\usb-loader\cfgrrev.txt"
If not exist "%DRIVE%"\usb-loader\cfgrrev.txt (goto:next) else (copy /y "%DRIVE%"\usb-loader\cfgrrev.txt "%DRIVE%"\usb-loader\cfgrrev.bat>nul )
attrib +r +h +s "%DRIVE%\usb-loader\cfgrrev.txt"
call "%DRIVE%"\usb-loader\cfgrrev.bat
del "%DRIVE%"\usb-loader\cfgrrev.bat
sfk echo -spat %DRIVE%\usb\x2dloader\CfgLoaderConfigurator.exe: Version %cfgrreleaseOLD% trouv\xe9e
:next

::check for neogamma
If /i "%neogamma%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\neogamma\meta.xml echo %DRIVE%\apps\NeoGamma: Manquant
If not exist "%DRIVE%"\apps\neogamma\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\neogamma\meta.xml" -+"/version" -rep _"*<version>"_"set neocurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
sfk echo -spat %DRIVE%\apps\NeoGamma: Version %neocurrentcode% trouv\xe9e
:next

::check for yawm
If /i "%yawm%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\yawmm\meta.xml echo %DRIVE%\apps\yawmm: Manquant
If not exist "%DRIVE%"\apps\yawmm\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\yawmm\meta.xml" -+"/version" -rep _"*<version>"_"set yawmcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
sfk echo -spat %DRIVE%\apps\yawmm: Version %yawmcurrentcode% trouv\xe9e
:next

::check for WiiMC
If /i "%WiiMC%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\WiiMC\meta.xml echo %DRIVE%\apps\WiiMC: Manquant
If not exist "%DRIVE%"\apps\WiiMC\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\WiiMC\meta.xml" -+"/version" -rep _"*<version>"_"set WMCcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
sfk echo -spat %DRIVE%\apps\WiiMC: Version %WMCcurrentcode% trouv\xe9e
:next

::check for fceugx
If /i "%fceugx%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\fceugx\meta.xml echo %DRIVE%\apps\fceugx: Manquant
If not exist "%DRIVE%"\apps\fceugx\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\fceugx\meta.xml" -+"/version" -rep _"*<version>"_"set fceugxcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
sfk echo -spat %DRIVE%\apps\fceugx: Version %fceugxcurrentcode% trouv\xe9e
:next

::check for snes9xgx
If /i "%snes9xgx%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\snes9xgx\meta.xml echo %DRIVE%\apps\snes9xgx: Manquant
If not exist "%DRIVE%"\apps\snes9xgx\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\snes9xgx\meta.xml" -+"/version" -rep _"*<version>"_"set snescurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
sfk echo -spat %DRIVE%\apps\snes9xgx: Version %snescurrentcode% trouv\xe9e
:next

::check for vbagx
If /i "%vbagx%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\vbagx\meta.xml echo %DRIVE%\apps\vbagx: Manquant
If not exist "%DRIVE%"\apps\vbagx\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\vbagx\meta.xml" -+"/version" -rep _"*<version>"_"set vbagxcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
sfk echo -spat %DRIVE%\apps\vbagx: Version %vbagxcurrentcode% trouv\xe9e

:next

::check for SGM
If /i "%SGM%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\SaveGameManagerGX\meta.xml echo %DRIVE%\apps\SaveGameManagerGX: Manquant
If not exist "%DRIVE%"\apps\SaveGameManagerGX\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\SaveGameManagerGX\meta.xml" -+"/version" -rep _"*<version>"_"set SGMcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
sfk echo -spat %DRIVE%\apps\SaveGameManagerGX: Version %SGMcurrentcode% trouv\xe9e
:next

::check for WIIX
If /i "%WIIX%" NEQ "*" goto:next
If not exist "%DRIVE%"\apps\WiiExplorer\meta.xml echo %DRIVE%\apps\WiiExplorer: Manquant
If not exist "%DRIVE%"\apps\WiiExplorer\meta.xml goto:next
sfk filter -quiet "%DRIVE%\apps\WiiExplorer\meta.xml" -+"/version" -rep _"*<version>"_"set WIIXcurrentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
sfk echo -spat %DRIVE%\apps\WiiExplorer: Version %WIIXcurrentcode% trouv\xe9e
:next

::check for CheatCodes
If /i "%CheatCodes%" NEQ "*" goto:next

if /i "%cheatlocation%" EQU "C" goto:skip
If exist "%DRIVE%"\txtcodes\*.txt sfk echo -spat %DRIVE%\txtcodes: Trouv\xe9
If not exist "%DRIVE%"\txtcodes\*.txt echo %DRIVE%\txtcodes: Manquant
:skip

if /i "%cheatlocation%" EQU "T" goto:skip
If exist "%DRIVE%"\codes sfk echo -spat %DRIVE%\codes: Trouv\xe9
If not exist "%DRIVE%"\codes echo %DRIVE%\codes: Manquant
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
if /i "%DLTOTAL%" NEQ "0" Echo  *Si certains fichiers sont invalides ou manquants,
if /i "%DLTOTAL%" NEQ "0" sfk echo -spat \x20 s\xe9lectionnez R\xe9p\xe9ter le t\xe9l\xe9chargement (R).
if /i "%DLTOTAL%" EQU "0" Echo  *Si certains fichiers sont invalides ou manquants,
if /i "%DLTOTAL%" EQU "0" sfk echo -spat \x20 t\xe9l\xe9chargez \xe0 nouveau les fichiers.
echo.
echo  *Si vous rencontrez des erreurs, assurez-vous d'avoir
echo   suffisament d'espace ici: %DrivesNeedingFreeSpace%
echo  *Controlez votre connexion internet
sfk echo -spat \x20 (essayez de d\xe9sactiver le firewall/supprimer les proxy si activ\xe9s).


if /i "%USBCONFIG%" EQU "USB" goto:skipcopytoSDmsg
echo.
if /i "%Drive%" EQU "COPY_TO_SD" echo  *Si les fichiers sont bons, copiez le contenu du dossier COPY_TO_SD sur la carte SD
if /i "%Drive%" NEQ "COPY_TO_SD" echo  *Si les fichiers sont bons, assurez-vous que %DRIVE% est la lettre de votre carte SD
if /i "%Drive%" NEQ "COPY_TO_SD" echo  *Si %DRIVE% n'est pas la lettre de votre carte SD, copiez le contenu du
if /i "%Drive%" NEQ "COPY_TO_SD" echo   dossier %DRIVE% dans votre carte SD
:skipcopytoSDmsg
echo.
echo.

if exist "%DRIVE%" echo           O = Ouvrir le fichier de destination (%Drive%)

if exist "%DRIVE%"\%log% sfk echo -spat \x20 \x20 \x20 \x20 \x20 L = Log: Ouvrir %Log% pour voir quels fichiers ont \xe9t\xe9 control\xe9s
if exist %log% sfk echo -spat \x20 \x20 \x20 \x20 \x20 L = Log: Ouvrir %Log% pour voir quels fichiers ont \xe9t\xe9 control\xe9s

if /i "%DLTOTAL%" EQU "0" goto:dltotaliszero
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 R = R\xe9p\xe9ter le t\xe9l\xe9chargement
If not Exist download_queue.bat sfk echo -spat \x20 \x20 \x20 \x20 \x20 S = Sauvegarder la liste de t\xe9l\xe9chargement
If Exist download_queue.bat sfk echo -spat \x20 \x20 \x20 \x20 \x20 S = Sauvegarder la liste de t\xe9l\xe9chargement (la liste existante sera \xe9cras\xe9e)
If Exist download_queue.bat sfk echo -spat \x20 \x20 \x20 \x20 \x20 S+= Sauvegarder la liste de t\xe9l\xe9chargement+ (ajoute les fichiers \xe0 la liste de t\xe9l\xe9chargement)
:dltotaliszero

if /i "%DB%" NEQ "N" echo.
if /i "%DB%" NEQ "N" sfk echo -spat \x20 \x20 \x20 \x20 \x20 N = V\xe9rifie SEULEMENT les nouveaux t\xe9l\xe9chargements
if /i "%DB%" EQU "C" goto:next
if exist Custom.md5 echo.
if exist Custom.md5 sfk echo -spat \x20 \x20 \x20 \x20 \x20 C = V\xe9rifie les fichiers gr\xe2ce \xe0 Custom.md5
:next

if exist CUSTOM_COPY_TO_SD goto:tinyskip
if exist CUSTOM_COPY_TO_USB (goto:tinyskip) else (goto:nocustoms)
:tinyskip
echo.
if exist CUSTOM_COPY_TO_SD echo           CC = Copier le contenu de CUSTOM_COPY_TO_SD vers %Drive%
if exist CUSTOM_COPY_TO_USB echo          CCU = Copier le contenu de CUSTOM_COPY_TO_USB vers %DriveU%
:nocustoms

echo.
echo          M = Menu Principal
echo.
echo          E = Sortie
echo.
set /p FINISH=     Entrez votre choix ici: 

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


echo Vous avez saisi une valeur incorrecte
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
if /i "%SETTINGS%" EQU "G" sfk echo -spat Cr\xe9ation du Guide, patientez...
if /i "%SETTINGS%" NEQ "G" sfk echo -spat Cr\xe9ation du Guide, patientez... votre t\xe9l\xe9chargement va d\xe9marrer rapidement.

if not exist "%DRIVE%" mkdir "%DRIVE%" >nul
if not exist "%Drive%"\%guidename% goto:norename
SET /a COUNT6=%COUNT6%+1
if exist "%DRIVE%"\ModMiiGuide%COUNT6%.txt goto:guide
move "%Drive%"\%guidename% "%DRIVE%"\ModMiiGuide%count6%.txt >nul
:norename



sfk echo -spat ModMii %currentversion% Guide Personnalis\xe9>"%Drive%"\%guidename%
sfk echo -spat G\xe9n\xe9r\xe9 le %DATE% - %TIME%>>"%Drive%"\%guidename%
sfk echo -spat Contr\xf4le des mises \xe0 jour sur tinyurl.com/ModMiiNow>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
sfk echo -spat Ce guide a \xe9t\xe9 g\xe9n\xe9r\xe9 en utilisant les param\xe8tres suivants:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
if /i "%VIRGIN%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a La Wii est actuellement vierge (non\x2dmodifi\xe9e)>>"%Drive%"\%guidename%
if /i "%VIRGIN%" EQU "N" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a La Wii est d\xe9j\xe0 modifi\xe9e>>"%Drive%"\%guidename%

if /i "%REGION%" EQU "K" goto:Koreansetting
if /i "%REGION%" EQU "RC" goto:RCSTATUS
if /i "%FIRMSTART%" NEQ "o" echo               * Le firmware actuel est %FIRMSTART%%REGION%>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo               * Le firmware actuel est plus petit que 2.2%REGION%>>"%Drive%"\%guidename%
goto:skipKoreansetting

:RCSTATUS
if /i "%FIRMSTART%" NEQ "o" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a La Wii est cor\xe9enne mais son ancienne r\xe9gion \xe9tait %FIRMSTART%%REGIONCHANGE%>>"%DRIVE%"\%guidename%
if /i "%FIRMSTART%" EQU "o" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a La Wii est cor\xe9enne mais son ancienne r\xe9gion \xe9tait %REGIONCHANGE%>>"%DRIVE%"\%guidename%
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Le firmware souhait\xe9 est %FIRM%%REGIONCHANGE%>>"%Drive%"\%guidename%
goto:skipKoreansetting

echo .>>"%Drive%"\%guidename%

:Koreansetting
if /i "%FIRMSTART%" NEQ "o" echo               * Le firmware actuel est %FIRMSTART%K>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Le firmware actuel est plus petit que 2.2K (les Wii cor\xe9ennes ne se hackent pas comme les Wii des autres r\xe9gions.)>>"%Drive%"\%guidename%
:skipKoreansetting
if /i "%REGION%" NEQ "RC" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Le firmware souhait\xe9 est %FIRM%%REGION%>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%PIC%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene Photo>>"%Drive%"\%guidename%
if /i "%NET%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene Internet>>"%Drive%"\%guidename%
if /i "%WEATHER%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene m\xe9t\xe9o>>"%Drive%"\%guidename%
if /i "%NEWS%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene News>>"%Drive%"\%guidename%
if /i "%MiiQ%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene Mii>>"%Drive%"\%guidename%
if /i "%Shop%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene Shopping (et de l IOS56)>>"%Drive%"\%guidename%
if /i "%Speak%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de la cha\xeene Wii Speak>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
if /i "%VIRGIN%" EQU "Y" goto:skipvirginstandard


if /i "%HM%" NEQ "*" goto:skip4.3extra
if /i "%FIRMSTART%" EQU "3.X" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de HackMii Installer et BannerBomb v1 (avec IOS58)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "4.0" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de HackMii Installer et BannerBomb v1 (avec IOS58)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "4.1" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de HackMii Installer et BannerBomb v1 (avec IOS58)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "4.2" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de HackMii Installer et BannerBomb v2 (avec IOS58)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de HackMii Installer et Twilight Hack avec IOS58 et tous les exploits disponibles>>"%Drive%"\%guidename%


if /i "%FIRMSTART%" NEQ "4.3" goto:skip4.3extra

sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a HackMii Installer avec IOS58 et tous les exploits disponibles>>"%Drive%"\%guidename%

:skip4.3extra

if /i "%RECCIOS%" NEQ "Y" goto:smallskip
if /i "%CMIOSOPTION%" EQU "on" (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement des cIOSs et cMIOS recommand\xe9s>>"%Drive%"\%guidename%) else (sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement des cIOSs recommand\xe9s>>"%Drive%"\%guidename%)
:smallskip


if /i "%yawm%" EQU "*" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de Yet Another Wad Manager Mod (YAWMM)>>"%Drive%"\%guidename%

if /i "%IOS236Installer%" EQU "*" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement de l'IOS236 Installer et de Simple IOS Patcher (avec IOS36v3351)?>>"%Drive%"\%guidename%

if /i "%pri%" EQU "*" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement du Priiloader>>"%Drive%"\%guidename%
:skipvirginstandard
if /i "%protect%" EQU "Y" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement des protections suppl\xe9mentaires contre le brick>>"%Drive%"\%guidename%

if /i "%ThemeSelection%" EQU "R" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Installer le th\xe8me Dark Wii Red>>"%Drive%"\%guidename%
if /i "%ThemeSelection%" EQU "G" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Installer le th\xe8me Dark Wii Green>>"%Drive%"\%guidename%

if /i "%ACTIVEIOS%" NEQ "ON" goto:skipupdatelog
if /i "%UpdatesIOSQ%" EQU "N" goto:skipupdatelog
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Mettre \xe0 jour les IOS actifs (peut \xeatre modifi\xe9 dans les options)>>"%Drive%"\%guidename%
goto:skip
:skipupdatelog
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Ne pas mettre \xe0 jour les IOS actifs (peut \xeatre modifi\xe9 dans les options)>>"%>>"%Drive%"\%guidename%
:skip

if /i "%RECCIOS%" EQU "Y" goto:semiskip
if /i "%VIRGIN%" NEQ "Y" goto:tinyskip
if /i "%CMIOSOPTION%" EQU "on" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Installer un cMIOS (peut \xeatre modifi\xe9 dans les options)>>"%Drive%"\%guidename%
:semiskip
if /i "%CMIOSOPTION%" EQU "off" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Ne pas installer de cMIOS (peut \xeatre modifi\xe9 dans les options)>>"%Drive%"\%guidename%
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
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Disque dur externe format\xe9 en %FORMATNAME%>>"%Drive%"\%guidename%
goto:skip2
:skip
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Disque dur externe d\xe9j\xe0 format\xe9 en %FORMATNAME%>>"%Drive%"\%guidename%
:skip2

if /i "%LOADER%" EQU "CFG" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement Configurable USB\x2dLoader>>"%Drive%"\%guidename%
if /i "%LOADER%" EQU "FLOW" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement WiiFlow>>"%Drive%"\%guidename%
if /i "%LOADER%" EQU "ALL" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a T\xe9l\xe9chargement Configurable USB\x2dLoader et WiiFlow>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Reglages et config de l'USB\x2dLoader sauvegard\xe9s sur disque dur USB>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x2a Reglages et config de l'USB\x2dLoader sauvegard\xe9s sur carte SD>>"%Drive%"\%guidename%
:skipusb


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
sfk echo -spat Ce logiciel n'est pas \xe0 vendre. Si vous avez pay\xe9 pour ce logiciel ou un pack contenant ce logiciel, vous \xeates fait avoir.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo CE PACKAGE EST LIVRE SANS AUCUNE GARANTIE, IMPLICITE OU EXPLICITE.>>"%Drive%"\%guidename%
echo PERSONNE EN DEHORS DE VOUS NE PEUT ETRE TENU RESPONSABLE POUR LES DOMMAGES CAUSES PAR SON UTILISATION A VOTRE WII!>>"%Drive%"\%guidename%
echo A UTILISER A VOS RISQUES ET PERILS!>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo REMARQUES IMPORTANTES:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
sfk echo -spat \x2a Ce guide ne n\xe9cessite pas de connexion WIFI sur votre Wii.>>"%Drive%"\%guidename%
sfk echo -spat \x2a Une carte SD formatt\xe9e en FAT32 est n\xe9cessaire (meilleurs r\xe9sultats obtenus avec des cartes non\x2dSDHC, SDHC ne fonctionnant qu'en 4.0 et suivant).>>"%DRIVE%"\%guidename%
sfk echo -spat \x2a Si vous rencontrez des erreurs durant une des \xe9tapes, reformattez votre carte SD en FAT ou FAT32>>"%Drive%"\%guidename%
sfk echo -spat \x2a Eteignez le WiiConnect24 et retirez toutes les manettes/cartes m\xe9moires gamecube pendant le hack de la Wii (sauf indications contraires).>>"%DRIVE%"\%guidename%
sfk echo -spat \x2a Si votre Wii venait \xe0 freezer, appuyez 5 secondes sur le bouton power pour l'\xe9teindre et recommencez.>>"%Drive%"\%guidename%
sfk echo -spat \x2a N'acceptez pas de mises \xe0 jour de Nintendo sans vous \xeatre assur\xe9 qu'elle est sans risque. La derni\xe8re mise \xe0 jour (en 4.3) date de juin 2010 et il ne faut pas la faire. Si vous acceptez une mise \xe0 jour officielle de Nintendo apr\xe8s le hack, vous perdrez certaines voir toutes les modifications r\xe9alis\xe9es.>>"%Drive%"\%guidename%
sfk echo -spat \x2a Ne d\xe9sinstallez jamais un Menu Syst\xe8me ou un IOS>>"%Drive%"\%guidename%
sfk echo -spat \x2a N'installez pas de wads ou de th\xe8mes non test\xe9s sans avoir install\xe9 Bootmii ou le Priiloader.>>"%Drive%"\%guidename%

::----USB-Loader Notes----
if /i "%USBGUIDE%" NEQ "Y" goto:skipall
if /i "%cIOS223[37-38]-v4%" EQU "*" goto:skipthis

sfk echo -spat \x2a Des cIOS sont n\xe9cessaires pour utiliser les USB\x2dLoaders, si vous n'avez pas de cIOS, lancez le guide de ModMii pour hacker votre Wii avant de passer aux r\xe9glages de votre USB-Loader.>>"%Drive%"\%guidename%
sfk echo -spat \x2a cIOS249 rev18 ou plus est n\xe9cessaire pour utiliser des disques durs format\xe9s en FAT32 ou NTFS (cIOS222 rev4 ou plus fonctionne \xe9galement, mais il faudra t\xe9l\xe9charger la version 222 du Configurable USB\x2dloader ou modifier votre fichier config.txt pour le Configurable USB\x2dLoader)>>"%Drive%"\%guidename%
:skipthis

sfk echo -spat \x2a Tous les disques durs ne sont pas compatibles avec la Wii, pour une liste de compatibilit\xe9, consultez cette page: http://wiki.gbatemp.net/wiki/USB_Devices_Compatibility_List>>"%Drive%"\%guidename%
sfk echo -spat \x2a Si vous avez des questions, un guide plus d\xe9taill\xe9 peut \xeatre consult\xe9 ici: http://www.sites.google.com/site/completesg/>>"%Drive%"\%guidename%
:skipall
::-------------------------


sfk echo -spat \x2a Ce guide personnalis\xe9 est un bon d\xe9but, mais le hack Wii est toujours en \xe9volution. Controlez les mises a jour en ligne et souvenez\x2dvous que Google est votre ami.>>"%Drive%"\%guidename%
sfk echo -spat \x2a Si vous avez des questions, un guide plus d\xe9taill\xe9 peut \xeatre trouv\xe9 ici: http://www.sites.google.com/site/completesg/>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

::-----------------------------------------virgin Korean non-4.3 Wiis-----------------------------------
If /i "%VIRGIN%" NEQ "Y" goto:nonkorean
If /i "%REGION%" NEQ "K" goto:nonkorean
If /i "%FIRMSTART%" EQU "4.3" goto:nonkorean


::---------------------------------RESTORING THE TRUCHA BUG for Korean Wiis (4.2 and under)-------------------------


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) LANCEMENT DE Multi-Mod Manager (MMM) EN UTILSANT BANNERBOMB>>"%Drive%"\%guidename%
echo    ===========================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%

If /i "%BB2%" EQU "*" echo Lancement de BannerBomb v2 en cliquant sur le bouton de la carte SD du menu principal et en allant sur "yes" quand load boot.dol/elf apparait>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo Lancement de BannerBomb v1 en allant dans Réglages, Gestion des données, Chaînes, carte SD et en allant sur "yes" quand load boot.dol/elf apparait>>"%Drive%"\%guidename%
echo Note: si cela ne marche pas pour vous, visitez http://bannerbomb.qoid.us/ pour plus de variantes ou d'autres versions de bannerbomb.>>"%DRIVE%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Cela va lancer Multi-Mod Manager.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



:KOREANEXTRA
echo %COUNT7%) INSTALLATION DE L'IOS58 EN UTILISANT Multi-Mod Manager (MMM)>>"%Drive%"\%guidename%
echo    ============================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Dans le menu principal de Multi-Mod Manager, descendez pour choisir "WAD Manager".>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Installez maintenant l'IOS58v6176.>>"%Drive%"\%guidename%
echo Naviguez dans les wads et sélectionnez-les séparement pour les installer individuellement.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

sfk echo -spat Attention de ne pas installer d'autres wads qui auraient été précédemment sauvegardés dans ce dossier (ils sont peut être surs, mais sans garantie).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


sfk echo -spat Assurez-vous que les fichiers sont installés correctement.>>"%Drive%"\%guidename%
sfk echo -spat Vous pouvez passer à l'étape suivante apres avoir réussi à installer les wads, mais ne quittez pas MMM.>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



echo %COUNT7%) INSTALLION DE L'HOMEBREW CHANNEL (HBC) et BOOTMII>>"%Drive%"\%guidename%
echo    =================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%

echo Retournez au menu principal de MMM, choisissez "App Manager" et appuyez sur A.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Lancez HackMii_Installer>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Ceci va lancer Hackmii Installer (et silencieusement/automatiquement installer BootMii en IOS). Utilisez l'installeur pour installer l'Homebrew Channel (HBC) et Bootmii en Boot2 si possible. Si vous ne pouvez pas installer BootMii en Boot2, vous devez quand même préparer une carte SD pour BootMii (car le dossier "BootMii" est nécessaire pour lancer BootMii en IOS ou Boot2).>>"%DRIVE%"\%guidename%

goto:nandbackup



::---------------------------virgin NON-Korean Wiis-----------------------------------

::---------------------------------HACKMII INSTALLER-----------------------------

:nonkorean

If /i "%HM%" NEQ "*" goto:TBRGUIDE

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) INSTALLATION DE l'HOMEBREW CHANNEL (HBC) et BOOTMII>>"%Drive%"\%guidename%
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
If /i "%exploitnum%" GEQ "2" echo Vous ne devrez utiliser qu'un seul de ces exploits>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo.>>"%Drive%"\%guidename%


If /i "%BB1%" EQU "*" goto:skipforwardersolution
If /i "%BB2%" EQU "*" goto:skipforwardersolution
echo Note: Si cette Wii a déjà été modifiée et a déjà l'HBC, BootMii en Boot2, ou un forwarder d'installé, vous pouvez l'utiliser au lieu d'utiliser un exploit (comme ça vous n'aurez pas besoin de jeux particuliers).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Si vous utilisez BootMii en Boot2 pour installer l'HBC, copiez le dossier "BootMii" de votre précédente installation de BootMii à la racine de votre carte SD (ou téléchargez-le avec ModMii). Redémarrez votre Wii, BootMii devrait se lancer, allez dans dans le menu SD, chargez bootmini.elf. Cela lancera le Hackmii Installer vous invitant à reinstaller l'HBC.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Si vous utilisez une chaîne Forwarder, sauvegardez simplement le boot.elf/dol de l'application que vous voulez lancer (ie. SD:\apps\hackmii_installer\boot.elf ou SD:\apps\MMM\boot.dol) à l'emplacement SPECIFIQUE utilisé par le Forwarder (ie. SD:\apps\usbloader\boot.dol). Lancez alors la chaîne et le Hackmii Installer se chargera en vous invitant à reinstaller l'HBC. 
echo Note: si votre chaîne forwarder ne lance que les dol et pas les elf, lancez le boot.dol de MMM, et utilisez son "App Manager" pour lancer le Hackmii Installer.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


if /i "%FIRMSTART%" EQU "o" echo Alternativement, vous pouvez mettre à jour votre Wii en v3.0-4.2 en utilisant un DISQUE (ie. NSMBW). Répétez ensuite le guide de ModMii en utilisant votre nouveau firmware et vous pourrez utiliser la faille Bannerbomb (qui n'utilise pas de disques particuliers pour fonctionner)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo.>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo ATTENTION: la mise à jour en ligne en v4.3 rend les Wii coréennes non hackables (s'il n'y a pas auparavant l'HBC v1.0.7 minimum, BootMii en Boot2v4, ou une chaîne forwarder d'installé)>>"%DRIVE%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo .>>"%Drive%"\%guidename%
:skipforwardersolution

:EXPLOITSNOW

echo.>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo Lancer BannerBomb v1 en allant dans réglages, Gestion des données, Chaînes, carte SD et choisir "yes" quand load boot.dol/elf apparait>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo Note: si cela ne marche pas pour vous, visitez http://bannerbomb.qoid.us/ pour plus de variantes ou d'autres versions de bannerbomb.>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo .>>"%Drive%"\%guidename%




If /i "%BB2%" EQU "*" echo Lancement de BannerBomb v2 en cliquant sur le bouton de la carte SD du menu principal et en allant sur "yes" quand load boot.dol/elf apparait>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo Note: si cela ne marche pas pour vous, visitez http://bannerbomb.qoid.us/ pour plus de variantes ou d'autres versions de bannerbomb.>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo .>>"%Drive%"\%guidename%



If /i "%SMASH%" NEQ "*" goto:skipSmashStackGuide

echo SMASH STACK EXPLOIT>>"%Drive%"\%guidename%
echo ------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo PREREQUIS: * Un original de Super Smash Brothers Brawl>>"%Drive%"\%guidename%
echo            * Une carte non-SDHC formattée en FAT16 ou FAT32 (les cartes SDHC ne fonctionnent pas)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Lancez le jeu Super Smash Brothers Brawl sans la carte SD insérée dans la Wii.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Créez une sauvegarde si elle n'existe pas encore.>>"%Drive%"\%guidename%
echo C. Allez ensuite dans le gestionnaire de stages et effacez/sauvegardez tous les stages. Quittez ensuite le jeu.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Copiez les fichiers depuis %DRIVE% sur votre carte SD (si ce n'est déjà fait) et insérez-la dans votre Wii.>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Démarrez le jeu Super Smash Brothers Brawl, allez dans le gestionnaire de stages.>>"%Drive%"\%guidename%
echo F. L'exploit se lance.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo    Si vous avez oublié d'effacer les stages, vous aurez droit à un crash sans gravité.>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipSmashStackGuide



If /i "%PWNS%" NEQ "*" goto:skipPWNSGuide

echo EXPLOIT INDIANA PWNS>>"%Drive%"\%guidename%
echo -------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo PREREQUIS: * Un original de LEGO Indiana Jones>>"%Drive%"\%guidename%
echo            * Une carte non-SDHC formattée en FAT16 ou FAT32 (les cartes SDHC ne fonctionnent pas)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Lancez le jeu LEGO Indiana Jones au moins une fois>>"%Drive%"\%guidename%
echo    (sinon vous serez incapable de copier la sauvegarde hackée sur la Wii).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Sauvegardez votre sauvegarde personnelle de LEGO Indiana Jones avant de copier les fichiers de votre carte SD (si vous le souhaitez):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Mettez votre carte SD dans votre Wii et allumez-la.>>"%Drive%"\%guidename%
echo   b) Allez dans les options Wii - Gestion de données - Données de sauvegarde - Wii.>>"%Drive%"\%guidename%
echo   c) Trouvez votre sauvegarde Indiana, cliquez dessus, cliquez sur "Copier" et cliquez sur "Oui". Maintenant effacez la sauvegarde de votre Wii.>>"%Drive%"\%guidename%
echo   d) Connectez votre carte SD à votre PC et copiez le dossier "private" de la carte SD sur le PC. Si un dossier "private" est déjà présent vous pouvez le renommer.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copiez les fichiers depuis %DRIVE% sur votre carte SD (si ce n'est déjà fait) et insérez-la dans votre Wii.>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Allez dans Options Wii - Gestion des données - Wii - Carte SD.>>"%Drive%"\%guidename%
echo    Ensuite, copiez la sauvegarde Indiana Pwns qui correspond à votre région sur votre Wii.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Démarrez le jeu Lego Indiana Jones. Chargez le nouveau fichier de sauvegarde.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo    Vous arrivez dans le hall principal, marchez vers la caméra.>>"%Drive%"\%guidename%
echo    Entrez dans la première porte sur votre droite (à la gauche d'Indy) et allez dans la cours.>>"%Drive%"\%guidename%
echo    Marchez jusqu'à la salle d'art, vous allez apercevoir un podium avec 2 personnages dessus, allez voir celui de gauche.>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo    Appuyez deux fois sur gauche (en scrollant les objets) pour aller sur l'option de choix (silhouette noire avec une flèche blanche vers une autre silhouette noire)>>"%Drive%"\%guidename%
echo    Appuyez sur A pour lancer l'exploit.>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipPWNSGuide



If /i "%YUGI%" NEQ "*" goto:skipYUGIGuide

echo EXPLOIT YU-GI-OWNED>>"%Drive%"\%guidename%
echo ------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo PREREQUIS: * Un original de Yu-Gi-Oh! 5D's>>"%Drive%"\%guidename%
echo            * Une carte non-SDHC formattée en FAT16 ou FAT32 (les cartes SDHC ne fonctionnent pas)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Lancez le jeu Yu-Gi-Oh au moins une fois>>"%Drive%"\%guidename%
echo    (sinon vous serez incapable de copier la sauvegarde hackée sur la Wii).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Sauvegardez votre sauvegarde personnelle de Yu-Gi-Oh avant de copier les fichiers de votre carte SD (si vous le souhaitez):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Mettez votre carte SD dans votre Wii et allumez-la.>>"%Drive%"\%guidename%
echo   b) Allez dans les options Wii - Gestion de données - Données de sauvegarde - Wii.>>"%Drive%"\%guidename%
echo   c) Trouvez votre sauvegarde Yu-Gi-Oh, cliquez dessus, cliquez sur "Copier" et cliquez sur "Oui". Maintenant effacez la sauvegarde de votre Wii.>>"%Drive%"\%guidename%
echo   d) Connectez votre carte SD à votre PC et copiez le dossier "private" de la carte SD sur le PC. Si un dossier "private" est déjà présent vous pouvez le renommer.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copiez les fichiers depuis %DRIVE% sur votre carte SD (si ce n'est déjà fait) et insérez-la dans votre Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Allez dans Options Wii - Gestion des données - Wii - Carte SD.>>"%Drive%"\%guidename%
echo    Ensuite, copiez la sauvegarde Yu-Gi-Oh qui correspond à votre région sur votre Wii.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Démarrez le jeu Yu-Gi-Oh. La faille se lance.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%REGION%" EQU "E" echo .>>"%Drive%"\%guidename%
if /i "%REGION%" EQU "E" echo Note aux utilisateurs européens: la faille YU-GI-OWNED PAL est en 60Hz. Si elle ne fonctionne pas sur une TV 50Hz, naviguez sur "SD:\private\wii\title\", renommez "RYOP" en autre chose, renommez "RYOP-50hz" en "RYOP" et reessayez. >>"%Drive%"\%guidename%

If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipYUGIGuide

If /i "%BATHAXX%" NEQ "*" goto:skipBATHAXXGuide

echo EXPLOIT BATHAXX>>"%Drive%"\%guidename%
echo --------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo PREREQUIS: * Un original de LEGO Batman>>"%Drive%"\%guidename%
echo            * Une carte non-SDHC formattée en FAT16 ou FAT32 (les cartes SDHC ne fonctionnent pas)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Lancez le jeu LEGO Batman au moins une fois>>"%Drive%"\%guidename%
echo    (sinon vous serez incapable de copier la sauvegarde hackée sur la Wii).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Sauvegardez votre sauvegarde personnelle de LEGO Batman avant de copier les fichiers sur votre carte SD (si vous le souhaitez):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Mettez votre carte SD dans votre Wii et allumez-la.>>"%Drive%"\%guidename%
echo   b) Allez dans Options WII - Gestion des données - Données de sauvegarde - Wii.>>"%Drive%"\%guidename%
echo   c) Trouvez votre sauvegarde LEGO Batman, cliquez dessus, cliquez sur "Copier" et cliquez sur "Oui". Maintenant effacez la sauvegarde de votre Wii.>>"%Drive%"\%guidename%
echo   d) Connectez votre carte SD à votre PC et copiez le dossier "private" de la carte SD sur le PC. Si un dossier "private" est déjà présent vous pouvez le renommer.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copiez les fichiers depuis %DRIVE% sur votre carte SD (si ce n'est déjà fait) et insérez-la dans votre Wii.>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Allez dans Options Wii - Gestion des données - Wii - Carte SD.>>"%Drive%"\%guidename%
echo    Ensuite, copiez la sauvegarde LEGO Batman qui correspond à votre région sur votre Wii.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Démarrez le jeu LEGO Batman. Chargez la nouvelle sauvegarde.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo    Vous êtes maintenant dans la batcave, prenez l'ascenseur sur la droite.>>"%Drive%"\%guidename%
echo    Quand vous êtes dans la salle des trophées, entrez dans le manoir Wayne.>>"%Drive%"\%guidename%
echo    Déplacez le curseur sur la 11ème colonne et 4ème ligne.>>"%Drive%"\%guidename%
echo    Lancez l'exploit.>>"%Drive%"\%guidename%

If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipBATHAXXGuide


If /i "%ROTJ%" NEQ "*" goto:skipROTJGuide

echo EXPLOIT RETURN OF THE JODI>>"%Drive%"\%guidename%
echo -------------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo PREREQUIS: * Un original de LEGO Star Wars>>"%Drive%"\%guidename%
echo            * Une carte non-SDHC formattée en FAT16 ou FAT32 (les cartes SDHC ne fonctionnent pas)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Lancez le jeu LEGO Star Wars au moins une fois>>"%Drive%"\%guidename%
echo    (sinon vous serez incapable de copier la sauvegarde hackée sur la Wii).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Sauvegardez votre sauvegarde personnelle de LEGO Star Wars avant de copier les fichiers sur votre carte SD (si vous le souhaitez):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Mettez votre carte SD dans votre Wii et allumez-la.>>"%Drive%"\%guidename%
echo   b) Allez dans Options WII - Gestion des données - Données de sauvegarde - Wii.>>"%Drive%"\%guidename%
echo   c) Trouvez votre sauvegarde LEGO Star Wars, cliquez dessus, cliquez sur "Copier" et cliquez sur "Oui". Maintenant effacez la sauvegarde de votre Wii.>>"%Drive%"\%guidename%
echo   d) Connectez votre carte SD à votre PC et copiez le dossier "private" de la carte SD sur le PC. Si un dossier "private" est déjà présent vous pouvez le renommer.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copiez les fichiers depuis %DRIVE% sur votre carte SD (si ce n'est déjà fait) et insérez-la dans votre Wii.>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Allez dans Options Wii - Gestion des données - Wii - Carte SD.>>"%Drive%"\%guidename%
echo    Ensuite, copiez la sauvegarde LEGO Star Wars qui correspond à votre région sur votre Wii.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Démarrez le jeu LEGO Star Wars. Chargez la nouvelle sauvegarde.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo    Dès que le niveau se lance, allez à droite et vous verrez 2 personnages flottants >>"%Drive%"\%guidename%
echo    Allez dans la partie devant eux et vous verrez apparaitre "Return of JODI" >>"%Drive%"\%guidename%
echo    Lancez l'exploit. >>"%Drive%"\%guidename%

If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipROTJGuide


If /i "%TOS%" NEQ "*" goto:skipTOSGuide

echo ERI HAKAWAI EXPLOIT>>"%Drive%"\%guidename%
echo -------------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo PREREQUIS: * Un original de Tales of Symphonia: Dawn of the New World>>"%Drive%"\%guidename%
echo            * Une carte non-SDHC formattée en FAT16 ou FAT32 (les cartes SDHC ne fonctionnent pas)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Lancez le jeu Tales of Symphonia au moins une fois>>"%Drive%"\%guidename%
echo    (sinon vous serez incapable de copier la sauvegarde hackée sur la Wii).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Sauvegardez votre sauvegarde personnelle de Tales of Symphonia: Dawn of the New World avant de copier les fichiers sur votre carte SD (si vous le souhaitez):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Mettez votre carte SD dans votre Wii et allumez-la.>>"%Drive%"\%guidename%
echo   b) Allez dans Options WII - Gestion des données - Données de sauvegarde - Wii.>>"%Drive%"\%guidename%
echo   c) Trouvez votre sauvegarde Tales of Symphonia , cliquez dessus, cliquez sur "Copier" et cliquez sur "Oui". Maintenant effacez la sauvegarde de votre Wii.>>"%Drive%"\%guidename%
echo   d) Connectez votre carte SD à votre PC et copiez le dossier "private" de la carte SD sur le PC. Si un dossier "private" est déjà présent vous pouvez le renommer.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copiez les fichiers depuis %DRIVE% sur votre carte SD (si ce n'est déjà fait) et insérez-la dans votre Wii.>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Allez dans Options Wii - Gestion des données - Wii - Carte SD.>>"%Drive%"\%guidename%
echo    Ensuite, copiez la sauvegarde Tales of Symphonia qui correspond à votre région sur votre Wii.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Démarrez le jeu Tales of Symphonia. Chargez la nouvelle sauvegarde.>>"%Drive%"\%guidename%



If /i "%REGION%" EQU "J" goto:noskip
If /i "%REGIONCHANGE%" EQU "J" (goto:noskip) else (goto:quickskip)
:noskip
sfk echo -spat \x20 Pour les utilisateurs japonnais, il y a 2 versions diff\xe9rentes du jeu.>>"%Drive%"\%guidename%
sfk echo -spat \x20 Si votre jeu est la version \x22RVL\x2dRT4J\x2d0A\x2d0 JPN\x22 utilisez la prem\xe8re sauvegarde,>>"%Drive%"\%guidename%
echo   si vous avez "RVL-RT4J-0A-1 JPN" utilisez la seconde sauvegarde.>>"%Drive%"\%guidename%
echo   Si vous avez n'importe qu'elle autre version du disque, cela ne fonctionnera probablement pas.>>"%Drive%"\%guidename%
:quickskip



echo .>>"%Drive%"\%guidename%
echo    Une fois que le jeu commence (vous voyez un chien qui vous salut), pressez "+" pour accéder à un menu.>>"%Drive%"\%guidename%
echo    Sélectionnez "Status" ou "Etat" et appuyez sur "A".>>"%Drive%"\%guidename%
echo    Sélectionnez "Eri HaKawai" et appuyez sur "A" pour lancer l'exploit.>>"%Drive%"\%guidename%


If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipTOSGuide



If /i "%TWI%" NEQ "*" goto:skipTWIGuide

echo EXPLOIT TWILIGHT HACK>>"%Drive%"\%guidename%
echo --------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo PREREQUIS: * Un original de Legend of Zelda: Twilight Princess>>"%Drive%"\%guidename%
echo            * Une carte non-SDHC formattée en FAT16 ou FAT32 (les cartes SDHC ne fonctionnent pas)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Lancez le jeu Twilight Princess au moins une fois>>"%Drive%"\%guidename%
echo    (sinon vous ne pourrez pas copier la sauvegarde hackée sur la Wii).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Sauvegardez votre sauvegarde personnelle de Twilight Princess avant de copier les fichiers sur votre carte SD (si vous le souhaitez):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Mettez votre carte SD dans votre Wii et allumez-la.>>"%Drive%"\%guidename%
echo   b) Allez dans Options WII - Gestion des données - Données de sauvegarde - Wii.>>"%Drive%"\%guidename%
echo   c) Trouvez votre sauvegarde Twilight Princess, cliquez dessus, cliquez sur "Copier" et cliquez sur "Oui". Maintenant effacez la sauvegarde de votre Wii.>>"%Drive%"\%guidename%
echo   d) Connectez votre carte SD à votre PC et copiez le dossier "private" de la carte SD sur le PC. Si un dossier "private" est déjà présent vous pouvez le renommer.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copiez les fichiers depuis %DRIVE% sur votre carte SD (si ce n'est déjà fait) et insérez-la dans votre Wii.>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Allez dans Options Wii - Gestion des données - Wii - Carte SD.>>"%Drive%"\%guidename%
echo    Ensuite, copiez la sauvegarde Twilight Princess qui correspond à votre région sur votre Wii.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Démarrez le jeu Legend of Zelda: Twilight Princess. Chargez la nouvelle sauvegarde.>>"%Drive%"\%guidename%


If /i "%REGION%" EQU "U" echo .>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo Note: Regardez en haut du disque en premier.>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo       S'il y a RVL-RZDE-0A-2 USA inscrit dessus, vous devez charger TwilightHack2 lors de la prochaine étape.>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo       S'il y a quelque chose d'autre, chargez TwilightHack0.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo F. Sur l'écran titre du jeu, appuyez sur A et B.>>"%Drive%"\%guidename%
If /i "%REGION%" NEQ "U" echo    Chargez la sauvegarde the twilight hack.>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo    Chargez la sauvegarde the twilight hack (voir plus loin!).>>"%Drive%"\%guidename%

If /i "%REGION%" EQU "U" echo    Si vous avez accidentellement chargé le mauvais fichier et continué le hack, le jeu va freezer, mais pas de panique!>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo    Appuyez simplement 5 secondes sur le bouton power, redémarrer la Wii et recommencez.>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo G. Pour lancer l'exploit, parlez au premier personnage que vous voyez.>>"%DRIVE%"\%guidename%
:skipTWIGuide

echo .>>"%Drive%"\%guidename%

If /i "%MENU1%" EQU "H" goto:HMsolution2


:HACKMIIGUIDE
If /i "%HM%" NEQ "*" goto:PRIIGUIDE

echo .>>"%Drive%"\%guidename%
echo Ceci va lancer le Hackmii Installer (et silencieusement/automatiquement installer BootMii en IOS). Lancer l'installateur pour installer l'Homebrew Channel (HBC) et Bootmii en Boot2 si possible. Si vous ne pouvez pas installer BootMii en Boot2, vous devez quand même faire "prepare an SD Card" pour BootMii (le dossier "BootMii" est nécessaire pour lancer BootMii en IOS ou Boot2).>>"%DRIVE%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Note: si vous avez le message d'erreur "no vulnerable IOS", lancez de nouveau ModMii et cette fois sélectionnez l'option "Hackmii Solutions" au lieu de "Guide ModMii" et suivez les nouvelles instructions.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Après avoir quitté le hackmii installer, vous avez l'HBC.>>"%Drive%"\%guidename%


echo Appuyez sur le bouton "home". En haut à droite, vous pouvez apercevoir l'IOS utilsé par l'HBC.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Si l'HBC utilise un autre IOS que l'IOS58 ou que l'HBC est à l'envers, souvenez-vous de ce problème, c'est traité plus loin dans ce guide (il faudra re-installer l'HBC).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Si elle utilise l'IOS58 et qu'elle n'est pas à l'envers, vous pouvez passez l'étape de re-installation de l'HBC.>>"%DRIVE%"\%guidename%


echo .>>"%Drive%"\%guidename%



:nandbackup

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) CREATION DE LA SAUVEGARDE NAND>>"%Drive%"\%guidename%
echo    ==============================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%



echo Quand vous êtes sur l'HBC, lancez BootMii en appuyant sur "HOME" et en cliquant sur "Lancer BootMii".>>"%Drive%"\%guidename%
echo Appuyez 3 fois sur le bouton Power pour aller sur les options, et appuyez sur le bouton Reset. [Vous pouvez utiliser une manette gamecube pour vous deplacer]>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Appuyez sur reset pour choisir la première option et suivez les indications à l'écran pour sauvegarder votre Nand. [les Bad blocks ne sont pas un problème.]>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Sauvegardez le dossier Bootmii, les fichiers NAND.bin et keys.bin sinon ils seront écrasés (ou renommez les). Ils servent en cas de grosse nécessité, donc sauvegardez-les.>>"%Drive%"\%guidename%
echo Retournez sur l'Homebrew Channel.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Note: Si Bootmii est installé en boot2, il se lancera tant que le dossier "BootMii" sera présent à la racine de la SD.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


::----------------------------RESTORING THE TRUCHA BUG (using IOS236 Installer)--------------------------
:TBRGUIDE

If /i "%IOS236Installer%" NEQ "*" goto:PRIIGUIDE

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) INSTALLATION DE L'IOS236 PATCHE>>"%Drive%"\%guidename%
echo    =============================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%


echo Démarrez l'Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo TRES IMPORTANT!>>"%Drive%"\%guidename%
echo Dans l'Homebrew channel, si vous n'avez pas de connexion internet active, vous verrez une icone clignotante dans le coin en bas à droite de l'écran indiquant son incapacité à initialiser le réseau. Vous devez attendre que l'icone cesse de clignoter ou le laisser clignoter pendant 30-60 secondes avant de le relancer au risque d'avoir des erreurs. Si vous rencontrez cette erreur sans risque, éteignez la Wii et répétez cette étape depuis le début. Pour augmenter vos chances de réussite, ajouter une connexion internet active dans les réglages de la Wii, mais précisez bien "Non" quand on vous demande de faire une mise à jour.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%
echo Vous ne devez effectuer l'une des méthodes ci-dessous.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Méthode A: Utilisation d'IOS236 Installer>>"%Drive%"\%guidename%
echo -------------------------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



echo Apres avoir attendu 30-60 secondes que l'HBC initialise une connexion, lancez "IOS236 Installer v5 MOD". >>"%Drive%"\%guidename%
echo      Note: cette application doit être lancée par l'HBC v1.0.7 ou plus pour fonctionner correctement.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Il devrait dire "IOS236 installation is complete!" et revenir à l'Homebrew Channel.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Si vous rencontrez des erreurs, re-essayez, elles devraient finir par disparaitre.>>"%Drive%"\%guidename%
echo Si elles persistent, essayez d'utiliser Simple IOS Patcher.>>"%Drive%"\%guidename%
echo Ces 2 méthodes permettent d'installer avec succès IOS236, vous pouvez passer à l'étape suivante.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Methode B: Utilisation de Simple IOS Patcher>>"%Drive%"\%guidename%
echo ---------------------------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Après avoir attendu 30-60 secondes que l'HBC initialise une connexion, lancez "Simple IOS Patcher". >>"%Drive%"\%guidename%
echo      Note: cette application doit être lancée par l'HBC v1.0.7 ou plus pour fonctionner correctement.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Choisissez "IOS36" (déjà sélectionné par défaut) et appuyez sur A,>>"%Drive%"\%guidename%
echo Sélectionnez "Install IOS to slot" et choisissez 236,>>"%Drive%"\%guidename%
echo Sélectionnez "Install patched IOS36" laissant les 4 patchs réglés sur "yes" et appuyez sur "A",>>"%Drive%"\%guidename%
echo Choisissez "Load IOS from SD card".>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Confirmez votre choix avec le bouton "A",>>"%Drive%"\%guidename%
echo Lorsque vous y êtes invité, appuyez sur "A" pour continuer l'installation.>>"%Drive%"\%guidename%
echo Lorsque l'installation est termin"e, vous serez de retour au menu principal,>>"%Drive%"\%guidename%
echo Ensuite, appuyez sur le bouton "B" pour quitter.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Si vous rencontrez des erreurs, re-essayez, elles devraient finir par disparaitre.>>"%Drive%"\%guidename%
echo Si elles persistent, essayez d'utiliser IOS236 Installer.>>"%Drive%"\%guidename%
echo Ces 2 méthodes permettent d'installer avec succès IOS236, vous pouvez passer à l'étape suivante.>>"%Drive%"\%guidename%
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

echo %COUNT7%) INSTALLATION DU PRIILOADER>>"%Drive%"\%guidename%
echo    ==========================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%

echo Lancez "Priiloader 236 Mod" par l'Homebrew Channel>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Après le chargement de l'installation du priiloader, appuyez sur "+" pour l'installer.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Le Priiloader doit vous indiquer 2 erreurs en "jaune". C'est normal.>>"%Drive%"\%guidename%
echo       loader.ini couldn't delete error -106 >>"%Drive%"\%guidename%
echo       password.txt couldn't delete error -106 >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Après avoir correctement installé le Priiloader, éteignez votre Wii>>"%Drive%"\%guidename%
echo et redémarrez-la tout en maintenant le bouton RESET jusqu'à ce que vous voyez le menu principal.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Vous pouvez installer maintenant les hacks du Menu Système (en allant dans l'option System Menu hacks).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo HACKS RECOMMANDES: Block Disc Updates, Block Online Updates, Replace Health Screen, Auto-Press A at Health Screen, Region-Free Everything, remove no copy save file protection et Move Disc Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Le menu du Priiloader est blanc par défaut, vous pouvez le passer en noir si vous voulez, dans les options.>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%

echo Une fonction spéciale du Priiloader est que vous pouvez booter sur une appli ou un fichier au lieu du Menu Système. Certaines applis (comme crazyIntro) ne peuvent pas se lancer sans lui.>>"%Drive%"\%guidename%
echo Pour les détails, visitez http://www.sites.google.com/site/completesg/system-hacks/priiloader>>"%Drive%"\%guidename%

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

echo %COUNT7%) INSTALLATION DE WADS>>"%Drive%"\%guidename%
echo    ==================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

::MMM Instructions
echo Chargez Multi-Mod Manager (MMM) par l'HomeBrew Channel.>>"%Drive%"\%guidename%
echo Si IOS%patchIOSnum% n'est pas chargé, sélectionnez "Load another IOS" et sélectionnez IOS%patchIOSnum% >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Note: si cette étape échoue avec l'erreur -ret 2011 ou autre, vous devez relancer le patch IOS%patchIOSnum%. Si la Wii a déjà été hackée, vous pouvez tenter de lancer le cIOS250 (ou autre comme 202,222,223,224,236,249)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Dans le menu de Multi-Mod Manager, descendez pour choisir "WAD Manager".>>"%Drive%"\%guidename%


goto:skipy4m
::YAWMM 4 ModMii Instructions
echo Demarrez l'Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo TRES IMPORTANT!>>"%Drive%"\%guidename%
echo Dans l'HBC, si vous n'avez pas de connexion internet active, vous verrez un icone clignotant dans le coin en haut à droite de l'écran.>>"%Drive%"\%guidename%
echo Vous devez attendre que l'icone arrête de clignoter ou attendre 30-60 secondes avant de recommencer à lancer l'application. >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Apres avoir attendu 30-60 secondes que l'HBC initialise le réseau, lancez "YAWMM 4 ModMii". >>"%Drive%"\%guidename%
echo      Note: Cette application nécessite d'être lancée par l'HBC v1.0.7 ou plus pour fonctionner correctement.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Appuyez sur "A" pour continuer.>>"%Drive%"\%guidename%
echo Appuyez sur "A" à nouveau pour lire la carte SD. >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo TRES IMPORTANT!>>"%Drive%"\%guidename%
echo Attendez 30-60 secondes pour voir si l'appli freeze. Si elle freeze, éteignez la Wii et recommencez au début. Si après avoir attendu 30-60 secondes, l'appli ne freeze pas, cela confirme qu'elle peut être utilisée.>>"%Drive%"\%guidename%
:skipy4m




echo .>>"%Drive%"\%guidename%
echo Installer les WADS suivants à partir du dossier wad (cette liste de WAD est propre aux réponses que vous avez donné à l'assistant).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Soyez prudent de ne pas installer de wads enregistrés auparavant dans ce dossier (ils sont peut être sans risque, mais sans garantie).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Appuyez sur "+" pendant 2 secondes pour sélectionner tous les wads du dossier. Appuyez sur "A" à nouveau pour tous les installer.>>"%Drive%"\%guidename%

echo Si certains fichiers ne s'installent pas correctement, ils seront à nouveau marqués pour l'installation, il suffit juste de les re-installer.>>"%Drive%"\%guidename%
::echo After the installation finishes read the install report to make sure all the files installed properly.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo      Votre liste de wads à installer est la suivante:>>"%Drive%"\%guidename%
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
if /i "%cIOS249[56]-d2x-v6%" EQU "*" echo      * cIOS249[56]-v21d2x%d2x-beta-rev%>>"%Drive%"\%guidename%
if /i "%cIOS250[57]-d2x-v6%" EQU "*" echo      * cIOS250[57]-v21d2x%d2x-beta-rev%>>"%Drive%"\%guidename%

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

echo        C'est une chaîne forwarder qui va charger le premier fichier trouvé dans la liste suivante:>>"%Drive%"\%guidename%
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

echo        Note: l'IOS58 peut lancer des applis d'une carte SD,>>"%Drive%"\%guidename%
echo              un HDD en FAT32/NTFS/ext2/ext3/ext4. Elles doivent avoir leurs meta.xml>>"%Drive%"\%guidename%
echo              pour avoir un accès hardware direct.>>"%Drive%"\%guidename%


echo.
echo        Vous devez toujours avoir au moins une chaîne forwarder installée sur votre Wii,>>"%Drive%"\%guidename%
echo        Dans le cas d'une mise à jour accidentelle, vous pourrez rehacker votre Wii sans utiliser de faille spécifiques à un jeu>>"%Drive%"\%guidename%
:nousbx

echo .>>"%Drive%"\%guidename%

if /i "%FIRM%" EQU "%FIRMSTART%" goto:SKIP
echo Note: Lorsque vous installez un nouveau Menu Système, le Priiloader est désinstallé, pensez donc à le re-installer (surtout si vous n'avez pas bootmii en boot2)>>"%Drive%"\%guidename%
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

echo %COUNT7%) RE-INSTALLATION DE L'HOMEBREW CHANNEL (si besoin)>>"%Drive%"\%guidename%
echo    ====================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%

echo Vous avez précédemment vérifié quel IOS est utilisé par l'homebrew channel (HBC). Si l'IOS utilisé par l'HBC est le 58 et qu'elle n'est pas à l'envers, vous pouvez passer cette étape.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Si l'HBC utilise un IOS autre que le 58 ou que l'HBC est à l'envers, vous devez la re-installer.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Lancez HackMii_Installer par l'HBC.>>"%Drive%"\%guidename%
echo Utilisez le Hackmii Installer pour fixer/re-installer l'HBC. Une fois l'HBC re-installée, vous pouvez passer à l'étape suivante de ce guide.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


::echo If you already exited MMM, you can load the HackMii_Installer from the HBC.>>"%Drive%"\%guidename%
::echo .>>"%Drive%"\%guidename%

echo Si l'HBC n'arrive pas à lancer le HackMii_Installer (écran noir), utilisez la méthode de la première étape>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%




::------------------------Install Custom Theme Using MyMenuify----------------------------
:MyMGuide
If /i "%MyM%" NEQ "*" goto:noMyM

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) INSTALLER UN MENU WII PERSONNALISE EN UTILISANT MYMENUIFY (facultatif)>>"%Drive%"\%guidename%
echo    ===================================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%
echo AVERTISSEMENT: NE PAS INSTALLER DES THEMES SANS PROTECTION: BOOTMII, PRIILOADER ET SAUVEGARDE NAND>>"%Drive%"\%guidename%
echo                SEULEMENT INSTALLER DES THEMES POUR VOTRE VERSION/REGION DE MENU SYSTEME! >>"%Drive%"\%guidename%
echo.>>"%Drive%"\%guidename%
echo Pour installer des thèmes lancez MyMenuify avec l'HBC.>>"%Drive%"\%guidename%
echo.>>"%Drive%"\%guidename%
echo Allez à SD:\MyMenuify_Themes et sélectionnez le thème que vous souhaitez installer >>"%Drive%"\%guidename%
echo correspondant à votre Menu Wii spécifique.>>"%Drive%"\%guidename%
echo.>>"%Drive%"\%guidename%
echo Si jamais vous décidez de restaurer le thème original de la Wii,>>"%Drive%"\%guidename%
echo utilisez MyMenuify et installez le fichier app original pour votre Wii qui>>"%Drive%"\%guidename%
echo est également enregistré dans SD:\MyMenuify_Themes>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
:noMyM

if /i "%USBGUIDE%" EQU "Y" goto:USBGUIDESTEP1


::--------------------After Modding-----------------------
:AFTERMODDING

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) APRES LE HACK>>"%Drive%"\%guidename%
echo    =============>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%


echo Après avoir hacké votre Wii, vous pouvez effacer les ficiers inutiles>>"%Drive%"\%guidename%
echo en utilisant "Supprimer les fichiers devenus inutiles" de ModMii. >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

If /i "%BB1%" EQU "*" echo Si vous décidez de ne pas utiliser le nettoyage de fichiers et que votre Wii freeze dès que vous tentez d'acceder au menu de la carte SD, vous devrez effacer le dossier "aktn" qui contient (SD:\private\wii\title\aktn) ou renommer le dossier "private".>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo .>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo Si vous décidez de ne pas utiliser le nettoyage de fichiers et que votre Wii freeze dès que vous tentez d'acceder au menu de la carte SD, vous devrez effacer le dossier "aktn" qui contient (SD:\private\wii\title\aktn) ou renommer le dossier "private".>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo .>>"%Drive%"\%guidename%

echo Une fois à cette étape, vous avez pratiquement terminé.>>"%Drive%"\%guidename%
echo Il reste à télécharger les dernières versions des applications et les enregistrer>>"%Drive%"\%guidename%
echo sur votre carte SD (ou disque dur USB FAT32), ainsi elles pourront être lancées à partir de l'HBC.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
if /i "%USBGUIDE%" EQU "Y" goto:skip
echo Pour pouvoir jouer à vos jeux à partir d'un disque dur USB, lancez le menu de ModMii qui traite des caractéristiques des USB-Loader>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
:skip

echo Pour télécharger des applications, vous devez:>>"%Drive%"\%guidename%
echo * Consulter les pages de téléchargement proposées par ModMii, elles contiennent de nombreuses applications utiles disponibles au téléchargement.>>"%Drive%"\%guidename%
echo * Télécharger l'Homebrew Browser via ModMii pour obtenir de nombreuses applications populaires, mais c'est une application Wii uniquement online (http://www.sites.google.com/site/completesg/how-to-use/hbb)>>"%Drive%"\%guidename%
echo * Pour ceux qui n'ont pas internet sur leur Wii, consultez cette liste d'applications (wiibrew.org/wiki/List_of_all_homebrew).>>"%Drive%"\%guidename%
echo Une autre source utile est webrewwii.blogspot.com>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Après avoir obtenu n'importe quelle application, vous devriez avoir un fichier boot.dol et quelques fois un fichier icon.png ainsi qu'un meta.xml.>>"%Drive%"\%guidename%
echo Pour que l'HBC puisse lire correctement votre SD/USB, votre carte doit être structurée comme ceci SD:/apps/nom de l'application/boot.dol>>"%Drive%"\%guidename%
echo si vous avez un *.dol qui n'est pas nommé autrement, renommez le en boot.dol, sinon il ne sera pas reconnu par l'HBC.>>"%Drive%"\%guidename%
echo (note: si présents, l'icon.png et le meta.xml doivent être placés au même endroit que le boot.dol)>>"%Drive%"\%guidename%


::---------------------support XFLAK-----------------------
:supportxflak

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) SUPPORT XFLAK>>"%Drive%"\%guidename%
echo    =============>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo SI MODMII FONCTIONNE CORRECTEMENT POUR VOUS, VOTEZ POUR CE PROGRAMME ICI (tinyurl.com/ModMiiNow)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo LES DONS PEUVENT ETRE FAIT SI VOUS LE SOUHAITEZ VIA PAYPAL SUR CE COMPTE XFLAK40@HOTMAIL.COM>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo CONSULTEZ UN CLASSEMENT DE MES CHAINES ICI (tinyurl.com/topchannels)>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo CONSULTEZ MES VIDEOS SUR CRAZY INTRO ICI (tinyurl.com/crazyintro)>>"%Drive%"\%guidename%

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
if /i "%SETTINGS%" EQU "G" sfk echo -spat Cr\xe9ation du guide, patientez...
if /i "%SETTINGS%" NEQ "G" sfk echo -spat Cr\xe9ation du guide, patientez, votre t\xe9l\xe9chargement va demarrer rapidement.

if not exist "%Drive%" mkdir "%Drive%" >nul
if not exist "%Drive%"\%guidename% goto:norename1
SET /a COUNT6=%COUNT6%+1
if exist "%Drive%"\ModMiiGuide_HackMiiFix%COUNT6%.txt goto:HMguide
move "%Drive%"\%guidename% "%Drive%"\ModMiiGuide_HackMiiFix%count6%.txt >nul
:norename1




echo ModMii %currentversion% Guide de solutions HackMii>"%Drive%"\%guidename%
echo Créé le %DATE% - %TIME%>>"%Drive%"\%guidename%
echo Controlez les mises à jour sur tinyurl.com/ModMiiNow>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Ce guide a été fait avec les paramètres suivants:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%FIRMSTART%" NEQ "o" echo                * Le firmware actuel est %FIRMSTART%%REGION%>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo                * Le firmware actuel est plus petit que 2.2>>"%Drive%"\%guidename%



echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Ce logiciel n'est pas à vendre. Si vous avez payez pour ce logiciel ou pour un pack le contenant, vous vous êtes fait avoir.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo CE PACKAGE EST LIVRE SANS AUCUNE GARANTIE, QUELLES SOIENT IMPLITES OU EXPLICITES.>>"%Drive%"\%guidename%
echo PERSONNE EN DEHORS DE VOUS NE PEUT ETRE TENU RESPONSABLE DE DOMMAGES CAUSES SUR VOTRE WII!>>"%Drive%"\%guidename%
echo VOUS L'UTILISEZ A VOS RISQUES ET PERILS!>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


echo NOTES IMPORTANTES:>>"%Drive%"\%guidename%
echo ------------------>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo *Ce guide ne nécessite pas de connexion WIFI sur votre Wii.>>"%Drive%"\%guidename%
echo *Une carte SD formattée en FAT32 est nécessaire (meilleurs résultats obtenus avec des cartes non-SDHC, les SDHC ne fonctionnent qu'en 4.0 et supérieur).>>"%DRIVE%"\%guidename%
echo *Si vous rencontrez des erreurs pendant une des étapes, re-formattez votre carte SD en FAT ou FAT32>>"%Drive%"\%guidename%
echo *Eteignez le WiiConnect24 et retirez toutes les manettes/cartes mémoires gamecube durant le hack de la Wii (sauf indications contraires).>>"%DRIVE%"\%guidename%
echo *Si votre Wii venait à freezer, appuyez 5 secondes sur le bouton power pour l'éteindre et recommencez.>>"%Drive%"\%guidename%
echo *N'acceptez pas de mises à jour de Nintendo sans vous être assuré qu'elle est sans risque. La dernière mise à jour (en 4.3) date de juin 2010 et il ne faut pas la faire. Si vous acceptez une mise à jour officielle de Nintendo après le hack, vous perdrez certaines voir toutes les modifications réalisées.>>"%Drive%"\%guidename%
echo *Ne désinstallez jamais un Menu Système ou un IOS>>"%Drive%"\%guidename%
echo *N'installez pas de wads ou de thèmes non testés sans avoir installé Bootmii ou le Priiloader.>>"%Drive%"\%guidename%
echo *Ce guide personnalisé est un bon début, mais le hack Wii est toujours en évolution. Controlez les mises à jour en ligne et souvenez vous que Google est votre ami.>>"%Drive%"\%guidename%
echo *Si vous avez des questions, un guide plus détaillé peut être trouvé ici: http://www.sites.google.com/site/completesg/>>"%Drive%"\%guidename%
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


echo %COUNT7%) LANCEZ Multi-Mod Manager (MMM)>>"%Drive%"\%guidename%
echo    ==============================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Démarrez l'Homebrew Channel (HBC) et chargez Multi-Mod Manager (MMM). Une fois chargé, passez à l'étape suivante.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Si vous n'avez pas l'HBC ou qu'elle n'arrive pas à lancer d'applis (écran noir), vous devrez lancer MMM en utilisant une autre méthode.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%




If /i "%exploitnum%" GEQ "2" echo EXPLOITS>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo Vous ne devrez effectuer qu'UNE SEULE des failles suivantes>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo.>>"%Drive%"\%guidename%


If /i "%BB1%" EQU "*" goto:skipforwardersolution
If /i "%BB2%" EQU "*" goto:skipforwardersolution
echo Note: Si cette Wii a déjà été modifiée et qu'elle a encore une chaîne forwarder installée, vous pouvez l'utiliser pour lancer MMM au lieu d'une faille. Sauvegardez juste le boot.dol de l'application que vous lancez (ie. SD:\apps\MMM\boot.dol) à l'emplacement précis utilisé par votre chaîne forwarder (ie. SD:\apps\usbloader\boot.dol). Ainsi en lançant la chaîne, vous lancerez l'application.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


if /i "%FIRMSTART%" EQU "o" echo Autrement, vous pouvez mettre à jour en v3.0-4.2 en utilisant un DISQUE (ie. NSMBW). Puis répétez le guide de ModMii avec votre nouveau firmware et en utilisant la faille Bannerbomb (qui ne nécessite pas de disque spécifique pour fonctionner)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo.>>"%Drive%"\%guidename%

if /i "%REGION%" EQU "U" goto:skipforwardersolution
if /i "%REGION%" EQU "E" goto:skipforwardersolution
if /i "%FIRMSTART%" EQU "o" echo ATTENTION: la mise à jour online en v4.3 rend les Wii coréennes non hackables (sauf s'il y avait auparavant l'HBC v1.0.7 ou plus, BootMii en Boot2v4 ou une chaîne forwarder installée.>>"%DRIVE%"\%guidename%
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


echo %COUNT7%) INSTALLER DES IOSs EN UTILISANT Multi-Mod Manager (MMM)>>"%Drive%"\%guidename%
echo    =================================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Dans le menu principal de Multi-Mod Manager, descendez pour sélectionner "WAD Manager".>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


echo Si vous ne pouvez pas charger votre carte SD, sélectionnez "Load another IOS", puis sélectionnez IOS36.>>"%Drive%"\%guidename%
echo Si la Wii a déjà été hackée, essayez de charger l'IOS250 (ou d'autres comme 202,222,223,224,236,249).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Maintenant, marquez chacun des WADs suivants pour l'installation en sélectionnant chaque WAD et en appuyant sur "+">>"%Drive%"\%guidename%
echo Vous pouvez maintenir "+" pour marquer tous les fichiers de la liste pour l'installation.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%IOS30P60%" EQU "*" echo      * IOS30v16174(IOS60v6174[FS-ES-NP])>>"%Drive%"\%guidename%
if /i "%IOS31%" EQU "*" echo      * IOS31v3608>>"%Drive%"\%guidename%
if /i "%IOS33%" EQU "*" echo      * IOS33v3608>>"%Drive%"\%guidename%
if /i "%IOS34%" EQU "*" echo      * IOS34v3608>>"%Drive%"\%guidename%
if /i "%IOS35%" EQU "*" echo      * IOS35v3608>>"%Drive%"\%guidename%
if /i "%IOS36v3608%" EQU "*" echo      * IOS36v3608>>"%Drive%"\%guidename%
if /i "%IOS58%" EQU "*" echo      * IOS58v6176>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Après avoir marqué tous les WAD, appuyez sur "A" deux fois pour tous les installer.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Soyez prudent de ne pas installer de wads enregistrés auparavant dans ce dossier (ils sont peut être sans risque, mais sans garantie).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


echo Si certains fichiers ne s'installent pas correctement, ils seront à nouveau marqués pour l'installation, il suffit juste de les re-installer.>>"%Drive%"\%guidename%

echo Apres avoir reussi l'installation, passez à l'étape suivante mais ne quittez pas MMM.>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


echo %COUNT7%) INSTALLATION DE L'HOMEBREW CHANNEL (HBC)>>"%Drive%"\%guidename%
echo    ========================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Dans le menu principal de MMM, sélectionnez "App Manager" puis choisissez HackMii_Installer.>>"%Drive%"\%guidename%

echo Utilisez le Hackmii Installer pour fixer/re-installer l'HBC. Si vous ne l'avez pas encore fait, vous devriez installer BootMii en Boot2 (si possible).>>"%Drive%"\%guidename%


echo Une fois que vous avez re-installé l'HBC, vous en avez fini avec ce guide.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


echo Si vous avez quitte MMM, vous pouvez lancer HackMii_Installer à partir de l'Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Si l'HBC n'arrive pas à lancer d'applis (écran noir), au lieu de lancer MMM avec la méthode décrit à l'étape 1, dans le menu principal de MMM sélectionnez "App Manager" et choisir HackMii_Installer.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Ceci lancera HackMii Installer, utilisez-le pour re-installer l'Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

If /i "%BB1%" EQU "*" echo Après avoir hacké votre Wii, si elle freeze quand vous tentez d'acceder au menu carte SD, vous devrez effacer le dossier "aktn" ou Bannerbomb est sauvegardé (SD:\private\wii\title\aktn) ou renommer le dossier "private".>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo .>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo Après avoir hacké votre Wii, si elle freeze quand vous tentez d'acceder au menu carte SD, vous devrez effacer le dossier "aktn" ou Bannerbomb est sauvegardé (SD:\private\wii\title\aktn) ou renommer le dossier "private".>>"%Drive%"\%guidename%
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
if /i "%SETTINGS%" EQU "G" sfk echo -spat Cr\xe9ation du Guide, patientez...
if /i "%SETTINGS%" NEQ "G" sfk echo -spat Cr\xe9ation du Guide, patientez, votre t\xe9l\xe9chargement va demarrer rapidement.

if not exist "%Drive%" mkdir "%Drive%" >nul
if not exist "%Drive%"\%guidename% goto:norename
SET /a COUNT6=%COUNT6%+1
if exist "%Drive%"\ModMiiGuide_USBLoaderSetup%COUNT6%.txt goto:usbguide
move "%Drive%"\%guidename% "%Drive%"\ModMiiGuide_USBLoaderSetup%count6%.txt >nul
:norename

echo ModMii %currentversion% Guide personnalisé de l'USB-Loader>"%Drive%"\%guidename%
echo Généré le %DATE% - %TIME%>>"%Drive%"\%guidename%
echo Controlez les mises à jour sur tinyurl.com/ModMiiNow>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%





echo Ce guide a été généré en utilisant les paramètres suivant:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%FORMAT%" EQU "4" goto:skip
if /i "%FORMAT%" EQU "5" goto:skip
echo                * Disque dur externe formaté en %FORMATNAME%>>"%Drive%"\%guidename%
goto:skip2
:skip
echo                * Disque dur externe déjà formaté en %FORMATNAME%>>"%Drive%"\%guidename%
:skip2
if /i "%USBFolder%" EQU "*" echo                * Télécharger Configurable USB-Loader>>"%Drive%"\%guidename%
if /i "%FLOW%" EQU "*" echo                * Télécharger WiiFlow>>"%Drive%"\%guidename%


if /i "%USBCONFIG%" EQU "USB" echo                * Réglages et config de l'USB-Loader sauvegardés sur disque dur USB>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo                * Réglages et config de l'USB-Loader sauvegardés sur carte SD>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Ce logiciel n'est pas à vendre. si vous avez payé pour ce logiciel ou un pack le comprenant, vous vous êtes fait avoir.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo CE PACKAGE EST LIVRE SANS AUCUNE GARANTIE, EXPLICITES OU IMPLICITES.>>"%Drive%"\%guidename%
echo PERSONNE EN DEHORS DE VOUS NE PEUT ETRE TENU POUR RESPONSABLE DES DEGATS OCCASIONNES SUR VOTRE WII!>>"%Drive%"\%guidename%
echo A UTILISER A VOS RISQUES ET PERILS!>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo NOTES IMPORTANTES:>>"%Drive%"\%guidename%
echo ------------------>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo *Des cIOSs sont nécessaires pour utiliser l'USB-Loader, si vous n'avez pas de cIOSs, lancez le guide de ModMii pour hacker votre Wii avant de passer aux réglages de votre USB-Loader.>>"%Drive%"\%guidename%
echo *cIOS249 rev18 ou plus est nécessaire pour utiliser des disques dur formatés en FAT32 ou NTFS (cIOS222 rev4 ou plus fonctionne également, mais il faudra télécharger la version 222 du Configurable usb-loader ou modifier votre fichier config.txt pour le Configurable USB-Loader)>>"%Drive%"\%guidename%
echo *Tous les disques durs ne sont pas compatibles avec la Wii, pour une liste de compatibilité, consultez cette page: http://wiki.gbatemp.net/wiki/USB_Devices_Compatibility_List>>"%Drive%"\%guidename%
echo *Si vous avez des questions, un guide plus détaillé peut être consulté ici: http://www.sites.google.com/site/completesg/>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


:USBGUIDESTEP1

if /i "%MENU1%" NEQ "W" goto:skip

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo ======================================================================================>>"%Drive%"\%guidename%
echo LE RESTE DU GUIDE EST FAIT SUR VOTRE ORDINATEUR POUR CONFIGURER VOTRE CLE USB-LOADER>>"%Drive%"\%guidename%
echo ======================================================================================>>"%Drive%"\%guidename%

:skip


if /i "%FORMAT%" NEQ "3" goto:skippartition
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) PARTITION ET FORMAT DE DISQUE DUR>>"%Drive%"\%guidename%
echo    =================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Si vous avez des fichiers placés sur votre disque dur, vous devriez les sauvegarder maintenant car toutes les données seront perdues après cette étape.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Clic droit sur "Poste de travail" et choisir "Géreré, une nouvelle fenêtre va s'ouvrir, dans le panneau de gauche cliquez sur "Gestion des disques".>>"%Drive%"\%guidename%
echo Clic droit sur le lecteur que vous voulez partitionner (assurez-vous de sélectionner le lecteur de droite!) et choisir "Effacer le Volume...">>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Dans la moitié basse du menu de la fenêtre, repérez l'espace non alloué, clic droit dessus et sélectionnez "Nouveau volume simple...">>"%Drive%"\%guidename%
echo Entrez la "taille du volume" que vous souhaitez pour votre partition FAT32, et cliquez sur "Suivant".>>"%Drive%"\%guidename%
echo Choisissez une lettre pour cette partition et cliquez sur "Suivant" (notez bien cette lettre, elle va nous servir plus tard)>>"%Drive%"\%guidename%
echo Vous n'êtes pas obligé de changer le système de fichiers en FAT32 (C'est seulement une option si la taille du volume est inférieure à 32GB)>>"%Drive%"\%guidename%
echo Si FAT32 n'est pas dans les options, sélectionner "ne pas formater ce volume" et cliquez sur "Suivant">>"%Drive%"\%guidename%
echo (ce n'est pas grave si vous formatez le volume parce que vous allez le mettre en FAT32 plus tard)>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%

echo Dans la moitié basse du menu de la fenêtre, repérez l'espace restant non alloué (pour la partition NTFS), clic droit dessus et selectionnez "Nouveau volume simple....">>"%Drive%"\%guidename%
echo Cliquez sur "Suivant" (pour formater tout l'espace restant du lecteur).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Choisissez une lettre pour cette partition et cliquez sur "suivant".>>"%Drive%"\%guidename%
echo Assurez-vous que le système de fichiers est sur NTFS puis nommez la partition/volume,>>"%Drive%"\%guidename%
echo Vous pouvez décocher la case "formatage rapide", cliquez sur "Suivant" puis sur "Terminé".>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

::-----FAT32 format on unformatted partition------
echo Si vous décidez de formater la première partition en FAT32, vous pouvez passer le reste de cette étape.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

::echo Demarrer le fichier WiiBackupManager.exe situe ici:>>"%Drive%"\%guidename%
::echo %DRIVE%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::echo .>>"%Drive%"\%guidename%
::echo Assurez vous de choisir la lettre correspondant a la partition que vous voulez formater en FAT32.>>"%Drive%"\%guidename%
::echo Assurez-vous que le systeme de fichiers est fixe a FAT32 et la taille de cluster est 32KB, puis cliquez sur "Start".>>"%Drive%"\%guidename%



if /i "%PCSAVE%" EQU "Portable" goto:portableF32
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" NEQ "%ModMiipath:~0,2%" goto:portableF32
:skip

echo Lancez FAT32 Formatter GUI à partir des raccourcis sur votre Menu Démarrer ou Bureau>>"%Drive%"\%guidename%
goto:noportableF32

:portableF32
echo Démarrez le fichier FAT32_GUI_Formatter.exe situé ici:>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\FAT32_GUI_Formatter\FAT32_GUI_Formatter.exe>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\FAT32_GUI_Formatter\FAT32_GUI_Formatter.exe>>"%Drive%"\%guidename%
:noportableF32


echo .>>"%Drive%"\%guidename%
echo Assurez-vous de choisir la lettre correspondant à la partition que vous voulez formater en FAT32.>>"%Drive%"\%guidename%
echo Vous pouvez éventuellement décochez la case "Formatage rapide" puis cliquez sur "Start".>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

:skippartition


if /i "%FORMAT%" EQU "3" goto:skipformat
if /i "%FORMAT%" EQU "4" goto:skipcopytousb
if /i "%FORMAT%" EQU "5" goto:skipcopytousb

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) FORMATAGE DU DISQUE DUR (si besoin)>>"%Drive%"\%guidename%
echo    =====================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo En premier vérifiez si votre lecteur a besoin d'être formaté en controlant l'actuel type/système de fichiers du lecteur.>>"%Drive%"\%guidename%
echo Ouvrez "Poste de travail", clic droit sur le disque dur externe que vous voulez utiliser et selectionnez "propriétés".>>"%Drive%"\%guidename%
echo Notez la lettre du lecteur du disque dur externe parce qu'elle va etre utilisée plus tard.>>"%Drive%"\%guidename%
echo Si le "systeme de fichiers" est déjà %FORMATNAME%, vous pouvez passer cette étape.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Si vous avez des fichiers présents sur votre disque dur, vous devriez les sauvegarder maintenant car toutes les données vont être effacées une fois le formatage effectué.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%FORMAT%" EQU "2" goto:formatNTFS
::echo Demarrer le fichier WiiBackupManager.exe situe ici:>>"%Drive%"\%guidename%
::echo %DRIVE%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::echo .>>"%Drive%"\%guidename%
::echo Assurez vous de choisir la lettre correspondant a la partition que vous voulez formater en FAT32.>>"%Drive%"\%guidename%
::echo Assurez-vous que le systeme de fichiers est fixe a FAT32 et la taille de cluster est 32KB, puis cliquez sur "Start".>>"%Drive%"\%guidename%


if /i "%PCSAVE%" EQU "Portable" goto:portableF32
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" NEQ "%ModMiipath:~0,2%" goto:portableF32
:skip

echo Lancez FAT32 Formatter GUI à partir des raccourcis sur votre Menu Démarrer ou Bureau>>"%Drive%"\%guidename%
goto:noportableF32

:portableF32
echo Démarrez le fichier FAT32_GUI_Formatter.exe situé ici:>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\FAT32_GUI_Formatter\FAT32_GUI_Formatter.exe>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\FAT32_GUI_Formatter\FAT32_GUI_Formatter.exe>>"%Drive%"\%guidename%
:noportableF32

echo .>>"%Drive%"\%guidename%
echo Assurez-vous de choisir la lettre correspondant à la partition que vous voulez formater en FAT32.>>"%Drive%"\%guidename%
echo Vous pouvez éventuellement décochez la case "Formatage rapide" puis cliquez sur "Start".>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

goto:notformatNTFS

:formatNTFS
::echo Demarrer le fichier WiiBackupManager.exe situe ici:>>"%Drive%"\%guidename%
::echo %DRIVE%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::echo .>>"%Drive%"\%guidename%
::echo Assurez vous de choisir la lettre correspondant a la partition que vous voulez formater en NTFS.>>"%Drive%"\%guidename%
::echo Assurez-vous que le systeme de fichiers est fixe a NTFS et la taille de cluster est 32KB, puis cliquez sur "Start".>>"%Drive%"\%guidename%

echo Clic droit sur "Poste de travail" et selectionnez "Gérer", une nouvelle fenêtre va s'ouvrir, dans le panneau de gauche cliquez sur "Gestion des disques".>>"%Drive%"\%guidename%
echo Clic droit sur la lettre que vous souhaitez formater (soyez certain de sélectionner le lecteur de droite!) et sélectionnez "Formater...">>"%Drive%"\%guidename%
echo Sélectionnez "NTFS" comme système de fichiers à utiliser et entrez un nom pour votre disque/volume, vous pouvez également décocher la case "Formatage rapide" et cliquez sur "OK", puis cliquez à nouveau sur "OK".>>"%Drive%"\%guidename%

:notformatNTFS


:skipformat



if /i "%USBCONFIG%" NEQ "USB" goto:skipcopytousb
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) COPIE DE FICHIERS SUR LE DISQUE DUR>>"%Drive%"\%guidename%
echo    ===================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Tout copier dans le dossier %DRIVEU% à la racine de votre disque/partition FAT32.>>"%Drive%"\%guidename%


:skipcopytousb


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) GESTION DES SAUVEGARDES WII AVEC WII BACKUP MANAGER (optionnel)>>"%Drive%"\%guidename%
echo    ===============================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%




if /i "%PCSAVE%" EQU "Portable" goto:portableWBM
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" NEQ "%ModMiipath:~0,2%" goto:portableWBM
:skip

echo Lancez WiiBackupManager à partir des raccourcis sur votre Menu Démarrer ou Bureau.>>"%Drive%"\%guidename%
goto:noportableWBM

:portableWBM
echo Démarrez le fichier WiiBackupManager.exe situé ici:>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%


:noportableWBM


echo .>>"%Drive%"\%guidename%

echo Vous pouvez utiliser ce programme pour gérer/transférer vos copies numériques de vos jeux Wii.>>"%Drive%"\%guidename%
echo Il est simple à utiliser, mais un tutoriel détaillé sur l'utilisation de Wii Backup Manager se trouve ici:>>"%Drive%"\%guidename%
echo http://www.sites.google.com/site/completesg/backup-launchers/iso/wbfs-managers/wii-backup-manager>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Note: Pour copier un disque ORIGINAL Wii, insérez-le dans votre Wii, lancez le Configurable USB-Loader et appuyez sur le signe plus "+". Un disque Original Wii ne peut pas être lu/copié en passant par un ordinateur (à moins d'avoir un des rares lecteur LG capable de le faire)>>"%Drive%"\%guidename%

if /i "%LOADER%" EQU "ALL" echo         OU>>"%Drive%"\%guidename%
if /i "%FLOW%" EQU "*" echo       - Lancez WiiFlow, allez à la page 2 des préférences WiiFlow et sélectionnez "Install" puis sélectionnez "Go".>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%
if /i "%FORMAT%" EQU "2" echo Attention: Ripper sur du NTFS est TRES instable, il est fortement recommandé de seulemnt ajouter des jeux sur une partiton NTFS à partir de l'ordinateur.>>"%Drive%"\%guidename%
if /i "%FORMAT%" EQU "3" echo Attention: Ripper sur du NTFS est TRES instable, il est fortement recommandé de seulemnt ajouter des jeux sur une partiton NTFS à partir de l'ordinateur.>>"%Drive%"\%guidename%


if /i "%USBFOLDER%" NEQ "*" goto:skip
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


echo %COUNT7%) CONFIGURER/PERSONNALISER CONFIGURABLE USB-LOADER>>"%Drive%"\%guidename%
echo    =========================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Pour Configurer/personnaliser votre USB-Loader, utilisez le Configurateur pour Configurable USB-Loader récupérable ici:>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\usb-loader\CfgLoaderConfigurator.exe>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\usb-loader\CfgLoaderConfigurator.exe>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%

echo Optionnel: des thèmes supplémentaires pour le Configurable USB-Loader peuvent être trouvés ici:>>"%Drive%"\%guidename%
echo http://wii.spiffy360.com/themes.php>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo * NOTES IMPORTANTES SUR LES REGLAGES PAR DEFAUT:>>"%Drive%"\%guidename%
echo   ---------------------------------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Deux options potentiellement dangereuses sont vérrouillées:>>"%Drive%"\%guidename%
echo      1) la possibilité d'effacer/deplacer des jeux>>"%Drive%"\%guidename%
echo      2) la possibilité de formater un disque dur>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Pour débloquer ces options, lorsque vous êtes dans le menu du configurable USB-Loader, appuyez sur "1" pendant 5 secondes, puis entrez le mot de passe pour déverrouiller ces options. Le mot de passe est "AAAA", vous pouvez le changer dans les réglages en utilisant le Configurateur pour Configurable USB-Loader. Appuyez sur "1" encore pendant 5 secondes pour vérrouiller à nouveau l'USB-Loader (ou il se verrouillera automatiquement quand vous quitterez l'USB-Loader).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

:skip

if /i "%MENU1%" EQU "W" goto:AFTERMODDING

GOTO:supportxflak
