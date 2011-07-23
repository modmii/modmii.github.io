@echo off

title=ModMii Installer (Italian)
mode con cols=85 lines=25
color 1f

set currentversion=0.0.0
set UPDATENAME=ModMiiItalianUpdate
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
echo                             Dove vuoi installare ModMii?
echo.
echo.
echo    L = Installazione Locale
echo        * Installato in %homedrive%\ModMii
echo.
echo.
echo    D = Installazione sul Desktop
echo        * Installato in %DESKTOPDIR%\ModMii
echo.
echo.
echo    C = Installazione Custom o Portable
echo        * Installato nella posizione definita dall'utente
echo.
echo.
echo                            E = Esci senza installare
echo.
echo.
set /p proceed=     Inserisci qui la tua scelta: 

if /i "%proceed%" EQU "E" exit
if /i "%proceed%" EQU "C" goto:updaterpage2

if /i "%proceed%" EQU "L" set InstallPath=%homedrive%\ModMii
if /i "%proceed%" EQU "L" goto:updaterpage3

if /i "%proceed%" EQU "D" set InstallPath=%DESKTOPDIR%\ModMii
if /i "%proceed%" EQU "D" goto:updaterpage3

echo Hai inserito un comando errato
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpage



:updaterpage2
set InstallPathTemp=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                       by XFlak
echo.
echo.
echo         Inserisci la lettera del drive (o la path) dove installare ModMii:
echo.
echo.
echo         PER ESEMPIO
echo         ===========
echo.
echo            E:\ModMii
echo.
echo            F:
echo.
echo            G:\PortableApps\ModMii
echo.
echo.
echo                            B = Indietro
echo.
echo                            E = Esci senza installare
echo.
echo.
set /p InstallPathTemp=     Inserisci qui la tua scelta: 

IF "%InstallPathTemp%"=="" echo Hai inserito un comando errato
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
sfk echo -spat \x20\x20Installo i collegamenti a ModMii sul Desktop, Start Men\xf9, entrambi o nessuno?
echo.
echo.
echo.
echo                 D = Solo Desktop
echo.
sfk echo -spat \x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20S = Solo Start Menù
echo.
echo                 A = Entrambi
echo.
echo                 N = Nessuno
echo.
echo.
echo                            B = Indietro
echo.
echo                            E = Esci senza installare
echo.
echo.
set /p shortcut=     Inserisci qui la tua scelta: 

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

echo Hai inserito un comando errato
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpage3



:updaterpageconfirm
set updateconfirm=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                       by XFlak
echo.
echo.
echo                     Installo ModMii con le seguenti impostazioni?
echo.
echo.
echo      * Installo ModMii nel seguente percorso:
echo        - %InstallPath%
echo.
if /i "%shortcut%" EQU "D" echo      * Creo il collegamento a ModMii solo sul Desktop
if /i "%shortcut%" EQU "S" sfk echo -spat \x20\x20\x20\x20\x20* Creo il collegamento a ModMii solo nello Start Men\xf9
if /i "%shortcut%" EQU "A" sfk echo -spat \x20\x20\x20\x20\x20* Creo il collegamento a ModMii sul Desktop e nello Start Men\xf9
if /i "%shortcut%" EQU "N" sfk echo -spat \x20\x20\x20\x20\x20* Nessun collegamento a ModMii verr\xe0 creato

echo.
echo.
echo.
echo.
echo                            Y = Si
echo.
echo                            B = Indietro
echo.
echo                            E = Esci senza installare
echo.
echo.
set /p updateconfirm=     Inserisci qui la tua scelta: 

if /i "%updateconfirm%" EQU "E" exit
if /i "%updateconfirm%" EQU "Y" goto:proceed
if /i "%updateconfirm%" EQU "B" goto:updaterpage3


echo Hai inserito un comando errato
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
sfk echo -spat \x20Il Download di ModMii \xe8 fallito, controlla la tua connessione internet e le impostazioni del firewall.
pause>nul
