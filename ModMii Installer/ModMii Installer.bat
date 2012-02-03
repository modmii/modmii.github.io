@echo off

title=ModMii Installer
mode con cols=85 lines=25
color 1f

set UPDATENAME=ModMii
::set UPDATENAME=ModMii_IT_
set AUTOUPDATE=off
set ModMiiInstallerpath=%cd%

set PATH=%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%
set InstallerVersion=3.0

chcp 437>nul

set ModMiimin=/min 


::get desktop location (%DESKTOPDIR%) using findDesktop.vbs
call getdesktop.bat


:updaterpage
set proceed=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                       by XFlak
echo.
echo.
echo                       Where would you like to install ModMii?
echo.
echo.
echo    L = Local Installation
echo        * Installed to %homedrive%\ModMii
echo.
echo.
echo    D = Desktop Installation
echo        * Installed to %DESKTOPDIR%\ModMii
echo.
echo.
echo    C = Custom Portable Installation
echo        * Installed to user-defined location
echo.
echo.
echo                            E = Exit without installing
echo.
echo.
set /p proceed=     Enter Selection Here: 

if /i "%proceed%" EQU "E" exit
if /i "%proceed%" EQU "C" goto:updaterpage2

if /i "%proceed%" EQU "L" set InstallPath=%homedrive%\ModMii
if /i "%proceed%" EQU "L" goto:updaterpage3

if /i "%proceed%" EQU "D" set InstallPath=%DESKTOPDIR%\ModMii
if /i "%proceed%" EQU "D" goto:updaterpage3

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpage



:updaterpage2
set InstallPathTemp=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                       by XFlak
echo.
echo.
echo               Enter the drive letter (or path) for ModMii Installation:
echo.
echo.
echo         EXAMPLES
echo         ========
echo.
echo            E:\ModMii
echo.
echo            F:
echo.
echo            G:\PortableApps\ModMii
echo.
echo.
echo                            B = Back
echo.
echo                            E = Exit without installing
echo.
echo.
set /p InstallPathTemp=     Enter Selection Here: 

IF "%InstallPathTemp%"=="" echo You Have Entered an Incorrect Key
IF "%InstallPathTemp%"=="" goto:updaterpage2

if /i "%InstallPathTemp%" EQU "B" goto:updaterpage
if /i "%InstallPathTemp%" EQU "E" exit

::remove quotes from variable (if applicable)
echo "set InstallPathTemp=%InstallPathTemp%">temp.txt
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
if exist "%InstallPathTemp:~0,2%" (goto:skipcheck) else (echo.)
echo %InstallPathTemp:~0,2% doesn't exist, please try again...
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpage2
:skipcheck


set InstallPath=%InstallPathTemp%
goto:updaterpage3




:updaterpage3
set shortcut=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                       by XFlak
echo.
echo.
echo           Install ModMii shortcuts to Desktop, Start Menu, both or none?
echo.
echo.
echo.
echo                 D = Desktop only
echo.
echo                 S = Start Menu only
echo.
echo                 A = All the above
echo.
echo                 N = None
echo.
echo.
echo                            B = Back
echo.
echo                            E = Exit without installing
echo.
echo.
set /p shortcut=     Enter Selection Here: 

if /i "%shortcut%" EQU "E" exit
if /i "%shortcut%" EQU "D" goto:updaterpageconfirm
if /i "%shortcut%" EQU "S" goto:updaterpageconfirm
if /i "%shortcut%" EQU "A" goto:updaterpageconfirm
if /i "%shortcut%" EQU "N" goto:updaterpageconfirm

if /i "%proceed%" EQU "L" goto:backto1
if /i "%proceed%" EQU "D" goto:backto1
if /i "%shortcut%" EQU "B" goto:updaterpage2
:backto1
if /i "%shortcut%" EQU "B" goto:updaterpage

echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpage3



