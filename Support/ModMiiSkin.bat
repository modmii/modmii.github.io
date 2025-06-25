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
set "cmdinput=%cmdinput:"=%"

::ModMii.exe %cmdinput%
start ModMii.exe "%cmdinput%"
Exit

:notcmd

::----------------------------------------------------------

set currentversion=8.0.4
if exist Support\settings.bat call Support\settings.bat
set d2x-bundled=11-beta3
set d2x-beta-rev=%d2x-bundled%
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat

set currentversioncopy=%currentversion%
set agreedversion=
set "WiiPy=Support\wiipy\wiipy.exe"

echo ModMiiSkinCMD v%currentversion%
echo.
echo If you close this window, ModMii Skin will stop working.
echo To hide this window, disable the (V)erbose for ModMii Skin Option (under Other Misc Options)
echo.


NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (set adminmode=Y) else (set adminmode=N)
if /i "%adminmode%" EQU "Y" goto:donecheck

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

set "PATH=%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0"
chcp 437>nul

::in case game dump is left over for interrupted deflicker process, delete it now as it could potentially be pretty large
if exist "temp\witdump" rd /s /q "temp\witdump">nul
if exist "temp\__channel" rd /s /q "temp\__channel"> nul

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
call support\subscripts\Skins.bat
::-----default settings (default applies even if a single variable is missing from settings.bat)------
IF "%ROOTSAVE%"=="" set ROOTSAVE=off
IF "%GUIDEOnly%"=="" set GUIDEOnly=off
IF "%effect%"=="" set effect=No-Spin
IF "%PCSAVE%"=="" set PCSAVE=Auto
::IF "%OPTION1%"=="" set OPTION1=off
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

::IF "%AutoDetectNL%"=="" set AutoDetectNL=
::IF "%AutoDetectDF%"=="" set AutoDetectDF=




::convert drive to absolute path if applicable, and if second char is ":" check if drive exists
if /i "%DRIVE:~1,1%" NEQ ":" set "DRIVE=%cd%\%DRIVE%"
if not exist "%DRIVE:~0,2%" set "DRIVE=%cd%\COPY_TO_SD"

if /i "%DRIVEU:~1,1%" NEQ ":" set "DRIVEU=%cd%\%DRIVEU%"
if not exist "%DRIVEU:~0,2%" set "DRIVEU=%cd%\COPY_TO_USB"




if /i "%ModMiiverbose%" EQU "on" support\nircmd.exe win activate ititle "ModMiiSkinCMD"
if /i "%ModMiiverbose%" EQU "on" support\nircmd.exe win trans ititle "ModMiiSkinCMD" 255

if /i "%debug%" EQU "on" goto:skip
if exist Updatetemp.bat attrib -h Updatetemp.bat
if exist Updatetemp.bat del Updatetemp.bat>nul
if exist temp\updater.bat attrib -h temp\updater.bat
if exist temp\updater.bat del temp\updater.bat>nul
:skip


set watitle=ModMii Skin
set "waico=%skin.ico%"
::set temp=temp
set wabat=temp\wabat.bat
set wasig=ModMii v%currentversion% by XFlak

::side bar - 150x300 pixels
set "wabmp=%default.bmp%"


