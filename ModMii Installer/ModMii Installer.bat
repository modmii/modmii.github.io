@echo off

::title=ModMii Installer
title ModMiiInstallerCMD

::make cmd window transparent and hidden
nircmd.exe win trans ititle "ModMiiInstallerCMD" 0
nircmd.exe win hide ititle "ModMiiInstallerCMD"

set UPDATENAME=ModMii
::set UPDATENAME=ModMii_IT_

set PATH=%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%
set InstallerVersion=6.2

chcp 437>nul

set ModMiimin=/min 

::get desktop location (%DESKTOPDIR%) using findDesktop.vbs
::call getdesktop.bat


:updaterpage
set watitle=ModMii Installer
set wainput=
set waico=icon.ico
set temp=
set wabat=wabat.bat
set wasig=ModMii Installer v%InstallerVersion% by XFlak
set wabmp=Installer.bmp


set waoutnum=
set waoutput=%homedrive%\ModMii

set watext=~~              Where would you like to install ModMii?

::set wainput=%homedrive%\ModMii;%DESKTOPDIR%\ModMii

set proceed=

::start /w wizapp NOBACK CB

start /w wizapp NOBACK FB DIR


if errorlevel 2 EXIT
::if errorlevel 1 goto:SaveSettings

call "%wabat%"
del "%wabat%">nul

if "%waoutput%"=="" goto:updaterpage

if /i "%waoutput%" EQU "%homedrive%\ModMii" set InstallPath=%homedrive%\ModMii
if /i "%waoutput%" EQU "%homedrive%\ModMii" goto:updaterpage3

::if /i "%waoutput%" EQU "%DESKTOPDIR%\ModMii" set InstallPath=%DESKTOPDIR%\ModMii
::if /i "%waoutput%" EQU "%DESKTOPDIR%\ModMii" goto:updaterpage3

::remove quotes from variable (if applicable)
echo "set InstallPathTemp=%waoutput%">temp.txt
sfk filter -quiet temp.txt -rep _""""__>temp.bat
call temp.bat
del temp.bat>nul
del temp.txt>nul

:doublecheck
set fixslash=
if /i "%InstallPathTemp:~-1%" EQU "\" set fixslash=yes
if /i "%InstallPathTemp:~-1%" EQU "/" set fixslash=yes
if /i "%fixslash%" EQU "yes" set InstallPathTemp=%InstallPathTemp:~0,-1%
if /i "%fixslash%" EQU "yes" goto:doublecheck


::if second char is ":" check if drive exists
if /i "%InstallPathTemp:~1,1%" NEQ ":" goto:skipcheck
if exist "%InstallPathTemp:~0,2%" goto:skipcheck
goto:updaterpage
:skipcheck


set InstallPath=%InstallPathTemp%
goto:updaterpage3






:updaterpage3
::set shortcut=
set waoutnum=0;1;2;3;4
set waoutput=
set skinD=
set skinS=
set ClassicD=
set ClassicS=
set AutoStart=


set watext=~~                  Customize Your ModMii Installation~~ Install to: %InstallPath%

set wainput= ModMii Skin Desktop Shortcut; ModMii Skin Start Menu Shortcut; ModMii Classic Desktop Shortcut; ModMii Classic Start Menu Shortcut; Start ModMii After Installation


start /w wizapp FINISH CL

if errorlevel 2 EXIT
if errorlevel 1 goto:updaterpage



set watext=~~Installing ModMii to: %InstallPath%

start wizapp PB OPEN
start wizapp PB UPDATE 5


call "%wabat%"

::set ChannelsMarked=%waoutnum%

if "%waoutnum%"=="" goto:skipcheck

echo %waoutnum% >"%wabat%"

findStr /I /C:"0" "%wabat%" >nul
IF not ERRORLEVEL 1 set skinD=Y

findStr /I /C:"1" "%wabat%" >nul
IF not ERRORLEVEL 1 set skinS=Y

findStr /I /C:"2" "%wabat%" >nul
IF not ERRORLEVEL 1 set ClassicD=Y

findStr /I /C:"3" "%wabat%" >nul
IF not ERRORLEVEL 1 set ClassicS=Y

findStr /I /C:"4" "%wabat%" >nul
IF not ERRORLEVEL 1 set AutoStart=Y

:skipcheck

del "%wabat%">nul


:proceed


if exist list.txt del list.txt>nul

start %ModMiimin%/wait wget -N "http://code.google.com/p/modmii/downloads/list?can=3&q=&colspec=Filename+Summary+Uploaded+ReleaseDate+Size+DownloadCount"

start wizapp PB UPDATE 20

if exist list* (move /y list* list.txt>nul) else (goto:updatefail)

sfk filter -quiet "list.txt" ++"ModMii" ++"zip" ++"modmii.googlecode.com/files/" -rep _*"files/ModMii"__ -rep _".zip"*__ -write -yes


if /i "%UPDATENAME%" NEQ "ModMii" sfk filter -quiet "list.txt" ++"%UPDATENAME:~-3%" -write -yes

if /i "%UPDATENAME%" EQU "ModMii" sfk filter -quiet "list.txt" -!"_" -write -yes

sfk filter -spat -quiet "list.txt" -rep _*"\x5f"__ -write -yes

set /p newversion= <list.txt

del list.txt>nul


start wizapp PB UPDATE 25

if not exist "%UPDATENAME%%newversion%.zip" start %ModMiimin%/wait wget -t 3 http://modmii.googlecode.com/files/%UPDATENAME%%newversion%.zip

if not exist "%UPDATENAME%%newversion%.zip" goto:updatefail

start wizapp PB UPDATE 60


7za x -aoa %UPDATENAME%%newversion%.zip -o"%InstallPath%" -r
del %UPDATENAME%%newversion%.zip>nul

start wizapp PB UPDATE 90



if /i "%skinD%" EQU "Y" nircmd.exe shortcut "%InstallPath%\ModMiiSkin.exe" "~$folder.desktop$" "ModMii Skin"

if /i "%ClassicD%" EQU "Y" nircmd.exe shortcut "%InstallPath%\ModMii.exe" "~$folder.desktop$" "ModMii"

start wizapp PB UPDATE 95

if /i "%skinS%" EQU "Y" nircmd.exe shortcut "%InstallPath%\ModMiiSkin.exe" "~$folder.programs$\ModMii" "ModMii Skin"

if /i "%ClassicS%" EQU "Y" nircmd.exe shortcut "%InstallPath%\ModMii.exe" "~$folder.programs$\ModMii" "ModMii"


start wizapp PB UPDATE 100
start wizapp PB CLOSE

if /i "%AutoStart%" NEQ "Y" EXIT

cd /d "%InstallPath%"
if exist ModMiiSkin.exe (Start ModMiiSkin.exe) else (Start ModMii.exe)
exit



:updatefail
start wizapp PB UPDATE 100
start wizapp PB CLOSE

set watext=~~~~Installation has failed,~~~check your internet connection and firewall settings and try again.

start /w wizapp FINISH TB

EXIT
