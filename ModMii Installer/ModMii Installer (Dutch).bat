@echo off

title=ModMii Installer
mode con cols=85 lines=25
color 1f

set currentversion=0.0.0
set UPDATENAME=ModMiiDutchUpdate
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
echo                                      door XFlak
echo.
echo.
echo                          Waar wilt u ModMii installeren?
echo.
echo.
echo    L = Locale Installatie
echo        * Installatie op  %homedrive%\ModMii
echo.
echo.
echo    D = Desktop Installatie
echo        * Installatie op %DESKTOPDIR%\ModMii
echo.
echo.
echo    C = Custom Mobiele Installatie
echo        * Installatie locatie bepaald door gebruiker 
echo.
echo.
echo                            E = Afsluiten en niet installeren
echo.
echo.
set /p proceed=     Geef uw keuze in: 

if /i "%proceed%" EQU "E" exit
if /i "%proceed%" EQU "C" goto:updaterpage2

if /i "%proceed%" EQU "L" set InstallPath=%homedrive%\ModMii
if /i "%proceed%" EQU "L" goto:updaterpage3

if /i "%proceed%" EQU "D" set InstallPath=%DESKTOPDIR%\ModMii
if /i "%proceed%" EQU "D" goto:updaterpage3

echo Uw invoer klopt niet!
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpage



:updaterpage2
set InstallPathTemp=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                      door XFlak
echo.
echo.
echo               Geef Drive letter (of pad) op voor de Modmii installatie:
echo.
echo.
echo         VOORBEELD
echo         ========
echo.
echo            E:\ModMii
echo.
echo            F:
echo.
echo            G:\MobieleProgs\ModMii
echo.
echo.
echo                            B = Terug
echo.
echo                            E = Afsluiten en niet installeren
echo.
echo.
set /p InstallPathTemp=     Geef uw keuze in: 

IF "%InstallPathTemp%"=="" echo Uw invoer klopt niet!
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
echo %InstallPathTemp:~0,2% bestaat niet,probeer nog een keer...
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpage2
:skipcheck


set InstallPath=%InstallPathTemp%
goto:updaterpage3




:updaterpage3
set shortcut=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                      door XFlak
echo.
echo.
echo           Snelkoppeling bureaublad , Start Menu, beide of geen?
echo.
echo.
echo.
echo                 D = Desktop alleen
echo.
echo                 S = Start Menu alleen
echo.
echo                 A = Allebeide
echo.
echo                 N = Niets
echo.
echo.
echo                            B = Terug
echo.
echo                            E = Afsluiten en niet installeren
echo.
echo.
set /p shortcut=     Geef uw keuze in: 

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

echo Uw invoer klopt niet!
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpage3



:updaterpageconfirm
set updateconfirm=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                      door XFlak
echo.
echo.
echo                        ModMii installeren met deze instellingen?
echo.
echo.
echo      * Installeer ModMii opm deze locatie:
echo        - %InstallPath%
echo.
if /i "%shortcut%" EQU "D" echo      * Modmii snelkoppeling alleen op bureaublad
if /i "%shortcut%" EQU "S" echo      * Modmii snelkoppeling alleen in Menu Start
if /i "%shortcut%" EQU "A" echo      * Modmii snelkoppeling op bureaublad en in Menu Start
if /i "%shortcut%" EQU "N" echo      * Geen Modmii snelkoppelingen op bureaublad of in Menu Start

echo.
echo.
echo.
echo.
echo                            Y = Ja
echo.
echo                            B = Terug
echo.
echo                            E = Afsluiten en niet installeren
echo.
echo.
set /p updateconfirm=     Geef uw keuze in: 

if /i "%updateconfirm%" EQU "E" exit
if /i "%updateconfirm%" EQU "Y" goto:proceed
if /i "%updateconfirm%" EQU "B" goto:updaterpage3


echo Uw invoer klopt niet!
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
echo   ModMii Download is mislukt, check internet en firewall instellingen.
pause>nul