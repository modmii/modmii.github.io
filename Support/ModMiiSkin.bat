@echo off
setlocal

::chdir /d "%~dp0"
pushd "%~dp0"
cls
if not exist support cd..

::PUSHD "%cd%"
::::PUSHD "%~dp0"
::POPD

title ModMiiSkinCMD

::make cmd window transparent and hidden
support\nircmd.exe win trans ititle "ModMiiSkinCMD" 0
support\nircmd.exe win hide ititle "ModMiiSkinCMD"

set redtext=Red
set bluetext=Blue
set yellowtext=Yellow
set greentext=Green
set magentatext=Magenta
set cyantext=Cyan
set backgroundcolor=1
set whitetext=f


::-------------------CMD LINE SUPPORT----------------------
::pass all arguments to modmii classic

set "one=%~1"
if "%one%"=="" (goto:notcmd)

set cmdinput=%*
set cmdinput=%cmdinput:"=%

::ModMii.exe %cmdinput%
start ModMii.exe %cmdinput%
Exit

:notcmd

::----------------------------------------------------------

set currentversion=7.0.0
set currentversioncopy=%currentversion%
set agreedversion=

echo ModMiiSkinCMD v%currentversion%
echo.
echo If you close this window, ModMii Skin will stop working.
echo To hide this window, disable the (V)erbose for ModMii Skin Option (under Other Misc Options)
echo.


::check for write access
if exist "temp\test" goto:skip
mkdir "temp\test"
if not exist "temp\test" (goto:WriteError) else (goto:donecheck)

:skip
if not exist temp\test\test.txt goto:skip
del temp\test\test.txt>nul
if exist temp\test\test.txt (goto:WriteError) else (goto:donecheck)

:skip
echo test>temp\test\test.txt
if exist temp\test\test.txt goto:donecheck

:WriteError

::for skin mode, force screen to be visible
support\nircmd.exe win activate ititle "ModMiiSkinCMD"
support\nircmd.exe win trans ititle "ModMiiSkinCMD" 255

cls
echo ModMii needs to be run as an Administrator if saved to this directory.
echo Please either run ModMii from somewhere else like C:\ModMii or run as admin
echo.
echo Press any key to update shortcuts and run ModMii Skin as administrator...
pause>nul

set cmdinput=%*
if not "%cmdinput%"=="" set cmdinput=%cmdinput:"=%
if not "%cmdinput%"=="" support\nircmd.exe shortcut "%cd%\ModMiiSkin.exe" "%temp%" "ModMiiSkin" "%cmdinput%"
if "%cmdinput%"=="" support\nircmd.exe shortcut "%cd%\ModMiiSkin.exe" "%temp%" "ModMiiSkin"
support\hexalter.exe "%temp%\ModMiiSkin.lnk" 0x15=0x20>nul

if exist "%userprofile%\Desktop\ModMii.lnk" support\hexalter.exe "%userprofile%\Desktop\ModMii.lnk" 0x15=0x20>nul
if exist "%userprofile%\Desktop\ModMii Skin.lnk" support\hexalter.exe "%userprofile%\Desktop\ModMii Skin.lnk" 0x15=0x20>nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii.lnk" support\hexalter.exe "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii.lnk" 0x15=0x20>nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii Skin.lnk" support\hexalter.exe "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii Skin.lnk" 0x15=0x20>nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Uninstall.lnk" support\hexalter.exe "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Uninstall.lnk" 0x15=0x20>nul
cd "%temp%"
start ModMiiSkin.lnk
exit

:donecheck
if exist "temp\test" rd /s /q "temp\test"> nul






set SkinMode=Y

set PATH=%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%

chcp 437>nul

::if not exist temp mkdir temp
if not exist temp\DownloadQueues mkdir temp\DownloadQueues
if exist Support\DownloadQueues\* move /y Support\DownloadQueues\* temp\DownloadQueues>nul
if exist Support\DownloadQueues rd /s /q "Support\DownloadQueues">nul
::if not exist Support\More-cIOSs mkdir Support\More-cIOSs

::check for InstallForge Uninstall.exe, uninstall.dat and uninstall_l.ifl then move\rename to Support folder
if not exist uninstall.dat goto:skip
if exist uninstall.dat move /y uninstall.dat Support\uninstall.dat>nul
if exist uninstall_l.ifl move /y uninstall_l.ifl Support\uninstall_l.ifl>nul
if exist Uninstall.exe move /y Uninstall.exe Support\Uninstall2.exe>nul
:skip
if exist "support\subscripts\Uninstaller.exe" move /y "support\subscripts\Uninstaller.exe" Uninstall.exe>nul

if not exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\" goto:skip
if not exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii.lnk" support\nircmd.exe shortcut "%cd%\ModMii.exe" "~$folder.programs$\ModMii" "ModMii"
if not exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii Skin.lnk" support\nircmd.exe shortcut "%cd%\ModMiiSkin.exe" "~$folder.programs$\ModMii" "ModMii Skin"
if not exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Uninstall.lnk" support\nircmd.exe shortcut "%cd%\Uninstall.exe" "~$folder.programs$\ModMii" "Uninstall"
if not exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Website & Help.lnk" support\nircmd.exe shortcut "https://modmii.github.io" "~$folder.programs$\ModMii" "Website & Help"
if not exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Open ModMii Folder.lnk" support\nircmd.exe shortcut "%windir%\explorer.exe" "~$folder.programs$\ModMii" "Open ModMii Folder" "%cd%\"
:skip

set UPDATENAME=ModMii
::set UPDATENAME=ModMii_IT_

if /i "%debug%" EQU "on" goto:skip
if exist Updatetemp.bat attrib -h Updatetemp.bat
if exist Updatetemp.bat del updatetemp.bat>nul
:skip

::------Check for old Windows Versions-------
::ver | findstr /i "5\.0\." > nul
::IF %ERRORLEVEL% EQU 0 set OSYS=2000

::ver | findstr /i "5\.1\." > nul
::IF %ERRORLEVEL% EQU 0 set OSYS=XP

::ver | findstr /i "5\.2\." > nul
::IF %ERRORLEVEL% EQU 0 set OSYS=2003

::::ver | findstr /i "6\.0\." > nul
::::IF %ERRORLEVEL% EQU 0 set OSYS=VISTA

::::ver | findstr /i "6\.1\." > nul
::::IF %ERRORLEVEL% EQU 0 set OSYS=SEVEN




:DefaultSettings

::----LOAD SETTINGS (if exist)----
if exist Support\settings.bat call Support\settings.bat

::-----default settings (default applies even if a single variable is missing from settings.bat)------
IF "%ROOTSAVE%"=="" set ROOTSAVE=off
IF "%GUIDEOnly%"=="" set GUIDEOnly=off
IF "%effect%"=="" set effect=No-Spin
IF "%PCSAVE%"=="" set PCSAVE=Auto
IF "%OPTION1%"=="" set OPTION1=off
IF "%AudioOption%"=="" set AudioOption=on
IF "%CMIOSOPTION%"=="" set CMIOSOPTION=off
IF "%hermesOPTION%"=="" set hermesOPTION=off
IF "%FWDOPTION%"=="" set FWDOPTION=on
IF "%ExtraProtectionOPTION%"=="" set ExtraProtectionOPTION=on
IF "%Drive%"=="" set "Drive=%cd%\COPY_TO_SD"
IF "%DriveU%"=="" set "DRIVEU=%cd%\COPY_TO_USB"
IF "%ACTIVEIOS%"=="" set ACTIVEIOS=on
IF "%AUSKIP%"=="" set AUSKIP=off
IF "%AUTOUPDATE%"=="" set AUTOUPDATE=on
IF "%ModMiiverbose%"=="" set ModMiiverbose=off
IF "%sneekverbose%"=="" set sneekverbose=off
IF "%neek2o%"=="" set neek2o=on
IF "%SSD%"=="" set SSD=off
::IF "%discexverify%"=="" set discexverify=off
IF "%SNKFONT%"=="" set SNKFONT=B
IF "%skin%"=="" set skin=Default


if exist "Support\Skins\%skin%\ABSTINENCE.bmp" (set "ABSTINENCE.bmp=Support\Skins\%skin%\ABSTINENCE.bmp") else (set "ABSTINENCE.bmp=Support\Skins\Default\ABSTINENCE.bmp")
if exist "Support\Skins\%skin%\CLASSIC.bmp" (set "CLASSIC.bmp=Support\Skins\%skin%\CLASSIC.bmp") else (set "CLASSIC.bmp=Support\Skins\Default\CLASSIC.bmp")
if exist "Support\Skins\%skin%\default.bmp" (set "default.bmp=Support\Skins\%skin%\default.bmp") else (set "default.bmp=Support\Skins\Default\default.bmp")
if exist "Support\Skins\%skin%\DLQUEUE.bmp" (set "DLQUEUE.bmp=Support\Skins\%skin%\DLQUEUE.bmp") else (set "DLQUEUE.bmp=Support\Skins\Default\DLQUEUE.bmp")
if exist "Support\Skins\%skin%\FAIL.bmp" (set "FAIL.bmp=Support\Skins\%skin%\FAIL.bmp") else (set "FAIL.bmp=Support\Skins\Default\FAIL.bmp")
if exist "Support\Skins\%skin%\HackMii.bmp" (set "HackMii.bmp=Support\Skins\%skin%\HackMii.bmp") else (set "HackMii.bmp=Support\Skins\Default\HackMii.bmp")
if exist "Support\Skins\%skin%\MAIN.bmp" (set "MAIN.bmp=Support\Skins\%skin%\MAIN.bmp") else (set "MAIN.bmp=Support\Skins\Default\MAIN.bmp")
if exist "Support\Skins\%skin%\ModMiiSplash.bmp" (set "ModMiiSplash.bmp=Support\Skins\%skin%\ModMiiSplash.bmp") else (set "ModMiiSplash.bmp=Support\Skins\Default\ModMiiSplash.bmp")
if exist "Support\Skins\%skin%\OPTIONS.bmp" (set "OPTIONS.bmp=Support\Skins\%skin%\OPTIONS.bmp") else (set "OPTIONS.bmp=Support\Skins\Default\OPTIONS.bmp")
if exist "Support\Skins\%skin%\RegionChange.bmp" (set "RegionChange.bmp=Support\Skins\%skin%\RegionChange.bmp") else (set "RegionChange.bmp=Support\Skins\Default\RegionChange.bmp")
if exist "Support\Skins\%skin%\SDCARD.bmp" (set "SDCARD.bmp=Support\Skins\%skin%\SDCARD.bmp") else (set "SDCARD.bmp=Support\Skins\Default\SDCARD.bmp")
if exist "Support\Skins\%skin%\SNEEK.bmp" (set "SNEEK.bmp=Support\Skins\%skin%\SNEEK.bmp") else (set "SNEEK.bmp=Support\Skins\Default\SNEEK.bmp")
if exist "Support\Skins\%skin%\SUCCESS.bmp" (set "SUCCESS.bmp=Support\Skins\%skin%\SUCCESS.bmp") else (set "SUCCESS.bmp=Support\Skins\Default\SUCCESS.bmp")
if exist "Support\Skins\%skin%\TERMS.bmp" (set "TERMS.bmp=Support\Skins\%skin%\TERMS.bmp") else (set "TERMS.bmp=Support\Skins\Default\TERMS.bmp")
if exist "Support\Skins\%skin%\UPDATECHECK.bmp" (set "UPDATECHECK.bmp=Support\Skins\%skin%\UPDATECHECK.bmp") else (set "UPDATECHECK.bmp=Support\Skins\Default\UPDATECHECK.bmp")
if exist "Support\Skins\%skin%\UPDATING.bmp" (set "UPDATING.bmp=Support\Skins\%skin%\UPDATING.bmp") else (set "UPDATING.bmp=Support\Skins\Default\UPDATING.bmp")
if exist "Support\Skins\%skin%\USB.bmp" (set "USB.bmp=Support\Skins\%skin%\USB.bmp") else (set "USB.bmp=Support\Skins\Default\USB.bmp")
if exist "Support\Skins\%skin%\USBDIR.bmp" (set "USBDIR.bmp=Support\Skins\%skin%\USBDIR.bmp") else (set "USBDIR.bmp=Support\Skins\Default\USBDIR.bmp")
if exist "Support\Skins\%skin%\WIZARD.bmp" (set "WIZARD.bmp=Support\Skins\%skin%\WIZARD.bmp") else (set "WIZARD.bmp=Support\Skins\Default\WIZARD.bmp")
if exist "Support\Skins\%skin%\skin.ico" (set "skin.ico=Support\Skins\%skin%\skin.ico") else (set "skin.ico=Support\Skins\Default\skin.ico")
if exist "Support\Skins\%skin%\Success.mp3" (set "Success.mp3=Support\Skins\%skin%\Success.mp3") else (set "Success.mp3=Support\Skins\Default\Success.mp3")
if exist "Support\Skins\%skin%\Fail.mp3" (set "Fail.mp3=Support\Skins\%skin%\Fail.mp3") else (set "Fail.mp3=Support\Skins\Default\Fail.mp3")


::convert drive to absolute path if applicable, and if second char is ":" check if drive exists
if /i "%DRIVE:~1,1%" NEQ ":" set "DRIVE=%cd%\%DRIVE%"
if not exist "%DRIVE:~0,2%" set "DRIVE=%cd%\COPY_TO_SD"

if /i "%DRIVEU:~1,1%" NEQ ":" set "DRIVEU=%cd%\%DRIVEU%"
if not exist "%DRIVEU:~0,2%" set "DRIVEU=%cd%\COPY_TO_USB"



::Special update
::if /i "%AGREEDVERSION%" GEQ "6.3.2" goto:nospecialupdate
:::nospecialupdate


if /i "%ModMiiverbose%" EQU "on" support\nircmd.exe win activate ititle "ModMiiSkinCMD"
if /i "%ModMiiverbose%" EQU "on" support\nircmd.exe win trans ititle "ModMiiSkinCMD" 255




set watitle=ModMii Skin
set "waico=%skin.ico%"
set temp=temp
set wabat=%TEMP%\wabat.bat
set wasig=ModMii v%currentversion% by XFlak

::side bar - 150x300 pixels
set "wabmp=%default.bmp%"

if exist support\skipscam.txt (set /p skipversion= <support\skipscam.txt) else (goto:dontskip)
if /i "%skipversion%" EQU "%currentversion%" goto:skip
:dontskip

::Bushing from Team Twizzers specifically requested ModMii include a scam warning

::Splash Screen for Scam Warning
::if /i "%AGREEDVERSION%" EQU "%CURRENTVERSION%" goto:nosplash


::Splash Screen - 440x340 pixel bmp
set "wabmp=%ModMiiSplash.bmp%"

support\wizapp SPLASH OPEN
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" support\nircmd.exe wait 6000

support\nircmd.exe wait 2000
support\wizapp SPLASH CLOSE
:nosplash


::side bar - 150x300 pixels
set "wabmp=%TERMS.bmp%"

set waoutput=

set watext=~Please type the word "I" followed by the word "Agree" with a space between those two words and then click Next to continue.~~If you can't follow those instructions, then you have no business modding anything.


start /w support\wizapp NOBACK EB

if errorlevel 2 Exit

call "%wabat%"


if /i "%waoutput%" EQU "I Agree" goto:skip

if /i "%waoutput%" EQU "skipscam" goto:doit
if /i "%waoutput%" NEQ "skip scam" goto:dontdoit
:doit

if exist support\skipscam.txt attrib -r -h -s support\skipscam.txt
echo %currentversion%>Support\skipscam.txt
attrib +r +h +s support\skipscam.txt
goto:skip
:dontdoit


set watext=~~~~~You have entered an incorrect key, exiting ModMii...

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp FINISH NOBACK NOCANCEL TB

Exit
:skip


::Save version agreed to
if exist Support\settings.bat support\sfk filter -quiet Support\settings.bat -ls!"set AGREEDVERSION=" -write -yes
echo set AGREEDVERSION=%currentversion%>> Support\settings.bat




::.NET Framework 3.5 check+installation
if exist "%windir%\Microsoft.NET\Framework\v3.5" goto:skipframeworkinstallation

::side bar - 150x300 pixels
set "wabmp=%default.bmp%"

set watext=~ModMii requires .NET Framework 3.5...~~ModMii will download and start the installer for you, when you are finished installing .NET Framework 3.5 ModMii will continue.

start support\wizapp PB OPEN

::get different framework installer if running windows 7 or lower
ver>temp\temp.txt
support\sfk filter -quiet "temp\temp.txt" -rep _*" [Version "__ -rep _"."*__ -rep _"]"__ -write -yes
support\sfk filter -quiet "temp\temp.txt" -no-empty-lines -no-blank-lines -write -yes
set /p winver= <temp\temp.txt
::echo %winver%
set "code2=https://download.visualstudio.microsoft.com/download/pr/b635098a-2d1d-4142-bef6-d237545123cb/2651b87007440a15209cac29634a4e45/dotnetfx35.exe"
set "dlname=dotnetfx35.exe"
if /i %winver% LSS 8 (set "code2=https://download.microsoft.com/download/7/0/3/703455ee-a747-4cc8-bd3e-98a615c3aedb/dotNetFx35setup.exe") & (set "dlname=dotNetFx35setup.exe")



set FrameworkAttempt=0

:NETFRAMEWORK
start support\wizapp PB UPDATE 10
SET /a FrameworkAttempt=%FrameworkAttempt%+1

if exist "temp\%dlname%" goto:semiskip

start /min /wait support\wget --no-check-certificate -t 3 "%code2%" -O "temp\%dlname%"
:semiskip

start support\wizapp PB UPDATE 50
start /wait temp\%dlname%
if exist "temp\%dlname%" del "temp\%dlname%">nul
if exist "%windir%\Microsoft.NET\Framework\v3.5" (start support\wizapp PB UPDATE 100) & (start support\wizapp PB CLOSE) & (goto:skipframeworkinstallation)

if /i "%FrameworkAttempt%" EQU "3" goto:GiveUpOnFramework
goto:NETFRAMEWORK

:GiveUpOnFramework
set watext=~~.NET Framework 3.5 Installation Failed Multiple Times~~Alternatively, you can try installing .NET Framework 3.5 by performing a Windows Update~~Some ModMii features may not work properly without .NET Framework 3.5 installed~~Click "Next" to use ModMii anyways.


start support\wizapp PB CLOSE

start /w support\wizapp TB
if errorlevel 2 EXIT
:skipframeworkinstallation




if /i "%AUTOUPDATE%" EQU "on" goto:UpdateModMii




::-----------------------------Main Menu---------------------------------
:MENU
set MENU1=
set waoutnum=
set waoutput=
set "wabmp=%MAIN.bmp%"
set wafile=
set SNEEKTYPE=
set SNEEKSELECT=
set USBCONFIG=
SET UpdatesIOSQ=

