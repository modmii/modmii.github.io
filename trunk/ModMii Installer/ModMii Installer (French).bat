@echo off

title=ModMii Installer (French)
mode con cols=85 lines=25
color 1f

set currentversion=0.0.0
set UPDATENAME=ModMiiFrenchUpdate
set AUTOUPDATE=off
set ModMiiInstallerpath=%cd%

set InstallerVersion=2.7

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
echo                                      par XFlak
echo.
echo.
echo                          Ou aimeriez-vous installer ModMii?
echo.
echo.
echo    L = Installation locale
echo        * Installation dans %homedrive%\ModMii
echo.
echo.
echo    D = Installation sur le bureau
echo        * Installation dans %DESKTOPDIR%\ModMii
echo.
echo.
sfk echo -spat \x20 \x20C = Installation personnalis\xe9e 
echo        * Installation sur n'importe quel emplacement de votre choix
echo.
echo.
echo                            E = Sortir sans installer
echo.
echo.
set /p proceed=     Entrez votre choix ici: 

if /i "%proceed%" EQU "E" exit
if /i "%proceed%" EQU "C" goto:updaterpage2

if /i "%proceed%" EQU "L" set InstallPath=%homedrive%\ModMii
if /i "%proceed%" EQU "L" goto:updaterpage3

if /i "%proceed%" EQU "D" set InstallPath=%DESKTOPDIR%\ModMii
if /i "%proceed%" EQU "D" goto:updaterpage3

echo Vous avez saisi une valeur incorrecte
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpage



:updaterpage2
set InstallPathTemp=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                      par XFlak
echo.
echo.
echo         Entrez la lettre de lecteur (ou le chemin) pour l'installation ModMii:
echo.
echo.
echo         EXEMPLES
echo         ========
echo.
echo            E:\ModMii
echo.
echo            F:
echo.
echo            G:\PortableApps\ModMii
echo.
echo.
echo                            B = Retour
echo.
echo                            E = Sortir sans installer
echo.
echo.
set /p InstallPathTemp=     Entrez votre choix ici: 

IF "%InstallPathTemp%"=="" echo Vous avez saisi une valeur incorrecte
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
echo                                      par XFlak
echo.
echo.
echo                 Ou voulez-vous installer les raccourcis pour ModMii?
echo.
echo.
echo.
echo                     D = Bureau seulement
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 S = Menu D\xe9marrer seulement
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 A = Bureau et Menu D\xe9marrer
echo.
echo                     N = Aucun
echo.
echo.
echo                              B = Retour
echo.
echo                              E = Sortir sans installer
echo.
echo.
set /p shortcut=     Entrez votre choix ici: 

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

echo Vous avez entre un choix incorrect
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpage3



:updaterpageconfirm
set updateconfirm=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                      par XFlak
echo.
echo.
sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Installer ModMii en utilisant les param\xe8tres suivants?
echo.
echo.
sfk echo -spat \x20 \x20 \x20 * Installer ModMii \xe0 l'emplacement suivant:
echo         - %InstallPath%
echo.
if /i "%shortcut%" EQU "D" echo       * Faire le raccourci sur le Bureau
if /i "%shortcut%" EQU "S" sfk echo -spat \x20 \x20 \x20 * Faire le raccourci sur le Menu D\xe9marrer
if /i "%shortcut%" EQU "A" sfk echo -spat \x20 \x20 \x20 * Faire des raccourcis sur le Bureau et le Menu D\xe9marrer
if /i "%shortcut%" EQU "N" sfk echo -spat \x20 \x20 \x20 * Ne pas faire de raccourcis sur le Bureau et le Menu D\xe9marrer

echo.
echo.
echo.
echo.
echo                            Y = Oui
echo.
echo                            B = Retour
echo.
echo                            E = Sortir sans installer
echo.
echo.
set /p updateconfirm=     Entrez votre choix ici: 

if /i "%updateconfirm%" EQU "E" exit
if /i "%updateconfirm%" EQU "Y" goto:proceed
if /i "%updateconfirm%" EQU "B" goto:updaterpage3


echo Vous avez saisi une valeur incorrecte
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
sfk echo -spat \x20 Echec du contr\xf4le des mises \xe0 jour,
sfk echo -spat \x20 v\xe9rifiez votre connexion internet ainsi que les r\xe9glages du firwall.
pause>nul