::check for supporting apps that AVs are known to remove
if not exist support\hexalter.exe (echo One or more of ModMii's supporting files are missing, redownloading...) & (set currentversion=0.0.0) & (goto:UpdateModMii)
if not exist support\nircmd.exe (echo One or more of ModMii's supporting files are missing, redownloading...) & (set currentversion=0.0.0) & (goto:UpdateModMii)
if not exist support\sfk.exe (echo One or more of ModMii's supporting files are missing, redownloading...) & (set currentversion=0.0.0) & (goto:UpdateModMii)
if not exist %WiiPy% (echo One or more of ModMii's supporting files are missing, redownloading...) & (set currentversion=0.0.0) & (goto:UpdateModMii)
::if not exist support\wget.exe (echo One or more of ModMii's supporting files are missing, redownloading...) & (set currentversion=0.0.0) & (goto:UpdateModMii)
::if not exist support\7za.exe (echo One or more of ModMii's supporting files are missing, redownloading...) & (set currentversion=0.0.0) & (goto:UpdateModMii)
if not exist support\jptch.exe (echo One or more of ModMii's supporting files are missing, redownloading...) & (set currentversion=0.0.0) & (goto:UpdateModMii)
if not exist support\WizApp.exe (echo One or more of ModMii's supporting files are missing, redownloading...) & (set currentversion=0.0.0) & (goto:UpdateModMii)


if exist support\skipscam.txt goto:skip
if /i "%agreedversion%" EQU "%currentversion%" goto:skip

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



::get windows version, only 8.1 and above supported effective ModMii 8.0.0
if exist "temp\temp.txt" del "temp\temp.txt">nul
ver>temp\temp.txt
findStr /I /C:" 8.1" "temp\temp.txt" >nul
IF NOT ERRORLEVEL 1 (set winver=9) & (goto:continue)
support\sfk filter -quiet "temp\temp.txt" -rep _*" "__ -rep _"."*__ -write -yes
support\sfk filter -quiet "temp\temp.txt" -no-empty-lines -no-blank-lines -write -yes
set /p winver= <temp\temp.txt
::echo %winver%
if not exist "%homedrive%\Program Files (x86)" goto:winwarning
if /i %winver% GEQ 9 goto:continue
:winwarning
echo ModMii v8.0.0 and above requires 64-bit Windows 8.1 or higher
echo Some ModMii features will not work properly (i.e. NUS downloading, WAD (un)packing, building some non-d2x cIOSs, some EmuNANDs features, theme building, WAD editing, etc.)
echo.

set "wabmp=%default.bmp%"
set watext=ModMii v8.0.0 and above requires 64-bit Windows 8.1 or higher~~Some ModMii features will not work properly (i.e. NUS downloading, WAD (un)packing, building some non-d2x cIOSs, some EmuNANDs features, theme building, WAD editing, etc.)~~Click "Next" to use ModMii anyway.
start /w support\wizapp NOBACK TB
if errorlevel 2 EXIT
::echo Hit any key to use ModMii anyway
::pause>nul

if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set LegacyCIOS=" -write -yes>nul
Set LegacyCIOS=Y
echo Set LegacyCIOS=Y>>Support\settings.bat

set GrabModMii32x=
support\sfk md5 -quiet -verify 0736e14b7ad05a99912e9ba811987335 "ModMii.exe"
if errorlevel 1 set GrabModMii32x=Y

::if exist "%homedrive%\Program Files (x86)" goto:skip
if /i "%GrabModMii32x%" NEQ "Y" goto:skip

echo.
echo Downloading alternate ModMii.exe Launcher to make things a bit better...

set watext=~Downloading alternate ModMii.exe Launcher to make things a bit better...

start support\wizapp PB OPEN

if not exist "temp\ModMii_Launcher_2.4_32bit.zip" support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\ModMii_Launcher_2.4_32bit.zip" "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/ModMii_Launcher_2.4_32bit.zip"

if not exist "temp\ModMii_Launcher_2.4_32bit.zip" (echo Download Failed, use Support\ModMii.bat, ModMii 7.0.3, or upgrade your Windows...) & (goto:32bitfail)

start support\wizapp PB UPDATE 50
support\7za x -aoa "temp\ModMii_Launcher_2.4_32bit.zip" -r ModMii_32bit.exe

if not exist ModMii_32bit.exe (del "temp\ModMii_Launcher_2.4_32bit.zip">nul) & (echo Download Failed, use Support\ModMii.bat, ModMii 7.0.3, or upgrade your Windows...) & (goto:32bitfail)

start support\wizapp PB UPDATE 90
move /y ModMii.exe ModMii_64bit.exe>nul
move /y ModMii_32bit.exe ModMii.exe>nul

start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE
goto:skip

:32bitfail
start support\wizapp PB UPDATE 100
set watext=~~Download Failed, use Support\ModMii.bat, ModMii 7.0.3, or upgrade your Windows...~~Some ModMii features will not work properly~~Click "Next" to use ModMii anyways.

start support\wizapp PB CLOSE
start /w support\wizapp NOBACK TB
if errorlevel 2 EXIT
goto:skip

:continue


::check for "microsoft visual c++ 2015-2022"
::if exist "%homedrive%\Program Files (x86)" (set dlname=hashmyfiles-x64.zip) else (set dlname=hashmyfiles.zip)
set MVCattempt=1
:MVC
if exist "temp\temp.reg" del "temp\temp.reg">nul
if exist "temp\temp.txt" del "temp\temp.txt">nul
if exist "%homedrive%\Program Files (x86)" START /MIN /WAIT REG EXPORT HKLM\SOFTWARE\WOW6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X64 "temp\temp.reg" /Y
if not exist "%homedrive%\Program Files (x86)" START /MIN /WAIT REG EXPORT HKLM\SOFTWARE\WOW6432Node\Microsoft\VisualStudio\14.0\VC\Runtimes\X86 "temp\temp.reg" /Y
::if not exist temp\temp.reg (set MVCversion=0) & (goto:skip)
::cmd /a /c type "temp\temp.reg">"temp\temp.txt"
::support\sfk filter -spat -quiet "temp\temp.txt" -+"Version\x22=" -rep _"*=\x22v"__ -rep _"\x22"__ -write -yes
::set /p MVCversion= <temp\temp.txt
::if exist "temp\temp.txt" del "temp\temp.txt">nul

if exist temp\temp.reg goto:skip

if /i "%MVCattempt%" EQU "2" goto:MVCfail

::missing "microsoft visual c++ 2015-2022"
::https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170&wt.mc_id=studentamb_203301#latest-microsoft-visual-c-redistributable-version
if exist "%homedrive%\Program Files (x86)" set "code2=https://aka.ms/vs/17/release/vc_redist.x64.exe" & set "dlname=vc_redist.x64.exe"
if not exist "%homedrive%\Program Files (x86)" set "code2=https://aka.ms/vs/17/release/vc_redist.x86.exe" & set "dlname=vc_redist.x86.exe"

echo ModMii v8.0.0 and above ^& WiiPy requires Microsoft Visual C++ 2015-2022
echo Downloading and launching installer...
echo.
set "wabmp=%default.bmp%"
set watext=~ModMii v8.0.0 and above as well as WiiPy requires Microsoft Visual C++ 2015-2022~~ModMii will download and start the installer and continue afterwards.

start support\wizapp PB OPEN


support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\%dlname%" "%code2%"

::delete if file is empty (if empty)
>nul findstr "^" "temp\%dlname%" || del "temp\%dlname%"

if exist "temp\%dlname%" goto:MVCinstall

echo Download Failed, check your connection or install it manually
echo Some ModMii features will not work properly (i.e. NUS downloading, WAD (un)packing, building some non-d2x cIOSs, some EmuNANDs features, theme building, WAD editing, etc.)
echo.
::echo Hit any key to use ModMii anyway

start support\wizapp PB UPDATE 100
set watext=Microsoft Visual C++ 2015-2022 Failed to download, check your connection or install it manually~~Some ModMii features will not work properly (i.e. NUS downloading, WAD (un)packing, building some non-d2x cIOSs, some EmuNANDs features, theme building, WAD editing, etc.)~~Click "Next" to use ModMii anyways.

start support\wizapp PB CLOSE
start /w support\wizapp NOBACK TB
if errorlevel 2 EXIT
::pause>nul
goto:skip

:MVCfail
echo Installation Failed, try installing it manually
echo Some ModMii features will not work properly (i.e. NUS downloading, WAD (un)packing, building some non-d2x cIOSs, some EmuNANDs features, theme building, WAD editing, etc.)
echo.
::echo Hit any key to use ModMii anyway

start support\wizapp PB UPDATE 100
set watext=Microsoft Visual C++ 2015-2022 Failed to install, try installing it manually~~Some ModMii features will not work properly (i.e. NUS downloading, WAD (un)packing, building some non-d2x cIOSs, some EmuNANDs features, theme building, WAD editing, etc.)~~Click "Next" to use ModMii anyways.

start support\wizapp PB CLOSE
start /w support\wizapp NOBACK TB
if errorlevel 2 EXIT


::pause>nul
goto:skip

:MVCinstall
start support\wizapp PB UPDATE 50
echo Launching installer and waiting for installation to finish...
echo.
::temp\%dlname% /install /passive /norestart
start /wait temp\%dlname% /install /passive /norestart
echo Rechecking...
echo.
if exist "temp\%dlname%" del "temp\%dlname%">nul
SET /a MVCattempt=%MVCattempt%+1

start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE

goto:MVC

:skip
if exist "temp\temp.reg" del "temp\temp.reg">nul



::recommended d2x version check = "RecD2XcIOS", but check no more than once per day
FOR /F "tokens=*" %%g IN ('support\sfk date') do (SET CurDate=%%g)
if not exist temp\d2xSkinCheck.txt echo whatever>temp\d2xSkinCheck.txt
findStr /I /X /C:"%CurDate% " "temp\d2xSkinCheck.txt" >nul
IF NOT ERRORLEVEL 1 goto:proceed
if exist temp\RecD2XcIOS.txt del temp\RecD2XcIOS.txt>nul
support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\RecD2XcIOS.txt" "https://github.com/xflak/stats/releases/latest/download/skin.txt"

::delete if file is empty (if empty)
if exist "temp\RecD2XcIOS.txt" >nul findstr "^" "temp\RecD2XcIOS.txt" || del "temp\RecD2XcIOS.txt"
if not exist temp\RecD2XcIOS.txt goto:proceed
set /p RecD2XcIOS= <temp\RecD2XcIOS.txt
del "temp\RecD2XcIOS.txt">nul
if exist "Support\settings.bat" support\sfk filter -spat "Support\settings.bat" -ls!"set \x22RecD2XcIOS=" -write -yes>nul
echo Set "RecD2XcIOS=%RecD2XcIOS%">> Support\settings.bat
echo %CurDate% >temp\d2xSkinCheck.txt
:proceed



if /i "%AUTOUPDATE%" EQU "on" goto:UpdateModMii


::-----------------------------Main Menu---------------------------------
:MENU
::calling settings.bat probably is unnecessary here... but a nice 0401 trigger...
set skin=Default
if exist Support\settings.bat call Support\settings.bat
call support\subscripts\Skins.bat

set MENU1=
set waoutnum=0
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
set SNKnswitch=
set PRIIFOUND=
set SNKSERIAL=
set addwadfolder=
set ChannelsMarked=
set SNKMarked=
set AdvancedMarked=
set virginMarked=
set FIRMSTARTMarked=
set consoleMarked=
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


set watext=                           Choose an activity:~~~Start with the ModMii Wizard to softmod your Wii or WiiU. All Wizard activities will build a custom guide for you based on your answers to a few simple questions.


set wainput=ModMii ^&Wizard ^<--Start Here to Mod Your Wii/WiiU;^&USB-Loader Setup Wizard ( Wii / vWii / Wii Mini );^&HackMii Solutions Wizard (Wii);^&Abstinence Wizard (Non-permanent Wii Hacks);Region ^&Change Wizard (Wii);^&Load Download Queue;^&SNEEK Installation and EmuNAND Builder;^&Options ^+ App-Updater ^&^& File-Cleanup;modmii.github.io for more ^&Info, support or to donate!;^&ModMii Classic Mode for many more activities

start /w support\wizapp NOBACK RB

if errorlevel 2 exit

call "%wabat%"

if "%waoutnum%"=="" goto:MENU

if /i "%waoutnum%" EQU "0" (set Menu1=W) & (set "wabmp=%WIZARD.bmp%") & (goto:WPAGE0)

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

set watext=~~              Select an Option to review or change:~~               All Settings will be saved automatically~~More options and info available in ModMii Classic Mode


if /i "%AudioOption%" EQU "on" set wainput= SD Card ^&Drive\Path ^+ App-Updater ^&^& File-Cleanup; ^&USB HDD Drive\Path ^+ App-Updater ^&^& File-Cleanup; ^&PC Programs Save Location: %PCSAVE%; ^&Other Miscellaneous Options; ^&SNEEK Options; Check for ModMii Updates ^&Now; Disable sound at ^&Finish (Currently Enabled); Change ModMii Skin ^&Theme; ^&Restore Default Settings

if /i "%AudioOption%" NEQ "on" set wainput= SD Card ^&Drive\Path ^+ App-Updater ^&^& File-Cleanup; ^&USB HDD Drive\Path ^+ App-Updater ^&^& File-Cleanup; ^&PC Programs Save Location: %PCSAVE%; ^&Other Miscellaneous Options; ^&SNEEK Options; Check for ModMii Updates ^&Now; Enable sound at ^&Finish (Currently Disabled); Change ModMii Skin ^&Theme; ^&Restore Default Settings

start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:MENU


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
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*AudioOption=" -write -yes>nul
echo Set AudioOption=%AudioOption%>> Support\settings.bat
goto:OPTIONS




::--------------------Theme Selector---------------------
:ThemeSelector

if exist temp\skins.txt del temp\skins.txt>nul
set watext=~~~Checking for themes hosted online...
start support\wizapp PB OPEN

::get all list
support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\skins.txt" "https://github.com/modmii/modmii.github.io/tree/master/temp/Skins"

start support\wizapp PB UPDATE 20
support\sfk filter -spat "temp\skins.txt" -rep _\x22path\x22_\x0d\x0a_ -write -yes>nul
support\sfk filter -spat "temp\skins.txt" -and+"Skins/" -and+".zip" -!"Default.zip" -!"Link--primary" -rep _"temp/Skins/"__ -rep _".zip*"__ -rep _*\x22__ -write -yes>nul

start support\wizapp PB UPDATE 40
start support\wizapp PB UPDATE 60


::get local list
dir "Support\Skins" >temp\list.txt
support\sfk filter "temp\list.txt" -and+"<DIR>" -le!"." -rep _*" "__ -write -yes>nul

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

Set watext=~~  Select the ModMii Skin Theme you would like to use:~~Learn how to create and share your own unique themes at https://tiny.cc/modmiitheme

start /w support\wizapp LB SINGLE

if errorlevel 2 goto:MENU
if errorlevel 1 (set wafile=) & (goto:OPTIONS)

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

support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\%SelectedSkin%.zip" "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/Skins/%SelectedSkin%.zip"
start support\wizapp PB UPDATE 60

if exist temp\%SelectedSkin%.zip support\7za e -aoa "temp\%SelectedSkin%.zip" -o"Support\Skins\%SelectedSkin%" *.* -r

start support\wizapp PB UPDATE 80

if exist temp\%SelectedSkin%.zip del temp\%SelectedSkin%.zip>nul

start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE

if exist "Support\Skins\%SelectedSkin%\default.bmp" goto:localskin
if /i "%AudioOption%" NEQ "off" start support\nircmd.exe mediaplay 3000 "%FAIL.mp3%"
goto:OPTIONS



:localskin
set "skin=%SelectedSkin%"

call support\subscripts\Skins.bat

set "wabmp=%OPTIONS.bmp%"
set "waico=%skin.ico%"

if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set skin=" -write -yes>nul
echo set skin=%skin%>> Support\settings.bat
goto:OPTIONS



::--------------------Restore Default Settings---------------------
:RestoreSettings
if exist support\d2x-beta rd /s /q support\d2x-beta


Set LegacyCIOS=N
set KeepInvalidOverride=N
Set AutoDetectNL=
Set AutoDetectDF=
Set WiiPyInfo=
Set ODBinfo=

if not exist Support\settings_skipped_apps.txt goto:notall
::Loop through the following once for EACH line in *.txt
for /F "tokens=*" %%A in (Support\settings_skipped_apps.txt) do call :SkipUpdateList4 %%A
goto:quickskip
:SkipUpdateList4
set CurrentApp=%*
::strip out colons before and after app name
set CurrentApp=%CurrentApp:~1,-1%
if exist "%DRIVE%\apps\%CurrentApp%\SkipModMiiUpdates.txt" del "%DRIVE%\apps\%CurrentApp%\SkipModMiiUpdates.txt">nul
if exist "%DRIVE%\wiiu\apps\%CurrentApp%\SkipModMiiUpdates.txt" del "%DRIVE%\wiiu\apps\%CurrentApp%\SkipModMiiUpdates.txt">nul
goto:EOF
:quickskip
::if exist "Support\settings_skipped_apps.txt" del "Support\settings_skipped_apps.txt">nul
::copy /y NUL "Support\settings_skipped_apps.txt">nul

::by default legacy apps are disabled (107 at present) less retroarch which should be updated later in 2025 (but will continue to exclude more_ra_arcade & more_ra_cores which are relatively large downloads)

powershell echo "?100_Boxes_Wiiu?`n?AM64DSPatcher?`n?AocPatcher?`n?asturoids?`n?Bloopair?`n?cave?`n?cbhc?`n?cfwbooter?`n?CHIP8?`n?clock?`n?CloseHBL?`n?controller-test?`n?Crispy-Doom?`n?ddd?`n?diibugger?`n?disc2app?`n?disc2appWUTPort?`n?drc-test?`n?Fake-08?`n?fireplace-nx-wiiu?`n?flappy_bird?`n?flappy_bird_3d?`n?fsdumper?`n?ft2sd?`n?ftpiiu-cbhc?`n?ftpiiu?`n?ftpiiu_everywhere?`n?fuckyoustick?`n?gacubeboy?`n?GamepadTester?`n?gbiine?`n?geckiine?`n?haxchi?`n?HBL_Dpad?`n?hbl2hbc?`n?hid_keyboard_monitor?`n?hidtest?`n?hidtovpad?`n?homebrew_launcher?`n?IOSreboot?`n?iosuotp?`n?jezzballu?`n?keyboard_example?`n?lameIRCU?`n?LiveSynthesisU?`n?loadiine_gx2?`n?loadiine_gx2_y?`n?MegaZeux?`n?menu_sort?`n?Minesweeper_WiiU?`n?mocha?`n?mocha_fat32?`n?mocha_fshax?`n?mocha_sd_access?`n?more_ra_arcade?`n?more_ra_cores?`n?nanddumper?`n?nnupatcher?`n?Opensupaplex?`n?otp2sd?`n?ourloader?`n?PacmanGX2?`n?Pokemini?`n?PokeMiniU?`n?pong?`n?RemotePad?`n?savemii?`n?savemii_inject_mod?`n?saviine?`n?SDcafiine?`n?SDGeckiine?`n?seeprom2sd?`n?shutdown-hbl?`n?sign_c2w_patcher?`n?sigpatcher2HBL?`n?sigpatcher2sysmenu?`n?Simple_SDL_Snake?`n?sm4sh2sd?`n?snake?`n?spacegame?`n?spiik?`n?SuDokuL?`n?swapdrc?`n?swapdrc_lite?`n?swipswapme?`n?TetrisU?`n?tictactoe?`n?tik2sd?`n?timingu?`n?u-paint?`n?Uclick?`n?UFDiine?`n?UselessHomebrew?`n?VidChanger?`n?vwii-compat-installer?`n?vWii-NAND-Restorer?`n?vWii_decaffeinator?`n?WiiAlarmU?`n?wiiu-vnc?`n?wim?`n?wudump?`n?wup_installer_gx2?`n?wup_installer_gx2_mod?`n?wuphax?`n?wupinstaller?`n?wupymod?`n?yapesdl?">Support\settings_skipped_apps.txt

:notall



set ROOTSAVE=off
set effect=No-Spin
set PCSAVE=Auto
::set OPTION1=off
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
set "ModMiiverboseOld=%ModMiiverbose%"
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
set "splash.png=Support\Skins\Default\splash.png"

set "wabmp=%OPTIONS.bmp%"
set "waico=%skin.ico%"
::Set RecD2XcIOS=


echo ::ModMii Settings > Support\settings.bat
echo Set ROOTSAVE=%ROOTSAVE%>> Support\settings.bat
echo Set effect=%effect%>> Support\settings.bat
echo Set PCSAVE=%PCSAVE%>> Support\settings.bat
::echo Set Option1=%Option1%>> Support\settings.bat
echo Set AudioOption=%AudioOption%>> Support\settings.bat
echo Set hermesOPTION=%hermesOPTION%>> Support\settings.bat
echo Set CMIOSOPTION=%CMIOSOPTION%>> Support\settings.bat
echo Set FWDOPTION=%FWDOPTION%>> Support\settings.bat
echo Set ExtraProtectionOPTION=%ExtraProtectionOPTION%>> Support\settings.bat

::HARDCODED Defaults
echo Set "Drive=COPY_TO_SD">> Support\settings.bat
echo Set "DriveU=COPY_TO_USB">> Support\settings.bat

echo Set ACTIVEIOS=%ACTIVEIOS%>> Support\settings.bat
echo Set AUSKIP=%AUSKIP%>> Support\settings.bat
echo Set AUTOUPDATE=%AUTOUPDATE%>> Support\settings.bat
echo Set ModMiiverbose=%ModMiiverbose%>> Support\settings.bat
echo Set SSD=%SSD%>> Support\settings.bat
echo Set sneekverbose=%sneekverbose%>> Support\settings.bat
echo Set neek2o=%neek2o%>> Support\settings.bat
echo Set SNKFONT=%SNKFONT%>> Support\settings.bat
echo Set skin=%skin%>> Support\settings.bat

if not "%RecD2XcIOS%"=="" echo Set "RecD2XcIOS=%RecD2XcIOS%">> Support\settings.bat

if not "%AutoDetectNL%"=="" echo set AutoDetectNL=%AutoDetectNL%>> Support\settings.bat
if not "%AutoDetectDF%"=="" echo set AutoDetectDF=%AutoDetectDF%>> Support\settings.bat

if /i "%KeepInvalidOverride%" EQU "Y" echo set KeepInvalidOverride=Y>> Support\settings.bat
if not "%LegacyCIOS%"=="" echo set LegacyCIOS=%LegacyCIOS%>> Support\settings.bat

if /i "%WiiPyInfo%" EQU "Y" echo set WiiPyInfo=Y>> Support\settings.bat
if /i "%ODBinfo%" EQU "Y" echo set ODBinfo=Y>> Support\settings.bat
if /i "%debug%" EQU "on" echo set debug=on>> Support\settings.bat

echo set AGREEDVERSION=%currentversion%>> Support\settings.bat
if /i "%redtext%" NEQ "Red" echo set "redtext=%redtext%">> Support\settings.bat
if /i "%bluetext%" NEQ "Blue" echo set "bluetext=%bluetext%">> Support\settings.bat
if /i "%yellowtext%" NEQ "Yellow" echo set "yellowtext=%yellowtext%">> Support\settings.bat
if /i "%Greentext%" NEQ "Green" echo set "greentext=%greentext%">> Support\settings.bat
if /i "%Magentatext%" NEQ "Magenta" echo set "magentatext=%magentatext%">> Support\settings.bat
if /i "%cyantext%" NEQ "Cyan" echo set "cyantext=%cyantext%">> Support\settings.bat
if /i "%backgroundcolor%" NEQ "1" echo set "backgroundcolor=%backgroundcolor%">> Support\settings.bat
if /i "%whitetext%" NEQ "f" echo set "whitetext=%whitetext%">> Support\settings.bat

if /i "%ModMiiverbose%" EQU "%ModMiiverboseOld%" goto:skip
::make cmd window transparent and hidden
support\nircmd.exe win trans ititle "ModMiiSkinCMD" 0
support\nircmd.exe win hide ititle "ModMiiSkinCMD"
:skip

::Enable recommended d2x instead of default\bundled (if they differ)
if "%RecD2XcIOS%"=="" goto:OPTIONS
::set RecD2XcIOS=d2x-v10-beta52
if /i "%d2x-bundled%" EQU "%RecD2XcIOS:~5%" goto:OPTIONS

echo Enabling recommended d2x cIOS (%RecD2XcIOS:~5%) instead of default\bundled (%d2x-bundled%)
echo This can always be customized in ModMii's d2x Options
echo.
if exist "support\More-cIOSs\%RecD2XcIOS%\d2x-beta.bat" goto:pickup

support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\%RecD2XcIOS%.zip" "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/d2x/%RecD2XcIOS%.7z"
echo.

::delete if file is empty
>nul findstr "^" "temp\%RecD2XcIOS%.zip" || del "temp\%RecD2XcIOS%.zip"

if not exist "temp\%RecD2XcIOS%.zip" goto:badkey
if not exist "support\More-cIOSs\%RecD2XcIOS%" mkdir "support\More-cIOSs\%RecD2XcIOS%"
support\7za e -aoa "temp\%RecD2XcIOS%.zip" -o"support\More-cIOSs\%RecD2XcIOS%" *.* -r
echo.
del "temp\%RecD2XcIOS%.zip">nul
if not exist "support\More-cIOSs\%RecD2XcIOS%\d2x-beta.bat" (rd /s /q "support\More-cIOSs\%RecD2XcIOS%") & (goto:badkey)

:pickup
if exist support\d2x-beta rd /s /q support\d2x-beta
mkdir support\d2x-beta
copy /y "support\More-cIOSs\%RecD2XcIOS%\*" "support\d2x-beta">nul
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
::if /i "%d2x-beta-rev%" EQU "%RecD2XcIOS:~5%" (echo %RecD2XcIOS% cIOS successfully enabled!) else (goto:badkey)
if /i "%d2x-beta-rev%" NEQ "%RecD2XcIOS:~5%" goto:badkey
::@ping 127.0.0.1 -n 4 -w 1000> nul
goto:OPTIONS

:badkey
echo Something went wrong, %RecD2XcIOS% cIOS not enabled...
::@ping 127.0.0.1 -n 4 -w 1000> nul
goto:OPTIONS



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

if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*PCSAVE=" -write -yes>nul
echo Set PCSAVE=%PCSAVE%>> Support\settings.bat

goto:Options




::..................................................OtherOptions.................................................. 
.......
:OtherOptions
set waoutnum=
set waoutput=

set watext=~~~~                   Other Miscellaneous Options

::option1 disabled
::set wainput= ^&Auto-Update ModMii at program start; c^&MIOS included with recommended Wii cIOSs; USB-Loader ^&Forwarder included in Wizard; ^&Update Active IOSs in Wizard/SysCheck-Updater; ^&Verbose for ModMii Skin and nandBinCheck; ^&Hermes Wii cIOSs will also be recommended; ^&Extra Brick Protection in ModMii Wizard Wii Guides; Save 0000000^&1 folder for IOSs\SMs\etc; Save ^&NUS\00000001x folder for IOSs\SMs\etc; ^&Generate Guide Only (only for functions with guides)

set wainput= ^&Auto-Update ModMii at program start; c^&MIOS included with recommended Wii cIOSs; USB-Loader ^&Forwarder included in Wizard; ^&Update Active IOSs in Wizard/SysCheck-Updater; ^&Verbose for ModMii Skin and nandBinCheck; ^&Hermes Wii cIOSs will also be recommended; ^&Extra Brick Protection in ModMii Wizard Wii Guides; ^&Generate Guide Only (only for functions with guides)



::check correct boxes
set waoutput=
if /i "%AUTOUPDATE%" EQU "on" set waoutput=%waoutput%; #Auto-Update ModMii at program start
if /i "%CMIOSOPTION%" EQU "on" set waoutput=%waoutput%; c#MIOS included with recommended Wii cIOSs
if /i "%FWDOPTION%" EQU "on" set waoutput=%waoutput%; USB-Loader #Forwarder included in Wizard
if /i "%ACTIVEIOS%" EQU "on" set waoutput=%waoutput%; #Update Active IOSs in Wizard\SysCheck-Updater
if /i "%ModMiiverbose%" EQU "on" set waoutput=%waoutput%; #Verbose for ModMii Skin and nandBinCheck
if /i "%hermesOPTION%" EQU "on" set waoutput=%waoutput%; #Hermes Wii cIOSs will also be recommended
if /i "%ExtraProtectionOPTION%" EQU "on" set waoutput=%waoutput%; #Extra Brick Protection in ModMii Wizard Wii Guides

::if /i "%Option1%" EQU "on" set waoutput=%waoutput%; Save 0000000#1 folder for IOSs\SMs\etc
::if /i "%Option1%" EQU "all" set waoutput=%waoutput%; Save 0000000#1 folder for IOSs\SMs\etc

::if /i "%Option1%" EQU "nus" set waoutput=%waoutput%; Save #NUS\00000001x folder for IOSs\SMs\etc
::if /i "%Option1%" EQU "all" set waoutput=%waoutput%; Save #NUS\00000001x folder for IOSs\SMs\etc

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
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*AUTOUPDATE=" -write -yes>nul
echo Set AUTOUPDATE=%AUTOUPDATE%>> Support\settings.bat

findStr /I /C:"1" "%wabat%" >nul
IF not ERRORLEVEL 1 (set CMIOSOPTION=on) else (set CMIOSOPTION=off)
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*CMIOSOPTION=" -write -yes>nul
echo Set CMIOSOPTION=%CMIOSOPTION%>> Support\settings.bat

findStr /I /C:"2" "%wabat%" >nul
IF not ERRORLEVEL 1 (set FWDOPTION=on) else (set FWDOPTION=off)
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*FWDOPTION=" -write -yes>nul
echo Set FWDOPTION=%FWDOPTION%>> Support\settings.bat

findStr /I /C:"3" "%wabat%" >nul
IF not ERRORLEVEL 1 (set ACTIVEIOS=on) else (set ACTIVEIOS=off)
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*ACTIVEIOS=" -write -yes>nul
echo Set ACTIVEIOS=%ACTIVEIOS%>> Support\settings.bat


set "ModMiiverboseOld=%ModMiiverbose%"
findStr /I /C:"4" "%wabat%" >nul
IF not ERRORLEVEL 1 (set ModMiiverbose=on) else (set ModMiiverbose=off)
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*ModMiiverbose=" -write -yes>nul
echo Set ModMiiverbose=%ModMiiverbose%>> Support\settings.bat

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
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*hermesOPTION=" -write -yes>nul
echo Set hermesOPTION=%hermesOPTION%>> Support\settings.bat

findStr /I /C:"6" "%wabat%" >nul
IF not ERRORLEVEL 1 (set ExtraProtectionOPTION=on) else (set ExtraProtectionOPTION=off)
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*ExtraProtectionOPTION=" -write -yes>nul
echo Set ExtraProtectionOPTION=%ExtraProtectionOPTION%>> Support\settings.bat

::option1 disabled (7 and 8 removed, so guide changed from 9 to 7)

findStr /I /C:"7" "%wabat%" >nul
IF not ERRORLEVEL 1 (set GuideOnly=on) else (set GuideOnly=off)
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*GuideOnly=" -write -yes>nul
echo Set GuideOnly=%GuideOnly%>> Support\settings.bat

::::turn 2 options into 1
::findStr /I /C:"7" "%wabat%" >nul
::IF not ERRORLEVEL 1 (set Option1=on) else (set Option1=off)

::findStr /I /C:"8" "%wabat%" >nul
::IF not ERRORLEVEL 1 (set Option1temp=nus) else (set Option1temp=)

::if /i "%Option1%" NEQ "on" goto:skip
::if /i "%Option1temp%" EQU "nus" (set Option1=all) else (set Option1=on)
::goto:skipcheck
:::skip
::if /i "%Option1temp%" EQU "nus" (set Option1=nus) else (set Option1=off)

:::skipcheck

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
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*neek2o=" -write -yes>nul
echo Set neek2o=%neek2o%>> Support\settings.bat

findStr /I /C:"1" "%wabat%" >nul
IF not ERRORLEVEL 1 (set SSD=on) else (set SSD=off)
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*SSD=" -write -yes>nul
echo Set SSD=%SSD%>> Support\settings.bat

findStr /I /C:"2" "%wabat%" >nul
IF not ERRORLEVEL 1 (set sneekverbose=on) else (set sneekverbose=off)
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*sneekverbose=" -write -yes>nul
echo Set sneekverbose=%sneekverbose%>> Support\settings.bat

set SNKFONT=B
findStr /I /C:"3" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKFONT=W

findStr /I /C:"4" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKFONT=R

if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*SNKFONT=" -write -yes>nul
echo Set SNKFONT=%SNKFONT%>> Support\settings.bat

goto:Options



::...................................Wizard Page0 - Console Type...............................
:WPAGE0
set FIRMSTART=
set ctype=
set waoutnum=
::same var used for SM version

::recall checked items
if not "%consoleMarked%"=="" set waoutnum=%consoleMarked%

set watext=        What console would you like to softmod?~* Wii modding requires an SD card and does not need internet on the Wii; or, if without an SD Card a hard drive can be used in its place for most things but then the Wii will need internet access for the initial modding process.~* WiiU modding needs an SD ^& internet on the console.~* vWii Only mods need an SD Card ^& internet on the WiiU; or if without internet an SD ^& 1 of 6 specific games.

set wainput= ^&Wii; Wii^&U and vWii (virtual Wii on WiiU); WiiU ^&Only (no vWii mods); ^&vWii Only (no WiiU mods)


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:MENU

call "%wabat%"

set consoleMarked=%waoutnum%

if /i "%waoutnum%" EQU "2" goto:skipall
if /i "%waoutnum%" EQU "0" goto:skipcheck

if not exist "Support\d2x-beta\" goto:skipcheck
if not exist "Support\d2x-beta\ciosmaps_vWii.xml" goto:switch

::check ciosmaps_vWii.xml for 'base ios="38"'
findStr /I /C:"base ios=\"38\"" "Support\d2x-beta\ciosmaps_vWii.xml" >nul
IF NOT ERRORLEVEL 1 goto:skipcheck


::need to switch d2x version
:switch


if "%RecD2XcIOS%"=="" goto:Defaultd2x

::recommended d2x

set watext=~Warning! d2x-v%d2x-beta-rev% is not fully supported for vWii, click next to switch to recommended d2x version (v%RecD2XcIOS:~5%)~~This can be changed back later in ModMii Classic's Options menu

start /w support\wizapp TB
if errorlevel 2 goto:MENU
if errorlevel 1 goto:WPAGE0

if /i "%d2x-bundled%" EQU "%RecD2XcIOS:~5%" goto:clearD2X

::download and extract recommended d2x beta
echo Enabling %RecD2XcIOS%...
if exist "support\More-cIOSs\%RecD2XcIOS%\d2x-beta.bat" goto:pickup
support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\%RecD2XcIOS%.zip" "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/d2x/%RecD2XcIOS%.7z"

::delete if file is empty
>nul findstr "^" "temp\%RecD2XcIOS%.zip" || del "temp\%RecD2XcIOS%.zip"

if not exist "temp\%RecD2XcIOS%.zip" (echo Failed to download %RecD2XcIOS%, reverting to bundled v%d2x-bundled% instead...) & (goto:clearD2X)
if not exist "support\More-cIOSs\%RecD2XcIOS%" mkdir "support\More-cIOSs\%RecD2XcIOS%"
support\7za e -aoa "temp\%RecD2XcIOS%.zip" -o"support\More-cIOSs\%RecD2XcIOS%" *.* -r
del "temp\%RecD2XcIOS%.zip">nul
if not exist "support\More-cIOSs\%RecD2XcIOS%\d2x-beta.bat" (rd /s /q "support\More-cIOSs\%RecD2XcIOS%") & (echo Failed to download %RecD2XcIOS%, reverting to bundled v%d2x-bundled% instead...) & (goto:clearD2X)

:pickup
if exist support\d2x-beta rd /s /q support\d2x-beta
mkdir support\d2x-beta
copy /y "support\More-cIOSs\%RecD2XcIOS%\*" "support\d2x-beta">nul
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if /i "%d2x-beta-rev%" NEQ "%RecD2XcIOS:~5%" (echo Failed to download %RecD2XcIOS%, reverting to bundled v%d2x-bundled% instead...) & (goto:clearD2X)
echo %RecD2XcIOS% Enabled
goto:skipcheck




:Defaultd2x
set watext=~Warning! d2x-v%d2x-beta-rev% is not fully supported for vWii, click next to revert to default d2x version (v%d2x-bundled%)~~This can be changed back later in ModMii Classic's Options menu
start /w support\wizapp TB
if errorlevel 2 goto:MENU
if errorlevel 1 goto:WPAGE0
:clearD2X
set "d2x-beta-rev=%d2x-bundled%"
if exist support\d2x-beta rd /s /q support\d2x-beta
echo d2x-v%d2x-beta-rev% Enabled
:skipcheck




::check if d2x version is customized and offer to revert to default
call support\subscripts\defaultd2xSkin.bat
if /i %errorlevel% EQU 1 goto:WPAGE0

:skipall

if /i "%waoutnum%" EQU "0" (set FIRMSTART=W) & (set ctype=Wii) & (goto:WPAGE1)
if /i "%waoutnum%" EQU "1" (set FIRMSTART=U2) & (set ctype=WiiU) & (goto:WPAGE20)
if /i "%waoutnum%" EQU "2" (set FIRMSTART=U) & (set ctype=WiiU) & (set BACKB4WPAGELAST=WPAGE0) & (goto:WPAGELAST)
if /i "%waoutnum%" EQU "3" (set FIRMSTART=V) & (set ctype=WiiU) & (goto:WPAGE20)


if "%FIRMSTART%"=="" goto:WPAGE0



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
if "%VIRGINMarked%"=="" set waoutnum=0

set watext=Would you like to (re)install all recommended softmods?~~Note: Only answer No if you know specifically what you want to update.~~Alternatively, you can check if there are any recommended changes to the mods already on your Wii using ModMii Classic's SysCheck Updater Wizard.

set wainput= ^&Yes; ^&No

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:WPAGE0


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
:nohelp
goto:WPAGE2



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

if /i "%FIRMSTART%" NEQ "U2" if /i "%FIRMSTART%" NEQ "v" goto:skip
set watext=~~                What is your System Menu Region?~~Note: to check this on your WiiU click the System Settings button from the main system menu then you should see the version in the top right of the screen (e.g. 5.2.0U, 5.2.0J, 5.2.0E)
:skip


if /i "%MENU1%" EQU "RC" set watext=~~~~          What Region would you like to change to?



set wainput= ^&U (USA); ^&E (Euro\PAL); ^&J (JPN); ^&K (Korean); ^&Instructional video to check System Menu Region
if /i "%ctype%" EQU "WiiU" set wainput= ^&U (USA); ^&E (Euro\PAL); ^&J (JPN)
if /i "%MENU1%" EQU "RC" set wainput= ^&U (USA); ^&E (Euro\PAL); ^&J (JPN); ^&K (Korean)


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU

if not errorlevel 1 goto:notback
if /i "%MENU1%" EQU "RC" goto:RCPAGE1
if /i "%ctype%" EQU "WiiU" (goto:WPAGE20) else (goto:WPAGE2)
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

if /i "%FIRMSTART%" EQU "U2" goto:U2
if /i "%FIRMSTART%" EQU "v" goto:vWii

::Wii
if /i "%REGION%" EQU "U" goto:WPAGE3C
if /i "%REGION%" EQU "E" goto:WPAGE3C
if /i "%REGION%" EQU "K" goto:WPAGE3C
if /i "%REGION%" EQU "J" goto:WPAGE3C

:U2
if /i "%REGION%" EQU "U" goto:WPAGE21
if /i "%REGION%" EQU "E" goto:WPAGE21
if /i "%REGION%" EQU "J" goto:WPAGE21
goto:notvWii


:vWii
if /i "%REGION%" EQU "U" goto:WPAGE3Cv
if /i "%REGION%" EQU "E" goto:WPAGE3Cv
if /i "%REGION%" EQU "J" goto:WPAGE3Cv
:notvWii

if /i "%REGION%" NEQ "Help" goto:nohelp
if /i "%FIRMSTART%" EQU "U2" goto:nohelp
if /i "%FIRMSTART%" EQU "v" goto:nohelp
start https://www.youtube.com/embed/1Z2MtFcllTY
goto:WPAGE3
:nohelp




::...................................Wizard Page3C - Exploit...............................
:WPAGE3Cv
set waoutnum=
set waoutput=
SET EXPLOIT=default
set exploitselection=yes

::recall checked items, EXPLOIT & EXPLOITMarked shared with :WPAGE3C
if not "%EXPLOITMarked%"=="" set waoutnum=%EXPLOITMarked%

set watext=~~~~Select the exploit you would like to use to mod your vWii.

set wainput= Browser (no disc needed but needs internet on vWii); ^&Super Smash Brothers Brawl; LEGO ^&Indiana Jones; LEGO ^&Batman; LEGO Star ^&Wars; ^&Yu-Gi-Oh! 5D's; ^&Tales of Symphonia: Dawn of the New World; ^&All Above Exploits (decide later)

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU

if errorlevel 1 goto:WPAGE3

call "%wabat%"

set EXPLOITMarked=%waoutnum%

if "%waoutnum%"=="" goto:WPAGE3Cv

if /i "%waoutnum%" EQU "0" set EXPLOIT=BE
if /i "%waoutnum%" EQU "1" set EXPLOIT=S
if /i "%waoutnum%" EQU "2" set EXPLOIT=L
if /i "%waoutnum%" EQU "3" set EXPLOIT=LB
if /i "%waoutnum%" EQU "4" set EXPLOIT=LS
if /i "%waoutnum%" EQU "5" set EXPLOIT=Y
if /i "%waoutnum%" EQU "6" set EXPLOIT=TOS
if /i "%waoutnum%" EQU "7" set EXPLOIT=?
goto:WPAGE21




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
if /i "%REGION%" EQU "K" set wainput= ^&str2hax (no disc\SD needed, requires internet on Wii); ^&Twilight Princess: The Legend of Zelda; ^&Super Smash Brothers Brawl; ^&All Above Exploits (decide later)
if /i "%REGION%" NEQ "K" set wainput= ^&str2hax (no disc\SD needed, requires internet on Wii); ^&Twilight Princess: The Legend of Zelda; ^&Super Smash Brothers Brawl; LEGO ^&Indiana Jones; LEGO ^&Batman; LEGO Star ^&Wars; ^&Yu-Gi-Oh! 5D's; Tales of Symphonia: ^&Dawn of the New World; ^&All Above Exploits (decide later)
goto:skip4.3

:list4.3
if /i "%REGION%" EQU "K" set wainput= ^&str2hax (no disc\SD needed, requires internet on Wii); ^&Wilbrand (no disc needed, but requires SD card); ^&Super Smash Brothers Brawl; ^&All Above Exploits (decide later)
if /i "%REGION%" NEQ "K" set wainput= ^&str2hax (no disc\SD needed, requires internet on Wii); ^&Wilbrand (no disc needed, but requires SD card); ^&Super Smash Brothers Brawl; LEGO ^&Indiana Jones; LEGO ^&Batman; LEGO Star ^&Wars; ^&Yu-Gi-Oh! 5D's; ^&Tales of Symphonia: Dawn of the New World; ^&All Above Exploits (decide later)
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

set watext=            Select your desired System Menu.~~* ModMii recommends against unnecessarily changing system menus if already on 4.1 or higher.~* System Menu 4.2 and 4.3 add nothing except failed attempts to prevent homebrew.


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


set watext=               Select which of the following channels~                          you would like to install~~Note: since Nintendo has shut down WiiConnect24 other channels like News, Wii Speak, etc. require WiiLink. These can be installed later using the WiiLink Patcher from ModMii Classic's Download Page 5 or https://wiilink24.com


::set wainput= ^&Photo; ^&Mii; ^&Shop (with IOS56); ^&Internet; ^&Weather^^; ^&News^^; ^&Wii Speak^^^^
set wainput= ^&Photo v1.1 (including required HAZA dummy); ^&Mii; ^&Shop (with IOS56); ^&Internet

if /i "%MENU1%" EQU "S" (set REGIONTEMP=%SNKREGION%) else (set REGIONTEMP=%REGION%)

if /i "%REGIONTEMP%" EQU "K" set wainput= ^&Photo v1.1 (including required HAZA dummy); ^&Mii; ^&Shop (with IOS56)

if /i "%MENU1%" NEQ "S" goto:notS
::set wainput= ^&Photo; ^&Mii; ^&Shop; ^&Internet; ^&Weather^^; ^&News^^; ^&Wii Speak^^^^
set wainput= ^&Photo v1.1 (including required HAZA dummy); ^&Mii; ^&Shop; ^&Internet
if /i "%REGIONTEMP%" EQU "K" set wainput= ^&Photo v1.1 (including required HAZA dummy); ^&Mii; ^&Shop
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

if /i "%CMIOSOPTION%" EQU "on" set wainput= ^&Homebrew Channel and\or Bootmii; ^&Recommended cIOSs and cMIOS; ^&Priiloader (and System Menu hacks); ^&System Menu Theme; ^&USB-Loader; ^&Active IOSs and patched System Menu IOSs

if /i "%CMIOSOPTION%" NEQ "on" set wainput= ^&Homebrew Channel and\or Bootmii; ^&Recommended cIOSs; ^&Priiloader (and System Menu hacks); System Menu ^&Theme; ^&USB-Loader; ^&Active IOSs and patched System Menu IOSs


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
set waoutnum=6
set waoutput=

if /i "%SNEEKSELECT%" NEQ "5" goto:nocheck
if "%SMTHEMEAPP%"=="" goto:WPAGE5
:nocheck


::recall checked items
if not "%ThemeSelectionMarked%"=="" set waoutnum=%ThemeSelectionMarked%

if /i "%ctype%" NEQ "WiiU" set watext=~~~   Would you like to install a custom Theme on your Wii?~~    Choose from 3 effects: No-Spin, Spin and Fast-Spin

if /i "%ctype%" EQU "WiiU" set watext=Would you like to install a custom vWii theme or fix* the aspect ratio for EverybodyVotes ^& CheckMiiOut channels?~~*43DB fixes included in all vWii themes built by ModMii, including the boring Default, and any csm's built by user provided *.mym themes~~    Choose from 3 effects: No-Spin, Spin and Fast-Spin

set wainput= View Themes and Channel Effects on ^&Youtube; Change Channel ^&Effect - Current Effect: %effect%; DarkWii ^&Red Theme - %effect%; DarkWii ^&Green Theme - %effect%; DarkWii ^&Blue Theme - %effect%; DarkWii ^&Orange Theme - %effect%; ^&No, do not change the theme; ^&Default theme, restore original theme
if /i "%ctype%" EQU "WiiU" set "wainput=%wainput% && apply 43DB fix"


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
if /i "%MENU1%" NEQ "W" goto:notback
if /i "%ctype%" EQU "WiiU" goto:WPAGE0
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
if /i "%waoutnum%" EQU "7" set ThemeSelection=D

if "%ThemeSelection%"=="" goto:WPAGE20

if /i "%ThemeSelection%" NEQ "WWW" goto:novid
start https://modmii.github.io/WiiThemes.html
goto:WPAGE20
:novid

if /i "%ThemeSelection%" NEQ "CE" goto:SkipOptionCEwizard
if /i "%effect%" EQU "no-spin" (set effect=Spin) & (support\sfk filter Support\settings.bat -ls!"Set effect=" -write -yes>nul) & (echo Set effect=Spin>>Support\settings.bat) & (goto:WPAGE20)
if /i "%effect%" EQU "spin" (set effect=Fast-Spin) & (support\sfk filter Support\settings.bat -ls!"Set effect=" -write -yes>nul) & (echo Set effect=Fast-Spin>>Support\settings.bat) & (goto:WPAGE20)
if /i "%effect%" EQU "fast-spin" (set effect=No-Spin) & (support\sfk filter Support\settings.bat -ls!"Set effect=" -write -yes>nul) & (echo Set effect=No-Spin>>Support\settings.bat) & (goto:WPAGE20)
:SkipOptionCEwizard

::next
if /i "%SNEEKSELECT%" NEQ "5" goto:miniskip
if /i "%ThemeSelection%" EQU "D" goto:WPAGE5
:miniskip

if /i "%MENU1%" EQU "RC" (set BACKB4DRIVE=WPAGE20) & (goto:DriveChange)

if /i "%MENU1%" EQU "S" (set backB4wpageLast=WPAGE20) & (goto:WPAGELAST)

::Wizard

if /i "%ctype%" EQU "WiiU" goto:WPAGE3

if /i "%VIRGIN%" EQU "Y" goto:WPAGE21
if /i "%USBGUIDE%" EQU "Y" (goto:UPAGE1b) else (goto:DRIVECHANGE)



::...................................Wizard Page21 - USB Loader Setup Q...............................
:WPAGE21
set USBGUIDE=
set waoutnum=0
set waoutput=

::recall checked items
if not "%USBGUIDEMarked%"=="" set waoutnum=%USBGUIDEMarked%

set watext=~Would you like to set up a USB-Loader now?~~Notes:~USB-Loaders allow the Wii to play games off a USB Hard Drive or SD Card. This step can always be done by itself later on from ModMii's Main Menu.

set wainput= ^&Yes; ^&No

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if not errorlevel 1 goto:notback
if /i "%FIRMSTART%" EQU "U2" goto:WPAGE3
if /i "%FIRMSTART%" EQU "V" goto:WPAGE3Cv
goto:WPAGE20
:notback

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
::if /i "%MENU1%" EQU "O" goto:notback
if /i "%MENU1%" EQU "O" set BACKB4DRIVE=options
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

set "DRIVETEMP=%DRIVETEMP:/=\%"

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
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*Drive=" -write -yes>nul
echo Set "Drive=%DRIVE%">>Support\settings.bat
::support\sfk filter -spat -quiet Support\settings.bat -rep _\x5e\x26_\x26_ -rep _\x26_\x5e\x26_ -write -yes>nul
::support\sfk filter -quiet Support\settings.bat -lerep _\__ -lerep _/__ -write -yes>nul



::prompt for full FC scan after cursory scan only if launched via Options
if /i "%MENU1%" NEQ "O" goto:skip
if not exist "%DRIVE%\apps\" if not exist "%DRIVE%\wiiu\" if not exist "%DRIVE%\*ModMii*.html" if not exist "%DRIVE%\*.dol" if not exist "%DRIVE%\*.elf" if not exist "%DRIVE%\*.wad" if not exist "%DRIVE%\00000001\" if not exist "%DRIVE%\00010001\" if not exist "%DRIVE%\00010002\" if not exist "%DRIVE%\00010008\" if not exist "%DRIVE%\bootmii\" if not exist "%DRIVE%\WAD\" if not exist "%DRIVE%\private\wii\" goto:Nothing2Clean

::CleanPrompt

set watext=~~~Would you like to scan the following location for files to update or clean\remove?:~~ "%DRIVE%"~~Click Next to close ModMii Skin and begin scanning using ModMii Classic.

start /w support\wizapp TB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:skip

::start ModMii Classic!
start ModMii.exe "%DRIVE%"
Exit


:Nothing2Clean
set watext=~~~No Files to Update or to Clean Found in:~~ "%DRIVE%"
start /w support\wizapp TB
if errorlevel 2 goto:MENU
::goto:skip
:skip





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
::if /i "%MENU1%" EQU "O" goto:notback
if /i "%MENU1%" EQU "O" set BACKB4DRIVEU=options
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

set "DRIVEUTEMP=%DRIVEUTEMP:/=\%"

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
if exist Support\settings.bat support\sfk filter Support\settings.bat -ls!"Set*DriveU=" -write -yes>nul
echo Set "DriveU=%DRIVEU%">>Support\settings.bat




::prompt for full FC scan after cursory scan only if launched via Options
if /i "%MENU1%" NEQ "O" goto:skip
if not exist "%DRIVEU%\apps\" if not exist "%DRIVEU%\wiiu\" if not exist "%DRIVEU%\*ModMii*.html" if not exist "%DRIVEU%\*.dol" if not exist "%DRIVEU%\*.elf" if not exist "%DRIVEU%\*.wad" if not exist "%DRIVEU%\00000001\" if not exist "%DRIVEU%\00010001\" if not exist "%DRIVEU%\00010002\" if not exist "%DRIVEU%\00010008\" if not exist "%DRIVEU%\bootmii\" if not exist "%DRIVEU%\WAD\" if not exist "%DRIVEU%\private\wii\" goto:Nothing2Clean2

::CleanPrompt2

set watext=~~~Would you like to scan the following location for files to update or clean\remove?:~~ "%DRIVEU%"~~Click Next to close ModMii Skin and begin scanning using ModMii Classic.

start /w support\wizapp TB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:skip

::start ModMii Classic!
start ModMii.exe "%DRIVEU%"
Exit


:Nothing2Clean2
set watext=~~~No Files to Update or to Clean Found in:~~ "%DRIVEU%"
start /w support\wizapp TB
if errorlevel 2 goto:MENU
::goto:skip
:skip










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
if exist temp\updater.bat attrib -h temp\updater.bat
if exist temp\updater.bat del temp\updater.bat>nul

support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\updater.bat" "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/updater.bat"
::delete if file is empty (if empty)
>nul findstr "^" "temp\updater.bat" || del "temp\updater.bat"
if not exist temp\updater.bat goto:altlink
::DELETE IF NULL
::for %%R in (temp\updater.bat) do if %%~zR lss 1 del "temp\updater.bat">nul


:altlink
if not exist "temp\updater.bat" support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\updater.bat" "https://tiny.cc/modmiiupdater"
::delete if file is empty (if empty)
>nul findstr "^" "temp\updater.bat" || del "temp\updater.bat"
if not exist temp\updater.bat goto:updatefail
::DELETE IF NULL
::for %%R in (temp\updater.bat) do if %%~zR lss 1 del "temp\updater.bat">nul
:skip

::Call to get new version info and changelogURL
echo %currentversion%>temp\skin.txt
if exist temp\updater.bat (call temp\updater.bat) else (goto:updatefail)

::in case new d2x beta downloaded, call it
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat

if "%newversion%"=="" goto:updatefail



start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE



if %currentversion% LSS %newversion% goto:openchangelog

if /i "%debug%" EQU "on" goto:debugskip
if exist temp\updater.bat attrib -h temp\updater.bat
if exist temp\updater.bat del temp\updater.bat>nul
:debugskip

::----------disable Splash for now------------
::if /i "%MENU1%" EQU "O" (set wabmp=%wabmplast%) & (goto:OPTIONS) else (goto:MENU)

if %currentversion% GTR %newversion% set watext=~This version is newer than the latest public release~~You got some crazy new beta shit!

if %currentversion% EQU %newversion% set watext=~This version is up to date

start support\wizapp PB OPEN
@ping 127.0.0.1 -n 1 -w 1000> nul
start support\wizapp PB UPDATE 100


support\nircmd.exe wait 2000

start support\wizapp PB CLOSE

set wabmp=%wabmplast%

if /i "%MENU1%" EQU "O" (goto:OPTIONS) else (goto:MENU)




:openchangelog
start %changelogURL%

:updateconfirm
::set updatenow=



if /i "%currentversion%" NEQ "0.0.0" set watext=~An Update is available, would you like to update to v%newversion% now?~~It is recommended you read the changelog that just opened in your browser.~~Click "Next" to update now otherwise click "Cancel".
if /i "%currentversion%" EQU "0.0.0" set watext=~One or more of ModMii's supporting files are missing, would you like to fix it by installing v%newversion% now?~~It is recommended you read the changelog that just opened in your browser.~~Click "Next" to update now otherwise click "Cancel" to Exit.


start /w support\wizapp NOBACK TB


if not errorlevel 2 goto:notcancel
set wabmp=%wabmplast%

if /i "%debug%" EQU "on" goto:debugskip
if exist temp\updater.bat attrib -h temp\updater.bat
if exist temp\updater.bat del temp\updater.bat>nul
:debugskip

if /i "%currentversion%" EQU "0.0.0" exit
if /i "%MENU1%" EQU "O" (goto:OPTIONS) else (goto:MENU)
:notcancel



:updatenow
::launch updater with temp\currentversion.txt to do the update
::only if temp\currentversion.txt exists updater will do start updating when called or started
::updater runs in skin mode if temp\skin.txt detected
echo %currentversion%>temp\currentversion.txt
echo %currentversion%>temp\skin.txt

start /min temp\updater.bat
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

if /i "%MENU1%" EQU "W" goto:skip
if /i "%macaddress%" EQU "S" goto:skip
if /i "%FIRMSTART%" NEQ "4.3" goto:skip
if "%macaddress%"=="" goto:skip
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

if /i "%SNEEKSELECT%" EQU "1" goto:tinyskip
if /i "%SNKVERSION%" NEQ "V" set wainput=%wainput%~* Build a %SNKVERSION%%SNKREGION% Emulated NAND
if /i "%SNKVERSION%" EQU "V" set wainput=%wainput%~* Build a vWii 4.3%SNKREGION% Emulated NAND
:tinyskip

if /i "%SNEEKSELECT%" NEQ "1" set wainput=%wainput%~* setting.txt created using serial #: %SNKSERIAL%

if /i "%SNKS2U%" EQU "Y" set wainput=%wainput%~* Install Switch2Uneek
if /i "%SNKnswitch%" EQU "Y" set wainput=%wainput%~* Install nSwitch (neek2o) Channel

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


if /i "%FIRMSTART%" EQU "U" (set wainput=%wainput%~* Install\update recommended mods for WiiU Only) & (goto:skipusb)
if /i "%FIRMSTART%" EQU "U2" (set wainput=%wainput%~* Install\update recommended mods for WiiU\vWii) & (goto:moreinfo)
if /i "%FIRMSTART%" EQU "V" (set wainput=%wainput%~* Install\update recommended mods for vWii Only) & (goto:moreinfo)
goto:wiiinfo
:moreinfo
if not "%REGION%"=="" set wainput=%wainput%~* Console Region is %REGION%
if /i "%FIRMSTART%" EQU "V" goto:listexploits
goto:themeconfirm
:wiiinfo




set wainput=%wainput%~* The console is a Wii

if /i "%VIRGIN%" EQU "Y" set wainput=%wainput%~* Install\Update all recommended softmods~

if /i "%MENU1%" EQU "RC" goto:skipcurrentSM
if /i "%FIRMSTART%" NEQ "o" set wainput=%wainput%~* Current System Menu is %FIRMSTART%%REGION%
if /i "%FIRMSTART%" EQU "o" set wainput=%wainput%~* Current System Menu is less than 2.2%REGION%
:skipcurrentSM

set wainput=%wainput%~* Desired System Menu is %FIRM%%REGION%


:listexploits
if /i "%EXPLOIT%" EQU "BE" set wainput=%wainput%~* Browser Exploit selected
if /i "%EXPLOIT%" EQU "S" set wainput=%wainput%~* Super Smash Brothers Brawl exploit selected
if /i "%EXPLOIT%" EQU "L" set wainput=%wainput%~* LEGO Indiana Jones exploit selected
if /i "%EXPLOIT%" EQU "Y" set wainput=%wainput%~* Yu-Gi-Oh! 5D's exploit selected
if /i "%EXPLOIT%" EQU "LB" set wainput=%wainput%~* LEGO Batman exploit selected
if /i "%EXPLOIT%" EQU "LS" set wainput=%wainput%~* LEGO Star Wars exploit selected
if /i "%EXPLOIT%" EQU "TOS" set wainput=%wainput%~* Tales of Symphonia Dawn of the New World exploit selected
if /i "%EXPLOIT%" EQU "T" set wainput=%wainput%~* Twilight Princess: The Legend of Zelda exploit selected
if /i "%EXPLOIT%" EQU "W" set wainput=%wainput%~* Wilbrand\LetterBomb exploit selected
if /i "%EXPLOIT%" EQU "X" set wainput=%wainput%~* str2hax exploit selected
if /i "%EXPLOIT%" EQU "?"  set wainput=%wainput%~* Download all available exploits
if /i "%FIRMSTART%" EQU "V" goto:themeconfirm



if /i "%macaddress%" EQU "S" goto:skip
if /i "%FIRMSTART%" NEQ "4.3" goto:skip
if "%macaddress%"=="" goto:skip
if /i "%EXPLOIT%" EQU "W" set wainput=%wainput%~* MAC Address: %macaddress%
if /i "%EXPLOIT%" EQU "?" set wainput=%wainput%~* MAC Address: %macaddress%
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

:themeconfirm
if /i "%ThemeSelection%" EQU "R" set wainput=%wainput%~* Install Dark Wii Red Theme - %effect%
if /i "%ThemeSelection%" EQU "G" set wainput=%wainput%~* Install Dark Wii Green Theme - %effect%
if /i "%ThemeSelection%" EQU "BL" set wainput=%wainput%~* Install Dark Wii Blue Theme - %effect%
if /i "%ThemeSelection%" EQU "O" set wainput=%wainput%~* Install Dark Wii Orange Theme - %effect%
if /i "%ThemeSelection%" EQU "D" set wainput=%wainput%~* Install Default Wii Theme

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

if /i "%USBCONFIG%" EQU "SD" (call Support\settings.bat) & (set BACKB4DRIVE=UPAGE2) & (goto:DRIVECHANGE)



::...................................SNEEK Page1 - SNEEK SELECT...............................
:SNKPAGE1
set SNEEKSELECT=
set SNKS2U=
set SNKnswitch=
set PRIIFOUND=
if /i "%neek2o%" EQU "on" (set neekURL=tinyurl.com/neeek2o) else (set neekURL=https://code.google.com/p/sneek)
set waoutnum=
set waoutput=
set wafile=

::recall checked items
if not "%SNEEKSELECTMarked%"=="" set waoutnum=%VIRGINMarked%


set watext=~~Which of the following SNEEK Actions would you like to perform?~~Note: Emulated NAND Modifier and SNEEK Game Bulk Extractor is currently only available in ModMii Classic

set wainput= ^&SNEEK Installation (Wii Only); ^&Emulated NAND Builder (Wii or vWii); ^&All the above (Wii Only: Ideal for 1st time users)


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
if exist temp\list.txt del temp\list.txt>nul
support\wget --no-check-certificate -q -t 3 -O "temp\list.txt" "https://sourceforge.net/projects/%googlecode%/files/?source=navbar"

start support\wizapp PB UPDATE 20

if not exist temp\list.txt goto:nowifi
::copy /y "temp\list.txt" "temp\list2.txt">nul

support\sfk filter -spat "temp\list.txt" -and+"/download\x22" -and+"%neekname%-rev" -rep _"/download\x22"__ -rep _*"/"__ -rep _".zip*"__ -rep _"*files/"__ -rep _%neekname%-rev__ -rep _\x2528_\x28_ -rep _\x2529_\x29_ -rep _\x2520_\x20_ -rep _\x253B_\x3B_ -rep _\x252C_\x2C_ -write -yes>nul

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

::count # of lines
SET neekTOTAL=0
if exist temp\list.txt for /f %%a in (temp\list.txt) do set /a neekTOTAL+=1

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

::Loop through the following once for EACH line in *.txt
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

if /i "%SNEEKSELECT%" EQU "2" set watext=What type of SNEEK would you like to build an emulated NAND for?~~Note: Any type of SNEEK can be selected if the EmuNAND will be used without SNEEK via USB-Loaders directly. Also, EmuNANDs built for any type of SNEEK work with any other type of SNEEK and ANY region Wii\vWii can use ANY region emulated NAND.

if /i "%SNEEKSELECT%" EQU "3" set watext=%watext%~~Note: EmuNANDs built for any type of SNEEK work with any other type of SNEEK and ANY region Wii\vWii can use ANY region emulated NAND.


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

set watext=~UNEEK+DI~* Emulated nand/memory is on FAT32 External HDD~* Load Wii games off your FAT32 External Hard Drive~* You can load apps off an SD Card~* DVD-Drive disabled for games but not for apps~~SNEEK+DI~* Emulated nand/memory is on SD Card~* Load Wii games off your FAT32 External Hard Drive~* Load GameCube games off your SD Card using DML~* You can load apps off a FAT32 USB HDD~* DVD-Drive disabled for games but not for apps~~UNEEK~* Same as UNEEK+DI but DVD-Drive is enabled and~  cannot load games off a FAT32 HDD~~SNEEK~* Same as SNEEK+DI but DVD-Drive is enabled and~  cannot load games off a FAT32 HDD

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

set watext=~What Region would you like to make your Emulated NAND?~~Note: If you want your wiimotes be synced up to your real NAND and your emulated NAND simultaneously, then you must choose the real region of your console

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
if /i "%SNKREGION%" EQU "K" set defaultserial=LKM101175683

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

if /i "%SNEEKSELECT%" NEQ "2" goto:skip
if /i "%SNKREGION%" NEQ "K" set wainput= 4.^&3; 4.^&2; 4.^&1; ^&vWii 4.3
if /i "%SNKREGION%" EQU "K" set watext=%watext%~~Note: to choose vWii select a Region other than Korean
:skip



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
if /i "%waoutnum%" EQU "3" set SNKVERSION=V

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

set wainput= System Menu ?Theme; Post?Loader (App\Channel); cIOS?249 rev14 (required for some apps); ?Priiloader (and System Menu Hacks); Custom ?Folder of WADs


if /i "%AbstinenceWiz%" EQU "Y" goto:noNMMDML
if /i "%SNEEKTYPE%" EQU "SD" set wainput=%wainput%; ?Dios Mios Lite -OR- No More Memory-Cards
if /i "%SNEEKTYPE%" NEQ "SD" set wainput=%wainput%; No ?More Memory-Cards (NMM)
:noNMMDML



::if /i "%SNEEKTYPE:~0,1%" NEQ "U" goto:notUneek
set wainput=%wainput%; ?WiiFlow (USB-Loader)
if /i "%AbstinenceWiz%" EQU "Y" goto:notUneek
if /i "%neek2o%" EQU "off" set wainput=%wainput%; ?Switch2Uneek (uneek/real nand switcher)
:notUneek

set wainput=%wainput%; ?Open Homebrew Channel; n?Switch Channel (neek/real nand switcher)

echo %wainput%>temp\temp.txt

support\sfk filter -spat temp\temp.txt -rep _"\x3f"_"\x5e\x26"_ -write -yes>nul
set /p wainput= <temp\temp.txt
set wainput=%wainput%

if /i "%SNKVERSION%" EQU "V" set watext=~~~Select which of the following to install to your Emulated NAND?
if /i "%SNKVERSION%" EQU "V" set wainput= System Menu ^&Theme; Post^&Loader (App\Channel); Custom ^&Folder of WADs; ^&WiiFlow (USB-Loader); ^&Open Homebrew Channel; n^&Switch Channel (neek/real nand switcher)


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

findStr /I /C:"n^&Switch Channel" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKnswitch=Y


findStr /I /C:"^&Dios Mios Lite -OR- No More Memory-Cards" "%wabat%" >nul
::IF not ERRORLEVEL 1 goto:SNKPAGE4a3
IF not ERRORLEVEL 1 set SNKcBC=choose

findStr /I /C:"Custom ^&Folder of WADs" "%wabat%" >nul
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

::check if d2x version is customized and offer to revert to default
call support\subscripts\defaultd2xSkin.bat
if /i %errorlevel% EQU 1 goto:RCPAGE1
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

::WiiUOnly
if /i "%FIRMSTART%" NEQ "U" goto:notWiiUonly
set "classicCMD=W %FIRMSTART%"
if /i "%GUIDEONLY%" EQU "on" set "classicCMD=%classicCMD% Guide"
goto:sendcmd
:notWiiUonly

::Wii only
if /i "%ctype%" EQU "Wii" set "classicCMD=W %FIRMSTART% %REGION% %FIRM%"

::vWii (and WiiU+vWii)
if /i "%ctype%" EQU "WiiU" set "classicCMD=W %FIRMSTART% %REGION%"


::THEMES
if /i "%ThemeSelection%" EQU "R" set "classicCMD=%classicCMD% Red"
if /i "%ThemeSelection%" EQU "G" set "classicCMD=%classicCMD% Green"
if /i "%ThemeSelection%" EQU "BL" set "classicCMD=%classicCMD% Blue"
if /i "%ThemeSelection%" EQU "O" set "classicCMD=%classicCMD% Orange"
if /i "%ThemeSelection%" EQU "D" set "classicCMD=%classicCMD% Default"

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
if /i "%FIRMSTART%" EQU "v" goto:exploitcheck
goto:skipexploitcheck

:exploitcheck
if /i "%EXPLOIT%" EQU "BE" set "classicCMD=%classicCMD% Browser"
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

::end of the line for vWii
if /i "%ctype%" NEQ "Wii" goto:sendcmd

::Wii CHANNELS
if /i "%PIC%" EQU "Y" set "classicCMD=%classicCMD% PHOTO"
if /i "%MIIQ%" EQU "Y" set "classicCMD=%classicCMD% MII"
if /i "%Shop%" EQU "Y" set "classicCMD=%classicCMD% SHOP"
if /i "%NET%" EQU "Y" set "classicCMD=%classicCMD% NET"
if /i "%Weather%" EQU "Y" set "classicCMD=%classicCMD% WEATHER"
if /i "%NEWS%" EQU "Y" set "classicCMD=%classicCMD% NEWS"
if /i "%Speak%" EQU "Y" set "classicCMD=%classicCMD% SPEAK"


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
if /i "%SNKS2U%" EQU "Y" set "classicCMD=%classicCMD% S2U"
if /i "%SNKnswitch%" EQU "Y" set "classicCMD=%classicCMD% nswitch"

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
echo   an SD Card using USB-Loader GX or nswitch. GX also>>%wafile%
echo   has an option to copy a console's SYSCONF into your>>%wafile%
echo   current emuNAND (channel) path, so if you add new>>%wafile%
echo   controllers or a balance board to your NAND, use the>>%wafile%
echo   copy SYSCONF feature to also add it to your EmuNAND.>>%wafile%
echo.>>%wafile%
echo * SD:\Bootmii is not required to launch neek from>>%wafile%
echo   USB-Loader GX or nswitch. If you use either of>>%wafile%
echo   these, you can have both SNEEK and UNEEK>>%wafile%
echo   at the same time (with or without DI). ModMii will>>%wafile%
echo   detect SNEEK when installing UNEEK and vice>>%wafile%
echo   versa and ask if you want to overwrite SD files.>>%wafile%
echo   For dual boot you will want only SNEEK files on SD>>%wafile%
echo   and only UNEEK files on USB. The version of NEEK>>%wafile%
echo   that will GX will load is based on your EmuNAND>>%wafile%
echo   location in USB-Loader GX's settings: Sneek if>>%wafile%
echo   on SD, and Uneek if on USB.>>%wafile%
echo.>>%wafile%


if /i "%SNKnswitch%" NEQ "Y" goto:quickskip
echo * Install the neek2o (nSwitch) WAD\channel then>>%wafile%
echo   launch the channel in order to start NEEK. You can>>%wafile%
echo   also use this channel to return to your real NAND.>>%wafile%
echo.>>%wafile%
:quickskip

if /i "%SNKS2U%" NEQ "Y" goto:quickskip
echo * Access UNEEK/UNEEK+DI by launching switch2uneek>>%wafile%
echo   from the Homebrew Channel. Alternatively, can use>>%wafile%
echo   yawmME to install the switch2uneek forwarder>>%wafile%
echo   channel that ModMii saved to your SD card.>>%wafile%
echo.>>%wafile%
:quickskip

if /i "%SNKcBC%" NEQ "DML" goto:skipDMLmsg
echo * Install the DML WAD using yawmME to your REAL NAND>>%wafile%
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
echo   to an EmuNAND. See ModMii's Download Page 5.>>%wafile%
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

if /i "%MENU1%" EQU "L" set watext=Download Queue Finished~

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