set VIRGIN=
set AbstinenceWiz=
set Advanced=
set HMInstaller=
set RECCIOS=
set yawmQ=
set PRIQ=
set IOS236InstallerQ=
set ThemeSelection=N
set MORE=
set PIC=
set NET=
set Weather=
set NEWS=
set MIIQ=
set Shop=
set Speak=
set USBGUIDE=
set LOADER=
set EXPLOIT=
set REGIONCHANGE=
set SNEEKSELECT=
set SNKS2U=
set PRIIFOUND=
set SNKSERIAL=
set addwadfolder=
set ChannelsMarked=
set SNKMarked=
set AdvancedMarked=
set virginMarked=
set FIRMSTARTMarked=
set SNKVERSIONMarked=
set REGIONMarked=
set SNKREGIONMarked=
set EXPLOITMarked=
set FIRMMarked=
set ThemeSelectionMarked=
set USBGUIDEMarked=
set FORMATMarked=
set LOADERMarked=
set USBCONFIGMarked=
set SNEEKSELECTMarked=
set SNEEKTYPEMarked=
set SNKcBCMarked=
set macaddress=


set watext=                           Choose an activity:~~~Start with the ModMii Wizard to softmod your Wii or up/downgrade it and much more. All Wizard activities will build a custom guide for you based on your answers to a few simple questions.


set wainput=ModMii ^&Wizard ^<--Start Here to Mod Your Wii!;^&USB-Loader Setup Wizard;^&HackMii Solutions Wizard;^&Abstinence Wizard (Non-permanent Wii Hacks);Region ^&Change Wizard;^&Load Download Queue;^&SNEEK Installation and EmuNAND Builder;^&Options;modmii.github.io for more ^&Info, support or to donate!;^&ModMii Classic Mode for many more activities

start /w support\wizapp NOBACK RB

if errorlevel 2 exit

call "%wabat%"

if "%waoutnum%"=="" goto:MENU

if /i "%waoutnum%" EQU "0" (set Menu1=W) & (set "wabmp=%WIZARD.bmp%") & (goto:WPAGE1)

if /i "%waoutnum%" EQU "1" (set Menu1=U) & (set "wabmp=%USB.bmp%") & (goto:UPAGE1b)
if /i "%waoutnum%" EQU "2" (set Menu1=H) & (set "wabmp=%HackMii.bmp%") & (goto:WPAGE2)
if /i "%waoutnum%" EQU "3" (set Menu1=S) & (set SNEEKSELECT=3) & (set AbstinenceWiz=Y) & (set "wabmp=%ABSTINENCE.bmp%") & (goto:WPAGE2)
if /i "%waoutnum%" EQU "4" (set Menu1=RC) & (set "wabmp=%RegionChange.bmp%") & (goto:RCPAGE1)
if /i "%waoutnum%" EQU "5" (set Menu1=L) & (set "wabmp=%DLQUEUE.bmp%") & (goto:PICKDOWNLOADQUEUE)
if /i "%waoutnum%" EQU "6" (set Menu1=S) & (set "wabmp=%SNEEK.bmp%") & (goto:SNKPAGE1)
if /i "%waoutnum%" EQU "7" (set Menu1=O) & (set "wabmp=%OPTIONS.bmp%") & (goto:OPTIONS)


