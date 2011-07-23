@echo off

title=ModMii Installer
mode con cols=85 lines=25
color 1f

set currentversion=0.0.0
set UPDATENAME=NUSAutoUpdate
set AUTOUPDATE=off
set ModMiiInstallerpath=%cd%

set InstallerVersion=2.6

set ModMiimin=/min 

if exist Updatetemp.bat attrib -h Updatetemp.bat
if exist Updatetemp.bat del updatetemp.bat>nul

if exist "%UPDATENAME%.txt" del "%UPDATENAME%.txt">nul
if exist "%UPDATENAME%.bat" del "%UPDATENAME%.bat">nul

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
if exist list.bat del list.bat>nul

start %ModMiimin%/wait wget "http://code.google.com/p/nusad/downloads/list?can=3&q=&colspec=Filename+Summary+Uploaded+ReleaseDate+Size+DownloadCount"

if exist list* (move /y list* list.bat>nul) else (goto:updatefail)
sfk filter -quiet "list.bat" -+"%UPDATENAME%" -rep _".txt*"__ -rep _"*%UPDATENAME%-"_"set newversion="_ -rep _" </a>*"__ -write -yes
sfk filter "list.bat" -unique -write -yes>nul
call list.bat
del list.bat>nul

start %ModMiimin%/wait wget http://nusad.googlecode.com/files/%UPDATENAME%-%newversion%.txt
if not exist %UPDATENAME%-%newversion%.txt goto:updatefail
move /y %UPDATENAME%-%newversion%.txt %UPDATENAME%.bat
call %UPDATENAME%.bat
exit

:updatefail
echo   ModMii Download has failed, check your internet connection and firewall settings.
pause>nul