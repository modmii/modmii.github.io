@echo off

title=ModMii Installer
mode con cols=85 lines=25
color 1f

set currentversion=0.0.0
set UPDATENAME=ModMiiSpanishUpdate
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
echo                                       by XFlak
echo.
echo.
echo                       Donde le gustaria instalar ModMii?
echo.
echo.
echo    L = Instalacion Local
echo        * Instalado en %homedrive%\ModMii
echo.
echo.
echo    D = instalacion en el escritorio
echo        * Instalado en %DESKTOPDIR%\ModMii
echo.
echo.
echo    C = instalacion portatil personalizado
echo        * instalado en ubicacion definida por el usuario
echo.
echo.
echo                            E = Salir sin instalar
echo.
echo.
set /p proceed=     Escriba la seleccion aqui: 

if /i "%proceed%" EQU "E" exit
if /i "%proceed%" EQU "C" goto:updaterpage2

if /i "%proceed%" EQU "L" set InstallPath=%homedrive%\ModMii
if /i "%proceed%" EQU "L" goto:updaterpage3

if /i "%proceed%" EQU "D" set InstallPath=%DESKTOPDIR%\ModMii
if /i "%proceed%" EQU "D" goto:updaterpage3

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpage



:updaterpage2
set InstallPathTemp=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                       by XFlak
echo.
echo.
echo        Introduzca la letra de la unidad (o ruta) para la instalacion ModMii:
echo.
echo.
echo         EjEMPLOS
echo         ========
echo.
echo            E:\ModMii
echo.
echo            F:
echo.
echo            G:\PortableApps\ModMii
echo.
echo.
echo                            B = Atras
echo.
echo                            E = Salir sin instalar
echo.
echo.
set /p InstallPathTemp=     Escriba la seleccion aqui: 

IF "%InstallPathTemp%"=="" echo Ha introducido una clave incorrecta
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
echo %InstallPathTemp:~0,2% no existe, por favor, intentelo de nuevo...
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
echo        Instalar ModMii accesos directos al escritorio, Menu Inicio, ambos o ninguno?
echo.
echo.
echo.
echo                 D = Escritorio solo
echo.
echo                 S = Menu Inicio solo
echo.
echo                 A = Todo lo anterior
echo.
echo                 N = Nada
echo.
echo.
echo                            B = Atras
echo.
echo                            E = Salir sin instalar
echo.
echo.
set /p shortcut=     Escriba la seleccion aqui: 

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

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:updaterpage3



:updaterpageconfirm
set updateconfirm=
cls
echo                                   ModMii Installer                              v%InstallerVersion%
echo                                       by XFlak
echo.
echo.
echo                      Instale ModMii usando la siguiente configuracion?
echo.
echo.
echo      * Instale ModMii en la siguiente ubicacion:
echo        - %InstallPath%
echo.
if /i "%shortcut%" EQU "D" echo      * Crear un acceso directo ModMii en el escritorio solo
if /i "%shortcut%" EQU "S" echo      * Crear un acceso directo ModMii en el menu Inicio solo
if /i "%shortcut%" EQU "A" echo      * Crear accesos directos ModMii en el escritorio  y menu inicio
if /i "%shortcut%" EQU "N" echo      * No crear accesos directos ModMii en el escritorio y menu Inicio

echo.
echo.
echo.
echo.
echo                            Y = Si
echo.
echo                            B = Atras
echo.
echo                            E = Salir sin instalar
echo.
echo.
set /p updateconfirm=     Escriba la seleccion aqui: 

if /i "%updateconfirm%" EQU "E" exit
if /i "%updateconfirm%" EQU "Y" goto:proceed
if /i "%updateconfirm%" EQU "B" goto:updaterpage3


echo Ha introducido una clave incorrecta
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
echo   ModMii ha fallado la descarga, compruebe la conexion a Internet y la configuracion del firewall.
pause>nul