if /i "%waoutnum%" EQU "8" (start https://modmii.github.io) & (goto:MENU)


if /i "%waoutnum%" EQU "9" (set SkinMode=) & (start ModMii.exe) & (exit)


::...................................PICK Download Queue...............................
:PICKDOWNLOADQUEUE
set DLQUEUE=
set waoutnum=
::set waoutput=
if not exist temp\DownloadQueues mkdir temp\DownloadQueues
set "waoutput=%cd%\temp\DownloadQueues\YourQueueHere.bat"

set watext=Select the ModMii Download Queue you want to download.~~Note, when you click Finish ModMii will begin downloading immediately. To view the contents of your queue before downloading it use ModMii Classic to load it.~~To create custom Download Queues use ModMii Classic.

set wainput=ModMii Download Queues (*.bat)


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp FINISH FB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:MENU


::double escape real carrots, but correct ^^& back to ^& (which is done by default by wizapp)
support\sfk filter -spat -quiet "%wabat%" -rep _\x5e_\x5e\x5e_ -rep _\x5e\x5e\x26_\x5e\x26_ -write -yes>nul

call "%wabat%"

set "DLQUEUE=%waoutput%"

::remove quotes (if applicable)
setlocal ENABLEDELAYEDEXPANSION
set "DLQUEUE=!DLQUEUE:"=!"
set "DLQUEUE=!DLQUEUE:^^=^!"
setlocal DISABLEDELAYEDEXPANSION


if not exist "%DLQUEUE%" goto:PICKDOWNLOADQUEUE

findStr /I /C:":endofqueue" "%DLQUEUE%" >nul
IF ERRORLEVEL 1 goto:PICKDOWNLOADQUEUE

copy /y "%DLQUEUE%" temp\DownloadQueues >nul


::get file name without path or extension
echo "%DLQUEUE%">temp\temp.txt
support\sfk filter -spat "temp\temp.txt" -lsrep _\x22__ -lerep _\x22__ -write -yes>nul



support\sfk filter -quiet temp\temp.txt -rep _*\__ -rep _.bat*__ -write -yes
set /p DLQUEUE= <temp\temp.txt


if not exist "%DRIVE%" mkdir "%DRIVE%"

set "classicCMD=L %DLQUEUE%"

goto:StartModMiiClassic



::..................................................OPTIONS.................................................. 
.......
:OPTIONS
Set Options=
::set cheatoption=
set waoutnum=
set waoutput=

set watext=              Select an Option to review or change:~~               All Settings will be saved automatically~                           when you click "Back"~~              Or click "Cancel" to discard changes~~More options and info available in ModMii Classic Mode


if /i "%AudioOption%" EQU "on" set wainput= SD Card ^&Drive\Path; ^&USB HDD Drive\Path; ^&PC Programs Save Location: %PCSAVE%; ^&Other Miscellaneous Options; ^&SNEEK Options; Check for ModMii Updates ^&Now; Disable sound at ^&Finish (Currently Enabled); Change ModMii Skin ^&Theme; ^&Restore Default Settings

if /i "%AudioOption%" NEQ "on" set wainput= SD Card ^&Drive\Path; ^&USB HDD Drive\Path; ^&PC Programs Save Location: %PCSAVE%; ^&Other Miscellaneous Options; ^&SNEEK Options; Check for ModMii Updates ^&Now; Enable sound at ^&Finish (Currently Disabled); Change ModMii Skin ^&Theme; ^&Restore Default Settings

start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:SaveSettings


call "%wabat%"

if "%waoutnum%"=="" goto:OPTIONS

if /i "%waoutnum%" EQU "0" goto:DriveChange
if /i "%waoutnum%" EQU "1" goto:DriveUChange
if /i "%waoutnum%" EQU "2" goto:PCSAVE
if /i "%waoutnum%" EQU "3" goto:OtherOptions
if /i "%waoutnum%" EQU "4" goto:SNEEKOptions
if /i "%waoutnum%" EQU "5" goto:UpdateModMii
if /i "%waoutnum%" EQU "7" goto:ThemeSelector
if /i "%waoutnum%" EQU "8" goto:RestoreSettings

::if /i "%waoutnum%" NEQ "6" goto:OPTIONS
if /i "%AudioOption%" EQU "on" (set AudioOption=off) else (set AudioOption=on)
goto:OPTIONS







::--------------------Theme Selector---------------------
:ThemeSelector

if exist temp\skins.txt del temp\skins.txt>nul
set watext=~~~Checking for themes hosted online...
start support\wizapp PB OPEN

::get all list
start /min /wait support\wget --no-check-certificate -N "https://github.com/modmii/modmii.github.io/tree/master/temp/Skins" -O temp\skins.txt

start support\wizapp PB UPDATE 20

support\sfk filter -spat "temp\skins.txt" ++".zip" -!"Default.zip" -rep _".zip*"__ -rep _*\x22__ -write -yes>nul

start support\wizapp PB UPDATE 40
start support\wizapp PB UPDATE 60


::get local list
dir "Support\Skins" >temp\list.txt
support\sfk filter "temp\list.txt" ++"<DIR>" -le!"." -rep _*" "__ -write -yes>nul

copy /y "temp\list.txt"+"temp\skins.txt" "temp\list.txt">nul
support\sfk filter -spat "temp\list.txt" -lsrep _.__ -write -yes>nul
support\sfk filter -spat "temp\list.txt" -unique -no-empty-lines -no-blank-lines -write -yes>nul

start support\wizapp PB UPDATE 80
start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE

:ThemeSelector2
Set SelectedSkin=
set waoutnum=
set waoutput=
set wainput=
set wafile=temp\list.txt

Set watext=~~  Select the ModMii Skin Theme you would like to use:~~Learn how to create and share your own unique themes at http://tiny.cc/modmiitheme

start /w support\wizapp LB SINGLE

if errorlevel 2 goto:MENU
if errorlevel 1 goto:OPTIONS

::remove featured\hosted tags before retrieving selection
::support\sfk filter "%wabat%" -rep _" (hosted online)"__ -rep _" - Featured"__ -write -yes>nul

call "%wabat%"
if "%waoutput%"=="" goto:ThemeSelector2

set wafile=
set "SelectedSkin=%waoutput%"
::echo SelectedSkin: %SelectedSkin%

if exist "Support\Skins\%SelectedSkin%\default.bmp" goto:localskin

::download theme

set watext=~~~Downloading %SelectedSkin% theme...
start support\wizapp PB OPEN

start support\wizapp PB UPDATE 20
if not exist "Support\Skins\%SelectedSkin%" mkdir "Support\Skins\%SelectedSkin%"
start support\wizapp PB UPDATE 40

start /min /wait support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/Skins/%SelectedSkin%.zip" -O temp\%SelectedSkin%.zip
start support\wizapp PB UPDATE 60

if exist temp\%SelectedSkin%.zip support\7za e -aoa "temp\%SelectedSkin%.zip" -o"Support\Skins\%SelectedSkin%" -r

start support\wizapp PB UPDATE 80

if exist temp\%SelectedSkin%.zip del temp\%SelectedSkin%.zip>nul

start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE

if exist "Support\Skins\%SelectedSkin%\default.bmp" goto:localskin
if /i "%AudioOption%" NEQ "off" start support\nircmd.exe mediaplay 3000 "%FAIL.mp3%"
goto:OPTIONS



:localskin
set "skin=%SelectedSkin%"

if exist "Support\Skins\%skin%\ABSTINENCE.bmp" (set "ABSTINENCE.bmp=Support\Skins\%skin%\ABSTINENCE.bmp") else (set "ABSTINENCE.bmp=Support\Skins\Default\ABSTINENCE.bmp")
if exist "Support\Skins\%skin%\CLASSIC.bmp" (set "CLASSIC.bmp=Support\Skins\%skin%\CLASSIC.bmp") else (set "CLASSIC.bmp=Support\Skins\Default\CLASSIC.bmp")
if exist "Support\Skins\%skin%\default.bmp" (set "default.bmp=Support\Skins\%skin%\default.bmp") else (set "default.bmp=Support\Skins\Default\default.bmp")
if exist "Support\Skins\%skin%\DLQUEUE.bmp" (set "DLQUEUE.bmp=Support\Skins\%skin%\DLQUEUE.bmp") else (set "DLQUEUE.bmp=Support\Skins\Default\DLQUEUE.bmp")
if exist "Support\Skins\%skin%\FAIL.bmp" (set "FAIL.bmp=Support\Skins\%skin%\FAIL.bmp") else (set "FAIL.bmp=Support\Skins\Default\FAIL.bmp")
if exist "Support\Skins\%skin%\HackMii.bmp" (set "HackMii.bmp=Support\Skins\%skin%\HackMii.bmp") else (set "HackMii.bmp=Support\Skins\Default\HackMii.bmp")
if exist "Support\Skins\%skin%\MAIN.bmp" (set "MAIN.bmp=Support\Skins\%skin%\MAIN.bmp") else (set "MAIN.bmp=Support\Skins\Default\MAIN.bmp")
if exist "Support\Skins\%skin%\ModMiiSplash.bmp" (set "ModMiiSplash.bmp=Support\Skins\%skin%\ModMiiSplash.bmp") else (set "ModMiiSplash.bmp=Support\Skins\Default\ModMiiSplash.bmp")
if exist "Support\Skins\%skin%\OPTIONS.bmp" (set "OPTIONS.bmp=Support\Skins\%skin%\OPTIONS.bmp") else (set "OPTIONS.bmp=Support\Skins\Default\OPTIONS.bmp")
if exist "Support\Skins\%skin%\RegionChange.bmp" (set "RegionChange.bmp=Support\Skins\%skin%\RegionChange.bmp") else (set "RegionChange.bmp=Support\Skins\Default\RegionChange.bmp")
if exist "Support\Skins\%skin%\SDCARD.bmp" (set "SDCARD.bmp=Support\Skins\%skin%\SDCARD.bmp") else (set "SDCARD.bmp=Support\Skins\Default\SDCARD.bmp")
if exist "Support\Skins\%skin%\SNEEK.bmp" (set "SNEEK.bmp=Support\Skins\%skin%\SNEEK.bmp") else (set "SNEEK.bmp=Support\Skins\Default\SNEEK.bmp")
if exist "Support\Skins\%skin%\SUCCESS.bmp" (set "SUCCESS.bmp=Support\Skins\%skin%\SUCCESS.bmp") else (set "SUCCESS.bmp=Support\Skins\Default\SUCCESS.bmp")
if exist "Support\Skins\%skin%\TERMS.bmp" (set "TERMS.bmp=Support\Skins\%skin%\TERMS.bmp") else (set "TERMS.bmp=Support\Skins\Default\TERMS.bmp")
if exist "Support\Skins\%skin%\UPDATECHECK.bmp" (set "UPDATECHECK.bmp=Support\Skins\%skin%\UPDATECHECK.bmp") else (set "UPDATECHECK.bmp=Support\Skins\Default\UPDATECHECK.bmp")
if exist "Support\Skins\%skin%\UPDATING.bmp" (set "UPDATING.bmp=Support\Skins\%skin%\UPDATING.bmp") else (set "UPDATING.bmp=Support\Skins\Default\UPDATING.bmp")
if exist "Support\Skins\%skin%\USB.bmp" (set "USB.bmp=Support\Skins\%skin%\USB.bmp") else (set "USB.bmp=Support\Skins\Default\USB.bmp")
if exist "Support\Skins\%skin%\USBDIR.bmp" (set "USBDIR.bmp=Support\Skins\%skin%\USBDIR.bmp") else (set "USBDIR.bmp=Support\Skins\Default\USBDIR.bmp")
if exist "Support\Skins\%skin%\WIZARD.bmp" (set "WIZARD.bmp=Support\Skins\%skin%\WIZARD.bmp") else (set "WIZARD.bmp=Support\Skins\Default\WIZARD.bmp")
if exist "Support\Skins\%skin%\skin.ico" (set "skin.ico=Support\Skins\%skin%\skin.ico") else (set "skin.ico=Support\Skins\Default\skin.ico")
if exist "Support\Skins\%skin%\Success.mp3" (set "Success.mp3=Support\Skins\%skin%\Success.mp3") else (set "Success.mp3=Support\Skins\Default\Success.mp3")
if exist "Support\Skins\%skin%\Fail.mp3" (set "Fail.mp3=Support\Skins\%skin%\Fail.mp3") else (set "Fail.mp3=Support\Skins\Default\Fail.mp3")

set "wabmp=%OPTIONS.bmp%"
set "waico=%skin.ico%"

support\sfk filter Support\settings.bat -!"Set skin=" -write -yes>nul
echo set skin=%skin%>> Support\settings.bat
goto:OPTIONS



::--------------------Restore Default Settings---------------------
:RestoreSettings
set ROOTSAVE=off
set effect=No-Spin
set PCSAVE=Auto
set OPTION1=off
set AudioOption=on
set CMIOSOPTION=off
set hermesOPTION=off
set FWDOPTION=on
set ExtraProtectionOPTION=on
set "DRIVE=%cd%\COPY_TO_SD"

set "DRIVEU=%cd%\COPY_TO_USB"

set ACTIVEIOS=on
set AUSKIP=off
set AUTOUPDATE=on
Set ModMiiverbose=off
Set SSD=off
Set sneekverbose=off
Set neek2o=on
Set SNKFONT=B
set redtext=Red
set bluetext=Blue
set yellowtext=Yellow
set greentext=Green
set magentatext=Magenta
set cyantext=Cyan
set backgroundcolor=1
set whitetext=f
set GuideOnly=off
set skin=Default
set "ABSTINENCE.bmp=Support\Skins\Default\ABSTINENCE.bmp"
set "CLASSIC.bmp=Support\Skins\Default\CLASSIC.bmp"
set "default.bmp=Support\Skins\Default\default.bmp"
set "DLQUEUE.bmp=Support\Skins\Default\DLQUEUE.bmp"
set "FAIL.bmp=Support\Skins\Default\FAIL.bmp"
set "HackMii.bmp=Support\Skins\Default\HackMii.bmp"
set "MAIN.bmp=Support\Skins\Default\MAIN.bmp"
set "ModMiiSplash.bmp=Support\Skins\Default\ModMiiSplash.bmp"
set "OPTIONS.bmp=Support\Skins\Default\OPTIONS.bmp"
set "RegionChange.bmp=Support\Skins\Default\RegionChange.bmp"
set "SDCARD.bmp=Support\Skins\Default\SDCARD.bmp"
set "SNEEK.bmp=Support\Skins\Default\SNEEK.bmp"
set "SUCCESS.bmp=Support\Skins\Default\SUCCESS.bmp"
set "TERMS.bmp=Support\Skins\Default\TERMS.bmp"
set "UPDATECHECK.bmp=Support\Skins\Default\UPDATECHECK.bmp"
set "UPDATING.bmp=Support\Skins\Default\UPDATING.bmp"
set "USB.bmp=Support\Skins\Default\USB.bmp"
set "USBDIR.bmp=Support\Skins\Default\USBDIR.bmp"
set "WIZARD.bmp=Support\Skins\Default\WIZARD.bmp"
set "skin.ico=Support\Skins\Default\skin.ico"
set "Success.mp3=Support\Skins\Default\Success.mp3"
set "Fail.mp3=Support\Skins\Default\Fail.mp3"

set "wabmp=%OPTIONS.bmp%"
set "waico=%skin.ico%"
goto:OPTIONS


::--------------------Save Settings---------------------
:SaveSettings

echo ::ModMii Settings > Support\settings.bat
echo ::ModMiiv%currentversion%>> Support\settings.bat
echo Set ROOTSAVE=%ROOTSAVE%>> Support\settings.bat
echo Set effect=%effect%>> Support\settings.bat
echo Set PCSAVE=%PCSAVE%>> Support\settings.bat
echo Set Option1=%Option1%>> Support\settings.bat
echo Set AudioOption=%AudioOption%>> Support\settings.bat
echo Set hermesOPTION=%hermesOPTION%>> Support\settings.bat
echo Set CMIOSOPTION=%CMIOSOPTION%>> Support\settings.bat
echo Set FWDOPTION=%FWDOPTION%>> Support\settings.bat
echo Set ExtraProtectionOPTION=%ExtraProtectionOPTION%>> Support\settings.bat
echo Set "Drive=%DRIVE%">> Support\settings.bat
echo Set "DriveU=%DRIVEU%">> Support\settings.bat
echo Set ACTIVEIOS=%ACTIVEIOS%>> Support\settings.bat
echo Set AUSKIP=%AUSKIP%>> Support\settings.bat
echo Set AUTOUPDATE=%AUTOUPDATE%>> Support\settings.bat
echo Set ModMiiverbose=%ModMiiverbose%>> Support\settings.bat
echo Set SSD=%SSD%>> Support\settings.bat
echo Set sneekverbose=%sneekverbose%>> Support\settings.bat
echo Set neek2o=%neek2o%>> Support\settings.bat
echo Set SNKFONT=%SNKFONT%>> Support\settings.bat
echo set AGREEDVERSION=%currentversion%>> Support\settings.bat
echo set skin=%skin%>> Support\settings.bat
if /i "%redtext%" NEQ "Red" set "redtext=%redtext%">> Support\settings.bat
if /i "%bluetext%" NEQ "Blue" set "bluetext=%bluetext%">> Support\settings.bat
if /i "%yellowtext%" NEQ "Yellow" set "yellowtext=%yellowtext%">> Support\settings.bat
if /i "%Greentext%" NEQ "Green" set "greentext=%greentext%">> Support\settings.bat
if /i "%Magentatext%" NEQ "Magenta" set "magentatext=%magentatext%">> Support\settings.bat
if /i "%cyantext%" NEQ "Cyan" set "cyantext=%cyantext%">> Support\settings.bat
if /i "%backgroundcolor%" NEQ "1" set "backgroundcolor=%backgroundcolor%">> Support\settings.bat
if /i "%whitetext%" NEQ "f" set "whitetext=%whitetext%">> Support\settings.bat
echo set GuideOnly=%GuideOnly%>> Support\settings.bat

::show\hide ModMiiSkinCMD
if /i "%ModMiiverbose%" EQU "on" support\nircmd.exe win activate ititle "ModMiiSkinCMD"
if /i "%ModMiiverbose%" EQU "on" support\nircmd.exe win trans ititle "ModMiiSkinCMD" 255

if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win trans ititle "ModMiiSkinCMD" 0
if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

if /i "%waoutnum%" EQU "7" goto:Options
goto:MENU

::..................................................PC SAVE.................................................. 
.......
:PCSAVE
::Set PCSAVE=
set waoutnum=
set waoutput=

set watext=~~                       PC Programs Save Location~~If Auto is selected PC programs saved locally to %homedrive% with shortcuts if running ModMii from %homedrive% and PC programs saved portably if not running ModMii from %homedrive%

set wainput= ^&Auto; ^&Local; ^&Portable


::check current setting
if /i "%PCSAVE%" EQU "Auto" set waoutnum=0
if /i "%PCSAVE%" EQU "Local" set waoutnum=1
if /i "%PCSAVE%" EQU "Portable" set waoutnum=2

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
::if errorlevel 1 goto:OPTIONS


call "%wabat%"

if "%waoutnum%"=="" goto:PCSAVE

if /i "%waoutnum%" EQU "0" set PCSAVE=Auto
if /i "%waoutnum%" EQU "1" set PCSAVE=Local
if /i "%waoutnum%" EQU "2" set PCSAVE=Portable

goto:Options




::..................................................OtherOptions.................................................. 
.......
:OtherOptions
set waoutnum=
set waoutput=

set watext=~~~~                   Other Miscellaneous Options

set wainput= ^&Auto-Update ModMii at program start; c^&MIOS included in recommended cIOSs; USB-Loader ^&Forwarder included in Wizard; ^&Update Active IOSs in Wizard/SysCheck-Updater; ^&Verbose for ModMii Skin and nandBinCheck; ^&Hermes cIOSs will also be recommended; ^&Extra Brick Protection in ModMii Wizard Guides; Save 0000000^&1 folder for IOSs\SMs\etc; Save ^&NUS\00000001x folder for IOSs\SMs\etc; ^&Generate Guide Only (only for functions with guides)


::check correct boxes
set waoutput=
if /i "%AUTOUPDATE%" EQU "on" set waoutput=%waoutput%; #Auto-Update ModMii at program start
if /i "%CMIOSOPTION%" EQU "on" set waoutput=%waoutput%; c#MIOS included in recommended cIOSs
if /i "%FWDOPTION%" EQU "on" set waoutput=%waoutput%; USB-Loader #Forwarder included in Wizard
if /i "%ACTIVEIOS%" EQU "on" set waoutput=%waoutput%; #Update Active IOSs in Wizard\SysCheck-Updater
if /i "%ModMiiverbose%" EQU "on" set waoutput=%waoutput%; #Verbose for ModMii Skin and nandBinCheck
if /i "%hermesOPTION%" EQU "on" set waoutput=%waoutput%; #Hermes cIOSs will also be recommended
if /i "%ExtraProtectionOPTION%" EQU "on" set waoutput=%waoutput%; #Extra Brick Protection in ModMii Wizard Guides

if /i "%Option1%" EQU "on" set waoutput=%waoutput%; Save 0000000#1 folder for IOSs\SMs\etc
if /i "%Option1%" EQU "all" set waoutput=%waoutput%; Save 0000000#1 folder for IOSs\SMs\etc

if /i "%Option1%" EQU "nus" set waoutput=%waoutput%; Save #NUS\00000001x folder for IOSs\SMs\etc
if /i "%Option1%" EQU "all" set waoutput=%waoutput%; Save #NUS\00000001x folder for IOSs\SMs\etc

if /i "%GuideOnly%" EQU "on" set waoutput=%waoutput%; #Generate Guide Only (only for functions with guides)

echo set waoutput=%waoutput%>temp\temp.bat
support\sfk filter -quiet temp\temp.bat -rep _"#"_"^&"_ -write -yes
call temp\temp.bat



::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp CL

if errorlevel 2 goto:MENU
::if errorlevel 1 goto:OPTIONS


call "%wabat%"


::if "%waoutnum%"=="" goto:skipcheck

echo %waoutnum% >"%wabat%"

findStr /I /C:"0" "%wabat%" >nul
IF not ERRORLEVEL 1 (set AutoUpdate=on) else (set AutoUpdate=off)

findStr /I /C:"1" "%wabat%" >nul
IF not ERRORLEVEL 1 (set CMIOSOPTION=on) else (set CMIOSOPTION=off)

findStr /I /C:"2" "%wabat%" >nul
IF not ERRORLEVEL 1 (set FWDOPTION=on) else (set FWDOPTION=off)

findStr /I /C:"3" "%wabat%" >nul
IF not ERRORLEVEL 1 (set ACTIVEIOS=on) else (set ACTIVEIOS=off)



set "ModMiiverboseOld=%ModMiiverbose%"
findStr /I /C:"4" "%wabat%" >nul
IF not ERRORLEVEL 1 (set ModMiiverbose=on) else (set ModMiiverbose=off)

if /i "%ModMiiverbose%" EQU "%ModMiiverboseOld%" goto:skip
if /i "%ModMiiverbose%" EQU "off" goto:hide
::for skin mode, force screen to be visible
support\nircmd.exe win activate ititle "ModMiiSkinCMD"
support\nircmd.exe win trans ititle "ModMiiSkinCMD" 255
goto:skip
:hide
::make cmd window transparent and hidden
support\nircmd.exe win trans ititle "ModMiiSkinCMD" 0
support\nircmd.exe win hide ititle "ModMiiSkinCMD"
:skip



findStr /I /C:"5" "%wabat%" >nul
IF not ERRORLEVEL 1 (set hermesOPTION=on) else (set hermesOPTION=off)

findStr /I /C:"6" "%wabat%" >nul
IF not ERRORLEVEL 1 (set ExtraProtectionOPTION=on) else (set ExtraProtectionOPTION=off)

findStr /I /C:"9" "%wabat%" >nul
IF not ERRORLEVEL 1 (set GuideOnly=on) else (set GuideOnly=off)


::turn 2 options into 1
findStr /I /C:"7" "%wabat%" >nul
IF not ERRORLEVEL 1 (set Option1=on) else (set Option1=off)

findStr /I /C:"8" "%wabat%" >nul
IF not ERRORLEVEL 1 (set Option1temp=nus) else (set Option1temp=)

if /i "%Option1%" NEQ "on" goto:skip
if /i "%Option1temp%" EQU "nus" (set Option1=all) else (set Option1=on)
goto:skipcheck
:skip
if /i "%Option1temp%" EQU "nus" (set Option1=nus) else (set Option1=off)

:skipcheck

goto:Options







::..................................................SNEEKOptions.................................................. 
.......
:SNEEKOptions
set waoutnum=
set waoutput=

set watext=~~~~                             SNEEK Options

set wainput= Build ^&neek2o instead of the original NEEK; ^&SD card access enabled for SNEEK\SNEEK+DI; SNEEK ^&Verbose Output; ^&Black Font on White (instead of Reverse\Default); ^&Red Font on Black (instead of Black\White)


::check correct boxes
set waoutput=
if /i "%neek2o%" EQU "on" set waoutput=%waoutput%; Build #neek2o instead of the original NEEK
if /i "%SSD%" EQU "on" set waoutput=%waoutput%; #SD card access enabled for SNEEK\SNEEK+DI
if /i "%sneekverbose%" EQU "on" set waoutput=%waoutput%; SNEEK #Verbose Output
if /i "%SNKFONT%" EQU "W" set waoutput=%waoutput%; #Black Font on White (instead of Reverse\Default)
if /i "%SNKFONT%" EQU "R" set waoutput=%waoutput%; #Red Font on Black (instead of Black\White)

echo set waoutput=%waoutput%>temp\temp.bat
support\sfk filter -quiet temp\temp.bat -rep _"#"_"^&"_ -write -yes
call temp\temp.bat



::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp CL

if errorlevel 2 goto:MENU
::if errorlevel 1 goto:OPTIONS


call "%wabat%"


echo %waoutnum% >"%wabat%"

findStr /I /C:"0" "%wabat%" >nul
IF not ERRORLEVEL 1 (set neek2o=on) else (set neek2o=off)

findStr /I /C:"1" "%wabat%" >nul
IF not ERRORLEVEL 1 (set SSD=on) else (set SSD=off)

findStr /I /C:"2" "%wabat%" >nul
IF not ERRORLEVEL 1 (set sneekverbose=on) else (set sneekverbose=off)


set SNKFONT=B
findStr /I /C:"3" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKFONT=W

findStr /I /C:"4" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKFONT=R

goto:Options


::...................................Wizard Page1 - Virgin?...............................
:WPAGE1
set waoutnum=
set waoutput=
set VIRGIN=
set Advanced=
set HMInstaller=
set RECCIOS=
set yawmQ=
set PRIQ=
set ThemeSelection=N
set IOS236InstallerQ=

::recall checked items
if not "%VIRGINMarked%"=="" set waoutnum=%VIRGINMarked%


set watext=        Is this your first time softmodding your Wii?~                                       -or-~  Would you like to update ALL your existing softmods~                        (aka re-hack your Wii)?~Note: Only answer No if you know specifically what you want to update. Alternatively, you can check if there are any recommended changes to the mods already on your Wii using ModMii Classic's SysCheck Updater Wizard.

set wainput= ^&Yes; ^&No

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:MENU


call "%wabat%"

set VIRGINMarked=%waoutnum%

if /i "%waoutnum%" EQU "0" set Virgin=Y
if /i "%waoutnum%" EQU "1" set Virgin=N

if /i "%VIRGIN%" EQU "Y" goto:WPAGE2
if /i "%VIRGIN%" EQU "N" goto:WPAGE2
if "%Virgin%"=="" goto:WPAGE1



::...................................Wizard Page2 - Current System Menu...............................
:WPAGE2
set FIRMSTART=
set waoutnum=
set waoutput=

::recall checked items
if not "%FIRMSTARTMarked%"=="" set waoutnum=%FIRMSTARTMarked%

if /i "%AbstinenceWiz%" NEQ "Y" set watext=~~         What is your current System Menu version?~~Note: to check this, turn on your Wii, click the Wii button in the bottom left of the main system menu, click Wii Settings, then you should see the System Menu in the top right of the screen (ie. 4.2U, 4.1J, 3.2E, etc.)

if /i "%AbstinenceWiz%" EQU "Y" set watext=         What is your current System Menu version?~~Note: to check this, turn on your Wii, click the Wii button in the bottom left of the main system menu, click Wii Settings, then you should see the System Menu in the top right of the screen (ie. 4.2U, 4.1J, 3.2E, etc.)~~Note: SD CARD is REQUIRED for Abstinence Wizard!



set wainput= 4.^&3; 4.^&2; 4.^&1; 4.^&0; 3.^&x (3.0 - 3.5); ^&Other (^<2.2); ^&Instructional video to check System Menu Version

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if not errorlevel 1 goto:notback
if /i "%AbstinenceWiz%" EQU "Y" goto:MENU
if /i "%MENU1%" EQU "H" goto:MENU
goto:WPAGE1
:notback

call "%wabat%"

set FIRMSTARTMarked=%waoutnum%

if /i "%AbstinenceWiz%" NEQ "Y" goto:NotAbstinenceWiz
if /i "%waoutnum%" EQU "0" (set FIRMSTART=4.3) & (goto:WPAGE3)
if /i "%waoutnum%" EQU "1" (set FIRMSTART=4.2) & (goto:NEEKrevSelect)
if /i "%waoutnum%" EQU "2" (set FIRMSTART=4.1) & (goto:NEEKrevSelect)
if /i "%waoutnum%" EQU "3" (set FIRMSTART=4.0) & (goto:NEEKrevSelect)
if /i "%waoutnum%" EQU "4" (set FIRMSTART=3.X) & (goto:NEEKrevSelect)
if /i "%waoutnum%" EQU "5" (set FIRMSTART=O) & (goto:WPAGE3)
:NotAbstinenceWiz

if /i "%waoutnum%" EQU "0" (set FIRMSTART=4.3) & (goto:WPAGE3)
if /i "%waoutnum%" EQU "1" (set FIRMSTART=4.2) & (goto:WPAGE3)
if /i "%waoutnum%" EQU "2" (set FIRMSTART=4.1) & (goto:WPAGE3)
if /i "%waoutnum%" EQU "3" (set FIRMSTART=4.0) & (goto:WPAGE3)
if /i "%waoutnum%" EQU "4" (set FIRMSTART=3.X) & (goto:WPAGE3)
if /i "%waoutnum%" EQU "5" (set FIRMSTART=O) & (goto:WPAGE3)
if /i "%waoutnum%" EQU "6" set FIRMSTART=HELP

if /i "%FIRMSTART%" NEQ "Help" goto:nohelp
start https://www.youtube.com/embed/1Z2MtFcllTY
goto:WPAGE2
:nohelp

if "%FIRMSTART%"=="" goto:WPAGE2



::...................................Wizard Page3 - REGION...............................
:WPAGE3

if /i "%FIRMSTART%" EQU "4.3" goto:WPAGE3hard
if /i "%FIRMSTART%" EQU "o" goto:WPAGE3hard
if /i "%MENU1%" EQU "H" (set BACKB4DRIVE=WPAGE2) & (goto:DRIVECHANGE)
:WPAGE3hard

set REGION=
set waoutnum=
set waoutput=

::recall checked items
if not "%REGIONMarked%"=="" set waoutnum=%REGIONMarked%


set watext=~~                What is your System Menu Region?~~Note: to check this, turn on your Wii, click the Wii button in the bottom left of the main system menu, click Wii Settings, then you should see the System Menu in the top right of the screen (ie. 4.2U, 4.1J, 3.2E, etc.)


if /i "%MENU1%" EQU "RC" set watext=~~~~          What Region would you like to change to?



set wainput= ^&U (USA); ^&E (Euro\PAL); ^&J (JPN); ^&K (Korean); ^&Instructional video to check System Menu Region

if /i "%MENU1%" EQU "RC" set wainput= ^&U (USA); ^&E (Euro\PAL); ^&J (JPN); ^&K (Korean)


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU

if not errorlevel 1 goto:notback
if /i "%MENU1%" EQU "RC" (goto:RCPAGE1) else (goto:WPAGE2)
:notback

call "%wabat%"

set REGIONMarked=%waoutnum%

if /i "%waoutnum%" EQU "0" set REGION=U
if /i "%waoutnum%" EQU "1" set REGION=E
if /i "%waoutnum%" EQU "2" set REGION=J
if /i "%waoutnum%" EQU "3" set REGION=K

if /i "%waoutnum%" EQU "4" set REGION=HELP

if "%REGION%"=="" goto:WPAGE3

if /i "%MENU1%" NEQ "RC" goto:notRC
if /i "%REGION%" EQU "U" goto:WPAGE4
if /i "%REGION%" EQU "E" goto:WPAGE4
if /i "%REGION%" EQU "K" goto:WPAGE4
if /i "%REGION%" EQU "J" goto:WPAGE4
:notRC


if /i "%REGION%" EQU "U" goto:WPAGE3C
if /i "%REGION%" EQU "E" goto:WPAGE3C
if /i "%REGION%" EQU "K" goto:WPAGE3C
if /i "%REGION%" EQU "J" goto:WPAGE3C

if /i "%REGION%" NEQ "Help" goto:nohelp
start https://www.youtube.com/embed/1Z2MtFcllTY
goto:WPAGE3
:nohelp




::...................................Wizard Page3C - Exploit...............................
:WPAGE3C
set waoutnum=
set waoutput=
SET EXPLOIT=default
set exploitselection=
if /i "%VIRGIN%" EQU "N" goto:WPAGE4


if /i "%FIRMSTART%" EQU "4.3" goto:WPAGE3Cnext
if /i "%FIRMSTART%" EQU "o" goto:WPAGE3Cnext
goto:WPAGE4
:WPAGE3Cnext


::recall checked items
if not "%EXPLOITMarked%"=="" set waoutnum=%EXPLOITMarked%


::set backb4HACKMIISOLUTION=WPAGE3c


set exploitselection=yes


set watext=~~~~Select the exploit you would like to use to mod your Wii.

set wainput=

if /i "%FIRMSTART%" EQU "4.3" goto:list4.3
if /i "%REGION%" EQU "K" set wainput= ^&str2hax (no disc or SD needed, requires WiFi on Wii); ^&Twilight Princess: The Legend of Zelda; ^&Super Smash Brothers Brawl; ^&All Above Exploits (decide later)
if /i "%REGION%" NEQ "K" set wainput= ^&str2hax (no disc or SD needed, requires WiFi on Wii); ^&Twilight Princess: The Legend of Zelda; ^&Super Smash Brothers Brawl; LEGO ^&Indiana Jones; LEGO ^&Batman; LEGO Star ^&Wars; ^&Yu-Gi-Oh! 5D's; Tales of Symphonia: ^&Dawn of the New World; ^&All Above Exploits (decide later)
goto:skip4.3

:list4.3
if /i "%REGION%" EQU "K" set wainput= ^&str2hax (no disc or SD needed, requires WiFi on Wii); ^&Wilbrand (no disc needed, but requires SD card); ^&Super Smash Brothers Brawl; ^&All Above Exploits (decide later)
if /i "%REGION%" NEQ "K" set wainput= ^&str2hax (no disc or SD needed, requires WiFi on Wii); ^&Wilbrand (no disc needed, but requires SD card); ^&Super Smash Brothers Brawl; LEGO ^&Indiana Jones; LEGO ^&Batman; LEGO Star ^&Wars; ^&Yu-Gi-Oh! 5D's; ^&Tales of Symphonia: Dawn of the New World; ^&All Above Exploits (decide later)
:skip4.3

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:WPAGE3


call "%wabat%"

set EXPLOITMarked=%waoutnum%

if "%waoutnum%"=="" goto:WPAGE3c


if /i "%FIRMSTART%" EQU "4.3" goto:list4.3

if /i "%REGION%" NEQ "K" goto:notKOR
::set wainput= ^&Twilight Princess: The Legend of Zelda; ^&Super Smash Brothers Brawl; ^&All Above Exploits
if /i "%waoutnum%" EQU "0" set EXPLOIT=X
if /i "%waoutnum%" EQU "1" set EXPLOIT=T
if /i "%waoutnum%" EQU "2" set EXPLOIT=S
if /i "%waoutnum%" EQU "3" set EXPLOIT=?
goto:gotexploit


:notKOR
::set wainput= ^&Twilight Princess: The Legend of Zelda; ^&Super Smash Brothers Brawl; ^&LEGO Indiana Jones; ^&LEGO Batman; ^&LEGO Star Wars; ^&Yu-Gi-Oh! 5D's; ^&Tales of Symphonia: Dawn of the New World; ^&All Above Exploits
if /i "%waoutnum%" EQU "0" set EXPLOIT=X
if /i "%waoutnum%" EQU "1" set EXPLOIT=T
if /i "%waoutnum%" EQU "2" set EXPLOIT=S
if /i "%waoutnum%" EQU "3" set EXPLOIT=L
if /i "%waoutnum%" EQU "4" set EXPLOIT=LB
if /i "%waoutnum%" EQU "5" set EXPLOIT=LS
if /i "%waoutnum%" EQU "6" set EXPLOIT=Y
if /i "%waoutnum%" EQU "7" set EXPLOIT=TOS
if /i "%waoutnum%" EQU "8" set EXPLOIT=?
goto:gotexploit


:list4.3
if /i "%REGION%" NEQ "K" goto:KOR4.3
::set wainput= ^&Wilbrand (Discless); ^&Super Smash Brothers Brawl
if /i "%waoutnum%" EQU "0" set EXPLOIT=X
if /i "%waoutnum%" EQU "1" set EXPLOIT=W
if /i "%waoutnum%" EQU "2" set EXPLOIT=S
if /i "%waoutnum%" EQU "3" set EXPLOIT=?
goto:gotexploit


:KOR4.3
if /i "%waoutnum%" EQU "0" set EXPLOIT=X
if /i "%waoutnum%" EQU "1" set EXPLOIT=W
if /i "%waoutnum%" EQU "2" set EXPLOIT=S
if /i "%waoutnum%" EQU "3" set EXPLOIT=L
if /i "%waoutnum%" EQU "4" set EXPLOIT=LB
if /i "%waoutnum%" EQU "5" set EXPLOIT=LS
if /i "%waoutnum%" EQU "6" set EXPLOIT=Y
if /i "%waoutnum%" EQU "7" set EXPLOIT=TOS
if /i "%waoutnum%" EQU "8" set EXPLOIT=?
goto:gotexploit


:gotexploit



if /i "%FIRMSTART%" NEQ "4.3" goto:skip
if /i "%EXPLOIT%" EQU "W" (set beforemacaddy=WPAGE3C) & (goto:macaddress)
if /i "%EXPLOIT%" EQU "?" (set beforemacaddy=WPAGE3C) & (goto:macaddress)
:skip

::PICK UP HERE, also check 4.3K
if /i "%MENU1%" EQU "H" (set BACKB4DRIVE=WPAGE3C) & (goto:DRIVECHANGE)
if /i "%AbstinenceWiz%" EQU "Y" goto:NEEKrevSelect
goto:WPAGE4



::----------------------------------------MAC ADDRESS---------------------------------
:macaddress

set waoutnum=
set waoutput=

if not "%macaddress%"=="" set waoutput=%macaddress%

set watext=                     Enter your Wii's MAC address~~Examples:    AABBCCDDEEFF     ,   11-22-33-44-55-66~To find your MAC address, click the Wii button in the bottom left of the main system menu, then click Wii Settings, then Internet, then Console Information (enter "Help" for an instructional video).~Or enter "S" to skip this for now and enter it later.

start /w support\wizapp EB


if errorlevel 2 goto:MENU
if errorlevel 1 goto:%beforemacaddy%

call "%wabat%"


if "%waoutput%"=="" goto:macaddress


if /i "%waoutput%" NEQ "Help" goto:nohelp
start https://www.youtube.com/embed/V52piPXM1tE
goto:macaddress
:nohelp


if /i "%waoutput%" EQU "S" goto:quickskip


echo %waoutput% >temp\temp.txt

support\sfk filter "temp\temp.txt" -rep _" "__ -rep _"-"__ -rep _":"__ -write -yes>nul

set /p waoutput= <temp\temp.txt

::confirm 12 digits
if "%waoutput:~11%"=="" goto:macaddress
if not "%waoutput:~12%"=="" goto:macaddress


::confirm MAC addy is hex chars

echo.
echo Validating MAC address...
echo.

set digit=0

:confirmMACaddy

set /a digit=%digit%+1
set testme=
if /i "%digit%" EQU "1" set testme=%waoutput:~0,1%
if /i "%digit%" EQU "2" set testme=%waoutput:~1,1%
if /i "%digit%" EQU "3" set testme=%waoutput:~2,1%
if /i "%digit%" EQU "4" set testme=%waoutput:~3,1%
if /i "%digit%" EQU "5" set testme=%waoutput:~4,1%
if /i "%digit%" EQU "6" set testme=%waoutput:~5,1%
if /i "%digit%" EQU "7" set testme=%waoutput:~6,1%
if /i "%digit%" EQU "8" set testme=%waoutput:~7,1%
if /i "%digit%" EQU "9" set testme=%waoutput:~8,1%
if /i "%digit%" EQU "10" set testme=%waoutput:~9,1%
if /i "%digit%" EQU "11" set testme=%waoutput:~10,1%
if /i "%digit%" EQU "12" set testme=%waoutput:~11,1%

if "%testme%"=="" goto:quickskip

if /i "%testme%" EQU "0" goto:confirmMACaddy
if /i "%testme%" EQU "1" goto:confirmMACaddy
if /i "%testme%" EQU "2" goto:confirmMACaddy
if /i "%testme%" EQU "3" goto:confirmMACaddy
if /i "%testme%" EQU "4" goto:confirmMACaddy
if /i "%testme%" EQU "5" goto:confirmMACaddy
if /i "%testme%" EQU "6" goto:confirmMACaddy
if /i "%testme%" EQU "7" goto:confirmMACaddy
if /i "%testme%" EQU "8" goto:confirmMACaddy
if /i "%testme%" EQU "9" goto:confirmMACaddy
if /i "%testme%" EQU "a" goto:confirmMACaddy
if /i "%testme%" EQU "b" goto:confirmMACaddy
if /i "%testme%" EQU "c" goto:confirmMACaddy
if /i "%testme%" EQU "d" goto:confirmMACaddy
if /i "%testme%" EQU "e" goto:confirmMACaddy
if /i "%testme%" EQU "f" goto:confirmMACaddy

goto:macaddress
:quickskip

set macaddress=%waoutput%
::echo %macaddress%


if /i "%MENU1%" EQU "H" (set BACKB4DRIVE=macaddress) & (goto:DRIVECHANGE)

if /i "%AbstinenceWiz%" EQU "Y" goto:NEEKrevSelect

goto:WPAGE4




::...................................Wizard Page3D - Active IOSs...............................
::change WPAGE3D with WPAGE4




::...................................Wizard Page4 - New System Menu...............................
:WPAGE4

set FIRM=
set waoutnum=
set waoutput=

set watext=            Select your desired System Menu.~~* ModMii recommends against unnecessarily changing system menus if already on 4.1 or higher.~* System Menu 4.2 and 4.3 add nothing except failed attempts to prevent homebrew.~* Even RiiConnect24 fully works on lower firmwares using ModMii's System Menu IOSs.


set wainput= 4.^&3 (Recommended); 4.^&2; 4.^&1
::set default
set waoutnum=0

if /i "%MENU1%" EQU "RC" goto:miniskip

if /i "%FIRMSTART%" EQU "4.1" set wainput= 4.^&3; 4.^&2; 4.^&1 (Recommended)
if /i "%FIRMSTART%" EQU "4.1" set waoutnum=2

if /i "%FIRMSTART%" EQU "4.2" set wainput= 4.^&3; 4.^&2 (Recommended); 4.^&1
if /i "%FIRMSTART%" EQU "4.2" set waoutnum=1
:miniskip


::recall checked items
if not "%FIRMMarked%"=="" set waoutnum=%FIRMMarked%


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU

if not errorlevel 1 goto:notback
if /i "%MENU1%" EQU "RC" goto:WPAGE3
if /i "%VIRGIN%" EQU "N" goto:WPAGE3
if /i "%FIRMSTART%" EQU "o" goto:wpage3c
if /i "%EXPLOIT%" EQU "?" goto:macaddress
if /i "%EXPLOIT%" EQU "W" goto:macaddress
if /i "%FIRMSTART%" EQU "4.3" goto:wpage3c
goto:wpage3
:notback


call "%wabat%"

set FIRMMarked=%waoutnum%

if /i "%waoutnum%" EQU "0" set FIRM=4.3
if /i "%waoutnum%" EQU "1" set FIRM=4.2
if /i "%waoutnum%" EQU "2" set FIRM=4.1

if "%FIRM%"=="" goto:WPAGE4

if /i "%MENU1%" EQU "RC" (goto:WPAGE20) else (goto:WPAGE5)



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

set waoutnum=
set waoutput=

::recall checked items
if not "%ChannelsMarked%"=="" set waoutnum=%ChannelsMarked%


set watext=               Select which of the following channels~                          you would like to install~~Note: since Nintendo has shut down WiiConnect24 other channels like News, Wii Speak, etc. require RiiConnect24. These can be installed later using the RiiConnect24 Patcher from ModMii Classic's Download Page 2 or https://rc24.xyz


::set wainput= ^&Photo; ^&Mii; ^&Shop (with IOS56); ^&Internet; ^&Weather^^; ^&News^^; ^&Wii Speak^^^^
set wainput= ^&Photo; ^&Mii; ^&Shop (with IOS56); ^&Internet

if /i "%MENU1%" EQU "S" (set REGIONTEMP=%SNKREGION%) else (set REGIONTEMP=%REGION%)

if /i "%REGIONTEMP%" EQU "K" set wainput= ^&Photo; ^&Mii; ^&Shop (with IOS56)

if /i "%MENU1%" NEQ "S" goto:notS
::set wainput= ^&Photo; ^&Mii; ^&Shop; ^&Internet; ^&Weather^^; ^&News^^; ^&Wii Speak^^^^
set wainput= ^&Photo; ^&Mii; ^&Shop; ^&Internet
if /i "%REGIONTEMP%" EQU "K" set wainput= ^&Photo; ^&Mii; ^&Shop
:notS

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp CL

if errorlevel 2 goto:MENU

if not errorlevel 1 goto:notback
if /i "%MENU1%" NEQ "S" goto:WPAGE4
::if /i "%SNEEKSELECT%" NEQ "5" goto:WPAGE20
::if "%SMTHEMEAPP%"=="" (goto:SNKPAGE4c) else (goto:WPAGE20)
goto:SNKPAGE5
:notback

call "%wabat%"

set ChannelsMarked=%waoutnum%

if "%waoutnum%"=="" goto:skipcheck

echo %waoutnum% >"%wabat%"

findStr /I /C:"0" "%wabat%" >nul
IF not ERRORLEVEL 1 set PIC=Y

findStr /I /C:"1" "%wabat%" >nul
IF not ERRORLEVEL 1 set MIIQ=Y

findStr /I /C:"2" "%wabat%" >nul
IF not ERRORLEVEL 1 set Shop=Y

findStr /I /C:"3" "%wabat%" >nul
IF not ERRORLEVEL 1 set NET=Y

::findStr /I /C:"4" "%wabat%" >nul
::IF not ERRORLEVEL 1 set Weather=Y

::findStr /I /C:"5" "%wabat%" >nul
::IF not ERRORLEVEL 1 set NEWS=Y

::findStr /I /C:"6" "%wabat%" >nul
::IF not ERRORLEVEL 1 set Speak=Y

:skipcheck


if /i "%MENU1%" NEQ "S" goto:notS
if /i "%THEMEQ%" EQU "Y" goto:WPAGE20
if /i "%THEMEQ%" NEQ "Y" (set backB4wpageLast=WPAGE5) & (goto:WPAGELAST)
:notS


if /i "%VIRGIN%" EQU "Y" (goto:WPAGE20) else (goto:WPAGE13)



::...................................Wizard Page13 - MORE Advanced Channels?...............................
:WPAGE13


::set Advanced=

set HMInstaller=
set IOS236InstallerQ=
set RECCIOS=
set PRIQ=
set yawmQ=
set THEMEQ=
set USBGUIDE=
SET UpdatesIOSQ=N
::set ThemeSelection=N

set waoutnum=
set waoutput=

::recall checked items
if not "%AdvancedMarked%"=="" set waoutnum=%AdvancedMarked%


set watext=~~~~       Select which of the following to Install or Update

if /i "%CMIOSOPTION%" EQU "on" set wainput= ^&Homebrew Channel and\or Bootmii; ^&Recommended cIOSs and cMIOS; ^&Priiloader v0.9.1 (and System Menu hacks); ^&System Menu Theme; ^&USB-Loader; ^&Active IOSs and patched System Menu IOSs

if /i "%CMIOSOPTION%" NEQ "on" set wainput= ^&Homebrew Channel and\or Bootmii; ^&Recommended cIOSs; ^&Priiloader v0.9.1 (and System Menu hacks); System Menu ^&Theme; ^&USB-Loader; ^&Active IOSs and patched System Menu IOSs


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp CL

if errorlevel 2 goto:MENU
if errorlevel 1 goto:WPAGE5


call "%wabat%"

set AdvancedMarked=%waoutnum%

if "%waoutnum%"=="" (set BACKB4DRIVE=WPAGE13) & (goto:DRIVECHANGE)

echo %waoutnum% >"%wabat%"

findStr /I /C:"0" "%wabat%" >nul
IF not ERRORLEVEL 1 set HMInstaller=Y

findStr /I /C:"1" "%wabat%" >nul
IF not ERRORLEVEL 1 set RECCIOS=Y

findStr /I /C:"2" "%wabat%" >nul
IF not ERRORLEVEL 1 set PRIQ=Y

findStr /I /C:"3" "%wabat%" >nul
IF not ERRORLEVEL 1 set THEMEQ=Y

findStr /I /C:"4" "%wabat%" >nul
IF not ERRORLEVEL 1 set USBGUIDE=Y

findStr /I /C:"5" "%wabat%" >nul
IF not ERRORLEVEL 1 (set UpdatesIOSQ=Y) else (set UpdatesIOSQ=N)


if /i "%THEMEQ%" EQU "Y" goto:WPAGE20
if /i "%USBGUIDE%" EQU "Y" goto:UPAGE1b

set BACKB4DRIVE=WPAGE13
goto:DRIVECHANGE





::...................................Wizard Page20 - Theme Selection...............................
:WPAGE20
set ThemeSelection=
set waoutnum=
set waoutput=

if /i "%SNEEKSELECT%" NEQ "5" goto:nocheck
if "%SMTHEMEAPP%"=="" goto:WPAGE5
:nocheck


::recall checked items
if not "%ThemeSelectionMarked%"=="" set waoutnum=%ThemeSelectionMarked%


set watext=~~~   Would you like to install a custom Theme on your Wii?~~    Choose from 3 effects: No-Spin, Spin and Fast-Spin

set wainput= View All Available Themes on ^&Youtube; Change Channel ^&Effect - Current Effect: %effect%; DarkWii ^&Red Theme - %effect%; DarkWii ^&Green Theme - %effect%; DarkWii ^&Blue Theme - %effect%; DarkWii ^&Orange Theme - %effect%; ^&No, I want the same old boring, boring System Menu

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU


if not errorlevel 1 goto:notback
if /i "%MENU1%" EQU "RC" goto:WPAGE4

::if /i "%SNEEKSELECT%" EQU "5" goto:quickskip
::if /i "%MENU1%" EQU "S" goto:SNKPAGE5
:::quickskip
::if /i "%SNEEKSELECT%" EQU "5" goto:SNKPAGE4c

if /i "%MENU1%" EQU "S" goto:WPAGE5
if /i "%VIRGIN%" EQU "Y" (goto:WPAGE5) else (goto:WPAGE13)
:notback

call "%wabat%"

::if blank, check "NO"
if "%waoutnum%"=="" set waoutnum=6

set ThemeSelectionMarked=%waoutnum%

if /i "%waoutnum%" EQU "0" set ThemeSelection=WWW
if /i "%waoutnum%" EQU "1" set ThemeSelection=CE
if /i "%waoutnum%" EQU "2" set ThemeSelection=R
if /i "%waoutnum%" EQU "3" set ThemeSelection=G
if /i "%waoutnum%" EQU "4" set ThemeSelection=BL
if /i "%waoutnum%" EQU "5" set ThemeSelection=O
if /i "%waoutnum%" EQU "6" set ThemeSelection=N

if "%ThemeSelection%"=="" goto:WPAGE20

if /i "%ThemeSelection%" NEQ "WWW" goto:novid
start https://modmii.github.io/WiiThemes.html
goto:WPAGE20
:novid

if /i "%ThemeSelection%" NEQ "CE" goto:SkipOptionCEwizard
if /i "%effect%" EQU "no-spin" (set effect=Spin) & (support\sfk filter Support\settings.bat -!"Set effect=" -write -yes>nul) & (echo Set effect=Spin>>Support\settings.bat) & (goto:WPAGE20)
if /i "%effect%" EQU "spin" (set effect=Fast-Spin) & (support\sfk filter Support\settings.bat -!"Set effect=" -write -yes>nul) & (echo Set effect=Fast-Spin>>Support\settings.bat) & (goto:WPAGE20)
if /i "%effect%" EQU "fast-spin" (set effect=No-Spin) & (support\sfk filter Support\settings.bat -!"Set effect=" -write -yes>nul) & (echo Set effect=No-Spin>>Support\settings.bat) & (goto:WPAGE20)
:SkipOptionCEwizard

::next
if /i "%SNEEKSELECT%" NEQ "5" goto:miniskip
if /i "%ThemeSelection%" EQU "D" goto:WPAGE5
:miniskip

if /i "%MENU1%" EQU "RC" (set BACKB4DRIVE=WPAGE20) & (goto:DriveChange)

if /i "%MENU1%" EQU "S" (set backB4wpageLast=WPAGE20) & (goto:WPAGELAST)

::Wizard
if /i "%VIRGIN%" EQU "Y" goto:WPAGE21
if /i "%USBGUIDE%" EQU "Y" (goto:UPAGE1b) else (goto:DRIVECHANGE)



::...................................Wizard Page21 - USB Loader Setup Q...............................
:WPAGE21
set USBGUIDE=
set waoutnum=
set waoutput=

::recall checked items
if not "%USBGUIDEMarked%"=="" set waoutnum=%USBGUIDEMarked%

set watext=~Would you like to set up a USB-Loader now?~~Notes:~USB-Loaders allow the Wii to play games off a USB Hard Drive or SD Card. This step can always be done by itself later on from ModMii's Main Menu.

set wainput= ^&Yes; ^&No

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:WPAGE20

call "%wabat%"

::if blank, check "NO"
if "%waoutnum%"=="" set waoutnum=1

set USBGUIDEMarked=%waoutnum%

if /i "%waoutnum%" EQU "0" (set USBGUIDE=Y) & (goto:UPAGE1b)
if /i "%waoutnum%" EQU "1" (set USBGUIDE=N) & (set BACKB4DRIVE=WPAGE21) & (goto:DRIVECHANGE)

if "%USBGUIDE%"=="" goto:WPAGE21








::...................................SD Card Location...............................
:DriveChange
set "drivetemp=%DRIVE%"
set waoutnum=
set "waoutput=%DRIVE%"
set "wabmplast=%wabmp%"
set "wabmp=%SDCARD.bmp%"


::makedrive if not exist
::if not exist "%DRIVE%" mkdir "%DRIVE%"

set watext=~~Select where to save files for your SD Card~~Note: if your SD Card is not already formatted as FAT32 (or if you are unsure), it may save some time to choose a location that is not your SD Card

set watext=Select where to save files for your SD Card~~* If your SD is not already FAT32 (or if you are unsure) it may save time choosing a different location for now.~* If your Wii's SD Card reader is broken, you can use a Hard Drive formatted as FAT32 in place of an SD Card to complete most ModMii functions (SD required for Bootmii, NAND backup ^& SNEEK).

start /w support\wizapp FB DIR

if errorlevel 2 goto:MENU
if not errorlevel 1 goto:notback
set "wabmp=%wabmplast%"
if /i "%MENU1%" EQU "O" goto:notback
goto:%BACKB4DRIVE%
:notback



::double escape real carrots, but correct ^^& back to ^& (which is done by default by wizapp)
support\sfk filter -spat -quiet "%wabat%" -rep _\x5e_\x5e\x5e_ -rep _\x5e\x5e\x26_\x5e\x26_ -write -yes>nul

call "%wabat%"

set "DRIVETEMP=%waoutput%"

::remove quotes (if applicable)
setlocal ENABLEDELAYEDEXPANSION
set "Drivetemp=!Drivetemp:"=!"
set "Drivetemp=!Drivetemp:^^=^!"
setlocal DISABLEDELAYEDEXPANSION

:doublecheck
set fixslash=
if "%DRIVETEMP%"=="" (echo You Have Entered an Incorrect Key) & (goto:DRIVECHANGE)
if /i "%DRIVETEMP:~-1%" EQU "\" set fixslash=yes
if /i "%DRIVETEMP:~-1%" EQU "/" set fixslash=yes
if /i "%fixslash%" EQU "yes" set "DRIVETEMP=%DRIVETEMP:~0,-1%"
if /i "%fixslash%" EQU "yes" goto:doublecheck
:skip

::if second char is ":" check if drive exists
if /i "%DRIVETEMP:~1,1%" NEQ ":" goto:skipcheck
if exist "%DRIVETEMP:~0,2%" (goto:skipcheck) else (echo.)
echo "%DRIVETEMP:~0,2%" doesn't exist, please try again...
goto:DRIVECHANGE
:skipcheck



::try making directory, and if fails, don't use this setting
if not exist "%DRIVETEMP%" mkdir "%DRIVETEMP%"
if not exist "%DRIVETEMP%" (echo You Have Entered an Incorrect Key or need Admin rights for this location) & (if /i "%AudioOption%" NEQ "off" start support\nircmd.exe mediaplay 3000 "%FAIL.mp3%") & (goto:DRIVECHANGE)


::check for write access
if not exist "%DRIVETEMP%\test.txt" goto:skip
del "%DRIVETEMP%\test.txt">nul
if exist "%DRIVETEMP%\test.txt" (goto:WriteError) else (goto:donecheck)

:skip
echo test>"%DRIVETEMP%\test.txt"
if exist "%DRIVETEMP%\test.txt" goto:donecheck

:WriteError
echo You need Admin rights to use this location
if /i "%AudioOption%" NEQ "off" start support\nircmd.exe mediaplay 3000 "%FAIL.mp3%"
::@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DRIVECHANGE

:donecheck
if exist "%DRIVETEMP%\test.txt" del "%DRIVETEMP%\test.txt">nul



set "DRIVE=%DRIVETEMP%"


::autosave drive setting to settings.bat
support\sfk filter Support\settings.bat -!"Set*Drive=" -write -yes>nul
echo Set "Drive=%DRIVE%">>Support\settings.bat
::support\sfk filter -spat -quiet Support\settings.bat -rep _\x5e\x26_\x26_ -rep _\x26_\x5e\x26_ -write -yes>nul
::support\sfk filter -quiet Support\settings.bat -lerep _\__ -lerep _/__ -write -yes>nul

set "wabmp=%wabmplast%"

::if /i "%MENU1%" EQU "FC" goto:FileCleanup

if /i "%MENU1%" EQU "O" goto:options

if /i "%MENU1%" EQU "H" (set backB4wpageLast=DRIVECHANGE) & (goto:WPAGELAST)

if /i "%MENU1%" EQU "W" goto:noskip
if /i "%MENU1%" EQU "U" goto:noskip
goto:skip
:noskip
if /i "%USBCONFIG%" EQU "USB" (set backB4DRIVEU=DRIVECHANGE) & (goto:DRIVEUCHANGE)
if /i "%USBCONFIG%" NEQ "USB" (set backB4wpageLast=DRIVECHANGE) & (goto:WPAGELAST)
:skip


if /i "%MENU1%" EQU "RC" (set backB4wpageLast=DRIVECHANGE) & (goto:WPAGELAST)

if /i "%SNEEKTYPE%" EQU "U" (set BACKB4DRIVEU=DRIVECHANGE) & (goto:DRIVEUCHANGE)

if /i "%SNEEKTYPE%" EQU "UD" (set BACKB4DRIVEU=DRIVECHANGE) & (goto:DRIVEUCHANGE)

if /i "%SNEEKSELECT%" EQU "2" (set B4SNKPAGE3=DRIVECHANGE) & (goto:snkpage3)

if /i "%SNEEKSELECT%" EQU "3" (set B4SNKPAGE3=DRIVECHANGE) & (goto:snkpage3)

if /i "%SNEEKSELECT%" EQU "1" (set backB4wpageLast=DRIVECHANGE) & (goto:WPAGELAST)





::...................................USB Hard Drive Location...............................
:DriveUChange
set "driveUtemp=%DRIVEU%"
set waoutnum=
set "waoutput=%DRIVEU%"

set "wabmplast=%wabmp%"
set "wabmp=%USBDIR.bmp%"

::makedrive if not exist
::if not exist "%DRIVE%" mkdir "%DRIVE%"

set watext=~~Select where to save files for your USB Hard Drive~~Note: if your USB Hard Drive is not already formatted properly (or if you are unsure), it may save some time to choose a location that is not your USB Hard Drive

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp FB DIR

if errorlevel 2 goto:MENU
if not errorlevel 1 goto:notback
set "wabmp=%wabmplast%"
if /i "%MENU1%" EQU "O" goto:notback
goto:%BACKB4DRIVEU%
:notback


::double escape real carrots, but correct ^^& back to ^& (which is done by default by wizapp)
support\sfk filter -spat -quiet "%wabat%" -rep _\x5e_\x5e\x5e_ -rep _\x5e\x5e\x26_\x5e\x26_ -write -yes>nul

call "%wabat%"

set "DRIVEUTEMP=%waoutput%"

::remove quotes (if applicable)
setlocal ENABLEDELAYEDEXPANSION
set "DRIVEUTEMP=!DRIVEUTEMP:"=!"
set "DRIVEUTEMP=!DRIVEUTEMP:^^=^!"
setlocal DISABLEDELAYEDEXPANSION

:doublecheckU
set fixslash=
if "%DRIVEUTEMP%"=="" (echo You Have Entered an Incorrect Key) & (goto:DRIVEUCHANGE)
if /i "%DRIVEUTEMP:~-1%" EQU "\" set fixslash=yes
if /i "%DRIVEUTEMP:~-1%" EQU "/" set fixslash=yes
if /i "%fixslash%" EQU "yes" set "DRIVEUTEMP=%DRIVEUTEMP:~0,-1%"
if /i "%fixslash%" EQU "yes" goto:doublecheckU

::if second char is ":" check if drive exists
if /i "%DRIVEUTEMP:~1,1%" NEQ ":" goto:skipcheck
if exist "%DRIVEUTEMP:~0,2%" (goto:skipcheck) else (echo.)
echo "%DRIVEUTEMP:~0,2%" doesn't exist, please try again...
goto:DRIVECHANGE
:skipcheck



::try making directory, and if fails, don't use this setting
if not exist "%DRIVEUTEMP%" mkdir "%DRIVEUTEMP%"
if not exist "%DRIVEUTEMP%" (echo You Have Entered an Incorrect Key or need Admin rights for this location) & (if /i "%AudioOption%" NEQ "off" start support\nircmd.exe mediaplay 3000 "%FAIL.mp3%") & (goto:DRIVEUCHANGE)


::check for write access
if not exist "%DRIVEUTEMP%\test.txt" goto:skip
del "%DRIVEUTEMP%\test.txt">nul
if exist "%DRIVEUTEMP%\test.txt" (goto:WriteError) else (goto:donecheck)

:skip
echo test>"%DRIVEUTEMP%\test.txt"
if exist "%DRIVEUTEMP%\test.txt" goto:donecheck

:WriteError
echo You need Admin rights to use this location
if /i "%AudioOption%" NEQ "off" start support\nircmd.exe mediaplay 3000 "%FAIL.mp3%"
::@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DRIVEUCHANGE

:donecheck
if exist "%DRIVEUTEMP%\test.txt" del "%DRIVEUTEMP%\test.txt">nul



set "DRIVEU=%DRIVEUTEMP%"


::autosave drive setting to settings.bat
support\sfk filter Support\settings.bat -!"Set*DriveU=" -write -yes>nul
echo Set "DriveU=%DRIVEU%">>Support\settings.bat


set "wabmp=%wabmplast%"

if /i "%MENU1%" EQU "O" goto:options

if /i "%MENU1%" EQU "W" goto:noskip
if /i "%MENU1%" EQU "U" goto:noskip
goto:skip
:noskip
if /i "%USBCONFIG%" EQU "USB" set BACKB4WPAGELAST=DRIVEUCHANGE
if /i "%USBCONFIG%" EQU "USB" goto:WPAGELAST
:skip

if /i "%SNEEKSELECT%" EQU "1" (set BACKB4WPAGELAST=DRIVEUCHANGE) & (goto:WPAGELAST)
if /i "%SNEEKSELECT%" EQU "2" (set B4SNKPAGE3=DRIVEUCHANGE) & (goto:snkpage3)
if /i "%SNEEKSELECT%" EQU "3" (set B4SNKPAGE3=DRIVEUCHANGE) & (goto:snkpage3)
if /i "%SNEEKSELECT%" EQU "4" goto:SNKDISCEX2


::...................................Check For Updates...............................

:UpdateModMii

if exist "version.txt" del "version.txt">nul

set wabmplast=%wabmp%
set "wabmp=%UPDATECHECK.bmp%"

set watext=~~Checking for Updates...~~Current version is %currentversion%
start support\wizapp PB OPEN
start support\wizapp PB UPDATE 20



::only if temp\currentversion.txt exists updater.bat will do start updating when called or started, otherwise will just get info and return to loader ::echo %currentversion%>temp\currentversion.txt
if exist "temp\currentversion.txt" del "temp\currentversion.txt">nul
if exist "temp\currentversionInfo.txt" del "temp\currentversionInfo.txt">nul
echo %currentversion%>temp\skin.txt

if /i "%debug%" EQU "on" goto:skip
::comment these for local Updatetemp.bat for testing... (updater.bat is renamed to Updatetemp.bat for legacy purposes)
if exist Updatetemp.bat del Updatetemp.bat>nul

start /min /wait support\wget --no-check-certificate "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/updater.bat" -O Updatetemp.bat
if not exist Updatetemp.bat goto:altlink
::DELETE IF NULL
for %%R in (Updatetemp.bat) do if %%~zR lss 1 del "Updatetemp.bat">nul


:altlink
if not exist "Updatetemp.bat" start /min /wait support\wget --no-check-certificate "http://tiny.cc/modmiiupdater" -O Updatetemp.bat

if not exist Updatetemp.bat goto:updatefail
::DELETE IF NULL
for %%R in (Updatetemp.bat) do if %%~zR lss 1 del "Updatetemp.bat">nul
:skip

::Call to get new version info and changelogURL
if exist Updatetemp.bat (call Updatetemp.bat) else (goto:updatefail)
if "%newversion%"=="" goto:updatefail



start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE



if %currentversion% LSS %newversion% goto:openchangelog

del Updatetemp.bat>nul

::----------disable Splash for now------------
::if /i "%MENU1%" EQU "O" (set wabmp=%wabmplast%) & (goto:OPTIONS) else (goto:MENU)

if %currentversion% GTR %newversion% set watext=~This version is newer than the latest public release~~You got some crazy new beta shit!

if %currentversion% EQU %newversion% set watext=~This version is up to date

start support\wizapp PB OPEN
start support\wizapp PB UPDATE 100


support\nircmd.exe wait 2000

start support\wizapp PB CLOSE

set wabmp=%wabmplast%

if /i "%MENU1%" EQU "O" (goto:OPTIONS) else (goto:MENU)




:openchangelog
start %changelogURL%

:updateconfirm
::set updatenow=

set watext=~An Update is available, would you like to update to v%newversion% now?~~It is recommended you read the changelog that just opened in your browser.~~Click "Next" to update now otherwise click "Cancel".


start /w support\wizapp NOBACK TB


if not errorlevel 2 goto:notcancel
set wabmp=%wabmplast%

if /i "%debug%" EQU "on" goto:debugskip
if exist Updatetemp.bat attrib -h Updatetemp.bat
if exist Updatetemp.bat del Updatetemp.bat>nul
:debugskip

if /i "%MENU1%" EQU "O" (goto:OPTIONS) else (goto:MENU)
:notcancel



:updatenow
::launch updater with temp\currentversion.txt to do the update
::only if temp\currentversion.txt exists updater will do start updating when called or started
::updater runs in skin mode if temp\skin.txt detected
echo %currentversion%>temp\currentversion.txt
echo %currentversion%>temp\skin.txt

start /min Updatetemp.bat
exit



:updatefail

start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE


set watext=~~Update check has failed, check your internet connection and firewall settings.

start /w support\wizapp NOBACK TB

set wabmp=%wabmplast%

if /i "%MENU1%" EQU "O" (goto:OPTIONS) else (goto:MENU)





::...................................Wizard Last Page - Confirmation...............................
:WPAGELAST
set WLAST=
set waoutnum=
set waoutput=
set wainput=


set watext=Confirm your settings are correct then click "Finish"


if /i "%MENU1%" NEQ "W" goto:notwizard
if /i "%USBCONFIG%" NEQ "USB" set "watext=%watext%~~Save files to: %Drive%"
if /i "%USBCONFIG%" EQU "USB" set "watext=%watext%~~Save files to: %Drive%~and to: %DriveU%"
:notwizard

if /i "%MENU1%" NEQ "U" goto:notusb
if /i "%USBCONFIG%" EQU "USB" set "watext=%watext%~~Save files to: %DriveU%"
if /i "%USBCONFIG%" NEQ "USB" set "watext=%watext%~~Save files to: %Drive%"
:notusb


if /i "%MENU1%" NEQ "S" goto:notS
if /i "%SNEEKSELECT%" NEQ "2" goto:not2
if /i "%SNEEKTYPE:~0,1%" EQU "S" set "watext=%watext%~~Save files to: %Drive%"
if /i "%SNEEKTYPE:~0,1%" NEQ "S" set "watext=%watext%~~Save files to: %DriveU%"
goto:notS
:not2
if /i "%SNEEKTYPE:~0,1%" EQU "S" set "watext=%watext%~~Save files to: %Drive%"
if /i "%SNEEKTYPE:~0,1%" NEQ "S" set "watext=%watext%~~Save files to: %Drive%~and to: %DriveU%"
:notS

if /i "%MENU1%" EQU "H" set "watext=%watext%~~Save files to: %Drive%"
if /i "%MENU1%" EQU "RC" set "watext=%watext%~~Save files to: %Drive%"


if /i "%MENU1%" EQU "H" set wainput=%wainput%                       HackMii Solutions Guide~
if /i "%MENU1%" EQU "w" set wainput=%wainput%                            ModMii Wizard~
if /i "%MENU1%" EQU "U" set wainput=%wainput%                     ModMii USB-Loader Setup Guide~
if /i "%MENU1%" EQU "RC" set wainput=%wainput%                         Region Change Guide~


if /i "%MENU1%" NEQ "S" goto:notS
if /i "%SNEEKSELECT%" EQU "1" set wainput=%wainput%                         SNEEK Installation~
if /i "%SNEEKSELECT%" EQU "2" set wainput=%wainput%                        Emulated NAND Builder~
if /i "%AbstinenceWiz%" EQU "Y" set wainput=%wainput%                          Abstinence Wizard~
if /i "%AbstinenceWiz%" EQU "Y" goto:notS
if /i "%SNEEKSELECT%" EQU "3" set wainput=%wainput%    SNEEK Installation and Emulated NAND Builder~
:notS


if /i "%AbstinenceWiz%" EQU "Y" goto:guideavailable
if /i "%MENU1%" EQU "S" goto:guideNOTavailable
:guideavailable
if /i "%GUIDEONLY%" EQU "on" set wainput=%wainput%~* Generate Guide Only Option Enabled~
:guideNOTavailable


if /i "%MENU1%" EQU "H" set wainput=%wainput%~* Current System Menu is %FIRMSTART%%REGION%

if /i "%macaddress%" EQU "S" goto:skip
if /i "%EXPLOIT%" EQU "W" set wainput=%wainput%~* MAC Address: %macaddress%
if /i "%EXPLOIT%" EQU "?" set wainput=%wainput%~* MAC Address: %macaddress%
:skip

if /i "%MENU1%" EQU "H" goto:skipusb




if /i "%MENU1%" NEQ "S" goto:notS
if /i "%AbstinenceWiz%" NEQ "Y" goto:notabstinence
if /i "%FIRMSTART%" NEQ "o" set wainput=%wainput%~* Current System Menu is %FIRMSTART%%REGION%~
if /i "%FIRMSTART%" EQU "o" set wainput=%wainput%~* Current System Menu is less than 2.2%REGION%~
:notabstinence

if /i "%SNEEKSELECT%" EQU "2" goto:noSSDcomment
if /i "%SNEEKTYPE%" EQU "SD" set wainput=%wainput%~* Build %neekname%: SNEEK+DI Rev%CurrentRev%
if /i "%SNEEKTYPE%" EQU "UD" set wainput=%wainput%~* Build %neekname%: UNEEK+DI Rev%CurrentRev%
if /i "%SNEEKTYPE%" EQU "S" set wainput=%wainput%~* Build %neekname%: SNEEK Rev%CurrentRev%
if /i "%SNEEKTYPE%" EQU "U" set wainput=%wainput%~* Build %neekname%: UNEEK Rev%CurrentRev%

if /i "%neek2o%" EQU "on" set wainput=%wainput%~* neek2o Enabled (can be changed in options)
if /i "%neek2o%" NEQ "on" set wainput=%wainput%~* neek2o Disabled (can be changed in options)

if /i "%SNEEKTYPE:~0,1%" NEQ "S" goto:noSSDcomment
if /i "%SSD%" EQU "on" set wainput=%wainput%~* SD Access Enabled (can be changed in options)
if /i "%SSD%" NEQ "on" set wainput=%wainput%~* SD Access Disabled (can be changed in options)
:noSSDcomment

if /i "%SNEEKSELECT%" EQU "3" set wainput=%wainput%~

if /i "%SNEEKSELECT%" NEQ "1" set wainput=%wainput%~* Build a %SNKVERSION%%SNKREGION% Emulated NAND

if /i "%SNEEKSELECT%" NEQ "1" set wainput=%wainput%~* setting.txt created using serial #: %SNKSERIAL%

if /i "%SNKOHBC%" EQU "Y" set wainput=%wainput%~* Install Open Homebrew Channel

if /i "%SNKPLC%" EQU "Y" set wainput=%wainput%~* Install postLoader Channel

if /i "%SNKCIOS%" EQU "Y" set wainput=%wainput%~* Install cIOS249 rev14

if /i "%SNKcBC%" EQU "NMM" set wainput=%wainput%~* Install NMM (No More Memory-Cards)

if /i "%SNKcBC%" EQU "DML" set wainput=%wainput%~* Install DML to Real NAND

if /i "%SNKPRI%" EQU "Y" set wainput=%wainput%~* Install Priiloader

if /i "%SNKFLOW%" EQU "Y" set wainput=%wainput%~* Install WiiFlow

IF not "%addwadfolder%"=="" set wainput=%wainput%~* Install wads from custom folder:~  %addwadfolder%

if /i "%ThemeSelection%" EQU "R" set wainput=%wainput%~* Install Dark Wii Red Theme - %effect%

if /i "%ThemeSelection%" EQU "G" set wainput=%wainput%~* Install Dark Wii Green Theme - %effect%
if /i "%ThemeSelection%" EQU "BL" set wainput=%wainput%~* Install Dark Wii Blue Theme - %effect%
if /i "%ThemeSelection%" EQU "O" set wainput=%wainput%~* Install Dark Wii Orange Theme - %effect%


set wainput=%wainput%~
if /i "%PIC%" EQU "Y" set wainput=%wainput%~* Install the Photo Channel
if /i "%NET%" EQU "Y" set wainput=%wainput%~* Install the Internet Channel
if /i "%WEATHER%" EQU "Y" set wainput=%wainput%~* Install the Weather Channel
if /i "%NEWS%" EQU "Y" set wainput=%wainput%~* Install the News Channel
if /i "%MIIQ%" EQU "Y" set wainput=%wainput%~* Install the Mii Channel
if /i "%Shop%" EQU "Y" set wainput=%wainput%~* Install the Shopping Channel
if /i "%Speak%" EQU "Y" set wainput=%wainput%~* Install the Wii Speak Channel
set wainput=%wainput%~

goto:skipusb
:notS



if /i "%MENU1%" EQU "U" goto:skipwizstuff

if /i "%VIRGIN%" EQU "Y" set wainput=%wainput%~* Install\Update all recommended softmods~

if /i "%MENU1%" EQU "RC" goto:skipcurrentSM
if /i "%FIRMSTART%" NEQ "o" set wainput=%wainput%~* Current System Menu is %FIRMSTART%%REGION%
if /i "%FIRMSTART%" EQU "o" set wainput=%wainput%~* Current System Menu is less than 2.2%REGION%
:skipcurrentSM

set wainput=%wainput%~* Desired System Menu is %FIRM%%REGION%

if /i "%macaddress%" EQU "S" goto:skip
if not "%macaddress%"=="" set wainput=%wainput%~* MAC Address - %macaddress%
:skip


set wainput=%wainput%~
if /i "%PIC%" EQU "Y" set wainput=%wainput%~* Install the Photo Channel
if /i "%NET%" EQU "Y" set wainput=%wainput%~* Install the Internet Channel
if /i "%WEATHER%" EQU "Y" set wainput=%wainput%~* Install the Weather Channel
if /i "%NEWS%" EQU "Y" set wainput=%wainput%~* Install the News Channel
if /i "%MIIQ%" EQU "Y" set wainput=%wainput%~* Install the Mii Channel
if /i "%Shop%" EQU "Y" set wainput=%wainput%~* Install the Shopping Channel and IOS56
if /i "%Speak%" EQU "Y" set wainput=%wainput%~* Install the Wii Speak Channel

::set wainput=%wainput%~

if /i "%HMInstaller%" EQU "Y" set wainput=%wainput%~* Install\Update the Homebrew Channel and Bootmii

if /i "%RECCIOS%" NEQ "Y" goto:smallskip
if /i "%CMIOSOPTION%" EQU "on" (set "wainput=%wainput%~* Install\Update recommended cIOSs and cMIOS") else (set "wainput=%wainput%~* Install\Update recommended cIOSs")
:smallskip

if /i "%UpdatesIOSQ%" EQU "Y" set wainput=%wainput%~* Install Active IOSs and patched System Menu IOSs


if /i "%yawmQ%" EQU "Y" set wainput=%wainput%~* Download Yet Another Wad Manager Mod
if /i "%IOS236InstallerQ%" EQU "Y" set wainput=%wainput%~* Install IOS236


if /i "%PRIQ%" EQU "Y" set wainput=%wainput%~* Install\Update Priiloader

if /i "%ThemeSelection%" EQU "R" set wainput=%wainput%~* Install Dark Wii Red Theme - %effect%
if /i "%ThemeSelection%" EQU "G" set wainput=%wainput%~* Install Dark Wii Green Theme - %effect%
if /i "%ThemeSelection%" EQU "BL" set wainput=%wainput%~* Install Dark Wii Blue Theme - %effect%
if /i "%ThemeSelection%" EQU "O" set wainput=%wainput%~* Install Dark Wii Orange Theme - %effect%

if /i "%MENU1%" EQU "RC" goto:skipusb
::---------
:skipwizstuff


if /i "%MENU1%" EQU "U" set USBGUIDE=Y
if /i "%USBGUIDE%" NEQ "Y" goto:skipusb
::if /i "%MENU1%" NEQ "U" set wainput=%wainput%~

if /i "%LOADER%" EQU "GX" set wainput=%wainput%~* Download USB-Loader GX
if /i "%LOADER%" EQU "CFG" set wainput=%wainput%~* Download Configurable USB-Loader
if /i "%LOADER%" EQU "FLOW" set wainput=%wainput%~* Download WiiFlow
if /i "%LOADER%" EQU "ALL" set wainput=%wainput%~* Download all USB-Loaders available in ModMii
if /i "%USBCONFIG%" EQU "USB" set wainput=%wainput%~* USB-Loader Settings\config-files saved to USB
if /i "%USBCONFIG%" NEQ "USB" set wainput=%wainput%~* USB-Loader Settings\config-files saved to SD Card

:skipusb




::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp FINISH FT

if errorlevel 2 goto:MENU
if errorlevel 1 goto:%BACKB4WPAGELAST%


set WLAST=Y

goto:StartModMiiClassic



::...................................USB-Loader Setup Page1b - Loader?...............................
:UPAGE1b
set LOADER=
set waoutnum=
set waoutput=


::recall checked items or set default
if not "%LOADERMarked%"=="" (set waoutnum=%LOADERMarked%) else (set waoutnum=0)

set watext=~           What USB-Loader would you like to use?~~Note: The ^"Nintendont^" Gamecube plugin is supported by all of these loaders and will also be downloaded.

set wainput= ^&USB-Loader GX (Recommended); ^&Configurable USB-Loader; ^&WiiFlow; ^&All of the above

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU

if not errorlevel 1 goto:notback
if /i "%AbstinenceWiz%" EQU "Y" goto:SNKPAGE2
if /i "%MENU1%" EQU "U" goto:MENU
if /i "%VIRGIN%" NEQ "N" goto:WPAGE21
if /i "%THEMEQ%" EQU "Y" goto:WPAGE20
goto:WPAGE13
:notback


call "%wabat%"

set LOADERMarked=%waoutnum%

if /i "%waoutnum%" EQU "0" set LOADER=GX
if /i "%waoutnum%" EQU "1" set LOADER=CFG
if /i "%waoutnum%" EQU "2" set LOADER=FLOW
if /i "%waoutnum%" EQU "3" set LOADER=ALL

goto:UPAGE2



::...................................USB-Loader Setup Page2 - Config on USB vs SD?...............................
:UPAGE2
set USBCONFIG=
set waoutnum=
set waoutput=


::recall checked items or set default
if not "%USBCONFIGMarked%"=="" (set waoutnum=%USBCONFIGMarked%) else (set waoutnum=0)

set watext=~~~Where would you like to save your USB-Loader app, games and covers?

set wainput= ^&USB; ^&SD Card

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:UPAGE1b

call "%wabat%"

set USBCONFIGMarked=%waoutnum%

if /i "%waoutnum%" EQU "0" set USBCONFIG=USB
if /i "%waoutnum%" EQU "1" set USBCONFIG=SD


::--goto--

::if using wizard+usb-loader setup, set up both drive letters
if /i "%MENU1%" EQU "W" (set BACKB4DRIVE=UPAGE2) & (set BACKB4DRIVEU=DRIVECHANGE) & (goto:DRIVECHANGE)

if /i "%USBCONFIG%" EQU "USB" (set BACKB4DRIVEU=UPAGE2) & (goto:DRIVEUCHANGE)

if /i "%USBCONFIG%" EQU "SD" (set BACKB4DRIVE=UPAGE2) & (goto:DRIVECHANGE)



::...................................SNEEK Page1 - SNEEK SELECT...............................
:SNKPAGE1
set SNEEKSELECT=
set SNKS2U=
set PRIIFOUND=
if /i "%neek2o%" EQU "on" (set neekURL=tinyurl.com/neeek2o) else (set neekURL=http://code.google.com/p/sneek)
set waoutnum=
set waoutput=
set wafile=

::recall checked items
if not "%SNEEKSELECTMarked%"=="" set waoutnum=%VIRGINMarked%


set watext=~~Which of the following SNEEK Actions would you like to perform?~~Note: Emulated NAND Modifer and SNEEK Game Bulk Extractor is currently only available in ModMii Classic

set wainput= ^&SNEEK Installation; ^&Emulated NAND Builder (for SNEEK); ^&All the above (Recommended for 1st time users)


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:MENU


call "%wabat%"

if "%waoutnum%"=="" goto:SNKPAGE1

set SNEEKSELECTMarked=%waoutnum%

if /i "%waoutnum%" EQU "0" (set SNEEKSELECT=1) & (goto:NEEKrevSelect)
if /i "%waoutnum%" EQU "1" (set SNEEKSELECT=2) & (goto:SNKPAGE2)
if /i "%waoutnum%" EQU "2" (set SNEEKSELECT=3) & (goto:NEEKrevSelect)




::...................................SNEEK Page - NEEK rev Selection...............................
:NEEKrevSelect

if exist temp\list.txt del temp\list.txt>nul
if exist temp\list2.txt del temp\list2.txt>nul

if /i "%neek2o%" EQU "ON" (set googlecode=neek2o) & (set neekname=neek2o)
if /i "%neek2o%" NEQ "ON" (set googlecode=sneeky-compiler-modmii) & (set neekname=neek)

::echo Checking which %neekname% versions are hosted online...

set watext=~~~Checking which %neekname% versions are hosted online...

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start support\wizapp PB OPEN


::get all list
start /min /wait support\wget --no-check-certificate -N "https://sourceforge.net/projects/%googlecode%/files/?source=navbar"

start support\wizapp PB UPDATE 20

if exist index.html@* (move /y index.html@* temp\list.txt>nul) else (goto:nowifi)
::copy /y "temp\list.txt" "temp\list2.txt">nul

support\sfk filter -spat "temp\list.txt" ++"/download\x22" ++"%neekname%-rev" -rep _"/download\x22"__ -rep _*"/"__ -rep _".zip*"__ -rep _"*files/"__ -rep _%neekname%-rev__ -rep _\x2528_\x28_ -rep _\x2529_\x29_ -rep _\x2520_\x20_ -rep _\x253B_\x3B_ -rep _\x252C_\x2C_ -write -yes>nul

support\sfk filter -spat "temp\list.txt" -!"\x22" -!"n" -unique -no-empty-lines -no-blank-lines -write -yes>nul

start support\wizapp PB UPDATE 40

start support\wizapp PB UPDATE 60

:nowifi

::get local list

if not exist "temp\%neekname%\*.zip" goto:nolocallist

dir "temp\%neekname%\*.zip" /b /O:-N>>temp\list.txt
support\sfk filter "temp\list.txt" -rep _"%neekname%-rev"__ -rep _".zip"__ -write -yes>nul
support\sfk filter "temp\list.txt" -unique -write -yes>nul

start support\wizapp PB UPDATE 80

:nolocallist


::------actual page start----------
:NEEKrevSelect2

start support\wizapp PB UPDATE 100

::count # of folders in advance to set "mode"
setlocal ENABLEDELAYEDEXPANSION
SET neekTOTAL=0
if exist temp\list.txt for /f "delims=" %%i in (temp\list.txt) do set /a neekTOTAL=!neekTOTAL!+1
setlocal DISABLEDELAYEDEXPANSION

start support\wizapp PB CLOSE


::Error if no revs found
if /i "%neekTOTAL%" NEQ "0" goto:neekrevsfound

set watext=~~~~Unable to connect to the internet and no %neekname% versions saved locally

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp TB
::set neekrev=B
goto:back

::-------------------
:neekrevsfound
Set neekrev=
set waoutnum=
set waoutput=
set wafile=
set wainput=

Set watext=~~~  Select the version of %neekname% you would like to build:

set FeaturedTag=

::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\list.txt) do call :processNEEKlist %%A
goto:quickskip
:processNEEKlist
set CurrentRev=%*


if not exist temp\list2.txt goto:nofeaturedcheck
findStr /I /C:"%CurrentRev%" "temp\list2.txt" >nul
IF ERRORLEVEL 1 (set FeaturedTag=) else (set FeaturedTag= - Featured)
:nofeaturedcheck


if not exist "temp\%neekname%\%neekname%-rev%CurrentRev%.zip" set wainput=%wainput%%CurrentRev% (hosted online)%FeaturedTag%;
if exist "temp\%neekname%\%neekname%-rev%CurrentRev%.zip" set wainput=%wainput%%CurrentRev%%FeaturedTag%;

goto:EOF
:quickskip

::remove last ; to delete empty selection
set wainput=%wainput:~0,-1%

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp LB SINGLE


if errorlevel 2 goto:MENU
if not errorlevel 1 goto:notback
:back
if /i "%AbstinenceWiz%" NEQ "Y" goto:NotAbstinenceWiz
::if /i "%neekrev%" NEQ "B" goto:NotAbstinenceWiz
if /i "%FIRMSTART%" EQU "4.3" goto:WPAGE3C
if /i "%FIRMSTART%" EQU "o" goto:WPAGE3C
goto:WPAGE2
:NotAbstinenceWiz
goto:SNKPAGE1
:notback

::remove featured\hosted tags before retrieving selection
support\sfk filter "%wabat%" -rep _" (hosted online)"__ -rep _" - Featured"__ -write -yes>nul

call "%wabat%"

if "%waoutput%"=="" goto:neekrevsfound

set CurrentRev=%waoutput%

goto:SNKPAGE2


::...................................SNEEK Page2 - SNEEK TYPE...............................
:SNKPAGE2
set SNEEKTYPE=
set waoutnum=
set waoutput=

::recall checked items or set default
if not "%SNEEKTYPEMarked%"=="" (set waoutnum=%SNEEKTYPEMarked%) else (set waoutnum=4)

if /i "%SNEEKSELECT%" NEQ "2" set watext=~~       What type of SNEEK would you like to install?
if /i "%SNEEKSELECT%" EQU "2" set watext=~~What type of SNEEK would you like to build an emulated NAND for?

if /i "%SNEEKSELECT%" NEQ "1" set watext=%watext%~~Note: NANDs built for any type of SNEEK work with any other type of SNEEK and ANY region Wii can use ANY region emulated NAND.


set wainput= UNEEK+^&DI; SNEEK+^&DI; ^&UNEEK; ^&SNEEK; ^&Information on the above types of NEEK

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if not errorlevel 1 goto:notback
if /i "%SNEEKSELECT%" EQU "1" goto:NEEKrevSelect2
if /i "%SNEEKSELECT%" EQU "3" goto:NEEKrevSelect2
if /i "%AbstinenceWiz%" EQU "Y" goto:NEEKrevSelect2
goto:SNKPAGE1
:notback

call "%wabat%"

set SNEEKTYPEMarked=%waoutnum%


if /i "%waoutnum%" EQU "0" set SNEEKTYPE=UD
if /i "%waoutnum%" EQU "1" set SNEEKTYPE=SD
if /i "%waoutnum%" EQU "2" set SNEEKTYPE=U
if /i "%waoutnum%" EQU "3" set SNEEKTYPE=S
if /i "%waoutnum%" EQU "4" goto:neekinfo


if "%SNEEKTYPE%"=="" goto:SNKPAGE2

::goto
if /i "%AbstinenceWiz%" NEQ "Y" goto:NotAbstinenceWiz
if /i "%SNEEKTYPE%" EQU "U" (set BACKB4DRIVE=SNKPAGE2) & (goto:DriveChange)
if /i "%SNEEKTYPE%" EQU "UD" (set BACKB4DRIVE=SNKPAGE2) & (goto:DriveChange)
:NotAbstinenceWiz

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
:skip
if /i "%SNEEKTYPE%" EQU "U" set BACKB4DRIVEU=SNKPAGE2
if /i "%SNEEKTYPE%" EQU "U" goto:DRIVEUCHANGE
if /i "%SNEEKTYPE%" EQU "UD" set BACKB4DRIVEU=SNKPAGE2
if /i "%SNEEKTYPE%" EQU "UD" goto:DRIVEUCHANGE




::------------------neek type info----------------
:neekinfo

set watext=~UNEEK+DI~* Emulated Wii nand/memory is on FAT32 External HDD~* Load Wii games off your FAT32 External Hard Drive~* You can load apps off an SD Card~* DVD-Drive disabled for games but not for apps~~SNEEK+DI~* Emulated Wii nand/memory is on SD Card~* Load Wii games off your FAT32 External Hard Drive~* Load GameCube games off your SD Card using DML~* You can load apps off a FAT32 USB HDD~* DVD-Drive disabled for games but not for apps~~UNEEK~* Same as UNEEK+DI but DVD-Drive is enabled and~  cannot load games off a FAT32 HDD~~SNEEK~* Same as SNEEK+DI but DVD-Drive is enabled and~  cannot load games off a FAT32 HDD

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp TB

if errorlevel 2 goto:MENU

goto:SNKPAGE2


::...................................SNEEK Page3 - SNEEK REGION...............................
:SNKPAGE3

if /i "%SNEEKTYPE:~0,1%" EQU "S" set "nandpath=%DRIVE%"
if /i "%SNEEKTYPE:~0,1%" EQU "U" set "nandpath=%DRIVEU%"

set DITYPE=off
if /i "%SNEEKTYPE%" EQU "UD" set DITYPE=on
if /i "%SNEEKTYPE%" EQU "SD" set DITYPE=on

set SNKREGION=
set waoutnum=
set waoutput=

::recall checked items
if not "%SNKREGIONMarked%"=="" set waoutnum=%SNKREGIONMarked%

set watext=~What Region would you like to make your Emulated NAND?~~Note: If you want your wiimotes be synced up to your real NAND and your emulated NAND simultaneously, then you must choose the real region of your Wii

set wainput= ^&U (USA); ^&E (Euro\PAL); ^&J (JPN); ^&K (Korean)


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:%B4SNKPAGE3%

::double escape real carrots, but correct ^^& back to ^& (which is done by default by wizapp)
support\sfk filter -spat -quiet "%wabat%" -rep _\x5e_\x5e\x5e_ -rep _\x5e\x5e\x26_\x5e\x26_ -write -yes>nul

call "%wabat%"

set "SNKREGIONMarked=%waoutnum%"

if /i "%waoutnum%" EQU "0" set SNKREGION=U
if /i "%waoutnum%" EQU "1" set SNKREGION=E
if /i "%waoutnum%" EQU "2" set SNKREGION=J
if /i "%waoutnum%" EQU "3" set SNKREGION=K

if "%SNKREGION%"=="" goto:SNKPAGE3

if /i "%SNKREGION%" EQU "U" set defaultserial=LU521175683
if /i "%SNKREGION%" EQU "E" set defaultserial=LEH133789940
if /i "%SNKREGION%" EQU "J" set defaultserial=LJM101175683
if /i "%SNKREGION%" EQU "K" set defaultserial=LJM101175683

goto:SNKPAGE4


::...................................SNEEK Page4 - SNEEK VERSION...............................
:SNKPAGE4
set SNKVERSION=
set waoutnum=
set waoutput=

::recall checked items
if not "%SNKVERSIONMarked%"=="" set waoutnum=%SNKVERSIONMarked%

set watext=~~~What System Menu Version would you like your emulated NAND to be?

set wainput= 4.^&3; 4.^&2; 4.^&1



::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:SNKPAGE3


call "%wabat%"

set SNKVERSIONMarked=%waoutnum%

if /i "%waoutnum%" EQU "0" set SNKVERSION=4.3
if /i "%waoutnum%" EQU "1" set SNKVERSION=4.2
if /i "%waoutnum%" EQU "2" set SNKVERSION=4.1

if "%SNKVERSION%"=="" goto:SNKPAGE4

goto:SNKPAGE4a



::...................................SNEEK Page4a - postLoader Channel...............................
::many modmii classic pages turned into one
:SNKPAGE4a
set THEMEQ=
set SNKPLC=
set SNKOHBC=
set SNKCIOS=
set SNKPRI=
set SNKcBC=
set SNKFLOW=
::set addwadfolder=

set waoutnum=
set waoutput=

::recall checked items
if not "%SNKMarked%"=="" set waoutnum=%SNKMarked%


set watext=~Select which of the following to install to your Emulated NAND?~~Note: neek2o rev93-96 will bypass Priiloader if detected on EmuNAND. To access Priiloader on your emulated NAND, hold reset just as your EmuNAND is booting up.


::use question marks instead of ^&, will be replaced later

set wainput= System Menu ?Theme; Post?Loader (App\USB Loader); cIOS?249 rev14 (required for some apps); ?Priiloader (and System Menu Hacks); Custom folder of ?WADs


if /i "%AbstinenceWiz%" EQU "Y" goto:noNMMDML
if /i "%SNEEKTYPE%" EQU "SD" set wainput=%wainput%; ?Dios Mios Lite -OR- No More Memory-Cards
if /i "%SNEEKTYPE%" NEQ "SD" set wainput=%wainput%; No ?More Memory-Cards (NMM)
:noNMMDML



::if /i "%SNEEKTYPE:~0,1%" NEQ "U" goto:notUneek
set wainput=%wainput%; ?WiiFlow (USB-Loader)
if /i "%AbstinenceWiz%" EQU "Y" goto:notUneek
if /i "%neek2o%" EQU "off" set wainput=%wainput%; ?Switch2Uneek (launch different NANDs)
:notUneek

set wainput=%wainput%; ?Open Homebrew Channel


echo %wainput%>temp\temp.txt

support\sfk filter -spat temp\temp.txt -rep _"\x3f"_"\x5e\x26"_ -write -yes>nul
set /p wainput= <temp\temp.txt
set wainput=%wainput%


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp CL

if errorlevel 2 goto:MENU

if errorlevel 1 goto:SNKPAGE4


call "%wabat%"

set SNKMarked=%waoutnum%

if "%waoutnum%"=="" goto:skipcheck

::echo %waoutnum% >"%wabat%"

findStr /I /C:"Post^&Loader" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKPLC=Y

findStr /I /C:"cIOS^&249 rev14" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKCIOS=Y

findStr /I /C:"Priiloader" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKPRI=Y

findStr /I /C:"System Menu ^&Theme" "%wabat%" >nul
IF not ERRORLEVEL 1 set THEMEQ=Y

findStr /I /C:"No ^&More Memory-Cards (NMM)" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKcBC=NMM

findStr /I /C:"^&WiiFlow" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKFLOW=Y

findStr /I /C:"^&Open Homebrew Channel" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKOHBC=Y

findStr /I /C:"Switch2Uneek" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKS2U=Y

findStr /I /C:"Switch2Uneek" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKS2U=Y

findStr /I /C:"^&Dios Mios Lite -OR- No More Memory-Cards" "%wabat%" >nul
::IF not ERRORLEVEL 1 goto:SNKPAGE4a3
IF not ERRORLEVEL 1 set SNKcBC=choose

findStr /I /C:"Custom folder of ^&WADs" "%wabat%" >nul
IF not ERRORLEVEL 1 (goto:addwadfolder) else (set addwadfolder=)

if /i "%SNKcBC%" EQU "choose" goto:SNKPAGE4a3

:skipcheck

goto:SNKPAGE5



::-----------------------------------Add WAD Folder to Install to emunand----------------------------------
:addwadfolder
::set addwadfolder=
set waoutnum=
set waoutput=


::recall checked items
if not "%addwadfolder%"=="" set "waoutput=%addwadfolder%"


set "watext=~Select the folder of WADs you'd like to install to your emulated NAND~~Make sure path does not contain & ( ) ^"

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp FB DIR

if errorlevel 2 goto:MENU
if errorlevel 1 goto:SNKPAGE4a

::double escape real carrots, but correct ^^& back to ^& (which is done by default by wizapp)
support\sfk filter -spat -quiet "%wabat%" -rep _\x5e_\x5e\x5e_ -rep _\x5e\x5e\x26_\x5e\x26_ -write -yes>nul

call "%wabat%"

set "addwadfolder=%waoutput%"

::remove quotes (if applicable)
setlocal ENABLEDELAYEDEXPANSION
set "addwadfolder=!addwadfolder:"=!"
set "addwadfolder=!addwadfolder:^^=^!"
setlocal DISABLEDELAYEDEXPANSION


::fix so addwadfolder works without quotes
::set "addwadfolder=%addwadfolder:^=^^%"
::set "addwadfolder=%addwadfolder:&=^&%"


if not exist "%addwadfolder%\*.wad" goto:noWADserror


findStr /I /C:"^" "%wabat%" >nul
IF not ERRORLEVEL 1 (set "watext=~~Select a folder without special characters and try again.") & (start /w support\wizapp TB) & (goto:addwadfolder)

findStr /I /C:"(" "%wabat%" >nul
IF not ERRORLEVEL 1 (set "watext=~~Select a folder without special characters and try again.") & (start /w support\wizapp TB) & (goto:addwadfolder)

findStr /I /C:")" "%wabat%" >nul
IF not ERRORLEVEL 1 (set "watext=~~Select a folder without special characters and try again.") & (start /w support\wizapp TB) & (goto:addwadfolder)


::goto
if /i "%SNKcBC%" EQU "choose" goto:SNKPAGE4a3
goto:SNKPAGE5


::Error if no WADs found
:noWADserror

set watext=~~~~No Wads found in the specified folder, please try a different folder.

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp TB
goto:addwadfolder


::...................................SNEEK Page4a3 - cBC...............................
:SNKPAGE4a3
set SNKcBC=

set waoutnum=
set waoutput=


::recall checked items
if not "%SNKcBCMarked%"=="" set "waoutnum=%SNKcBCMarked%"

set watext=          Would you like to use DML or NMM?~~DML is installed to real NAND and accessed via an emulated NAND (or NeoGamma) to allow you to play gamecube games off an SD Card.~~NMM allows you to save\load GameCube game saves using an SD Card instead of a GC Memory Card.

set wainput= ^&Dios Mios Lite (DML); ^&No More Memory-Cards (NMM)


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if not errorlevel 1 goto:notback
if "%addwadfolder%"=="" goto:SNKPAGE4a
goto:addwadfolder
:notback

call "%wabat%"

set SNKcBCMarked=%waoutnum%

if /i "%waoutnum%" EQU "0" (set SNKcBC=DML)
if /i "%waoutnum%" EQU "1" set SNKcBC=NMM

if "%SNKcBC%"=="" goto:SNKPAGE4a3

goto:SNKPAGE5



::...................................SNEEK Page5 - SNEEK SERIAL...............................
:SNKPAGE5
set waoutnum=
set waoutput=

if /i "%SNEEKTYPE:~0,1%" EQU "S" set "nandpath=%DRIVE%"
if /i "%SNEEKTYPE:~0,1%" EQU "U" set "nandpath=%DRIVEU%"

if /i "%neek2o%" EQU "ON" goto:DOIT
if /i "%SNKS2U%" EQU "N" goto:quickskip
:DOIT
SET NANDcount=0
if /i "%SNKREGION%" EQU "U" set nandregion=us
if /i "%SNKREGION%" EQU "E" set nandregion=eu
if /i "%SNKREGION%" EQU "J" set nandregion=jp
if /i "%SNKREGION%" EQU "K" set nandregion=kr
if not exist "%nandpath%\nands\pl_%nandregion%" set "nandpath=%nandpath%\nands\pl_%nandregion%"
if not exist "%nandpath%\nands\pl_%nandregion%" goto:quickskip

:NANDname
SET /a NANDcount=%NANDcount%+1
if not exist "%nandpath%\nands\pl_%nandregion%%NANDcount%" set "nandpath=%nandpath%\nands\pl_%nandregion%%NANDcount%"
if not exist "%nandpath%\nands\pl_%nandregion%%NANDcount%" goto:quickskip
goto:NANDname
:quickskip

set watext=~~Enter the 11 or 12 digit serial number Would you like to use to create the setting.txt for your emulated NAND, or use the default number provided below.

set waoutput=%defaultserial%

::recall checked items
if not "%SNKSERIAL%"=="" set waoutput=%SNKSERIAL%

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp EB

if errorlevel 2 goto:MENU

if not errorlevel 1 goto:notback
if /i "%AbstinenceWiz%" EQU "Y" goto:SNKPAGE4a
if /i "%SNEEKTYPE%" NEQ "SD" goto:SNKPAGE4a
if "%SNKcBC%"=="" goto:SNKPAGE4a
if /i "%SNKcBC%" EQU "NMM" goto:SNKPAGE4a3
if /i "%SNKcBC%" EQU "DML" goto:SNKPAGE4a3
if /i "%SNEEKTYPE%" EQU "SD" goto:SNKPAGE4a3
goto:SNKPAGE4a
:notback

call "%wabat%"

set SNKSERIAL=%waoutput%

IF "%SNKSERIAL%"=="" set SNKSERIAL=9999999999999

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
if not "%SNKSERIAL:~12%"=="" (goto:badkey)

::next page
goto:WPAGE5

:badkey
set SNKSERIAL=
goto:SNKPAGE5




::------------------REGION CHANGE WARNING----------------
:RCPAGE1

set REGIONCHANGE=


set watext=Are you sure you want to Region Change your Wii?~~Important Notes:~~* Region Changing is not necessary to play other region games. For example, you can play JPN games on a softmodded US Wii without region changing.~* An alternative to region changing is to use NEEK to emulate a different region System Menu.~~Warnings:~~* If you use the Wii Shopping Channel, you must start the channel and delete your account before starting this guide on your Wii. If you don't the Wii Shop Channel will error.~* ModMii's region change guide assumes your Wii has already been softmodded and SD Card properly formatted by following either the ModMii Wizard or SysCheck Updater Wizard. If this is not the case please do so before going any further. Do not attempt to region change your Wii without either an SD card or USB.~~Click "Next" if you decide to continue...

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp TB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:MENU

goto:WPAGE3




::----------------------Start ModMii Classic----------------------
:StartModMiiClassic

::set watext=~~~ModMii Classic Working...

::::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
::start support\wizapp PB OPEN

if /i "%MENU1%" EQU "L" goto:sendcmd


::---------ModMii Wizard-------------
if /i "%MENU1%" NEQ "W" goto:notwizard

set "classicCMD=W %FIRMSTART% %REGION% %FIRM%"

::THEMES
if /i "%ThemeSelection%" EQU "R" set "classicCMD=%classicCMD% Red"
if /i "%ThemeSelection%" EQU "G" set "classicCMD=%classicCMD% Green"
if /i "%ThemeSelection%" EQU "BL" set "classicCMD=%classicCMD% Blue"
if /i "%ThemeSelection%" EQU "O" set "classicCMD=%classicCMD% Orange"

::Wii CHANNELS
if /i "%PIC%" EQU "Y" set "classicCMD=%classicCMD% PHOTO"
if /i "%MIIQ%" EQU "Y" set "classicCMD=%classicCMD% MII"
if /i "%Shop%" EQU "Y" set "classicCMD=%classicCMD% SHOP"
if /i "%NET%" EQU "Y" set "classicCMD=%classicCMD% NET"
if /i "%Weather%" EQU "Y" set "classicCMD=%classicCMD% WEATHER"
if /i "%NEWS%" EQU "Y" set "classicCMD=%classicCMD% NEWS"
if /i "%Speak%" EQU "Y" set "classicCMD=%classicCMD% SPEAK"


::------USB-Loader Check---------
if /i "%USBGUIDE%" NEQ "Y" goto:nousb

set "classicCMD=%classicCMD% USB"

if /i "%LOADER%" EQU "GX" set "classicCMD=%classicCMD% GX"
if /i "%LOADER%" EQU "CFG" set "classicCMD=%classicCMD% CFG"
if /i "%LOADER%" EQU "FLOW" set "classicCMD=%classicCMD% FLOW"
if /i "%LOADER%" EQU "ALL" set "classicCMD=%classicCMD% CFG-FLOW-GX"

if /i "%USBCONFIG%" EQU "USB" set "classicCMD=%classicCMD% USBConfig"
if /i "%USBCONFIG%" EQU "SD" set "classicCMD=%classicCMD% SDConfig"
:nousb

::---------EXPLOITCHECK-----------
if /i "%FIRMSTART%" EQU "4.3" goto:exploitcheck
if /i "%FIRMSTART%" EQU "o" goto:exploitcheck
goto:skipexploitcheck

:exploitcheck
if /i "%EXPLOIT%" EQU "T" set "classicCMD=%classicCMD% Twilight"
if /i "%EXPLOIT%" EQU "S" set "classicCMD=%classicCMD% SmashStack"
if /i "%EXPLOIT%" EQU "L" set "classicCMD=%classicCMD% IndianaPwns"
if /i "%EXPLOIT%" EQU "LB" set "classicCMD=%classicCMD% Bathaxx"
if /i "%EXPLOIT%" EQU "LS" set "classicCMD=%classicCMD% ROTJ"
if /i "%EXPLOIT%" EQU "Y" set "classicCMD=%classicCMD% YuGiOwned"
if /i "%EXPLOIT%" EQU "TOS" set "classicCMD=%classicCMD% EriHakawai"
if /i "%EXPLOIT%" EQU "?" set "classicCMD=%classicCMD% AllExploits"
if /i "%EXPLOIT%" EQU "X" set "classicCMD=%classicCMD% str2hax"

if /i "%EXPLOIT%" NEQ "W" goto:skip
if /i "%macaddress%" NEQ "S" set "classicCMD=%classicCMD% MAC:%macaddress%"
if /i "%macaddress%" EQU "S" set "classicCMD=%classicCMD% LetterBomb"
:skip



if /i "%FIRMSTART%" NEQ "4.3" goto:skipexploitcheck
if /i "%EXPLOIT%" EQU "?" set "classicCMD=%classicCMD% MAC:%macaddress%"
:skipexploitcheck


if /i "%GUIDEONLY%" EQU "on" set "classicCMD=%classicCMD% Guide"


::Non Virgin Minimal Update
if /i "%VIRGIN%" EQU "Y" goto:sendCMD

set "classicCMD=%classicCMD% Min"


if /i "%HMInstaller%" EQU "Y" set "classicCMD=%classicCMD% HBC"
::if /i "%IOS236InstallerQ%" EQU "Y" set "classicCMD=%classicCMD% 236
if /i "%RECCIOS%" EQU "Y" set "classicCMD=%classicCMD% REC"
if /i "%PRIQ%" EQU "Y" set "classicCMD=%classicCMD% Pri"
::if /i "%yawmQ%" EQU "Y" set "classicCMD=%classicCMD% YAWMM"

if /i "%UpdatesIOSQ%" EQU "Y" set "classicCMD=%classicCMD% UIOS:E"
if /i "%UpdatesIOSQ%" EQU "N" set "classicCMD=%classicCMD% UIOS:D"

goto:sendCMD

:notwizard



::---------USB-Loader Setup Guide-------------
if /i "%MENU1%" NEQ "U" goto:notusb

set "classicCMD=U"

if /i "%LOADER%" EQU "GX" set "classicCMD=%classicCMD% GX"
if /i "%LOADER%" EQU "CFG" set "classicCMD=%classicCMD% CFG"
if /i "%LOADER%" EQU "FLOW" set "classicCMD=%classicCMD% FLOW"
if /i "%LOADER%" EQU "ALL" set "classicCMD=%classicCMD% CFG-FLOW-GX"

if /i "%USBCONFIG%" EQU "USB" set "classicCMD=%classicCMD% USBConfig"
if /i "%USBCONFIG%" EQU "SD" set "classicCMD=%classicCMD% SDConfig"

if /i "%GUIDEONLY%" EQU "on" set "classicCMD=%classicCMD% Guide"

goto:sendCMD

:notusb


::-----------HackMii Solutions Wizard----------------
if /i "%MENU1%" NEQ "H" goto:nothackmiisolutions

set "classicCMD=HS %FIRMSTART%"

::---------EXPLOITCHECK-----------
if /i "%FIRMSTART%" EQU "4.3" goto:exploitcheck
if /i "%FIRMSTART%" EQU "o" goto:exploitcheck
goto:skipexploitcheck

:exploitcheck
if /i "%EXPLOIT%" EQU "T" set "classicCMD=%classicCMD% Twilight"
if /i "%EXPLOIT%" EQU "S" set "classicCMD=%classicCMD% SmashStack"
if /i "%EXPLOIT%" EQU "L" set "classicCMD=%classicCMD% IndianaPwns"
if /i "%EXPLOIT%" EQU "LB" set "classicCMD=%classicCMD% Bathaxx"
if /i "%EXPLOIT%" EQU "LS" set "classicCMD=%classicCMD% ROTJ"
if /i "%EXPLOIT%" EQU "Y" set "classicCMD=%classicCMD% YuGiOwned"
if /i "%EXPLOIT%" EQU "TOS" set "classicCMD=%classicCMD% EriHakawai"
if /i "%EXPLOIT%" EQU "?" set "classicCMD=%classicCMD% AllExploits"
if /i "%EXPLOIT%" EQU "W" set "classicCMD=%classicCMD% MAC:%macaddress%"
:skipexploitcheck

if /i "%GUIDEONLY%" EQU "on" set "classicCMD=%classicCMD% Guide"

goto:sendCMD

:nothackmiisolutions


::-----------SNEEK FUNCTIONS----------------
if /i "%MENU1%" NEQ "S" goto:notS

if /i "%SNEEKSELECT%" EQU "1" (set "classicCMD=S %SNEEKTYPE% REV:%CurrentRev%") & (goto:sendCMD)
if /i "%SNEEKSELECT%" EQU "2" set "classicCMD=E %SNEEKTYPE% %SNKVERSION% %SNKREGION% SN:%SNKSERIAL%"
if /i "%SNEEKSELECT%" EQU "3" set "classicCMD=SE %SNEEKTYPE% %SNKVERSION% %SNKREGION% REV:%CurrentRev% SN:%SNKSERIAL%"


::------Abstinence only stuff------
if /i "%AbstinenceWiz%" NEQ "Y" goto:notAW

set "classicCMD=AW %FIRMSTART% %SNEEKTYPE% %SNKVERSION% %SNKREGION% REV:%CurrentRev% SN:%SNKSERIAL%"


::---------EXPLOITCHECK-----------
if /i "%FIRMSTART%" EQU "4.3" goto:exploitcheck
if /i "%FIRMSTART%" EQU "o" goto:exploitcheck
goto:skipexploitcheck

:exploitcheck
if /i "%EXPLOIT%" EQU "T" set "classicCMD=%classicCMD% Twilight"
if /i "%EXPLOIT%" EQU "S" set "classicCMD=%classicCMD% SmashStack"
if /i "%EXPLOIT%" EQU "L" set "classicCMD=%classicCMD% IndianaPwns"
if /i "%EXPLOIT%" EQU "LB" set "classicCMD=%classicCMD% Bathaxx"
if /i "%EXPLOIT%" EQU "LS" set "classicCMD=%classicCMD% ROTJ"
if /i "%EXPLOIT%" EQU "Y" set "classicCMD=%classicCMD% YuGiOwned"
if /i "%EXPLOIT%" EQU "TOS" set "classicCMD=%classicCMD% EriHakawai"
if /i "%EXPLOIT%" EQU "?" set "classicCMD=%classicCMD% AllExploits"
if /i "%EXPLOIT%" EQU "W" set "classicCMD=%classicCMD% MAC:%macaddress%"
:skipexploitcheck

if /i "%GUIDEONLY%" EQU "on" set "classicCMD=%classicCMD% Guide"

::goto:sendCMD

:notAW

::common for abstinence and emunand builder

::THEMES
if /i "%ThemeSelection%" EQU "R" set "classicCMD=%classicCMD% Red"
if /i "%ThemeSelection%" EQU "G" set "classicCMD=%classicCMD% Green"
if /i "%ThemeSelection%" EQU "BL" set "classicCMD=%classicCMD% Blue"
if /i "%ThemeSelection%" EQU "O" set "classicCMD=%classicCMD% Orange"

::Wii CHANNELS
if /i "%PIC%" EQU "Y" set "classicCMD=%classicCMD% PHOTO"
if /i "%MIIQ%" EQU "Y" set "classicCMD=%classicCMD% MII"
if /i "%Shop%" EQU "Y" set "classicCMD=%classicCMD% SHOP"
if /i "%NET%" EQU "Y" set "classicCMD=%classicCMD% NET"
if /i "%Weather%" EQU "Y" set "classicCMD=%classicCMD% WEATHER"
if /i "%NEWS%" EQU "Y" set "classicCMD=%classicCMD% NEWS"
if /i "%Speak%" EQU "Y" set "classicCMD=%classicCMD% SPEAK"

if not "%addwadfolder%"=="" set classicCMD=%classicCMD% WADdir:%addwadfolder%?

if /i "%SNKPLC%" EQU "Y" set "classicCMD=%classicCMD% PLC"
if /i "%SNKOHBC%" EQU "Y" set "classicCMD=%classicCMD% OHBC"
if /i "%SNKCIOS%" EQU "Y" set "classicCMD=%classicCMD% 249"
if /i "%SNKPRI%" EQU "Y" set "classicCMD=%classicCMD% Pri"
if /i "%SNKFLOW%" EQU "Y" set "classicCMD=%classicCMD% FLOW"
if /i "%SNKcBC%" EQU "NMM" set "classicCMD=%classicCMD% NMM"
if /i "%SNKcBC%" EQU "DML" set "classicCMD=%classicCMD% DML"

goto:sendCMD

:notS


::-----------Region Change Wizard----------------
if /i "%MENU1%" NEQ "RC" goto:notregionchange

set "classicCMD=RC %FIRMSTART%%REGION%"

::THEMES
if /i "%ThemeSelection%" EQU "R" set "classicCMD=%classicCMD% Red"
if /i "%ThemeSelection%" EQU "G" set "classicCMD=%classicCMD% Green"
if /i "%ThemeSelection%" EQU "BL" set "classicCMD=%classicCMD% Blue"
if /i "%ThemeSelection%" EQU "O" set "classicCMD=%classicCMD% Orange"

if /i "%GUIDEONLY%" EQU "on" set "classicCMD=%classicCMD% Guide"



goto:sendCMD

:notregionchange




::--------------------------Send CMD to ModMii Classic-------------------------------
:sendCMD

if exist temp\ModMii_Log.bat del temp\ModMii_Log.bat>nul
if exist temp\ModMii_Log_temp.txt del temp\ModMii_Log_temp.txt>nul
if exist temp\ModMii_CMD_LINE_Log.txt del temp\ModMii_CMD_LINE_Log.txt>nul
if exist temp\ModMii_CMD_LINE_Log_Errors.txt del temp\ModMii_CMD_LINE_Log_Errors.txt>nul
if exist temp\ModMii_CMD_LINE_NEEK_Errors.txt del temp\ModMii_CMD_LINE_NEEK_Errors.txt>nul


::if "%OSYS%"=="" (goto:skipforcewait)
::echo @echo off>temp\temp.bat
::echo setlocal>>temp\temp.bat
::echo call support\ModMii.bat %classicCMD% Skin:E>>temp\temp.bat
::start /wait temp\temp.bat
::start support\wizapp PB CLOSE
::goto:FINISH
:::skipforcewait

echo ModMii.exe %classicCMD% Skin:E

ModMii.exe %classicCMD% Skin:E
start support\wizapp PB CLOSE
goto:FINISH



::--------------------------FINISH-------------------------------
:FINISH

if /i "%GUIDEONLY%" EQU "on" goto:MENU


set FINISH=
set waoutnum=
set waoutput=
set wainput=



if /i "%MENU1%" NEQ "S" goto:notS

if /i "%SNEEKSELECT%" NEQ "1" goto:not1
if exist temp\ModMii_CMD_LINE_NEEK_Errors.txt (set problematicDLs=1) else (set problematicDLs=0)

if exist temp\ModMii_CMD_LINE_NEEK_Errors.txt goto:skip
echo %neekname% rev%CurrentRev% installed successfully>temp\ModMii_CMD_LINE_NEEK_Errors.txt



set wafile=temp\ModMii_CMD_LINE_NEEK_Errors.txt
goto:neeknotes
:not1

copy /y "%nandpath%\nandinfo.txt" "temp\nandinfotemp.txt">nul
set wafile=temp\nandinfotemp.txt
findStr /I /C:"Errors " "%wafile%" >nul
IF not ERRORLEVEL 1 (set problematicDLs=1) else (set problematicDLs=0)
if not exist temp\ModMii_CMD_LINE_NEEK_Errors.txt goto:neeknotes
set problematicDLs=1
echo.>>temp\nandinfotemp.txt
echo %neekname% rev%currentrev% not installed properly>>temp\nandinfotemp.txt
goto:skip


:neeknotes


::SNEEK notes & logic copied from ModMii and added display txt file

echo.>>%wafile%
echo CUSTOMIZED NOTES FOR YOUR BUILD OF NEEK:>>%wafile%
echo.>>%wafile%
echo * When launching any form of SNEEK for the first time,>>%wafile%
echo   it could take a long time to load the System Menu,>>%wafile%
echo   but it will be much quicker the second time around.>>%wafile%
echo.>>%wafile%
echo * If you have problems loading your Emulated NAND,>>%wafile%
echo   copy cert.sys from an original nand dump to your>>%wafile%
echo   emulated nand's sys folder.>>%wafile%
echo.>>%wafile%
echo * You can manually override Bootmii to launch neek>>%wafile%
echo   by renaming your BootmiiNeek folder to SD:\Bootmii>>%wafile%
echo   and launching "Bootmii">>%wafile%
echo.>>%wafile%
echo * You can launch uneek (or uneek+DI) without requiring>>%wafile%
echo   an SD Card using USB-Loader GX. USB-Loader GX also>>%wafile%
echo   has an option to copy a console's SYSCONF into your>>%wafile%
echo   current emuNAND (channel) path, so if you add new>>%wafile%
echo   controllers or a balance board to your NAND, use the>>%wafile%
echo   copy SYSCONF feature to also add it to neek's emuNAND.>>%wafile%
echo.>>%wafile%
echo * SD:\Bootmii is not required to launch neek from>>%wafile%
echo   USB-Loader GX. If you use USB-Loader GX's EmuNAND>>%wafile%
echo   neek feature, you can have both SNEEK and UNEEK>>%wafile%
echo   at the same time (with or without DI). ModMii will>>%wafile%
echo   detect SNEEK when installing UNEEK and vice>>%wafile%
echo   versa and ask if you want to overwrite SD files.>>%wafile%
echo   For dual boot you will want only SNEEK files on SD>>%wafile%
echo   and only UNEEK files on USB. The version of NEEK>>%wafile%
echo   that will be loaded is based on your EmuNAND>>%wafile%
echo   location in USB-Loader GX's settings: Sneek if>>%wafile%
echo   on SD, and Uneek if on USB.>>%wafile%
echo.>>%wafile%


if /i "%SNKS2U%" EQU "Y" goto:quickskip
echo * Install the neek2o channel using YAWMM then>>%wafile%
echo   launch the channel in order to start NEEK. You can>>%wafile%
echo   also use this channel to return to your real NAND.>>%wafile%
echo.>>%wafile%
:quickskip

if /i "%SNKS2U%" NEQ "Y" goto:quickskip
echo * Access UNEEK/UNEEK+DI by launching switch2uneek>>%wafile%
echo   from the Homebrew Channel. Alternatively, can use>>%wafile%
echo   YAWMM to install the switch2uneek forwarder channel>>%wafile%
echo   that ModMii saved to your SD card.>>%wafile%
echo.>>%wafile%
:quickskip

if /i "%SNKcBC%" NEQ "DML" goto:skipDMLmsg
echo * Install the DML WAD using YAWMM to your REAL NAND>>%wafile%
echo   in order for your Emulated NAND to use DML.>>%wafile%
echo   DML currently requires SNEEK+DI r157 or higher>>%wafile%
echo   and neek2o has yet to support DML.>>%wafile%
echo.>>%wafile%
:skipDMLmsg



if /i "%SNEEKTYPE%" EQU "S" goto:skipDIComments
if /i "%SNEEKTYPE%" EQU "U" goto:skipDIComments

if /i "%neek2o%" EQU "on" goto:skipDiscexWarning
echo * Warning: you have disabled ModMii's neek2o option>>%wafile%
echo   and have built a DI version of the original neek>>%wafile%
echo   instead. At least 1 game must be saved to your>>%wafile%
echo   usb:/games folder in extracted neek format or>>%wafile%
echo   DI freezes and neek+di will not boot.>>%wafile%
echo.>>%wafile%
:skipDiscexWarning

echo * To add Games to the Game/DI Menu, you can use>>%wafile%
echo   ModMii, WiiBackupManager or wit.exe to extract>>%wafile%
echo   Games in neek format to your FAT32 USB Hard Drive.>>%wafile%
if /i "%neek2o%" EQU "on" echo   neek2o is also able to load standard game file>>%wafile%
if /i "%neek2o%" EQU "on" echo   formats from USB:\WBFS.>>%wafile%
echo.>>%wafile%


echo * When using NEEK+DI you can access>>%wafile%
echo   the Game/DI Menu by pressing "1" on the Wiimote.>>%wafile%
echo   To access other settings (including Region Options),>>%wafile%
echo   you must press "+" from within the DI Menu.>>%wafile%
echo.>>%wafile%

:skipDIComments

echo * ShowMiiWads can be used to decrypt your real>>%wafile%
echo   Wii's Bootmii NAND dump (nand.bin) to use as an>>%wafile%
echo   EmuNAND, and it can add custom channels/WADs>>%wafile%
echo   to an EmuNAND. See ModMii's Download Page 2.>>%wafile%
echo.>>%wafile%
echo * For more SNEEK info, like formatting a USB Hard>>%wafile%
echo   Drive for SNEEK, you can visit: tiny.cc/SNEEK-DI>>%wafile%

goto:skip
:notS



set wafile=temp\ModMii_CMD_LINE_Log.txt

findStr /I /C:"downloaded succcessfully" "temp\ModMii_CMD_LINE_Log.txt" >nul
IF ERRORLEVEL 1 (set problematicDLs=1) else (set problematicDLs=0)
:skip


if /i "%MENU1%" EQU "H" set watext=                       HackMii Solutions Guide~
if /i "%MENU1%" EQU "w" set watext=                            ModMii Wizard~
if /i "%MENU1%" EQU "U" set watext=                     ModMii USB-Loader Setup Guide~
if /i "%MENU1%" EQU "RC" set watext=                         Region Change Guide~


if /i "%MENU1%" NEQ "S" goto:notS
if /i "%SNEEKSELECT%" EQU "1" set watext=                         SNEEK Installation~
if /i "%SNEEKSELECT%" EQU "2" set watext=                        Emulated NAND Builder~
if /i "%AbstinenceWiz%" EQU "Y" set watext=                          Abstinence Wizard~
if /i "%AbstinenceWiz%" EQU "Y" goto:notS
if /i "%SNEEKSELECT%" EQU "3" set watext=    SNEEK Installation and Emulated NAND Builder~
:notS



if /i "%problematicDLs%" EQU "0" (set watext=%watext%~All Downloads Completed Successfully) & (set "wabmp=%SUCCESS.bmp%")
if /i "%problematicDLs%" NEQ "0" (set watext=%watext%~Some Downloads are Invalid, Missing or were Not Updated properly~~Click Next to Retry) & (set "wabmp=%FAIL.bmp%")


if /i "%MENU1%" NEQ "W" goto:notwizard
if /i "%USBCONFIG%" NEQ "USB" set "watext=%watext%~Files saved to: %Drive%"
if /i "%USBCONFIG%" EQU "USB" set "watext=%watext%~Files saved to: %Drive%~and to: %DriveU%"
:notwizard

if /i "%MENU1%" NEQ "U" goto:notusb
if /i "%USBCONFIG%" EQU "USB" set "watext=%watext%~~Files saved to: %DriveU%"
if /i "%USBCONFIG%" NEQ "USB" set "watext=%watext%~~Files saved to: %Drive%"
:notusb


if /i "%MENU1%" NEQ "S" goto:notS
if /i "%SNEEKSELECT%" NEQ "2" goto:not2
if /i "%SNEEKTYPE:~0,1%" EQU "S" set "watext=%watext%~~Files saved to: %Drive%"
if /i "%SNEEKTYPE:~0,1%" NEQ "S" set "watext=%watext%~~Files saved to: %DriveU%"
goto:notS
:not2
if /i "%SNEEKTYPE:~0,1%" EQU "S" set "watext=%watext%~~Files saved to: %Drive%"
if /i "%SNEEKTYPE:~0,1%" NEQ "S" set "watext=%watext%~~Files saved to: %Drive%~and to: %DriveU%"
:notS

if /i "%MENU1%" EQU "H" set "watext=%watext%~~Files saved to: %Drive%"
if /i "%MENU1%" EQU "RC" set "watext=%watext%~~Files saved to: %Drive%"


if /i "%AudioOption%" NEQ "on" goto:noaudio
if /i "%problematicDLs%" EQU "0" (start support\nircmd.exe mediaplay 3000 "%Success.mp3%") else (start support\nircmd.exe mediaplay 3000 "%FAIL.mp3%")
:noaudio


if /i "%problematicDLs%" EQU "0" start /w support\wizapp NOBACK FINISH FT
if /i "%problematicDLs%" NEQ "0" start /w support\wizapp NOBACK FT

if errorlevel 2 goto:MENU
::if errorlevel 1 goto:%BACKB4WPAGELAST%

if /i "%problematicDLs%" EQU "0" goto:MENU

goto:sendCMD