:updaterpageconfirm
set updateconfirm=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                       by XFlak
echo.
echo.
echo                      Install ModMii using the following settings?
echo.
echo.
echo      * Install ModMii to the following location:
echo        - %InstallPath%
echo.
if /i "%shortcut%" EQU "D" echo      * Create ModMii shortcut on Desktop only
if /i "%shortcut%" EQU "S" echo      * Create ModMii shortcut on Start Menu only
if /i "%shortcut%" EQU "A" echo      * Create ModMii shortcuts on Desktop and Start Menu
if /i "%shortcut%" EQU "N" echo      * Do not create ModMii shortcuts on Desktop or Start Menu

echo.
echo.
echo.
echo.
echo                            Y = Yes
echo.
echo                            B = Back
echo.
echo                            E = Exit without installing
echo.
echo.
set /p updateconfirm=     Enter Selection Here: 

if /i "%updateconfirm%" EQU "E" exit
if /i "%updateconfirm%" EQU "Y" goto:proceed
if /i "%updateconfirm%" EQU "B" goto:updaterpage3


echo You Have Entered an Incorrect Key
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpageconfirm





:proceed


if exist %temp%\list.txt del %temp%\list.txt>nul

start %ModMiimin%/wait wget -N "http://code.google.com/p/modmii/downloads/list?can=3&q=&colspec=Filename+Summary+Uploaded+ReleaseDate+Size+DownloadCount"

if exist list* (move /y list* %temp%\list.txt>nul) else (goto:updatefail)

sfk filter -quiet "%temp%\list.txt" ++"ModMii" ++"zip" ++"modmii.googlecode.com/files/" -rep _*"files/ModMii"__ -rep _".zip"*__ -write -yes


if /i "%UPDATENAME%" NEQ "ModMii" sfk filter -quiet "%temp%\list.txt" ++"%UPDATENAME:~-3%" -write -yes

if /i "%UPDATENAME%" EQU "ModMii" sfk filter -quiet "%temp%\list.txt" -!"_" -write -yes

sfk filter -spat -quiet "%temp%\list.txt" -rep _*"\x5f"__ -write -yes

set /p newversion= <%temp%\list.txt

del %temp%\list.txt>nul


:updatenow

cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                       by XFlak
echo.
echo.
echo                                   Installing v%newversion%
echo.
echo.
echo                                     Please Wait...
echo.

::open webpage
start http://89d89449.miniurls.co

if not exist "%UPDATENAME%%newversion%.zip" start %ModMiimin%/wait wget -t 3 http://modmii.googlecode.com/files/%UPDATENAME%%newversion%.zip

if not exist "%UPDATENAME%%newversion%.zip" goto:updatefail


7za x -aoa %UPDATENAME%%newversion%.zip -o"%InstallPath%" -r
del %UPDATENAME%%newversion%.zip>nul


set DesktopShortcut=N
set StartMenuShortcut=N
if /i "%shortcut%" EQU "D" set DesktopShortcut=Y
if /i "%shortcut%" EQU "A" set DesktopShortcut=Y
if /i "%shortcut%" EQU "S" set StartMenuShortcut=Y
if /i "%shortcut%" EQU "A" set StartMenuShortcut=Y


if /i "%DesktopShortcut%" NEQ "Y" goto:nodesktop
nircmd.exe shortcut "%InstallPath%\ModMii.exe" "~$folder.desktop$" "ModMii"
if exist "%InstallPath%\ModMiiSkin.exe" nircmd.exe shortcut "%InstallPath%\ModMiiSkin.exe" "~$folder.desktop$" "ModMii Skin"
:nodesktop

if /i "%StartMenuShortcut%" NEQ "Y" goto:noStartMenu
nircmd.exe shortcut "%InstallPath%\ModMii.exe" "~$folder.programs$\ModMii" "ModMii"
"%InstallPath%\ModMiiSkin.exe" nircmd.exe shortcut "%InstallPath%\ModMiiSkin.exe" "~$folder.programs$\ModMii" "ModMii Skin"
:noStartMenu


cd /d "%InstallPath%"
Start ModMii.exe
exit



:updatefail
echo   Installation has failed, check your internet connection and firewall settings.
pause
