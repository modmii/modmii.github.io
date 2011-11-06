@echo off
setlocal
:top
set currentversion=4.7.5
set currentversioncopy=%currentversion%
set agreedversion=
if exist Support\settings.bat call Support\settings.bat

if not exist support cd..
set cygwin=nodosfilewarning
set ModMiipath=%cd%

set UPDATENAME=ModMiiSpanishUpdate
if exist Updatetemp.bat attrib -h Updatetemp.bat
if exist Updatetemp.bat del updatetemp.bat>nul


if "%ModMiiInstallerpath%"=="" goto:notfreshinstall
if exist "%ModMiiInstallerpath%"\Updatetemp.bat attrib -h "%ModMiiInstallerpath%"\Updatetemp.bat
if exist "%ModMiiInstallerpath%"\Updatetemp.bat del "%ModMiiInstallerpath%"\Updatetemp.bat>nul
if exist "%ModMiiInstallerpath%"\%UPDATENAME%.bat attrib -h "%ModMiiInstallerpath%"\%UPDATENAME%.bat
if exist "%ModMiiInstallerpath%"\%UPDATENAME%.bat del "%ModMiiInstallerpath%"\%UPDATENAME%.bat>nul
:notfreshinstall

::-------------------CMD LINE SUPPORT----------------------


::how to pass variables to ModMii via command line
::"ModMii" a b c d e f g h i
::equals
::"ModMii" %1 %2 %3 %4 %5 %6 %7 %8 %9
set one=%1
set two=%2
set three=%3
set four=%4
set five=%5
set six=%6
set seven=%7
set eight=%8
set nine=%9
set cmdinput=%*

if "%one%"=="" (goto:notcmd)

set cmdlinemode=Y

if /i "%one%" EQU "W" goto:hardcodedoptions
if /i "%one%" EQU "HS" goto:hardcodedoptions
if /i "%one%" EQU "S" goto:hardcodedoptions
if /i "%one%" EQU "SE" goto:hardcodedoptions
if /i "%one%" EQU "U" goto:hardcodedoptions
if /i "%one%" EQU "E" goto:hardcodedoptions
if /i "%one%" EQU "L" goto:hardcodedoptions
if /i "%one%" EQU "SU" goto:hardcodedoptions

if not "%one%"=="" (goto:cmdlinehelp)



:cmdlinehelp
title ModMii Command Line Help
cls
support\sfk echo [Green]Comando ModMii uso en linea
echo.

support\sfk echo [Red]ModMii Asistente rapido Modo de uso:

echo ModMii.exe W firma-actual Region Firma-deseada Opciones extras
echo.
echo ModMii.exe 1 2 3 4 5 Opciones extras
echo.
echo 1) Asistente "W"
echo 2) Firmware actual: "4.3","4.2","4.1","4.0","3.X" [3.0-3.5], "O" [otros ^<2.2]
echo 3) Region: "U","E","J","K"
echo.       Si tu Wii fue cambiada la region, pero sin ser original de Corea,
echo        Seleccione la region que hay actualmente en
echo 4) Firmware deseado: "4.1", "4.2", "4.3"
echo.
echo Extras:
echo         "Rojo" Tema Rojo [No se puede utilizar simultaneamente con otros temas]
echo         "Verde" Tema Verde [No se puede utilizar simultaneamente con otros temas]
echo         "Azul" Tema Azul [No se puede utilizar simultaneamente con otros temas]
echo         "Naranja" Tema Naranja [No se puede utilizar simultaneamente con otros temas]
echo.
echo         "CH" Todos los Canales Wii [ie. Foto, Tiempo, noticias, etc.]
echo             "FOTOS" Canal Fotos
echo             "TIENDA" Canal Tienda [y IOS56]
echo             "MII" Canal Mii
echo             "SPEAK" Canal Wii Speak [no aplicable a los nands coreanos]
echo             "NOTICIAS" Canal Noticias [no aplicable a los nands coreanos]
echo             "NET" Canal Internet [no aplicable a los nands coreanos]
echo             "TIEMPO" Canal Tiempo [no aplicable a los nands coreanos]
echo.
echo         "USB" Configurar el USB-loader [elegir solamente uno A, B y C]
echo          A - "FAT32" Formato HDD como FAT32 [defecto]
echo              "NTFS" Formato HDD como NTFS
echo              "FAT32-NTFS" Particion HDD con parte FAT32 y parte NTFS
echo              "WBFS" HDD ya esta formateado como WBFS
echo              "WBFS-FAT32" HDD ya tiene particiones, como parte FAT32 y parte WBFS
echo          B - "CFG" Usar Configurable USB-Loader [defecto]
echo              "FLOW" Usar WiiFlow
echo              "CFG-FLOW" Utilizar tanto Configurable USB-Loader y WiiFlow
echo          C - "USBConfig" Guardar USB-Loader archivos configuracion de USB [defecto]
echo              "SDConfig" Guardar USB-Loader archivos configuracion de Tarjeta SD
echo.
echo          "Min" actualizaci�n minima - Elija una o mas de las siguientes actualizaciones:
echo               "HBC" Homebrew Channel y\o BootMii
echo               "REC" cIOSs recomendados (y cMIOS si esta activada en las opciones)
echo               "YAWMM" Sin embargo, otro Mod Wad Manager
echo               "236" IOS236
echo               "Pri" Priiloader v0.7 y hacks_hash.ini
echo.
echo         "Guia" Generar guia UNICA
echo.
support\sfk echo [Blue]Ejemplos:
echo ModMii.exe W 3.X U 4.1
echo ModMii.exe W 4.2 U 4.2 Azul CH USB
echo ModMii.exe W 4.1 J 4.1 Verde USB NTFS Flow SDConfig
echo ModMii.exe W 4.3 E 4.3 Shop Speak Min 236 REC Verde
echo.
support\sfk echo [Red]ModMii USB-Loader Soluciones Express Modo de uso:

echo ModMii.exe U Opciones Extras
echo.
echo Extras:
echo         Elija no mas de una A, B y C:
echo          A - "FAT32" Formato HDD como FAT32 [defecto]
echo              "NTFS" Formato HDD como NTFS
echo              "FAT32-NTFS" Particion HDD como parte FAT32 y parte NTFS
echo              "WBFS" HDD ya esta formateado como WBFS
echo              "WBFS-FAT32" HDD ya tiene particiones, como parte FAT32 y parte WBFS
echo          B - "CFG" Usar Configurable USB-Loader [defecto]
echo              "FLOW" Usar WiiFlow-Loader y WiiFlow
echo          C - "USBConfig" Guardar USB-Loader archivos configuracion de USB [defecto]
echo              "SDConfig" Guardar USB-Loader archivos configuracion de targeta SD
echo.
echo         "Guia" Generar guia UNICA
echo.
support\sfk echo [Blue]Ejemplos:
echo ModMii.exe U
echo ModMii.exe U NTFS Flow
echo ModMii.exe U FAT32-NTFS CFG-Flow SDConfig
echo.
support\sfk echo [Red]ModMii HackMii Soluciones Express Modo de uso:

echo ModMii.exe HS Firmware Opciones Extras
echo.
echo ModMii.exe 1 2 Opciones Extras
echo.
echo 1) HackMii Soluciones "HS"
echo 2) Firmware: "4.3","4.2","4.1","4.0","3.X" [3.0-3.5]
echo.
echo Extras:
echo         "Guia" Generar guia UNICA
echo.
support\sfk echo [Blue]Ejemplos:
echo ModMii.exe HS 4.3
echo ModMii.exe HS 4.1
echo ModMii.exe HS 3.X
echo.


support\sfk echo [Red]ModMii Entrada sistema actualizador express Modo de uso:

echo ModMii.exe SU sysCheck.csv Opciones Extras
echo.
echo ModMii.exe 1 2 Opciones Extras
echo.
echo 1) sysCheck actualizador "SU"
echo 2) sysCheck Registro de Ruta\Nombre
echo.
echo Extras:
echo         "Pri" Instalar Priiloader si no puede determinar si ya esta instalado
echo                 de lo contrario no se instalar�
echo         "Guia" Generar guia UNICA
echo.
support\sfk echo [Blue]Ejemplos:
echo ModMii.exe SU sysCheck.csv
echo ModMii.exe SU X:\New Folder\syscheck.csv
echo ModMii.exe SU "XFlaks-sysCheck.csv" Guia Prii
echo.


support\sfk echo [Red]ModMii SNEEK Instalacion rapida Modo de uso:

echo ModMii.exe S SNEEK-TYPE Opciones
echo.
echo SNEEK-TYPE: "S" SNEEK, "U" UNEEK, "SD" SNEEK+DI, "UD" UNEEK+DI
echo.
support\sfk echo [Blue]Ejemplos:
echo ModMii.exe S S
echo ModMii.exe S U
echo ModMii.exe S SD
echo ModMii.exe S UD
echo.
echo Nota: Puede instalar S\UNEEK y al mismo tiempo crear la emulaci�n de una
echo       NAND utilizando las instrucciones del creador Emulador NAND a continuaci�n.
echo.
support\sfk echo [Red]ModMii Emulador NAND creador Express modo de uso

echo ModMii.exe E SNEEK-TYPE Firmware Region Opciones Extras
echo.
echo ModMii.exe 1 2 3 4 Opciones Extras
echo.
echo 1) Creador Emulador NAND "E" [o "SE" para instalar S\UNEEK Y crear una NAND]
echo 2) SNEEK-TYPE: "S" SNEEK, "U" UNEEK, "SD" SNEEK+DI, "UD" UNEEK+DI
echo 3) Firmware: "4.1", "4.2", "4.3" [4.1 solo esta disponible para SNEEK y UNEEK]
echo 4) Region: "U","E","J","K" [J/K solo esta disponible para SNEEK y UNEEK]
echo.
echo Extras:
echo         "Rojo" Tema Rojo [No se puede utilizar simultaneamente con otros temas]
echo         "Verde" Tema verde [No se puede utilizar simultaneamente con otros temas]
echo         "Azul" tema Azul [No se puede utilizar simultaneamente con otros temas]
echo         "Naranja" Tema Naranja [No se puede utilizar simultaneamente con otros temas]
echo.
echo         "HBF" Homebrew Filter
echo         "249" cIOS249 rev14
echo         "NMM" Sin tarjetas de memoria [no se puede usar simultaneamente con DML]
echo         "DML" Dios Mios Lite [Solo para SNEEK+DI]
echo         "S2U" Switch2Uneek [Solo para UNEEK o UNEEK+DI]
echo         "Pri" Priiloader v0.4 y hacks.ini
echo         "Joy" JoyFlow Forwarder y App [Solo para UNEEK o UNEEK+DI]
echo.
echo         "CH" Todos los canales Wii [ie. Foto, Tiempo, Noticias, etc.]
echo             "FOTO" Canal Foto
echo             "TIENDA" Canal Tienda [y IOS56]
echo             "MII" Canal Mii
echo             "SPEAK" Canal Wii Speak [no aplicable a las NANDs coreanas]
echo             "NOTICIAS" Canal Noticias [no aplicable a las NANDs coreanas]
echo             "NET" Canal Internet [no aplicable a las NANDs coreanas]
echo             "TIEMPO" Canal Tiempo [no aplicable a las NANDs coreanas]
echo.
support\sfk echo [Blue]Ejemplos:
echo ModMii.exe E U 4.3 U
echo ModMii.exe E SD 4.2 E Azul HBF 249 DML Pri Joy FOTO
echo ModMii.exe SE UD 4.2 U Naranja HBF 249 NMM S2U Pri Joy CH
echo.
support\sfk echo [Red]ModMii Descargar cola express Modo de uso:

echo ModMii.exe L Opciones Cola Descarga
echo.
echo Nota: Cola de descarga deben existir y ser guardados en temp\DownloadQueues\
echo.
support\sfk echo [Blue]Ejemplos:
echo ModMii.exe L cIOSs
echo ModMii.exe L "Mi Tema Fav"
echo ModMii.exe L Mi Fav Themes.bat
echo.
support\sfk echo [Red]Opciones

echo Definir las opciones de ModMii usando los siguientes comandos.
echo.
echo Nota: Si una opcion no esta definida ModMii utiliza guardado\configuracion por defecto.
echo       guardado\configuracion por defecto sera restaurado despues de cada comando.
echo       Si no estas seguro de lo que es una opcion, lea la descripcion
echo       en la pagina de opciones de ModMii.
echo.
support\sfk echo [Cyan]Letra de unidad o configuracion de la Ruta de la tarjeta SD

echo ModMii.exe [base command] unidad:ruta?
echo.
support\sfk echo [Blue]Ejemplos:
echo ModMii.exe [base command] Unidad: carpeta nueva?
echo ModMii.exe [base command] Unidad:E:?
echo.
echo Nota: no olvide el "?" que marca el final de la ruta
echo.
support\sfk echo [Cyan]Letra de unidad o configuracion de la Ruta de disco duro USB

echo ModMii.exe [base command] DriveU:Path?
echo.
support\sfk echo [Blue]Examples:
echo ModMii.exe [base command] UnidadU:carpeta nueva?
echo ModMii.exe [base command] UnidadU:H:?
echo.
echo Nota: no se olvide del "?" que marca el final de la ruta
echo.
support\sfk echo [Cyan]Programa PC Guarda ubicacion

echo ModMii.exe [base command] PC:A
echo ModMii.exe [base command] PC:L
echo ModMii.exe [base command] PC:P
echo.
echo Donde;
echo A = Auto, L = Local, and P = Portable
echo.
support\sfk echo [Cyan]Guardar raiz

echo ModMii.exe [base command] RS:E
echo ModMii.exe [base command] RS:D
echo.
echo Donde;
echo E = activado and D = Desactivado
echo.
support\sfk echo [Cyan]Efectos Canal

echo ModMii.exe [base command] CE:NS
echo ModMii.exe [base command] CE:S
echo ModMii.exe [base command] CE:FS
echo.
echo Donde;
echo NS = No Spin, S = Spin and FS = Fast Spin
echo.
support\sfk echo [Cyan]mantener carpeta 00000001 y\o archivo NUS

echo ModMii.exe [base command] 1:0
echo ModMii.exe [base command] 1:1
echo ModMii.exe [base command] 1:N
echo ModMii.exe [base command] 1:A
echo.
echo Donde;
echo 0 = No mantener, 1 = Mantener 00000001, N = Mantener NUS y A = Mantener Todo
echo.
support\sfk echo [Cyan]Actualizar IOSs activos

echo ModMii.exe [base command] UIOS:E
echo ModMii.exe [base command] UIOS:D
echo.
echo Donde;
echo E = activado and D = Desactivado
echo.
support\sfk echo [Cyan]Incluir IOS36v3608 en ModMii Asistente Descargas

echo ModMii.exe [base command] IOS36:E
echo ModMii.exe [base command] IOS36:D
echo.
echo Donde;
echo E = activado and D = Desactivado
echo.
support\sfk echo [Cyan]Incluir cMIOS en ModMii Asistente Descargas

echo ModMii.exe [base command] CMIOS:E
echo ModMii.exe [base command] CMIOS:D
echo.
echo Donde;
echo E = activado and D = Desactivado
echo.
support\sfk echo [Cyan]Incluir USB-Loader Canal Forwarder en ModMii Asistente de Descargas

echo ModMii.exe [base command] FWD:E
echo ModMii.exe [base command] FWD:D
echo.
echo Donde;
echo E = activado and D = Desactivado
echo.
support\sfk echo [Cyan]Salida Detallada para el Wget y SNEEK Installer

echo ModMii.exe [base command] VERBOSE:E
echo ModMii.exe [base command] VERBOSE:D
echo.
echo Donde;
echo E = activado and D = Desactivado
echo.
support\sfk echo [Cyan]SNEEK y SNEEK+DI acceso SD

echo ModMii.exe [base command] SSD:E
echo ModMii.exe [base command] SSD:D
echo.
echo Donde;
echo E = activado and D = Desactivado
echo.
support\sfk echo [Cyan]SNEEK Salida detallada

echo ModMii.exe [base command] SNKVERBOSE:E
echo ModMii.exe [base command] SNKVERBOSE:D
echo.
echo Donde;
echo E = activado and D = Desactivado
echo.
support\sfk echo [Cyan]Font.bin color para SNEEK+DI/UNEEK+DI

echo ModMii.exe [base command] Font:B
echo ModMii.exe [base command] Font:W
echo.
echo Donde;
echo B = Negro and W = Blanco
echo.
echo.
echo Pulse cualquier tecla para cerrar el men� de ayuda...
pause>nul
exit

::this will stop the batch file from opening, and keep the cmd box open
::cmd.exe



::-----------------------------------
:hardcodedoptions
echo %cmdinput%>temp\cmdinput.txt
findStr /I ":" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 goto:hardcodedoptionsfinish

::backup current settings (in order to revert after cmd)
if not exist support\settings.bat echo ::ModMii Settings >support\settings.bat
copy /y support\settings.bat support\settings.bak>nul



::-----------DRIVE: (ie. DRIVE:whatever_ test?)---------------
findStr /I " Drive:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:nodrivecmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

::check if a ? was entered
findStr /I "?" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (echo Por favor, marca el final de la configuraci�n de la unidad con un signo de interrogaci�n "?", int�ntalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* DRIVE:"__ -rep _\x3f*__ -write -yes>nul

set /p DRIVE= <temp\cmdinput2.txt

:doublecheckcmd
set fixslash=
if /i "%DRIVE:~-1%" EQU "\" set fixslash=yes
if /i "%DRIVE:~-1%" EQU "/" set fixslash=yes
if /i "%fixslash%" EQU "yes" set DRIVE=%DRIVE:~0,-1%
if /i "%fixslash%" EQU "yes" goto:doublecheckcmd

::if second char is ":" check if drive exists
if /i "%DRIVE:~1,1%" NEQ ":" goto:skipcheck
if exist "%DRIVE:~0,2%" (goto:skipcheck) else (echo "%DRIVE:~0,2%" no existe, por favor, intentalo de nuevo...)
if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul
@ping 127.0.0.1 -n 5 -w 1000> nul
exit
:skipcheck

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set Drive=" -write -yes>nul
echo Set Drive=%DRIVE%>>Support\settings.bat

::remove from temp\cmdinput.txt (compensate for _'s by replacing them with \x5f)
support\sfk -spat filter temp\cmdinput2.txt -rep _\x5f_\x22_ -write -yes>nul
support\sfk filter -quiet temp\cmdinput2.txt -rep _"""_\x5f_ -write -yes

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk -spat filter temp\cmdinput.txt -rep _" Drive:%removeme%?"__ -write -yes>nul
:nodrivecmd




::-----------DRIVEU: (ie. DRIVEU:whatever_ test?)---------------
findStr /I " DRIVEU:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:noDRIVEUcmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

::check if a ? was entered
findStr /I "?" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (echo Por favor, marque el final de su configuracion discoU con un signo de interrogacion "?", intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* DRIVEU:"__ -rep _\x3f*__ -write -yes>nul

set /p DRIVEU= <temp\cmdinput2.txt

:doublecheckcmd
set fixslash=
if /i "%DRIVEU:~-1%" EQU "\" set fixslash=yes
if /i "%DRIVEU:~-1%" EQU "/" set fixslash=yes
if /i "%fixslash%" EQU "yes" set DRIVEU=%DRIVEU:~0,-1%
if /i "%fixslash%" EQU "yes" goto:doublecheckcmd

::if second char is ":" check if DRIVEU exists
if /i "%DRIVEU:~1,1%" NEQ ":" goto:skipcheck
if exist "%DRIVEU:~0,2%" (goto:skipcheck) else (echo "%DRIVEU:~0,2%" no existe, por favor, intentalo de nuevo...)
if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul
@ping 127.0.0.1 -n 5 -w 1000> nul
exit
:skipcheck

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set DRIVEU=" -write -yes>nul
echo Set DRIVEU=%DRIVEU%>>Support\settings.bat

::remove from temp\cmdinput.txt (compensate for _'s by replacing them with \x5f)
support\sfk -spat filter temp\cmdinput2.txt -rep _\x5f_\x22_ -write -yes>nul
support\sfk filter -quiet temp\cmdinput2.txt -rep _"""_\x5f_ -write -yes

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk -spat filter temp\cmdinput.txt -rep _" DRIVEU:%removeme%?"__ -write -yes>nul
:noDRIVEUcmd

::-----------PC: Option---------------
findStr /I " PC:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:noPCcmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* PC:"__ -rep _\x20*__ -write -yes>nul

set /p PCSAVEcmd= <temp\cmdinput2.txt

if /i "%PCSAVEcmd%" EQU "A" set PCSAVE=Auto
if /i "%PCSAVEcmd%" EQU "L" set PCSAVE=Local
if /i "%PCSAVEcmd%" EQU "P" set PCSAVE=Portable

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set PCSAVE=" -write -yes>nul
echo Set PCSAVE=%PCSAVE%>>Support\settings.bat

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk filter temp\cmdinput.txt -rep _" PC:%removeme%"__ -write -yes>nul
:noPCcmd


::-----------RS: Option---------------
findStr /I " RS:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:noRScmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* RS:"__ -rep _\x20*__ -write -yes>nul

set /p ROOTSAVEcmd= <temp\cmdinput2.txt

if /i "%ROOTSAVEcmd%" EQU "E" set ROOTSAVE=ON
if /i "%ROOTSAVEcmd%" EQU "D" set ROOTSAVE=OFF

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set ROOTSAVE=" -write -yes>nul
echo Set ROOTSAVE=%ROOTSAVE%>>Support\settings.bat

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk filter temp\cmdinput.txt -rep _" RS:%removeme%"__ -write -yes>nul
:noRScmd


::-----------CE: Option---------------
findStr /I " CE:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:noCEcmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* CE:"__ -rep _\x20*__ -write -yes>nul

set /p effectcmd= <temp\cmdinput2.txt

if /i "%effectcmd%" EQU "NS" set effect=no-spin
if /i "%effectcmd%" EQU "S" set effect=spin
if /i "%effectcmd%" EQU "FS" set effect=fast-spin

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set effect=" -write -yes>nul
echo Set effect=%effect%>>Support\settings.bat

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk filter temp\cmdinput.txt -rep _" CE:%removeme%"__ -write -yes>nul
:noCEcmd


::-----------keep *01 or NUS Folders---------------
findStr /I " 1:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:no1cmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* 1:"__ -rep _\x20*__ -write -yes>nul

set /p Option1cmd= <temp\cmdinput2.txt

if /i "%Option1cmd%" EQU "0" set Option1=off
if /i "%Option1cmd%" EQU "1" set Option1=on
if /i "%Option1cmd%" EQU "N" set Option1=nus
if /i "%Option1cmd%" EQU "A" set Option1=all

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set Option1=" -write -yes>nul
echo Set Option1=%Option1%>>Support\settings.bat

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk filter temp\cmdinput.txt -rep _" 1:%removeme%"__ -write -yes>nul
:no1cmd


::-----------UIOS: Option---------------
findStr /I " UIOS:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:noUIOScmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* UIOS:"__ -rep _\x20*__ -write -yes>nul

set /p ACTIVEIOScmd= <temp\cmdinput2.txt

if /i "%ACTIVEIOScmd%" EQU "E" set ACTIVEIOS=ON
if /i "%ACTIVEIOScmd%" EQU "D" set ACTIVEIOS=OFF

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set ACTIVEIOS=" -write -yes>nul
echo Set ACTIVEIOS=%ACTIVEIOS%>>Support\settings.bat

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk filter temp\cmdinput.txt -rep _" UIOS:%removeme%"__ -write -yes>nul
:noUIOScmd


::-----------IOS36: Option---------------
findStr /I " IOS36:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:noIOS36cmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* IOS36:"__ -rep _\x20*__ -write -yes>nul

set /p Option36cmd= <temp\cmdinput2.txt

if /i "%Option36cmd%" EQU "E" set Option36=ON
if /i "%Option36cmd%" EQU "D" set Option36=OFF

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set Option36=" -write -yes>nul
echo Set Option36=%Option36%>>Support\settings.bat

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk filter temp\cmdinput.txt -rep _" IOS36:%removeme%"__ -write -yes>nul
:noIOS36cmd


::-----------CMIOS: Option---------------
findStr /I " CMIOS:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:noCMIOScmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* CMIOS:"__ -rep _\x20*__ -write -yes>nul

set /p CMIOSOPTIONcmd= <temp\cmdinput2.txt

if /i "%CMIOSOPTIONcmd%" EQU "E" set CMIOSOPTION=ON
if /i "%CMIOSOPTIONcmd%" EQU "D" set CMIOSOPTION=OFF

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set CMIOSOPTION=" -write -yes>nul
echo Set CMIOSOPTION=%CMIOSOPTION%>>Support\settings.bat

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk filter temp\cmdinput.txt -rep _" CMIOS:%removeme%"__ -write -yes>nul
:noCMIOScmd

::-----------USB-Loader Forwarder: Option---------------
findStr /I " FWD:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:noFWDcmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* FWD:"__ -rep _\x20*__ -write -yes>nul

set /p FWDOPTIONcmd= <temp\cmdinput2.txt

if /i "%FWDOPTIONcmd%" EQU "E" set FWDOPTION=ON
if /i "%FWDOPTIONcmd%" EQU "D" set FWDOPTION=OFF

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set FWDOPTION=" -write -yes>nul
echo Set FWDOPTION=%FWDOPTION%>>Support\settings.bat

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk filter temp\cmdinput.txt -rep _" FWD:%removeme%"__ -write -yes>nul
:noFWDcmd


::-----------VERBOSE: Option---------------
findStr /I " VERBOSE:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:noVERBOSEcmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* VERBOSE:"__ -rep _\x20*__ -write -yes>nul

set /p ModMiiverbosecmd= <temp\cmdinput2.txt

if /i "%ModMiiverbosecmd%" EQU "E" set ModMiiverbose=ON
if /i "%ModMiiverbosecmd%" EQU "D" set ModMiiverbose=OFF

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set ModMiiverbose=" -write -yes>nul
echo Set ModMiiverbose=%ModMiiverbose%>>Support\settings.bat

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk filter temp\cmdinput.txt -rep _" VERBOSE:%removeme%"__ -write -yes>nul
:noVERBOSEcmd


::-----------SSD: Option---------------
findStr /I " SSD:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:noSSDcmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* SSD:"__ -rep _\x20*__ -write -yes>nul

set /p SSDcmd= <temp\cmdinput2.txt

if /i "%SSDcmd%" EQU "E" set SSD=ON
if /i "%SSDcmd%" EQU "D" set SSD=OFF

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set SSD=" -write -yes>nul
echo Set SSD=%SSD%>>Support\settings.bat

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk filter temp\cmdinput.txt -rep _" SSD:%removeme%"__ -write -yes>nul
:noSSDcmd


::-----------snkverbose: Option---------------
findStr /I " snkverbose:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:nosnkverbosecmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* snkverbose:"__ -rep _\x20*__ -write -yes>nul

set /p sneekverbosecmd= <temp\cmdinput2.txt

if /i "%sneekverbosecmd%" EQU "E" set sneekverbose=ON
if /i "%sneekverbosecmd%" EQU "D" set sneekverbose=OFF

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set sneekverbose=" -write -yes>nul
echo Set sneekverbose=%sneekverbose%>>Support\settings.bat

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk filter temp\cmdinput.txt -rep _" snkverbose:%removeme%"__ -write -yes>nul
:nosnkverbosecmd


::-----------Font: Option---------------
findStr /I " Font:" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:noFontcmd) else (copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul)

support\sfk filter -spat temp\cmdinput2.txt -rep _"* Font:"__ -rep _\x20*__ -write -yes>nul

set /p SNKFONTcmd= <temp\cmdinput2.txt

if /i "%SNKFONTcmd%" EQU "B" set SNKFONT=B
if /i "%SNKFONTcmd%" EQU "W" set SNKFONT=W

::overwrite option in settings.bat
support\sfk filter Support\settings.bat -!"Set SNKFONT=" -write -yes>nul
echo Set SNKFONT=%SNKFONT%>>Support\settings.bat

::remove hard option from cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk filter temp\cmdinput.txt -rep _" Font:%removeme%"__ -write -yes>nul
:noFontcmd


:hardcodedoptionsfinish

::remove hard options from %cmdinput% to avoid conflict
set /p cmdinput= <temp\cmdinput.txt

if /i "%one%" EQU "W" goto:cmdlinewizard
if /i "%one%" EQU "HS" goto:cmdlinehackmiisolutions
if /i "%one%" EQU "S" goto:cmdlinesneekinstaller
if /i "%one%" EQU "U" goto:cmdlineUSBLoaderSetup
if /i "%one%" EQU "SE" goto:cmdlineemunandbuilder
if /i "%one%" EQU "E" goto:cmdlineemunandbuilder
if /i "%one%" EQU "L" goto:cmdlineloadqueue
if /i "%one%" EQU "SU" goto:cmdlinesyscheck
::-----------------------------------
:cmdlinewizard
set MENU1=%one%
set VIRGIN=Y


if /i "%two%" EQU "4.3" set FIRMSTART=%two%
if /i "%two%" EQU "4.2" set FIRMSTART=%two%
if /i "%two%" EQU "4.1" set FIRMSTART=%two%
if /i "%two%" EQU "4.0" set FIRMSTART=%two%
if /i "%two%" EQU "3.X" set FIRMSTART=%two%
if /i "%two%" EQU "o" set FIRMSTART=%two%
if "%firmstart%"=="" (echo "%two%" no es una entrada valida, intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)

if /i "%three%" EQU "U" set REGION=%three%
if /i "%three%" EQU "E" set REGION=%three%
if /i "%three%" EQU "J" set REGION=%three%
if /i "%three%" EQU "K" set REGION=%three%
if "%region%"=="" (echo "%three%" no es una entrada valida, intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)


if /i "%four%" EQU "4.3" set FIRM=%four%
if /i "%four%" EQU "4.2" set FIRM=%four%
if /i "%four%" EQU "4.1" set FIRM=%four%
if "%firm%"=="" (echo "%four%" no es una entrada valida, intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)


::----EXtras------
::set defaults
set ThemeSelection=N
set MIIQ=N
set PIC=N
set NET=N
set WEATHER=N
set NEWS=N
set SHOP=N
set SPEAK=N
set USBGUIDE=N

findStr /I " Guide" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set cmdguide=) else (set cmdguide=G)
if /i "%cmdguide%" EQU "G" set settings=G


::----themes----
findStr /I " Red" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set ThemeSelection=N) else (set ThemeSelection=R)
if /i "%ThemeSelection%" EQU "R" goto:donecmdthemes

findStr /I " Green" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set ThemeSelection=N) else (set ThemeSelection=G)
if /i "%ThemeSelection%" EQU "G" goto:donecmdthemes

findStr /I " Blue" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set ThemeSelection=N) else (set ThemeSelection=BL)
if /i "%ThemeSelection%" EQU "BL" goto:donecmdthemes

findStr /I " Orange" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set ThemeSelection=N) else (set ThemeSelection=O)
if /i "%ThemeSelection%" EQU "O" goto:donecmdthemes
:donecmdthemes


findStr /I " CH" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set MIIQ=N) else (set MIIQ=Y)
::if /i "%MIIQ%" EQU "Y" set MIIQ=Y
if /i "%MIIQ%" EQU "Y" set PIC=Y
if /i "%MIIQ%" EQU "Y" set SHOP=Y
if /i "%REGION%" EQU "K" goto:nomoreKchannels
if /i "%MIIQ%" EQU "Y" set NET=Y
if /i "%MIIQ%" EQU "Y" set WEATHER=Y
if /i "%MIIQ%" EQU "Y" set NEWS=Y
if /i "%MIIQ%" EQU "Y" set SPEAK=Y
:nomoreKchannels
if /i "%MIIQ%" EQU "Y" goto:alreadygotallchannels


findStr /I " PHOTO" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set PIC=N) else (set PIC=Y)

findStr /I " SHOP" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set SHOP=N) else (set SHOP=Y)

findStr /I " MII" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set MIIQ=N) else (set MIIQ=Y)


if /i "%REGION%" EQU "K" goto:alreadygotallchannels

findStr /I " SPEAK" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set SPEAK=N) else (set SPEAK=Y)

findStr /I " NEWS" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set NEWS=N) else (set NEWS=Y)

findStr /I " NET" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set NET=N) else (set NET=Y)

findStr /I " WEATHER" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set WEATHER=N) else (set WEATHER=Y)
:alreadygotallchannels

findStr /I " USB" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:noUSBcmd) else (set USBGUIDE=Y)

::FORMAT - FAT32 (or 1) is default
findStr /I " FAT32-NTFS" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set FORMAT=1) else (set FORMAT=3)
if /i "%FORMAT%" NEQ "1" goto:donecmdformat

findStr /I " WBFS-FAT32" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set FORMAT=1) else (set FORMAT=5)
if /i "%FORMAT%" NEQ "1" goto:donecmdformat

findStr /I " NTFS" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set FORMAT=1) else (set FORMAT=2)
if /i "%FORMAT%" NEQ "1" goto:donecmdformat

findStr /I " WBFS" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set FORMAT=1) else (set FORMAT=4)
:donecmdformat

::Loader - CFG (or 1) is default
findStr /I " CFG-FLOW" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set LOADER=CFG) else (set LOADER=ALL)
if /i "%LOADER%" NEQ "CFG" goto:donecmdloader

findStr /I " FLOW" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set LOADER=CFG) else (set LOADER=FLOW)
:donecmdloader

::USB-Loader Config files (USB is default)
findStr /I " SDConfig" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set USBCONFIG=USB) else (set USBCONFIG=SD)
:noUSBcmd




findStr /I " Min" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (goto:notminupdate) else (set VIRGIN=N)

findStr /I " HBC" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set HMInstaller=N) else (set HMInstaller=Y)

findStr /I " REC" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set RECCIOS=N) else (set RECCIOS=Y)

findStr /I " YAWMM" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set yawmQ=N) else (set yawmQ=Y)

findStr /I " 236" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set IOS236InstallerQ=N) else (set IOS236InstallerQ=Y)

findStr /I " Pri" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set PRIQ=N) else (set PRIQ=Y)
:notminupdate


::go to CMD LINE BOMB
if /i "%firmstart%" NEQ "4.3" goto:skipbomb
if /i "%HMInstaller%" EQU "N" goto:skipbomb
set exploit=BOMB
goto:cmdlineBOMB
:skipbomb

goto:go


::---------------------------------
:cmdlinehackmiisolutions
set MENU1=H


if /i "%two%" EQU "4.3" set FIRMSTART=%two%
if /i "%two%" EQU "4.2" set FIRMSTART=%two%
if /i "%two%" EQU "4.1" set FIRMSTART=%two%
if /i "%two%" EQU "4.0" set FIRMSTART=%two%
if /i "%two%" EQU "3.X" set FIRMSTART=%two%
if "%firmstart%"=="" (echo "%two%" no es una entrada valida, intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)

findStr /I " Guide" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set cmdguide=) else (set cmdguide=G)
if /i "%cmdguide%" EQU "G" set settings=G
If /i "%FIRMSTART%" EQU "4.3" set exploit=BOMB

if /i "%firmstart%" EQU "4.3" (goto:cmdlineBOMB) else (goto:go)


:cmdlineBOMB
start http://please.hackmii.com
echo.
echo    ModMii deberia de abrir su navegador para http://please.hackmii.com
echo.
echo    En esta pagina web, introduzca su region menu del sistema y la direccion MAC
echo.
echo       Nota: para encontrar la direccion MAC de tu Wii, haga clic en el Boton Wii
echo             en la parte inferior izquierda del menu del sistema,haga clic en
echo             Configuracion de Wii, luego Internet, la consola de la Informacion.
echo.
echo.
echo.
echo    Desactive la opcion paquete HackMii Installer por mi, rellenar el codigo
echo    de la imagen y elija cualquiera de los dos. Que se descarga un archivo ZIP,
echo    abrir este archivo, y usted Vera una carpeta de copia privada, y lo
echo    pega en la raiz de la tarjeta SD.
echo.
echo    ModMii va a generar una guia para el supuesto de que hayas hecho esto
echo    correctamente.
echo.
echo.
echo    Pulse cualquier tecla cuando este listo para continuar...
echo.
pause>nul
goto:go

::---------------------------------
:cmdlineUSBLoaderSetup
set MENU1=%one%


::FORMAT - FAT32 (or 1) is default
findStr /I " FAT32-NTFS" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set FORMAT=1) else (set FORMAT=3)
if /i "%FORMAT%" NEQ "1" goto:donecmdformat

findStr /I " WBFS-FAT32" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set FORMAT=1) else (set FORMAT=5)
if /i "%FORMAT%" NEQ "1" goto:donecmdformat

findStr /I " NTFS" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set FORMAT=1) else (set FORMAT=2)
if /i "%FORMAT%" NEQ "1" goto:donecmdformat

findStr /I " WBFS" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set FORMAT=1) else (set FORMAT=4)
:donecmdformat

::Loader - CFG (or 1) is default
findStr /I " CFG-FLOW" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set LOADER=CFG) else (set LOADER=ALL)
if /i "%LOADER%" NEQ "CFG" goto:donecmdloader

findStr /I " FLOW" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set LOADER=CFG) else (set LOADER=FLOW)
:donecmdloader

::USB-Loader Config files (USB is default)
findStr /I " SDConfig" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set USBCONFIG=USB) else (set USBCONFIG=SD)


findStr /I " Guide" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set cmdguide=) else (set cmdguide=G)
if /i "%cmdguide%" EQU "G" set settings=G


goto:go


::---------------------------------
:cmdlinesyscheck

set MENU1=SU

findStr /I ".csv" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (echo Un archivo csv no fue identificado, intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)

copy /y temp\cmdinput.txt temp\cmdinput2.txt>nul

support\sfk filter -spat temp\cmdinput2.txt -rep _".csv*"_".csv"_ -write -yes>nul

set /p sysCheckName= <temp\cmdinput2.txt
set syscheckname=%syscheckname:~3%
::echo %sysCheckName%

if not exist "%sysCheckName%" (echo El archivo csv identificado no existe, intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)

findStr /I /C:"syscheck" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (echo Esto no es un registro valido syscheck, intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)

echo %syscheckname%>temp\cmdinput2.txt

::remove from temp\cmdinput.txt (compensate for _'s by replacing them with \x5f)
support\sfk -spat filter temp\cmdinput2.txt -rep _\x5f_\x22_ -write -yes>nul
support\sfk filter -quiet temp\cmdinput2.txt -rep _"""_\x5f_ -write -yes

::remove cmdinput.txt
set /p removeme= <temp\cmdinput2.txt
support\sfk -spat filter temp\cmdinput.txt -rep _" %removeme%"__ -write -yes>nul

del temp\cmdinput2.txt>nul


findStr /I " PRI" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set PRICMD=) else (set PRICMD=Y)

findStr /I " Guide" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set cmdguide=) else (set cmdguide=G)
if /i "%cmdguide%" EQU "G" set settings=G

::goto:sysCheckAnalyzer


goto:go

::---------------------------------
:cmdlineloadqueue


set MENU1=%one%

set two=%cmdinput:~2%

if "%two:~-4%" EQU ".bat" set two=%two:~0,-4%

if exist "temp\DownloadQueues\%two%.bat" set DLQUEUE=%two%
if "%DLQUEUE%"=="" (echo %two% no existe, intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)
set CurrentQueue=%DLQUEUE%.bat

goto:go

::---------------------------------
:cmdlinesneekinstaller

::if not "%three%"=="" goto:cmdlineemunandbuilder

set MENU1=S
set SNEEKSELECT=1

if /i "%two%" EQU "S" set SNEEKTYPE=%two%
if /i "%two%" EQU "U" set SNEEKTYPE=%two%
if /i "%two%" EQU "SD" set SNEEKTYPE=%two%
if /i "%two%" EQU "UD" set SNEEKTYPE=%two%
if "%SNEEKTYPE%"=="" (echo "%two%" no es una entrada valida, intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)

goto:go



::---------------------------------
:cmdlineemunandbuilder

set MENU1=S

if /i "%one%" EQU "E" set SNEEKSELECT=2
if /i "%one%" EQU "SE" set SNEEKSELECT=3


if /i "%two%" EQU "S" set SNEEKTYPE=%two%
if /i "%two%" EQU "U" set SNEEKTYPE=%two%
if /i "%two%" EQU "SD" set SNEEKTYPE=%two%
if /i "%two%" EQU "UD" set SNEEKTYPE=%two%
if "%SNEEKTYPE%"=="" (echo "%two%" no es una entrada valida, intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)

set DITYPE=off
if /i "%SNEEKTYPE%" EQU "UD" set DITYPE=on
if /i "%SNEEKTYPE%" EQU "SD" set DITYPE=on


if /i "%three%" EQU "4.3" set SNKVERSION=%three%
if /i "%three%" EQU "4.2" set SNKVERSION=%three%
if /i "%SNEEKTYPE:~1%" EQU "D" goto:isDI
if /i "%three%" EQU "4.1" set SNKVERSION=%three%
:isDI
if "%SNKVERSION%"=="" (echo "%three%" no es una entrada valida, intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)

if /i "%four%" EQU "U" set REGION=%four%
if /i "%four%" EQU "E" set REGION=%four%
if /i "%SNEEKTYPE:~1%" EQU "D" goto:isDI
if /i "%four%" EQU "J" set REGION=%four%
if /i "%four%" EQU "K" set REGION=%four%
:isDI
if "%region%"=="" (echo "%four%" no es una entrada valida, intentalo de nuevo...) & (if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul) & (@ping 127.0.0.1 -n 5 -w 1000> nul) & (exit)



::----------Other-----------
::set defaults

set ThemeSelection=N
set SNKHBF=N
set SNKCIOS=N
set SNKcBC=N
set SNKPRI=N
set SNKJOY=N
set SNKS2U=N
set MIIQ=N
set PIC=N
set NET=N
set WEATHER=N
set NEWS=N
set SHOP=N
set SPEAK=N


if /i "%SNEEKTYPE:~0,1%" NEQ "U" goto:notUorUD
findStr /I " S2U" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set SNKS2U=N) else (set SNKS2U=Y)
:notUorUD

findStr /I " CH" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set MIIQ=N) else (set MIIQ=Y)
::if /i "%MIIQ%" EQU "Y" set MIIQ=Y
if /i "%MIIQ%" EQU "Y" set PIC=Y
if /i "%MIIQ%" EQU "Y" set SHOP=Y
if /i "%REGION%" EQU "K" goto:nomoreKchannels
if /i "%MIIQ%" EQU "Y" set NET=Y
if /i "%MIIQ%" EQU "Y" set WEATHER=Y
if /i "%MIIQ%" EQU "Y" set NEWS=Y
if /i "%MIIQ%" EQU "Y" set SPEAK=Y
:nomoreKchannels
if /i "%MIIQ%" EQU "Y" goto:alreadygotallchannels


findStr /I " PHOTO" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set PIC=N) else (set PIC=Y)

findStr /I " SHOP" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set SHOP=N) else (set SHOP=Y)

findStr /I " MII" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set MIIQ=N) else (set MIIQ=Y)


if /i "%REGION%" EQU "K" goto:alreadygotallchannels

findStr /I " SPEAK" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set SPEAK=N) else (set SPEAK=Y)

findStr /I " NEWS" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set NEWS=N) else (set NEWS=Y)

findStr /I " NET" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set NET=N) else (set NET=Y)

findStr /I " WEATHER" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set WEATHER=N) else (set WEATHER=Y)
:alreadygotallchannels



findStr /I " HBF" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set SNKHFF=N) else (set SNKHFF=Y)

findStr /I " 249" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set SNKcIOS=N) else (set SNKcIOS=Y)

findStr /I " NMM" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set SNKcBC=N) else (set SNKcBC=NMM)

::DML only if using SNEEK+DI and if NMM is not also selected
if /i "%SNKcBC%" EQU "NMM" goto:skipDMLcmd
if /i "%SNEEKTYPE%" NEQ "SD" goto:skipDMLcmd
findStr /I " DML" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set SNKcBC=N) else (set SNKcBC=DML)
:skipDMLcmd

findStr /I " Pri" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set SNKPRI=N) else (set SNKPRI=Y)


::joyflow only for uneek or uneek+di
if /i "%SNEEKTYPE:~0,1%" NEQ "U" goto:skipjoycmd
findStr /I " JOY" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set SNKJOY=N) else (set SNKJOY=Y)
:skipjoycmd


::----themes----
findStr /I " Red" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set ThemeSelection=N) else (set ThemeSelection=R)
if /i "%ThemeSelection%" EQU "R" goto:donecmdthemes

findStr /I " Green" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set ThemeSelection=N) else (set ThemeSelection=G)
if /i "%ThemeSelection%" EQU "G" goto:donecmdthemes

findStr /I " Blue" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set ThemeSelection=N) else (set ThemeSelection=BL)
if /i "%ThemeSelection%" EQU "BL" goto:donecmdthemes

findStr /I " Orange" temp\cmdinput.txt >nul
IF ERRORLEVEL 1 (set ThemeSelection=N) else (set ThemeSelection=O)
if /i "%ThemeSelection%" EQU "O" goto:donecmdthemes


:donecmdthemes




goto:go
::---------------------------------
:go
::title ModMii
if exist temp\cmdinput.txt del temp\cmdinput.txt>nul
if exist temp\cmdinput2.txt del temp\cmdinput2.txt>nul
mode con cols=85 lines=54
color 1f
goto:defaultsettings
:notcmd
::---------------------------------------------------------



::title ModMii
mode con cols=85 lines=54
color 1f

::SET FILENAME=%~nx0 //this returns the name of the batch file running (doesn't work when packaged in an exe)
::SET PATHNAME=%0 //this returns the filename but also with absolute path


if exist support\skipscam.txt goto:DefaultSettings
if exist support\ipromisetodonate.txt goto:DefaultSettings

set warning=
echo                                        ModMii
echo                                       by XFlak
echo.
echo.
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] ESTE SOFTWARE NO ESTA A LA VENTA.
echo.

if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 3 -w 1000> nul

echo          SI USTED PAGO POR ESTE PROGRAMA O LO RECIBIO COMO PARTE DE UN "PAQUETE"
echo              USTED A SIDO ESTAFADO Y DEBE RECLAMAR SU DINERO INMEDIATAMENTE
echo.
echo.
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 5 -w 1000> nul
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] USE ESTO BAJO SU PROPIO RIESGO!
echo.
echo       ESTE PAQUETE NO VIENE CON ABSOLUTAMENTE NINGUNA GARANTIA.
echo          SOLAMENTE USTED SERA RESPONSABLE POR CUALQUIER ERROR QUE ESTO PUEDA
echo                           CAUSAR A SU CONSOLA WII DE NINTENDO!
echo.

echo.
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 7 -w 1000> nul
echo.
echo                 Por favor teclee la palabra "Yo" seguida por la palabra "acepto"
echo                     dejando un espacio entre ambas palabras y despues
echo                            presione "Enter" para continuar.
echo.
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 7 -w 1000> nul
echo                          Si usted no puede seguir esas instrucciones,
echo                     entonces usted no tiene derecho a modificar su Wii.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" @ping 127.0.0.1 -n 5 -w 1000> nul

set /p warning=     Escriba aqui su seleccion: 


if /i "%warning%" EQU "skipscam" echo Ea$ter Egg.>support\skipscam.txt
if /i "%warning%" EQU "skipscam" attrib +r +h +s support\skipscam.txt
if /i "%warning%" EQU "skipscam" goto:DefaultSettings

if /i "%warning%" EQU "ipromisetodonate" echo Ea$ter Egg.>support\ipromisetodonate.txt
if /i "%warning%" EQU "ipromisetodonate" attrib +r +h +s support\ipromisetodonate.txt
if /i "%warning%" EQU "ipromisetodonate" goto:DefaultSettings


if /i "%warning%" EQU "Yo Acepto" goto:skip
echo.
echo                                Salir de ModMii...
@ping 127.0.0.1 -n 2 -w 1000> nul
Exit
:skip

::Save version agreed to
if exist Support\settings.bat support\sfk filter -quiet Support\settings.bat -ls!"set AGREEDVERSION=" -write -yes
echo set AGREEDVERSION=%currentversion%>> Support\settings.bat


:DefaultSettings

::----LOAD SETTINGS (if exist)----
if exist Support\settings.bat call Support\settings.bat

::-----default settings (default applies even if a single variable is missing from settings.bat)------
IF "%ROOTSAVE%"=="" set ROOTSAVE=off
IF "%effect%"=="" set effect=No-Spin
IF "%PCSAVE%"=="" set PCSAVE=Auto
IF "%OPTION1%"=="" set OPTION1=off
IF "%OPTION36%"=="" set OPTION36=on
IF "%CMIOSOPTION%"=="" set CMIOSOPTION=off
IF "%FWDOPTION%"=="" set FWDOPTION=on
IF "%Drive%"=="" set Drive=COPY_TO_SD
IF "%DriveU%"=="" set DriveU=COPY_TO_USB

IF "%ACTIVEIOS%"=="" set ACTIVEIOS=on
IF "%AUTOUPDATE%"=="" set AUTOUPDATE=on
IF "%ModMiiverbose%"=="" set ModMiiverbose=off
IF "%SSD%"=="" set SSD=off
IF "%sneekverbose%"=="" set sneekverbose=off
::IF "%discexverify%"=="" set discexverify=off
IF "%SNKFONT%"=="" set SNKFONT=B
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

echo ModMii necesita tener instalado .NET Framework 3.5
echo.

set FrameworkAttempt=0
:NETFRAMEWORK

SET /a FrameworkAttempt=%FrameworkAttempt%+1

if exist "temp\dotNetFx35setup.exe" goto:semiskip
echo Descargar .NET Framework 3.5 Instalelo
echo.

start %ModMiimin%/wait support\wget -t 3 "http://download.microsoft.com/download/7/0/3/703455ee-a747-4cc8-bd3e-98a615c3aedb/dotNetFx35setup.exe"

::start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait "http://download.microsoft.com/download/7/0/3/703455ee-a747-4cc8-bd3e-98a615c3aedb/dotNetFx35setup.exe"

if not exist temp mkdir temp
if exist dotNetFx35setup.exe move /y dotNetFx35setup.exe temp\dotNetFx35setup.exe
:semiskip

echo Lanzar el instalador y espere la instalacion hasta el final...
echo.
start /wait temp\dotNetFx35setup.exe


if exist "%windir%\Microsoft.NET\Framework\v3.5" goto:skipframeworkinstallation

if /i "%FrameworkAttempt%" EQU "3" goto:GiveUpOnFramework

echo Error en la instalacion, volver a intentarlo...
echo.
echo.
goto:NETFRAMEWORK


:GiveUpOnFramework
echo.
echo.
echo.
echo .NET Framework 3.5 Error en la instalacion varias veces
echo Si lo prefiere, puede intentar instalar .NET Framework 3.5 desde Windows Update
echo.
echo Algunas de las caracteristicas de ModMii puede que no funcionen correctamente sin el. NET Framework 3.5
echo Pulse cualquier tecla para utilizar ModMii al completo
pause>nul

:skipframeworkinstallation

if /i "%ModMiiverbose%" EQU "off" (set ModMiimin=/min ) else (set ModMiimin=)


::check for supporting apps that AVs are known to remove
if not exist support\libWiiSharp.dll (echo Uno o mas de los archivos de soporte ModMii estan ausentes, recargar...) & (set currentversion=0.0.0) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:UpdateModMii)
if not exist support\patchios.exe (echo Uno o mas de los archivos de soporte ModMii estan ausentes, recargar...) & (set currentversion=0.0.0) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:UpdateModMii)
if not exist support\wadmii.exe (echo Uno o mas de los archivos de soporte ModMii estan ausentes, recargar...) & (set currentversion=0.0.0) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:UpdateModMii)
if not exist support\hexalter.exe (echo Uno o mas de los archivos de soporte ModMii estan ausentes, recargar...) & (set currentversion=0.0.0) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:UpdateModMii)
if not exist support\settings.exe (echo Uno o mas de los archivos de soporte ModMii estan ausentes, recargar...) & (set currentversion=0.0.0) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:UpdateModMii)
if not exist support\nircmd.exe (echo Uno o mas de los archivos de soporte ModMii estan ausentes, recargar...) & (set currentversion=0.0.0) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:UpdateModMii)
if not exist support\smw-mod.exe (echo Uno o mas de los archivos de soporte ModMii estan ausentes, recargar...) & (set currentversion=0.0.0) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:UpdateModMii)
if not exist support\wit.exe (echo Uno o mas de los archivos de soporte ModMii estan ausentes, recargar...) & (set currentversion=0.0.0) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:UpdateModMii)
if not exist support\fvc.exe (echo Uno o mas de los archivos de soporte ModMii estan ausentes, recargar...) & (set currentversion=0.0.0) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:UpdateModMii)
if not exist support\sfk.exe (echo Uno o mas de los archivos de soporte ModMii estan ausentes, recargar...) & (set currentversion=0.0.0) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:UpdateModMii)
if not exist support\nusd.exe (echo Uno o mas de los archivos de soporte ModMii estan ausentes, recargar...) & (set currentversion=0.0.0) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:UpdateModMii)


if /i "%cmdlinemode%" EQU "Y" goto:noupdateincmdlinemode
if /i "%AUTOUPDATE%" EQU "on" goto:UpdateModMii
:noupdateincmdlinemode
::......................................................MAIN MENU..............................................

:MENU

if exist %UPDATENAME%.bat del %UPDATENAME%.bat>nul
if exist %UPDATENAME%.txt del %UPDATENAME%.txt>nul

if exist temp\ModMii_Log.bat del temp\ModMii_Log.bat>nul
if exist temp\DLgotos-copy.txt del temp\DLgotos-copy.txt>nul

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


::variables that interfere with cmd line wizard
::---------------CMD LINE MODE-------------
if /i "%cmdlinemode%" EQU "Y" goto:MENUafterbadvars

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
set SNEEKTYPE=
set SNEEKSELECT=
set USBGUIDE=
set UPAGE1=
set LOADER=
set FORMAT=NONE
set cfgfullrelease=NONE
SET EXPLOIT=default
if /i "%USBCONFIG%" EQU "USB" set DRIVE=%DRIVETEMP%
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
set addwadfolder=

::SET EXPLOIT=default
set exploitselection=
set COPY=
set DLTOTAL=0
set OPTIONS=
set DB=N
::set FORMAT=NONE
::set cfgfullrelease=NONE

::if /i "%USBCONFIG%" EQU "USB" set DRIVE=%DRIVETEMP%
::set USBGUIDE=
::set UPAGE1=
::set LOADER=
::set SNEEKTYPE=
::set SNEEKSELECT=
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

set SM4.3U-DWB=
set SM4.2U-DWB=
set SM4.1U-DWB=
set SM4.3E-DWB=
set SM4.2E-DWB=
set SM4.1E-DWB=
set SM4.3J-DWB=
set SM4.2J-DWB=
set SM4.1J-DWB=
set SM4.3K-DWB=
set SM4.2K-DWB=
set SM4.1K-DWB=

set SM4.3U-DWO=
set SM4.2U-DWO=
set SM4.1U-DWO=
set SM4.3E-DWO=
set SM4.2E-DWO=
set SM4.1E-DWO=
set SM4.3J-DWO=
set SM4.2J-DWO=
set SM4.1J-DWO=
set SM4.3K-DWO=
set SM4.2K-DWO=
set SM4.1K-DWO=

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
set IOS236Installer=
set SIP=
set JOY=
set Y4M=
set dop=
set syscheck=
set sysCheckBeta=
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
set WiiGSC=
set SMW=
set CM=
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
set P0=
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

set DarkWii_Blue_4.3U=
set DarkWii_Blue_4.2U=
set DarkWii_Blue_4.1U=
set DarkWii_Blue_4.3E=
set DarkWii_Blue_4.2E=
set DarkWii_Blue_4.1E=
set DarkWii_Blue_4.3J=
set DarkWii_Blue_4.2J=
set DarkWii_Blue_4.1J=
set DarkWii_Blue_4.3K=
set DarkWii_Blue_4.2K=
set DarkWii_Blue_4.1K=

set darkwii_orange_4.3U=
set darkwii_orange_4.2U=
set darkwii_orange_4.1U=
set darkwii_orange_4.3E=
set darkwii_orange_4.2E=
set darkwii_orange_4.1E=
set darkwii_orange_4.3J=
set darkwii_orange_4.2J=
set darkwii_orange_4.1J=
set darkwii_orange_4.3K=
set darkwii_orange_4.2K=
set darkwii_orange_4.1K=
set cIOS222[38]-v4=
set cIOS223[37-38]-v4=
set cBC=
set DML=
set cIOS222[38]-v5=
set cIOS223[37]-v5=
set cIOS224[57]-v5=
set cIOS202[60]-v5.1R=
set cIOS222[38]-v5.1R=
set cIOS223[37]-v5.1R=
set cIOS224[57]-v5.1R=
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

if not exist temp mkdir temp

:Clear simplelog
if exist temp\ModMii_Log.bat del temp\ModMii_Log.bat>nul

::--------for cmdlineDLwizard----------
if /i "%one%" EQU "W" goto:DOWNLOAD
if /i "%one%" EQU "SU" goto:sysCheckAnalyzer
if /i "%one%" EQU "HS" goto:HACKMIISOLUTION
if /i "%one%" EQU "L" goto:forcmdlineL
if /i "%one%" EQU "U" goto:DLCOUNT
if /i "%one%" EQU "S" goto:extravars
if /i "%one%" EQU "E" goto:extravars
if /i "%one%" EQU "SE" goto:extravars
goto:noextravars
:extravars
::random vars required for everything to work
if /i "%SNEEKTYPE:~0,1%" EQU "S" set nandpath=%DRIVE%
if /i "%SNEEKTYPE:~0,1%" EQU "U" set nandpath=%DRIVEU%

if exist "%nandpath%"\title\00000001\00000002\data\setting.txt (set settingtxtExist=yes) else (set settingtxtExist=no)

set nandexist=no
if exist "%nandpath%"\title set nandexist=yes
if exist "%nandpath%"\ticket set nandexist=yes
if exist "%nandpath%"\sys set nandexist=yes
if exist "%nandpath%"\shared1 set nandexist=yes

if /i "%SNKS2U%" NEQ "Y" goto:quickskip
SET NANDcount=0
:NANDnamecmd
SET /a NANDcount=%NANDcount%+1
if not exist "%nandpath%\nands\nand%NANDcount%" (set nandpath=%nandpath%\nands\nand%NANDcount%) & goto:quickskip
goto:NANDnamecmd
:quickskip

if /i "%one%" EQU "S" goto:SNEEKINSTALLER
if /i "%one%" EQU "SE" goto:SNEEKINSTALLER
if /i "%one%" EQU "E" goto:SNKNANDBUILDER
:noextravars
::---------------------------------------


set MENU1=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Elija una actividad:
echo.
echo           W = Asistente ModMii + Guia (Comienze a mod su Wii aqui!)
echo.
echo           U = instalacion de USB-Loader + Guia
echo.
echo           H = Soluciones HackMii (HBC invertido\IOS errores No Vulnerables) + Guia
echo.
echo          SU = Actualizacion sysCheck (actualizar solo los softmods obsoleto) + Guia
echo.
echo           S = Instalacion SNEEK, Creador Nand, Extractor masivo de Juegos
echo.
echo.
echo           1 = Descargas pagina 1 (Menu del Sistema, IOSs, MIOSs, canales, etc.)
echo.
echo           2 = Descargas pagina 2 (Aplicaciones, Archivos USB-Loader , Trucos, etc.)
echo.
echo           3 = Descargas pagina 3 (Temas para Menu del sistema)
echo.
echo           4 = Descargas pagina 4 (cIOSs y cMIOSs)
echo.
echo           A = Descargas avanzada y Autocargadores DOL\Creadores ISO
echo.
if exist temp\DownloadQueues\*.bat echo           L = Cargar cola de descarga
if exist temp\DownloadQueues\*.bat echo.
echo.
echo           C = Crear archivos de configuracion para BootMii, "Wad Manager"
echo               o "Multi-Mod Manager"
echo.
echo          FC = Limpiar archivos: Elimina archivos innecesarios despues de
echo               la Modificacion
echo.
echo           O = Opciones
echo.
echo          CR = Creditos
echo.
echo           E = Salir
echo.
echo      *********MORE INFO*********
support\sfk echo -spat \x20 \x20 [RED] V = Visite tinyurl.com/ModMiiNow para hacer preguntas, dar su opinion o voto
echo.
echo      Utilice el Asistente para ModMii de forma automatica la configuracion de la
echo      tarjeta SD con todo lo necesario para modificar completamente softmod tu Wii
echo      y/o actualizacion/downgrade de tu Wii y mucho mas. Al utilizar el Asistente
echo      ModMii, una guia personalizada se crea sobre la base de sus respuestas con
echo      unas simples preguntas.
echo.
support\sfk echo -spat \x20 \x20 [RED] Las donaciones son opcionales, pueden hacer por paypal.com XFlak40@hotmail.com
echo      ***************************
echo.
set /p MENU1=     Escriba aqui su seleccion: 


if /i "%MENU1%" EQU "W" goto:LoadWizardSettings
if /i "%MENU1%" EQU "SU" goto:sysCheckName
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


if /i "%MENU1%" EQU "CR" goto:Credit1
if /i "%MENU1%" EQU "V" goto:openwebpage


if not exist temp\DownloadQueues\*.bat goto:noload
if /i "%MENU1%" NEQ "L" goto:noload
if exist temp\DLnameDV.txt del temp\DLnamesADV.txt>nul
if exist temp\DLgotosADV.txt del temp\DLgotosADV.txt>nul
set BACKB4QUEUE=Menu
goto:PICKDOWNLOADQUEUE
:noload

:EasterEggs
if /i "%MENU1%" EQU "help" echo Google es tu amigo

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:MENU

:openwebpage
start www.tinyurl.com/ModMiiNow
goto:MENU

:exitnow
EXIT

::..................................................Credits.........................................................
:Credit1
cls
::mode con cols=85 lines=65

SET CREDIT1=

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
if /i "%MENU1%" NEQ "CR" (support\sfk echo -spat \x20 \x20 \x20 \x20 [Yellow]Los no donantes debe ver los creditos antes de ver su registro de descargas) & (echo.)
echo                                        CREDITOS
echo                                      ===========
echo.
echo   ModMii fue escrito enteramente por mi, XFlak, sin embargo, sin la ayuda
echo   de algunas otras personas con mucho talento MoodMii no existiria.
echo.
echo.
echo   Algunas personas han contribuido con archivos y programas, otros han
echo   compartido sus conocimientos, algunos han aportado ideas y
echo   otras personas han dado su tiempo.
echo.
echo.
echo   Trate de hacer un gran esfuerzo para reconocer la labor de todos
echo   en ModMii del mas grande al menos. Si me olvide de alguien notifiqueme
echo   y les agregare a los creditos lo mas pronto posible.
echo.
echo.
echo   A lo largo de los creditos se encuentran enlaces para hacer donaciones
echo   a otros desarrolladores. Esto les permitira enviar donaciones para apoyar
echo   a los autores en sus aportaciones.
echo.
echo.

support\sfk echo -spat \x20 [Green]ModMii Las donaciones se pueden hacer con PayPal ModMii: \x20 XFlak40@hotmail.com
echo.
support\sfk echo -spat \x20 [Red]Cualquiera que done $1 o mas para ModMii recibira un funcional ModMii Easter Egg!
echo.
support\sfk echo -spat \x20 [Green]$ = Visita la pagina de donaciones ModMii (paypal) y consiga su Easter Egg!
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
if /i "%MENU1%" NEQ "CR" (echo Espere unos segundos para continuar...) & (@ping 127.0.0.1 -n 5 -w 1000> nul)
set /p CREDIT1=     Pulse la tecla "Enter" para continuar: 


::add ^ before problematic chars like & and %
if /i "%CREDIT1%" EQU "$" start https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick^&hosted_button_id=DDHSQJPHDDXVW
if /i "%CREDIT1%" EQU "$" goto:Credit1

if /i "%MENU1%" NEQ "CR" goto:credit2
if /i "%CREDIT1%" EQU "B" goto:menu
if /i "%CREDIT1%" EQU "M" goto:menu

::------------
:Credit2
cls

SET CREDIT2=

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                        CREDITS
echo                                      ===========
echo.
support\sfk echo -spat \x20 [Red]Team Twiizers
echo   =============
echo   Gracias al equipo Twiizers por crear el revolucionario instalador HackMii. Sin
echo   su duro trabajo, la Wii no seria desbloqueada. Algunos miembros del equipo
echo   Twiizer pasaron a formar parte de este equipo; un equipo que jugo un papel
echo   fundamental en el desbloqueo de la PS3.
echo.
echo   En especial, quiero agradecer a Bushing, quien dio su bendicion a ModMii
echo   descarga y utiliza el instalador de HackMii.
echo.
support\sfk echo -spat \x20 [Red]Giantpune
echo   =========
echo   Giantpune en una leyenda en la Scene de Wii y yo lo considero un buen amigo mio.
echo   El creo una variedad de exploits, incluyendo el exploit Stack para PAL y KOR
echo   para Wii (que sigue siendo el unico metodo para reparar el brick 003 de la Wii),
echo   el canal reenviador dol, USB Loader GX, y muchos otros programas de pc para
echo   reparar o restaurar la Wii.
echo.
echo   Ha contribuido con codigos para proyectos de los que uno mismo conoce, por lo que
echo   es imposible para mi expresar realmente su impacto en la Scene. Incluso se tomo
echo   su tiempo para explicarme algunas cosas sobre ModMii cIOSs cuando aun era MUS
echo   al principio y todavia se conoce como Auto NUS Downloader.
echo.
support\sfk echo -spat \x20 [Green]Puede enviar sus donaciones a traves de PayPal Giantpune: giantpune@gmail.com
echo.
support\sfk echo -spat \x20 [Red]Crediar, Daco Taco y Phpgeek
echo   ==============================
echo   Esta gente, sobre todo, tuvo certeza para crear Priiloader. Esta fue otra
echo   herramienta revolucionaria sobre todo porque fue el primero en ofrecer algun nivel
echo   de proteccion a las Wii donde se puede instalar BootMii en boot2.
echo   Crediar desarrollo el preloader original, asi como s\uneek, NMM, DML, etc.
echo.
support\sfk echo -spat \x20 [Green]Puede enviar donaciones a Crediar a traves de PayPal: sven.tathoff@t-online.de
support\sfk echo -spat \x20 [Green]Puede enviar donaciones a Daco Taco a traves de PayPal: daco_65@hotmail.com
echo.
support\sfk echo -spat \x20 [Red]Comex
echo   =====
echo   Ademas de ser un miembro del equipo Twiizers y contribuir el HackMii Installer,
echo   Comex a creado el exploit bannerbomb tan utilizado. este exploit permite a la Wii
echo   con firmwares 3,0-4,2 que se modifiquen con solo una tarjeta SD en lugar de tener
echo   uno de los pocos juegos especificos de a las Wii (como sucede con el menu del
echo   sistema 4.3).
echo.
support\sfk echo -spat \x20 [Green]Usted puede enviar sus donaciones a Comex a traves de PayPal: comexk@gmail.com
echo.
if /i "%MENU1%" NEQ "CR" (echo Espere unos segundos para continuar...) & (@ping 127.0.0.1 -n 5 -w 1000> nul)
set /p CREDIT2=     Pulse la tecla "Enter" para continuar: 

if /i "%CREDIT2%" EQU "B" goto:credit1
if /i "%MENU1%" NEQ "CR" goto:credit3
if /i "%CREDIT2%" EQU "M" goto:menu

::------------
:Credit3
cls

SET CREDIT3=

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                        CREDITOS
echo                                      ===========
echo.
support\sfk echo -spat \x20 [Red]Waninkoko
echo   =========
echo   Waninkoko fue el primero en dar a conocer publicamente un cIOS y otras
echo   aplicaciones excelentes como WAD manager, Save Game Manager, USB loader,
echo   etc. Tambien quiero darle las gracias por dar permiso a ModMii para
echo   recrear sus cIOSs en forma de WAD.
echo.
support\sfk echo -spat \x20 [Red]Hermes
echo   ======
echo   Hermes es conocido por su cIOS 222/223/224 y por su usbloader "uloader".
echo   Durante mucho tiempo sus cIOSs fueron los unicos que trabajan con los juegos
echo   de tipo RockBand y siguen siendo muy utilizados todavia.
echo.
support\sfk echo -spat \x20 [Red]davebaol, xabby666 y XFlak
echo   ============================
echo   Estos desarrolladores trabajaron juntos para modificar el CIOS rev21 de
echo   Waninkoko y creo un nuevo "D2X" cIOS. Este cIOS es considerado el ultimo
echo   CIOS porque corrije muchos bugs e incorpora caracteristicas que se creia que
echo   era imposible (por ejemplo. Soporte para IOS Recarga de juegos). WiiPower
echo   tambien tuvo una fuerte influencia de la incorporacion de soporte para
echo   volver a recargar el IOS.
echo.
support\sfk echo -spat \x20 [Red]Rodries
echo   =======
echo   Gracias a Rodries por mejorar Hermes cIOSs v5.1.
echo.
support\sfk echo -spat \x20 [Red]WiiGator
echo   ========
echo   WiiGator creo el cMIOS y Lanzador de Gamecube de copia de seguridad. Fans
echo   GameCube debemos un gran agradecimiento a WiiGator por su trabajo.
echo.
support\sfk echo -spat \x20 [Red]WiiPower
echo   ========
echo   WiiPower creo Neogamma, sin duda alguna el programa de copias de seguridad
echo   en disco para la Wii. Tambien modifico cMIOS WiiGators y creo lo que hoy se
echo   considera el ultimo cMIOS. Ademas ha contribuido en el codigo de muchos
echo   otros populares usb-loaders y lo incorporo al soporte para la recarga
echo   IOS cIOSs D2X.
echo.
if /i "%MENU1%" NEQ "CR" (echo Espere unos segundos para continuar...) & (@ping 127.0.0.1 -n 5 -w 1000> nul)
set /p CREDIT3=     Pulse la tecla "Enter" para continuar: 

if /i "%CREDIT3%" EQU "B" goto:credit2
if /i "%MENU1%" NEQ "CR" goto:credit4
if /i "%CREDIT3%" EQU "M" goto:menu



::------------
:Credit4
cls

SET CREDIT4=

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                        CREDITOS
echo                                      ===========
echo.
support\sfk echo -spat \x20 [Red]cwstjdenobs
echo   ===========
echo   cwstjdenobs es una de las pocas personas que he encontrado en scene de la Wii
echo   Me gustaria invitarle a una cerveza. El fue siempre un gran apoyo para mi y
echo   me animo a hacer tantas preguntas como quisiera. El es probablemente mas
echo   conocido por YAWMM (otro mod Wad Manager), que fue el primer Wad Manager
echo   para agregar la proteccion de brick limitando a los usuarios que hagan una
echo   tonteria, errores como la eliminacion de archivos criticos. El tambien hizo
echo   modificaciones especificamente para aplicaciones de ModMii. Por ejemplo,
echo   modifico WadMii por lo que no hay WADS con fecha y hora y tambien hizo un
echo   generador setting.txt para generar NAND para ModMii.
echo.
support\sfk echo -spat \x20 [Red]Leathl
echo   ======
echo   Leathl es otro desarrollador impresionante que me apoyo antes de
echo   convertirme tambien conocido por la expansion en su aplicaciones apoyando
echo   a ModMii. Leathl ha creado muchas aplicaciones para Wii como ShowMiiWads,
echo   CustomizeMii, libwiisharp, patchios, nusfilegrabber, etc. A pesar de su
echo   reciente inactividad, sus aplicaciones son todavia muy utilizadas en la
echo   actualidad... Esto demuestra que nunca un trabajo de calidad se hace
echo   viejo. Tambien quiero dar las gracias a RetroHead para el Mod de ShowMiiWads
echo   que utiliza ModMii para construir nands emulando sin la necesidad de intervenir
echo   el usuario. libwiisharp.dll se basa en wii.py, los desarrolladores de wii.py
echo   son Megazig, Omega, Xuzz, SquidMan, Matt_P and The Lemon Man. Tambien gracias
echo   a Daeken por escribirlo Struct.py y Marcar su propio codigo de LZ77.
echo.
support\sfk echo -spat \x20 [Green]Puede enviar sus donaciones por PayPal Leathl: leathl@gmail.com
echo.
support\sfk echo -spat \x20 [Red]scooby74029
echo   ===========
echo   Mas tambien es conocido por scooby74029 sneeky compilador, que es capaz de 
echo   crear varias versiones diferentes de s\Uneek. ModMii siempre va a construir
echo   la ultima version de s\Uneek disponibles en su codigo sneeky compilador en su
echo   pagina web de google. Esto significa que el tiene el control total sobre que
echo   version de s\Uneek ModMii va a utilizar. Tambien creo las modificaciones de
echo   la libwiisharp.dll de Leathl y patchios.exe sigue apoyando ModMii. Ademas, ha
echo   modificado otras aplicaciones como JoyFlow, JoyLoader GX, CFG JoyLoader, etc.
echo   Ademas de todo eso, es una persona increible por todo y estoy orgulloso de
echo   estar en su lista de amigos.
echo.
support\sfk echo -spat \x20 [Green]Puede enviar sus donaciones por PayPal scooby74029: scooby74029@yahoo.com
echo.
if /i "%MENU1%" NEQ "CR" (echo Espere unos segundos para continuar...) & (@ping 127.0.0.1 -n 5 -w 1000> nul)
set /p CREDIT4=     Pulse la tecla "Enter" para continuar: 

if /i "%CREDIT4%" EQU "B" goto:credit3
if /i "%MENU1%" NEQ "CR" goto:credit5
if /i "%CREDIT4%" EQU "M" goto:menu



::------------
:Credit5
cls

SET CREDIT5=

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                        CREDITOS
echo                                      ===========
echo.
support\sfk echo -spat \x20 [Red]OverJoy
echo   =======
echo   Demasiada alegria creo JoyFlow, una modificacion de WiiFlow que se ejecuta en
echo   s\Uneek. El tambien logro algunas cosas realmente sorprendentes, como la
echo   utilizacion del modulo de DI s\Uneek que le permite cargar juegos de Wii
echo   en formato WBFS.
echo.
support\sfk echo -spat \x20 [Red]Arikado y el equipo Dop-Mii
echo   ============================
echo   Crearon Dop-Mii, y muchas aplicaciones tome prestado el codigo de Dop-Mii,
echo   asi que incluso si usted nunca ha utilizado Dop-Mii
echo.
support\sfk echo -spat \x20 [Green]Enviar sus donaciones a traves de PayPal Arikado: r0szsoft@gmail.com
echo.

support\sfk echo -spat \x20 [Red]WiiWu
echo   =====
echo   Hizo Multi-Mod Manager (MMM), que tiene las funciones de diferentes programas
echo   Wii modifica todas las herramientas en la aplicacion de un usuario facil.
echo.
support\sfk echo -spat \x20 [Green]Enviar sus donaciones a traves de PayPal WiiWi: wiiwu2@yahoo.com

echo.
support\sfk echo -spat \x20 [Red]WB3000 y WiiNinja
echo   ===================
echo   Gracias a WB3000 por la creacion de NUS Downloader y WiiNinja por hacer una
echo   cmd version en linea de NUS Downloader. NUS Downloader es vital en ModMii
echo   apoyo de las aplicaciones.
echo.
support\sfk echo -spat \x20 [Green]Enviar donaciones a traves de WB3000 bitcoin: 16cziXAdmLJwwSvgfKkfk6sSknvGqyf3VU

echo.
support\sfk echo -spat \x20 [Red]WiiCrazy
echo   ========
echo   WiiCrazy es mas conocido por "Creador de acceso directo de Wii" (antes
echo   conocido como "Crap"), Crazy Intro y Crazy Intro Video. Tambien contribuyo
echo   con usb-loaders sin pasar por cierta seguridad especificas del juego.
echo   WiiCrazy es otro persona que siempre ha estado dispuesto a hacer todo lo
echo   posible por ayudarme, o cualquier otra persona para esa materia.
echo.
support\sfk echo -spat \x20 [Red]oggzee, usptactical, gannon y Dr.Clipper
echo   ==========================================
echo   Junto a la gente por encima de la composicion del equipo Configurable
echo   USB Loader. Este usb-loader siempre ha sido el primero en disponer nuevas
echo   funciones y en mi opinion es el mejor usb-loader que hay.
echo.
support\sfk echo -spat \x20 [Green]Enviar sus donaciones a traves de PayPal equipo CFG USB-Loader: donate@wiitdb.com
echo.
if /i "%MENU1%" NEQ "CR" (echo Espere unos segundos para continuar...) & (@ping 127.0.0.1 -n 5 -w 1000> nul)
set /p CREDIT5=     Pulse la tecla "Enter" para continuar: 

if /i "%CREDIT5%" EQU "B" goto:credit4
if /i "%MENU1%" NEQ "CR" goto:credit6
if /i "%CREDIT5%" EQU "M" goto:menu


::------------
:Credit6
cls

SET CREDIT6=

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                        CREDITOS
echo                                      ===========
echo.
support\sfk echo -spat \x20 [Red]Wiimm
echo   =====
echo   Gracias a Wiimm por la creacion de herramientas Wiimms ISO, incluyendo
echo   wit.exe que ModMii utiliza para convertir los juegos de Wii para s/Uneek
echo   formato asi como crear forwarder ISOs.
echo.
support\sfk echo -spat \x20 [Red]diddy81 y symular sindrome del Equipo Tematico Wii
echo   =============================================
echo   El equipo tematico Wii ha creado algunos de los mejores temas de Wii
echo   hecho nunca! Todos los temas que se disponga en ModMii fueron creados por
echo   ellos. Quiero agradecer a diddy81 en particular, por trabajar conmigo para
echo   asegurarse de que todos sus temas funcionen a la perfeccion en todas las
echo   regiones.
echo.
support\sfk echo -spat \x20 [Red]FIX94, Narolez y el equipo WiiXplorer
echo   ======================================
echo   Gracias a todas estas personas por sus contribuciones en hacer las mejores
echo   SD\USB forwarder. Quiero agradecer a FIX94 en particular, que paso mucho
echo   tiempo probando el trabajo de ModMii Forwarder ... puede ser joven, pero
echo   es sabio para su edad, imaginate lo que va a ser capaz cuando sea
echo   mayor de edad para votar!
echo.
support\sfk echo -spat \x20 [Green]Enviar las donaciones equipo WiiXplorer a traves de PayPal: dimok@gmx.de
echo.
support\sfk echo -spat \x20 [Red]ModMii's Traductores
echo   ====================
echo   Traducir ModMii es un enorme trabajo. Es muy dificil para obtener los caracteres
echo   especiales para mostrarse correctamente en una ventana de CMD, no menciona
echo   mantener todo el formato correcto. Pero probablemente lo mas dificil de traducir
echo   ModMii es mantener al dia las actualizaciones. Si utiliza una version
echo   traducida de ModMii, le animo a que lo traduzca gracias, ya que realmente es
echo   MUCHO trabajo para hacer.
echo.
echo   Traduccion a Frances: mamule, xav91 y ketufe
echo   Traduccion a Holandes: Hielkenator
echo   Traduccion a Italiano: Wasabi, Step y Robylin
echo.
if /i "%MENU1%" NEQ "CR" (echo Espere unos segundos para continuar...) & (@ping 127.0.0.1 -n 5 -w 1000> nul)
set /p CREDIT6=     Pulse la tecla "Enter" para continuar: 

if /i "%CREDIT6%" EQU "B" goto:credit5
if /i "%MENU1%" NEQ "CR" goto:credit7
if /i "%CREDIT6%" EQU "M" goto:menu

::------------
:Credit7
cls

SET CREDIT7=

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                        CREDITOS
echo                                      ===========
echo.
support\sfk echo -spat \x20 [Red]Fig2k4
echo   ======
echo   Gracias Fig2k4 por WiiBackupManager. Fue un placer hacer pruebas beta para
echo   usted y compartir mis ideas con ustedes. Espero verlo por el foro otra vez
echo   y seguir trabajando en su programa increible.
echo.
support\sfk echo -spat \x20 [Green]Enviar donaciones a traves de PayPal Fig2k4: Fig2k4@googlemail.com
echo.
support\sfk echo -spat \x20 [Red]WiiShizzza y pepxl
echo   ====================
echo   Gracias a WiiShizzza por la creacion del nuevo icono ModMii y a pepxl por
echo   la creacion del icono original ModMii. Quiero agradecer a todo el que creo
echo   un icono de ModMii y lo presento en la competicion nuevo icono de ModMii.
echo   Tipo "icono" para abrir su navegador a la pagina web icono presentaciones y
echo   consulte mas de 30 iconos creados que la gente.
echo.
support\sfk echo -spat \x20 [Red]Mis compa�eros autores de guias
echo   =======================
echo   Gracias a tj_cool, xzxero, burritoboy9984, ChokeD y mauifrog por su
echo   Guia impresionante. En especial, quiero agradecer a tj_cool y xzxero por
echo   invitarme a que me uniera a "La tripulacion" en la Guia de Softmod
echo   completa. Nunca olvidare que grande me senti al ser relativamente
echo   nuevo en la scene y que seran invitados a unirse a todos por igual.
echo.
support\sfk echo -spat \x20 [Red]JoostinOnline
echo   =============
echo   Gracias por determinar la mejor configuracion para todos los CIOs y sus
echo   ocurrencias. Nunca me cansare de nuestros interminables patriotas "debates".
echo.
support\sfk echo -spat \x20 [Red]DaMysteryMan
echo   ============
echo   Gracias por ayudarme a entender la estructura de un cIOS, asi puedo mejorar
echo   la recreacion en forma WAD. Para aquellos de ustedes que no lo conocen, es
echo   DaMysteryMan mas conocido por su aplicacion siempre controversial - DarkCorp
echo   (antes cIOSCorp).
echo.
support\sfk echo -spat \x20 [Red]person66
echo   ========
echo   Gracias por el intercambio de pedacitos de conocimiento de codificacion por
echo   lotes conmigo. Es genial tener un codificador por lotes para un amigo,
echo   somos una raza en extincion, por lo que continuar al dia el gran trabajo
echo   con el creador Forwarder universal y todos los proyectos de unos y otros.
echo.
if /i "%MENU1%" NEQ "CR" (echo Espere unos segundos para continuar...) & (@ping 127.0.0.1 -n 5 -w 1000> nul)
set /p CREDIT7=     Pulse la tecla "Enter" para continuar: 

if /i "%CREDIT7%" EQU "icon" start http://gbatemp.net/index.php?showtopic=296772
if /i "%CREDIT7%" EQU "icon" goto:Credit1

if /i "%CREDIT7%" EQU "B" goto:credit6
if /i "%MENU1%" NEQ "CR" goto:credit8
if /i "%CREDIT7%" EQU "M" goto:menu

::------------
:Credit8
cls

SET CREDIT8=

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                        CREDITOS
echo                                      ===========
echo.
support\sfk echo -spat \x20 [Red]Gannon
echo   ======
echo   Gracias a Gannon de bootopera, que fue capaz de  crear el modulo URL
echo   loader base dol.
echo.
support\sfk echo -spat \x20 [Red]Violator
echo   ========
echo   El es mi hermano, mi primo, mi mejor hombre y la razon por la que he comprado o
echo   modificado una Wii. "XFlak" habria muerto no hace mucho tiempo si no fuera por
echo   el. Gracias Violator, por conseguir que me interesara en esta materia, y por
echo   toda la musica impresionante que he grabado para mis inicios de canales Wii!
echo.
support\sfk echo -spat \x20 [Red]DeadlyFoez
echo   ==========
echo   DeadlyFoez es legendario por sus reparaciones y Wii tutorial de INFECTUS.
echo   Cualquiera que haya roto su Wii puede enviar por correo deadlyfoez@yahoo.com
echo   para que lo arregle.
echo.
echo   Que puedo decir acerca de la "DeadlyFoez" a nivel personal. El siempre esta
echo   metiendome en problemas, pero su amistad vale la pena por cada fiasco! es irreal
echo   la forma en que se convirtio en uno de mis mejores amigos. Apenas va a demostrar
echo   nada todos el que lo conoce en linea esta totalmente loco, en su caso ... un poco
echo   loco. Pero en serio, gracias a DeadlyFoez por estar siempre ahi para que yo rebote
echo   ModMii ideas fuera de la, para acoger las dos primeras reuniones del equipo de su
echo   mama y por presentarme a su familia y amigos increibles. No hay nadie mas Prefiero
echo   acabar friki y siempre tendre su espalda.
echo.
support\sfk echo -spat \x20 [Red]All My Beta Testers!
echo   ====================
echo   Es por ustedes que ModMii es estable como es. Teniendo en cuenta que ModMii se
echo   desarrolla por completo en el bloc de notas sin ningun tipo de depuracion o
echo   herramientas de desarrollo, que es bastante notable que ModMii siempre ha estado
echo   libre de errores (aunque con algunas excepciones menores pareja). Gracias por su
echo   interminable devocion de control de calidad!
echo.
support\sfk echo -spat \x20 [Red]Usted!
echo   ====
echo   Sin ustedes, no habria razon para que existiese ModMii.
echo   Gracias por usar ModMii para todas sus necesidades modificando su Wii!
echo.
if /i "%MENU1%" NEQ "CR" (echo Espere unos segundos para continuar...) & (@ping 127.0.0.1 -n 5 -w 1000> nul)
set /p CREDIT8=     Pulse la tecla "Enter" para continuar: 

if /i "%CREDIT8%" EQU "B" goto:credit7
if /i "%MENU1%" NEQ "CR" goto:credit9
if /i "%CREDIT8%" EQU "M" goto:menu




::------------
:Credit9
cls

SET CREDIT9=

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                        CREDITOS
echo                                      ===========
echo.
echo                                     APLICACIONES DE APOYO
echo                                   -------------------
echo.
echo      A continuacion se muestra una lista de todas las aplicaciones de
echo      soporte incluido con ModMii.
echo      Introduzca el numero de una aplicacion para abrir su navegador y
echo      dirigirse a su pagina web.
echo.
echo.
echo.
echo      1 = Ascii2All.bat (freeware)
echo      2 = 7za.exe (freeware)
echo      3 = d2x cIOS Modules (davebaol, xabby666, XFlak)
echo      4 = fvc.exe (freeware)
echo      5 = Hermes cIOS v4 mload Module
echo      6 = Hermes cIOS v5 mload Module
echo      7 = Hermes\Rodries cIOS v5.1R mload Module
echo      8 = Hexalter.exe (by kuwanger)
echo      9 = ISO template (by spayrosam)
echo     10 = jptch.exe (freeware)
echo     11 = libWiiSharp.dll (by Leathl, Mod by scooby74029)
echo     12 = nircmd.exe (freeware)
echo     13 = nusd.exe (by WiiNinja, original GUI code by WB3000)
echo     14 = NusFileGrabber.exe (by Leathl, Mod by XFlak)
echo     15 = patchIOS.exe (by Leathl, Mod by scooby74029)
echo     16 = sfk.exe (freeware)
echo     17 = ShowMiiWads_Sneek_Mod.exe (by Leathl, Mod by RetroHead)
echo     18 = settings.exe (by cwstjdenobs)
echo     19 = WadMii.exe (by cwstjdenobs)
echo     20 = Waninkoko's cIOS Modules
echo     21 = wget.exe (freeware)
echo     22 = wit.exe (by Wiimm)
echo     23 = writecbd.exe (by scooby74029)
echo.
echo    Todo = Paquete de todas las fuentes de  la aplicacion ModMii
echo.
echo.

if /i "%MENU1%" NEQ "CR" (echo Espere unos segundos para continuar...) & (@ping 127.0.0.1 -n 5 -w 1000> nul)
::set /p CREDIT9=     Pulse la tecla "Enter" para volver al men� principal: 

if /i "%MENU1%" NEQ "CR" (set /p CREDIT9=     Press the "Enter" Key to View Your Download Log: ) else (set /p CREDIT9=     Press the "Enter" Key to Return to the Main Menu: )

if /i "%CREDIT9%" EQU "B" goto:credit8
::if /i "%CREDIT9%" EQU "M" goto:menu


if /i "%CREDIT9%" EQU "1" start www.batchlog.pytalhost.com
if /i "%CREDIT9%" EQU "1" goto:Credit9

if /i "%CREDIT9%" EQU "2" start http://sourceforge.net/projects/sevenzip
if /i "%CREDIT9%" EQU "2" goto:Credit9

if /i "%CREDIT9%" EQU "3" start http://gbatemp.net/t277659-ciosx-rev21d2x-v2-yet-another-hot-fix
if /i "%CREDIT9%" EQU "3" goto:Credit9

if /i "%CREDIT9%" EQU "4" start http://sourceforge.net/projects/fileverifier/files/fileverifier/0.6.3.5830
if /i "%CREDIT9%" EQU "4" goto:Credit9

if /i "%CREDIT9%" EQU "5" start http://mods.elotrolado.net/~hermes/wii/cios_mload_source_install_3.6.rar
if /i "%CREDIT9%" EQU "5" goto:Credit9

if /i "%CREDIT9%" EQU "6" start http://mods.elotrolado.net/~hermes/wii/cios_mload_source_install_4.0.rar
if /i "%CREDIT9%" EQU "6" goto:Credit9

if /i "%CREDIT9%" EQU "7" start http://gbatemp.net/t298741-hermes-cios-installer-v5-1-mod-by-rodries
if /i "%CREDIT9%" EQU "7" goto:Credit9

if /i "%CREDIT9%" EQU "8" start http://goo.gl/XTT2Y
if /i "%CREDIT9%" EQU "8" goto:Credit9

if /i "%CREDIT9%" EQU "9" start http://goo.gl/0L40U
if /i "%CREDIT9%" EQU "9" goto:Credit9

if /i "%CREDIT9%" EQU "10" start http://sourceforge.net/projects/jojodiff
if /i "%CREDIT9%" EQU "10" goto:Credit9
if /i "%CREDIT9%" EQU "11" start http://code.google.com/p/libwiisharp/source/browse
if /i "%CREDIT9%" EQU "11" goto:Credit9
if /i "%CREDIT9%" EQU "12" start http://www.nirsoft.net/utils/nircmd.html
if /i "%CREDIT9%" EQU "12" goto:Credit9
if /i "%CREDIT9%" EQU "13" start http://gbatemp.net/index.php?showtopic=153341
if /i "%CREDIT9%" EQU "13" goto:Credit9
if /i "%CREDIT9%" EQU "14" start http://code.google.com/p/libwiisharp/source/browse/#svn/branches/NusFileGrabber
if /i "%CREDIT9%" EQU "14" goto:Credit9
if /i "%CREDIT9%" EQU "15" start http://code.google.com/p/libwiisharp/source/browse/#svn/branches/patchIOS
if /i "%CREDIT9%" EQU "15" goto:Credit9
if /i "%CREDIT9%" EQU "16" start http://sourceforge.net/projects/swissfileknife/files/1-swissfileknife
if /i "%CREDIT9%" EQU "16" goto:Credit9
if /i "%CREDIT9%" EQU "17" (echo Source included with ModMii's Supporting App Sources "All"...) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:Credit9)
if /i "%CREDIT9%" EQU "18" (echo Source included with ModMii's Supporting App Sources "All"...) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:Credit9)
if /i "%CREDIT9%" EQU "19" start http://www.mediafire.com/?bogjind5oe3
if /i "%CREDIT9%" EQU "19" goto:Credit9
if /i "%CREDIT9%" EQU "20" start http://github.com/waninkoko
if /i "%CREDIT9%" EQU "20" goto:Credit9
if /i "%CREDIT9%" EQU "21" start http://ftp.gnu.org/gnu/wget/
if /i "%CREDIT9%" EQU "21" goto:Credit9
if /i "%CREDIT9%" EQU "22" start http://wit.wiimm.de
if /i "%CREDIT9%" EQU "22" goto:Credit9

if /i "%CREDIT9%" EQU "23" (echo Source included with ModMii's Supporting App Sources "All"...) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:Credit9)

if /i "%CREDIT9%" EQU "All" start http://code.google.com/p/modmii/downloads/list?can=2^&q=rar^&colspec=Filename+Summary+Uploaded+ReleaseDate+Size+DownloadCount
if /i "%CREDIT9%" EQU "All" goto:Credit9




if /i "%MENU1%" NEQ "CR" (goto:Finish2) else (goto:menu)



::..................................................OPTIONS.................................................. 
.......
:OPTIONS

Set WLAST=
Set Options=
set cheatoption=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.

support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]Escriba la opcion # (o letra) para activar/desactivar
echo.
echo    D = Cambiar letra de unidad (valor actual: %Drive%)
echo.
echo   DU = Cambiar letra de la unidad de USB (valor actual: %DriveU%)
echo.
echo   CC = Opciones Codigos trucos

echo.
echo   PC = programas de PC ubicacion de almacenamiento (configuracion actual: %PCSAVE%)
if /i "%PCSAVE%" EQU "Local" echo        * Programas almacenados en PC %HomeDrive%
if /i "%PCSAVE%" EQU "Local" echo        * Los enlaces se instalaran en el menu Inicio y de escritorio

if /i "%PCSAVE%" EQU "Portable" echo        * programas PC Portables guardados como uno mas en la unidad.

if /i "%PCSAVE%" NEQ "Auto" goto:skip
echo        * programas almacenados en %homedrive% accesos directos creados desde ModMii %homedrive%
echo        * Programas portables guardados se ejecutan desde ModMii %homedrive%
:skip

echo.
if /i "%ROOTSAVE%" EQU "ON" echo   RS = Guardar en Raiz: Guarda IOSs\MIOSs en raiz en lugar de la carpeta WAD
if /i "%ROOTSAVE%" EQU "ON" echo         (habilitado)
if /i "%ROOTSAVE%" EQU "OFF" echo   RS = Guardar en raiz: Guarda IOSs\MIOSs en raiz en lugar de la carpeta WAD
if /i "%ROOTSAVE%" EQU "OFF" echo        (Desabilitado)
echo        * No afecta al Asistente de descarga y solo se aplica a IOSs\MIOSs
echo        * Aplicaciones utiles para Wii que requieren IOSs\MIOSs guardados en la raiz
echo.

echo   CE = Canales efectos personalizados temas para menu del sistema: %effect%
echo        * Elija entre 3 efectos: No-Spin, Spin and Fast-Spin
echo.



if /i "%OPTION1%" EQU "OFF" echo    1 = No mantener 00000001 o carpetas NUS para IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "OFF" echo        * Carpeta necesaria para el uso en linea de algunas Aplicaciones Wii
if /i "%OPTION1%" EQU "ON" echo    1 = Mantener 00000001 en la carpeta IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "ON" echo        * Utiles para el uso de aplicaciones sin conexion para Wii como Dop-Mii

if /i "%OPTION1%" EQU "NUS" echo    1 = Guardar NUS\00000001000000##v# en la carpeta IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "NUS" echo        * Utiles para el uso sin conexion de aplicaciones de Wii como d2x\Hermes cIOS Installers

if /i "%OPTION1%" EQU "ALL" echo    1 = Guardar NUS\00000001000000##v# y 00000001 en la carpeta IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "ALL" echo        * Utiles para el uso sin conexion de unos pocos Aplicaciones Wii
echo.

if /i "%ACTIVEIOS%" EQU "OFF" echo    U = Actualizar IOSs. Asistente para descargar los IOSs activos (Desabilitado)
if /i "%ACTIVEIOS%" EQU "ON" echo    U = Actualizar IOSs. Asistente para descargar los IOSs activos (Habilitado)
echo.

if /i "%ACTIVEIOS%" EQU "OFF" goto:skip36
if /i "%OPTION36%" EQU "OFF" echo   36 = Instalar IOS36 cuando actualice todos los IOS Descargados (Desabilitado)
if /i "%OPTION36%" EQU "ON" echo   36 = Instalar IOS36 cuando actualice todos los IOS Descargados (Habilitado)
echo        * Su IOS36 existente puede parchear. El IOS36 descargado no se sabe
echo.
:skip36

if /i "%CMIOSOPTION%" EQU "OFF" echo   CM = cMIOS incluido en el Asistente de Guias ModMii (Desabilitado)
if /i "%CMIOSOPTION%" EQU "ON" echo   CM = incluido en el Asistente de Guias ModMii (Habilitado)
echo        *cMIOS no permite chips antiguos de Wii para copias de seguridad GameCube
echo.

if /i "%FWDOPTION%" EQU "OFF" echo  FWD = Instalar USB-Loader Forwarder en ModMii asistente de guia (Desabilitado)
if /i "%FWDOPTION%" EQU "ON" echo  FWD = Instalar USB-Loader Forwarder en ModMii asistente de guia (Habilitado)
echo.

if /i "%ModMiiverbose%" EQU "off" echo    V = Salida detalladisima cuando se utiliza wget o instalador Sneek (Desabilitado)
if /i "%ModMiiverbose%" EQU "on" echo    V = Salida detalladisima cuando se utiliza wget o instalador Sneek (habilitado)
echo.


if /i "%SSD%" EQU "off" echo  SSD = SNEEK y SNEEK+DI acceso SD (Desabilitado)
if /i "%SSD%" EQU "on" echo  SSD = SNEEK y SNEEK+DI acceso SD (Habilitado)
echo.


if /i "%sneekverbose%" EQU "off" echo   SV = SNEEK salida detallada (Desabilitado)
if /i "%sneekverbose%" EQU "on" echo   SV = SNEEK Salida detallada (Habilitada)
echo.

if /i "%SNKFONT%" EQU "W" echo    F = Font.bin Color para SNEEK+DI/UNEEK+DI (BLANCO)
if /i "%SNKFONT%" EQU "B" echo    F = Font.bin Color para SNEEK+DI/UNEEK+DI (NEGRO)
echo.

if not exist "%DRIVE%" goto:nodrivefolder
echo   C = Create Custom.md5 file to verify all files in %DRIVE%
if exist Custom.md5 echo   C2 = Verificar los archivos desde %DRIVE% con Custom.md5
:nodrivefolder
if exist Custom.md5 echo   C3 = Borrar Custom.md5
echo.
if /i "%AUTOUPDATE%" EQU "OFF" echo    A = Auto-Actualizar ModMii al inicio del programa (Desactivado)
if /i "%AUTOUPDATE%" EQU "ON" echo    A = Auto-Actualizar ModMii al inicio del programa (Habilitado)
echo.
echo    N = Compruebe si hay nuevas versiones de ModMii ahora
echo.
echo    S = Guardar configuracion         R = Restaurar la configuracion por defecto
echo.
echo    M = Menu Principal
echo.
set /p OPTIONS=     Escriba su seleccion aqui: 


if /i "%OPTIONS%" EQU "RS" goto:ROOTSAVE
if /i "%OPTIONS%" EQU "PC" goto:PCSAVE
if /i "%OPTIONS%" EQU "1" goto:Option1
if /i "%OPTIONS%" EQU "CE" goto:OptionCE
if /i "%OPTIONS%" EQU "N" goto:UpdateModMii
if /i "%OPTIONS%" EQU "A" goto:AutoUpdate
if /i "%OPTIONS%" EQU "36" goto:Option36
if /i "%OPTIONS%" EQU "CM" goto:CMIOSOPTION
if /i "%OPTIONS%" EQU "FWD" goto:FWDOPTION
if /i "%OPTIONS%" EQU "sv" goto:OptionSneekverbose
if /i "%OPTIONS%" EQU "v" goto:OptionModMiiverbose
if /i "%OPTIONS%" EQU "SSD" goto:OptionSSD
if /i "%OPTIONS%" EQU "f" goto:Optionfont

if not exist "%DRIVE%" goto:nodrivefolder2
if /i "%OPTIONS%" EQU "C" echo ;;%DRIVE%>Custom.md5
::if /i "%OPTIONS%" EQU "C" support\sfk list "%DRIVE%" wad dol app elf +md5gento="%DRIVE%"\Custom.md5
if /i "%OPTIONS%" EQU "C" support\fvc -c -a MD5 -r "%DRIVE%"\*.*>>Custom.md5
if /i "%OPTIONS%" EQU "C" support\sfk filter Custom.md5 -unique -write -yes>nul
if /i "%OPTIONS%" EQU "C" goto:Options

if not exist Custom.md5 goto:nocustomMD5
if /i "%OPTIONS%" NEQ "C2" goto:nodrivefolder2
support\sfk filter custom.md5 -ls+;; -rep _";;"__ >temp\customMD5path.txt
support\sfk filter -spat temp\customMD5path.txt -rep _\x5f_?_ -write -yes>nul
set /p customdrive= <temp\customMD5path.txt
del temp\customMD5path.txt>nul

echo %drive% >temp\newMD5path.txt
support\sfk filter -spat temp\newMD5path.txt -rep _\x5f_?_ -write -yes>nul
set /p newdrive= <temp\newMD5path.txt
set newdrive=%newdrive:~0,-1%
del temp\newMD5path.txt>nul
support\sfk filter -spat custom.md5 -rep _\x5f_?_ -write -yes>nul
support\sfk filter custom.md5 -rep _"%customdrive%"_"%newDRIVE%"_ -write -yes>nul
support\sfk filter -spat custom.md5 -rep _\x3f_\x5f_ -write -yes>nul
Set DB=C
goto:Finish
:nodrivefolder2

if not exist Custom.md5 goto:nocustomMD5
if /i "%OPTIONS%" EQU "C3" del Custom.md5>nul
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


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:OPTIONS







:RestoreSettings
set ROOTSAVE=off
set effect=No-Spin
set PCSAVE=Auto
set OPTION1=off
set OPTION36=on
set CMIOSOPTION=off
set FWDOPTION=on
set Drive=COPY_TO_SD
set DriveU=COPY_TO_USB
set ACTIVEIOS=on
set AUTOUPDATE=on
Set ModMiiverbose=off
Set SSD=off
Set sneekverbose=off
Set SNKFONT=B

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
echo                                       by XFlak
echo.
:savesettingsnow
echo ::ModMii Settings > Support\settings.bat
echo ::ModMiiv%currentversion%>> Support\settings.bat
echo Set ROOTSAVE=%ROOTSAVE%>> Support\settings.bat
echo Set effect=%effect%>> Support\settings.bat
echo Set PCSAVE=%PCSAVE%>> Support\settings.bat
echo Set Option1=%Option1%>> Support\settings.bat
echo Set OPTION36=%OPTION36%>> Support\settings.bat
echo Set CMIOSOPTION=%CMIOSOPTION%>> Support\settings.bat
echo Set FWDOPTION=%FWDOPTION%>> Support\settings.bat
echo Set Drive=%DRIVE%>> Support\settings.bat
echo Set DriveU=%DRIVEU%>> Support\settings.bat
echo Set overwritecodes=%overwritecodes%>> Support\settings.bat
echo Set cheatregion=%cheatregion%>> Support\settings.bat
echo Set cheatlocation=%cheatlocation%>> Support\settings.bat
echo Set ACTIVEIOS=%ACTIVEIOS%>> Support\settings.bat
echo Set AUTOUPDATE=%AUTOUPDATE%>> Support\settings.bat
echo Set ModMiiverbose=%ModMiiverbose%>> Support\settings.bat
echo Set SSD=%SSD%>> Support\settings.bat
echo Set sneekverbose=%sneekverbose%>> Support\settings.bat
echo Set SNKFONT=%SNKFONT%>> Support\settings.bat
echo Set wiicheat=%wiicheat%>> Support\settings.bat
echo Set WiiWarecheat=%WiiWarecheat%>> Support\settings.bat
echo Set VCArcadecheat=%VCArcadecheat%>> Support\settings.bat
echo Set WiiChannelscheat=%WiiChannelscheat%>> Support\settings.bat
echo Set Gamecubecheat=%Gamecubecheat%>> Support\settings.bat
echo Set NEScheat=%NEScheat%>> Support\settings.bat
echo Set SNEScheat=%SNEScheat%>> Support\settings.bat
echo Set N64cheat=%N64cheat%>> Support\settings.bat
echo Set SMScheat=%SMScheat%>> Support\settings.bat
echo Set Segacheat=%Segacheat%>> Support\settings.bat
echo Set NeoGeocheat=%NeoGeocheat%>> Support\settings.bat
echo Set Commodorecheat=%Commodorecheat%>> Support\settings.bat
echo Set MSXcheat=%MSXcheat%>> Support\settings.bat
echo Set TurboGraFX-16cheat=%TurboGraFX-16cheat%>> Support\settings.bat
echo Set TurboGraFX-CDcheat=%TurboGraFX-CDcheat%>> Support\settings.bat
echo set AGREEDVERSION=%currentversion%>> Support\settings.bat
if /i "%OPTIONS%" EQU "R" goto:OPTIONS
if exist Support\settings.bat echo                                     Ajustes guardados.
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

:Option1
if /i "%OPTION1%" EQU "off" (set OPTION1=on) & (goto:options)
if /i "%OPTION1%" EQU "on" (set OPTION1=nus) & (goto:options)
if /i "%OPTION1%" EQU "nus" (set OPTION1=all) & (goto:options)
if /i "%OPTION1%" EQU "all" (set OPTION1=off) & (goto:options)

:OptionCE
if /i "%effect%" EQU "no-spin" (set effect=Spin) & (goto:options)
if /i "%effect%" EQU "spin" (set effect=Fast-Spin) & (goto:options)
if /i "%effect%" EQU "fast-spin" (set effect=No-Spin) & (goto:options)

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

:FWDOPTION
if /i "%FWDOPTION%" EQU "ON" goto:FWDOPTIONoff
Set FWDOPTION=ON
goto:OPTIONS

:FWDOPTIONoff
Set FWDOPTION=OFF
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


:OptionSSD
if /i "%SSD%" EQU "on" goto:OptionSSDoff
Set SSD=on
goto:OPTIONS

:OptionSSDoff
Set SSD=off
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
echo                                       by XFlak
echo.
echo.
echo                                  OPCIONES CODIGO TRUCOS
echo.
echo.
echo           R = Region para descargar trucos: (%cheatregion%)
echo.
if /i "%overwritecodes%" EQU "OFF" echo           O = Sobrescribir txtcodes actual (Desabilitado)
if /i "%overwritecodes%" EQU "ON" echo           O = Sobrescribir txtcodes actual (Habilitado)
echo.
if /i "%cheatlocation%" EQU "B" echo           L = Localizacion(es) para guardar trucos: (De 1 y 2)
if /i "%cheatlocation%" EQU "T" echo           L = Localizacion(es) para guardar trucos: (1: txtcodes)
if /i "%cheatlocation%" EQU "C" echo           L = Localizacion(es) para guardar trucos: (2: codes\X\L)
echo               1: - Utilizado por la mayoria de aplicaciones, incluido
echo                     CFG USB-Loader
echo               2: - codes\X\L\: lugar utilizado por Accio Hacks
echo                        X = Letra ID de la consola (ie. Wii = R)
echo                        L = Primera letra del titulo del juego
echo                            ('#' si comienza con un numero)
echo.
echo.
echo                   Seleccione o anule las consolas para descargar trucos:
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Las consolas seleccionadas se marcan en [Green]Verde
echo.
echo.
if /i "%wiicheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]1 = Wii) else (echo                 1 = Wii)
if /i "%WiiWarecheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]2 = WiiWare) else (echo                 2 = WiiWare)

::if /i "%VCArcadecheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]3 = VC Arcade)  else (echo                 3 = VC Arcade)
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]3 = VC Arcade (Disabled due to geckocodes.org error)

if /i "%WiiChannelscheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]4 = Wii Channels)  else (echo                 4 = Wii Channels)
if /i "%Gamecubecheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]5 = Gamecube)  else (echo                 5 = Gamecube)
if /i "%NEScheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]6 = NES/Famicom VC)  else (echo                 6 = NES/Famicom VC)
if /i "%SNEScheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]7 = Super NES/Famicom VC)  else (echo                 7 = Super NES/Famicom VC)
if /i "%N64cheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]8 = Nintendo 64 VC)  else (echo                 8 = Nintendo 64 VC)
if /i "%SMScheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green]9 = Sega Master System VC)  else (echo                 9 = Sega Master System VC)
if /i "%Segacheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 10 = Sega Genesis/Mega Drive VC)  else (echo                10 = Sega Genesis/Mega Drive VC)
if /i "%NeoGeocheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 11 = NeoGeo VC)  else (echo                11 = NeoGeo VC)
if /i "%Commodorecheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 12 = Commodore 64 VC)  else (echo                12 = Commodore 64 VC)
if /i "%MSXcheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 13 = MSX VC)  else (echo                13 = MSX VC)
if /i "%TurboGraFX-16cheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 14 = TurboGraFX-16 VC)  else (echo                14 = TurboGraFX-16 VC)
if /i "%TurboGraFX-CDcheat%" EQU "ON" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 15 = TurboGraFX-CD VC)  else (echo                15 = TurboGraFX-CD VC)
echo.
echo.
echo                 A = Todo
echo                 C = Limpiar
echo.
echo                 S = Guardar configuracion
echo                 D = Configuracion por defecto para trucos
echo.
echo                 B = Atras
echo                 M = Menu principal
echo.
echo.
echo.
set /p cheatoption=     Escriba su seleccion aqui: 



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


echo Ha introducido una clave incorrecta
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

if /i "%countconsoles%" EQU "0" echo Seleccionar al menos una consola para descargar Trucos
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
echo                                       by XFlak
echo.
echo.
echo.
echo     Introducir la letra de la unidad (o ruta) para guardar los archivos de la SD

::the below msg is only for people building a nand
if /i "%SNEEKSELECT%" EQU "2" goto:donotskip
if /i "%SNEEKSELECT%" EQU "3" (goto:donotskip) else (goto:skip)
:donotskip
echo.
echo.
echo       Nota: para instalar emulacion de NAND como WADS tambien se guardaran en esa direccion
echo             por lo que no sera necesario volver a descargar para construir la futura NANDs
:skip

echo.
echo.
echo             Configuracion actual:   %Drive%
echo.
echo.
echo         Notas: * Para continuar con la configuracion actual
echo               deje en blanco la seleccion y pulsa enter.
echo.
echo             * Usted puede arrastrar y soltar la unidad/carpeta en esta
echo               ventana para guardar usted tiene que escribirlo manualmente
echo.
echo             * Si sigues teniendo errores, intente con la configuracion predeterminada
echo.
echo.
echo.
echo     EJEMPLOS
echo.
echo.
echo            L:
echo.
echo            %%userprofile%%\Desktop\COPY_TO_SD
echo                  Note: %%userprofile%% acceso directo no funciona en Windows XP
echo.
echo            ModMii\4.2U
echo                  Nota: esto crea la carpeta ModMii\4.2U donde se guarda este programa
echo.
echo            C:\Users\XFlak\Desktop\New Folder
echo.
echo.
echo.
echo         D = Configuracion por defecto: COPY_TO_SD
echo.
echo.
echo         B = Atras
echo.
echo         M = Menu principal
echo.
echo.
set /p Drivetemp=     Escriba su seleccion aqui: 

::remove quotes from variable (if applicable)
echo "set DRIVETEMP=%DRIVETEMP%">temp.txt
support\sfk filter -quiet temp.txt -rep _""""__>temp.bat
call temp.bat
del temp.bat>nul
del temp.txt>nul



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
echo %DRIVETEMP:~0,2% no existe, por favor, intentelo de nuevo...
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DRIVECHANGE
:skipcheck


set DRIVE=%DRIVETEMP%
set REALDRIVE=%DRIVE%


::autosave drive setting to settings.bat
support\sfk filter Support\settings.bat -!"Set Drive=" -write -yes>nul
echo Set Drive=%DRIVE%>>Support\settings.bat

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
echo                                       by XFlak
echo.
echo.
echo.
echo         Introducir la letra de la unidad (o ruta) para guardar los archivos
echo        del disco USB
echo.
echo.
echo             Configuracion actual:   %DriveU%
echo.
echo.
echo     Notas: * Para continuar con la configuracion actual
echo              deje en blanco la seleccion y pulsa enter.
echo.
echo            * Usted puede arrastrar y soltar la unidad/carpeta en esta
echo              ventana para guardar usted tiene que escribirlo manualmente
echo.
echo            * Si sigues teniendo errores, intente con la configuracion
echo              predeterminada
echo.
echo.
echo.
echo     EJEMPLOS
echo.
echo.
echo            L:
echo.
echo            %%userprofile%%\Desktop\COPY_TO_USB
echo                  Nota: %%userprofile%% acceso directo no funciona en Windows XP
echo.
echo            ModMii\4.2U
echo                  Nota: esto crea la carpeta ModMii\4.2U donde se guarda
echo                        este programa
echo.
echo            C:\Users\XFlak\Desktop\New Folder
echo.
echo.
echo.
echo         D = Configuracion por defecto: COPY_TO_USB
echo.
echo.
echo     B = Atras
echo.
echo     M = Menu principal
echo.
echo.
set /p DriveUtemp=     Escriba su seleccion aqui: 


::remove quotes from variable (if applicable)
echo "set DRIVEUTEMP=%DRIVEUTEMP%">temp.txt
support\sfk filter -quiet temp.txt -rep _""""__>temp.bat
call temp.bat
del temp.bat>nul
del temp.txt>nul


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
echo %DRIVEUTEMP:~0,2% no existe, por favor, intentelo de nuevo...
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DRIVEUCHANGE
:skipcheck



set DRIVEU=%DRIVEUTEMP%

::autosave drive setting to settings.bat
support\sfk filter Support\settings.bat -!"Set DriveU=" -write -yes>nul
echo Set DriveU=%DRIVEU%>>Support\settings.bat

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
echo                                       by XFlak
echo.
echo.
echo                                Version actual %CurrentVersion%
echo.
echo                                 Comprobando actualizaciones...
echo.


if exist list.bat del list.bat>nul

start %ModMiimin%/wait support\wget -N "http://code.google.com/p/nusad/downloads/list?can=3&q=&colspec=Filename+Summary+Uploaded+ReleaseDate+Size+DownloadCount"

if exist list* (move /y list* list.bat>nul) else (goto:updatefail)
support\sfk filter -quiet "list.bat" -+"%UPDATENAME%" -rep _".txt*"__ -rep _"*%UPDATENAME%-"_"set newversion="_ -rep _" </a>*"__ -write -yes
support\sfk filter "list.bat" -unique -write -yes>nul
call list.bat
del list.bat>nul

if %currentversion% GTR %newversion:~0,5% (echo                  Esta version es la mas reciente que la version publica) & (echo.) & (echo                           You got some crazy new beta shit!) & (@ping 127.0.0.1 -n 4 -w 1000> nul) & (goto:menu)

::before %updatename% is called %newversion% can be more than 5 chars (ie. 4.6.0.1)
if %currentversion% EQU %newversion% (echo                              Esta version esta actualizada) & (@ping 127.0.0.1 -n 4 -w 1000> nul) & (goto:menu)

::if %newversion% has exactly 5 chars (#.#.#), get changelog and update
if "%newversion:~5%"=="" goto:getchangelog

::only make it this far if newversion is greater than current version (ie. not beta shit) and has >5 chars (ie. #.#.#.#). Now check if DL DB needs to be updated (ie. partial update)
set NEWDBUPDATEVERSION=%newversion%
set DBUPDATEVERSION=none
if exist temp\DBUPDATE%newversion:~0,5%.bat call temp\DBUPDATE%newversion:~0,5%.bat
if %NEWDBUPDATEVERSION% EQU %DBUPDATEVERSION% (echo                              Esta version esta actualizada) & (@ping 127.0.0.1 -n 4 -w 1000> nul) & (goto:menu)


:getchangelog
start %ModMiimin%/wait support\wget http://nusad.googlecode.com/files/%UPDATENAME%-%newversion%.txt
if not exist %UPDATENAME%-%newversion%.txt goto:updatefail

ren %UPDATENAME%-%newversion%.txt %UPDATENAME%.bat
call %UPDATENAME%.bat

set newversion=%newversion:~0,5%
if %currentversion% GEQ %newversion% (goto:menu) else (exit)

:updatefail
echo   Comprobacion de actualizacion ha fallado, compruebe la conexion a Internet y la configuracion del firewall.
@ping 127.0.0.1 -n 4 -w 1000> nul
set currentversion=%currentversioncopy%
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
support\sfk md5 -quiet -verify %md5% "%path2clean%"
if errorlevel 1 set match=no
:nocheckexisting
goto:%nextgoto%


:nextpage

if /i "%cleanitems%" NEQ "0" goto:FileCleanup2

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                     LIMPIEZA DE ARCHIVO
echo.
echo.
echo                       No hay archivos innecesarios Existentes en %DRIVE%
echo.
echo.
echo.
echo                               Volver al menu principal...
echo.

@ping 127.0.0.1 -n 4 -w 1000> nul
goto:MENU





:FileCleanup2
set clean=
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                     LIMPIEZA DE ARCHIVOS
echo.
echo                     Despues de terminar tu modificacion Wii, puede borrar
echo              algunos archivos para liberar espacio y asegurarsede que no se puede
echo                 acceder a las aplicaciones potencialmente peligrosas en tu Wii.
echo.
echo         Nota: En lugar de eliminar aplicaciones, puede moverlos a una carpeta bloqueada
echo                 en el HBC (descargable a traves de pagina de descarga de 2).
echo.
echo.
echo          �Te gustar�a borrar los siguientes %DRIVE%?
echo.
if exist "%DRIVE%"\WAD echo          * Archivo WAD
if exist "%DRIVE%"\00000001 echo          * Archivo 00000001
if exist "%DRIVE%"\00010008 echo          * Archivo 00010008
if exist "%DRIVE%"\00010002 echo          * Archivo 00010002
if exist "%DRIVE%"\00010001 echo          * Archivo 00010001
if exist "%DRIVE%"\private\wii\title\aktn echo          * Bannerbomb
if /i "%SmashCheck%" EQU "on" echo          * Smash Stack (USA)
if /i "%SmashJCheck%" EQU "on" echo          * Smash Stack (JAP)

if /i "%SmashPCheck%" EQU "on" echo          * Smash Stack (EURO)
if /i "%SmashP2Check%" EQU "on" echo          * Smash Stack (EURO) - no Guardar

if /i "%SmashKCheck%" EQU "on" echo          * Smash Stack (KOR)
if /i "%SmashK2Check%" EQU "on" echo          * Smash Stack (KOR) - no Guardar


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
if exist "%DRIVE%"\*.dol echo          * Desde DOL la raiz del dispositivo
if exist "%DRIVE%"\*.elf echo          * Desde elf la raiz del dispositivo
if exist "%DRIVE%"\*.wad echo          * Desde Wad la raiz del dispositivo
if exist "%DRIVE%"\*.md5 echo          * Desde Md5 la raiz del dispositivo
echo.
echo       Nota: Todos los archivos anteriores, con la excepcion de WADs
echo             personalizados, puede ser recuperados mas tarde con ModMii
echo.
echo.
echo.
echo                Y = Si, eliminar los archivos ya
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
set /p clean=     Escriba su seleccion aqui: 
if /i "%clean%" EQU "Y" goto:cleannow
if /i "%clean%" EQU "N" goto:MENU
if /i "%clean%" EQU "B" goto:MENU
if /i "%clean%" EQU "M" goto:MENU
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:FileCleanup

:cleannow
set clean2=
echo.
echo.
echo.
echo          Esta seguro que desea eliminar permanentemente
echo       los archivos anteriores? (Y/N)
echo.
set /p clean2=     Escriba su seleccion aqui: 
if /i "%clean2%" EQU "Y" goto:cleannow3
if /i "%clean2%" EQU "N" goto:MENU
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:FileCleanup

:cleannow3



cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                    LIMPIEZA DE ARCHIVOS...
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

echo                                    ARCHIVOS LIMPIOS
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
echo                                       by XFlak
echo.
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Asistente de configuracion de guardado detectado!
echo.
echo.
echo               Le gustaria cargar Ajustes guardados del asistente ahora?
echo.
echo.
echo.
echo         Nota: Usted podra ver y confirmar la configuracion de carga
echo               antes de iniciar la descarga
echo.
echo.
echo.
echo                Y = Si, carga Wizard_Settings.bat
echo                N = No, Continuar con el asistente de descarga
echo.
echo                D = Eliminar Wizard_Settings.bat para dejar de ver esta pagina
echo                    en el futuro continue con el Asistente de Descarga
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p LoadWizSettings=     Escriba su seleccion aqui: 


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

if /i "%LoadWizSettings%" EQU "D" del Wizard_Settings.bat>nul
if /i "%LoadWizSettings%" EQU "D" goto:WPAGE1
if /i "%LoadWizSettings%" EQU "N" goto:WPAGE1

echo Ha introducido una clave incorrecta
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
set ThemeSelection=



cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo         Es esta la primera vez que modifica su Wii?
echo                                         ---
echo                                          O
echo                                         ---
echo         Desea actualizar todos los mods (conocido como volver a hackear tu Wii)
echo.
echo.
echo.
echo.
echo     Nota: Solo usted sabe responder especificamente lo que usted desea actualizar
echo.
echo.
echo.
echo                Y = si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p VIRGIN=     Escriba su seleccion aqui: 


if exist Wizard_Settings.bat goto:backtoloadwiz
if /i "%VIRGIN%" EQU "B" goto:MENU
:backtoloadwiz
if /i "%VIRGIN%" EQU "B" goto:LoadWizardSettings

if /i "%VIRGIN%" EQU "M" goto:MENU
if /i "%VIRGIN%" EQU "Y" goto:WPAGE2
if /i "%VIRGIN%" EQU "N" goto:WPAGE2

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE1

::...................................Wizard Page2 - Current Firmware...............................
:WPAGE2
set FIRMSTART=

set backb4HACKMIISOLUTION=WPAGE2

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if /i "%MENU1%" EQU "H" echo                                  Soluciones HackMii
if /i "%MENU1%" EQU "H" echo.
echo         Cual es su version del firmware actual?
echo.
echo.
echo.
echo         Nota: Para comprobar esto, en su Wii, haga clic en el boton Wii en la
echo               parte inferior izquierda del menu del sistema, haga clic en
echo               Configuracion de Wii, entonces vera el firmware en la parte
echo               superior derecha de la pantalla (ie. 4.2U, 4.1J, 3.2E, etc.)

if /i "%VIRGIN%" EQU "N" goto:skipnote
echo.
echo         Nota: Si el firmware actual es v2.2 o inferior, es posible que necesite
echo               usar un exploit alternativo [es decir. Twilight Hack (U/E/J),
echo               Stack Smash (U/J) o Indiana Pwns (U/E)] en lugar de bannerbomb.
echo.
:skipnote
echo.
echo.
echo.
echo                4.3 = 4.3
echo                4.2 = 4.2
echo                4.1 = 4.1
echo                4.0 = 4.0
echo                3.X = 3.0-3.5
echo                  O = Otros (Inferior a 2.2)

echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.

set /p FIRMSTART=     Escriba su seleccion aqui: 




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
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE2


::...................................Wizard Page3 - REGION...............................
:WPAGE3
if /i "%FIRMSTART%" EQU "4.3" goto:WPAGE3hard
if /i "%FIRMSTART%" EQU "o" goto:WPAGE3hard
if /i "%MENU1%" EQU "H" goto:HACKMIISOLUTION
:WPAGE3hard
set REGION=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo         Cual es su region?
echo.
echo.
echo         Nota: para comprobar esto, en su Wii, haga clic en el boton Wii en la
echo               parte inferior izquierda del menu del sistema, haga clic en
echo               Configuracion de Wii, entonces vera el firmware en la parte
echo               superior derecha de la pantalla (ie. 4.2U, 4.1J, 3.2E, etc.)
echo.
echo         Nota: Si tu Wii fue cambiada la region elegir la zona donde se
echo               encuentran actualmente
echo.
echo.
echo                U = USA
echo                E = Euro (PAL)
echo                J = JAP
echo                K = coreano
echo.
echo.
echo.
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.

set /p REGION=     Escriba su seleccion aqui: 

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

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE3



::...................................Wizard Page3C - Exploit...............................
:WPAGE3C

SET EXPLOIT=default
set exploitselection=
if /i "%VIRGIN%" EQU "N" goto:WPAGE3D

if /i "%FIRMSTART%" EQU "4.3" goto:WPAGE3Cnext
if /i "%FIRMSTART%" EQU "o" goto:WPAGE3Cnext


goto:WPAGE4


::Only virgin 4.3 U/E/J wii's or <2.2 U/E/J Wii's will make it this far
:WPAGE3Cnext

set backb4HACKMIISOLUTION=WPAGE3c


set exploitselection=yes

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.

if /i "%MENU1%" NEQ "H" echo      Recuerda que debes tener, alquilar o pedir prestado uno de los siguientes
if /i "%MENU1%" NEQ "H" echo      juegos para modificar tu Wii
if /i "%MENU1%" EQU "H" echo      Si el canal homebrew no puede cargar aplicaciones correctamente, usted
if /i "%MENU1%" EQU "H" echo      debe poseer, alquilar, o pedir prestado uno de los dos siguientes
if /i "%MENU1%" EQU "H" echo      juegos para solucionar el problema.
echo.
echo      Seleccione el juego que desea utilizar:
echo.
echo.
echo.
echo.
echo                S = Super Smash Brothers Brawl
if /i "%REGION%" NEQ "K" echo                L = LEGO Indiana Jones
if /i "%REGION%" NEQ "K" echo               LB = LEGO Batman
if /i "%REGION%" NEQ "K" echo               LS = LEGO Star Wars
if /i "%REGION%" NEQ "K" echo                Y = Yu-Gi-Oh! 5D's
if /i "%REGION%" NEQ "K" echo              TOS = Tales of Symphonia: Dawn of the New World


if /i "%FIRMSTART%" EQU "o" echo                T = Twilight Princess: The Legend of Zelda
if /i "%FIRMSTART%" EQU "o" echo.
echo                ? = Si no estas seguro, descarga todo lo anterior y mas tarde decide
echo.
echo.
echo.

if /i "%FIRMSTART%" EQU "o" goto:skipbomb
echo      ATENCION: Un exploit nuevo llamado Letterbomb ha sido liberado, pero
echo                 ModMii no esta preparado para usted todavia. Si desea utilizar
echo                 este exploit con poca ayuda ModMii, tipo "BOMB"
echo.
echo             BOMB = LetterBomb
echo.
echo.
:skipbomb

if /i "%FIRMSTART%" NEQ "o" goto:skipOmsg
support\sfk echo -spat \x20 [Red] Notas importantes:
echo.
echo    Alternativamente, usted puede actualizar su Wii a la version 3.0-4.2 con un DISCO (es decir, NSMBW)
echo    repita el Asistente de descarga con su nuevo firmware para hackear su
echo    Wii sin necesidad de uno de los juegos anteriores
echo.
:skipOmsg

echo.
echo.
echo.
echo.
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p EXPLOIT=     Escriba su seleccion aqui: 

if /i "%EXPLOIT%" EQU "M" goto:MENU

if /i "%EXPLOIT%" EQU "B" goto:WPAGE3

if /i "%FIRMSTART%" NEQ "o" goto:twilightnotavailable
if /i "%EXPLOIT%" EQU "T" goto:WPAGE3D
:twilightnotavailable

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

if /i "%FIRMSTART%" EQU "o" goto:notbomb
if /i "%EXPLOIT%" NEQ "BOMB" goto:notbomb
start http://please.hackmii.com
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo    ModMii deberia de abrir su navegador en http://please.hackmii.com
echo.
echo    En esta pagina web, introduzca su region menu del sistema y la direccion MAC
echo.
echo       Nota: para encontrar la direccion MAC de tu Wii, haga clic en el Boton Wii
echo             en la parte inferior izquierda del menu del sistema,haga clic en
echo             Configuracion de Wii, luego Internet, la consola de la Informacion.
echo.
echo.
echo.
echo    Desactive la opcion paquete HackMii Installer por mi, rellenar el codigo
echo    de la imagen y elija cualquiera de los dos. Que se descarga un archivo ZIP,
echo    abrir este archivo, y usted Vera una carpeta de copia privada, y lo
echo    pega en la raiz de la tarjeta SD.
echo.
echo    ModMii va a generar una guia para el supuesto de que hayas hecho esto
echo    correctamente.
echo.
echo.
echo    Pulse cualquier tecla cuando este listo para continuar...
echo.
pause>nul
goto:WPAGE3D
:notbomb


echo Ha introducido una clave incorrecta
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
echo      Quieres descargar IOSs activo?
echo.
echo.
echo.
echo      N = No
echo.
echo      Usted esta en el menu del sistema 4.3, asi que probablemente
echo      ya tiene la ultima IOSs.
echo      Si tu Wii no a sido modificada anteriormente, se puede decir No.
echo.
echo.
echo      Y = Si
echo.
echo      Si tu Wii tiene DarkCorp/cIOSCorp instalado, se puede decir Si
echo      para sobrescribirlo.
echo      Si los discos originales de Wii o WiiWare no estan funcionando
echo      correctamente, decir Si para arreglarlo.
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
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p UpdatesIOSQ=     Escriba su seleccion aqui: 

if /i "%UpdatesIOSQ%" EQU "M" goto:MENU
if /i "%UpdatesIOSQ%" EQU "Y" goto:WPAGE4
if /i "%UpdatesIOSQ%" EQU "N" goto:WPAGE4


if /i "%VIRGIN%" EQU "N" goto:backtowpage3
if /i "%REGION%" EQU "K" goto:backtowpage3

if /i "%UpdatesIOSQ%" EQU "B" goto:WPAGE3C

:backtowpage3
if /i "%REGION%" EQU "RC" goto:backtowpage3b
if /i "%UpdatesIOSQ%" EQU "B" goto:WPAGE3



echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE3D











::...................................Wizard Page4 - New Firmware...............................
:WPAGE4
if /i "%MENU1%" EQU "H" goto:HACKMIISOLUTION
set FIRM=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo         Seleccione el nuevo firmware que le gustaria actualizar/rebajar a.
echo.
echo.
echo.
echo         Nota: si el firmware actual = nuevo firmware, igual al menu de sistema
echo               no se descargara
echo.
echo.
echo.
support\sfk echo -spat \x20 \x20 \x20 [Red] instalacion del firmware por debajo de 4,0 en boot2v4
echo             resultados de Brickear la wii.
echo             Sin embargo, otro Wad Manager (YAWMM) o MMM no le permitira
echo             (des)instalar cualquier cosa que te de un Brick.
echo             Se puede verificar manualmente la version boot2 con MMM, DOP-Mii
echo             o BootMii.
echo.
echo.
echo.

::if /i "%FIRMSTART%" NEQ "4.3" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] 4.3 = 4.3 [NO RECOMENDADO]) else (echo                4.3 = 4.3)

if /i "%FIRMSTART%" EQU "4.3" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 4.3 = 4.3 [RECOMENDADO]) else (echo                4.3 = 4.3)

if /i "%FIRMSTART%" EQU "4.2" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 4.2 = 4.2 [RECOMENDADO]) else (echo                4.2 = 4.2)

if /i "%FIRMSTART%" EQU "4.3" goto:SkipGreen4.1
if /i "%FIRMSTART%" EQU "4.2" goto:SkipGreen4.1

support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Green] 4.1 = 4.1 [RECOMENDADO]
goto:skipWhite4.1


:SkipGreen4.1
echo                4.1 = 4.1

:skipWhite4.1


echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p FIRM=     Escriba su seleccion aqui: 

if /i "%FIRM%" EQU "M" goto:MENU

if /i "%FIRM%" EQU "4.2" goto:WPAGE5
if /i "%FIRM%" EQU "4.1" goto:WPAGE5
if /i "%FIRM%" EQU "4.3" goto:WPAGE5


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


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE4

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
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Te gustaria instalar cualquiera de los siguientes canales:
echo.
echo.
echo.
echo           * Photo
if /i "%REGION%" NEQ "K" echo           * Internet
if /i "%REGION%" NEQ "K" echo           * Tiempo
if /i "%REGION%" NEQ "K" echo           * Noticias
echo           * Mii
echo           * Tienda
if /i "%REGION%" NEQ "K" echo           * Wii Speak
echo.
echo.
echo.
echo                A = Todo
echo                S = Alguno
echo                N = Ninguno
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p MORE=     Escriba su seleccion aqui: 

if /i "%MORE%" EQU "M" goto:MENU

if /i "%MENU1%" EQU "S" goto:forsneeknand
if /i "%MORE%" EQU "B" goto:WPAGE4
if /i "%MORE%" EQU "N" goto:WPAGE13

:forsneeknand
if /i "%MORE%" EQU "B" goto:WPAGE20
if /i "%MORE%" EQU "A" set B4SNKCONFIRM=WPAGE5
if /i "%MORE%" EQU "N" set B4SNKCONFIRM=WPAGE5
if /i "%MORE%" EQU "N" goto:SNKNANDCONFIRM

if /i "%MORE%" EQU "S" goto:WPAGE6
if /i "%MORE%" EQU "A" goto:WPAGE6

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE5




::...................................Wizard Page6 - Photo Channel...............................
:WPAGE6

if /i "%MORE%" EQU "A" set PIC=Y
if /i "%MORE%" EQU "A" goto:WPAGE7

set PIC=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Instalar el Canal Fotos?
echo.
echo.
echo.
echo                Y = Si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p PIC=     Escriba su seleccion aqui: 

if /i "%PIC%" EQU "Y" goto:WPAGE7
if /i "%PIC%" EQU "N" goto:WPAGE7
if /i "%PIC%" EQU "M" goto:MENU
if /i "%PIC%" EQU "B" goto:WPAGE5

echo Ha introducido una clave incorrecta
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
echo                                       by XFlak
echo.
echo.
echo      Instalar el Canal Internet?
echo.
echo.
echo.
echo                Y = Si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p NET=     Escriba su seleccion aqui: 

if /i "%NET%" EQU "Y" goto:WPAGE8
if /i "%NET%" EQU "N" goto:WPAGE8
if /i "%NET%" EQU "M" goto:MENU
if /i "%NET%" EQU "B" goto:WPAGE6

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE7



::...................................Wizard Page8 - Weather...............................
:WPAGE8

if /i "%MORE%" EQU "A" set Weather=Y
if /i "%MORE%" EQU "A" goto:WPAGE9

set Weather=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Instalar el canal del tiempo?
echo.
echo.
echo.
echo                Y = Si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p WEATHER=     Escriba su seleccion aqui: 

if /i "%WEATHER%" EQU "Y" goto:WPAGE9
if /i "%WEATHER%" EQU "N" goto:WPAGE9
if /i "%WEATHER%" EQU "M" goto:MENU
if /i "%WEATHER%" EQU "B" goto:WPAGE7

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE8

::...................................Wizard Page9 - NEWS...............................
:WPAGE9

if /i "%MORE%" EQU "A" set NEWS=Y
if /i "%MORE%" EQU "A" goto:WPAGE10

set NEWS=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Instalar el canal noticias?
echo.
echo.
echo.
echo                Y = Si
echo                N = No
echo.
echo                B = atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p NEWS=     Escriba su seleccion aqui: 

if /i "%NEWS%" EQU "Y" goto:WPAGE10
if /i "%NEWS%" EQU "N" goto:WPAGE10
if /i "%NEWS%" EQU "M" goto:MENU
if /i "%NEWS%" EQU "B" goto:WPAGE8

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE9

::...................................Wizard Page10 - Mii...............................
:WPAGE10

if /i "%MORE%" EQU "A" set MIIQ=Y
if /i "%MORE%" EQU "A" goto:WPAGE11

set MIIQ=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Instalar el Canal Mii?
echo.
echo.
echo.
echo                Y = Si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p MIIQ=     Escriba su seleccion aqui: 

if /i "%MIIQ%" EQU "Y" goto:WPAGE11
if /i "%MIIQ%" EQU "N" goto:WPAGE11
if /i "%MIIQ%" EQU "M" goto:MENU

if /i "%REGION%" EQU "K" goto:Koreanbacktophoto
if /i "%MIIQ%" EQU "B" goto:WPAGE9

:Koreanbacktophoto
if /i "%MIIQ%" EQU "B" goto:WPAGE6

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE10

::...................................Wizard Page11 - Shop...............................
:WPAGE11

if /i "%MORE%" EQU "A" set Shop=Y
if /i "%MORE%" EQU "A" goto:WPAGE12

set Shop=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Instalar el canal tienda?
if /i "%MENU1%" NEQ "S" echo.
if /i "%MENU1%" NEQ "S" echo.
if /i "%MENU1%" NEQ "S" echo.
if /i "%MENU1%" NEQ "S" echo          Nota: IOS56 tambien se debe descargar
echo.
echo.
echo.
echo                Y = Si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p SHOP=     Escriba su seleccion aqui: 

if /i "%Shop%" EQU "Y" goto:WPAGE12
if /i "%Shop%" EQU "N" goto:WPAGE12
if /i "%Shop%" EQU "M" goto:MENU
if /i "%Shop%" EQU "B" goto:WPAGE10

echo Ha introducido una clave incorrecta
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
echo                                       by XFlak
echo.
echo.
echo      Instalar el Canal Wii Speak?
echo.
echo.
echo.
echo                Y = Si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p Speak=     Escriba su seleccion aqui: 

if /i "%Speak%" EQU "Y" goto:WPAGE13
if /i "%Speak%" EQU "N" goto:WPAGE13
if /i "%Speak%" EQU "M" goto:MENU
if /i "%Speak%" EQU "B" goto:WPAGE11

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE12



::...................................Wizard Page13 - MORE Advanced Channels?...............................
:WPAGE13
if /i "%VIRGIN%" EQU "Y" goto:WPAGE20
if /i "%MENU1%" EQU "S" set B4SNKCONFIRM=WPAGE12
if /i "%MORE%" EQU "A" set B4SNKCONFIRM=WPAGE5
if /i "%MENU1%" EQU "S" goto:SNKNANDCONFIRM

set Advanced=
set HMInstaller=
set RECCIOS=
set yawmQ=
set PRIQ=
set ThemeSelection=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Te gustaria instalar y\o actualizar cualquiera de los siguientes:
echo.
echo.
echo.
echo           * Homebrew Channel y\o BootMii
echo.

if /i "%CMIOSOPTION%" EQU "on" (echo           * cIOSs Recomendados y cMIOS) else (echo           * Recommended cIOSs)


echo.
echo           * Hay otro Wad Manager Mod (YAWMM)
echo.
echo           * IOS236
echo.
echo           * Priiloader v0.7 (o hacks menu del Sistema)
echo.
echo           * Tema del Menu del Sistema
echo.
echo           * USB-Loader
echo.
echo.
echo                Y = Si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p Advanced=     Escriba su seleccion aqui: 

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

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE13


::...................................Wizard Page13B - HAckMii Installer...............................
:WPAGE13B


set HMInstaller=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Te gustaria instalar y\o actualizar el Homebrew Channel y\o BootMii?

echo.
echo.
echo      Descargue los siguientes archivos:
echo      ---------------------------------------
echo.
echo      * HackMii Installer
if /i "%FIRMSTART%" EQU "o" echo      * Todos los exploits disponibles
if /i "%FIRMSTART%" EQU "3.X" echo      * BannerBomb v1
if /i "%FIRMSTART%" EQU "4.0" echo      * BannerBomb v1
if /i "%FIRMSTART%" EQU "4.1" echo      * BannerBomb v1
if /i "%FIRMSTART%" EQU "4.2" echo      * BannerBomb v2
if /i "%FIRMSTART%" EQU "4.3" echo      * Todos los exploits disponibles
echo      * IOS58

if /i "%FIRMSTART%" EQU "4.3" (echo.) & (echo      Nota: Exploit Letterbomb disponible aqui - http://please.hackmii.com)

echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Yes
echo                N = No
echo.
echo                B = Back
echo                M = Main Menu
echo.
echo.
echo.
echo.
set /p HMInstaller=     Enter Selection Here: 

if /i "%HMInstaller%" EQU "Y" goto:WPAGE14
if /i "%HMInstaller%" EQU "N" goto:WPAGE14
if /i "%HMInstaller%" EQU "M" goto:MENU
if /i "%HMInstaller%" EQU "B" goto:WPAGE13



echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE13B


::...................................Wizard Page14 - cIOSs and cMIOSs...............................
:WPAGE14
set RECCIOS=

set d2x-beta-rev=6
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if /i "%CMIOSOPTION%" EQU "on" (echo      le gustaria actualizar las siguientes recomendaciones cIOSs y cMIOS?) else (echo      Le gustaria actualizar los cIOSs recomiendados?)
echo.
echo.
echo.
echo          *cIOS202[60]-v5.1R.wad
echo.
echo          *cIOS222[38]-v4.wad
echo.
echo          *cIOS223[37-38]-v4.wad
echo.
echo          *cIOS224[57]-v5.1R.wad
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
echo                Y = Si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p RECCIOS=     Escriba su seleccion aqui: 

if /i "%RECCIOS%" EQU "Y" goto:WPAGE17
if /i "%RECCIOS%" EQU "N" goto:WPAGE17
if /i "%RECCIOS%" EQU "M" goto:MENU


if /i "%RECCIOS%" EQU "B" goto:WPAGE13B

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE14

::...................................Wizard Page15 and 16 removed...............................


::...................................Wizard Page17 - YAWMM...............................
:WPAGE17
set yawmQ=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Descargar Wad Manager Mod (YAWMM)?
echo.
echo.
echo.
echo      Nota: Wad Managers Otros pueden no ser compatibles con cIOSs como
echo          IOS38 como base. Si usted no esta utilizando YAWMM Wad Manager
echo          como principal, no sabe lo que se pierde.
echo.
echo.
echo.
echo                Y = Si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p yawmQ=     Escriba su seleccion aqui: 

if /i "%yawmQ%" EQU "Y" goto:WPAGE18
if /i "%yawmQ%" EQU "N" goto:WPAGE18
if /i "%yawmQ%" EQU "M" goto:MENU
if /i "%yawmQ%" EQU "B" goto:WPAGE14

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE17


::...................................Wizard Page18 - IOS236 Installer...............................
:WPAGE18
set IOS236InstallerQ=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Te gustaria instalar IOS236?
echo.
echo.
echo      Esto descarga los siguientes archivos:
echo      ---------------------------------------
echo.
echo      * IOS236 Installer
echo      * Simple IOS Patcher
echo      * IOS36v3351
echo.
echo.
echo      Nota: IOS236 se utiliza para instalar otras cosas, como WADs, Priiloader, etc
echo.
echo.
echo.
echo.
echo.
echo                Y = Si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p IOS236InstallerQ=     Escriba su seleccion aqui: 

if /i "%IOS236InstallerQ%" EQU "Y" goto:WPAGE19
if /i "%IOS236InstallerQ%" EQU "N" goto:WPAGE19
if /i "%IOS236InstallerQ%" EQU "M" goto:MENU
if /i "%IOS236InstallerQ%" EQU "B" goto:WPAGE17



echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE18

::...................................Wizard Page19 - Priiloader...............................
:WPAGE19
set PRIQ=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Te gustaria instalar y\o actualizar Priiloader (o hacks el menu del sistema)?
echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.

set /p PRIQ=     Escriba su seleccion aqui: 

if /i "%PRIQ%" EQU "Y" goto:WPAGE20
if /i "%PRIQ%" EQU "N" goto:WPAGE20
if /i "%PRIQ%" EQU "M" goto:MENU

if /i "%PRIQ%" EQU "B" goto:WPAGE18

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE19






::...................................Wizard Page20 - Theme Selection...............................
:WPAGE20
set ThemeSelection=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.

if /i "%MENU1%" NEQ "S" goto:quickskip
echo                                  CREADOR SNEEK NAND
echo.
echo.
:quickskip

echo      Te gustaria instalar un tema personalizado en tu Wii?
echo.
echo.
echo.
echo            R = DarkWii Tema Rojo - %effect%
echo         WWWR = Ver DarkWii tema rojo en youtube
echo.
echo.
echo            G = DarkWii Tema Verde - %effect%
echo         WWWG = Ver DarkWii tema Verde en youtube
echo.
echo.
echo           BL = DarkWii Tema Azul - %effect%
echo         WWWB = Ver DarkWii tema Azul en youtube
echo.
echo.
echo            O = DarkWii Tema Naranja - %effect%
echo         WWWO = Ver DarkWii tema Naranja en youtube
echo.
echo.
echo            N = No, yo quiero el mismo viejo y aburrido, aburrido menu del sistema
echo.
echo.
echo.
echo.
echo          CE = Canal Efecto para la personalizacion de temas 
echo               para el menu del sistema: %effect%
echo.
echo.
echo.
echo.
echo.
echo            B = Atras
echo.
echo            M = Menu Principal
echo.
echo.
echo.
echo.
set /p ThemeSelection=     Escriba su seleccion aqui: 

if /i "%ThemeSelection%" EQU "M" goto:MENU
if /i "%ThemeSelection%" EQU "WWWR" (start www.youtube.com/watch?v=qFliF-K-epM)&&(goto:WPAGE20)
if /i "%ThemeSelection%" EQU "WWWG" (start http://www.youtube.com/watch?v=Rn0CnTo5kRI)&&(goto:WPAGE20)
if /i "%ThemeSelection%" EQU "WWWB" (start http://www.youtube.com/watch?v=oSMkswfXe_w)&&(goto:WPAGE20)
if /i "%ThemeSelection%" EQU "WWWO" (start http://www.youtube.com/watch?v=g66UasiFEhg)&&(goto:WPAGE20)
if /i "%ThemeSelection%" EQU "CE" goto:OptionCEwizard

if /i "%MENU1%" EQU "S" goto:forsneeknand
::if /i "%ThemeSelection%" EQU "B" goto:WPAGE19
if /i "%ThemeSelection%" EQU "R" goto:WPAGE21
if /i "%ThemeSelection%" EQU "G" goto:WPAGE21
if /i "%ThemeSelection%" EQU "BL" goto:WPAGE21
if /i "%ThemeSelection%" EQU "O" goto:WPAGE21
if /i "%ThemeSelection%" EQU "N" goto:WPAGE21

:forsneeknand
if /i "%MENU1%" NEQ "S" goto:quickskip
if /i "%ThemeSelection%" NEQ "B" goto:quickskip
if /i "%SNEEKTYPE:~0,1%" EQU "U" (goto:SNKPAGE4d) else (goto:SNKPAGE4b)
:quickskip

if /i "%ThemeSelection%" EQU "R" goto:WPAGE5
if /i "%ThemeSelection%" EQU "G" goto:WPAGE5
if /i "%ThemeSelection%" EQU "BL" goto:WPAGE5
if /i "%ThemeSelection%" EQU "O" goto:WPAGE5
if /i "%ThemeSelection%" EQU "N" goto:WPAGE5


if /i "%Advanced%" EQU "Y" goto:Back2PRI
if /i "%Advanced%" EQU "N" goto:Back2Advanced2
if /i "%MORE%" EQU "N" goto:Back2MORE2
if /i "%MORE%" EQU "A" goto:Back2MORE2
if /i "%REGION%" EQU "K" goto:Back2SHOP2
if /i "%MORE%" EQU "S" goto:Back2Speak2


:BACK2PRI
if /i "%ThemeSelection%" EQU "B" goto:WPAGE19

:BACK2ADVANCED2
if /i "%ThemeSelection%" EQU "B" goto:WPAGE13

:BACK2SPEAK2
if /i "%ThemeSelection%" EQU "B" goto:WPAGE12

:Back2SHOP2
if /i "%ThemeSelection%" EQU "B" goto:WPAGE11

:BACK2MORE2
if /i "%ThemeSelection%" EQU "B" goto:WPAGE5


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE20

:OptionCEwizard
if /i "%effect%" EQU "no-spin" (set effect=Spin) & (support\sfk filter Support\settings.bat -!"Set effect=" -write -yes>nul) & (echo Set effect=Spin>>Support\settings.bat) & (goto:WPAGE20)
if /i "%effect%" EQU "spin" (set effect=Fast-Spin) & (support\sfk filter Support\settings.bat -!"Set effect=" -write -yes>nul) & (echo Set effect=Fast-Spin>>Support\settings.bat) & (goto:WPAGE20)
if /i "%effect%" EQU "fast-spin" (set effect=No-Spin) & (support\sfk filter Support\settings.bat -!"Set effect=" -write -yes>nul) & (echo Set effect=No-Spin>>Support\settings.bat) & (goto:WPAGE20)

::...................................Wizard Page21 - Theme Selection...............................
:WPAGE21
set USBGUIDE=

cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Te gustaria crear un USB-Loader ahora?
echo.
echo.
echo      Notas
echo      =====
echo.
echo      * Un USB-Loader permite a la Wii jugar a juegos de un disco duro externo.
echo.
echo      * Este paso siempre se puede hacer por si mismo mas tarde desde
echo        el menu principal de ModMii.
echo.
echo.
echo.
echo.
echo.
echo                Y = Si
echo                N = No
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p USBGUIDE=     Escriba su seleccion aqui: 

if /i "%USBGUIDE%" EQU "M" goto:MENU

if /i "%USBGUIDE%" EQU "B" goto:WPAGE20
if /i "%USBGUIDE%" EQU "Y" goto:UPAGE1
if /i "%USBGUIDE%" EQU "N" goto:WPAGELAST

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGE21


::...................................Wizard Last Page - Confirmation...............................
:WPAGELAST

set WLAST=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Son estos los ajustes correctos?
echo.
echo.
echo.
if /i "%VIRGIN%" EQU "Y" echo           * Instalar y\o actualizar todos los softmods recomendados
if /i "%FIRMSTART%" NEQ "o" echo           * Firmware actual es %FIRMSTART%%REGION%
if /i "%FIRMSTART%" EQU "o" echo           * Firmware actual es menor que 2.2%REGION%

echo           * Firmware deseado %FIRM%%REGION%

echo.
if /i "%PIC%" EQU "Y" echo           * Instalar el Canal Fotos
if /i "%NET%" EQU "Y" echo           * Instalar el Canal Internet
if /i "%WEATHER%" EQU "Y" echo           * Instalar el canal tiempo
if /i "%NEWS%" EQU "Y" echo           * Instalar el canal noticias
if /i "%MIIQ%" EQU "Y" echo           * Instalar el Canal Mii
if /i "%Shop%" EQU "Y" echo           * Instalar el canal Tienda (y IOS56)
if /i "%Speak%" EQU "Y" echo           * Instalar el Canal Wii Speak
echo.

if /i "%HMInstaller%" EQU "Y" echo           * Instalar y\o actualizar el canal Homebrew y BootMii


if /i "%RECCIOS%" NEQ "Y" goto:smallskip
if /i "%CMIOSOPTION%" EQU "on" (echo           * Instalacion y\o actualizacion recomendada de cIOSs y cMIOS) else (echo           * Instalar y\o actualizar CIOSs recomendados)
:smallskip

if /i "%yawmQ%" EQU "Y" echo           * Descargar Wad Manager Mod (YAWMM)
if /i "%IOS236InstallerQ%" EQU "Y" echo           * Instalar IOS236


if /i "%PRIQ%" EQU "Y" echo           * Instalar y\o actualizar Priiloader

if /i "%ThemeSelection%" EQU "R" echo           * Instalar Tema Dark Wii Rojo
if /i "%ThemeSelection%" EQU "G" echo           * Instalar Tema Dark Wii Verde
if /i "%ThemeSelection%" EQU "BL" echo           * Instalar Tema Dark Wii Azul
if /i "%ThemeSelection%" EQU "O" echo           * Instalar Tema Dark Wii Naranja
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
echo           * Disco duro externo a de tener el formato %FORMATNAME%
goto:skip2
:skip
echo           * Disco duro externo con formato ya esta como %FORMATNAME%
:skip2

if /i "%LOADER%" EQU "CFG" echo           * Descargar Configurable USB-Loader
if /i "%LOADER%" EQU "FLOW" echo           * Descargar WiiFlow
if /i "%LOADER%" EQU "ALL" echo           * Descargar Configurable USB-Loader y WiiFlow
if /i "%USBCONFIG%" EQU "USB" echo           * USB-Loader Configuracion y los archivos de configuracion para
if /i "%USBCONFIG%" EQU "USB" echo             guardar en el disco duro USB
if /i "%USBCONFIG%" NEQ "USB" echo           * USB-Loader configuracion y los archivos de configuracion para
if /i "%USBCONFIG%" NEQ "USB" echo             guardar en la tarjeta SD


:skipusb


echo.
echo.
echo.
if /i "%LoadWizSettings%" EQU "Y" goto:skip
echo                S = Guardar configuracion del Asistente para el uso futuro
if exist Wizard_Settings.bat echo                    Existing Wizard_Settings.bat will be renamed
echo.
:skip
echo                Y = Si
echo                N = No \ Menu Principal
echo.
echo                B = Atras
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p WLAST=     Escriba su seleccion aqui: 

if /i "%LoadWizSettings%" EQU "Y" goto:skip
if /i "%WLAST%" EQU "S" goto:SaveWizardSettings
:skip
if /i "%WLAST%" EQU "Y" set BACKB4DRIVE=WPAGELAST
if /i "%WLAST%" EQU "Y" goto:DriveChange
if /i "%WLAST%" EQU "N" goto:Menu
if /i "%WLAST%" EQU "M" goto:MENU
if /i "%Advanced%" EQU "N" goto:Back2Advanced
if /i "%Advanced%" EQU "Y" goto:Back2USB
if /i "%MORE%" EQU "N" goto:Back2USB
if /i "%MORE%" EQU "S" goto:Back2USB
if /i "%USBGUIDE%" EQU "Y" goto:backtoUpage2

:BACK2ADVANCED
if /i "%WLAST%" EQU "B" goto:WPAGE13

:BACK2SPEAK
if /i "%WLAST%" EQU "B" goto:WPAGE12

:Back2USB
if /i "%WLAST%" EQU "B" goto:WPAGE21

:backtoUpage2
if /i "%WLAST%" EQU "B" goto:UPAGE2

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WPAGELAST



::-------------Save Wizard Settings:-------------------
:SaveWizardSettings

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
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
echo set PIC=%PIC%>> Wizard_Settings.bat
echo set NET=%NET%>> Wizard_Settings.bat
echo set WEATHER=%WEATHER%>> Wizard_Settings.bat
echo set NEWS=%NEWS%>> Wizard_Settings.bat
echo set MIIQ=%MIIQ%>> Wizard_Settings.bat
echo set Shop=%Shop%>> Wizard_Settings.bat
echo set Speak=%Speak%>> Wizard_Settings.bat
echo set HMInstaller=%HMInstaller%>> Wizard_Settings.bat
echo set yawmQ=%yawmQ%>> Wizard_Settings.bat
echo set IOS236InstallerQ=%IOS236InstallerQ%>> Wizard_Settings.bat
echo set PRIQ=%PRIQ%>> Wizard_Settings.bat
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



if exist Wizard_Settings.bat echo                            Asistente de descarga de configuracion guardado.
@ping 127.0.0.1 -n 2 -w 1000> nul

goto:WPAGELAST

::...................................USB-Loader Setup Page1 - Format?...............................
:UPAGE1
set FORMAT=NONE
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo         Como le gustaria el formato de su disco duro externo?
echo.
support\sfk echo -spat \x20 \x20 \x20 [Green] 1 = FAT32 (RECOMENDEDADO)
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Green] Ventajas:[def] La Wii puede tener acceso a aplicaciones, juegos, tapas y
echo                  musica almacenados en FAT32 Ideal si no siempre cuentan con
echo                  una tarjeta SD para iniciar el USB-Loader Compatible con
echo                  Sneek/Triiforce Emulacion Nand.
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Contras:[def] No se puede almacenar archivos de mas de 4GBs. El limite no
echo                  se aplica a los juegos Wii, que puede dividirse en dos partes.
echo                  Esto probablemente no afectara a menos que la unidad tambien
echo                  se utilize para almacenar videos de alta definicion
echo.
echo        2 = NTFS
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Green] Contras:[def] No se puede almacenar archivos de mas de 4GBs. El limite no
echo                  se aplica a los juegos Wii, que puede dividirse en dos partes.
echo                  Esto probablemente no afectara a menos que la unidad tambien
echo                  se utilize para almacenar videos de alta definicion
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Contras:[def] La Wii no puede acceder a las aplicaciones almacenadas en NTFS,
echo                  necesita una tarjeta SD es necesario para ejecutar el USB-Loader
echo                  (o un Canal SM) Incompatible con SNEEK/Triiforce Nand Emulation.
echo.
echo        3 = Particionar parte como FAT32 y o tra parte como NTFS
echo.
echo                      Nota: Las unidades flash diminutas no se puede dividir
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Green] Ventajas:[def] Se puede acceder a aplicaciones de Wii en la particion FAT32
echo                  al mismo tiempo ser capaz de guardar archivos de mas de 4GBs en la
echo                  particion NTFS
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Contras:[def] Un poco mas de trabajo para la configuracion de las demas
echo.
echo        4 = Actualmente el formato de la Unidad es WBFS y no quiero cambiarlo
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Contras:[def] WBFS solo puede ser leido por la Wii y solo se utiliza para
echo                  almacenar los juegos de Wii
echo.
echo        5 = La unidad esta dividida en dos particiones FAT32/WBFS y no quiero
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Contras:[def] WBFS solo puede ser leido por la Wii y solo se utiliza para
echo                  almacenar los juegos de Wii
echo.
echo.
echo         B = Atras
echo.
echo         M = Menu Principal
echo.
set /p FORMAT=     Escriba su seleccion aqui: 

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

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:UPAGE1



::...................................USB-Loader Setup Page1b - Loader?...............................
:UPAGE1b
set LOADER=
set usbfolder=
set FLOW=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo         Que USB-Loader te gustaria usar?
echo.
echo.
echo.
support\sfk echo -spat \x20 \x20 \x20 [Green] 1 = Configurable USB-Loader (RECOMENDADO)
echo.
echo.
echo        2 = WiiFlow
echo.
echo.
echo        3 = Both
echo.
echo.
echo.
echo.
echo         B = Atras
echo.
echo         M = Menu Principal
echo.
echo.
echo.
set /p LOADER=     Escriba su seleccion aqui: 

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

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:UPAGE1b



::...................................USB-Loader Setup Page2 - Config on USB vs SD?...............................
:UPAGE2
set USBCONFIG=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Donde le gustaria guardar la aplicacion de USB-Loader, las cubiertas y
echo      los archivos de configuracion?
echo.
echo.
support\sfk echo -spat \x20 \x20 \x20 [Green] USB = USB (RECOMENDADO)[def] (guardar los archivos en "COPY_TO_USB")
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Green] Pros:[def] SD Card not required to launch USB-Loader
echo                  USB-Loader files take up a small %% of USB Hard Drive free space
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Contras:[def] Carga un poco mas lento el tiempo (casi insignificante)
echo.
echo.
echo.
echo         SD = SD (Guardar los archivos en "%DRIVE%")
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Green] ventajas:[def] Carga un poco mas rapido el tiempo (casi insignificante)
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Contras:[def] No se puede iniciar el USB-Loader, sin la tarjeta SD
echo                  USB-Loader archivos pueden ocupar una gran %% de espacio libre
echo.
echo.
echo.
echo.
echo         B = Atras
echo.
echo         M = Menu Principal
echo.
echo.
echo.
echo.
set /p USBCONFIG=     Escriba su seleccion aqui: 

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


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:UPAGE2



::...................................SNEEK Page1 - SNEEK SELECT...............................
:SNKPAGE1
set SNEEKSELECT=
set SNKS2U=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo         Cual de las siguientes acciones Sneek te gustaria que realizara?
echo.
echo.
echo.
echo                1 = Instalacion SNEEK
echo.
echo                2 = Emular NAND Builder (para SNEEK)
echo.
echo                3 = Todo lo anterior (Recomendado para la primera vez
echo                    Sneek para los usuarios)
echo.
echo.
echo                4 = Juego Extractor masivo (para SNEEK)
echo                    * Los formatos soportados incluyen ISO, CISO y archivos WBFS
echo.
echo.
echo.
echo   Requisitos:
echo.
echo         * Tu Wii debe tener BootMii instalado para ejecutar Sneek. Si
echo           no lo han instalado, ejecutar el Asistente de descarga de ModMii.
echo.
echo         * Para optimizar la velocidad de su SNEEK o SNEEK+DI emulado NAND,
echo           la tarjeta SD debe estar formateada de 64 KB por sector.
echo.
echo         * UNEEK y UNEEK+DI requieren el disco duro externo formateado
echo           como FAT32 de 32k por cluster o menos. Si usted no sabe como
echo           formatear el disco duro de esta manera, ejecutar USB-Loader ModMii
echo           de la instalacion.
echo.
echo         * SNEEK+DI y UNEEK+DI siempre utiliza la particion primera, si se
echo           encuentran multiples.
echo.
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 [Red] ADVERTENCIA: SNEEK no es directamente compatible con ModMii.
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 [Red] Cualquier problema que tenga con SNEEK no es un resultado directo
support\sfk echo -spat \x20 \x20 \x20 \x20 [Red] de ModMii debe informarse aqui: http://code.google.com/p/sneek/
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 [Red] Este es tambien un gran lugar para aprender mas acerca de SNEEK en general.
support\sfk echo -spat \x20 \x20 \x20 \x20 [Red] Otro gran recurso es la guia la encontraras aqui: tinyurl.com/SNEEK-DI
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p SNEEKSELECT=     Escriba su seleccion aqui: 

if /i "%SNEEKSELECT%" EQU "B" goto:MENU
if /i "%SNEEKSELECT%" EQU "M" goto:MENU
if /i "%SNEEKSELECT%" EQU "1" goto:SNKPAGE2
if /i "%SNEEKSELECT%" EQU "2" goto:SNKPAGE2
if /i "%SNEEKSELECT%" EQU "3" goto:SNKPAGE2
if /i "%SNEEKSELECT%" EQU "4" goto:SNKDISCEX

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE1



::...................................SNEEK Page2 - SNEEK TYPE...............................
:SNKPAGE2
set SNEEKTYPE=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if /i "%SNEEKSELECT%" NEQ "2" echo                  Que tipo de SNEEK quieres instalar?
if /i "%SNEEKSELECT%" EQU "2" echo      Que tipo de SNEEK le gustaria crear una NAND para emular?
echo.
if /i "%SNEEKSELECT%" NEQ "1" echo   NOTA: NANDS construido para cualquier tipo de trabajo SNEEK con cualquier otro
if /i "%SNEEKSELECT%" NEQ "1" echo         tipo de SNEEK, excepto UNEEK+DI y SNEEK+DI Que requieren 4.2U/E o 4.3U/E
if /i "%SNEEKSELECT%" NEQ "1" echo         emulador NANDS. Sin embargo, cualquier region Wii puede utilizar cualquier
if /i "%SNEEKSELECT%" NEQ "1" echo         region emulada NAND
if /i "%SNEEKSELECT%" NEQ "1" echo.
if /i "%SNEEKSELECT%" NEQ "1" echo   USUARIOS AVANZADOS: Si usted se va a compilar Sneek+DI/Uneek+DI con trucos para
if /i "%SNEEKSELECT%" NEQ "1" echo         apoyar los Menus de Sistema es otro de los mencionados en la nota anterior,
if /i "%SNEEKSELECT%" NEQ "1" echo         puede seleccionar "S" o "U" para desbloquear mas opciones de creacion de NAND
echo.
echo      UD = UNEEK+DI
echo           * Emulador Wii NAND/el disco duro externo esta en FAT32
echo           * Carga juegos de Wii de tu disco duro externo FAT32
echo           * carga las aplicaciones desde la tarjeta SD con el Canal Homebrew
echo           * DVD-Drive esta desactivado el acceso a juegos durante la ejecucion de
echo             Uneek+DI pero puede ser utilizado en las aplicaciones (ejem. WiiXplorer)
echo           * Solo funciona con 4.2U/E y 4.3E nands emulado
echo.
echo      SD = SNEEK+DI
echo           * Emulador Wii NAND/en la memoria de la tarjeta SD
echo           * Carga juegos de Wii de tu disco duro externo FAT32
echo           * Carga juegos de GameCube de tu tarjeta SD usando DML
echo           * Carga las aplicaciones desde un disco duro FAT32 USB desde Homebrew
echo           * DVD-Drive desactivado el acceso a juegos cuando se ejecuta con SNEEK+DI
echo             pero puede ser utilizado en las aplicaciones (ejemplo, WiiXplorer)
echo           * Solo funciona con 4.2U/E y 4.3E emulacidores NANDS
echo.
echo       U = UNEEK
echo           * Emular Wii NAND/el disco duro externo esta en FAT32
echo           * No se puede cargar cualquier juego de su disco duro
echo           * Carga aplicaciones desde una tarjeta SD a traves del Homebrew
echo           * DVD-Drive acceso habilitado
echo           * Carga del disco de copia de seguridad requiere DarkCorp instalado
echo             en emulador NAND (Las nuevas Wii tiene un DVD-Drive que impide Carga del
echo             disco de copia de seguridad)
echo.
echo       S = SNEEK
echo           * Emular Wii NAND/en la memoria de la tarjeta SD
::echo           * Puede cargar solo un juego desde tu disco duro externo FAT32
echo           * No se puede cargar cualquier juego de su disco duro
echo           * Cargar las aplicaciones desde un disco duro USB FAT32 con Homebrew
echo           * DVD-Drive acceso habilitado
echo           * Carga del disco de copia de seguridad requiere DarkCorp instalado en
echo             emulador NAND (Las nuevas Wii tiene un DVD-Drive que impide la Carga del
echo             disco de copia de seguridad)
echo.
echo       B = Atras
echo.
echo       M = Menu Principal
echo.
set /p SNEEKTYPE=     Escriba su seleccion aqui: 

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

echo Ha introducido una clave incorrecta
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
echo                                       by XFlak
echo.
echo.
echo                                  CREADOR SNEEK NAND
echo.
echo.
echo         En que region quieres tu NAND emulada?
echo.
echo.
echo         Nota: SNEEK+DI y UNEEK+DI funciona solo con 4.2U/E o 4.3U/E emulador NANDS.
echo               Sin embargo, cualquier region Wii puede utilizar cualquier
echo               region de emulador NAND.
echo.
echo.
echo         Nota: Si desea que su wiimotes ser sincronizado a tu NAND real
echo               y su NAND emulada al mismo tiempo, entonces usted debe elegir
echo               la region real de tu Wii
echo               (ademas de utilizar el setting.txt para Wii)
echo.
echo.

echo.
echo                U = USA
echo                E = Euro (PAL)
if /i "%DITYPE%" EQU "off" echo                J = JAP
if /i "%DITYPE%" EQU "off" echo                K = coreano
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p REGION=     Escriba su seleccion aqui: 


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

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE3






::...................................SNEEK Page4 - SNEEK VERSION...............................
:SNKPAGE4
set SNKVERSION=


::If region is USA and building NAND for DI, force 4.2 and go to next page
::if /i "%DITYPE%" EQU "OFF" goto:skip
::if /i "%REGION%" EQU "U" set SNKVERSION=4.2
::if /i "%REGION%" EQU "U" goto:SNKPAGE5
:::skip


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  SNEEK CREADOR NAND
echo.
echo.
echo         Que version de firmware le gustaria que su SNEEK emulador NAND creara?
echo.
echo.
echo         Nota: SNEEK+DI y UNEEK+DI trabaja solo con 4.2U/E o 4.3U/E NANDS emulada.
echo               Sin embargo, cualquier region Wii puede utilizar cualquier
echo               region NAND emulada.
echo.
if /i "%DITYPE%" EQU "OFF" goto:skip
if /i "%REGION%" EQU "U" support\sfk echo -spat \x20 \x20 [Red] advertencia:[def] 4.3U especificamente NO han trucos Region Free activado por defecto.
if /i "%REGION%" EQU "U" echo               Esto solo se aplica a WiiWare/VC Juegos (Canales aqui), 
if /i "%REGION%" EQU "U" echo               el menu de DI/juego todavia puede jugar a juegos Wii de todas las regiones.
:skip
echo.
echo.
echo.
echo                4.3 = 4.3
echo                4.2 = 4.2
::anything under 4.2 is not an option for NANDs for DI
if /i "%DITYPE%" EQU "ON" goto:skip
echo                4.1 = 4.1
:skip
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p SNKVERSION=     Escriba su seleccion aqui: 


if /i "%SNKVERSION%" EQU "M" goto:MENU
if /i "%SNKVERSION%" EQU "B" goto:SNKPAGE3



if /i "%SNKVERSION%" EQU "4.3" goto:SNKPAGE4a
if /i "%SNKVERSION%" EQU "4.2" goto:SNKPAGE4a

if /i "%SNEEKTYPE%" EQU "SD" goto:skip
if /i "%SNEEKTYPE%" EQU "UD" goto:skip
if /i "%SNKVERSION%" EQU "4.1" goto:SNKPAGE4a
:skip

echo Ha introducido una clave incorrecta
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
echo                                  CREADOR SNEEK NAND
echo.
echo.
echo         Quieres el Homebrew Channel Filter en la NAND emulada?
echo.
echo.
echo         Al igual que el Canal Homebrew, el Homebrew Channel filtro es capaz de
echo         lanzar homebrew desde una tarjeta SD o disco duro FAT32.
echo.
echo         No es posible instalar la ultima version del Homebrew Channel
echo         para NANDS emuladas y el filtro de Homebrew es una gran alternativa.
echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Si
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p SNKHBF=     Escriba su seleccion aqui: 


if /i "%SNKHBF%" EQU "B" goto:SNKPAGE4
if /i "%SNKHBF%" EQU "M" goto:MENU
if /i "%SNKHBF%" EQU "Y" goto:SNKPAGE4a2
if /i "%SNKHBF%" EQU "N" goto:SNKPAGE4a2


echo Ha introducido una clave incorrecta
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
echo                                  CREADOR SNEEK NAND
echo.
echo.
echo         Te gustaria instalar cIOS249 rev14 a su NAND emulada?
echo.
echo.
echo         Algunas aplicaciones que requieren un cIOS solo funcionara con s\Uneek
echo         con cIOS rev14.
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
echo                Y = Si
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p SNKCIOS=     Escriba su seleccion aqui: 


if /i "%SNKCIOS%" EQU "B" goto:SNKPAGE4a
if /i "%SNKCIOS%" EQU "M" goto:MENU
if /i "%SNKCIOS%" EQU "Y" goto:SNKPAGE4a3
if /i "%SNKCIOS%" EQU "N" goto:SNKPAGE4a3


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4a2


::...................................SNEEK Page4a3 - cBC...............................
:SNKPAGE4a3

set SNKcBC=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  CREADOR SNEEK NAND
echo.
echo.

if /i "%SNEEKTYPE%" EQU "SD" (echo         Quieres DML o NMM en su NAND emulada?) else (echo         Quieres NMM en su NAND emulada?)
echo.
echo.

if /i "%SNEEKTYPE%" EQU "SD" echo         DML (Dios Mios Lite) es una herramienta que le permite ejecutar
if /i "%SNEEKTYPE%" EQU "SD" echo         juegos de Gamecube desde una tarjeta SD. La compatibilidad no
if /i "%SNEEKTYPE%" EQU "SD" echo         es 100% y solo funciona con SNEEK+DI.
if /i "%SNEEKTYPE%" EQU "SD" echo.
if /i "%SNEEKTYPE%" EQU "SD" echo.

echo         NMM (tarjeta de memoria, vacia) redirige todas las memorias
echo         el acceso de GameCube a la tarjeta SD. Esto permite
echo         guardar\bajando el juego de GameCube guarda sin una tarjeta
echo         de memoria GC.
echo.
echo.
if /i "%SNEEKTYPE%" EQU "SD" echo         Nota: NMM y DML no pueden estar instalados al mismo tiempo
echo.
echo.
echo.
echo.

if /i "%SNEEKTYPE%" EQU "SD" echo              DML = DML
if /i "%SNEEKTYPE%" EQU "SD" echo.
if /i "%SNEEKTYPE%" EQU "SD" (echo              NMM = NMM) else (echo                Y = Si)
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p SNKcBC=     Escriba su seleccion aqui: 


if /i "%SNKcBC%" EQU "B" goto:SNKPAGE4a2
if /i "%SNKcBC%" EQU "M" goto:MENU
if /i "%SNKcBC%" EQU "N" goto:SNKPAGE4b

if /i "%SNEEKTYPE%" EQU "SD" goto:skip
if /i "%SNKcBC%" EQU "Y" (set SNKcBC=NMM) & (goto:SNKPAGE4b)
:skip

if /i "%SNEEKTYPE%" NEQ "SD" goto:skip
if /i "%SNKcBC%" EQU "NMM" goto:SNKPAGE4b
if /i "%SNKcBC%" EQU "DML" goto:SNKPAGE4b
:skip

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4a3

::...................................SNEEK Page4b - Priiloader For SNEEK...............................
:SNKPAGE4b

set SNKPRI=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  CREADOR SNEEK NAND
echo.
echo.
echo         Quieres Priiloader v0.4 y hacks.ini en su NAND emulada?
echo.
echo         Hacer esto le permitira activar trucos en su menu de sistema NAND emulada.
echo         Tambien permitira a las aplicaciones autobooting sneek con su eleccion
echo         (es decir, JoyFlow).
echo.
echo.

echo         Nota: para acceder a Priiloader en su NAND emulador, Reset al igual que
echo               la NAND emulador se esta iniciando.
echo.
echo.

support\sfk echo -spat \x20 \x20 [Red] ADVERTENCIA: En algunos casos puede que tenga unos 10 segundos para salir
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]de Priiloader (en su emulador NAND) antes de que deje de responder.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]Usted tendra que guardar la configuracion Priiloader rapidamente
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]puede hacer varios intentos para guardar todas sus configuraciones
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]a la vez.

echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]Uno de los metodos de acceso a Priiloader (en su NAND emulada) sin
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]limite de tiempo de 10 segundos de forma rapida cambie "volver a"
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]ajustes para "Priiloader. A continuacion, inicie el menu del sistema
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]emulador, cuando estes, entonces seleccionar el menu de Wii. Que le
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]llevara a Priiloader (en su emulador NAND) sin pasar el limite de
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]10 segundos por segunda vez. Cuando haya terminado con Priiloader
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]puede cambiar el "retorno a la configuracion.


echo.
echo.
echo.
echo.
echo                Y = Si
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p SNKPRI=     Escriba su seleccion aqui: 


if /i "%SNKPRI%" EQU "B" goto:SNKPAGE4a3
if /i "%SNKPRI%" EQU "M" goto:MENU
if /i "%SNKPRI%" EQU "Y" goto:SNKPAGE4c
if /i "%SNKPRI%" EQU "N" goto:SNKPAGE4c


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4b



::...................................SNEEK Page4c - JoyFlow...............................
:SNKPAGE4c

set SNKJOY=

::skip this page if sneektype not uneek or uneek+di
if /i "%SNEEKTYPE:~0,1%" EQU "S" (set SNKJOY=N) & (goto:SNKPAGE4d)


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  CREADOR SNEEK NAND
echo.
echo.
echo         Quieres un canal Forwarder JoyFlow en su NAND emulada?
echo.
echo.

if /i "%SNKPRI%" EQU "Y" echo         Nota: JoyFlow Forwarder dol tambien se agregara como priiloader de
if /i "%SNKPRI%" EQU "Y" echo               archivo instalado. Configuracion Priiloader de autoboot todavia
if /i "%SNKPRI%" EQU "Y" echo               tendra que ser cambiado si desea que su NAND emulador a autoboot
if /i "%SNKPRI%" EQU "Y" echo               the installed file.
if /i "%SNKPRI%" EQU "Y" echo.
if /i "%SNKPRI%" EQU "Y" echo.

echo         *JoyFlow es USB-Loader para UNEEK+DI que es visualmente atractivo
echo          alternativa a la carga de los juegos de Wii\canales a traves del menu del sistema emulado
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Si
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p SNKJOY=     Escriba su seleccion aqui: 


if /i "%SNKJOY%" EQU "B" goto:SNKPAGE4b
if /i "%SNKJOY%" EQU "M" goto:MENU
if /i "%SNKJOY%" EQU "Y" goto:SNKPAGE4d
if /i "%SNKJOY%" EQU "N" goto:SNKPAGE4d


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4c



::...................................SNEEK Page4d - Switch2UNEEK...............................
:SNKPAGE4d

set SNKS2U=

::skip this page if sneektype not uneek or uneek+di
if /i "%SNEEKTYPE:~0,1%" EQU "S" (set SNKS2U=N) & (goto:SNKPAGE5)


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  CREADOR SNEEK NAND
echo.
echo.
echo         Quieres usar Switch2Uneek?
echo.
echo.
echo         Switch2Uneek es una utilidad para ayudar a cambiar facilmente entre
echo         la emulada UNEEK NAND emulada y su NAND Real.
echo.
echo.
echo         Si su respuesta es "Y", debe acceder a Uneek lanzando switch2uneek
echo         desde el Homebrew Channel. Alternativamente, puede usarlo para
echo         instalar el MMM el canal forwarder switch2uneek que se guardan
echo         en la tarjeta SD.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                Y = Si
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p SNKS2U=     Escriba su seleccion aqui: 


if /i "%SNKS2U%" EQU "B" goto:SNKPAGE4c
if /i "%SNKS2U%" EQU "M" goto:MENU
if /i "%SNKS2U%" EQU "Y" goto:SNKPAGE5
if /i "%SNKS2U%" EQU "N" goto:SNKPAGE5


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKPAGE4d


::...................................SNEEK Page4 - SNEEK SERIAL...............................
:SNKPAGE5

if /i "%SNEEKTYPE:~0,1%" EQU "S" set nandpath=%DRIVE%
if /i "%SNEEKTYPE:~0,1%" EQU "U" set nandpath=%DRIVEU%

if /i "%SNKS2U%" EQU "N" goto:quickskip
SET NANDcount=0
:NANDname
SET /a NANDcount=%NANDcount%+1
if not exist "%nandpath%\nands\nand%NANDcount%" (set nandpath=%nandpath%\nands\nand%NANDcount%) & goto:quickskip
goto:NANDname
:quickskip

set nandexist=no
if exist "%nandpath%"\title set nandexist=yes
if exist "%nandpath%"\ticket set nandexist=yes
if exist "%nandpath%"\sys set nandexist=yes
if exist "%nandpath%"\shared1 set nandexist=yes

::next page
goto:WPAGE20







::...................................SNEEK Nand Builder Confirmation...............................
:SNKNANDCONFIRM
set SNKNANDCONFIRM=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if /i "%SNEEKSELECT%" NEQ "3" goto:notalsoinstalling
if /i "%SNEEKTYPE%" EQU "SD" echo         Usted esta a punto de instalar SNEEK+DI y crear una %SNKVERSION%%REGION% Emulado de Nand
if /i "%SNEEKTYPE%" EQU "UD" echo         Usted esta a punto de instalar UNEEK+DI y crear una %SNKVERSION%%REGION% Emulado de Nand
if /i "%SNEEKTYPE%" EQU "S" echo         Usted esta a punto de instalar SNEEK+DI y crear una %SNKVERSION%%REGION% Emulado de Nand
if /i "%SNEEKTYPE%" EQU "U" echo         Usted esta a punto de instalar UNEEK+DI y crear una %SNKVERSION%%REGION% Emulado de Nand
goto:skip

:notalsoinstalling

if /i "%SNEEKSELECT%" EQU "2" echo         Usted esta a punto de crear una %SNKVERSION%%REGION% Emulacion Nand

if /i "%SNEEKSELECT%" NEQ "1" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" echo         Usted esta a punto de crear SNEEK+DI
if /i "%SNEEKTYPE%" EQU "UD" echo         Usted esta a punto de crear UNEEK+DI
if /i "%SNEEKTYPE%" EQU "U" echo         Usted esta a punto de crear UNEEK
if /i "%SNEEKTYPE%" EQU "S" echo         Usted esta a punto de crear SNEEK
echo.
echo.
echo.
echo.
goto:nonandinstallation

:skip

if not exist temp\WAD mkdir temp\WAD

echo.
echo.
echo    instalar Wads desde: temp\WAD\
echo     a NAND emulada: %nandpath%\
echo.
IF not "%addwadfolder%"=="" echo    Instale Wads de la carpeta personalizada: %addwadfolder%\
IF "%addwadfolder%"=="" (echo    A = A�adir carpeta personalizada de Wads para la instalaci�n en la NAND emulada) else (echo    R = Eliminar carpeta personalizada de Wads de la NAND emulada)
echo.
echo.




if /i "%SNKHBF%" EQU "Y" echo           * Instalar Homebrew Filter Channel
if /i "%SNKHBF%" EQU "Y" echo.

if /i "%SNKCIOS%" EQU "Y" echo           * Instalar cIOS249 rev14
if /i "%SNKCIOS%" EQU "Y" echo.


if /i "%SNKcBC%" EQU "NMM" echo           * Instalar NMM (No More Memory-Cards)
if /i "%SNKcBC%" EQU "NMM" echo.

if /i "%SNKcBC%" EQU "DML" echo           * Instalar DML (Dios Mios Lite)
if /i "%SNKcBC%" EQU "DML" echo.

if /i "%SNKPRI%" EQU "Y" echo           * Instalar Priiloader v0.4
if /i "%SNKPRI%" EQU "Y" echo.

if /i "%SNKJOY%" EQU "Y" echo           * Instalar JoyFlow
if /i "%SNKJOY%" EQU "Y" echo.

if /i "%SNKS2U%" EQU "Y" echo           * Instalar Switch2Uneek
if /i "%SNKS2U%" EQU "Y" echo.

if /i "%ThemeSelection%" EQU "R" echo           * Instalar Tema Dark Wii Rojo
if /i "%ThemeSelection%" EQU "G" echo           * Instalar Tema Dark Wii Verde
if /i "%ThemeSelection%" EQU "BL" echo           * Instalar Tema Dark Wii Azul
if /i "%ThemeSelection%" EQU "O" echo           * Instalar Tema Dark Wii Naranja
if /i "%ThemeSelection%" NEQ "N" echo.

if /i "%PIC%" EQU "Y" echo           * Instalar Canal Fotos
if /i "%NET%" EQU "Y" echo           * Instalar Canal Internet
if /i "%WEATHER%" EQU "Y" echo           * Instalar Canal Tiempo
if /i "%NEWS%" EQU "Y" echo           * Instalar Canal Noticias
if /i "%MIIQ%" EQU "Y" echo           * Instalar Canal Mii
if /i "%Shop%" EQU "Y" echo           * Instalar Canal Tienda
if /i "%Speak%" EQU "Y" echo           * Instalar Canal Wii Speak
echo.
if /i "%nandexist%" EQU "yes" support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]ADVERTENCIA: Una nand emulada ya existe en:
if /i "%nandexist%" EQU "yes" echo                   %nandpath%
if /i "%nandexist%" EQU "yes" support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]Nand existente emulada sera eliminada\Sustituida
:nonandinstallation
echo.
echo                Y = Si, hazlo ahora!
echo.
echo                N = No
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
set /p SNKNANDCONFIRM=     Escriba su seleccion aqui: 


if /i "%SNKNANDCONFIRM%" EQU "B" goto:%B4SNKCONFIRM%
if /i "%SNKNANDCONFIRM%" EQU "M" goto:MENU
if /i "%SNKNANDCONFIRM%" EQU "N" goto:MENU



if /i "%SNEEKSELECT%" EQU "1" goto:skip
if /i "%SNKNANDCONFIRM%" EQU "A" goto:addwadfolder
if /i "%SNKNANDCONFIRM%" EQU "R" (set addwadfolder=) & (goto:SNKNANDCONFIRM)
if /i "%SNEEKSELECT%" EQU "3" goto:skip
if /i "%SNKNANDCONFIRM%" EQU "Y" goto:SNKNANDBUILDER
:skip
if /i "%SNKNANDCONFIRM%" EQU "Y" goto:SNEEKINSTALLER

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKNANDCONFIRM


::-----------------------------------Add WAD Folder to Install to emunand----------------------------------
:addwadfolder
set addwadfolder=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo    Introduzca la ruta completa\carpeta de WADs que le gustar�a instalar en su NAND emulada
echo.
echo.
echo                * Usted puede arrastrar y soltar la carpeta en esta
echo                  ventana para no tener que escribir manualmente
echo.
echo.
echo.
echo.
echo.
echo         B = Atras
echo.
echo         M = Menu Principal
echo.
echo.
set /p addwadfolder=     Escriba su seleccion aqui: 


::remove quotes from variable (if applicable)
echo "set addwadfolder=%addwadfolder%">temp.txt
support\sfk filter -quiet temp.txt -rep _""""__>temp.bat
call temp.bat
del temp.bat>nul
del temp.txt>nul


if /i "%addwadfolder%" EQU "M" (set addwadfolder=) & (goto:MENU)

if /i "%addwadfolder%" EQU "B" (set addwadfolder=) & (goto:SNKNANDCONFIRM)

:doublecheckwad
set fixslash=
if /i "%addwadfolder:~-1%" EQU "\" set fixslash=yes
if /i "%addwadfolder:~-1%" EQU "/" set fixslash=yes
if /i "%fixslash%" EQU "yes" set addwadfolder=%addwadfolder:~0,-1%
if /i "%fixslash%" EQU "yes" goto:doublecheckwad


if not exist "%addwadfolder%" (echo.) & (echo %addwadfolder% no existe, por favor, intentalo de nuevo...) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:addwadfolder)

::make sure second char is ":"
if /i "%addwadfolder:~1,1%" NEQ ":" (echo.) & (echo Introduzca la ruta completa incluyendo la letra de controlador, por favor vuelva a intentarlo...) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:addwadfolder)


goto:SNKNANDCONFIRM




::...................................SNEEK Nand Builder...............................
:SNKNANDBUILDER

::temporarily force wads to be saved to "root" of "temp" folder
::Set ROOTSAVE=on
::set DRIVE=temp//happens later

if not exist "%nandpath%" mkdir "%nandpath%"
::if not exist temp\WAD mkdir temp\WAD


::delete existing nand if exists
if exist "%nandpath%"\title echo.
if exist "%nandpath%"\title echo Deleting existing emulated nand...
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
echo Mover nand existentes para emulacion \nands\%NANDcountPLUS1% carpeta...

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

if /i "%ThemeSelection%" NEQ "BL" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set DarkWii_Blue_4.3U=*
if /i "%SNKVERSION%" EQU "4.2" set DarkWii_Blue_4.2U=*
if /i "%SNKVERSION%" EQU "4.1" set DarkWii_Blue_4.1U=*
goto:SKIPSM
:skip

if /i "%ThemeSelection%" NEQ "O" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set darkwii_orange_4.3U=*
if /i "%SNKVERSION%" EQU "4.2" set darkwii_orange_4.2U=*
if /i "%SNKVERSION%" EQU "4.1" set darkwii_orange_4.1U=*
goto:SKIPSM
:skip

:SKIPSM

::SMAPP is patched for UNEEK+DI Support
if /i "%SNKVERSION%" EQU "4.3" set SMAPP=00000098
if /i "%SNKVERSION%" EQU "4.2" set SMAPP=00000088
if /i "%SNKVERSION%" EQU "4.1" set SMAPP=0000007c
if /i "%PIC%" EQU "Y" (set P=*) & (set P0=*)
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

if /i "%ThemeSelection%" NEQ "BL" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set DarkWii_Blue_4.3E=*
if /i "%SNKVERSION%" EQU "4.2" set DarkWii_Blue_4.2E=*
if /i "%SNKVERSION%" EQU "4.1" set DarkWii_Blue_4.1E=*
goto:SKIPSM
:skip

if /i "%ThemeSelection%" NEQ "O" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set darkwii_orange_4.3E=*
if /i "%SNKVERSION%" EQU "4.2" set darkwii_orange_4.2E=*
if /i "%SNKVERSION%" EQU "4.1" set darkwii_orange_4.1E=*
goto:SKIPSM
:skip

:SKIPSM

if /i "%SNKVERSION%" EQU "4.3" set SMAPP=0000009b
if /i "%SNKVERSION%" EQU "4.2" set SMAPP=0000008b
if /i "%SNKVERSION%" EQU "4.1" set SMAPP=0000007f
if /i "%PIC%" EQU "Y" (set P=*) & (set P0=*)
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

if /i "%ThemeSelection%" NEQ "BL" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set DarkWii_Blue_4.3J=*
if /i "%SNKVERSION%" EQU "4.2" set DarkWii_Blue_4.2J=*
if /i "%SNKVERSION%" EQU "4.1" set DarkWii_Blue_4.1J=*
goto:SKIPSM
:skip

if /i "%ThemeSelection%" NEQ "O" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set darkwii_orange_4.3J=*
if /i "%SNKVERSION%" EQU "4.2" set darkwii_orange_4.2J=*
if /i "%SNKVERSION%" EQU "4.1" set darkwii_orange_4.1J=*
goto:SKIPSM
:skip

:SKIPSM

if /i "%SNKVERSION%" EQU "4.3" set SMAPP=00000095
if /i "%SNKVERSION%" EQU "4.2" set SMAPP=00000085
if /i "%SNKVERSION%" EQU "4.1" set SMAPP=00000079
if /i "%PIC%" EQU "Y" (set P=*) & (set P0=*)
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

if /i "%ThemeSelection%" NEQ "BL" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set DarkWii_Blue_4.3K=*
if /i "%SNKVERSION%" EQU "4.2" set DarkWii_Blue_4.2K=*
if /i "%SNKVERSION%" EQU "4.1" set DarkWii_Blue_4.1K=*
goto:SKIPSM
:skip

if /i "%ThemeSelection%" NEQ "O" goto:skip
if /i "%SNKVERSION%" EQU "4.3" set darkwii_orange_4.3K=*
if /i "%SNKVERSION%" EQU "4.2" set darkwii_orange_4.2K=*
if /i "%SNKVERSION%" EQU "4.1" set darkwii_orange_4.1K=*
goto:SKIPSM
:skip

:SKIPSM

if /i "%SNKVERSION%" EQU "4.3" set SMAPP=0000009e
if /i "%SNKVERSION%" EQU "4.2" set SMAPP=0000008e
if /i "%SNKVERSION%" EQU "4.1" set SMAPP=00000082
if /i "%PIC%" EQU "Y" (set PK=*) & (set P0=*)
if /i "%SHOP%" EQU "Y" set SK=*


:SNKBUGGEDSMIOS
if /i "%SNKVERSION%" EQU "4.1" set IOS60P=*
if /i "%SNKVERSION%" EQU "4.2" set IOS70K=*
if /i "%SNKVERSION%" EQU "4.3" set IOS80K=*



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

if /i "%SNKcBC%" EQU "NMM" set cBC=*
if /i "%SNKcBC%" EQU "DML" set DML=*
if /i "%SNKcBC%" EQU "N" set BC=*

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
support\sfk dec %SMAPP%>dec.txt

::Loop through the the following once for EACH line in whatever.txt
for /F "tokens=*" %%A in (dec.txt) do call :processdec %%A
goto:nextstep

:processdec
set dec=%*
goto:EOF
:nextstep

del dec.txt>nul
SET /a dec=%dec%-1
support\sfk hex %dec% -digits=8 >hex.txt

::Loop through the the following once for EACH line in whatever.txt
for /F "tokens=*" %%A in (hex.txt) do call :processhex %%A
goto:nextstep

:processhex
::this is repeated for each line of the txt.file
::"%*" (no quotes) is the variable for each line as it passes through the loop
set SMTHEMEAPP=%*
goto:EOF
:nextstep

del hex.txt>nul

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

if exist gametotal.txt del gametotal.txt>nul

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  JUEGO EXTRACTOR A GRANEL
echo                                      (PARA SNEEK)
echo.
echo.
echo         Introduzca la ruta donde Wii o Gamecube se guardan
echo.
echo                * Subcarpetas tambien se exploran
echo                * Los formatos soportados incluyen ISO, CISO y archivos WBFS
echo.
echo.
echo    Configuracion actual:
echo.
echo         %ISOFOLDER%
echo.
echo.
echo         Notas: * Para continuar con la configuracion actual
echo                  deje en blanco la seleccion y pulsa enter.
echo.
echo                * Usted puede arrastrar y soltar la unidad/carpeta en esta
echo                  ventana para guardar y no tener que hacerlo manualmente
echo.
echo.
echo.
echo         EXEMPLOS
echo.
echo.
echo            L:
echo.
echo            %%userprofile%%\Desktop\WiiGames
echo                  Nota: %%userprofile%% acceso directo no funciona en Windows XP
echo.
echo            WiiGames\ISOs
echo                  Nota: Comprueba el WiiGames \ carpeta ISOs donde est� guardado ModMii
echo.
echo            C:\Users\XFlak\Desktop\New Folder
echo.
echo.
echo.
echo         B = Atras
echo.
echo         M = Menu Principal
echo.
echo.
set /p DRIVETEMP=     Escriba la seleccion aqui: 


::remove quotes from variable (if applicable)
echo "set DRIVETEMP=%DRIVETEMP%">temp.txt
support\sfk filter -quiet temp.txt -rep _""""__>temp.bat
call temp.bat
del temp.bat>nul
del temp.txt>nul

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
echo Escaneo directorio Juegos Wii...
::Support\wit list-l --unit GB --recurse "%DRIVETEMP%">gametotal.txt
Support\wit list-l --recurse "%DRIVETEMP%">gametotal.txt
copy /y gametotal.txt gametotal.bat >nul
support\sfk filter gametotal.bat -ls+Total -rep _"Total: "_"set gametotal="_ -rep _" discs*"__ -write -yes>nul
call gametotal.bat
del gametotal.bat>nul
if /i "%gametotal%" EQU "0" goto:notexistiso

set ISOFOLDER=%DRIVETEMP%
set BACKB4DRIVEU=SNKDISCEX
goto:DRIVEUCHANGE


:notexist
echo La carpeta seleccionada no existe
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKDISCEX

:notexistiso
del gamelist.txt>nul
echo La carpeta seleccionada no contiene los archivos ISO, CISO o WBFS
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SNKDISCEX


::...................................SNK DISC EXtractor2...............................
:SNKDISCEX2

echo.
echo Comprobando si existe suficiente espacio libre...

::wit beta--> isosize command
::wit isosize --unit bytes -r "%ISOFOLDER%"

::---get required MB-------
copy /y gametotal.txt gametotal.bat >nul
::support\sfk filter gametotal.bat -ls+Total -rep _*"~ "_"set MegaBytesRequired="_ -rep _" MB*"__ -write -yes>nul
support\sfk filter gametotal.bat -ls+Total -rep _*", "_"set MegaBytesRequired="_ -rep _" MiB*"__ -write -yes>nul
call gametotal.bat
del gametotal.bat>nul

if %MegaBytesRequired% GEQ 1000 (set units=GB) else (set units=MB)


::echo Descargar hy.exe
if exist temp\hy.exe goto:AlreadyinTemp
if not exist hypatia.zip start %ModMiimin%/wait support\wget -t 3 http://www.milletre.net/software/hypatia/hypatia.zip
if exist hypatia.zip support\7za e -aoa hypatia.zip -otemp hy.exe -r
if exist hypatia.zip del hypatia.zip>nul
:AlreadyinTemp



::---get approx required GB-------
cd temp
hy %MegaBytesRequired% 1024 />nul
::above command stores output in a "hy" file
cd..

move /y temp\hy gigabytesrequired.txt>nul
support\sfk filter gigabytesrequired.txt -rep _".*"__ -write -yes>nul

::Loop through the the following once for EACH line in whatever.txt
for /F "tokens=*" %%A in (gigabytesrequired.txt) do call :process %%A
goto:nextstep

:process
::this is repeated for each line of the txt.file
::"%*" (no quotes) is the variable for each line as it passes through the loop
set GigaBytesRequired=%*
goto:EOF
:nextstep

del gigabytesrequired.txt>nul


::---check for free space (not 100% accurate-will catch most cases without enough free space)---

if not exist "%DRIVEU%" mkdir "%DRIVEU%"
dir "%DRIVEU%">freespace.bat


support\sfk filter freespace.bat -+"bytes " -+"octets " -+"Directory " -!"Directory of" -!"Directory di" -rep _" byte"*__ -rep _" octets"*__ -rep _,__ -rep _.__ -rep _" "__ -rep _*")"_"set freespace="_ -rep _*"dirs"_"set freespace="_ -rep _*"Directory"_"set freespace="_ -write -yes>nul
support\sfk filter freespace.bat -spat -rep _\xff__ -write -yes>nul

::Italian-dir cmd: 14 Directory  546.480.881.664 byte disponibili

call freespace.bat
del freespace.bat>nul

::Math in batch doesn't work with large numbers
::SET /a freespaceKB=%freespace%/1024

cd temp
hy %freespace% 1048576 />nul
::above command stores output in a "hy" file
cd..
move /y temp\hy megabytes.txt>nul
support\sfk filter megabytes.txt -rep _".*"__ -write -yes>nul

::Loop through the the following once for EACH line in whatever.txt
for /F "tokens=*" %%A in (megabytes.txt) do call :process %%A
goto:nextstep

:process
::this is repeated for each line of the txt.file
::"%*" (no quotes) is the variable for each line as it passes through the loop
set freespaceMB=%*
goto:EOF
:nextstep

del megabytes.txt>nul

::echo MegaBytesRequired es %MegaBytesRequired%
::echo GigaBytesRequired es %GigaBytesRequired%
::echo El espacio libre total es de aproximadamente %freespaceMB% MB [%freespace% bytes]
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
echo                                       by XFlak
echo.
echo.
echo                                  GAME BULK EXTRACTOR
echo                                      (FOR SNEEK)
echo.
echo.
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20[Red]ADVERTENCIA: NO TIENE SUFICIENTE ESPACIO LIBRE
echo.
echo.
echo.
echo         Usted esta tratando de convertir %gametotal% Juegos Wii
echo.
echo     Desde la carpeta origen: %ISOFOLDER%
echo       A carpeta destino %DRIVEU%\juegos
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
if /i "%units%" EQU "GB" support\sfk echo -spat \x20 \x20 \x20 \x20[Red]"%DRIVEU%" requiere aprox. %GigaBytesRequired%GB de espacio libre
if /i "%units%" EQU "MB" support\sfk echo -spat \x20 \x20 \x20 \x20[Red]"%DRIVEU%" requiere %MegaBytesRequired%MB de espacio libre
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20[Red]Crear mas espacio libre o seleccionar una carpeta de origen mas diminuta y vuelva a intentarlo
echo.
echo.
echo.


echo                C = continuar de todos modos
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p continue=     Escriba la seleccion aqui: 

if /i "%continue%" EQU "M" del gametotal.txt>nul
if /i "%continue%" EQU "M" goto:MENU
if /i "%continue%" EQU "C" goto:DISCEXCONFIRM

echo Ha introducido una clave incorrecta
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
echo                                       by XFlak
echo.
echo.
echo                                  JUEGO EXTRACTOR A GRANEL
echo                                      (PARA SNEEK)
echo.
echo         Usted esta a punto de convertir el siguiente %gametotal% Juegos Wii
echo.
echo     Desde la carpeta origen: %ISOFOLDER%
echo       A carpeta destino: %DRIVEU%\games
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
echo     Desea continuar?
echo.
echo.
::echo       Notas: * Cada juego podra llevar aproximadamente 5-15 minutos para convertir
::echo.
::echo              * Asegurese de que tiene suficiente espacio libre en: %DRIVEU%
::echo                de lo contrario la extraccion producira un error al agotarse
echo                  el espacio libre
echo.
echo.
echo.
echo                Y = Si
echo.
echo                N = No
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p DISCEXCONFIRM=     Escriba la seleccion aqui: 


if /i "%DISCEXCONFIRM%" EQU "M" del gametotal.txt>nul
if /i "%DISCEXCONFIRM%" EQU "N" del gametotal.txt>nul
if /i "%DISCEXCONFIRM%" EQU "Y" del gametotal.txt>nul


if /i "%DISCEXCONFIRM%" EQU "M" goto:MENU
if /i "%DISCEXCONFIRM%" EQU "N" goto:MENU
if /i "%DISCEXCONFIRM%" EQU "Y" mode con cols=85 lines=54
if /i "%DISCEXCONFIRM%" EQU "Y" goto:DISCEXSTART
if /i "%DISCEXCONFIRM%" EQU "B" mode con cols=85 lines=54
if /i "%DISCEXCONFIRM%" EQU "B" goto:DRIVEUCHANGE

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DISCEXCONFIRM



::----------------Start WIT DISCEXTRACTION---------------
:DISCEXSTART
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                                  JUEGO EXTRACTOR A GRANEL
echo                                      (PARA SNEEK)
echo.
echo.
echo La actualizacion del juego Wii Titulo de bases de datos (titles.txt)
echo.
echo.

::if exist Support\titles.txt move /y Support\titles.txt Support\titles_old.txt >nul
start %ModMiimin%/wait support\wget -t 3 www.wiitdb.com/titles.txt
if exist titles.txt move /y titles.txt Support\titles.txt>nul



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
support\sfk filter temp.bat -rep _\_/_ -write -yes>nul
call temp.bat
del temp.bat>nul

::IMPORTANT NOTE: destination directory must use "/" and not "\"
::target directory, including "games" folder, is creating automatically with the following wit command

::Support\wit x --sneek --recurse "%ISOFOLDER%" "%DRIVEUfix%/games/%%14T [%%I]" --progress
::Support\wit x --sneek --recurse "%ISOFOLDER%" --DEST "%DRIVEUfix%/games/%%14T [%%I]" --progress

Support\wit x --neek --recurse "%ISOFOLDER%" --DEST "%DRIVEUfix%/games/%%I" --progress

::an empty cygdrive folder may be created previous directory, so delete it!
::cd ..
if exist cygdrive rd /s /q cygdrive
::cd /d %ModMiipath%


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
echo sort "Gamelist2.txt" redirect "Gamelist-sorted.txt">>"%DriveU%"\Game-List-Updater[ModMii].bat
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


support\sfk filter "%DriveU%"\Game-List-Updater[ModMii].bat -spat -rep _@@_%%_ -rep _"redirect"_">"_ -write -yes>nul
support\sfk filter -quiet support\titles.txt -spat -rep _,_;_ -rep _"  "_" "_ >%DriveU%\titles.txt


cd /d "%DriveU%\"
call "Game-List-Updater[ModMii].bat"
cd /d %ModMiipath%


echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20[Green]JUEGO DE EXTRACCION A GRANEL PARA COMPLETAR SNEEK
echo.
echo Una lista de sus juegos se pueden encontrar aqui: %DriveU%\Game-List[ModMii].csv
echo Para actualizar la lista en cualquier momento, ejecutar %DriveU%\Game-List-Updater[ModMii].bat
echo.
echo Pulse cualquier tecla para volver al menu principal.
pause>nul
goto:MENU


::........................................LIST / BATCH.......................................
:LIST
Set List=
cls
echo                                        ModMii                                v%currentversion%
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20[Red]PAGINA DESCARGA 1 [def]\x20 \x20 \x20 \x20 \x20 \x20 \x20by XFlak
echo.
echo      Elija agregar/quitar de las descargas (Seleccionadas marcadas con un *)
echo.
echo   D = Descargar seleccionados    1/2/3/4 = Paginas 1/2/3/4        M = Menu Principal
echo   C = Borrar Cola descarga       (blank) = ciclo de Paginas      DR = Menu Disco
echo.
support\sfk echo -spat \x20Elija Grupo: [Red](A)[def]ll, [Red](U)[def]SA, [Red](E)[def]URO, [Red](J)[def]AP, [Red](K)[def]OR, Activo [Red](I)[def]OSs, Extra [Red](PR)[def]oteccion

echo.
support\sfk echo -spat \x20 \x20 [Red] Menus de Sistema \x20 \x20 \x20 \x20 \x20 Non-Fakesigned IOSs\MIOS \x20 \x20 \x20 \x20 Otros WADs
echo.
echo   %SM3.2U% 3.2U = 3.2U SM             %IOS9% 9 = IOS9v1034         %RSU% RSU = Seleccione region v2(U)
echo   %SM4.1U% 4.1U = 4.1U SM	     %IOS12% 12 = IOS12v526         %RSE% RSE = Seleccione region v2(E)
echo   %SM4.2U% 4.2U = 4.2U SM	     %IOS13% 13 = IOS13v1032        %RSJ% RSJ = Seleccione region v2(J)
echo   %SM4.3U% 4.3U = 4.3U SM            %IOS14% 14 = IOS14v1032        %RSK% RSK = Seleccione region v2(K)
echo   %SM3.2E% 3.2E = 3.2E SM            %IOS15% 15 = IOS15v1032         %EULAU% EU = EULA v3(U)
echo   %SM4.1E% 4.1E = 4.1E SM            %IOS17% 17 = IOS17v1032         %EULAE% EE = EULA v3(E)
echo   %SM4.2E% 4.2E = 4.2E SM            %IOS21% 21 = IOS21v1039         %EULAJ% EJ = EULA v3(J)
echo   %SM4.3E% 4.3E = 4.3E SM            %IOS22% 22 = IOS22v1294         %EULAK% EK = EULA v3(K)
echo   %SM3.2J% 3.2J = 3.2J SM            %IOS28% 28 = IOS28v1807         %BC% BC = BC v6
echo   %SM4.1J% 4.1J = 4.1J SM          %IOS30% 30NP = IOS30v2576        %cBC% NMM = cBC-NMM
echo   %SM4.2J% 4.2J = 4.2J SM            %IOS31% 31 = IOS31v3608        %DML% DML = cBC-DML
echo   %SM4.3J% 4.3J = 4.3J SM            %IOS33% 33 = IOS33v3608

support\sfk echo -spat \x20 \x20 %SM4.1K% 4.1K = 4.1K SM \x20 \x20 \x20 \x20 \x20 \x20   %IOS34% 34 = IOS34v3608\x20 \x20 \x20 \x20 \x20 \x20[Red]Fakesigned IOSs

echo   %SM4.2K% 4.2K = 4.2K SM	     %IOS35% 35 = IOS35v3608         %IOS11P60% 11 = IOS11(IOS60P)
echo   %SM4.3K% 4.3K = 4.3K SM           %IOS36% 36a = IOS36v3351         %IOS20P60% 20 = IOS20(IOS60P)
echo                              %IOS36v3608% 36 = IOS36v3608         %IOS30P60% 30 = IOS30(IOS60P)
support\sfk echo -spat \x20 \x20 \x20 \x20 [Red] Canales[def]\x20 \x20 \x20 \x20 \x20 \x20 \x20 %IOS37% 37 = IOS37v5663 \x20 \x20 \x20 \x20%IOS30P% 30P = IOS30-Patched
echo     %P0% P0 = Foto (U/E/J/K)     %IOS38% 38 = IOS38v4124         %IOS40P60% 40 = IOS40(IOS60P)
echo      %P% P = Foto 1.1(U/E/J)    %IOS41% 41 = IOS41v3607         %IOS50P% 50 = IOS50(IOS60P)
echo     %PK% PK = Foto 1.1 (KOR)     %IOS43% 43 = IOS43v3607         %IOS52P% 52 = IOS52(IOS60P)
echo     %S% SH = Tienda (U/E/J)     %IOS45% 45 = IOS45v3607         %IOS60P% 60 = IOS60-Patched
echo     %SK% SK = Tienda (KOR)       %IOS46% 46 = IOS46v3607        %IOS70K% 70K = IOS70(IOS60P)
echo     %IU% IU = Internet (USA)     %IOS48v4124% 48 = IOS48v4124         %IOS70P% 70 = IOS70-Patched
echo     %IE% IE = Internet (EUR)     %IOS53% 53 = IOS53v5663        %IOS80K% 80K = IOS80(IOS60P)
echo     %IJ% IJ = Internet (JAP)     %IOS55% 55 = IOS55v5663         %IOS80P% 80 = IOS80-Patched
echo     %WU% WU = Tiempo (USA)	     %IOS56% 56 = IOS56v5662        %IOS236% 236 = IOS236(IOS36P)
echo     %WE% WE = Tiempo (EUR)       %IOS57% 57 = IOS57v5919

support\sfk echo -spat \x20 \x20 %WJ% WJ = Tiempo (JAP) \x20 \x20 \x20 \x20 %IOS58% 58 = IOS58v6176\x20 \x20 \x20 \x20 \x20 \x20[Red] (S)NEEK Archivos

echo     %NU% NU = Noticias (USA)   %IOS60% 60NP = IOS60v6174         
echo     %NE% NE = Noticias (EUR)     %IOS61% 61 = IOS61v5662         %A0e% 0e = 0e.app IOS80v6943
echo     %NJ% NJ = Noticias (JAP)   %IOS70% 70NP = IOS70v6687      %A0e_70% 0e_70 = 0e.app IOS70v6687
echo    %WSU% WSU = WiiSpeak(USA)    %IOS80% 80NP = IOS80v6944      %A0e_60% 0e_60 = 0e.app IOS60v6174
echo    %WSE% WSE = WiiSpeak(EUR)     %M10% M10 = MIOSv10            %A01% 01 = 01.app IOS80v6943
echo    %WSJ% WSJ = WiiSpeak(JAP)                            %A01_70% 01_70 = 01.app IOS70v6687
echo    %MII% Mii = Mii (RF)                                 %A01_60% 01_60 = 01.app IOS60v6174
echo                                                       %A0c% 0c = 0c.app MIOSv10
echo.
echo.
echo.
echo.
set /p LIST=     Escriba la seleccion aqui: 


if /i "%LIST%" EQU "M" goto:MENU
if /i "%LIST%" EQU "D" set loadorgo=go
if /i "%LIST%" EQU "D" set BACKB4QUEUE=LIST
if /i "%LIST%" EQU "D" goto:DOWNLOADQUEUE
if /i "%LIST%" EQU "DR" set BACKB4DRIVE=LIST
if /i "%LIST%" EQU "DR" goto:DRIVECHANGE
if /i "%LIST%" EQU "C" goto:CLEAR

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
if /i "%LIST%" EQU "P0" goto:SwitchP0
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
if /i "%LIST%" EQU "NMM" goto:SwitchcBC
if /i "%LIST%" EQU "DML" goto:SwitchDML
if /i "%LIST%" EQU "0e" goto:SwitchA0e
if /i "%LIST%" EQU "01" goto:switchA01
if /i "%LIST%" EQU "0e_70" goto:SwitchA0e_70
if /i "%LIST%" EQU "01_70" goto:switchA01_70
if /i "%LIST%" EQU "0e_60" goto:SwitchA0e_60
if /i "%LIST%" EQU "01_60" goto:switchA01_60
if /i "%LIST%" EQU "0c" goto:SwitchA0c

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:list

:Switch3.2U
if /i "%SM3.2U%" EQU "*" (set SM3.2U=) else (set SM3.2U=*)
goto:LIST

:Switch4.1U
if /i "%SM4.1U%" EQU "*" (set SM4.1U=) else (set SM4.1U=*)
goto:LIST

:Switch4.2U
if /i "%SM4.2U%" EQU "*" (set SM4.2U=) else (set SM4.2U=*)
goto:LIST

:Switch4.3U
if /i "%SM4.3U%" EQU "*" (set SM4.3U=) else (set SM4.3U=*)
goto:LIST

:Switch3.2E
if /i "%SM3.2E%" EQU "*" (set SM3.2E=) else (set SM3.2E=*)
goto:LIST

:Switch4.1E
if /i "%SM4.1E%" EQU "*" (set SM4.1E=) else (set SM4.1E=*)
goto:LIST

:Switch4.2E
if /i "%SM4.2E%" EQU "*" (set SM4.2E=) else (set SM4.2E=*)
goto:LIST

:Switch4.3E
if /i "%SM4.3E%" EQU "*" (set SM4.3E=) else (set SM4.3E=*)
goto:LIST

:Switch3.2J
if /i "%SM3.2J%" EQU "*" (set SM3.2J=) else (set SM3.2J=*)
goto:LIST

:Switch4.1J
if /i "%SM4.1J%" EQU "*" (set SM4.1J=) else (set SM4.1J=*)
goto:LIST

:Switch4.2J
if /i "%SM4.2J%" EQU "*" (set SM4.2J=) else (set SM4.2J=*)
goto:LIST

:Switch4.3J
if /i "%SM4.3J%" EQU "*" (set SM4.3J=) else (set SM4.3J=*)
goto:LIST

:Switch4.1K
if /i "%SM4.1K%" EQU "*" (set SM4.1K=) else (set SM4.1K=*)
goto:LIST

:Switch4.2K
if /i "%SM4.2K%" EQU "*" (set SM4.2K=) else (set SM4.2K=*)
goto:LIST

:Switch4.3K
if /i "%SM4.3K%" EQU "*" (set SM4.3K=) else (set SM4.3K=*)
goto:LIST

:SwitchMii
if /i "%Mii%" EQU "*" (set Mii=) else (set Mii=*)
goto:LIST

:SwitchP
if /i "%P%" EQU "*" (set P=) else (set P=*)
goto:LIST

:SwitchPK
if /i "%PK%" EQU "*" (set PK=) else (set PK=*)
goto:LIST

:SwitchP0
if /i "%P0%" EQU "*" (set P0=) else (set P0=*)
goto:LIST

:SwitchS
if /i "%S%" EQU "*" (set S=) else (set S=*)
goto:LIST

:SwitchSK
if /i "%SK%" EQU "*" (set SK=) else (set SK=*)
goto:LIST

:SwitchIU
if /i "%IU%" EQU "*" (set IU=) else (set IU=*)
goto:LIST

:SwitchIE
if /i "%IE%" EQU "*" (set IE=) else (set IE=*)
goto:LIST

:SwitchIJ
if /i "%IJ%" EQU "*" (set IJ=) else (set IJ=*)
goto:LIST

:SwitchWU
if /i "%WU%" EQU "*" (set WU=) else (set WU=*)
goto:LIST

:SwitchWE
if /i "%WE%" EQU "*" (set WE=) else (set WE=*)
goto:LIST

:SwitchWJ
if /i "%WJ%" EQU "*" (set WJ=) else (set WJ=*)
goto:LIST

:SwitchNU
if /i "%NU%" EQU "*" (set NU=) else (set NU=*)
goto:LIST

:SwitchNE
if /i "%NE%" EQU "*" (set NE=) else (set NE=*)
goto:LIST

:SwitchNJ
if /i "%NJ%" EQU "*" (set NJ=) else (set NJ=*)
goto:LIST

:SwitchWSU
if /i "%WSU%" EQU "*" (set WSU=) else (set WSU=*)
goto:LIST

:SwitchWSE
if /i "%WSE%" EQU "*" (set WSE=) else (set WSE=*)
goto:LIST

:SwitchWSJ
if /i "%WSJ%" EQU "*" (set WSJ=) else (set WSJ=*)
goto:LIST

:SwitchM10
if /i "%M10%" EQU "*" (set M10=) else (set M10=*)
goto:LIST

:Switch9
if /i "%IOS9%" EQU "*" (set IOS9=) else (set IOS9=*)
goto:LIST

:Switch12
if /i "%IOS12%" EQU "*" (set IOS12=) else (set IOS12=*)
goto:LIST

:Switch13
if /i "%IOS13%" EQU "*" (set IOS13=) else (set IOS13=*)
goto:LIST

:Switch14
if /i "%IOS14%" EQU "*" (set IOS14=) else (set IOS14=*)
goto:LIST

:Switch15
if /i "%IOS15%" EQU "*" (set IOS15=) else (set IOS15=*)
goto:LIST

:Switch17
if /i "%IOS17%" EQU "*" (set IOS17=) else (set IOS17=*)
goto:LIST

:Switch21
if /i "%IOS21%" EQU "*" (set IOS21=) else (set IOS21=*)
goto:LIST

:Switch22
if /i "%IOS22%" EQU "*" (set IOS22=) else (set IOS22=*)
goto:LIST

:Switch28
if /i "%IOS28%" EQU "*" (set IOS28=) else (set IOS28=*)
goto:LIST

:Switch40P60
if /i "%IOS40P60%" EQU "*" (set IOS40P60=) else (set IOS40P60=*)
goto:LIST

:Switch30P60
if /i "%IOS30P60%" EQU "*" (set IOS30P60=) else (set IOS30P60=*)
goto:LIST

:Switch30P
if /i "%IOS30P%" EQU "*" (set IOS30P=) else (set IOS30P=*)
goto:LIST

:Switch31
if /i "%IOS31%" EQU "*" (set IOS31=) else (set IOS31=*)
goto:LIST

:Switch33
if /i "%IOS33%" EQU "*" (set IOS33=) else (set IOS33=*)
goto:LIST

:Switch34
if /i "%IOS34%" EQU "*" (set IOS34=) else (set IOS34=*)
goto:LIST

:Switch35
if /i "%IOS35%" EQU "*" (set IOS35=) else (set IOS35=*)
goto:LIST

:Switch36
if /i "%IOS36%" EQU "*" (set IOS36=) else (set IOS36=*)
goto:LIST

:Switch37
if /i "%IOS37%" EQU "*" (set IOS37=) else (set IOS37=*)
goto:LIST

:Switch38
if /i "%IOS38%" EQU "*" (set IOS38=) else (set IOS38=*)
goto:LIST

:Switch41
if /i "%IOS41%" EQU "*" (set IOS41=) else (set IOS41=*)
goto:LIST

:Switch43
if /i "%IOS43%" EQU "*" (set IOS43=) else (set IOS43=*)
goto:LIST

:Switch45
if /i "%IOS45%" EQU "*" (set IOS45=) else (set IOS45=*)
goto:LIST

:Switch46
if /i "%IOS46%" EQU "*" (set IOS46=) else (set IOS46=*)
goto:LIST

:Switch50P
if /i "%IOS50P%" EQU "*" (set IOS50P=) else (set IOS50P=*)
goto:LIST

:Switch52P
if /i "%IOS52P%" EQU "*" (set IOS52P=) else (set IOS52P=*)
goto:LIST

:Switch11P60
if /i "%IOS11P60%" EQU "*" (set IOS11P60=) else (set IOS11P60=*)
goto:LIST

:Switch20P60
if /i "%IOS20P60%" EQU "*" (set IOS20P60=) else (set IOS20P60=*)
goto:LIST

:Switch53
if /i "%IOS53%" EQU "*" (set IOS53=) else (set IOS53=*)
goto:LIST

:Switch55
if /i "%IOS55%" EQU "*" (set IOS55=) else (set IOS55=*)
goto:LIST

:Switch56
if /i "%IOS56%" EQU "*" (set IOS56=) else (set IOS56=*)
goto:LIST

:Switch57
if /i "%IOS57%" EQU "*" (set IOS57=) else (set IOS57=*)
goto:LIST

:Switch58
if /i "%IOS58%" EQU "*" (set IOS58=) else (set IOS58=*)
goto:LIST

:Switch60P
if /i "%IOS60P%" EQU "*" (set IOS60P=) else (set IOS60P=*)
goto:LIST

:Switch61
if /i "%IOS61%" EQU "*" (set IOS61=) else (set IOS61=*)
goto:LIST

:Switch70P
if /i "%IOS70P%" EQU "*" (set IOS70P=) else (set IOS70P=*)
goto:LIST

:Switch80P
if /i "%IOS80P%" EQU "*" (set IOS80P=) else (set IOS80P=*)
goto:LIST

:SwitchIOS236
if /i "%IOS236%" EQU "*" (set IOS236=) else (set IOS236=*)
goto:LIST

:Switch70K
if /i "%IOS70K%" EQU "*" (set IOS70K=) else (set IOS70K=*)
goto:LIST

:Switch80K
if /i "%IOS80K%" EQU "*" (set IOS80K=) else (set IOS80K=*)
goto:LIST

:SwitchIOS30
if /i "%IOS30%" EQU "*" (set IOS30=) else (set IOS30=*)
goto:LIST

:SwitchIOS9
if /i "%IOS9%" EQU "*" (set IOS9=) else (set IOS9=*)
goto:LIST

:SwitchIOS48v4124
if /i "%IOS48v4124%" EQU "*" (set IOS48v4124=) else (set IOS48v4124=*)
goto:LIST

:SwitchIOS60
if /i "%IOS60%" EQU "*" (set IOS60=) else (set IOS60=*)
goto:LIST

:SwitchIOS70
if /i "%IOS70%" EQU "*" (set IOS70=) else (set IOS70=*)
goto:LIST

:SwitchIOS80
if /i "%IOS80%" EQU "*" (set IOS80=) else (set IOS80=*)
goto:LIST

:Switch36v3608
if /i "%IOS36v3608%" EQU "*" (set IOS36v3608=) else (set IOS36v3608=*)
goto:LIST

:SwitchEULAU
if /i "%EULAU%" EQU "*" (set EULAU=) else (set EULAU=*)
goto:LIST

:SwitchEULAE
if /i "%EULAE%" EQU "*" (set EULAE=) else (set EULAE=*)
goto:LIST

:SwitchEULAJ
if /i "%EULAJ%" EQU "*" (set EULAJ=) else (set EULAJ=*)
goto:LIST

:SwitchEULAK
if /i "%EULAK%" EQU "*" (set EULAK=) else (set EULAK=*)
goto:LIST

:SwitchRSU
if /i "%RSU%" EQU "*" (set RSU=) else (set RSU=*)
goto:LIST

:SwitchRSE
if /i "%RSE%" EQU "*" (set RSE=) else (set RSE=*)
goto:LIST

:SwitchRSJ
if /i "%RSJ%" EQU "*" (set RSJ=) else (set RSJ=*)
goto:LIST

:SwitchRSK
if /i "%RSK%" EQU "*" (set RSK=) else (set RSK=*)
goto:LIST

:SwitchBC
if /i "%BC%" EQU "*" (set BC=) else (set BC=*)
goto:LIST

:SwitchcBC
if /i "%cBC%" EQU "*" (set cBC=) else (set cBC=*)
goto:LIST

:SwitchDML
if /i "%DML%" EQU "*" (set DML=) else (set DML=*)
goto:LIST

:SwitchA0e
if /i "%A0e%" EQU "*" (set A0e=) else (set A0e=*)
goto:LIST

:SwitchA0e_70
if /i "%A0e_70%" EQU "*" (set A0e_70=) else (set A0e_70=*)
goto:LIST

:SwitchA0e_60
if /i "%A0e_60%" EQU "*" (set A0e_60=) else (set A0e_60=*)
goto:LIST

:SwitchA0c
if /i "%A0c%" EQU "*" (set A0c=) else (set A0c=*)
goto:LIST

:SwitchA01
if /i "%A01%" EQU "*" (set A01=) else (set A01=*)
goto:LIST

:SwitchA01_70
if /i "%A01_70%" EQU "*" (set A01_70=) else (set A01_70=*)
goto:LIST

:SwitchA01_60
if /i "%A01_60%" EQU "*" (set A01_60=) else (set A01_60=*)
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
set P0=*
set S=*
set IU=*
set WU=*
set NU=*
set WSU=*
if /i "%LIST%" EQU "U" goto:list

:EALL
set MII=*
set P=*
set P0=*
set S=*
set IE=*
set WE=*
set NE=*
set WSE=*
if /i "%LIST%" EQU "E" goto:list

:JALL
set MII=*
set P=*
set P0=*
set S=*
set IJ=*
set WJ=*
set NJ=*
set WSJ=*
if /i "%LIST%" EQU "J" goto:list

:KALL
set MII=*
set P0=*
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
set cBC=*
set DML=*

goto:list



::........................................Additional OLDLIST / BATCH.......................................
:OLDLIST
Set OLDLIST=
cls
echo                                        ModMii                                v%currentversion%
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20[Red]PAGINA DESCARGA 2 [def]\x20 \x20 \x20 \x20 \x20 \x20 \x20by XFlak

echo.
echo      Elija agregar/quitar de las descargar (Seleccionados marcados con un *)
echo.
echo   D = Descargar Seleccionados    1/2/3/4 = Paginas 1/2/3/4        M = Menu Principal
echo   C = Borrar Cola Descarga       (blank) = Ciclo de Paginas        DR = Menu Disco
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 Elija Grupo: [Red](A)[def]ll, [Red](U)[def]SB-Loader, [Red](J)[def]Para diversion, [Red](PC)[def] Programas,
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red](W)[def]ii Apps, [Red](E)[def]xploits
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 [Red] Archivos USB-Loader  \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Para diversion!
echo.
echo      %usbfolder% CFG = CFG-Loader (Full v249)        %WiiMC% WMC = WiiMC (Media Player)
echo   %cfg249% CFG249 = CFG-Loader (Beta v249)        %fceugx% NES = FCEUGX (NES Emulator)
echo   %cfg222% CFG222 = CFG-Loader (Beta v222)       %snes9xgx% SNES = SNES9xGX (SNES Emulator)
echo     %cfgr% CFGR = Configurator-CFG-Loader       %vbagx% VBA = VBAGX (GB/GBA Emulator)
echo     %FLOW% FLOW = WiiFlow                        %WII64% W64 = Wii64 beta1.1 (N64 Emulator)
echo     %USBX% USBX = USB-Loader Fwdr Chnl           %WIISX% WSX = WiiSX beta2.1 (PS1 Emulator)
echo      %neogamma% NEO = Neogamma Backup Disc Loader    %HBB% HBB = Homebrew Browser
echo       %CheatCodes% CC = %cheatregion% Region Cheat Codes        %SGM% SGM = SaveGame Manager GX
echo       %AccioHacks% AH = AccioHacks                      %WIIX% WX = WiiXplorer
echo                                             %locked% LA = Bloquear carpeta HBC (Pass: UDLRAB)

support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red]Programas PC [def]\x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 %JOYF% JFF = Joy Flow Forwarder Channel/dol
echo                                             %JOY% JF = Joy Flow
echo      %F32% F32 = FAT32 GUI Formatter            %S2U% S2U = Switch2Uneek
echo      %wbm% WBM = WiiBackupManager
echo     %WiiGSC% WGSC = Wii Game Shortcut Creator
echo      %SMW% SMW = ShowMiiWads
echo       %CM% CM = Customize Mii
echo.

support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Aplicaciones Wii \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Exploits
echo.
echo       %HM% HM = HackMii Installer             %BB1% BB1 = Bannerbomb v1
echo      %bootmiisd% BSD = BootMii SD Files              %BB2% BB2 = Bannerbomb v2
echo     %yawm% YAWM = Yet Another Wad Manager Mod   %Pwns% PWNS = Indiana Pwns (USA\EUR\JAP)
echo      %MMM% MMM = Multi-Mod Manager               %Smash% SS = Smash Stack (USA\EUR\JAP\KOR)
echo      %dop% DOP = Dop-Mii                         %YUGI% YU = YU-GI-OWNED (USA\EUR\JAP)
echo      %IOS236Installer% 236 = IOS236 Installer                %BATHAXX% BH = BATHAXX (USA\EUR\JAP)
echo      %SIP% SIP = Simple IOS Patcher              %ROTJ% RJ = Return of the JODI (USA\EUR\JAP)
echo      %Pri% Pri = Priiloader v0.7 (236 Mod)      %Twi% Twi = Twilight Hack (USA\EUR\JAP)
echo      %HAX% HAX = Priiloader Hacks.ini            %TOS% EH = Eri HaKawai (USA\EUR\JAP)
echo      %HBF% HBF = Homebrew Filter
::echo     %Y4M% Y4M = YAWMM 4 ModMii
echo       %syscheck% SC = sysCheck
echo      %sysCheckBeta% SCB = sysCheckBeta
echo.
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] LEYENDA:[def] \x22=\x22 Actualizacion automatica de Descargas
echo.
echo.
echo.
echo.
set /p OLDLIST=     Escriba la seleccion aqui: 

if /i "%OLDLIST%" EQU "M" goto:MENU
if /i "%OLDLIST%" EQU "D" set BACKB4QUEUE=OLDLIST
if /i "%OLDLIST%" EQU "D" set loadorgo=go
if /i "%OLDLIST%" EQU "D" goto:DOWNLOADQUEUE
if /i "%OLDLIST%" EQU "DR" set BACKB4DRIVE=OLDLIST
if /i "%OLDLIST%" EQU "DR" goto:DRIVECHANGE
if /i "%OLDLIST%" EQU "C" goto:CLEAR

if /i "%OLDLIST%" EQU "A" goto:SelectAllOLD
if /i "%OLDLIST%" EQU "J" goto:SelectJust4FunOLD
if /i "%OLDLIST%" EQU "U" goto:USBLOADERSELECT
if /i "%OLDLIST%" EQU "E" goto:ExploitsSELECT
if /i "%OLDLIST%" EQU "PC" goto:PCPROGRAMSSELECT
if /i "%OLDLIST%" EQU "W" goto:WIIAPPSELECT

if /i "%OLDLIST%" EQU "1" goto:LIST
if /i "%OLDLIST%" EQU "2" goto:OLDLIST
if /i "%OLDLIST%" EQU "3" goto:LIST3
if /i "%OLDLIST%" EQU "4" goto:LIST4
if /i "%OLDLIST%" EQU "ADV" goto:ADVANCED
IF "%OLDLIST%"=="" goto:LIST3

if /i "%OLDLIST%" EQU "AH" goto:SwitchAccioHacks
if /i "%OLDLIST%" EQU "BSD" goto:Switchbootmiisd


if /i "%OLDLIST%" EQU "BB1" goto:SwitchBB1
if /i "%OLDLIST%" EQU "BB2" goto:SwitchBB2
if /i "%OLDLIST%" EQU "HM" goto:SwitchHM
if /i "%OLDLIST%" EQU "LA" goto:Switchlocked
if /i "%OLDLIST%" EQU "dop" goto:Switchdop
if /i "%OLDLIST%" EQU "SC" goto:Switchsyscheck
if /i "%OLDLIST%" EQU "SCB" goto:SwitchsysCheckBeta
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

if /i "%OLDLIST%" EQU "WGSC" goto:SwitchWGSC
if /i "%OLDLIST%" EQU "SMW" goto:SwitchSMW
if /i "%OLDLIST%" EQU "CM" goto:SwitchCM
if /i "%OLDLIST%" EQU "f32" goto:Switchf32
if /i "%OLDLIST%" EQU "FLOW" goto:SwitchFLOW
if /i "%OLDLIST%" EQU "USBX" goto:SwitchUSBX
if /i "%OLDLIST%" EQU "JFF" goto:SwitchJOYF
if /i "%OLDLIST%" EQU "S2U" goto:SwitchS2U
if /i "%OLDLIST%" EQU "HBF" goto:SwitchHBF
if /i "%OLDLIST%" EQU "Pri" goto:SwitchPri
if /i "%OLDLIST%" EQU "HAX" goto:SwitchHAX

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:OLDLIST

:SwitchAccioHacks
if /i "%AccioHacks%" EQU "*" (set AccioHacks=) else (set AccioHacks=*)
goto:OLDLIST

:Switchbootmiisd
if /i "%bootmiisd%" EQU "*" (set bootmiisd=) else (set bootmiisd=*)
goto:OLDLIST

:SwitchBB1
if /i "%BB1%" EQU "*" (set BB1=) else (set BB1=*)
goto:OLDLIST

:SwitchBB2
if /i "%BB2%" EQU "*" (set BB2=) else (set BB2=*)
goto:OLDLIST

:SwitchHM
if /i "%HM%" EQU "*" (set HM=) else (set HM=*)
goto:OLDLIST

:Switchpwns
if /i "%pwns%" EQU "*" (set pwns=) else (set pwns=*)
goto:OLDLIST

:SwitchTwi
if /i "%Twi%" EQU "*" (set Twi=) else (set Twi=*)
goto:OLDLIST

:SwitchYUGI
if /i "%YUGI%" EQU "*" (set YUGI=) else (set YUGI=*)
goto:OLDLIST

:SwitchBATHAXX
if /i "%BATHAXX%" EQU "*" (set BATHAXX=) else (set BATHAXX=*)
goto:OLDLIST

:SwitchROTJ
if /i "%ROTJ%" EQU "*" (set ROTJ=) else (set ROTJ=*)
goto:OLDLIST

:SwitchTOS
if /i "%TOS%" EQU "*" (set TOS=) else (set TOS=*)
goto:OLDLIST

:Switchsmash
if /i "%smash%" EQU "*" (set smash=) else (set smash=*)
goto:OLDLIST

:Switchdop
if /i "%dop%" EQU "*" (set dop=) else (set dop=*)
goto:OLDLIST

:Switchsyscheck
if /i "%syscheck%" EQU "*" (set syscheck=) else (set syscheck=*)
goto:OLDLIST

:SwitchsysCheckBeta
if /i "%sysCheckBeta%" EQU "*" (set sysCheckBeta=) else (set sysCheckBeta=*)
goto:OLDLIST

:Switchlocked
if /i "%locked%" EQU "*" (set locked=) else (set locked=*)
goto:OLDLIST

:SwitchHBB
if /i "%HBB%" EQU "*" (set HBB=) else (set HBB=*)
goto:OLDLIST

:SwitchWII64
if /i "%WII64%" EQU "*" (set WII64=) else (set WII64=*)
goto:OLDLIST

:SwitchWIISX
if /i "%WIISX%" EQU "*" (set WIISX=) else (set WIISX=*)
goto:OLDLIST

:Switchmmm
if /i "%mmm%" EQU "*" (set mmm=) else (set mmm=*)
goto:OLDLIST

:SwitchIOS236Installer
if /i "%IOS236Installer%" EQU "*" (set IOS236Installer=) else (set IOS236Installer=*)
goto:OLDLIST

:SwitchSIP
if /i "%SIP%" EQU "*" (set SIP=) else (set SIP=*)
goto:OLDLIST

:SwitchJOY
if /i "%JOY%" EQU "*" (set JOY=) else (set JOY=*)
goto:OLDLIST

:Switchyawm
if /i "%yawm%" EQU "*" (set yawm=) else (set yawm=*)
goto:OLDLIST

:Switchneogamma
if /i "%neogamma%" EQU "*" (set neogamma=) else (set neogamma=*)
goto:OLDLIST

:Switchcfg249
if /i "%cfg249%" EQU "*" (set cfg249=) else (set cfg249=*)
goto:OLDLIST

:Switchcfg222
if /i "%cfg222%" EQU "*" (set cfg222=) else (set cfg222=*)
goto:OLDLIST

:Switchcfgr
if /i "%cfgr%" EQU "*" (set cfgr=) else (set cfgr=*)
goto:OLDLIST

:Switchwbm
if /i "%wbm%" EQU "*" (set wbm=) else (set wbm=*)
goto:OLDLIST

:SwitchCheatCodes
if /i "%CheatCodes%" EQU "*" (set CheatCodes=) else (set CheatCodes=*)
goto:OLDLIST

:SwitchF32
if /i "%F32%" EQU "*" (set F32=) else (set F32=*)
goto:OLDLIST

:SwitchWGSC
if /i "%WiiGSC%" EQU "*" (set WiiGSC=) else (set WiiGSC=*)
goto:OLDLIST

:SwitchCM
if /i "%CM%" EQU "*" (set CM=) else (set CM=*)
goto:OLDLIST

:SwitchSMW
if /i "%SMW%" EQU "*" (set SMW=) else (set SMW=*)
goto:OLDLIST

:SwitchFLOW
if /i "%FLOW%" EQU "*" (set FLOW=) else (set FLOW=*)
goto:OLDLIST

:SwitchUSBX
if /i "%USBX%" EQU "*" (set USBX=) else (set USBX=*)
goto:OLDLIST

:SwitchJOYF
if /i "%JOYF%" EQU "*" (set JOYF=) else (set JOYF=*)
goto:OLDLIST

:SwitchS2U
if /i "%S2U%" EQU "*" (set S2U=) else (set S2U=*)
goto:OLDLIST

:SwitchHBF
if /i "%HBF%" EQU "*" (set HBF=) else (set HBF=*)
goto:OLDLIST

:Switchusbfolder
if /i "%usbfolder%" EQU "*" (set usbfolder=) else (set usbfolder=*)
goto:OLDLIST

:SwitchWiiMC
if /i "%WiiMC%" EQU "*" (set WiiMC=) else (set WiiMC=*)
goto:OLDLIST

:Switchfceugx
if /i "%fceugx%" EQU "*" (set fceugx=) else (set fceugx=*)
goto:OLDLIST

:Switchsnes9xgx
if /i "%snes9xgx%" EQU "*" (set snes9xgx=) else (set snes9xgx=*)
goto:OLDLIST

:Switchvbagx
if /i "%vbagx%" EQU "*" (set vbagx=) else (set vbagx=*)
goto:OLDLIST

:SwitchSGM
if /i "%SGM%" EQU "*" (set SGM=) else (set SGM=*)
goto:OLDLIST

:SwitchWIIX
if /i "%WIIX%" EQU "*" (set WIIX=) else (set WIIX=*)
goto:OLDLIST

:SwitchPri
if /i "%Pri%" EQU "*" (set Pri=) else (set Pri=*)
goto:OLDLIST

:SwitchHAX
if /i "%HAX%" EQU "*" (set HAX=) else (set HAX=*)
goto:OLDLIST

:SwitchY4M
if /i "%Y4M%" EQU "*" (set Y4M=) else (set Y4M=*)
goto:OLDLIST

:SELECTALLOLD

:USBLOADERSELECT
set cfg249=*
set cfg222=*
set usbfolder=*
set cfgr=*
set neogamma=*
set CheatCodes=*
set AccioHacks=*
set FLOW=*
set USBX=*
if /i "%OLDLIST%" EQU "U" goto:OLDLIST

:PCPROGRAMSSELECT
set wbm=*
set f32=*
set SMW=*
set CM=*
set WiiGSC=*
if /i "%OLDLIST%" EQU "PC" goto:OLDLIST

:WiiAppSelect
set mmm=*
set HM=*
set dop=*
set syscheck=*
set sysCheckBeta=*
set yawm=*
set Pri=*
set HAX=*
::set Y4M=*
set IOS236Installer=*
set SIP=*
set HBF=*
set bootmiisd=*
if /i "%OLDLIST%" EQU "W" goto:OLDLIST

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

goto:OLDLIST




::........................................Additional LIST3 / BATCH.......................................
:LIST3
Set LIST3=
cls
echo                                        ModMii                                v%currentversion%
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20[Red]PAGINA DESCARGA 3 [def]\x20 \x20 \x20 \x20 \x20 \x20 \x20by XFlak

echo.
echo      Elija agregar/quitar de las descargars (Seleccionados marcados con un *)
echo.
echo   D = Descargar seleccionados    1/2/3/4 = Paginas 1/2/3/4       M = Menu Principal
echo   C = Borrar Cola descarga       (blank) = ciclo de Paginas     DR = Menu Disco
echo.
echo.
support\sfk echo -spat \x20 \x20[Red]NO INSTALAR TEMAS SIN PROTECCION: BOOTMII, PRIILOADER Y RESPALDO NAND
support\sfk echo -spat \x20 \x20[Red]SOLO INSTALAR TEMAS PARA SU VERSION ESPECIFICA DE TU MENU DE SISTEMA Y REGION!
echo.
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20Elija Grupo: [Red](A)[def]ll, Temas para [Red](U)[def]SA, [Red](E)[def]uro, [Red](J)[def]ap, [Red](K)[def]orean
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20Menu Sistema w/ Temas para [Red](US)[def]A, [Red](EU)[def]ro, [Red](JA)[def]p, [Red](KO)[def]rean
echo.
echo.
if "%selectedtheme%"=="" set selectedtheme=R

if /i "%selectedtheme%" EQU "R" echo       S = Conectar lista de descargas para ver otro tema: DarkWii Rojo
if /i "%selectedtheme%" EQU "G" echo       S = Conectar de lista de descargas para ver otro tema: DarkWii Verde
if /i "%selectedtheme%" EQU "B" echo       S = Conectar de lista de descargas para ver otro tema: DarkWii Azul
if /i "%selectedtheme%" EQU "O" echo       S = Conectar de lista de descargas para ver otro tema: DarkWii Naranja

echo           Temas compatibles incluyen: DarkWii Rojo\Verde\Azul\Naranja
echo.
echo      CE = Canal Efecto que personaliza los temas de los menus: %effect%
echo           * Elegir entre tres efectos: No-Spin, Spin and Fast-Spin
echo.
echo    %MyM% MyM = MyMenuifyMod
echo.


if /i "%selectedtheme%" NEQ "R" goto:skipred
echo     WWW = Ver Tema DarkWii Rojo en youtube
echo.
support\sfk echo -spat \x20 [Red]DarkWii Rojo CSMs \x20 \x20 \x20 \x20 \x20 DarkWii Rojo Menu Sistema \x20 \x20 Temas Originales Wii
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
echo     WWW = Ver Tema DarkWii Verde en youtube
echo.
support\sfk echo -spat \x20 [Red]DarkWii Verde CSMs \x20 \x20 \x20 DarkWii Verde Menu Sistema \x20 \x20 Temas Originales Wii
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


if /i "%selectedtheme%" NEQ "B" goto:skipBlue
echo     WWW = Ver Tema DarkWii Azul en youtube
echo.
support\sfk echo -spat \x20 [Red]DarkWii Azul CSMs \x20 \x20 \x20 DarkWii Azul Menu Sistema \x20 \x20 Temas Originales Wii
echo.
echo    %DarkWii_Blue_4.3U% 3U = 4.3U                    %SM4.3U-DWB% 4.3U = 4.3U            %A97% 97 = 97.app SM4.3U
echo    %DarkWii_Blue_4.2U% 2U = 4.2U                    %SM4.2U-DWB% 4.2U = 4.2U            %A87% 87 = 87.app SM4.2U
echo    %DarkWii_Blue_4.1U% 1U = 4.1U                    %SM4.1U-DWB% 4.1U = 4.1U            %A7b% 7b = 7b.app SM4.1U
echo                                                          %A72% 72 = 72.app SM4.0U
echo                                                          %A42% 42 = 42.app SM3.2U
echo.
echo    %DarkWii_Blue_4.3E% 3E = 4.3E                    %SM4.3E-DWB% 4.3E = 4.3E            %A9a% 9a = 9a.app SM4.3E
echo    %DarkWii_Blue_4.2E% 2E = 4.2E                    %SM4.2E-DWB% 4.2E = 4.2E            %A8a% 8a = 8a.app SM4.2E
echo    %DarkWii_Blue_4.1E% 1E = 4.1E                    %SM4.1E-DWB% 4.1E = 4.1E            %A7e% 7e = 7e.app SM4.1E
echo                                                          %A75% 75 = 75.app SM4.0E
echo                                                          %A45% 45 = 45.app SM3.2E
echo.
echo    %DarkWii_Blue_4.3J% 3J = 4.3J                    %SM4.3J-DWB% 4.3J = 4.3J            %A94% 94 = 94.app SM4.3J
echo    %DarkWii_Blue_4.2J% 2J = 4.2J                    %SM4.2J-DWB% 4.2J = 4.2J            %A84% 84 = 84.app SM4.2J
echo    %DarkWii_Blue_4.1J% 1J = 4.1J                    %SM4.1J-DWB% 4.1J = 4.1J            %A78% 78 = 78.app SM4.1J
echo                                                          %A70% 70 = 70.app SM4.0J
echo                                                          %A40% 40 = 40.app SM3.2J
echo.
echo    %DarkWii_Blue_4.3K% 3K = 4.3K                    %SM4.3K-DWB% 4.3K = 4.3K            %A9d% 9d = 9d.app SM4.3K
echo    %DarkWii_Blue_4.2K% 2K = 4.2K                    %SM4.2K-DWB% 4.2K = 4.2K            %A8d% 8d = 8d.app SM4.2K
echo    %DarkWii_Blue_4.1K% 1K = 4.1K                    %SM4.1K-DWB% 4.1K = 4.1K            %A81% 81 = 81.app SM4.1K
:skipBlue


if /i "%selectedtheme%" NEQ "O" goto:skipOrange
echo     WWW = Ver Tema DarkWii Naranja en youtube
echo.
support\sfk echo -spat \x20 [Red]DarkWii Naranja CSMs \x20 \x20 \x20 DarkWii Naranja Menu Sistema \x20 \x20 Temas Originales Wii
echo.
echo    %darkwii_orange_4.3U% 3U = 4.3U                    %SM4.3U-DWO% 4.3U = 4.3U            %A97% 97 = 97.app SM4.3U
echo    %darkwii_orange_4.2U% 2U = 4.2U                    %SM4.2U-DWO% 4.2U = 4.2U            %A87% 87 = 87.app SM4.2U
echo    %darkwii_orange_4.1U% 1U = 4.1U                    %SM4.1U-DWO% 4.1U = 4.1U            %A7b% 7b = 7b.app SM4.1U
echo                                                          %A72% 72 = 72.app SM4.0U
echo                                                          %A42% 42 = 42.app SM3.2U
echo.
echo    %darkwii_orange_4.3E% 3E = 4.3E                    %SM4.3E-DWO% 4.3E = 4.3E            %A9a% 9a = 9a.app SM4.3E
echo    %darkwii_orange_4.2E% 2E = 4.2E                    %SM4.2E-DWO% 4.2E = 4.2E            %A8a% 8a = 8a.app SM4.2E
echo    %darkwii_orange_4.1E% 1E = 4.1E                    %SM4.1E-DWO% 4.1E = 4.1E            %A7e% 7e = 7e.app SM4.1E
echo                                                          %A75% 75 = 75.app SM4.0E
echo                                                          %A45% 45 = 45.app SM3.2E
echo.
echo    %darkwii_orange_4.3J% 3J = 4.3J                    %SM4.3J-DWO% 4.3J = 4.3J            %A94% 94 = 94.app SM4.3J
echo    %darkwii_orange_4.2J% 2J = 4.2J                    %SM4.2J-DWO% 4.2J = 4.2J            %A84% 84 = 84.app SM4.2J
echo    %darkwii_orange_4.1J% 1J = 4.1J                    %SM4.1J-DWO% 4.1J = 4.1J            %A78% 78 = 78.app SM4.1J
echo                                                          %A70% 70 = 70.app SM4.0J
echo                                                          %A40% 40 = 40.app SM3.2J
echo.
echo    %darkwii_orange_4.3K% 3K = 4.3K                    %SM4.3K-DWO% 4.3K = 4.3K            %A9d% 9d = 9d.app SM4.3K
echo    %darkwii_orange_4.2K% 2K = 4.2K                    %SM4.2K-DWO% 4.2K = 4.2K            %A8d% 8d = 8d.app SM4.2K
echo    %darkwii_orange_4.1K% 1K = 4.1K                    %SM4.1K-DWO% 4.1K = 4.1K            %A81% 81 = 81.app SM4.1K
:skipOrange


echo.
echo.

set /p LIST3=     Escriba la seleccion aqui: 

if /i "%LIST3%" EQU "M" goto:MENU
if /i "%LIST3%" EQU "D" set BACKB4QUEUE=LIST3
if /i "%LIST3%" EQU "D" set loadorgo=go
if /i "%LIST3%" EQU "D" goto:DOWNLOADQUEUE
if /i "%LIST3%" EQU "DR" set BACKB4DRIVE=LIST3
if /i "%LIST3%" EQU "DR" goto:DRIVECHANGE
if /i "%LIST3%" EQU "C" goto:CLEAR


if /i "%LIST3%" EQU "1" goto:LIST
if /i "%LIST3%" EQU "2" goto:OLDLIST
if /i "%LIST3%" EQU "3" goto:LIST3
if /i "%LIST3%" EQU "4" goto:LIST4
if /i "%LIST3%" EQU "ADV" goto:ADVANCED
IF "%LIST3%"=="" goto:LIST4

::common
if /i "%LIST3%" EQU "CE" goto:OptionCEp3
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
if /i "%LIST3%" EQU "S" (set selectedtheme=B)&&(goto:LIST3)
if /i "%LIST3%" EQU "WWW" (start www.youtube.com/watch?v=Rn0CnTo5kRI)&&(goto:LIST3)
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


::Blue
if /i "%selectedtheme%" NEQ "B" goto:skipBlue
if /i "%LIST3%" EQU "S" (set selectedtheme=O)&&(goto:LIST3)
if /i "%LIST3%" EQU "WWW" (start www.youtube.com/watch?v=oSMkswfXe_w)&&(goto:LIST3)
if /i "%LIST3%" EQU "3U" goto:SwitchDarkWii_Blue_4.3U
if /i "%LIST3%" EQU "2U" goto:SwitchDarkWii_Blue_4.2U
if /i "%LIST3%" EQU "1U" goto:SwitchDarkWii_Blue_4.1U
if /i "%LIST3%" EQU "3E" goto:SwitchDarkWii_Blue_4.3E
if /i "%LIST3%" EQU "2E" goto:SwitchDarkWii_Blue_4.2E
if /i "%LIST3%" EQU "1E" goto:SwitchDarkWii_Blue_4.1E
if /i "%LIST3%" EQU "3J" goto:SwitchDarkWii_Blue_4.3J
if /i "%LIST3%" EQU "2J" goto:SwitchDarkWii_Blue_4.2J
if /i "%LIST3%" EQU "1J" goto:SwitchDarkWii_Blue_4.1J
if /i "%LIST3%" EQU "3K" goto:SwitchDarkWii_Blue_4.3K
if /i "%LIST3%" EQU "2K" goto:SwitchDarkWii_Blue_4.2K
if /i "%LIST3%" EQU "1K" goto:SwitchDarkWii_Blue_4.1K
if /i "%LIST3%" EQU "4.3U" goto:SwitchSM4.3U-DWB
if /i "%LIST3%" EQU "4.2U" goto:SwitchSM4.2U-DWB
if /i "%LIST3%" EQU "4.1U" goto:SwitchSM4.1U-DWB
if /i "%LIST3%" EQU "4.3E" goto:SwitchSM4.3E-DWB
if /i "%LIST3%" EQU "4.2E" goto:SwitchSM4.2E-DWB
if /i "%LIST3%" EQU "4.1E" goto:SwitchSM4.1E-DWB
if /i "%LIST3%" EQU "4.3J" goto:SwitchSM4.3J-DWB
if /i "%LIST3%" EQU "4.2J" goto:SwitchSM4.2J-DWB
if /i "%LIST3%" EQU "4.1J" goto:SwitchSM4.1J-DWB
if /i "%LIST3%" EQU "4.3K" goto:SwitchSM4.3K-DWB
if /i "%LIST3%" EQU "4.2K" goto:SwitchSM4.2K-DWB
if /i "%LIST3%" EQU "4.1K" goto:SwitchSM4.1K-DWB
:skipBlue


::Orange
if /i "%selectedtheme%" NEQ "O" goto:skipOrange
if /i "%LIST3%" EQU "S" (set selectedtheme=R)&&(goto:LIST3)
if /i "%LIST3%" EQU "WWW" (start www.youtube.com/watch?v=g66UasiFEhg)&&(goto:LIST3)
if /i "%LIST3%" EQU "3U" goto:Switchdarkwii_orange_4.3U
if /i "%LIST3%" EQU "2U" goto:Switchdarkwii_orange_4.2U
if /i "%LIST3%" EQU "1U" goto:Switchdarkwii_orange_4.1U
if /i "%LIST3%" EQU "3E" goto:Switchdarkwii_orange_4.3E
if /i "%LIST3%" EQU "2E" goto:Switchdarkwii_orange_4.2E
if /i "%LIST3%" EQU "1E" goto:Switchdarkwii_orange_4.1E
if /i "%LIST3%" EQU "3J" goto:Switchdarkwii_orange_4.3J
if /i "%LIST3%" EQU "2J" goto:Switchdarkwii_orange_4.2J
if /i "%LIST3%" EQU "1J" goto:Switchdarkwii_orange_4.1J
if /i "%LIST3%" EQU "3K" goto:Switchdarkwii_orange_4.3K
if /i "%LIST3%" EQU "2K" goto:Switchdarkwii_orange_4.2K
if /i "%LIST3%" EQU "1K" goto:Switchdarkwii_orange_4.1K
if /i "%LIST3%" EQU "4.3U" goto:SwitchSM4.3U-DWO
if /i "%LIST3%" EQU "4.2U" goto:SwitchSM4.2U-DWO
if /i "%LIST3%" EQU "4.1U" goto:SwitchSM4.1U-DWO
if /i "%LIST3%" EQU "4.3E" goto:SwitchSM4.3E-DWO
if /i "%LIST3%" EQU "4.2E" goto:SwitchSM4.2E-DWO
if /i "%LIST3%" EQU "4.1E" goto:SwitchSM4.1E-DWO
if /i "%LIST3%" EQU "4.3J" goto:SwitchSM4.3J-DWO
if /i "%LIST3%" EQU "4.2J" goto:SwitchSM4.2J-DWO
if /i "%LIST3%" EQU "4.1J" goto:SwitchSM4.1J-DWO
if /i "%LIST3%" EQU "4.3K" goto:SwitchSM4.3K-DWO
if /i "%LIST3%" EQU "4.2K" goto:SwitchSM4.2K-DWO
if /i "%LIST3%" EQU "4.1K" goto:SwitchSM4.1K-DWO
:skipOrange


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:LIST3


:OptionCEp3
if /i "%effect%" EQU "no-spin" (set effect=Spin) & (support\sfk filter Support\settings.bat -!"Set effect=" -write -yes>nul) & (echo Set effect=Spin>>Support\settings.bat) & (goto:list3)
if /i "%effect%" EQU "spin" (set effect=Fast-Spin) & (support\sfk filter Support\settings.bat -!"Set effect=" -write -yes>nul) & (echo Set effect=Fast-Spin>>Support\settings.bat) & (goto:list3)
if /i "%effect%" EQU "fast-spin" (set effect=No-Spin) & (support\sfk filter Support\settings.bat -!"Set effect=" -write -yes>nul) & (echo Set effect=No-Spin>>Support\settings.bat) & (goto:list3)

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



:SwitchDarkWii_Blue_4.3U
if /i "%DarkWii_Blue_4.3U%" EQU "*" (set DarkWii_Blue_4.3U=) else (set DarkWii_Blue_4.3U=*)
goto:LIST3

:SwitchDarkWii_Blue_4.2U
if /i "%DarkWii_Blue_4.2U%" EQU "*" (set DarkWii_Blue_4.2U=) else (set DarkWii_Blue_4.2U=*)
goto:LIST3

:SwitchDarkWii_Blue_4.1U
if /i "%DarkWii_Blue_4.1U%" EQU "*" (set DarkWii_Blue_4.1U=) else (set DarkWii_Blue_4.1U=*)
goto:LIST3

:SwitchDarkWii_Blue_4.3E
if /i "%DarkWii_Blue_4.3E%" EQU "*" (set DarkWii_Blue_4.3E=) else (set DarkWii_Blue_4.3E=*)
goto:LIST3

:SwitchDarkWii_Blue_4.2E
if /i "%DarkWii_Blue_4.2E%" EQU "*" (set DarkWii_Blue_4.2E=) else (set DarkWii_Blue_4.2E=*)
goto:LIST3

:SwitchDarkWii_Blue_4.1E
if /i "%DarkWii_Blue_4.1E%" EQU "*" (set DarkWii_Blue_4.1E=) else (set DarkWii_Blue_4.1E=*)
goto:LIST3

:SwitchDarkWii_Blue_4.1J
if /i "%DarkWii_Blue_4.1J%" EQU "*" (set DarkWii_Blue_4.1J=) else (set DarkWii_Blue_4.1J=*)
goto:LIST3

:SwitchDarkWii_Blue_4.2J
if /i "%DarkWii_Blue_4.2J%" EQU "*" (set DarkWii_Blue_4.2J=) else (set DarkWii_Blue_4.2J=*)
goto:LIST3

:SwitchDarkWii_Blue_4.3J
if /i "%DarkWii_Blue_4.3J%" EQU "*" (set DarkWii_Blue_4.3J=) else (set DarkWii_Blue_4.3J=*)
goto:LIST3

:SwitchDarkWii_Blue_4.1K
if /i "%DarkWii_Blue_4.1K%" EQU "*" (set DarkWii_Blue_4.1K=) else (set DarkWii_Blue_4.1K=*)
goto:LIST3

:SwitchDarkWii_Blue_4.2K
if /i "%DarkWii_Blue_4.2K%" EQU "*" (set DarkWii_Blue_4.2K=) else (set DarkWii_Blue_4.2K=*)
goto:LIST3

:SwitchDarkWii_Blue_4.3K
if /i "%DarkWii_Blue_4.3K%" EQU "*" (set DarkWii_Blue_4.3K=) else (set DarkWii_Blue_4.3K=*)
goto:LIST3


:SwitchSM4.3U-DWB
if /i "%SM4.3U-DWB%" EQU "*" (set SM4.3U-DWB=) else (set SM4.3U-DWB=*)
goto:LIST3

:SwitchSM4.2U-DWB
if /i "%SM4.2U-DWB%" EQU "*" (set SM4.2U-DWB=) else (set SM4.2U-DWB=*)
goto:LIST3

:SwitchSM4.1U-DWB
if /i "%SM4.1U-DWB%" EQU "*" (set SM4.1U-DWB=) else (set SM4.1U-DWB=*)
goto:LIST3

:SwitchSM4.3E-DWB
if /i "%SM4.3E-DWB%" EQU "*" (set SM4.3E-DWB=) else (set SM4.3E-DWB=*)
goto:LIST3

:SwitchSM4.2E-DWB
if /i "%SM4.2E-DWB%" EQU "*" (set SM4.2E-DWB=) else (set SM4.2E-DWB=*)
goto:LIST3

:SwitchSM4.1E-DWB
if /i "%SM4.1E-DWB%" EQU "*" (set SM4.1E-DWB=) else (set SM4.1E-DWB=*)
goto:LIST3

:SwitchSM4.3J-DWB
if /i "%SM4.3J-DWB%" EQU "*" (set SM4.3J-DWB=) else (set SM4.3J-DWB=*)
goto:LIST3

:SwitchSM4.2J-DWB
if /i "%SM4.2J-DWB%" EQU "*" (set SM4.2J-DWB=) else (set SM4.2J-DWB=*)
goto:LIST3

:SwitchSM4.1J-DWB
if /i "%SM4.1J-DWB%" EQU "*" (set SM4.1J-DWB=) else (set SM4.1J-DWB=*)
goto:LIST3

:SwitchSM4.3K-DWB
if /i "%SM4.3K-DWB%" EQU "*" (set SM4.3K-DWB=) else (set SM4.3K-DWB=*)
goto:LIST3

:SwitchSM4.2K-DWB
if /i "%SM4.2K-DWB%" EQU "*" (set SM4.2K-DWB=) else (set SM4.2K-DWB=*)
goto:LIST3

:SwitchSM4.1K-DWB
if /i "%SM4.1K-DWB%" EQU "*" (set SM4.1K-DWB=) else (set SM4.1K-DWB=*)
goto:LIST3


:Switchdarkwii_orange_4.3U
if /i "%darkwii_orange_4.3U%" EQU "*" (set darkwii_orange_4.3U=) else (set darkwii_orange_4.3U=*)
goto:LIST3

:Switchdarkwii_orange_4.2U
if /i "%darkwii_orange_4.2U%" EQU "*" (set darkwii_orange_4.2U=) else (set darkwii_orange_4.2U=*)
goto:LIST3

:Switchdarkwii_orange_4.1U
if /i "%darkwii_orange_4.1U%" EQU "*" (set darkwii_orange_4.1U=) else (set darkwii_orange_4.1U=*)
goto:LIST3

:Switchdarkwii_orange_4.3E
if /i "%darkwii_orange_4.3E%" EQU "*" (set darkwii_orange_4.3E=) else (set darkwii_orange_4.3E=*)
goto:LIST3

:Switchdarkwii_orange_4.2E
if /i "%darkwii_orange_4.2E%" EQU "*" (set darkwii_orange_4.2E=) else (set darkwii_orange_4.2E=*)
goto:LIST3

:Switchdarkwii_orange_4.1E
if /i "%darkwii_orange_4.1E%" EQU "*" (set darkwii_orange_4.1E=) else (set darkwii_orange_4.1E=*)
goto:LIST3

:Switchdarkwii_orange_4.1J
if /i "%darkwii_orange_4.1J%" EQU "*" (set darkwii_orange_4.1J=) else (set darkwii_orange_4.1J=*)
goto:LIST3

:Switchdarkwii_orange_4.2J
if /i "%darkwii_orange_4.2J%" EQU "*" (set darkwii_orange_4.2J=) else (set darkwii_orange_4.2J=*)
goto:LIST3

:Switchdarkwii_orange_4.3J
if /i "%darkwii_orange_4.3J%" EQU "*" (set darkwii_orange_4.3J=) else (set darkwii_orange_4.3J=*)
goto:LIST3

:Switchdarkwii_orange_4.1K
if /i "%darkwii_orange_4.1K%" EQU "*" (set darkwii_orange_4.1K=) else (set darkwii_orange_4.1K=*)
goto:LIST3

:Switchdarkwii_orange_4.2K
if /i "%darkwii_orange_4.2K%" EQU "*" (set darkwii_orange_4.2K=) else (set darkwii_orange_4.2K=*)
goto:LIST3

:Switchdarkwii_orange_4.3K
if /i "%darkwii_orange_4.3K%" EQU "*" (set darkwii_orange_4.3K=) else (set darkwii_orange_4.3K=*)
goto:LIST3


:SwitchSM4.3U-DWO
if /i "%SM4.3U-DWO%" EQU "*" (set SM4.3U-DWO=) else (set SM4.3U-DWO=*)
goto:LIST3

:SwitchSM4.2U-DWO
if /i "%SM4.2U-DWO%" EQU "*" (set SM4.2U-DWO=) else (set SM4.2U-DWO=*)
goto:LIST3

:SwitchSM4.1U-DWO
if /i "%SM4.1U-DWO%" EQU "*" (set SM4.1U-DWO=) else (set SM4.1U-DWO=*)
goto:LIST3

:SwitchSM4.3E-DWO
if /i "%SM4.3E-DWO%" EQU "*" (set SM4.3E-DWO=) else (set SM4.3E-DWO=*)
goto:LIST3

:SwitchSM4.2E-DWO
if /i "%SM4.2E-DWO%" EQU "*" (set SM4.2E-DWO=) else (set SM4.2E-DWO=*)
goto:LIST3

:SwitchSM4.1E-DWO
if /i "%SM4.1E-DWO%" EQU "*" (set SM4.1E-DWO=) else (set SM4.1E-DWO=*)
goto:LIST3

:SwitchSM4.3J-DWO
if /i "%SM4.3J-DWO%" EQU "*" (set SM4.3J-DWO=) else (set SM4.3J-DWO=*)
goto:LIST3

:SwitchSM4.2J-DWO
if /i "%SM4.2J-DWO%" EQU "*" (set SM4.2J-DWO=) else (set SM4.2J-DWO=*)
goto:LIST3

:SwitchSM4.1J-DWO
if /i "%SM4.1J-DWO%" EQU "*" (set SM4.1J-DWO=) else (set SM4.1J-DWO=*)
goto:LIST3

:SwitchSM4.3K-DWO
if /i "%SM4.3K-DWO%" EQU "*" (set SM4.3K-DWO=) else (set SM4.3K-DWO=*)
goto:LIST3

:SwitchSM4.2K-DWO
if /i "%SM4.2K-DWO%" EQU "*" (set SM4.2K-DWO=) else (set SM4.2K-DWO=*)
goto:LIST3

:SwitchSM4.1K-DWO
if /i "%SM4.1K-DWO%" EQU "*" (set SM4.1K-DWO=) else (set SM4.1K-DWO=*)
goto:LIST3


:SwitchA40
if /i "%A40%" EQU "*" (set A40=) else (set A40=*)
goto:LIST3

:SwitchA42
if /i "%A42%" EQU "*" (set A42=) else (set A42=*)
goto:LIST3

:SwitchA45
if /i "%A45%" EQU "*" (set A45=) else (set A45=*)
goto:LIST3

:SwitchA70
if /i "%A70%" EQU "*" (set A70=) else (set A70=*)
goto:LIST3

:SwitchA72
if /i "%A72%" EQU "*" (set A72=) else (set A72=*)
goto:LIST3

:SwitchA75
if /i "%A75%" EQU "*" (set A75=) else (set A75=*)
goto:LIST3

:SwitchA78
if /i "%A78%" EQU "*" (set A78=) else (set A78=*)
goto:LIST3

:SwitchA7b
if /i "%A7b%" EQU "*" (set A7b=) else (set A7b=*)
goto:LIST3

:SwitchA7e
if /i "%A7e%" EQU "*" (set A7e=) else (set A7e=*)
goto:LIST3

:SwitchA84
if /i "%A84%" EQU "*" (set A84=) else (set A84=*)
goto:LIST3

:SwitchA87
if /i "%A87%" EQU "*" (set A87=) else (set A87=*)
goto:LIST3

:SwitchA8a
if /i "%A8a%" EQU "*" (set A8a=) else (set A8a=*)
goto:LIST3

:SwitchA94
if /i "%A94%" EQU "*" (set A94=) else (set A94=*)
goto:LIST3

:SwitchA97
if /i "%A97%" EQU "*" (set A97=) else (set A97=*)
goto:LIST3

:SwitchA9a
if /i "%A9a%" EQU "*" (set A9a=) else (set A9a=*)
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
if /i "%selectedtheme%" EQU "B" set DarkWii_Blue_4.3U=*
if /i "%selectedtheme%" EQU "B" set DarkWii_Blue_4.2U=*
if /i "%selectedtheme%" EQU "B" set DarkWii_Blue_4.1U=*
if /i "%selectedtheme%" EQU "O" set darkwii_orange_4.3U=*
if /i "%selectedtheme%" EQU "O" set darkwii_orange_4.2U=*
if /i "%selectedtheme%" EQU "O" set darkwii_orange_4.1U=*
if /i "%LIST3%" EQU "U" goto:LIST3

:ETHEMES
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.3E=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.2E=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.1E=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.3E=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.2E=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.1E=*
if /i "%selectedtheme%" EQU "B" set DarkWii_Blue_4.3E=*
if /i "%selectedtheme%" EQU "B" set DarkWii_Blue_4.2E=*
if /i "%selectedtheme%" EQU "B" set DarkWii_Blue_4.1E=*
if /i "%selectedtheme%" EQU "O" set darkwii_orange_4.3E=*
if /i "%selectedtheme%" EQU "O" set darkwii_orange_4.2E=*
if /i "%selectedtheme%" EQU "O" set darkwii_orange_4.1E=*
if /i "%LIST3%" EQU "E" goto:LIST3

:JTHEMES
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.3J=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.2J=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.1J=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.3J=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.2J=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.1J=*
if /i "%selectedtheme%" EQU "B" set DarkWii_Blue_4.3J=*
if /i "%selectedtheme%" EQU "B" set DarkWii_Blue_4.2J=*
if /i "%selectedtheme%" EQU "B" set DarkWii_Blue_4.1J=*
if /i "%selectedtheme%" EQU "O" set darkwii_orange_4.3J=*
if /i "%selectedtheme%" EQU "O" set darkwii_orange_4.2J=*
if /i "%selectedtheme%" EQU "O" set darkwii_orange_4.1J=*
if /i "%LIST3%" EQU "J" goto:LIST3

:KTHEMES
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.3K=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.2K=*
if /i "%selectedtheme%" EQU "R" set DarkWii_Red_4.1K=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.3K=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.2K=*
if /i "%selectedtheme%" EQU "G" set DarkWii_Green_4.1K=*
if /i "%selectedtheme%" EQU "B" set DarkWii_Blue_4.3K=*
if /i "%selectedtheme%" EQU "B" set DarkWii_Blue_4.2K=*
if /i "%selectedtheme%" EQU "B" set DarkWii_Blue_4.1K=*
if /i "%selectedtheme%" EQU "O" set darkwii_orange_4.3K=*
if /i "%selectedtheme%" EQU "O" set darkwii_orange_4.2K=*
if /i "%selectedtheme%" EQU "O" set darkwii_orange_4.1K=*
if /i "%LIST3%" EQU "K" goto:LIST3

:SMUTHEMES
if /i "%selectedtheme%" EQU "R" set SM4.3U-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.2U-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.1U-DWR=*
if /i "%selectedtheme%" EQU "G" set SM4.3U-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.2U-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.1U-DWG=*
if /i "%selectedtheme%" EQU "B" set SM4.3U-DWB=*
if /i "%selectedtheme%" EQU "B" set SM4.2U-DWB=*
if /i "%selectedtheme%" EQU "B" set SM4.1U-DWB=*
if /i "%selectedtheme%" EQU "O" set SM4.3U-DWO=*
if /i "%selectedtheme%" EQU "O" set SM4.2U-DWO=*
if /i "%selectedtheme%" EQU "O" set SM4.1U-DWO=*
if /i "%LIST3%" EQU "US" goto:LIST3

:SMETHEMES
if /i "%selectedtheme%" EQU "R" set SM4.3E-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.2E-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.1E-DWR=*
if /i "%selectedtheme%" EQU "G" set SM4.3E-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.2E-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.1E-DWG=*
if /i "%selectedtheme%" EQU "B" set SM4.3E-DWB=*
if /i "%selectedtheme%" EQU "B" set SM4.2E-DWB=*
if /i "%selectedtheme%" EQU "B" set SM4.1E-DWB=*
if /i "%selectedtheme%" EQU "O" set SM4.3E-DWO=*
if /i "%selectedtheme%" EQU "O" set SM4.2E-DWO=*
if /i "%selectedtheme%" EQU "O" set SM4.1E-DWO=*
if /i "%LIST3%" EQU "EU" goto:LIST3

:SMJTHEMES
if /i "%selectedtheme%" EQU "R" set SM4.3J-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.2J-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.1J-DWR=*
if /i "%selectedtheme%" EQU "G" set SM4.3J-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.2J-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.1J-DWG=*
if /i "%selectedtheme%" EQU "B" set SM4.3J-DWB=*
if /i "%selectedtheme%" EQU "B" set SM4.2J-DWB=*
if /i "%selectedtheme%" EQU "B" set SM4.1J-DWB=*
if /i "%selectedtheme%" EQU "O" set SM4.3J-DWO=*
if /i "%selectedtheme%" EQU "O" set SM4.2J-DWO=*
if /i "%selectedtheme%" EQU "O" set SM4.1J-DWO=*
if /i "%LIST3%" EQU "JA" goto:LIST3

:SMKTHEMES
if /i "%selectedtheme%" EQU "R" set SM4.3K-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.2K-DWR=*
if /i "%selectedtheme%" EQU "R" set SM4.1K-DWR=*
if /i "%selectedtheme%" EQU "G" set SM4.3K-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.2K-DWG=*
if /i "%selectedtheme%" EQU "G" set SM4.1K-DWG=*
if /i "%selectedtheme%" EQU "B" set SM4.3K-DWB=*
if /i "%selectedtheme%" EQU "B" set SM4.2K-DWB=*
if /i "%selectedtheme%" EQU "B" set SM4.1K-DWB=*
if /i "%selectedtheme%" EQU "O" set SM4.3K-DWO=*
if /i "%selectedtheme%" EQU "O" set SM4.2K-DWO=*
if /i "%selectedtheme%" EQU "O" set SM4.1K-DWO=*
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
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20[Red]PAGINA DESCARGA 4 [def]\x20 \x20 \x20 \x20 \x20 \x20 \x20by XFlak

echo.
echo      Elija agregar/quitar de las descargas (Seleccionados marcados con un *)
echo.
echo   D = Descargar seleccionados    1/2/3/4 = Paginas 1/2/3/4       M = Menu Principal
echo   C = Borrar Cola descarga       (blank) = ciclo de Paginas     DR = Menu Disco
echo.

support\sfk echo -spat \x20 \x20Elegir Grupo: [Red](A)[def]ll, [Red](REC)[def]omendados CIOSs, [Red](cM)[def]IOSs, [Red](v4)[def] cIOSs, [Red](v5)[def] cIOSs
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20[Red](v5.1)[def] cIOSs, [Red](v14)[def] cIOSs, [Red](v17b)[def] cIOSs, [Red](v19)[def] cIOSs, [Red](v20)[def] cIOSs
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20[Red](v21)[def] cIOSs, [Red](d2x)[def] cIOSs

echo.

support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Waninkoko v14 cIOSs \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Hermes v4 cIOSs
echo              %cIOS249-v14% 24914 = cIOS249-v14              %cIOS223[37-38]-v4% 2234 = cIOS223[37-38]-v4
echo              %cIOS250-v14% 25014 = cIOS250-v14              %cIOS222[38]-v4% 2224 = cIOS222[38]-v4
echo.

support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Waninkoko v17b cIOSs \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Hermes v5 cIOSs
echo              %cIOS249-v17b% 24917 = cIOS249-v17b             %cIOS222[38]-v5% 2225 = cIOS222[38]-v5
echo              %cIOS250-v17b% 25017 = cIOS250-v17b             %cIOS223[37]-v5% 2235 = cIOS223[37]-v5
echo                                                %cIOS224[57]-v5% 2245 = cIOS224[57]-v5

support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Waninkoko v19 cIOSs

support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 %cIOS249[37]-v19% 2491937 = cIOS249[37]-v19 \x20 \x20 \x20 \x20 [Red] Hermes\Rodries v5.1R cIOSs

echo            %cIOS250[37]-v19% 2501937 = cIOS250[37]-v19         %cIOS202[60]-v5.1R% 20251 = cIOS202[60]-v5.1R
echo            %cIOS249[38]-v19% 2491938 = cIOS249[38]-v19         %cIOS222[38]-v5.1R% 22251 = cIOS222[38]-v5.1R
echo            %cIOS250[38]-v19% 2501938 = cIOS250[38]-v19         %cIOS223[37]-v5.1R% 22351 = cIOS223[37]-v5.1R
echo            %cIOS249[57]-v19% 2491957 = cIOS249[57]-v19         %cIOS224[57]-v5.1R% 22451 = cIOS224[57]-v5.1R
echo            %cIOS250[57]-v19% 2501957 = cIOS250[57]-v19
echo.



support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Waninkoko v20 cIOSs \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 cMIOSs
echo            %cIOS249[38]-v20% 2492038 = cIOS249[38]-v20    %RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2% 10 = WiiGator+WiiPower cMIOS-v65535(v10)
echo            %cIOS250[38]-v20% 2502038 = cIOS250[38]-v20   %RVL-cmios-v4_WiiGator_GCBL_v0.2% 0.2 = WiiGator cMIOS-v4 v0.2
echo            %cIOS249[56]-v20% 2492056 = cIOS249[56]-v20     %RVL-cmios-v4_Waninkoko_rev5% 5 = Waninkoko cMIOS-v4 rev5
echo            %cIOS250[56]-v20% 2502056 = cIOS250[56]-v20
echo            %cIOS249[57]-v20% 2492057 = cIOS249[57]-v20
echo            %cIOS250[57]-v20% 2502057 = cIOS250[57]-v20           BETA = d2x beta settings
echo.


set d2x-beta-rev=6
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat

support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] Waninkoko v21 cIOSs \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 d2x cIOSs
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


echo.

set /p LIST4=     Escriba la seleccion aqui: 

if /i "%LIST4%" EQU "M" goto:MENU
if /i "%LIST4%" EQU "D" set BACKB4QUEUE=LIST4
if /i "%LIST4%" EQU "D" set loadorgo=go
if /i "%LIST4%" EQU "D" goto:DOWNLOADQUEUE
if /i "%LIST4%" EQU "DR" set BACKB4DRIVE=LIST4
if /i "%LIST4%" EQU "DR" goto:DRIVECHANGE
if /i "%LIST4%" EQU "C" goto:CLEAR

if /i "%LIST4%" EQU "A" goto:SelectAllLIST4
if /i "%LIST4%" EQU "REC" goto:RECOMMENDEDCIOSS

if not exist support\More-cIOSs goto:quickskip
if /i "%LIST4%" EQU "BETA" (set backbeforebetaswitch=LIST4) & (goto:betaswitch)
:quickskip


if /i "%LIST4%" EQU "v4" goto:v4cIOSs
if /i "%LIST4%" EQU "v5" goto:v5cIOSs
if /i "%LIST4%" EQU "v5.1" goto:v5.1cIOSs
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



if /i "%LIST4%" EQU "2225" goto:SwitchcIOS222[38]-v5
if /i "%LIST4%" EQU "2235" goto:SwitchcIOS223[37]-v5
if /i "%LIST4%" EQU "2245" goto:SwitchcIOS224[57]-v5

if /i "%LIST4%" EQU "20251" goto:SwitchcIOS202[60]-v5.1R
if /i "%LIST4%" EQU "22251" goto:SwitchcIOS222[38]-v5.1R
if /i "%LIST4%" EQU "22351" goto:SwitchcIOS223[37]-v5.1R
if /i "%LIST4%" EQU "22451" goto:SwitchcIOS224[57]-v5.1R

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

if /i "%LIST4%" EQU "2234" goto:SwitchcIOS223[37-38]-v4
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

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:LIST4


:SwitchcIOS222[38]-v5
if /i "%cIOS222[38]-v5%" EQU "*" (set cIOS222[38]-v5=) else (set cIOS222[38]-v5=*)
goto:LIST4

:SwitchcIOS223[37]-v5
if /i "%cIOS223[37]-v5%" EQU "*" (set cIOS223[37]-v5=) else (set cIOS223[37]-v5=*)
goto:LIST4

:SwitchcIOS224[57]-v5
if /i "%cIOS224[57]-v5%" EQU "*" (set cIOS224[57]-v5=) else (set cIOS224[57]-v5=*)
goto:LIST4

:SwitchcIOS249[37]-v19
if /i "%cIOS249[37]-v19%" EQU "*" (set cIOS249[37]-v19=) else (set cIOS249[37]-v19=*)
goto:LIST4

:SwitchcIOS249[38]-v19
if /i "%cIOS249[38]-v19%" EQU "*" (set cIOS249[38]-v19=) else (set cIOS249[38]-v19=*)
goto:LIST4

:SwitchcIOS249[38]-v20
if /i "%cIOS249[38]-v20%" EQU "*" (set cIOS249[38]-v20=) else (set cIOS249[38]-v20=*)
goto:LIST4

:SwitchcIOS250[38]-v20
if /i "%cIOS250[38]-v20%" EQU "*" (set cIOS250[38]-v20=) else (set cIOS250[38]-v20=*)
goto:LIST4

:SwitchcIOS249[56]-v20
if /i "%cIOS249[56]-v20%" EQU "*" (set cIOS249[56]-v20=) else (set cIOS249[56]-v20=*)
goto:LIST4

:SwitchcIOS249[57]-v20
if /i "%cIOS249[57]-v20%" EQU "*" (set cIOS249[57]-v20=) else (set cIOS249[57]-v20=*)
goto:LIST4

:SwitchcIOS250[57]-v20
if /i "%cIOS250[57]-v20%" EQU "*" (set cIOS250[57]-v20=) else (set cIOS250[57]-v20=*)
goto:LIST4

:SwitchcIOS250[56]-v20
if /i "%cIOS250[56]-v20%" EQU "*" (set cIOS250[56]-v20=) else (set cIOS250[56]-v20=*)
goto:LIST4

:SwitchcIOS249[57]-v19
if /i "%cIOS249[57]-v19%" EQU "*" (set cIOS249[57]-v19=) else (set cIOS249[57]-v19=*)
goto:LIST4

:SwitchcIOS250[37]-v19
if /i "%cIOS250[37]-v19%" EQU "*" (set cIOS250[37]-v19=) else (set cIOS250[37]-v19=*)
goto:LIST4

:SwitchcIOS250[38]-v19
if /i "%cIOS250[38]-v19%" EQU "*" (set cIOS250[38]-v19=) else (set cIOS250[38]-v19=*)
goto:LIST4

:SwitchcIOS250[57]-v19
if /i "%cIOS250[57]-v19%" EQU "*" (set cIOS250[57]-v19=) else (set cIOS250[57]-v19=*)
goto:LIST4

:SwitchRVL-cmios-v4_WiiGator_GCBL_v0.2
if /i "%RVL-cmios-v4_WiiGator_GCBL_v0.2%" EQU "*" (set RVL-cmios-v4_WiiGator_GCBL_v0.2=) else (set RVL-cmios-v4_WiiGator_GCBL_v0.2=*)
goto:LIST4

:SwitchRVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2
if /i "%RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2%" EQU "*" goto:switchRVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2off
set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=*
goto:LIST4
:switchRVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2off
set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=
goto:LIST4

:SwitchRVL-cmios-v4_Waninkoko_rev5
if /i "%RVL-cmios-v4_Waninkoko_rev5%" EQU "*" (set RVL-cmios-v4_Waninkoko_rev5=) else (set RVL-cmios-v4_Waninkoko_rev5=*)
goto:LIST4

:SwitchcIOS222[38]-v4
if /i "%cIOS222[38]-v4%" EQU "*" (set cIOS222[38]-v4=) else (set cIOS222[38]-v4=*)
goto:LIST4

:SwitchcIOS223[37-38]-v4
if /i "%cIOS223[37-38]-v4%" EQU "*" (set cIOS223[37-38]-v4=) else (set cIOS223[37-38]-v4=*)
goto:LIST4

:SwitchcIOS249-v17b
if /i "%cIOS249-v17b%" EQU "*" (set cIOS249-v17b=) else (set cIOS249-v17b=*)
goto:LIST4

:SwitchcIOS250-v17b
if /i "%cIOS250-v17b%" EQU "*" (set cIOS250-v17b=) else (set cIOS250-v17b=*)
goto:LIST4

:SwitchcIOS202[60]-v5.1R
if /i "%cIOS202[60]-v5.1R%" EQU "*" (set cIOS202[60]-v5.1R=) else (set cIOS202[60]-v5.1R=*)
goto:LIST4

:SwitchcIOS222[38]-v5.1R
if /i "%cIOS222[38]-v5.1R%" EQU "*" (set cIOS222[38]-v5.1R=) else (set cIOS222[38]-v5.1R=*)
goto:LIST4

:SwitchcIOS223[37]-v5.1R
if /i "%cIOS223[37]-v5.1R%" EQU "*" (set cIOS223[37]-v5.1R=) else (set cIOS223[37]-v5.1R=*)
goto:LIST4

:SwitchcIOS224[57]-v5.1R
if /i "%cIOS224[57]-v5.1R%" EQU "*" (set cIOS224[57]-v5.1R=) else (set cIOS224[57]-v5.1R=*)
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
set cIOS202[60]-v5.1R=*
set cIOS222[38]-v4=*
set cIOS223[37-38]-v4=*
set cIOS224[57]-v5.1R=*
set cIOS249[56]-d2x-v6=*
set cIOS250[57]-d2x-v6=*
set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=*
if /i "%LIST4%" EQU "REC" goto:LIST4


:v4cIOSs
set cIOS223[37-38]-v4=*
set cIOS222[38]-v4=*
if /i "%LIST4%" EQU "v4" goto:LIST4

:v5cIOSs
set cIOS222[38]-v5=*
set cIOS224[57]-v5=*
set cIOS223[37]-v5=*
if /i "%LIST4%" EQU "v5" goto:LIST4

:v5.1cIOSs
set cIOS202[60]-v5.1R=*
set cIOS222[38]-v5.1R=*
set cIOS224[57]-v5.1R=*
set cIOS223[37]-v5.1R=*
if /i "%LIST4%" EQU "v5.1" goto:LIST4

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





::........................................Advanced Downloads........................................
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
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20[Red]DESCARGAS AVANZADAS[def]\x20 \x20 \x20 \x20 \x20 \x20by XFlak
echo.
echo   D = Descargar seleccionados    1/2/3/4 = Paginas 1/2/3/4       M = Menu Principal
echo   C = Borrar Cola descarga       (blank) = ciclo de Paginas     DR = Menu Disco
echo.
echo     Nota: Para volver a esta pagina desde otras paginas de descarga escribir "ADV"
echo.
echo     U = Definido por el usuario descarga personalizada   
echo           (Obtener cualquier IOS, MIOS o menu del sistema)
echo.
echo     F = Forwarder DOL\ISO Creador
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] IOSs \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 cIOSs



set d2x-beta-rev=6
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat



echo                 9 = IOS9v1034		 2224 = cIOS222[38]-v4
echo                12 = IOS12v526		 2234 = cIOS223[37-38]-v4
echo                13 = IOS13v1032		 2225 = cIOS222[38]-v5
echo                14 = IOS14v1032		 2235 = cIOS223[37]-v5
echo                15 = IOS15v1032		 2245 = cIOS224[57]-v5
echo                17 = IOS17v1032
echo                21 = IOS21v1039          20251 = cIOS202[60]-v5.1R
echo                22 = IOS22v1294          22251 = cIOS222[38]-v5.1R
echo                28 = IOS28v1807          22351 = cIOS223[37]-v5.1R
echo                30 = IOS30v2576          22451 = cIOS224[57]-v5.1R
echo                31 = IOS31v3608
echo                33 = IOS33v3608	        24914 = cIOS249-v14
echo                34 = IOS34v3608	        24917 = cIOS249-v17b
echo                35 = IOS35v3608
echo                36 = IOS36v3608        2491937 = cIOS249[37]-v19
echo                37 = IOS37v5663	      2491938 = cIOS249[38]-v19
echo                38 = IOS38v4124	      2491957 = cIOS249[57]-v19
echo                41 = IOS41v3607	      2492038 = cIOS249[38]-v20
echo                43 = IOS43v3607	      2492056 = cIOS249[56]-v20
echo                45 = IOS45v3607	      2492057 = cIOS249[57]-v20
echo                46 = IOS46v3607
echo                48 = IOS48v4124        2492137 = cIOS249[37]-v21
echo                53 = IOS53v5663        2492138 = cIOS249[38]-v21
echo                55 = IOS55v5663        2492153 = cIOS249[53]-v21
echo                56 = IOS56v5662        2492155 = cIOS249[55]-v21
echo                57 = IOS57v5919        2492156 = cIOS249[56]-v21
echo                58 = IOS58v6176        2492157 = cIOS249[57]-v21
echo                60 = IOS60v6174        2492158 = cIOS249[58]-v21
echo                61 = IOS61v5662
echo                70 = IOS70v6687       249d2x37 = cIOS249[37]-d2x-v%d2x-beta-rev%
echo                80 = IOS80v6944       249d2x38 = cIOS249[38]-d2x-v%d2x-beta-rev%
echo                                      249d2x53 = cIOS249[53]-d2x-v%d2x-beta-rev%
echo                                      249d2x55 = cIOS249[55]-d2x-v%d2x-beta-rev%
echo                                      249d2x56 = cIOS249[56]-d2x-v%d2x-beta-rev%
echo                                      249d2x57 = cIOS249[57]-d2x-v%d2x-beta-rev%
echo                                      249d2x58 = cIOS249[58]-d2x-v%d2x-beta-rev%
echo                                          BETA = d2x beta settings
echo.
echo      %AdvNumber% Descargas avanzadas en cola
echo.
set /p ADVLIST=     Escriba la seleccion aqui: 

if /i "%ADVLIST%" EQU "M" goto:MENU

if /i "%ADVLIST%" EQU "DR" set BACKB4DRIVE=ADVANCED
if /i "%ADVLIST%" EQU "DR" goto:DRIVECHANGE

if /i "%ADVLIST%" EQU "U" goto:Custom


if /i "%ADVLIST%" EQU "1" goto:LIST
if /i "%ADVLIST%" EQU "2" goto:OLDLIST
if /i "%ADVLIST%" EQU "3" goto:LIST3
if /i "%ADVLIST%" EQU "4" goto:LIST4
if /i "%ADVLIST%" EQU "ADV" goto:ADVANCED
if /i "%ADVLIST%" EQU "F" goto:FORWARDERDOLorISO
IF "%ADVLIST%"=="" goto:LIST


if not exist support\More-cIOSs goto:quickskip
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
if /i "%ADVLIST%" EQU "2225" goto:cIOS222[38]-v5
if /i "%ADVLIST%" EQU "2235" goto:cIOS223[37]-v5
if /i "%ADVLIST%" EQU "2245" goto:cIOS224[57]-v5

if /i "%ADVLIST%" EQU "20251" goto:cIOS202[60]-v5.1R
if /i "%ADVLIST%" EQU "22251" goto:cIOS222[38]-v5.1R
if /i "%ADVLIST%" EQU "22351" goto:cIOS223[37]-v5.1R
if /i "%ADVLIST%" EQU "22451" goto:cIOS224[57]-v5.1R

if /i "%ADVLIST%" EQU "2491937" goto:cIOS249[37]-v19
if /i "%ADVLIST%" EQU "2491938" goto:cIOS249[38]-v19
if /i "%ADVLIST%" EQU "2492038" goto:cIOS249[38]-v20
if /i "%ADVLIST%" EQU "2492056" goto:cIOS249[56]-v20
if /i "%ADVLIST%" EQU "2492057" goto:cIOS249[57]-v20
if /i "%ADVLIST%" EQU "2491957" goto:cIOS249[57]-v19

if /i "%ADVLIST%" EQU "2224" goto:cIOS222[38]-v4
if /i "%ADVLIST%" EQU "2234" goto:cIOS223[37-38]-v4
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


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:ADVANCED

::------------------------
:betaswitch

dir support\More-cIOSs /a:d /b>temp\list.txt

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
echo                                       by XFlak
echo.
echo.
echo                    Seleccione la version beta cIOS D2X que quiere crear:
echo.
echo.


if /i "%d2xTOTAL%" EQU "0" (echo                 No se encuentran D2X-beta en la carpeta modulos\Mas-cIOSs) & (goto:quickskip)
echo       N = Ninguno, construir el cIOSs D2X que viene con ModMii v%currentversion%
echo.

set MorecIOSsNum=0

::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\list.txt) do call :processlist %%A
goto:quickskip
:processlist
set CurrentcIOS=%*
if not exist "support\More-cIOSs\%CurrentcIOS%\d2x-beta.bat" goto:EOF
set /a MorecIOSsNum=%MorecIOSsNum%+1
echo       %MorecIOSsNum% = %CurrentcIOS%
goto:EOF
:quickskip

echo.
echo     WWW = Buscar actualizaciones en http://tinyurl.com/d2xcIOS

echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
set /p betacios=     Escriba la seleccion aqui: 

if /i "%betacios%" EQU "M" (mode con cols=85 lines=54) & (goto:MENU)
if /i "%betacios%" EQU "B" (mode con cols=85 lines=54) & (goto:%backbeforebetaswitch%)

if /i "%betacios%" EQU "WWW" (start http://gbatemp.net/t277659-ciosx-rev21d2x-v2-yet-another-hot-fix) & (goto:betaswitch)

if /i "%betacios%" NEQ "N" goto:notN
if exist support\d2x-beta rd /s /q support\d2x-beta
mode con cols=85 lines=54
goto:d2xfix
:notN

if "%betacios%"=="" goto:badkey


if /i "%d2xTOTAL%" EQU "0" goto:badkey

echo set betacios=%betacios% >temp\temp.bat
support\sfk filter -quiet temp\temp.bat -rep _.__ -lerep _" "__ -write -yes
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
if not exist "support\More-cIOSs\%CurrentcIOS%\d2x-beta.bat" goto:EOF
set /a MorecIOSsNum2=%MorecIOSsNum2%+1
if /i "%MorecIOSsNum2%" EQU "%betacios%" goto:quickskip

goto:EOF
:quickskip
if exist support\d2x-beta rd /s /q support\d2x-beta
mkdir support\d2x-beta
copy /y "support\More-cIOSs\%CurrentcIOS%\*" "support\d2x-beta">nul
del temp\list.txt>nul
mode con cols=85 lines=54
goto:d2xfix


:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:betaswitch


::--------------
:d2xfix
::d2x check for changed DL names and md5's for Advanced downloads only

if not exist temp\DLnamesADV.txt (mode con cols=85 lines=54) & (goto:%backbeforebetaswitch%)
findStr "d2x" temp\DLnamesADV.txt >nul
IF ERRORLEVEL 1 (mode con cols=85 lines=54) & (goto:%backbeforebetaswitch%)

FINDSTR /N . temp\DLnamesADV.txt>temp\DLnamesADVcheck.txt
support\sfk filter -quiet temp\DLnamesADVcheck.txt -+d2x -rep _cIOS*[_cIOS249[_ -rep _"Advanced Download: "__ -write -yes

set loadorgo=load4switch

::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\DLnamesADVcheck.txt) do call :processDLCheckswitch %%A
goto:quickskip
:processDLCheckswitch

set advDLCheck=%*

echo set advDLcheckNUM=%advDLCheck%>temp\advDLcheckNUM.bat
support\sfk filter -quiet temp\advDLcheckNUM.bat -rep _:*__ -write -yes
call temp\advDLcheckNUM.bat
del temp\advDLcheckNUM.bat>nul

echo %advDLCheck%>temp\advDLcheck.bat
support\sfk filter -quiet temp\advDLcheck.bat -rep _"%advDLcheckNUM%:"_"set advDLcheck="_ -write -yes
call temp\advDLcheck.bat
del temp\advDLcheck.bat>nul


call temp\AdvDL%advDLcheckNUM%.bat
set oldfullname=%name%

set advDLCheck0=%advDLCheck%

set d2x-beta-rev=6
set advDLCheck=%advDLCheck:~0,17%%d2x-beta-rev%
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat

set string=%d2x-beta-rev%
set d2xVersionLength=0

:loopd2xVersionLength
if defined string (
    set string=%string:~1%
    set /A d2xVersionLength += 1
    goto:loopd2xVersionLength
    )

echo set alt-d2x-beta-rev=@advDLcheck0:~17,%d2xVersionLength%@>temp\d2x-beta-rev.bat
support\sfk filter temp\d2x-beta-rev.bat -spat -rep _@_%%_ -write -yes>nul
call temp\d2x-beta-rev.bat
del temp\d2x-beta-rev.bat>nul

if /i "%d2x-beta-rev%" EQU "%alt-d2x-beta-rev%" goto:EOF

goto:%advDLCheck%


:processDLCheck2switch

set slotnum=%slotcode:~7%
if "%slotnum%"=="" set slotnum=249
set newname=cIOS%slotnum%%basecios:~7,10%%d2x-beta-rev%

::update temp\AdvDL#.bat
support\sfk filter -quiet temp\AdvDL%advDLcheckNUM%.bat -rep _"set MD5="*_"set MD5=%MD5%"_ -rep _"set md5alt="*_"set md5alt=%md5alt%"_ -rep _"set ciosversion="*_"set ciosversion=%ciosversion%"_ -rep _"Advanced Download: "*_"Advanced Download: %newname%%versionname%"_ -rep _"set wadname="*_"set wadname=%wadname%"_ -rep _"set wadnameless="*_"set wadnameless=%newname%"_ -write -yes

::update temp\DLnamesADV.txt
support\sfk filter -quiet temp\DLnamesADV.txt -lerep _"%oldfullname%"_"Advanced Download: %newname%%versionname%"_ -write -yes
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
support\sfk filter wadnametemp.bat -rep _BLAH_"set wadnameless="_ -rep _-64-__ -rep _RVL-__ -rep _.wad__ -write -yes>nul
call wadnametemp.bat
del wadnametemp.bat>nul
if /i "%ADVTYPE%" EQU "CIOS" goto:ADVPAGE3
:skip

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Como le gustaria el parche %wadnameless%?
echo.
echo.
echo.
echo                A = Los 4 parches disponibles
echo                N = Ningun parche
echo.
echo              -FS = Parche Falso
echo              -ES = ES identificar el parche
echo              -NP = Nand permiso de parche
echo              -VP = Version parche
echo.
echo.
echo.
echo        Seleccione varios parches separandolos por un espacio.
echo.
echo.
echo        Ejemplos de como seleccionar multiples parches
echo        ------------------------------------------
echo               -FS -ES -NP
echo               -ES -FS
echo               -NP -VP
echo               -NP -FS -VP
echo               -FS -ES -NP -VP
echo                etc.
echo.
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p ADVPATCH=     Escriba la seleccion aqui: 

if "%ADVLIST%"=="" goto:badkey

if /i "%ADVPATCH%" EQU "M" goto:MENU

if /i "%ADVLIST%" EQU "U" goto:skip
if /i "%ADVPATCH%" EQU "B" goto:ADVANCED
:skip
if /i "%ADVPATCH%" EQU "B" goto:CUSTOMPAGE2

if /i "%ADVPATCH%" EQU "N" (set patchcode=) & (set patchname=) & (goto:ADVPAGE3)

if /i "%ADVPATCH%" EQU "A" set ADVPATCH=-FS -ES -NP -VP

::if lower case letters entered change to upper
if /i "%ADVPATCH%" EQU "-FS" set ADVPATCH=-FS
if /i "%ADVPATCH%" EQU "-ES" set ADVPATCH=-ES
if /i "%ADVPATCH%" EQU "-NP" set ADVPATCH=-NP
if /i "%ADVPATCH%" EQU "-VP" set ADVPATCH=-VP
if /i "%ADVPATCH%" EQU "-FS -ES" set ADVPATCH=-FS -ES
if /i "%ADVPATCH%" EQU "-ES -FS" set ADVPATCH=-ES -FS
if /i "%ADVPATCH%" EQU "-FS -NP" set ADVPATCH=-FS -NP
if /i "%ADVPATCH%" EQU "-NP -FS" set ADVPATCH=-NP -FS
if /i "%ADVPATCH%" EQU "-FS -VP" set ADVPATCH=-FS -VP
if /i "%ADVPATCH%" EQU "-VP -FS" set ADVPATCH=-VP -FS
if /i "%ADVPATCH%" EQU "-ES -NP" set ADVPATCH=-ES -NP
if /i "%ADVPATCH%" EQU "-NP -ES" set ADVPATCH=-NP -ES
if /i "%ADVPATCH%" EQU "-ES -VP" set ADVPATCH=-ES -VP
if /i "%ADVPATCH%" EQU "-VP -ES" set ADVPATCH=-VP -ES
if /i "%ADVPATCH%" EQU "-NP -VP" set ADVPATCH=-NP -VP
if /i "%ADVPATCH%" EQU "-VP -NP" set ADVPATCH=-VP -NP
if /i "%ADVPATCH%" EQU "-FS -ES -NP" set ADVPATCH=-FS -ES -NP
if /i "%ADVPATCH%" EQU "-FS -NP -ES" set ADVPATCH=-FS -NP -ES
if /i "%ADVPATCH%" EQU "-ES -FS -NP" set ADVPATCH=-ES -FS -NP
if /i "%ADVPATCH%" EQU "-ES -NP -FS" set ADVPATCH=-ES -NP -FS
if /i "%ADVPATCH%" EQU "-NP -FS -ES" set ADVPATCH=-NP -FS -ES
if /i "%ADVPATCH%" EQU "-NP -ES -FS" set ADVPATCH=-NP -ES -FS
if /i "%ADVPATCH%" EQU "-FS -ES -VP" set ADVPATCH=-FS -ES -VP
if /i "%ADVPATCH%" EQU "-FS -VP -ES" set ADVPATCH=-FS -VP -ES
if /i "%ADVPATCH%" EQU "-ES -FS -VP" set ADVPATCH=-ES -FS -VP
if /i "%ADVPATCH%" EQU "-ES -VP -FS" set ADVPATCH=-ES -VP -FS
if /i "%ADVPATCH%" EQU "-VP -FS -ES" set ADVPATCH=-VP -FS -ES
if /i "%ADVPATCH%" EQU "-VP -ES -FS" set ADVPATCH=-VP -ES -FS
if /i "%ADVPATCH%" EQU "-FS -NP -VP" set ADVPATCH=-FS -NP -VP
if /i "%ADVPATCH%" EQU "-FS -VP -NP" set ADVPATCH=-FS -VP -NP
if /i "%ADVPATCH%" EQU "-NP -FS -VP" set ADVPATCH=-NP -FS -VP
if /i "%ADVPATCH%" EQU "-NP -VP -FS" set ADVPATCH=-NP -VP -FS
if /i "%ADVPATCH%" EQU "-VP -NP -FS" set ADVPATCH=-VP -NP -FS
if /i "%ADVPATCH%" EQU "-VP -FS -NP" set ADVPATCH=-VP -FS -NP
if /i "%ADVPATCH%" EQU "-ES -NP -VP" set ADVPATCH=-ES -NP -VP
if /i "%ADVPATCH%" EQU "-ES -VP -NP" set ADVPATCH=-ES -VP -NP
if /i "%ADVPATCH%" EQU "-NP -ES -VP" set ADVPATCH=-NP -ES -VP
if /i "%ADVPATCH%" EQU "-NP -VP -ES" set ADVPATCH=-NP -VP -ES
if /i "%ADVPATCH%" EQU "-VP -ES -NP" set ADVPATCH=-VP -ES -NP
if /i "%ADVPATCH%" EQU "-VP -NP -ES" set ADVPATCH=-VP -NP -ES
if /i "%ADVPATCH%" EQU "-VP -FS -ES -NP" set ADVPATCH=-VP -FS -ES -NP
if /i "%ADVPATCH%" EQU "-VP -FS -NP -ES" set ADVPATCH=-VP -FS -NP -ES
if /i "%ADVPATCH%" EQU "-VP -ES -FS -NP" set ADVPATCH=-VP -ES -FS -NP
if /i "%ADVPATCH%" EQU "-VP -ES -NP -FS" set ADVPATCH=-VP -ES -NP -FS
if /i "%ADVPATCH%" EQU "-VP -NP -FS -ES" set ADVPATCH=-VP -NP -FS -ES
if /i "%ADVPATCH%" EQU "-VP -NP -ES -FS" set ADVPATCH=-VP -NP -ES -FS
if /i "%ADVPATCH%" EQU "-NP -FS -ES -VP" set ADVPATCH=-NP -FS -ES -VP
if /i "%ADVPATCH%" EQU "-NP -FS -VP -ES" set ADVPATCH=-NP -FS -VP -ES
if /i "%ADVPATCH%" EQU "-NP -ES -FS -VP" set ADVPATCH=-NP -ES -FS -VP
if /i "%ADVPATCH%" EQU "-NP -ES -VP -FS" set ADVPATCH=-NP -ES -VP -FS
if /i "%ADVPATCH%" EQU "-NP -VP -FS -ES" set ADVPATCH=-NP -VP -FS -ES
if /i "%ADVPATCH%" EQU "-NP -VP -ES -FS" set ADVPATCH=-NP -VP -ES -FS
if /i "%ADVPATCH%" EQU "-ES -FS -NP -VP" set ADVPATCH=-ES -FS -NP -VP
if /i "%ADVPATCH%" EQU "-ES -FS -VP -NP" set ADVPATCH=-ES -FS -VP -NP
if /i "%ADVPATCH%" EQU "-ES -NP -FS -VP" set ADVPATCH=-ES -NP -FS -VP
if /i "%ADVPATCH%" EQU "-ES -NP -VP -FS" set ADVPATCH=-ES -NP -VP -FS
if /i "%ADVPATCH%" EQU "-ES -VP -NP -FS" set ADVPATCH=-ES -VP -NP -FS
if /i "%ADVPATCH%" EQU "-ES -VP -FS -NP" set ADVPATCH=-ES -VP -FS -NP
if /i "%ADVPATCH%" EQU "-FS -ES -NP -VP" set ADVPATCH=-FS -ES -NP -VP
if /i "%ADVPATCH%" EQU "-FS -ES -VP -NP" set ADVPATCH=-FS -ES -VP -NP
if /i "%ADVPATCH%" EQU "-FS -NP -ES -VP" set ADVPATCH=-FS -NP -ES -VP
if /i "%ADVPATCH%" EQU "-FS -NP -VP -ES" set ADVPATCH=-FS -NP -VP -ES
if /i "%ADVPATCH%" EQU "-FS -VP -ES -NP" set ADVPATCH=-FS -VP -ES -NP
if /i "%ADVPATCH%" EQU "-FS -VP -NP -ES" set ADVPATCH=-FS -VP -NP -ES




::add leading space for patchcode
set patchcode= %ADVPATCH%
::remove leading dash and space for patchname
echo [%ADVPATCH:~1%]>temp\temp.txt
support\sfk filter -quiet temp\temp.txt -rep _" "__ -write -yes
set /p patchname= <temp\temp.txt
del temp\temp.txt>nul


if /i "%ADVPATCH%" EQU "-FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -ES -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -NP -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -FS -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -NP -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -FS -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -ES -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -ES -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -VP -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -FS -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -VP -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -FS -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -ES -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -NP -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -VP -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -FS -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -VP -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -NP -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -FS -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -NP -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -VP -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -ES -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -VP -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -ES -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -NP -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -FS -ES -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -FS -NP -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -ES -FS -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -ES -NP -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -NP -FS -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-VP -NP -ES -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -FS -ES -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -FS -VP -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -ES -FS -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -ES -VP -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -VP -FS -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-NP -VP -ES -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -FS -NP -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -FS -VP -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -NP -FS -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -NP -VP -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -VP -NP -FS" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-ES -VP -FS -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -ES -NP -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -ES -VP -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -NP -ES -VP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -NP -VP -ES" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -VP -ES -NP" goto:ADVPAGE3
if /i "%ADVPATCH%" EQU "-FS -VP -NP -ES" goto:ADVPAGE3


:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:ADVPAGE2


::------------------------------------ADVANCED page 3 - SLOT--------------------------------
:ADVPAGE3
set ADVSLOT=
set SLOTCODE=
set SLOTNAME=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo            Para cambiar la ranura de IOS # por %wadnameless%%patchname%
echo.
echo            Introduzca una nueva ranura IOS # ahora
echo.
echo.
echo.
echo.
support\sfk echo -spat \x20 [Red] ADVERTENCIA: Tenga cuidado con lo IOS ranura # que elija,
support\sfk echo -spat \x20 [Red]              si sobrescribe un IOSs crucial
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 [Red] PUEDE OBTENER BRICK
echo.
echo.
echo.
echo              Nota: Debe tener entre 3 y 254
echo.
echo.
echo                N = No, dejar sin cambios la ranura
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p ADVSLOT=     Escriba la seleccion aqui: 


::"B" will actually take u to the menu only to clear the download_queue, then it will return to advanced page1

if /i "%ADVSLOT%" EQU "M" goto:MENU


if /i "%ADVTYPE%" EQU "CIOS" goto:BACKTOMENUFIRST
if /i "%ADVSLOT%" EQU "B" goto:ADVPAGE2
:BACKTOMENUFIRST
if /i "%ADVSLOT%" EQU "B" goto:ADVANCED


set SLOTCODE= -slot %ADVSLOT%
set SLOTNAME=-slot%ADVSLOT%

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
echo Ha introducido una clave incorrecta
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
if /i "%ADVLIST%" EQU "2234" set versionreal=4
if /i "%ADVLIST%" EQU "24914" set versionreal=14
if /i "%ADVLIST%" EQU "24917" set versionreal=17
if /i "%ADVLIST%" EQU "2491937" set versionreal=19
if /i "%ADVLIST%" EQU "2491938" set versionreal=19
if /i "%ADVLIST%" EQU "2491957" set versionreal=19
if /i "%ADVLIST%" EQU "2492056" set versionreal=20
if /i "%ADVLIST%" EQU "2492057" set versionreal=20
if /i "%ADVLIST%" EQU "2492038" set versionreal=20
if /i "%ADVLIST%" EQU "2225" set versionreal=65535
if /i "%ADVLIST%" EQU "2235" set versionreal=65535
if /i "%ADVLIST%" EQU "2245" set versionreal=65535
if /i "%ADVLIST%" EQU "20251" set versionreal=65535
if /i "%ADVLIST%" EQU "22251" set versionreal=65535
if /i "%ADVLIST%" EQU "22351" set versionreal=65535
if /i "%ADVLIST%" EQU "22451" set versionreal=65535

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
echo                                       by XFlak
echo.
echo.
echo.
echo    Quieres cambiar la version # de %wadnameless%%patchname%%slotname%
echo.
echo.
echo                                Nota: MAX es 65535
echo.
echo.
echo              MAX = MAX (65535)
echo.
echo                N = No, dejar sin cambios la version (%versionreal%)
if /i "%VER%" EQU "*" goto:bypass
if /i "%versionreal%" NEQ "65535" echo.
if /i "%versionreal%" NEQ "65535" echo               V1 = Version + 1 (%versionplus1%)
:bypass
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p ADVVERSION=     Escriba la seleccion aqui: 



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
echo YHa introducido una clave incorrecta
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
echo                                       by XFlak
echo.
echo.
echo                               DESCARGA AVANZADA PERSONALIZADA
echo.
echo.

if /i "%changes%" EQU "none" goto:nochanges
echo          Son estos valores correctos?
echo.
echo.
echo.
echo      Descargar %wadname% y revision en consecuencia
echo.


if /i "%ADVTYPE%" NEQ "CIOS" goto:miniskip
if /i "%ADVSLOT%" EQU "N" goto:miniskip
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 cIOS[Red]%ADVSLOT%[def]%wadname:~7%[Red]%patchname%%slotname%%versionname%
goto:yeschanges
:miniskip

support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 %wadnameless%[Red]%patchname%%slotname%%versionname%
goto:yeschanges

:nochanges
echo.
echo.
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Yellow] You have not selected any changes to be made to %wadnameless%
echo.
echo.
echo                        Si desea descargar %wadnameless%
echo                puede hacerlo desde el lote/Paginas adicionales de descarga

:yeschanges
echo.
echo.
echo.
echo.

if /i "%changes%" NEQ "none" echo                Y = Si, colocar en la cola de descarga avanzada
echo.
echo                N = No, volver al Menu de descargas personalizadas
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p ADVCONFIRM=     Escriba la seleccion aqui: 


::"B" will actually take u to the menu only to clear the download_queue, then it will return to advanced page1
if /i "%ADVCONFIRM%" EQU "B" goto:ADVPAGE4
if /i "%ADVCONFIRM%" EQU "M" goto:MENU
if /i "%ADVCONFIRM%" EQU "N" goto:ADVANCED

if /i "%changes%" EQU "none" goto:nochanges2


if /i "%ADVCONFIRM%" EQU "Y" set /a AdvNumber=%AdvNumber%+1
if /i "%ADVCONFIRM%" EQU "Y" goto:SaveADVdlSettings

:nochanges2

echo Ha introducido una clave incorrecta
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
echo "set PATCHCODE=%PATCHCODE%">>temp\AdvDL%AdvNumber%.bat

::echo "goto:downloadstart">>temp\AdvDL%AdvNumber%.bat

echo "Advanced Download: %wadnameless%%patchname%%slotname%%versionname%">>temp\DLnamesADV.txt
echo "temp\AdvDL%AdvNumber%.bat">>temp\DLgotosADV.txt

support\sfk filter -quiet "temp\AdvDL%AdvNumber%.bat" -rep _"""__ -write -yes
support\sfk filter -quiet "temp\DLnamesADV.txt" -rep _"""__ -write -yes
support\sfk filter -quiet "temp\DLgotosADV.txt" -rep _"""__ -write -yes


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
echo                                       by XFlak
echo.
echo.
echo          Introduzca el numero de la IOS que desea descargar
::echo      ya sea en decimal (x,xx,xxx; ie. 9,60,249), i en Hex (xx; ie. F9=249)
echo          o introduzca "SM" o "MIOS" para descargar un menu del sistema o MIOS
echo.
echo.
echo.
support\sfk echo  -spat \x20 \x20 \x20 \x20 [Red] ADVERTENCIA: Asegurese de introducir el numero de IOS existente
echo.
echo.
echo.
echo.
echo               #  = Descargue el IOS numero
echo.
echo              SM  = Descarga un menu de sistema
echo.
echo             MIOS = Descargar un MIOS
echo.
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p DEC=     Escriba la seleccion aqui: 

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
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:CUSTOM



:CUSTOMPAGE2
set VER=
set ADVPATCH=
set patchcode=
set patchname=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if /i "%DEC%" EQU "SM" echo      Que version del menu de sistema desea descargar? (ie. XXX)
if /i "%DEC%" EQU "SM" goto:NEXT1
if /i "%DEC%" EQU "MIOS" echo      Que version de MIOS desea descargar? (ie. 4, 5, 8, 10)
if /i "%DEC%" EQU "MIOS" goto:NEXT1
echo      Que version de IOS %DEC% desea descargar?
:NEXT1
echo.
echo.
echo.
support\sfk echo  -spat \x20 \x20 \x20 \x20 \x20 \x20 [Red] ADVERTENCIAS:[def] - Asegurese de que la version que de entrada existe realmente
echo                        - Version mas reciente puede desactivarse
echo.
echo.
echo.
echo.
if /i "%DEC%" NEQ "SM" echo                * = Descargue la version mas reciente
if /i "%DEC%" EQU "SM" echo                * = Descargar el menu del sistema mas reciente de Corea
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
echo.
set /p VER=     Escriba la seleccion aqui: 

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
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:CUSTOMPAGE2




:CONFIRM
if /i "%ADVVERSION%" EQU "N" set VERSIONNAME=
if /i "%ADVVERSION%" EQU "N" set VERSIONCODE=


set VERFINAL=%VER%
if /i "%VER%" EQU "*" set VERFINAL=NEW



cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.

if /i "%DEC%" EQU "SM" echo      Seguro de que desea probar la descarga del menu del sistema v%VER%?
if /i "%DEC%" EQU "SM" goto:NEXT2
if /i "%DEC%" EQU "MIOS" echo      Seguro de que desea probar la descarga MIOS v%VER%?
if /i "%DEC%" EQU "MIOS" goto:NEXT2


echo          Esta seguro que desea intentar descargar
echo.
echo          IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%




:NEXT2
echo.
echo.
echo.
support\sfk echo  -spat \x20 \x20 \x20 \x20 [Red] ADVERTENCIA: Esta descarga no funcionara si el archivo no existe.
echo.
echo.
echo.
echo.
echo                Y = Si, colocar en la cola de descarga avanzada
echo.
echo                N = No, volver al Menu de descargas personalizadas
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p CONFIRM=     Escriba la seleccion aqui: 

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

echo Ha introducido una clave incorrecta
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

::echo "Descarga Avanzada: %wadnameless%%patchname%%slotname%%versionname%">>temp\DLnamesADV.txt

echo "temp\AdvDL%AdvNumber%.bat">>temp\DLgotosADV.txt

support\sfk filter -quiet "temp\AdvDL%AdvNumber%.bat" -rep _"""__ -write -yes
support\sfk filter -quiet "temp\DLnamesADV.txt" -rep _"""__ -write -yes
support\sfk filter -quiet "temp\DLgotosADV.txt" -rep _"""__ -write -yes
goto:Advanced




::------------------------------------ADVANCED - FORWARDER DOL or ISO--------------------------------
:FORWARDERDOLorISO
set FORWARDERDOLorISO=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo            Que tipo de Forwarder quieres construir?
echo.
echo.
echo.
echo.
echo                1 = DOL
echo.
echo                2 = ISO
echo.
echo                3 = Both
echo.
echo.
echo            Nota: ISO Forwarder requiere un cIOS con base 38 para poder trabajar.
echo                  Si se utiliza un cIOS D2X, asegurese de recargar IOS esta
echo                  configurado para "off".
echo.
echo.
echo.
echo            Advertencia: Incluso cuando se utiliza la configuracion recomendada,
echo                         no todos tienen exito con ISOs Forwarder, los resultados
echo                         pueden variar.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p FORWARDERDOLorISO=     Escriba la seleccion aqui: 

if /i "%FORWARDERDOLorISO%" EQU "M" goto:MENU
if /i "%FORWARDERDOLorISO%" EQU "B" goto:ADVANCED
if /i "%FORWARDERDOLorISO%" EQU "1" goto:FORWARDERDOLBUILDER
if /i "%FORWARDERDOLorISO%" EQU "2" goto:FORWARDERDOLBUILDER
if /i "%FORWARDERDOLorISO%" EQU "3" goto:FORWARDERDOLBUILDER

:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:FORWARDERDOLorISO



::------------------------------------ADVANCED - FORWARDER DOL BUILDER--------------------------------
:FORWARDERDOLBUILDER
set FORWARDERTYPE=
set URLPATH=
set path-0=
set path-1=
set path-2=
set path-3=
set path-4=
set path-5=
set path-6=
set path-7=
set path-8=
set path-9=
set path-10=
set NumberOfPaths=1
set bigt=1
set FORWARDERTITLEID=
set DISCID=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo            Que tipo de Forwarder quieres construir?
echo.
echo.
echo.
echo.
echo                1 = SD\USB Forwarder (v11b)
echo.
echo                2 = URL Forwarder (Requiere Canal Internet)
echo.
echo                3 = Canal Forwarder
echo.
echo.
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p FORWARDERTYPE=     Escriba la seleccion aqui: 

if /i "%FORWARDERTYPE%" EQU "M" goto:MENU
if /i "%FORWARDERTYPE%" EQU "B" goto:FORWARDERDOLorISO
if /i "%FORWARDERTYPE%" EQU "1" goto:v10FORWARDERDOL
if /i "%FORWARDERTYPE%" EQU "2" goto:INTERNETFORWARDERDOL
if /i "%FORWARDERTYPE%" EQU "3" goto:CHANNELFORWARDERDOL

:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:FORWARDERDOLBUILDER



::------------------------------------ADVANCED - FORWARDER DOL BUILDER--------------------------------
:v10FORWARDERDOL
set path-0=


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
if "%path-10%"=="" echo            Ruta de entrada forwarder #%NumberOfPaths%:
if not "%path-10%"=="" (support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 [Red] Numero maximo de caminos se ha llegado a) & (goto:maxreached)
echo.
echo.
echo            Nota: No pueden contener : * ? " < > | & %%
echo.
echo            Exemplos:
echo                     apps/usbloader_cfg/boot.dol
echo                     apps/HackMii_Installer/boot.elf
echo                     boot.elf
echo.
echo            Nota: La longitud maxima de la palabra es de 255 caracteres
:maxreached
echo.
if not "%path-1%"=="" echo     Path #1: %path-1%
if not "%path-2%"=="" echo     Path #2: %path-2%
if not "%path-3%"=="" echo     Path #3: %path-3%
if not "%path-4%"=="" echo     Path #4: %path-4%
if not "%path-5%"=="" echo     Path #5: %path-5%
if not "%path-6%"=="" echo     Path #6: %path-6%
if not "%path-7%"=="" echo     Path #7: %path-7%
if not "%path-8%"=="" echo     Path #8: %path-8%
if not "%path-9%"=="" echo     Path #9: %path-9%
if not "%path-10%"=="" echo     Path #10: %path-10%
echo.
echo.
if "%path-1%"=="" (echo.) else (echo                A = Colocar forwarder con las rutas de arriba para descargar la cola)
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p path-0=     Escriba la seleccion aqui: 

if "%path-0%"=="" goto:badkey

if /i "%path-0%" EQU "M" goto:MENU

if /i "%path-0%" NEQ "B" goto:notback
if /i "%NumberOfPaths%" EQU "1" goto:FORWARDERDOLBUILDER
if /i "%NumberOfPaths%" EQU "2" set path-1=
if /i "%NumberOfPaths%" EQU "3" set path-2=
if /i "%NumberOfPaths%" EQU "4" set path-3=
if /i "%NumberOfPaths%" EQU "5" set path-4=
if /i "%NumberOfPaths%" EQU "6" set path-5=
if /i "%NumberOfPaths%" EQU "7" set path-6=
if /i "%NumberOfPaths%" EQU "8" set path-7=
if /i "%NumberOfPaths%" EQU "9" set path-8=
if /i "%NumberOfPaths%" EQU "10" set path-9=
if /i "%NumberOfPaths%" EQU "11" set path-10=
set /a NumberOfPaths=%NumberOfPaths%-1
goto:v10FORWARDERDOL
:notback

if "%path-1%"=="" goto:none
if /i "%path-0%" EQU "A" set beforeAddforwardertoQueue=v10FORWARDERDOL
if /i "%path-0%" EQU "A" goto:FORWARDERNAME
:none

if /i "%NumberOfPaths%" EQU "11" goto:badkey

::make sure last 4 chars are .dol or .elf
if /i "%path-0:~-4%" EQU ".dol" goto:good
if /i "%path-0:~-4%" EQU ".elf" goto:good
goto:badkey
:good

::make sure path doesn't start with a \ or /
:doublecheckF
if /i "%path-0:~0,1%" EQU "\" (set path-0=%path-0:~1%) & (goto:doublecheckF)
if /i "%path-0:~0,1%" EQU "/" (set path-0=%path-0:~1%) & (goto:doublecheckF)

::limit user input to X# of digits
if not "%path-0:~255%"=="" (goto:badkey)

::replace : * ? " < > |
support\sfk filter -quiet -spat temp\temp.bat -rep _\x3a__ -rep _\x2a__ -rep _\x3f__ -rep _\x3c__ -rep _\x3e__ -rep _\x7c__ -rep _\x22__ -write -yes

::replace all \ with / and set path-# = path-0 (must end with .dol or .elf, so will not end with #)
echo set path-%NumberOfPaths%=%path-0%>temp\temp.bat
support\sfk filter temp\temp.bat -rep _\_/_ -write -yes>nul
call temp\temp.bat
del temp\temp.bat>nul

set /a NumberOfPaths=%NumberOfPaths%+1
goto:v10FORWARDERDOL

:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:v10FORWARDERDOL




::------------------------------------ADVANCED - FORWARDER NAME--------------------------------
:FORWARDERNAME
set FORWARDERNAME=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.

if /i "%FORWARDERTYPE%" NEQ "1" goto:skip
echo            Please enter a name for your forwarder with the following paths
echo.
if not "%path-1%"=="" echo     Path #1: %path-1%
if not "%path-2%"=="" echo     Path #2: %path-2%
if not "%path-3%"=="" echo     Path #3: %path-3%
if not "%path-4%"=="" echo     Path #4: %path-4%
if not "%path-5%"=="" echo     Path #5: %path-5%
if not "%path-6%"=="" echo     Path #6: %path-6%
if not "%path-7%"=="" echo     Path #7: %path-7%
if not "%path-8%"=="" echo     Path #8: %path-8%
if not "%path-9%"=="" echo     Path #9: %path-9%
if not "%path-10%"=="" echo     Path #10: %path-10%
:skip

if /i "%FORWARDERTYPE%" NEQ "2" goto:skip
echo       Por favor, introduzca un nombre para su forwarder, con las siguientes rutas
echo.
echo            %URLpath%
:skip

if /i "%FORWARDERTYPE%" NEQ "3" goto:skip
echo        Por favor, introduzca un nombre para su forwarder para
echo                   el canal titulo ID siguiente:
echo.
echo        %FORWARDERTITLEID%
:skip

echo.
echo.
echo            Nota: No puede contener \ / : * ? " < > | & %%
echo.
if /i "%FORWARDERTYPE%" EQU "2" (echo            Exemplo: Wiibrew) else (echo            Exemplo: usbloader)
echo.
echo.



echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p FORWARDERNAME=     Escriba la seleccion aqui: 

if "%FORWARDERNAME%"=="" goto:badkey

echo "set FORWARDERNAME=%FORWARDERNAME%">temp\temp.bat

support\sfk filter -quiet -spat temp\temp.bat -rep _\x5c__ -rep _\x2f__ -rep _\x3a__ -rep _\x2a__ -rep _\x3f__ -rep _\x3c__ -rep _\x3e__ -rep _\x7c__ -rep _\x22__ -write -yes

if /i "%FORWARDERNAME%" EQU "M" goto:MENU
if /i "%FORWARDERNAME%" EQU "B" goto:%beforeAddforwardertoQueue%

call temp\temp.bat
del temp\temp.bat>nul


if /i "%FORWARDERDOLorISO%" NEQ "1" goto:DISCID

goto:SaveADVdlSettingsFORWARDER

:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:FORWARDERNAME


:SaveADVdlSettingsFORWARDER

set /a AdvNumber=%AdvNumber%+1

if /i "%FORWARDERDOLorISO%" EQU "1" echo "set name=Advanced Download: Forwarder - %FORWARDERNAME% DOL">temp\AdvDL%AdvNumber%.bat
if /i "%FORWARDERDOLorISO%" EQU "2" echo "set name=Advanced Download: Forwarder - %FORWARDERNAME% ISO">temp\AdvDL%AdvNumber%.bat
if /i "%FORWARDERDOLorISO%" EQU "3" echo "set name=Advanced Download: Forwarder - %FORWARDERNAME% DOL and ISO">temp\AdvDL%AdvNumber%.bat

echo "set wadname=%FORWARDERNAME%">>temp\AdvDL%AdvNumber%.bat
echo "set FORWARDERNAME=%FORWARDERNAME%">>temp\AdvDL%AdvNumber%.bat
echo "set path-1=%path-1%">>temp\AdvDL%AdvNumber%.bat
echo "set path-2=%path-2%">>temp\AdvDL%AdvNumber%.bat
echo "set path-3=%path-3%">>temp\AdvDL%AdvNumber%.bat
echo "set path-4=%path-4%">>temp\AdvDL%AdvNumber%.bat
echo "set path-5=%path-5%">>temp\AdvDL%AdvNumber%.bat
echo "set path-6=%path-6%">>temp\AdvDL%AdvNumber%.bat
echo "set path-7=%path-7%">>temp\AdvDL%AdvNumber%.bat
echo "set path-8=%path-8%">>temp\AdvDL%AdvNumber%.bat
echo "set path-9=%path-9%">>temp\AdvDL%AdvNumber%.bat
echo "set path-10=%path-10%">>temp\AdvDL%AdvNumber%.bat
echo "set URLPATH=%URLPATH%">>temp\AdvDL%AdvNumber%.bat
echo "set FORWARDERTITLEID=%FORWARDERTITLEID%">>temp\AdvDL%AdvNumber%.bat
echo "set bigt=%bigt%">>temp\AdvDL%AdvNumber%.bat
echo "set category=FORWARDER">>temp\AdvDL%AdvNumber%.bat
echo "set FORWARDERTYPE=%FORWARDERTYPE%">>temp\AdvDL%AdvNumber%.bat
echo "set FORWARDERDOLorISO=%FORWARDERDOLorISO%">>temp\AdvDL%AdvNumber%.bat
echo "set DISCID=%DISCID%">>temp\AdvDL%AdvNumber%.bat

if /i "%FORWARDERDOLorISO%" EQU "1" echo "Advanced Download: Forwarder - %FORWARDERNAME% DOL">>temp\DLnamesADV.txt
if /i "%FORWARDERDOLorISO%" EQU "2" echo "Advanced Download: Forwarder - %FORWARDERNAME% ISO">>temp\DLnamesADV.txt
if /i "%FORWARDERDOLorISO%" EQU "3" echo "Advanced Download: Forwarder - %FORWARDERNAME% DOL and ISO">>temp\DLnamesADV.txt

echo "temp\AdvDL%AdvNumber%.bat">>temp\DLgotosADV.txt

support\sfk filter -quiet "temp\AdvDL%AdvNumber%.bat" -rep _"""__ -write -yes
support\sfk filter -quiet "temp\DLnamesADV.txt" -rep _"""__ -write -yes
support\sfk filter -quiet "temp\DLgotosADV.txt" -rep _"""__ -write -yes

goto:Advanced



::------------------------------------ADVANCED - FORWARDER DOL BUILDER--------------------------------
:INTERNETFORWARDERDOL
set URLpath=


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo            Entrada URL del sitio web
echo.
echo.
echo            Exemplo: www.wiibrew.org
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20\x20\x20\x20 Nota: * URL No puede contener \x25, \x26, or \x22
echo                  * Longitud de la URL maxima es de 95 caracteres
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p URLpath=     Escriba la seleccion aqui: 

if /i "%URLpath%" EQU "M" goto:MENU
if /i "%URLpath%" EQU "B" goto:FORWARDERDOLBUILDER
if "%URLpath%"=="" goto:badkey

::limit user input to X# of digits
if not "%URLpath:~95%"=="" (goto:badkey)



::replace all \ with /
echo set URLPATH=%URLpath% >temp\temp.bat
support\sfk filter -quiet temp\temp.bat -rep _\_/_ -write -yes
call temp\temp.bat
set URLPATH=%URLPATH:~0,-1%

set beforeAddforwardertoQueue=INTERNETFORWARDERDOL
goto:FORWARDERNAME

:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:INTERNETFORWARDERDOL



::------------------------------------ADVANCED - CHANNEL FORWARDER DOL BUILDER--------------------------------
:CHANNELFORWARDERDOL
set FORWARDERTITLEID=


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo            Introduzca el ID de titulo de 4 caracteres para el canal que desea cargar
echo        O introduzca el valor hexadecimal del canal, separando cada byte con una coma
echo.
echo            Exemplos:
echo                     IDCL
echo                     49,44,43,4c
echo.
echo.
echo            Tipo canal: %bigt%
echo.
echo            o introduzca "1", "2", "4" o "8" cambiar el tipo de canal
echo.
echo        Nota: Los ID del siguiente titulo se vera obligado como el tipo de canal 2
echo              HAAA HABA HACA HAFA HAFE HAFJ HAFP HAGA HAGE HAGJ HAGP HAYA
echo.
echo.
echo            B = Atras
echo.
echo            M = Menu Principal
echo.
echo.
echo.
set /p FORWARDERTITLEID=     Escriba la seleccion aqui: 

if /i "%FORWARDERTITLEID%" EQU "M" goto:MENU
if /i "%FORWARDERTITLEID%" EQU "B" goto:FORWARDERDOLBUILDER
if "%FORWARDERTITLEID%"=="" goto:badkey

if /i "%FORWARDERTITLEID%" EQU "1" (set bigt=1) & (goto:CHANNELFORWARDERDOL)
if /i "%FORWARDERTITLEID%" EQU "2" (set bigt=2) & (goto:CHANNELFORWARDERDOL)
if /i "%FORWARDERTITLEID%" EQU "4" (set bigt=4) & (goto:CHANNELFORWARDERDOL)
if /i "%FORWARDERTITLEID%" EQU "8" (set bigt=8) & (goto:CHANNELFORWARDERDOL)

::minimum number of chars = x+1 (ie. ~5 sets minimum of 6)
if "%FORWARDERTITLEID:~3%"=="" (goto:badkey)

::limit user input to X# of digits
if not "%FORWARDERTITLEID:~11%"=="" (goto:badkey)

::if more than 4 chars then check if hex
if "%FORWARDERTITLEID:~4%"=="" goto:nocheckhex
if /i "%FORWARDERTITLEID:~2,1%" NEQ "," goto:badkey
if /i "%FORWARDERTITLEID:~5,1%" NEQ "," goto:badkey
if /i "%FORWARDERTITLEID:~8,1%" NEQ "," goto:badkey
:nocheckhex

set beforeAddforwardertoQueue=CHANNELFORWARDERDOL
goto:FORWARDERNAME

:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:CHANNELFORWARDERDOL


::------------------------------------ADVANCED - Forwarder ISO Name--------------------------------
:DISCID
set DISCID=


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo            Introduzca la ID de 6 caracteres que desea la ISO para su uso.
echo.
echo.
echo            Nota: solo debe contener numeros y\o letras.
echo                  Para obtener los mejores resultados, utilice este formato: D**A00
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p DISCID=     Escriba la seleccion aqui: 

if /i "%DISCID%" EQU "M" goto:MENU
if /i "%DISCID%" EQU "B" goto:FORWARDERNAME

::minimum number of chars = x+1 (ie. ~5 sets minimum of 6)
if "%DISCID:~5%"=="" (goto:badkey)

::limit user input to X# of digits
if not "%DISCID:~6%"=="" (goto:badkey)

goto:SaveADVdlSettingsFORWARDER

:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DISCID

::...................................CONFIG File Menu...............................
:CONFIGFILEMENU
set configfile=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo          Que la aplicacion Wii quieres configurar?
echo.
echo.
echo.
echo          BM = BootMii (crear bootmii.ini)
echo.
echo         MMM = Multi-Mod Manager (crear mmmconfig.txt)
echo.
echo          WM = Wad Manager (crear wm_config.txt)
echo.
echo.
echo.
echo.
echo           B = Atras
echo.
echo           M = Menu Principal
echo.
echo.
echo.
echo.
set /p configfile=     Escriba la seleccion aqui: 

if /i "%configfile%" EQU "M" goto:MENU
if /i "%configfile%" EQU "B" goto:MENU

if /i "%configfile%" EQU "BM" goto:BMCONFIG
if /i "%configfile%" EQU "WM" goto:WMCONFIG
if /i "%configfile%" EQU "MMM" goto:MMMCONFIG


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:CONFIGFILEMENU




::...................................BootMii CONFIGURATOR (bootmii.ini)...............................
:BMCONFIG
set BMVIDEO=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo                 Esto creara un archivo en bootmii.ini %DRIVE%\bootmii\
echo                 para determinar como BootMii se pone en marcha.
echo.
echo.
echo.
echo.
echo      Ingrese el modo de video que desea utilizar BootMii:
echo.
echo.
echo.
echo                 N = NTSC
echo                50 = PAL50
echo                60 = PAL60
echo                 P = Progresivo
echo.
echo.
echo.
echo.
echo                 B = Atras
echo.
echo                 M = Menu Principal
echo.
echo.
echo.
echo.
set /p BMVIDEO=     Escriba la seleccion aqui: 

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

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG







::...................................BootMii CONFIGURATOR (bootmii.ini)...............................
:BMCONFIG2
set BMBOOT=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      Te gustaria BootMii con arranque automatico?
echo.
echo.
echo.
echo                 O = OFF     (BootMii)
echo                 H = HBC     (Homebrew Channel)
echo                 S = SYSMENU (Menu Sistema)
echo.
echo.
echo.
echo.
echo                 B = Atras
echo.
echo                 M = Menu Principal
echo.
echo.
echo.
echo.
set /p BMBOOT=     Escriba la seleccion aqui: 

if /i "%BMBOOT%" EQU "M" goto:MENU
if /i "%BMBOOT%" EQU "B" goto:BMCONFIG

if /i "%BMBOOT%" EQU "O" set BMBOOT=OFF
if /i "%BMBOOT%" EQU "H" set BMBOOT=HBC
if /i "%BMBOOT%" EQU "S" set BMBOOT=SYSMENU

if /i "%BMBOOT%" EQU "OFF" set BMDELAY=0
if /i "%BMBOOT%" EQU "OFF" goto:BMCONFIG4
if /i "%BMBOOT%" EQU "HBC" goto:BMCONFIG3
if /i "%BMBOOT%" EQU "SYSMENU" goto:BMCONFIG3

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG2



::...................................BootMii CONFIGURATOR (bootmii.ini)...............................
:BMCONFIG3
set BMDELAY=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
if /i "%BMBOOT%" EQU "HBC" echo           Cuantos segundos debe esperar BootMii para
if /i "%BMBOOT%" EQU "HBC" echo           arrancan automaticamente el canal homebrew?
if /i "%BMBOOT%" EQU "SYSMENU" echo           Cuantos segundos debe esperar BootMii para
if /i "%BMBOOT%" EQU "SYSMENU" echo           arrancan automaticamente el menu del sistema?
echo.
echo.
echo.
echo.
echo          Posibles ajustes:
echo.
echo                 0,1,2,3,4,5,6,7,8,9,10
echo.
echo.
echo.
echo.
echo                 B = Atras
echo.
echo                 M = Menu Principal
echo.
echo.
echo.
echo.
set /p BMDELAY=     Escriba la seleccion aqui: 

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

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG3





::...................................BootMii CONFIGURATOR (bootmii.ini)...............................
:BMCONFIG4
set BMSD=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      Le gustaria la descarga de BootMii y los archivos a la SD necesarios
echo      para poner en marcha BootMii?
echo.
echo.
echo.
echo      Nota: estos son los mismos archivos generados por el HackMii Installer
echo            mediante la instalacion de BootMii como boot2 o mediante la
echo            preparacion de una tarjeta SD
echo.
echo.
echo.
echo                 Y = Si
echo.
echo                 N = No
echo.
echo.
echo.
echo.
echo                 B = Atras
echo.
echo                 M = Menu Principal
echo.
echo.
echo.
echo.
set /p BMSD=     Escriba la seleccion aqui: 

if /i "%BMSD%" EQU "M" goto:MENU

if /i "%BMBOOT%" EQU "OFF" goto:skip
if /i "%BMSD%" EQU "B" goto:BMCONFIG3
:skip
if /i "%BMSD%" EQU "B" goto:BMCONFIG2

if /i "%BMSD%" EQU "Y" goto:BMCONFIG5
if /i "%BMSD%" EQU "N" goto:BMCONFIG5


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:BMCONFIG4






::...................................BootMii CONFIGURATOR page 5...............................
:BMCONFIG5
set BMCONFIRM=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo                              Son estos valores correctos?
echo.
echo.
echo      Modo video ajustado a %BMVIDEO%
echo.
echo      arranque automatico establecido con %BMBOOT%
if /i "%BMBOOT%" EQU "OFF" goto:nodelay
echo.
echo      arranque automatico con Retardo se establece en %BMDELAY% segundos
:nodelay
echo.
if /i "%BMSD%" EQU "Y" echo      * Descargar BootMii SD Archivos para lanzar BootMii
echo.
echo.
echo.
echo.
echo.
echo      Y = Si, crear bootmii.ini con estos ajustes
if exist "%Drive%"\bootmii\bootmii.ini echo           Nota: bootmii.ini existente se sobrescribira
echo.
echo      N = No, llevarme de regreso al menu principal
echo.
echo.
echo.
echo      B = Atras
echo.
echo.
echo      M = Menu Principal
echo.
echo.
echo.
echo.
set /p BMCONFIRM=     Escriba la seleccion aqui: 

if /i "%BMCONFIRM%" EQU "B" goto:BMCONFIG4
if /i "%BMCONFIRM%" EQU "M" goto:MENU
if /i "%BMCONFIRM%" EQU "N" goto:MENU
if /i "%BMCONFIRM%" EQU "Y" goto:BUILDBMCONFIG

echo Ha introducido una clave incorrecta
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
support\sfk filter "%Drive%"\bootmii\bootmii.ini -rep _BLAH_%BMDELAY%_ -write -yes>nul

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
echo                                       by XFlak
echo.
echo.
echo.
echo      Esto creara un archivo wm_config.txt en %DRIVE%\WAD\, and it is optional.
echo      Usted recibira todas las indicaciones si no dispone de este archivo.
echo.
echo.
echo      Nota: solo funciona para YAWMM, Wad Manager Multi-Mod y
echo            Carpetas Mod WAD Manager
echo.
echo.
echo.
echo.
echo      Introduzca el IOS # que le gustaria en Wad Manager para cargar automaticamente
echo.
echo              Nota: MAX es 254
echo                    Las opciones mas comunes son 36, 249, 250, etc.
echo                    NAND Emulacion instalacion solo esta disponible para 249 o 250
echo.
echo.
echo.
echo      N = Ninguno (Wad Manager le pedira la seleccion)
echo.
echo.
echo.
echo      B = Atras
echo.
echo      M = Menu Principal
echo.
echo.
echo.
echo.
set /p WMCIOS=     Escriba la seleccion aqui: 

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
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WMCONFIG


::...................................WAD MANAGER CONFIGURATOR page 2...............................
:WMCONFIG2
set WMDEVICE=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo       Introduzca el dispositivo FAT que usted quiere cargar de forma automatica.
echo.
echo.
echo.
echo                  Nota: puede introducir el numero o la palabra
echo.
echo.
echo.
echo.
echo      1 = SD
echo      2 = USB
echo      3 = USB2
echo      4 = GCSDA
echo      5 = GCSDA
echo.
echo      N = Ninguno (Wad Manager le pedira la seleccion)
echo.
echo.
echo.
echo.
echo      B = Atras
echo.
echo      M = Menu Principal
echo.
echo.
echo.
echo.
set /p WMDEVICE=     Escriba la seleccion aqui: 

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



echo Ha introducido una clave incorrecta
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
echo                                       by XFlak
echo.
echo.
echo      Emulacion NAND
echo.
echo      Introduzca el dispositivo NAND que le gustaria para seleccionar
echo      de forma automatica.
echo.
echo.
echo          Nota: Las herramientas de PC como ShowMiiWads son mejores para la
echo                instalacion de Wads de nand emulada. Por lo que se recomienda
echo                dejar la emulacion NAND desabilitada
echo.
echo          Nota: puede introducir el numero o la palabra
echo.
echo.
echo.
echo      1 = Deshabilitar
echo      2 = USB
echo      3 = SD
echo.
echo      N = Ninguno (Wad Manager le pedira si es cIOS249 o cIOS250 seleccionado)
echo.
echo.
echo.
echo.
echo      B = Atras
echo.
echo      M = Menu Principal
echo.
echo.
echo.
echo.
set /p WMNAND=     Escriba la seleccion aqui: 


if /i "%WMNAND%" EQU "3" SET WMNAND=SD
if /i "%WMNAND%" EQU "2" SET WMNAND=USB
if /i "%WMNAND%" EQU "1" SET WMNAND=Disable


if /i "%WMNAND%" EQU "SD" goto:WMCONFIG4
if /i "%WMNAND%" EQU "USB" goto:WMCONFIG4
if /i "%WMNAND%" EQU "Disable" goto:WMCONFIG4
if /i "%WMNAND%" EQU "N" goto:WMCONFIG4
if /i "%WMNAND%" EQU "M" goto:MENU
if /i "%WMNAND%" EQU "B" goto:WMCONFIG2


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:WMCONFIG3

::...................................WAD MANAGER CONFIGURATOR page 4...............................
:WMCONFIG4
set WMPATH=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      Introduzca la ruta de arranque que le gustaria para la carga inicial.
echo.
echo          Nota: Si usted no tiene un startupPath, el valor por defecto es /WAD
echo.
echo          Nota: Asegurese de que la ruta existe, de lo contrario se producira
echo                un error.
echo.
echo.
echo.
echo.
echo          Exemplos:
echo                   /WAD/Forwarders
echo                   /myWad
echo                   /
echo                      Nota: '/' establece el StartupPath a la raiz del dispositivo
echo.
echo.
echo      N = Ninguno (el valor predeterminado es /WAD)
echo.
echo.
echo.
echo.
echo      B = Atras
echo.
echo      M = Menu Principal
echo.
echo.
echo.
echo.
set /p WMPATH=     Escriba la seleccion aqui: 


if /i "%WMPATH%" EQU "N" SET WMPATH=/WAD
if /i "%WMPATH%" EQU "B" goto:WMCONFIG4BACK
if /i "%WMPATH%" EQU "M" goto:MENU
IF "%WMPATH%"=="" echo Ha introducido una clave incorrecta
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
echo                                       by XFlak
echo.
echo.
echo.
echo      Escriba un password para acceder al WAD Manager solo con LRUD, donde
echo.
echo         L = Izquierda
echo         R = Derecha
echo         U = Arriba
echo         D = Abajo
echo.
echo      Nota: El password se introduce en el Wiimote o controlador de GC,
echo            un maximo de 10 caracteres
echo.
echo      Nota: Si usted no tiene un password, el valor predeterminado es
echo            sin password
echo.
echo.
echo.
echo.
echo          Exemplos:
echo                   UDLR
echo                   UDLRUDLRUD
echo                   UUUUUUU
echo                   L
echo.
echo.
echo      N = Ninguno (sin password)
echo.
echo.
echo.
echo.
echo      B = Atras
echo.
echo      M = Menu Principal
echo.
echo.
echo.
echo.
set /p WMPASS=     Escriba la seleccion aqui: 

if /i "%WMPASS%" EQU "B" goto:WMCONFIG4
if /i "%WMPASS%" EQU "M" goto:MENU

IF "%WMPASS%"=="" echo Ha introducido una clave incorrecta
IF "%WMPASS%"=="" @ping 127.0.0.1 -n 2 -w 1000> nul
IF "%WMPASS%"=="" goto:WMCONFIG5


::limit user input to X# of digits
if not "%WMPASS:~10%"=="" (
    echo. ERROR: Password cannot be more than 10 Digits
    @ping 127.0.0.1 -n 2 -w 1000> nul
    goto:WMCONFIG5
)



::...................................WAD MANAGER CONFIGURATOR page 6...............................
:WMCONFIG6
set WMCONFIRM=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo                              Son estos valores correctos?
echo.
echo.
if /i "%WMCIOS%" EQU "N" echo      Sistema de seleccion de cIOS
if /i "%WMCIOS%" NEQ "N" echo      Version-cIOS=%WMCIOS%
echo.
if /i "%WMDEVICE%" EQU "N" echo      Seleccion rapida de dispositivos FAT
if /i "%WMDEVICE%" NEQ "N" echo      Dispositivo-Fat=%WMDEVICE%
echo.
if /i "%WMCIOS%" EQU "249" goto:nanddevice
if /i "%WMCIOS%" EQU "250" goto:nanddevice
goto:skipnanddevice

:nanddevice
if /i "%WMNAND%" EQU "N" echo      Sistema Seleccion del dispositivo NAND
if /i "%WMNAND%" NEQ "N" echo      Dispositivo-NAND=%WMNAND%
echo.
:skipnanddevice

echo      StartupPath=%WMPATH%
echo.
if /i "%WMPASS%" EQU "N" echo      No Password
if /i "%WMPASS%" NEQ "N" echo      Password=%WMPASS%
echo.
echo.
echo.
echo.
echo      Y = Si, crear wm_config.txt con estos ajustes
if exist "%Drive%"\WAD\wm_config.txt echo           ota: wm_config.txt existente se sobrescribe
echo.
echo      N = No, volver al menu principal
echo.
echo.
echo.
echo      B = Atras
echo.
echo      M = Menu Principal
echo.
echo.
echo.
echo.
set /p WMCONFIRM=     Escriba la seleccion aqui: 

if /i "%WMCONFIRM%" EQU "B" goto:WMCONFIG5
if /i "%WMCONFIRM%" EQU "M" goto:MENU
if /i "%WMCONFIRM%" EQU "N" goto:MENU
if /i "%WMCONFIRM%" EQU "Y" goto:BUILDWMCONFIG

echo Ha introducido una clave incorrecta
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
echo                                       by XFlak
echo.
echo.
echo.
echo      Esto creara el archivo mmmconfig.txt en %DRIVE%\, y es opcional.
echo.
echo.
echo.
echo.
echo      Introduzca el IOS # le gustaria que Multi-Mod Manager (MMM) se cargue
echo      automaticamente
echo.
echo.
echo              Nota: Max es 254
echo                    Las opciones mas comunes son 36, 249, 250, etc.
echo.
echo.
echo.
echo      N = Ninguno (No Auto-Recargar IOS)
echo.
echo.
echo.
echo      B = Atras
echo.
echo      M = Menu Principal
echo.
echo.
echo.
echo.
set /p WMCIOS=     Escriba la seleccion aqui: 

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
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:MMMCONFIG


::...................................MMM CONFIGURATOR (mmmconfig.txt) page 2...............................
:MMMCONFIG2
set WMDEVICE=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      Introduzca el dispositivo FAT que usted quiere cargar de forma automatica.
echo.
echo          Nota: puede introducir el numero o la palabra
echo.
echo.
echo.
echo.
echo      1 = SD (por defecto si mmmconfig.txt no existe)
echo      2 = USB
echo      3 = SMB
echo.
echo      N = Ninguno (MMM le pedira la seleccion)
echo.
echo.
echo.
echo.
echo      B = Atras
echo.
echo      M = Menu Principal
echo.
echo.
echo.
echo.
set /p WMDEVICE=     Escriba la seleccion aqui: 


if /i "%WMDEVICE%" EQU "1" SET WMDEVICE=sd
if /i "%WMDEVICE%" EQU "2" SET WMDEVICE=usb
if /i "%WMDEVICE%" EQU "3" SET WMDEVICE=smb

if /i "%WMDEVICE%" EQU "sd" goto:MMMCONFIG3
if /i "%WMDEVICE%" EQU "usb" goto:MMMCONFIG3
if /i "%WMDEVICE%" EQU "smb" goto:MMMCONFIG3

if /i "%WMDEVICE%" EQU "N" goto:MMMCONFIG3

if /i "%WMDEVICE%" EQU "B" goto:MMMCONFIG
if /i "%WMDEVICE%" EQU "M" goto:MENU



echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:MMMCONFIG2



::...................................MMM CONFIGURATOR (mmmconfig.txt) page 3...............................
:MMMCONFIG3
set WMPATH=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo      Introduzca la ruta de arranque que le gustaria para la carga inicial.
echo.
echo          Nota: Si usted no tiene un startupPath, el valor por defecto es /WAD
echo.
echo          Nota: Asegurese de que la ruta existe, de lo contrario obtendra un error.
echo.
echo.
echo.
echo.
echo          Exemplos:
echo                   /WAD/Forwarders
echo                   /myWad
echo                   /
echo                      Nota: '/' establece el StartupPath en la raiz del dispositivo
echo.
echo.
echo      N = Ninguno (por defecto es /WAD)
echo.
echo.
echo.
echo      B = Atras
echo.
echo      M = Menu Principal
echo.
echo.
echo.
echo.
set /p WMPATH=     Escriba la seleccion aqui: 


if /i "%WMPATH%" EQU "N" SET WMPATH=/WAD
if /i "%WMPATH%" EQU "B" goto:MMMCONFIG2
if /i "%WMPATH%" EQU "M" goto:MENU

IF "%WMPATH%"=="" echo Ha introducido una clave incorrecta
IF "%WMPATH%"=="" @ping 127.0.0.1 -n 2 -w 1000> nul
IF "%WMPATH%"=="" goto:MMMCONFIG3

::...................................MMM CONFIGURATOR (mmmconfig.txt) page 4...............................
:MMMCONFIG4
set WMCONFIRM=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo.
echo                              Son estos valores correctos?
echo.
echo.
if /i "%WMCIOS%" EQU "N" echo      No Auto-Recargar el IOS
if /i "%WMCIOS%" NEQ "N" echo      Carga-automatica=%WMCIOS%
echo.
if /i "%WMDEVICE%" EQU "N" echo      Seleccion rapida de dispositivos FAT
echo.
if /i "%WMDEVICE%" NEQ "N" echo      Dispositivo-FAT=%WMDEVICE%

echo      StartupPath=%WMPATH%
echo.
echo.
echo.
echo.
echo      Y = Si, crear mmmconfig.txt con estos ajustes
if exist "%Drive%"\mmmconfig.txt echo           Nota: mmmconfig.txt existente se sobrescribira
echo.
echo      N = No, volver al menu principal
echo.
echo.
echo      B = Atras
echo.
echo      M = Menu Principal
echo.
echo.
echo.
echo.
set /p WMCONFIRM=     Escriba la seleccion aqui: 

if /i "%WMCONFIRM%" EQU "B" goto:MMMCONFIG3
if /i "%WMCONFIRM%" EQU "M" goto:MENU
if /i "%WMCONFIRM%" EQU "N" goto:MENU
if /i "%WMCONFIRM%" EQU "Y" goto:BUILDMMMCONFIG

echo Ha introducido una clave incorrecta
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




::----------------------------------------sysCheck Selector-------------------------------------
:sysCheckName
set sysCheckName=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo      Introduzca la ruta\nombre del registro sysCheck.csv que se desea analizar.
echo.
echo.
echo      Usted puede hacer esto arrastrando y soltando el archivo en la ventana
echo      luego pulsar Intro.
echo.
echo.
echo.
echo      Nota: Se puede descargar de la pagina de descarga 2 de ModMii sysCheck.
echo            Simplemente guardarla en tu tarjeta SD o disco duro FAT32 y ejecutelo
echo            desde el Homebrew Channel. A continuacion, guardar el registro
echo            sysCheck.csv en la raiz de su tarjeta SD o disco duro FAT32.
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p sysCheckName=     Escriba la seleccion aqui: 

echo "set sysCheckName=%sysCheckName%">temp\temp.txt
support\sfk filter -quiet temp\temp.txt -rep _""""__>temp\temp.bat
call temp\temp.bat
del temp\temp.bat>nul
del temp\temp.txt>nul

if "%sysCheckName%"=="" goto:badkey

if /i "%sysCheckName%" EQU "M" goto:MENU
if /i "%sysCheckName%" EQU "B" goto:MENU

if /i "%sysCheckName:~-4%" NEQ ".csv" goto:badkey

if not exist "%sysCheckName%" goto:badkey

findStr /I /C:"syscheck" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (echo This is not a valid syscheck report) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:sysCheckName)

goto:sysCheckAnalyzer

:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:sysCheckName


::----------------------------------------sysCheck Analyzer-------------------------------------
:sysCheckAnalyzer
cls

::get syscheck version
copy /y "%sysCheckName%" temp\syscheck.txt>nul
support\sfk filter -quiet temp\syscheck.txt -ls+"sysCheck" -rep _"sysCheck v"__ -rep _" by*"__ -write -yes
set /p syscheckversion= <temp\syscheck.txt
del temp\syscheck.txt>nul

::get firmware info (ie. "System Menu 4.3E")
copy /y "%sysCheckName%" temp\syscheck.txt>nul
support\sfk filter -quiet temp\syscheck.txt -ls+"System Menu " -rep _"*System Menu "__ -rep _" *"__ -rep _",*"__ -write -yes
set /p firmstart= <temp\syscheck.txt


set region=%firmstart:~-1%
set firmstart=%firmstart:~0,-1%
if /i "%firmstart:~0,1%" EQU "3" set firmstart=3.X
if /i "%firmstart:~0,1%" EQU "2" set firmstart=o
::echo %firmstart%%region%
del temp\syscheck.txt>nul

set firm=%firmstart%



set firmwarechange=no
if /i "%firmstart%" EQU "4.0" set firmwarechange=yes
if /i "%firmstart%" EQU "3.x" set firmwarechange=yes
if /i "%firmstart%" EQU "o" set firmwarechange=yes

if /i "%firmwarechange%" EQU "no" goto:noSM
set firm=4.1
if /i "%REGION%" EQU "U" set SM4.1U=*
if /i "%REGION%" EQU "E" set SM4.1E=*
if /i "%REGION%" EQU "J" set SM4.1J=*
if /i "%REGION%" EQU "K" set SM4.1K=*
:noSM


::check if priiloader is installed
set pri=
if /i "%firmwarechange%" EQU "yes" (set pri=*) & (goto:skipprianalysis)
if /i "%syscheckversion%" EQU "2.0.1" goto:skipprianalysis
::note: Priiloader is spelled wrong in syscheck logs
findStr /I /C:"Priilaoder installed" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set pri=*) else (set pri=)
:skipprianalysis


if /i "%syscheckversion%" NEQ "2.0.1" goto:nopriconfirmation
if /i "%pri%" EQU "*" goto:nopriconfirmation


:Prisyscheck

::---------------CMD LINE MODE-------------
if /i "%cmdlinemode%" NEQ "Y" goto:cmdskip
if /i "%PRICMD%" EQU "Y" set pri=*
goto:nopriconfirmation
:cmdskip

set Prisyscheck=
cls
echo No se puede determinar si se ha instalado con priiloader los
echo registros sysCheck v2.0.1
echo.
echo �Ya tiene priiloader instalado? (Y/N)
echo.
echo Si usted no sabe, intente acceder a Priiloader apagando la Wii,
echo luego encenderla de nuevo mientras se mantiene reset.
echo Si Priiloader esta instalado, usted sera llevado al menu Priiloader.
echo Si usted todavia no esta seguro, conteste "N".
echo.
set /p Prisyscheck=     Escriba la seleccion aqui: 

if /i "%Prisyscheck%" EQU "Y" (set pri=) & (cls) & (goto:nopriconfirmation)
if /i "%Prisyscheck%" EQU "N" (set pri=*) & (cls) & (goto:nopriconfirmation)

echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:Prisyscheck
:nopriconfirmation



::check for recommended cIOSs and HBC
if /i "%syscheckversion%" EQU "2.0.1" goto:v2.0.1

findStr /I /C:"Homebrew Channel 1.0.8 running on IOS58" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set HM=*) else (set HM=)

findStr /I /C:"IOS202[60] (rev 65535, Info: hermesrodries-v6" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set cIOS202[60]-v5.1R=*) else (set cIOS202[60]-v5.1R=)

findStr /I /C:"IOS222[38] (rev 4, Info: hermes-v4" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set cIOS222[38]-v4=*) else (set cIOS222[38]-v4=)

findStr /I /C:"IOS223[75] (rev 4, Info: hermes-v4" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set cIOS223[37-38]-v4=*) else (set cIOS223[37-38]-v4=)

findStr /I /C:"IOS224[57] (rev 65535, Info: hermesrodries-v6" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set cIOS224[57]-v5.1R=*) else (set cIOS224[57]-v5.1R=)

findStr /I /C:"IOS249[56] (rev 21006, Info: d2x-v6" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set cIOS249[56]-d2x-v6=*) else (set cIOS249[56]-d2x-v6=)

findStr /I /C:"IOS250[57] (rev 21006, Info: d2x-v6" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set cIOS250[57]-d2x-v6=*) else (set cIOS250[57]-d2x-v6=)

if /i "%syscheckversion%" NEQ "2.0.1" goto:skipv2.0.1




:v2.0.1

findStr /I /C:"runs on IOS58" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set HM=*) else (set HM=)

findStr /I /C:"IOS202 (rev 65535): Trucha Bug, NAND Access, USB 2.0" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set cIOS202[60]-v5.1R=*) else (set cIOS202[60]-v5.1R=)

findStr /I /C:"IOS222 (rev 4): Trucha Bug, ES Identify, NAND Access, USB 2.0" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set cIOS222[38]-v4=*) else (set cIOS222[38]-v4=)

findStr /I /C:"IOS223 (rev 4): Trucha Bug, ES Identify, NAND Access, USB 2.0" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set cIOS223[37-38]-v4=*) else (set cIOS223[37-38]-v4=)

findStr /I /C:"IOS224 (rev 65535): Trucha Bug, NAND Access, USB 2.0" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set cIOS224[57]-v5.1R=*) else (set cIOS224[57]-v5.1R=)

findStr /I /C:"IOS249 (rev 21006): Trucha Bug, NAND Access, USB 2.0" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set cIOS249[56]-d2x-v6=*) else (set cIOS249[56]-d2x-v6=)

findStr /I /C:"IOS250 (rev 21006): Trucha Bug, NAND Access, USB 2.0" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set cIOS250[57]-d2x-v6=*) else (set cIOS250[57]-d2x-v6=)

:skipv2.0.1



::bootmii check
findStr /I /C:"bootmii" "%sysCheckName%" >nul
IF ERRORLEVEL 1 set HM=*

::bootmiiSD files
if /i "%HM%" EQU "*" set bootmiisd=*



::check for missing active IOSs
if /i "%ACTIVEIOS%" EQU "OFF" goto:skipactivecheck

findStr /I /C:"IOS9 (rev 1034): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS9=*) else (set IOS9=)

findStr /I /C:"IOS12 (rev 526): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS12=*) else (set IOS12=)

findStr /I /C:"IOS13 (rev 1032): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS13=*) else (set IOS13=)

findStr /I /C:"IOS14 (rev 1032): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS14=*) else (set IOS14=)

findStr /I /C:"IOS15 (rev 1032): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS15=*) else (set IOS15=)

findStr /I /C:"IOS17 (rev 1032): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS17=*) else (set IOS17=)

findStr /I /C:"IOS21 (rev 1039): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS21=*) else (set IOS21=)

findStr /I /C:"IOS22 (rev 1294): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS22=*) else (set IOS22=)

findStr /I /C:"IOS28 (rev 1807): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS28=*) else (set IOS28=)

findStr /I /C:"IOS31 (rev 3608): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS31=*) else (set IOS31=)

findStr /I /C:"IOS33 (rev 3608): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS33=*) else (set IOS33=)

findStr /I /C:"IOS34 (rev 3608): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS34=*) else (set IOS34=)

findStr /I /C:"IOS35 (rev 3608): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS35=*) else (set IOS35=)

if /i "%OPTION36%" EQU "OFF" goto:no36update
findStr /I /C:"IOS36 (rev 3608): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS36v3608=*) else (set IOS36v3608=)
:no36update

findStr /I /C:"IOS37 (rev 5663): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS37=*) else (set IOS37=)

findStr /I /C:"IOS38 (rev 4124): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS38=*) else (set IOS38=)

findStr /I /C:"IOS41 (rev 3607): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS41=*) else (set IOS41=)

findStr /I /C:"IOS43 (rev 3607): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS43=*) else (set IOS43=)

findStr /I /C:"IOS45 (rev 3607): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS45=*) else (set IOS45=)

findStr /I /C:"IOS46 (rev 3607): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS46=*) else (set IOS46=)

findStr /I /C:"IOS48 (rev 4124): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS48v4124=*) else (set IOS48v4124=)

findStr /I /C:"IOS53 (rev 5663): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS53=*) else (set IOS53=)

findStr /I /C:"IOS55 (rev 5663): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS55=*) else (set IOS55=)

findStr /I /C:"IOS56 (rev 5662): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS56=*) else (set IOS56=)

findStr /I /C:"IOS57 (rev 5919): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS57=*) else (set IOS57=)

findStr /I /C:"IOS58 (rev 6176)" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS58=*) else (set IOS58=)

findStr /I /C:"IOS61 (rev 5662): No Patches" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS61=*) else (set IOS61=)

:skipactivecheck



::patched IOS check

findStr /I /C:"IOS60 (rev 16174): Trucha Bug, NAND Access" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS60P=*) else (set IOS60P=)

findStr /I /C:"IOS70 (rev 16174): Trucha Bug, NAND Access" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS70K=*) else (set IOS70K=)

findStr /I /C:"IOS80 (rev 16174): Trucha Bug, NAND Access" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS80K=*) else (set IOS80K=)

findStr /I /C:"IOS11 (rev 16174): Trucha Bug, NAND Access" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS11P60=*) else (set IOS11P60=)

findStr /I /C:"IOS20 (rev 16174): Trucha Bug, NAND Access" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS20P60=*) else (set IOS20P60=)

findStr /I /C:"IOS30 (rev 16174): Trucha Bug, NAND Access" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS30P60=*) else (set IOS30P60=)

findStr /I /C:"IOS40 (rev 16174): Trucha Bug, NAND Access" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS40P60=*) else (set IOS40P60=)

findStr /I /C:"IOS50 (rev 16174): Trucha Bug, NAND Access" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS50P=*) else (set IOS50P=)

findStr /I /C:"IOS52 (rev 16174): Trucha Bug, NAND Access" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS52P=*) else (set IOS52P=)


::cMIOS
if /i "%CMIOSOPTION%" EQU "OFF" goto:skipcMIOScheck
set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=
findStr /I /C:"MIOS v65535" "%sysCheckName%" >nul
IF ERRORLEVEL 1 set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=*
:skipcMIOScheck

::MIOSv10
if /i "%CMIOSOPTION%" EQU "ON" goto:skipMIOScheck
findStr /I /C:"MIOS v10," "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set M10=*) else (set M10=)
:skipMIOScheck


::IOS236
findStr /I /C:"IOS236" "%sysCheckName%" >nul
IF ERRORLEVEL 1 (set IOS236Installer=*) else (set IOS236Installer=)
if /i "%IOS236Installer%" EQU "*" (set SIP=*) else (set SIP=)
if /i "%IOS236Installer%" EQU "*" (set IOS36=*) else (set IOS36=)


set mmm=
set RECCIOS=
if /i "%cIOS202[60]-v5.1R%" EQU "*" (set mmm=*) & (set RECCIOS=Y)
if /i "%cIOS222[38]-v4%" EQU "*" (set mmm=*) & (set RECCIOS=Y)
if /i "%cIOS223[37-38]-v4%" EQU "*" (set mmm=*) & (set RECCIOS=Y)
if /i "%cIOS224[57]-v5.1R%" EQU "*" (set mmm=*) & (set RECCIOS=Y)
if /i "%cIOS249[56]-d2x-v6%" EQU "*" (set mmm=*) & (set RECCIOS=Y)
if /i "%cIOS250[57]-d2x-v6%" EQU "*" (set mmm=*) & (set RECCIOS=Y)
if /i "%IOS9%" EQU "*" set mmm=*
if /i "%IOS12%" EQU "*" set mmm=*
if /i "%IOS13%" EQU "*" set mmm=*
if /i "%IOS14%" EQU "*" set mmm=*
if /i "%IOS15%" EQU "*" set mmm=*
if /i "%IOS17%" EQU "*" set mmm=*
if /i "%IOS21%" EQU "*" set mmm=*
if /i "%IOS22%" EQU "*" set mmm=*
if /i "%IOS28%" EQU "*" set mmm=*
if /i "%IOS31%" EQU "*" set mmm=*
if /i "%IOS33%" EQU "*" set mmm=*
if /i "%IOS34%" EQU "*" set mmm=*
if /i "%IOS35%" EQU "*" set mmm=*
if /i "%IOS36v3608%" EQU "*" set mmm=*
if /i "%IOS37%" EQU "*" set mmm=*
if /i "%IOS38%" EQU "*" set mmm=*
if /i "%IOS41%" EQU "*" set mmm=*
if /i "%IOS48v4124%" EQU "*" set mmm=*
if /i "%IOS43%" EQU "*" set mmm=*
if /i "%IOS45%" EQU "*" set mmm=*
if /i "%IOS46%" EQU "*" set mmm=*
if /i "%IOS53%" EQU "*" set mmm=*
if /i "%IOS55%" EQU "*" set mmm=*
if /i "%IOS56%" EQU "*" set mmm=*
if /i "%IOS57%" EQU "*" set mmm=*
if /i "%IOS58%" EQU "*" set mmm=*
if /i "%IOS61%" EQU "*" set mmm=*
if /i "%IOS60P%" EQU "*" set mmm=*
if /i "%IOS70K%" EQU "*" set mmm=*
if /i "%IOS80K%" EQU "*" set mmm=*
if /i "%RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2%" EQU "*" set mmm=*
if /i "%M10%" EQU "*" set mmm=*


set BACKB4QUEUE=sysCheckName
goto:DOWNLOADQUEUE



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
set bootmiisd=*
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

if /i "%ThemeSelection%" NEQ "BL" goto:SKIPblueSM
if /i "%FIRM%" EQU "4.3" set SM4.3U-DWB=*
if /i "%FIRM%" EQU "4.2" set SM4.2U-DWB=*
if /i "%FIRM%" EQU "4.1" set SM4.1U-DWB=*
goto:SKIPSM
:SKIPblueSM

if /i "%ThemeSelection%" NEQ "O" goto:SKIPorangeSM
if /i "%FIRM%" EQU "4.3" set SM4.3U-DWO=*
if /i "%FIRM%" EQU "4.2" set SM4.2U-DWO=*
if /i "%FIRM%" EQU "4.1" set SM4.1U-DWO=*
goto:SKIPSM
:SKIPorangeSM

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

if /i "%ThemeSelection%" NEQ "BL" goto:SKIPBlueSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set DarkWii_Blue_4.3U=*
if /i "%FIRM%" EQU "4.2" set DarkWii_Blue_4.2U=*
if /i "%FIRM%" EQU "4.1" set DarkWii_Blue_4.1U=*
:SKIPBlueSM

if /i "%ThemeSelection%" NEQ "O" goto:SKIPOrangeSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set darkwii_orange_4.3U=*
if /i "%FIRM%" EQU "4.2" set darkwii_orange_4.2U=*
if /i "%FIRM%" EQU "4.1" set darkwii_orange_4.1U=*
:SKIPOrangeSM

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

if /i "%ThemeSelection%" NEQ "BL" goto:SKIPblueSM
if /i "%FIRM%" EQU "4.3" set SM4.3E-DWB=*
if /i "%FIRM%" EQU "4.2" set SM4.2E-DWB=*
if /i "%FIRM%" EQU "4.1" set SM4.1E-DWB=*
goto:SKIPSM
:SKIPblueSM

if /i "%ThemeSelection%" NEQ "O" goto:SKIPorangeSM
if /i "%FIRM%" EQU "4.3" set SM4.3E-DWO=*
if /i "%FIRM%" EQU "4.2" set SM4.2E-DWO=*
if /i "%FIRM%" EQU "4.1" set SM4.1E-DWO=*
goto:SKIPSM
:SKIPorangeSM

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

if /i "%ThemeSelection%" NEQ "BL" goto:SKIPBlueSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set DarkWii_Blue_4.3E=*
if /i "%FIRM%" EQU "4.2" set DarkWii_Blue_4.2E=*
if /i "%FIRM%" EQU "4.1" set DarkWii_Blue_4.1E=*
:SKIPBlueSM

if /i "%ThemeSelection%" NEQ "O" goto:SKIPOrangeSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set darkwii_orange_4.3E=*
if /i "%FIRM%" EQU "4.2" set darkwii_orange_4.2E=*
if /i "%FIRM%" EQU "4.1" set darkwii_orange_4.1E=*
:SKIPOrangeSM

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

if /i "%ThemeSelection%" NEQ "BL" goto:SKIPblueSM
if /i "%FIRM%" EQU "4.3" set SM4.3J-DWB=*
if /i "%FIRM%" EQU "4.2" set SM4.2J-DWB=*
if /i "%FIRM%" EQU "4.1" set SM4.1J-DWB=*
goto:SKIPSM
:SKIPblueSM

if /i "%ThemeSelection%" NEQ "O" goto:SKIPorangeSM
if /i "%FIRM%" EQU "4.3" set SM4.3J-DWO=*
if /i "%FIRM%" EQU "4.2" set SM4.2J-DWO=*
if /i "%FIRM%" EQU "4.1" set SM4.1J-DWO=*
goto:SKIPSM
:SKIPorangeSM

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

if /i "%ThemeSelection%" NEQ "BL" goto:SKIPBlueSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set DarkWii_Blue_4.3J=*
if /i "%FIRM%" EQU "4.2" set DarkWii_Blue_4.2J=*
if /i "%FIRM%" EQU "4.1" set DarkWii_Blue_4.1J=*
:SKIPBlueSM

if /i "%ThemeSelection%" NEQ "O" goto:SKIPOrangeSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set darkwii_orange_4.3J=*
if /i "%FIRM%" EQU "4.2" set darkwii_orange_4.2J=*
if /i "%FIRM%" EQU "4.1" set darkwii_orange_4.1J=*
:SKIPOrangeSM

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

if /i "%ThemeSelection%" NEQ "BL" goto:SKIPblueSM
if /i "%FIRM%" EQU "4.3" set SM4.3K-DWB=*
if /i "%FIRM%" EQU "4.2" set SM4.2K-DWB=*
if /i "%FIRM%" EQU "4.1" set SM4.1K-DWB=*
goto:SKIPSM
:SKIPblueSM

if /i "%ThemeSelection%" NEQ "O" goto:SKIPorangeSM
if /i "%FIRM%" EQU "4.3" set SM4.3K-DWO=*
if /i "%FIRM%" EQU "4.2" set SM4.2K-DWO=*
if /i "%FIRM%" EQU "4.1" set SM4.1K-DWO=*
goto:SKIPSM
:SKIPorangeSM

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

if /i "%ThemeSelection%" NEQ "BL" goto:SKIPBlueSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set DarkWii_Blue_4.3K=*
if /i "%FIRM%" EQU "4.2" set DarkWii_Blue_4.2K=*
if /i "%FIRM%" EQU "4.1" set DarkWii_Blue_4.1K=*
:SKIPBlueSM

if /i "%ThemeSelection%" NEQ "O" goto:SKIPOrangeSM
set MyM=*
if /i "%FIRM%" EQU "4.3" set darkwii_orange_4.3K=*
if /i "%FIRM%" EQU "4.2" set darkwii_orange_4.2K=*
if /i "%FIRM%" EQU "4.1" set darkwii_orange_4.1K=*
:SKIPOrangeSM

:SKIPSM

if /i "%PIC%" EQU "Y" set PK=*
if /i "%SHOP%" EQU "Y" set SK=*





:BUGGEDSMIOS
if /i "%FIRM%" EQU "4.1" set IOS60P=*
if /i "%FIRM%" EQU "4.2" set IOS70K=*
if /i "%FIRM%" EQU "4.3" set IOS80K=*

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




set IOS11P60=*
set IOS20P60=*
set IOS30P60=*
set IOS40P60=*
set IOS50P=*
set IOS52P=*
set IOS60P=*
set IOS70K=*
set IOS80K=*
if /i "%FWDOPTION%" EQU "on" set usbx=*

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
set bootmiisd=*
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

set cIOS202[60]-v5.1R=*
set cIOS222[38]-v4=*
set cIOS223[37-38]-v4=*
set cIOS224[57]-v5.1R=*
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
set bootmiisd=*
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

if /i "%RECCIOS%" EQU "Y" set cIOS202[60]-v5.1R=*
if /i "%RECCIOS%" EQU "Y" set cIOS222[38]-v4=*
if /i "%RECCIOS%" EQU "Y" set cIOS223[37-38]-v4=*
if /i "%RECCIOS%" EQU "Y" set cIOS224[57]-v5.1R=*
if /i "%RECCIOS%" EQU "Y" set cIOS249[56]-d2x-v6=*
if /i "%RECCIOS%" EQU "Y" set cIOS250[57]-d2x-v6=*

if /i "%CMIOSOPTION%" EQU "off" goto:quickskip
if /i "%RECCIOS%" EQU "Y" set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=*
if /i "%RECCIOS%" EQU "Y" set M10=
:quickskip

if /i "%yawmQ%" EQU "Y" set YAWM=*


if /i "%PRIQ%" NEQ "Y" goto:DOWNLOADQUEUE
set pri=*
goto:DOWNLOADQUEUE



::...................................PICK Download Queue...............................
:PICKDOWNLOADQUEUE

dir temp\DownloadQueues /a:-d /b>temp\list.txt

::support\sfk filter -quiet temp\list.txt -le+".bat" -rep _".bat"__ -write -yes
support\sfk filter -quiet temp\list.txt -le+".bat" -write -yes

::count # of folders in advance to set "mode"
setlocal ENABLEDELAYEDEXPANSION
SET DLQUEUEtotal=0
for /f "delims=" %%i in (temp\list.txt) do set /a DLQUEUEtotal=!DLQUEUEtotal!+1
setlocal DISABLEDELAYEDEXPANSION

SET /a LINES=%DLQUEUEtotal%+27
if %LINES% LEQ 54 goto:noresize
mode con cols=85 lines=%LINES%
:noresize


set DLQUEUE=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                    Seleccione la cola de descarga que le gustaria cargar:
echo.
echo.


if /i "%DLQUEUEtotal%" EQU "0" (echo                 No se encuentra colas de descarga, volviendo al menu principal...) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:MENU)
echo.

set DLQUEUEnum=0

::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\list.txt) do call :processlist %%A
goto:quickskip
:processlist
set /a DLQUEUEnum=%DLQUEUEnum%+1
set whatev=%*
echo       %DLQUEUEnum% = %whatev:~0,-4%
goto:EOF
:quickskip

echo.
echo.
echo          Nota: Las colas de descarga se guarda en "temp\DownloadQueues"
echo                y pueden ser compartidos entre diferentes usuarios ModMii.
echo                Si desea eliminar una cola de la lista anterior
echo                simplemente borre el fichero apropiado de "temp\DownloadQueues"
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
set /p DLQUEUE=     Escriba su seleccion aqui: 

if /i "%DLQUEUE%" EQU "M" (mode con cols=85 lines=54) & (goto:MENU)
if /i "%DLQUEUE%" EQU "B" (mode con cols=85 lines=54) & (goto:MENU)

if "%DLQUEUE%"=="" goto:badkey

if %DLQUEUE% LSS 1 goto:badkey
if /i %DLQUEUE% GTR %DLQUEUEnum% goto:badkey


set DLQUEUEnum2=0
::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\list.txt) do call :processlist2 %%A
goto:quickskip
:processlist2
set CurrentQueue=%*
set /a DLQUEUEnum2=%DLQUEUEnum2%+1
if not exist "temp\DownloadQueues\%CurrentQueue%" goto:EOF
if /i "%DLQUEUEnum2%" EQU "%DLQUEUE%" goto:quickskip
goto:EOF

:quickskip
del temp\list.txt>nul
mode con cols=85 lines=54
:forcmdlineL
call "temp\DownloadQueues\%CurrentQueue%"
goto:DownloadQueue


:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:PICKDOWNLOADQUEUE





::...................................Download Queue...............................
:DOWNLOADQUEUE
set settings=

if /i "%cmdguide%" EQU "G" set settings=G


set d2x-beta-rev=6
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat

::--------------
::d2x check for changed DL names and md5's for Advanced downloads only
if /i "%MENU1%" NEQ "L" goto:DLCOUNT
if not exist temp\DLnamesADV.txt goto:DLCOUNT
findStr "d2x" temp\DLnamesADV.txt >nul
IF ERRORLEVEL 1 goto:DLCOUNT

FINDSTR /N . temp\DLnamesADV.txt>temp\DLnamesADVcheck.txt
support\sfk filter -quiet temp\DLnamesADVcheck.txt -+d2x -rep _cIOS*[_cIOS249[_ -rep _"Advanced Download: "__ -write -yes

set loadorgo=load4queue

::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\DLnamesADVcheck.txt) do call :processDLCheck %%A
goto:quickskip
:processDLCheck

set advDLCheck=%*

echo set advDLcheckNUM=%advDLCheck%>temp\advDLcheckNUM.bat
support\sfk filter -quiet temp\advDLcheckNUM.bat -rep _:*__ -write -yes
call temp\advDLcheckNUM.bat
del temp\advDLcheckNUM.bat>nul

echo %advDLCheck%>temp\advDLcheck.bat
support\sfk filter -quiet temp\advDLcheck.bat -rep _"%advDLcheckNUM%:"_"set advDLcheck="_ -write -yes
call temp\advDLcheck.bat
del temp\advDLcheck.bat>nul


call temp\AdvDL%advDLcheckNUM%.bat
set oldfullname=%name%

set advDLCheck0=%advDLCheck%

set d2x-beta-rev=6
set advDLCheck=%advDLCheck:~0,17%%d2x-beta-rev%
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat

set string=%d2x-beta-rev%
set d2xVersionLength=0

:loopd2xVersionLength
if defined string (
    set string=%string:~1%
    set /A d2xVersionLength += 1
    goto:loopd2xVersionLength
    )

echo set alt-d2x-beta-rev=@advDLcheck0:~17,%d2xVersionLength%@>temp\d2x-beta-rev.bat
support\sfk filter temp\d2x-beta-rev.bat -spat -rep _@_%%_ -write -yes>nul
call temp\d2x-beta-rev.bat
del temp\d2x-beta-rev.bat>nul

if /i "%d2x-beta-rev%" EQU "%alt-d2x-beta-rev%" goto:EOF

goto:%advDLCheck%


:processDLCheck2

set slotnum=%slotcode:~7%
if "%slotnum%"=="" set slotnum=249
set newname=cIOS%slotnum%%basecios:~7,10%%d2x-beta-rev%

::update temp\AdvDL#.bat
support\sfk filter -quiet temp\AdvDL%advDLcheckNUM%.bat -rep _"set MD5="*_"set MD5=%MD5%"_ -rep _"set md5alt="*_"set md5alt=%md5alt%"_ -rep _"set ciosversion="*_"set ciosversion=%ciosversion%"_ -rep _"Advanced Download: "*_"Advanced Download: %newname%%versionname%"_ -rep _"set wadname="*_"set wadname=%wadname%"_ -rep _"set wadnameless="*_"set wadnameless=%newname%"_ -write -yes

::update temp\DLnamesADV.txt
support\sfk filter -quiet temp\DLnamesADV.txt -lerep _"%oldfullname% "_"Advanced Download: %newname%%versionname%"_ -write -yes
goto:EOF
:quickskip

if exist temp\DLnamesADVcheck.txt del temp\DLnamesADVcheck.txt>nul
set loadorgo=go
::---------------------


::Count how many downloads there are!
:DLCOUNT

if exist temp\DLnames.txt del temp\DLnames.txt>nul
if exist temp\DLgotos.txt del temp\DLgotos.txt>nul


::---------------CMD LINE MODE-------------
if /i "%one%" NEQ "U" goto:nocmdlineusbloadersettings
if /i "%LOADER%" EQU "CFG" set usbfolder=*
if /i "%LOADER%" EQU "ALL" set usbfolder=*
if /i "%LOADER%" EQU "FLOW" set FLOW=*
if /i "%LOADER%" EQU "ALL" set FLOW=*
set wbm=*
if /i "%FORMAT%" EQU "1" set f32=*
if /i "%FORMAT%" EQU "3" set f32=*
:nocmdlineusbloadersettings



if /i "%EULAU%" EQU "*" (echo "EULA v3 (USA)">>temp\DLnames.txt) & (echo "EULAU">>temp\DLgotos.txt)
if /i "%EULAE%" EQU "*" (echo "EULA v3 (PAL)">>temp\DLnames.txt) & (echo "EULAE">>temp\DLgotos.txt)
if /i "%EULAJ%" EQU "*" (echo "EULA v3 (JAP)">>temp\DLnames.txt) & (echo "EULAJ">>temp\DLgotos.txt)
if /i "%EULAK%" EQU "*" (echo "EULA v3 (KOR)">>temp\DLnames.txt) & (echo "EULAK">>temp\DLgotos.txt)
if /i "%RSU%" EQU "*" (echo "Region Select v3 (USA)">>temp\DLnames.txt) & (echo "RSU">>temp\DLgotos.txt)
if /i "%RSE%" EQU "*" (echo "Region Select v3 (PAL)">>temp\DLnames.txt) & (echo "RSE">>temp\DLgotos.txt)
if /i "%RSJ%" EQU "*" (echo "Region Select v3 (JAP)">>temp\DLnames.txt) & (echo "RSJ">>temp\DLgotos.txt)
if /i "%RSK%" EQU "*" (echo "Region Select v3 (KOR)">>temp\DLnames.txt) & (echo "RSK">>temp\DLgotos.txt)
if /i "%BC%" EQU "*" (echo "BC">>temp\DLnames.txt) & (echo "BC">>temp\DLgotos.txt)
if /i "%cBC%" EQU "*" (echo "NMM">>temp\DLnames.txt) & (echo "NMM">>temp\DLgotos.txt)
if /i "%DML%" EQU "*" (echo "DML">>temp\DLnames.txt) & (echo "DML">>temp\DLgotos.txt)
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

if /i "%SM4.1U-DWR%" EQU "*" (echo "System Menu 4.1U with Dark Wii Red Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1U-DWR">>temp\DLgotos.txt)
if /i "%SM4.2U-DWR%" EQU "*" (echo "System Menu 4.2U with Dark Wii Red Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2U-DWR">>temp\DLgotos.txt)
if /i "%SM4.3U-DWR%" EQU "*" (echo "System Menu 4.3U with Dark Wii Red Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3U-DWR">>temp\DLgotos.txt)
if /i "%SM4.1E-DWR%" EQU "*" (echo "System Menu 4.1E with Dark Wii Red Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1E-DWR">>temp\DLgotos.txt)
if /i "%SM4.2E-DWR%" EQU "*" (echo "System Menu 4.2E with Dark Wii Red Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2E-DWR">>temp\DLgotos.txt)
if /i "%SM4.3E-DWR%" EQU "*" (echo "System Menu 4.3E with Dark Wii Red Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3E-DWR">>temp\DLgotos.txt)
if /i "%SM4.1J-DWR%" EQU "*" (echo "System Menu 4.1J with Dark Wii Red Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1J-DWR">>temp\DLgotos.txt)
if /i "%SM4.2J-DWR%" EQU "*" (echo "System Menu 4.2J with Dark Wii Red Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2J-DWR">>temp\DLgotos.txt)
if /i "%SM4.3J-DWR%" EQU "*" (echo "System Menu 4.3J with Dark Wii Red Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3J-DWR">>temp\DLgotos.txt)
if /i "%SM4.1K-DWR%" EQU "*" (echo "System Menu 4.1K with Dark Wii Red Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1K-DWR">>temp\DLgotos.txt)
if /i "%SM4.2K-DWR%" EQU "*" (echo "System Menu 4.2K with Dark Wii Red Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2K-DWR">>temp\DLgotos.txt)
if /i "%SM4.3K-DWR%" EQU "*" (echo "System Menu 4.3K with Dark Wii Red Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3K-DWR">>temp\DLgotos.txt)

if /i "%SM4.1U-DWG%" EQU "*" (echo "System Menu 4.1U with Dark Wii Green Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1U-DWG">>temp\DLgotos.txt)
if /i "%SM4.2U-DWG%" EQU "*" (echo "System Menu 4.2U with Dark Wii Green Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2U-DWG">>temp\DLgotos.txt)
if /i "%SM4.3U-DWG%" EQU "*" (echo "System Menu 4.3U with Dark Wii Green Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3U-DWG">>temp\DLgotos.txt)
if /i "%SM4.1E-DWG%" EQU "*" (echo "System Menu 4.1E with Dark Wii Green Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1E-DWG">>temp\DLgotos.txt)
if /i "%SM4.2E-DWG%" EQU "*" (echo "System Menu 4.2E with Dark Wii Green Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2E-DWG">>temp\DLgotos.txt)
if /i "%SM4.3E-DWG%" EQU "*" (echo "System Menu 4.3E with Dark Wii Green Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3E-DWG">>temp\DLgotos.txt)
if /i "%SM4.1J-DWG%" EQU "*" (echo "System Menu 4.1J with Dark Wii Green Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1J-DWG">>temp\DLgotos.txt)
if /i "%SM4.2J-DWG%" EQU "*" (echo "System Menu 4.2J with Dark Wii Green Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2J-DWG">>temp\DLgotos.txt)
if /i "%SM4.3J-DWG%" EQU "*" (echo "System Menu 4.3J with Dark Wii Green Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3J-DWG">>temp\DLgotos.txt)
if /i "%SM4.1K-DWG%" EQU "*" (echo "System Menu 4.1K with Dark Wii Green Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1K-DWG">>temp\DLgotos.txt)
if /i "%SM4.2K-DWG%" EQU "*" (echo "System Menu 4.2K with Dark Wii Green Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2K-DWG">>temp\DLgotos.txt)
if /i "%SM4.3K-DWG%" EQU "*" (echo "System Menu 4.3K with Dark Wii Green Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3K-DWG">>temp\DLgotos.txt)

if /i "%SM4.1U-DWB%" EQU "*" (echo "System Menu 4.1U with Dark Wii Blue Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1U-DWB">>temp\DLgotos.txt)
if /i "%SM4.2U-DWB%" EQU "*" (echo "System Menu 4.2U with Dark Wii Blue Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2U-DWB">>temp\DLgotos.txt)
if /i "%SM4.3U-DWB%" EQU "*" (echo "System Menu 4.3U with Dark Wii Blue Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3U-DWB">>temp\DLgotos.txt)
if /i "%SM4.1E-DWB%" EQU "*" (echo "System Menu 4.1E with Dark Wii Blue Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1E-DWB">>temp\DLgotos.txt)
if /i "%SM4.2E-DWB%" EQU "*" (echo "System Menu 4.2E with Dark Wii Blue Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2E-DWB">>temp\DLgotos.txt)
if /i "%SM4.3E-DWB%" EQU "*" (echo "System Menu 4.3E with Dark Wii Blue Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3E-DWB">>temp\DLgotos.txt)
if /i "%SM4.1J-DWB%" EQU "*" (echo "System Menu 4.1J with Dark Wii Blue Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1J-DWB">>temp\DLgotos.txt)
if /i "%SM4.2J-DWB%" EQU "*" (echo "System Menu 4.2J with Dark Wii Blue Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2J-DWB">>temp\DLgotos.txt)
if /i "%SM4.3J-DWB%" EQU "*" (echo "System Menu 4.3J with Dark Wii Blue Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3J-DWB">>temp\DLgotos.txt)
if /i "%SM4.1K-DWB%" EQU "*" (echo "System Menu 4.1K with Dark Wii Blue Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1K-DWB">>temp\DLgotos.txt)
if /i "%SM4.2K-DWB%" EQU "*" (echo "System Menu 4.2K with Dark Wii Blue Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2K-DWB">>temp\DLgotos.txt)
if /i "%SM4.3K-DWB%" EQU "*" (echo "System Menu 4.3K with Dark Wii Blue Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3K-DWB">>temp\DLgotos.txt)

if /i "%SM4.1U-DWO%" EQU "*" (echo "System Menu 4.1U with Dark Wii Orange Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1U-DWO">>temp\DLgotos.txt)
if /i "%SM4.2U-DWO%" EQU "*" (echo "System Menu 4.2U with Dark Wii Orange Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2U-DWO">>temp\DLgotos.txt)
if /i "%SM4.3U-DWO%" EQU "*" (echo "System Menu 4.3U with Dark Wii Orange Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3U-DWO">>temp\DLgotos.txt)
if /i "%SM4.1E-DWO%" EQU "*" (echo "System Menu 4.1E with Dark Wii Orange Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1E-DWO">>temp\DLgotos.txt)
if /i "%SM4.2E-DWO%" EQU "*" (echo "System Menu 4.2E with Dark Wii Orange Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2E-DWO">>temp\DLgotos.txt)
if /i "%SM4.3E-DWO%" EQU "*" (echo "System Menu 4.3E with Dark Wii Orange Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3E-DWO">>temp\DLgotos.txt)
if /i "%SM4.1J-DWO%" EQU "*" (echo "System Menu 4.1J with Dark Wii Orange Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1J-DWO">>temp\DLgotos.txt)
if /i "%SM4.2J-DWO%" EQU "*" (echo "System Menu 4.2J with Dark Wii Orange Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2J-DWO">>temp\DLgotos.txt)
if /i "%SM4.3J-DWO%" EQU "*" (echo "System Menu 4.3J with Dark Wii Orange Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3J-DWO">>temp\DLgotos.txt)
if /i "%SM4.1K-DWO%" EQU "*" (echo "System Menu 4.1K with Dark Wii Orange Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.1K-DWO">>temp\DLgotos.txt)
if /i "%SM4.2K-DWO%" EQU "*" (echo "System Menu 4.2K with Dark Wii Orange Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.2K-DWO">>temp\DLgotos.txt)
if /i "%SM4.3K-DWO%" EQU "*" (echo "System Menu 4.3K with Dark Wii Orange Theme - %effect%">>temp\DLnames.txt) & (echo "SM4.3K-DWO">>temp\DLgotos.txt)

if /i "%DarkWii_Red_4.1U%" EQU "*" (echo "DarkWii Red Theme (4.1U) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Red_4.1U">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.2U%" EQU "*" (echo "DarkWii Red Theme (4.2U) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Red_4.2U">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.3U%" EQU "*" (echo "DarkWii Red Theme (4.3U) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Red_4.3U">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.1E%" EQU "*" (echo "DarkWii Red Theme (4.1E) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Red_4.1E">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.2E%" EQU "*" (echo "DarkWii Red Theme (4.2E) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Red_4.2E">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.3E%" EQU "*" (echo "DarkWii Red Theme (4.3E) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Red_4.3E">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.1J%" EQU "*" (echo "DarkWii Red Theme (4.1J) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Red_4.1J">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.2J%" EQU "*" (echo "DarkWii Red Theme (4.2J) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Red_4.2J">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.3J%" EQU "*" (echo "DarkWii Red Theme (4.3J) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Red_4.3J">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.1K%" EQU "*" (echo "DarkWii Red Theme (4.1K) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Red_4.1K">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.2K%" EQU "*" (echo "DarkWii Red Theme (4.2K) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Red_4.2K">>temp\DLgotos.txt)
if /i "%DarkWii_Red_4.3K%" EQU "*" (echo "DarkWii Red Theme (4.3K) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Red_4.3K">>temp\DLgotos.txt)

if /i "%DarkWii_Green_4.1U%" EQU "*" (echo "DarkWii Green Theme (4.1U) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Green_4.1U">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.2U%" EQU "*" (echo "DarkWii Green Theme (4.2U) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Green_4.2U">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.3U%" EQU "*" (echo "DarkWii Green Theme (4.3U) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Green_4.3U">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.1E%" EQU "*" (echo "DarkWii Green Theme (4.1E) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Green_4.1E">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.2E%" EQU "*" (echo "DarkWii Green Theme (4.2E) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Green_4.2E">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.3E%" EQU "*" (echo "DarkWii Green Theme (4.3E) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Green_4.3E">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.1J%" EQU "*" (echo "DarkWii Green Theme (4.1J) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Green_4.1J">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.2J%" EQU "*" (echo "DarkWii Green Theme (4.2J) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Green_4.2J">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.3J%" EQU "*" (echo "DarkWii Green Theme (4.3J) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Green_4.3J">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.1K%" EQU "*" (echo "DarkWii Green Theme (4.1K) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Green_4.1K">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.2K%" EQU "*" (echo "DarkWii Green Theme (4.2K) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Green_4.2K">>temp\DLgotos.txt)
if /i "%DarkWii_Green_4.3K%" EQU "*" (echo "DarkWii Green Theme (4.3K) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Green_4.3K">>temp\DLgotos.txt)

if /i "%DarkWii_Blue_4.1U%" EQU "*" (echo "DarkWii Blue Theme (4.1U) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Blue_4.1U">>temp\DLgotos.txt)
if /i "%DarkWii_Blue_4.2U%" EQU "*" (echo "DarkWii Blue Theme (4.2U) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Blue_4.2U">>temp\DLgotos.txt)
if /i "%DarkWii_Blue_4.3U%" EQU "*" (echo "DarkWii Blue Theme (4.3U) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Blue_4.3U">>temp\DLgotos.txt)
if /i "%DarkWii_Blue_4.1E%" EQU "*" (echo "DarkWii Blue Theme (4.1E) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Blue_4.1E">>temp\DLgotos.txt)
if /i "%DarkWii_Blue_4.2E%" EQU "*" (echo "DarkWii Blue Theme (4.2E) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Blue_4.2E">>temp\DLgotos.txt)
if /i "%DarkWii_Blue_4.3E%" EQU "*" (echo "DarkWii Blue Theme (4.3E) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Blue_4.3E">>temp\DLgotos.txt)
if /i "%DarkWii_Blue_4.1J%" EQU "*" (echo "DarkWii Blue Theme (4.1J) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Blue_4.1J">>temp\DLgotos.txt)
if /i "%DarkWii_Blue_4.2J%" EQU "*" (echo "DarkWii Blue Theme (4.2J) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Blue_4.2J">>temp\DLgotos.txt)
if /i "%DarkWii_Blue_4.3J%" EQU "*" (echo "DarkWii Blue Theme (4.3J) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Blue_4.3J">>temp\DLgotos.txt)
if /i "%DarkWii_Blue_4.1K%" EQU "*" (echo "DarkWii Blue Theme (4.1K) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Blue_4.1K">>temp\DLgotos.txt)
if /i "%DarkWii_Blue_4.2K%" EQU "*" (echo "DarkWii Blue Theme (4.2K) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Blue_4.2K">>temp\DLgotos.txt)
if /i "%DarkWii_Blue_4.3K%" EQU "*" (echo "DarkWii Blue Theme (4.3K) - %effect%">>temp\DLnames.txt) & (echo "DarkWii_Blue_4.3K">>temp\DLgotos.txt)

if /i "%darkwii_orange_4.1U%" EQU "*" (echo "DarkWii Orange Theme (4.1U) - %effect%">>temp\DLnames.txt) & (echo "darkwii_orange_4.1U">>temp\DLgotos.txt)
if /i "%darkwii_orange_4.2U%" EQU "*" (echo "DarkWii Orange Theme (4.2U) - %effect%">>temp\DLnames.txt) & (echo "darkwii_orange_4.2U">>temp\DLgotos.txt)
if /i "%darkwii_orange_4.3U%" EQU "*" (echo "DarkWii Orange Theme (4.3U) - %effect%">>temp\DLnames.txt) & (echo "darkwii_orange_4.3U">>temp\DLgotos.txt)
if /i "%darkwii_orange_4.1E%" EQU "*" (echo "DarkWii Orange Theme (4.1E) - %effect%">>temp\DLnames.txt) & (echo "darkwii_orange_4.1E">>temp\DLgotos.txt)
if /i "%darkwii_orange_4.2E%" EQU "*" (echo "DarkWii Orange Theme (4.2E) - %effect%">>temp\DLnames.txt) & (echo "darkwii_orange_4.2E">>temp\DLgotos.txt)
if /i "%darkwii_orange_4.3E%" EQU "*" (echo "DarkWii Orange Theme (4.3E) - %effect%">>temp\DLnames.txt) & (echo "darkwii_orange_4.3E">>temp\DLgotos.txt)
if /i "%darkwii_orange_4.1J%" EQU "*" (echo "DarkWii Orange Theme (4.1J) - %effect%">>temp\DLnames.txt) & (echo "darkwii_orange_4.1J">>temp\DLgotos.txt)
if /i "%darkwii_orange_4.2J%" EQU "*" (echo "DarkWii Orange Theme (4.2J) - %effect%">>temp\DLnames.txt) & (echo "darkwii_orange_4.2J">>temp\DLgotos.txt)
if /i "%darkwii_orange_4.3J%" EQU "*" (echo "DarkWii Orange Theme (4.3J) - %effect%">>temp\DLnames.txt) & (echo "darkwii_orange_4.3J">>temp\DLgotos.txt)
if /i "%darkwii_orange_4.1K%" EQU "*" (echo "DarkWii Orange Theme (4.1K) - %effect%">>temp\DLnames.txt) & (echo "darkwii_orange_4.1K">>temp\DLgotos.txt)
if /i "%darkwii_orange_4.2K%" EQU "*" (echo "DarkWii Orange Theme (4.2K) - %effect%">>temp\DLnames.txt) & (echo "darkwii_orange_4.2K">>temp\DLgotos.txt)
if /i "%darkwii_orange_4.3K%" EQU "*" (echo "DarkWii Orange Theme (4.3K) - %effect%">>temp\DLnames.txt) & (echo "darkwii_orange_4.3K">>temp\DLgotos.txt)

if /i "%IOS11P60%" EQU "*" (echo "IOS11v16174(IOS60v6174[FS-ES-NP-VP-DIP])">>temp\DLnames.txt) & (echo "IOS11P60">>temp\DLgotos.txt)
if /i "%IOS20P60%" EQU "*" (echo "IOS20v16174(IOS60v6174[FS-ES-NP-VP-DIP])">>temp\DLnames.txt) & (echo "IOS20P60">>temp\DLgotos.txt)
if /i "%IOS30%" EQU "*" (echo "IOS30v2576">>temp\DLnames.txt) & (echo "IOS30">>temp\DLgotos.txt)
if /i "%IOS30P60%" EQU "*" (echo "IOS30v16174(IOS60v6174[FS-ES-NP-VP-DIP])">>temp\DLnames.txt) & (echo "IOS30P60">>temp\DLgotos.txt)
if /i "%IOS30P%" EQU "*" (echo "IOS30v12576(IOS30v2576[FS-ES-NP-VP])">>temp\DLnames.txt) & (echo "IOS30P">>temp\DLgotos.txt)
if /i "%IOS40P60%" EQU "*" (echo "IOS40v16174(IOS60v6174[FS-ES-NP-VP-DIP])">>temp\DLnames.txt) & (echo "IOS40P60">>temp\DLgotos.txt)
if /i "%IOS50P%" EQU "*" (echo "IOS50v16174(IOS60v6174[FS-ES-NP-VP-DIP])">>temp\DLnames.txt) & (echo "IOS50P">>temp\DLgotos.txt)
if /i "%IOS52P%" EQU "*" (echo "IOS52v16174(IOS60v6174[FS-ES-NP-VP-DIP])">>temp\DLnames.txt) & (echo "IOS52P">>temp\DLgotos.txt)
if /i "%IOS60%" EQU "*" (echo "IOS60v6174">>temp\DLnames.txt) & (echo "IOS60">>temp\DLgotos.txt)
if /i "%IOS60P%" EQU "*" (echo "IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])">>temp\DLnames.txt) & (echo "IOS60P">>temp\DLgotos.txt)
if /i "%IOS70%" EQU "*" (echo "IOS70v6687">>temp\DLnames.txt) & (echo "IOS70">>temp\DLgotos.txt)
if /i "%IOS70P%" EQU "*" (echo "IOS70v16687(IOS70v6687[FS-ES-NP-VP])">>temp\DLnames.txt) & (echo "IOS70P">>temp\DLgotos.txt)
if /i "%IOS70K%" EQU "*" (echo "IOS70v16174(IOS60v6174[FS-ES-NP-VP-DIP])">>temp\DLnames.txt) & (echo "IOS70K">>temp\DLgotos.txt)
if /i "%IOS80K%" EQU "*" (echo "IOS80v16174(IOS60v6174[FS-ES-NP-VP-DIP])">>temp\DLnames.txt) & (echo "IOS80K">>temp\DLgotos.txt)
if /i "%IOS80%" EQU "*" (echo "IOS80v6944">>temp\DLnames.txt) & (echo "IOS80">>temp\DLgotos.txt)
if /i "%IOS80P%" EQU "*" (echo "IOS80v16944(IOS80v6944[FS-ES-NP-VP])">>temp\DLnames.txt) & (echo "IOS80P">>temp\DLgotos.txt)

if /i "%mmm%" EQU "*" (echo "Multi-Mod Manager (MMM) v13.4">>temp\DLnames.txt) & (echo "mmm">>temp\DLgotos.txt)
if /i "%yawm%" EQU "*" (echo "Yet Another Wad Manager Mod">>temp\DLnames.txt) & (echo "yawm">>temp\DLgotos.txt)
if /i "%Y4M%" EQU "*" (echo "YAWMM 4 ModMii">>temp\DLnames.txt) & (echo "Y4M">>temp\DLgotos.txt)
if /i "%dop%" EQU "*" (echo "Dop-Mii">>temp\DLnames.txt) & (echo "dopmii">>temp\DLgotos.txt)

if /i "%syscheck%" EQU "*" (echo "sysCheck">>temp\DLnames.txt) & (echo "sysCheck">>temp\DLgotos.txt)
if /i "%sysCheckBeta%" EQU "*" (echo "sysCheckBeta">>temp\DLnames.txt) & (echo "sysCheckBeta">>temp\DLgotos.txt)

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
if /i "%SIP%" EQU "*" (echo "Simple IOS Patcher">>temp\DLnames.txt) & (echo "SIP">>temp\DLgotos.txt)
if /i "%Pri%" EQU "*" (echo "Priiloader v0.7 (236 Mod)">>temp\DLnames.txt) & (echo "Priiloader">>temp\DLgotos.txt)
if /i "%HAX%" EQU "*" (echo "Priiloader Hacks">>temp\DLnames.txt) & (echo "PriiHacks">>temp\DLgotos.txt)
if /i "%MyM%" EQU "*" (echo "MyMenuifyMod">>temp\DLnames.txt) & (echo "Mym">>temp\DLgotos.txt)

if /i "%WiiGSC%" EQU "*" (echo "Wii Game Shortcut Creator">>temp\DLnames.txt) & (echo "WiiGSC">>temp\DLgotos.txt)


if /i "%PCSAVE%" EQU "Local" goto:local
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" EQU "%ModMiipath:~0,2%" goto:local
:skip
if /i "%f32%" EQU "*" (echo "FAT32 GUI Formatter">>temp\DLnames.txt) & (echo "F32">>temp\DLgotos.txt)
if /i "%CM%" EQU "*" (echo "Customize Mii">>temp\DLnames.txt) & (echo "CM">>temp\DLgotos.txt)
if /i "%SMW%" EQU "*" (echo "ShowMiiWads">>temp\DLnames.txt) & (echo "SMW">>temp\DLgotos.txt)
if /i "%wbm%" EQU "*" (echo "Wii Backup Manager">>temp\DLnames.txt) & (echo "WBM">>temp\DLgotos.txt)
goto:skiplocal
:local

if /i "%f32%" EQU "*" (echo "FAT32 GUI Formatter (saved with shortcuts to %homedrive%\ModMii\Program Files)">>temp\DLnames.txt) & (echo "F32">>temp\DLgotos.txt)
if /i "%wbm%" EQU "*" (echo "Wii Backup Manager (saved with shortcuts to %homedrive%\ModMii\Program Files)">>temp\DLnames.txt) & (echo "WBM">>temp\DLgotos.txt)
if /i "%CM%" EQU "*" (echo "Customize Mii (saved with shortcuts to %homedrive%\ModMii\Program Files)">>temp\DLnames.txt) & (echo "CM">>temp\DLgotos.txt)
if /i "%SMW%" EQU "*" (echo "ShowMiiWads (saved with shortcuts to %homedrive%\ModMii\Program Files)">>temp\DLnames.txt) & (echo "SMW">>temp\DLgotos.txt)
:skiplocal



if /i "%usbfolder%" EQU "*" (echo "Configurable USB-Loader (Most recent Full 249 version)">>temp\DLnames.txt) & (echo "usbfolder">>temp\DLgotos.txt)
if /i "%cfg249%" EQU "*" (echo "Configurable USB Loader (Most recent 249 version)">>temp\DLnames.txt) & (echo "cfg249">>temp\DLgotos.txt)
if /i "%cfg222%" EQU "*" (echo "Configurable USB Loader (Most recent 222 version)">>temp\DLnames.txt) & (echo "cfg222">>temp\DLgotos.txt)
if /i "%cfgr%" EQU "*" (echo "Configurator for Configurable USB Loader (Most recent version)">>temp\DLnames.txt) & (echo "cfgr">>temp\DLgotos.txt)
if /i "%FLOW%" EQU "*" (echo "WiiFlow r304-249">>temp\DLnames.txt) & (echo "FLOW">>temp\DLgotos.txt)
if /i "%neogamma%" EQU "*" (echo "Neogamma Backup Disc Loader">>temp\DLnames.txt) & (echo "neogamma">>temp\DLgotos.txt)
if /i "%AccioHacks%" EQU "*" (echo "Accio Hacks">>temp\DLnames.txt) & (echo "AccioHacks">>temp\DLgotos.txt)
if /i "%CheatCodes%" EQU "*" (echo "%cheatregion% Region Cheat Codes: txtcodes from geckocodes.org">>temp\DLnames.txt) & (echo "CheatCodes">>temp\DLgotos.txt)
if /i "%USBX%" EQU "*" (echo "USB-Loader Forwarder Channel">>temp\DLnames.txt) & (echo "USBX">>temp\DLgotos.txt)

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
if /i "%HBB%" EQU "*" (echo "Homebrew Browser">>temp\DLnames.txt) & (echo "HBB">>temp\DLgotos.txt)
if /i "%locked%" EQU "*" (echo "Locked Apps Folder for HBC (PASS=UDLRAB)">>temp\DLnames.txt) & (echo "locked">>temp\DLgotos.txt)

if /i "%MII%" EQU "*" (echo "MII Channel">>temp\DLnames.txt) & (echo "MII">>temp\DLgotos.txt)

if /i "%P0%" EQU "*" (echo "Photo Channel (USA / PAL / JAP /KOR)">>temp\DLnames.txt) & (echo "PHOTO0">>temp\DLgotos.txt)
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

if /i "%IOS236%" EQU "*" (echo "IOS236v65535(IOS36v3351[FS-ES-NP-VP])">>temp\DLnames.txt) & (echo "IOS236">>temp\DLgotos.txt)

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

if /i "%cIOS222[38]-v5%" EQU "*" (echo "cIOS222[38]-v5">>temp\DLnames.txt) & (echo "cIOS222[38]-v5">>temp\DLgotos.txt)
if /i "%cIOS223[37]-v5%" EQU "*" (echo "cIOS223[37]-v5">>temp\DLnames.txt) & (echo "cIOS223[37]-v5">>temp\DLgotos.txt)
if /i "%cIOS224[57]-v5%" EQU "*" (echo "cIOS224[57]-v5">>temp\DLnames.txt) & (echo "cIOS224[57]-v5">>temp\DLgotos.txt)

if /i "%cIOS202[60]-v5.1R%" EQU "*" (echo "cIOS202[60]-v5.1R">>temp\DLnames.txt) & (echo "cIOS202[60]-v5.1R">>temp\DLgotos.txt)
if /i "%cIOS222[38]-v5.1R%" EQU "*" (echo "cIOS222[38]-v5.1R">>temp\DLnames.txt) & (echo "cIOS222[38]-v5.1R">>temp\DLgotos.txt)
if /i "%cIOS223[37]-v5.1R%" EQU "*" (echo "cIOS223[37]-v5.1R">>temp\DLnames.txt) & (echo "cIOS223[37]-v5.1R">>temp\DLgotos.txt)
if /i "%cIOS224[57]-v5.1R%" EQU "*" (echo "cIOS224[57]-v5.1R">>temp\DLnames.txt) & (echo "cIOS224[57]-v5.1R">>temp\DLgotos.txt)

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

if exist temp\DLnames.txt support\sfk filter -quiet "temp\DLnames.txt" -rep _"""__ -write -yes
if exist temp\DLgotos.txt support\sfk filter -quiet "temp\DLgotos.txt" -rep _"""__ -write -yes

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

SET /a LINES=%DLTOTAL%+22

if /i "%MENU1%" EQU "L" SET /a LINES=%LINES%+14


::sysCheck Updater - handles when no downloads were marked for installation
if /i "%MENU1%" NEQ "SU" goto:miniskip
if /i "%DLTOTAL%" NEQ "0" goto:miniskip
echo.
echo      According to your sysCheck log your Wii's softmods are up to date.
echo.
@ping 127.0.0.1 -n 5 -w 1000> nul
if /i "%cmdlinemode%" EQU "Y" exit
goto:sysCheckName
:miniskip

::---------------CMD LINE MODE-------------
if /i "%cmdlinemode%" EQU "Y" goto:DLSettings



if %LINES% LEQ 54 goto:noresize
mode con cols=85 lines=%LINES%
:noresize

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
if /i "%MENU1%" EQU "H" echo                                  soluciones HackMii
if /i "%MENU1%" EQU "H" echo.


::-----------DL QUEUE SETTINGS---------
if /i "%MENU1%" NEQ "L" goto:skiploadDLcue

if /i "%ROOTSAVE%" EQU "%ROOTSAVETEMP%" set matchrs=Green
if /i "%ROOTSAVE%" NEQ "%ROOTSAVETEMP%" set matchrs=Red

if /i "%OPTION1%" EQU "%OPTION1TEMP%" set match1=Green
if /i "%OPTION1%" NEQ "%OPTION1TEMP%" set match1=Red

echo.
echo                                 Cola de descarga Cargada
echo.
echo                                 %CurrentQueue:~0,-4%
echo.
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 Opciones de la cola aparecen en [Red]Rojo [def]cuando difieren de
support\sfk echo -spat \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 \x20 la configuracion guardada y [Green]Verde [def]si coinciden
echo.
if /i "%ROOTSAVE%" EQU "ON" support\sfk echo -spat \x20 \x20 [%matchrs%]Guardar Raiz: Guarda IOSs\MIOSs en la raiz en lugar de la carpeta WAD (Habilitado)
if /i "%ROOTSAVE%" EQU "OFF" support\sfk echo -spat \x20 \x20 [%matchrs%]Guarda IOSs\MIOSs en la raiz en lugar de la carpeta WAD (Desabilitado)
echo               * Aplicaciones utiles para Wii que requieren IOSs\MIOSs guardar en la raiz
echo.
if /i "%OPTION1%" EQU "OFF" support\sfk echo -spat \x20 \x20 [%match1%]No mantener la carpeta 00000001 para IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "OFF" echo               * Esta carpeta a veces se requiere para el uso en linea de algunas Aplicaciones Wii
if /i "%OPTION1%" EQU "ON" support\sfk echo -spat \x20 \x20 [%match1%]Mantener la carpeta 00000001 para IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "ON" echo               * Utiles para el uso en linea de aplicaciones de Wii como Dop-Mii



if /i "%OPTION1%" EQU "NUS" support\sfk echo -spat \x20 \x20 [%match1%]Mantener NUS\00000001000000##v# Carpeta para IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "NUS" echo               * Utiles para el uso en linea de aplicaciones de Wii como d2x\Hermes cIOS Installers

if /i "%OPTION1%" EQU "ALL" support\sfk echo -spat \x20 \x20 [%match1%]Mantener NUS\00000001000000##v# and 00000001 Carpeta para IOSs\MIOSs\SMs etc
if /i "%OPTION1%" EQU "ALL" echo               * Utiles para el uso en linea unas pocas Aplicaciones Wii
echo.
echo.

:skiploadDLcue

if /i "%DLTOTAL%" EQU "0" echo      No hay archivos marcados para su descarga
if /i "%DLTOTAL%" EQU "0" goto:skipall

if /i "%USBGUIDE%" NEQ "Y" goto:skip
if /i "%USBCONFIG%" EQU "USB" (echo      Los siguientes %DLTOTAL% archivos se descargan en "%DRIVE%" o "%DRIVEU%":) else (echo      Los siguientes %DLTOTAL% archivos se descargan en "%DRIVE%":)
goto:skipall
:skip

echo      Los siguientes %DLTOTAL% archivos se descargan en "%DRIVE%":
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

echo      Empezar a descargar ahora?
echo.
if /i "%DLTOTAL%" EQU "0" goto:zerodownloads
if /i "%MENU1%" EQU "W" goto:WorUSB
if /i "%MENU1%" EQU "U" goto:WorUSB
if /i "%MENU1%" EQU "H" goto:WorUSB
if /i "%MENU1%" EQU "SU" goto:WorUSB

echo           Y = Si, comenzar a descargar

:WorUSB
if /i "%MENU1%" EQU "W" echo           Y = Si, Generar Guia y empezar a descargar
if /i "%MENU1%" EQU "W" echo           G = Generar Guia solo
if /i "%MENU1%" EQU "U" echo           Y = Si, Generar Guia y empezar a descargar
if /i "%MENU1%" EQU "U" echo           G = Generar Guia solo
if /i "%MENU1%" EQU "H" echo           Y = Si, Generar Guia y empezar a descargar
if /i "%MENU1%" EQU "H" echo           G = Generar Guia solo
if /i "%MENU1%" EQU "SU" echo           Y = Si, Generar Guia y empezar a descargar
if /i "%MENU1%" EQU "SU" echo           G = Generar Guia solo

:zerodownloads

if /i "%MENU1%" EQU "1" echo           A = Colocar mas archivos a la lista de descarga por lotes
if /i "%MENU1%" EQU "2" echo           A = Colocar mas archivos a la lista de descarga por lotes
if /i "%MENU1%" EQU "3" echo           A = Colocar mas archivos a la lista de descarga por lotes
if /i "%MENU1%" EQU "4" echo           A = Colocar mas archivos a la lista de descarga por lotes
if /i "%MENU1%" EQU "A" echo           A = Colocar mas archivos a la lista de descarga por lotes
if /i "%MENU1%" EQU "L" echo           A = Colocar mas archivos a la lista de descarga por lotes
echo.
echo           S = Guardar Cola de descargas
echo.


echo           B = Atras
echo           M = Menu Principal
echo.
set /p SETTINGS=     Escriba la seleccion aqui: 




if /i "%SETTINGS%" EQU "B" mode con cols=85 lines=54
if /i "%SETTINGS%" EQU "B" goto:%BACKB4QUEUE%
if /i "%SETTINGS%" EQU "M" goto:MENU

if /i "%SETTINGS%" EQU "S" goto:SaveDownloadQueue

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
if /i "%MENU1%" EQU "SU" goto:generateguideonly
goto:badkey

:generateguideonly

if /i "%SETTINGS%" EQU "G" goto:guide


:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:DOWNLOADQUEUE


::--------------------------SAVE DOWNLOAD QUEUE-----------------------
:SaveDownloadQueue
set DLQUEUENAME=
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                     Por favor, introduzca un nombre para la cola de descarga
echo.
echo.
echo          Nota: No puede contener \ / : * ? " < > | & %%
echo.
echo.
echo          Nota: Las colas de descarga se guarda en "temp\DownloadQueues"
echo                y pueden ser compartidos entre diferentes usuarios ModMii
echo.
echo.
echo.
echo                B = Atras
echo.
echo                M = Menu Principal
echo.
echo.
echo.
set /p DLQUEUENAME=     Escriba la seleccion aqui: 

if "%DLQUEUENAME%"=="" goto:badkey

if /i "%DLQUEUENAME%" EQU "M" goto:MENU
if /i "%DLQUEUENAME%" EQU "B" goto::FINISH

echo "set DLQUEUENAME=%DLQUEUENAME%">temp\temp.bat

support\sfk filter -quiet -spat temp\temp.bat -rep _\x5c__ -rep _\x2f__ -rep _\x3a__ -rep _\x2a__ -rep _\x3f__ -rep _\x3c__ -rep _\x3e__ -rep _\x7c__ -rep _\x22__ -write -yes

call temp\temp.bat
del temp\temp.bat>nul

if not exist "temp\DownloadQueues\%DLQUEUENAME%.bat" goto:SaveDownloadQueue2

::queue with the same name already exists
echo.
echo En la cola de descarga con este nombre ya existe, sobreescribirlo? (Y/N)
echo.
set /p overwritequeue=     Escriba la seleccion aqui: 

if /i "%overwritequeue%" EQU "Y" (goto:SaveDownloadQueue2) else (goto:SaveDownloadQueue)

:badkey
echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:SaveDownloadQueue


:SaveDownloadQueue2
cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo                                  Guardar cola descarga
echo.

if not exist temp\DownloadQueues mkdir temp\DownloadQueues

set AdvNumberCOPY=%AdvNumber%
if /i "%SETTINGS%" EQU "S" set AdvNumberCOPY=0
if /i "%FINISH%" EQU "S" set AdvNumberCOPY=0

::set GetAdvNumberOnly=Y
::if exist "temp\DownloadQueues\%DLQUEUENAME%.bat" call "temp\DownloadQueues\%DLQUEUENAME%.bat"
::set GetAdvNumberOnly=

set /a AdvNumberCOPY=%AdvNumberCOPY%+%AdvNumber%

set AdvNumberCOPY2=%AdvNumber%
if /i "%SETTINGS%" EQU "S" set AdvNumberCOPY2=0
if /i "%FINISH%" EQU "S" set AdvNumberCOPY2=0

set AdvNumberCOPY3=%AdvNumberCOPY2%
::set AdvNumber=0

::if exist "temp\DownloadQueues\%DLQUEUENAME%.bat" support\sfk filter -quiet "temp\DownloadQueues\%DLQUEUENAME%.bat" -ls!":endofqueue" -write -yes
::if exist "temp\DownloadQueues\%DLQUEUENAME%.bat" support\sfk filter -quiet -spat "temp\DownloadQueues\%DLQUEUENAME%.bat" -rep _\x22_quote_ -write -yes

echo.

echo ::ModMii v%currentversion% - Cola Descarga - %DATE% - %TIME% > "temp\DownloadQueues\%DLQUEUENAME%.bat"

echo "set AdvNumber=%AdvNumbercopy%">>"temp\DownloadQueues\%DLQUEUENAME%.bat"
echo "if /i quote@GetAdvNumberOnly@quote EQU quoteYquote goto:endofqueue">>"temp\DownloadQueues\%DLQUEUENAME%.bat"

echo ::Queue Settings>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
echo Set ROOTSAVE=%ROOTSAVE%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
echo Set Option1=%Option1%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

echo ::Queue>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%EULAU%" EQU "*" echo SET EULAU=%EULAU%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%EULAE%" EQU "*" echo SET EULAE=%EULAE%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%EULAJ%" EQU "*" echo SET EULAJ=%EULAJ%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%EULAK%" EQU "*" echo SET EULAK=%EULAK%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%RSU%" EQU "*" echo SET RSU=%RSU%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%RSE%" EQU "*" echo SET RSE=%RSE%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%RSJ%" EQU "*" echo SET RSJ=%RSJ%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%RSK%" EQU "*" echo SET RSK=%RSK%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%BC%" EQU "*" echo SET BC=%BC%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%SM3.2U%" EQU "*" echo SET SM3.2U=%SM3.2U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1U%" EQU "*" echo SET SM4.1U=%SM4.1U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2U%" EQU "*" echo SET SM4.2U=%SM4.2U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3U%" EQU "*" echo SET SM4.3U=%SM4.3U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM3.2E%" EQU "*" echo SET SM3.2E=%SM3.2E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1E%" EQU "*" echo SET SM4.1E=%SM4.1E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2E%" EQU "*" echo SET SM4.2E=%SM4.2E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3E%" EQU "*" echo SET SM4.3E=%SM4.3E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM3.2J%" EQU "*" echo SET SM3.2J=%SM3.2J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1J%" EQU "*" echo SET SM4.1J=%SM4.1J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2J%" EQU "*" echo SET SM4.2J=%SM4.2J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3J%" EQU "*" echo SET SM4.3J=%SM4.3J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1K%" EQU "*" echo SET SM4.1K=%SM4.1K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2K%" EQU "*" echo SET SM4.2K=%SM4.2K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3K%" EQU "*" echo SET SM4.3K=%SM4.3K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3U-DWR%" EQU "*" echo SET SM4.3U-DWR=%SM4.3U-DWR%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2U-DWR%" EQU "*" echo SET SM4.2U-DWR=%SM4.2U-DWR%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1U-DWR%" EQU "*" echo SET SM4.1U-DWR=%SM4.1U-DWR%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3E-DWR%" EQU "*" echo SET SM4.3E-DWR=%SM4.3E-DWR%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2E-DWR%" EQU "*" echo SET SM4.2E-DWR=%SM4.2E-DWR%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1E-DWR%" EQU "*" echo SET SM4.1E-DWR=%SM4.1E-DWR%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3J-DWR%" EQU "*" echo SET SM4.3J-DWR=%SM4.3J-DWR%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2J-DWR%" EQU "*" echo SET SM4.2J-DWR=%SM4.2J-DWR%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1J-DWR%" EQU "*" echo SET SM4.1J-DWR=%SM4.1J-DWR%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3K-DWR%" EQU "*" echo SET SM4.3K-DWR=%SM4.3K-DWR%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2K-DWR%" EQU "*" echo SET SM4.2K-DWR=%SM4.2K-DWR%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1K-DWR%" EQU "*" echo SET SM4.1K-DWR=%SM4.1K-DWR%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%SM4.3U-DWG%" EQU "*" echo SET SM4.3U-DWG=%SM4.3U-DWG%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2U-DWG%" EQU "*" echo SET SM4.2U-DWG=%SM4.2U-DWG%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1U-DWG%" EQU "*" echo SET SM4.1U-DWG=%SM4.1U-DWG%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3E-DWG%" EQU "*" echo SET SM4.3E-DWG=%SM4.3E-DWG%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2E-DWG%" EQU "*" echo SET SM4.2E-DWG=%SM4.2E-DWG%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1E-DWG%" EQU "*" echo SET SM4.1E-DWG=%SM4.1E-DWG%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3J-DWG%" EQU "*" echo SET SM4.3J-DWG=%SM4.3J-DWG%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2J-DWG%" EQU "*" echo SET SM4.2J-DWG=%SM4.2J-DWG%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1J-DWG%" EQU "*" echo SET SM4.1J-DWG=%SM4.1J-DWG%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3K-DWG%" EQU "*" echo SET SM4.3K-DWG=%SM4.3K-DWG%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2K-DWG%" EQU "*" echo SET SM4.2K-DWG=%SM4.2K-DWG%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1K-DWG%" EQU "*" echo SET SM4.1K-DWG=%SM4.1K-DWG%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%SM4.3U-DWB%" EQU "*" echo SET SM4.3U-DWB=%SM4.3U-DWB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2U-DWB%" EQU "*" echo SET SM4.2U-DWB=%SM4.2U-DWB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1U-DWB%" EQU "*" echo SET SM4.1U-DWB=%SM4.1U-DWB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3E-DWB%" EQU "*" echo SET SM4.3E-DWB=%SM4.3E-DWB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2E-DWB%" EQU "*" echo SET SM4.2E-DWB=%SM4.2E-DWB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1E-DWB%" EQU "*" echo SET SM4.1E-DWB=%SM4.1E-DWB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3J-DWB%" EQU "*" echo SET SM4.3J-DWB=%SM4.3J-DWB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2J-DWB%" EQU "*" echo SET SM4.2J-DWB=%SM4.2J-DWB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1J-DWB%" EQU "*" echo SET SM4.1J-DWB=%SM4.1J-DWB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3K-DWB%" EQU "*" echo SET SM4.3K-DWB=%SM4.3K-DWB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2K-DWB%" EQU "*" echo SET SM4.2K-DWB=%SM4.2K-DWB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1K-DWB%" EQU "*" echo SET SM4.1K-DWB=%SM4.1K-DWB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%SM4.3U-DWO%" EQU "*" echo SET SM4.3U-DWO=%SM4.3U-DWO%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2U-DWO%" EQU "*" echo SET SM4.2U-DWO=%SM4.2U-DWO%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1U-DWO%" EQU "*" echo SET SM4.1U-DWO=%SM4.1U-DWO%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3E-DWO%" EQU "*" echo SET SM4.3E-DWO=%SM4.3E-DWO%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2E-DWO%" EQU "*" echo SET SM4.2E-DWO=%SM4.2E-DWO%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1E-DWO%" EQU "*" echo SET SM4.1E-DWO=%SM4.1E-DWO%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3J-DWO%" EQU "*" echo SET SM4.3J-DWO=%SM4.3J-DWO%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2J-DWO%" EQU "*" echo SET SM4.2J-DWO=%SM4.2J-DWO%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1J-DWO%" EQU "*" echo SET SM4.1J-DWO=%SM4.1J-DWO%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.3K-DWO%" EQU "*" echo SET SM4.3K-DWO=%SM4.3K-DWO%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.2K-DWO%" EQU "*" echo SET SM4.2K-DWO=%SM4.2K-DWO%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SM4.1K-DWO%" EQU "*" echo SET SM4.1K-DWO=%SM4.1K-DWO%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%IOS30%" EQU "*" echo SET IOS30=%IOS30%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS30P60%" EQU "*" echo SET IOS30P60=%IOS30P60%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS20P60%" EQU "*" echo SET IOS20P60=%IOS20P60%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS30P%" EQU "*" echo SET IOS30P=%IOS30P%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS11P60%" EQU "*" echo SET IOS11P60=%IOS11P60%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS20P60%" EQU "*" echo SET IOS20P60=%IOS20P60%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS50P%" EQU "*" echo SET IOS50P=%IOS50P%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS52P%" EQU "*" echo SET IOS52P=%IOS52P%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS60%" EQU "*" echo SET IOS60=%IOS60%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS60P%" EQU "*" echo SET IOS60P=%IOS60P%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS70%" EQU "*" echo SET IOS70=%IOS70%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS70P%" EQU "*" echo SET IOS70P=%IOS70P%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS70K%" EQU "*" echo SET IOS70K=%IOS70K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS80%" EQU "*" echo SET IOS80=%IOS80%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS80P%" EQU "*" echo SET IOS80P=%IOS80P%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS80K%" EQU "*" echo SET IOS80K=%IOS80K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS236%" EQU "*" echo SET IOS236=%IOS236%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%BB1%" EQU "*" echo SET BB1=%BB1%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%BB2%" EQU "*" echo SET BB2=%BB2%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%HM%" EQU "*" echo SET HM=%HM%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS236Installer%" EQU "*" echo SET IOS236Installer=%IOS236Installer%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SIP%" EQU "*" echo SET SIP=%SIP%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%Y4M%" EQU "*" echo SET Y4M=%Y4M%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%dop%" EQU "*" echo SET dop=%dop%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%syscheck%" EQU "*" echo SET syscheck=%syscheck%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%sysCheckBeta%" EQU "*" echo SET sysCheckBeta=%sysCheckBeta%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%AccioHacks%" EQU "*" echo SET AccioHacks=%AccioHacks%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%MyM%" EQU "*" echo SET MyM=%MyM%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%locked%" EQU "*" echo SET locked=%locked%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%HBB%" EQU "*" echo SET HBB=%HBB%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%WII64%" EQU "*" echo SET WII64=%WII64%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%WIISX%" EQU "*" echo SET WIISX=%WIISX%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%bootmiisd%" EQU "*" echo SET bootmiisd=%bootmiisd%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%pwns%" EQU "*" echo SET pwns=%pwns%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%Twi%" EQU "*" echo SET Twi=%Twi%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%YUGI%" EQU "*" echo SET YUGI=%YUGI%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%BATHAXX%" EQU "*" echo SET BATHAXX=%BATHAXX%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%ROTJ%" EQU "*" echo SET ROTJ=%ROTJ%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%TOS%" EQU "*" echo SET TOS=%TOS%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%smash%" EQU "*" echo SET smash=%smash%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%mmm%" EQU "*" echo SET mmm=%mmm%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%yawm%" EQU "*" echo SET yawm=%yawm%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%neogamma%" EQU "*" echo SET neogamma=%neogamma%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cfg249%" EQU "*" echo SET cfg249=%cfg249%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cfg222%" EQU "*" echo SET cfg222=%cfg222%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%usbfolder%" EQU "*" echo SET usbfolder=%usbfolder%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%WiiMC%" EQU "*" echo SET WiiMC=%WiiMC%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%fceugx%" EQU "*" echo SET fceugx=%fceugx%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%snes9xgx%" EQU "*" echo SET snes9xgx=%snes9xgx%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%vbagx%" EQU "*" echo SET vbagx=%vbagx%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SGM%" EQU "*" echo SET SGM=%SGM%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%WIIX%" EQU "*" echo SET WIIX=%WIIX%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%wbm%" EQU "*" echo SET wbm=%wbm%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%CheatCodes%" EQU "*" echo SET CheatCodes=%CheatCodes%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%f32%" EQU "*" echo SET f32=%f32%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%CM%" EQU "*" echo SET CM=%CM%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SMW%" EQU "*" echo SET SMW=%SMW%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%WiiGSC%" EQU "*" echo SET WiiGSC=%WiiGSC%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%FLOW%" EQU "*" echo SET FLOW=%FLOW%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%USBX%" EQU "*" echo SET USBX=%USBX%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%JOYF%" EQU "*" echo SET JOYF=%JOYF%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%S2U%" EQU "*" echo SET S2U=%S2U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%HBF%" EQU "*" echo SET HBF=%HBF%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%JOY%" EQU "*" echo SET JOY=%JOY%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cfgr%" EQU "*" echo SET cfgr=%cfgr%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%Pri%" EQU "*" echo SET Pri=%Pri%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%HAX%" EQU "*" echo SET HAX=%HAX%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%MII%" EQU "*" echo SET MII=%MII%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%P0%" EQU "*" echo SET P0=%P0%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%P%" EQU "*" echo SET P=%P%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%PK%" EQU "*" echo SET PK=%PK%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%S%" EQU "*" echo SET S=%S%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%SK%" EQU "*" echo SET SK=%SK%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IU%" EQU "*" echo SET IU=%IU%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IE%" EQU "*" echo SET IE=%IE%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IJ%" EQU "*" echo SET IJ=%IJ%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%WU%" EQU "*" echo SET WU=%WU%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%WE%" EQU "*" echo SET WE=%WE%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%WJ%" EQU "*" echo SET WJ=%WJ%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%NU%" EQU "*" echo SET NU=%NU%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%NE%" EQU "*" echo SET NE=%NE%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%NJ%" EQU "*" echo SET NJ=%NJ%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%WSU%" EQU "*" echo SET WSU=%WSU%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%WSE%" EQU "*" echo SET WSE=%WSE%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%WSJ%" EQU "*" echo SET WSJ=%WSJ%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%M10%" EQU "*" echo SET M10=%M10%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS9%" EQU "*" echo SET IOS9=%IOS9%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS12%" EQU "*" echo SET IOS12=%IOS12%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS13%" EQU "*" echo SET IOS13=%IOS13%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS14%" EQU "*" echo SET IOS14=%IOS14%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS15%" EQU "*" echo SET IOS15=%IOS15%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS17%" EQU "*" echo SET IOS17=%IOS17%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS21%" EQU "*" echo SET IOS21=%IOS21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS22%" EQU "*" echo SET IOS22=%IOS22%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS28%" EQU "*" echo SET IOS28=%IOS28%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS31%" EQU "*" echo SET IOS31=%IOS31%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS33%" EQU "*" echo SET IOS33=%IOS33%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS34%" EQU "*" echo SET IOS34=%IOS34%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS35%" EQU "*" echo SET IOS35=%IOS35%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS36%" EQU "*" echo SET IOS36=%IOS36%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS36v3608%" EQU "*" echo SET IOS36v3608=%IOS36v3608%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS37%" EQU "*" echo SET IOS37=%IOS37%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS38%" EQU "*" echo SET IOS38=%IOS38%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS41%" EQU "*" echo SET IOS41=%IOS41%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS48v4124%" EQU "*" echo SET IOS48v4124=%IOS48v4124%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS43%" EQU "*" echo SET IOS43=%IOS43%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS45%" EQU "*" echo SET IOS45=%IOS45%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS46%" EQU "*" echo SET IOS46=%IOS46%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS53%" EQU "*" echo SET IOS53=%IOS53%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS55%" EQU "*" echo SET IOS55=%IOS55%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS56%" EQU "*" echo SET IOS56=%IOS56%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS57%" EQU "*" echo SET IOS57=%IOS57%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS58%" EQU "*" echo SET IOS58=%IOS58%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%IOS61%" EQU "*" echo SET IOS61=%IOS61%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%A0e%" EQU "*" echo SET A0e=%A0e%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A01%" EQU "*" echo SET A01=%A01%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%A0e_70%" EQU "*" echo SET A0e_70=%A0e_70%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A01%" EQU "*" echo SET A01__60=%A01_60%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A0e_60%" EQU "*" echo SET A0e_60=%A0e_60%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A01%" EQU "*" echo SET A01=%A01%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A0c%" EQU "*" echo SET A0c=%A0c%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%A40%" EQU "*" echo SET A40=%A40%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A42%" EQU "*" echo SET A42=%A42%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A45%" EQU "*" echo SET A45=%A45%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A70%" EQU "*" echo SET A70=%A70%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A72%" EQU "*" echo SET A72=%A72%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A75%" EQU "*" echo SET A75=%A75%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A78%" EQU "*" echo SET A78=%A78%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A7b%" EQU "*" echo SET A7b=%A7b%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A7e%" EQU "*" echo SET A7e=%A7e%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A84%" EQU "*" echo SET A84=%A84%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A87%" EQU "*" echo SET A87=%A87%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A8a%" EQU "*" echo SET A8a=%A8a%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%A81%" EQU "*" echo SET A81=%A81%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A8d%" EQU "*" echo SET A8d=%A8d%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A9d%" EQU "*" echo SET A9d=%A9d%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%A94%" EQU "*" echo SET A94=%A94%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A97%" EQU "*" echo SET A97=%A97%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%A9a%" EQU "*" echo SET A9a=%A9a%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS202[37]-v5%" EQU "*" echo SET cIOS202[37]-v5=%cIOS202[37]-v5%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS202[38]-v5%" EQU "*" echo SET cIOS202[38]-v5=%cIOS202[38]-v5%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS222[38]-v4%" EQU "*" echo SET cIOS222[38]-v4=%cIOS222[38]-v4%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%cIOS223[37-38]-v4%" EQU "*" echo SET cIOS223[37-38]-v4=%cIOS223[37-38]-v4%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cBC%" EQU "*" echo SET cBC=%cBC%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DML%" EQU "*" echo SET DML=%DML%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS222[38]-v5%" EQU "*" echo SET cIOS222[38]-v5=%cIOS222[38]-v5%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS223[37]-v5%" EQU "*" echo SET cIOS223[37]-v5=%cIOS223[37]-v5%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS224[57]-v5%" EQU "*" echo SET cIOS224[57]-v5=%cIOS224[57]-v5%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"


if /i "%cIOS202[60]-v5.1R%" EQU "*" echo SET cIOS202[60]-v5.1R=%cIOS202[60]-v5.1R%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS222[38]-v5.1R%" EQU "*" echo SET cIOS222[38]-v5.1R=%cIOS222[38]-v5.1R%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS223[37]-v5.1R%" EQU "*" echo SET cIOS223[37]-v5.1R=%cIOS223[37]-v5.1R%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS224[57]-v5.1R%" EQU "*" echo SET cIOS224[57]-v5.1R=%cIOS224[57]-v5.1R%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249-v14%" EQU "*" echo SET cIOS249-v14=%cIOS249-v14%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249-v17b%" EQU "*" echo SET cIOS249-v17b=%cIOS249-v17b%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[37]-v19%" EQU "*" echo SET cIOS249[37]-v19=%cIOS249[37]-v19%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[38]-v19%" EQU "*" echo SET cIOS249[38]-v19=%cIOS249[38]-v19%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[57]-v19%" EQU "*" echo SET cIOS249[57]-v19=%cIOS249[57]-v19%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250-v14%" EQU "*" echo SET cIOS250-v14=%cIOS250-v14%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250-v17b%" EQU "*" echo SET cIOS250-v17b=%cIOS250-v17b%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[37]-v19%" EQU "*" echo SET cIOS250[37]-v19=%cIOS250[37]-v19%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[38]-v19%" EQU "*" echo SET cIOS250[38]-v19=%cIOS250[38]-v19%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[57]-v19%" EQU "*" echo SET cIOS250[57]-v19=%cIOS250[57]-v19%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[38]-v20%" EQU "*" echo SET cIOS249[38]-v20=%cIOS249[38]-v20%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[38]-v20%" EQU "*" echo SET cIOS250[38]-v20=%cIOS250[38]-v20%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[56]-v20%" EQU "*" echo SET cIOS249[56]-v20=%cIOS249[56]-v20%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[56]-v20%" EQU "*" echo SET cIOS250[56]-v20=%cIOS250[56]-v20%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[57]-v20%" EQU "*" echo SET cIOS249[57]-v20=%cIOS249[57]-v20%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[57]-v20%" EQU "*" echo SET cIOS250[57]-v20=%cIOS250[57]-v20%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[37]-v21%" EQU "*" echo SET cIOS249[37]-v21=%cIOS249[37]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[37]-v21%" EQU "*" echo SET cIOS250[37]-v21=%cIOS250[37]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[38]-v21%" EQU "*" echo SET cIOS249[38]-v21=%cIOS249[38]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[38]-v21%" EQU "*" echo SET cIOS250[38]-v21=%cIOS250[38]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[53]-v21%" EQU "*" echo SET cIOS249[53]-v21=%cIOS249[53]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[53]-v21%" EQU "*" echo SET cIOS250[53]-v21=%cIOS250[53]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[55]-v21%" EQU "*" echo SET cIOS249[55]-v21=%cIOS249[55]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[55]-v21%" EQU "*" echo SET cIOS250[55]-v21=%cIOS250[55]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[56]-v21%" EQU "*" echo SET cIOS249[56]-v21=%cIOS249[56]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[56]-v21%" EQU "*" echo SET cIOS250[56]-v21=%cIOS250[56]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[57]-v21%" EQU "*" echo SET cIOS249[57]-v21=%cIOS249[57]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[57]-v21%" EQU "*" echo SET cIOS250[57]-v21=%cIOS250[57]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[58]-v21%" EQU "*" echo SET cIOS249[58]-v21=%cIOS249[58]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[58]-v21%" EQU "*" echo SET cIOS250[58]-v21=%cIOS250[58]-v21%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[37]-d2x-v6%" EQU "*" echo SET cIOS249[37]-d2x-v6=%cIOS249[37]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[38]-d2x-v6%" EQU "*" echo SET cIOS249[38]-d2x-v6=%cIOS249[38]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[56]-d2x-v6%" EQU "*" echo SET cIOS249[56]-d2x-v6=%cIOS249[56]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[53]-d2x-v6%" EQU "*" echo SET cIOS249[53]-d2x-v6=%cIOS249[53]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[55]-d2x-v6%" EQU "*" echo SET cIOS249[55]-d2x-v6=%cIOS249[55]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[57]-d2x-v6%" EQU "*" echo SET cIOS249[57]-d2x-v6=%cIOS249[57]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS249[58]-d2x-v6%" EQU "*" echo SET cIOS249[58]-d2x-v6=%cIOS249[58]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[37]-d2x-v6%" EQU "*" echo SET cIOS250[37]-d2x-v6=%cIOS250[37]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[38]-d2x-v6%" EQU "*" echo SET cIOS250[38]-d2x-v6=%cIOS250[38]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[53]-d2x-v6%" EQU "*" echo SET cIOS250[53]-d2x-v6=%cIOS250[53]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[55]-d2x-v6%" EQU "*" echo SET cIOS250[55]-d2x-v6=%cIOS250[55]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[56]-d2x-v6%" EQU "*" echo SET cIOS250[56]-d2x-v6=%cIOS250[56]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[57]-d2x-v6%" EQU "*" echo SET cIOS250[57]-d2x-v6=%cIOS250[57]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%cIOS250[58]-d2x-v6%" EQU "*" echo SET cIOS250[58]-d2x-v6=%cIOS250[58]-d2x-v6%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2%" EQU "*" echo SET RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=%RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%RVL-cmios-v4_WiiGator_GCBL_v0.2%" EQU "*" echo SET RVL-cmios-v4_WiiGator_GCBL_v0.2=%RVL-cmios-v4_WiiGator_GCBL_v0.2%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%RVL-cmios-v4_Waninkoko_rev5%" EQU "*" echo SET RVL-cmios-v4_Waninkoko_rev5=%RVL-cmios-v4_Waninkoko_rev5%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%DarkWii_Red_4.3U%" EQU "*" echo SET DarkWii_Red_4.3U=%DarkWii_Red_4.3U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Red_4.2U%" EQU "*" echo SET DarkWii_Red_4.2U=%DarkWii_Red_4.2U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Red_4.1U%" EQU "*" echo SET DarkWii_Red_4.1U=%DarkWii_Red_4.1U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Red_4.3E%" EQU "*" echo SET DarkWii_Red_4.3E=%DarkWii_Red_4.3E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Red_4.2E%" EQU "*" echo SET DarkWii_Red_4.2E=%DarkWii_Red_4.2E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Red_4.1E%" EQU "*" echo SET DarkWii_Red_4.1E=%DarkWii_Red_4.1E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Red_4.3J%" EQU "*" echo SET DarkWii_Red_4.3J=%DarkWii_Red_4.3J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Red_4.2J%" EQU "*" echo SET DarkWii_Red_4.2J=%DarkWii_Red_4.2J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Red_4.1J%" EQU "*" echo SET DarkWii_Red_4.1J=%DarkWii_Red_4.1J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Red_4.3K%" EQU "*" echo SET DarkWii_Red_4.3K=%DarkWii_Red_4.3K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Red_4.2K%" EQU "*" echo SET DarkWii_Red_4.2K=%DarkWii_Red_4.2K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Red_4.1K%" EQU "*" echo SET DarkWii_Red_4.1K=%DarkWii_Red_4.1K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%DarkWii_Green_4.3U%" EQU "*" echo SET DarkWii_Green_4.3U=%DarkWii_Green_4.3U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Green_4.2U%" EQU "*" echo SET DarkWii_Green_4.2U=%DarkWii_Green_4.2U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Green_4.1U%" EQU "*" echo SET DarkWii_Green_4.1U=%DarkWii_Green_4.1U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Green_4.3E%" EQU "*" echo SET DarkWii_Green_4.3E=%DarkWii_Green_4.3E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Green_4.2E%" EQU "*" echo SET DarkWii_Green_4.2E=%DarkWii_Green_4.2E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Green_4.1E%" EQU "*" echo SET DarkWii_Green_4.1E=%DarkWii_Green_4.1E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Green_4.3J%" EQU "*" echo SET DarkWii_Green_4.3J=%DarkWii_Green_4.3J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Green_4.2J%" EQU "*" echo SET DarkWii_Green_4.2J=%DarkWii_Green_4.2J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Green_4.1J%" EQU "*" echo SET DarkWii_Green_4.1J=%DarkWii_Green_4.1J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Green_4.3K%" EQU "*" echo SET DarkWii_Green_4.3K=%DarkWii_Green_4.3K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Green_4.2K%" EQU "*" echo SET DarkWii_Green_4.2K=%DarkWii_Green_4.2K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Green_4.1K%" EQU "*" echo SET DarkWii_Green_4.1K=%DarkWii_Green_4.1K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%DarkWii_Blue_4.3U%" EQU "*" echo SET DarkWii_Blue_4.3U=%DarkWii_Blue_4.3U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Blue_4.2U%" EQU "*" echo SET DarkWii_Blue_4.2U=%DarkWii_Blue_4.2U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Blue_4.1U%" EQU "*" echo SET DarkWii_Blue_4.1U=%DarkWii_Blue_4.1U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Blue_4.3E%" EQU "*" echo SET DarkWii_Blue_4.3E=%DarkWii_Blue_4.3E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Blue_4.2E%" EQU "*" echo SET DarkWii_Blue_4.2E=%DarkWii_Blue_4.2E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Blue_4.1E%" EQU "*" echo SET DarkWii_Blue_4.1E=%DarkWii_Blue_4.1E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Blue_4.3J%" EQU "*" echo SET DarkWii_Blue_4.3J=%DarkWii_Blue_4.3J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Blue_4.2J%" EQU "*" echo SET DarkWii_Blue_4.2J=%DarkWii_Blue_4.2J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Blue_4.1J%" EQU "*" echo SET DarkWii_Blue_4.1J=%DarkWii_Blue_4.1J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Blue_4.3K%" EQU "*" echo SET DarkWii_Blue_4.3K=%DarkWii_Blue_4.3K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Blue_4.2K%" EQU "*" echo SET DarkWii_Blue_4.2K=%DarkWii_Blue_4.2K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%DarkWii_Blue_4.1K%" EQU "*" echo SET DarkWii_Blue_4.1K=%DarkWii_Blue_4.1K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

if /i "%darkwii_orange_4.3U%" EQU "*" echo SET darkwii_orange_4.3U=%darkwii_orange_4.3U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%darkwii_orange_4.2U%" EQU "*" echo SET darkwii_orange_4.2U=%darkwii_orange_4.2U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%darkwii_orange_4.1U%" EQU "*" echo SET darkwii_orange_4.1U=%darkwii_orange_4.1U%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%darkwii_orange_4.3E%" EQU "*" echo SET darkwii_orange_4.3E=%darkwii_orange_4.3E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%darkwii_orange_4.2E%" EQU "*" echo SET darkwii_orange_4.2E=%darkwii_orange_4.2E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%darkwii_orange_4.1E%" EQU "*" echo SET darkwii_orange_4.1E=%darkwii_orange_4.1E%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%darkwii_orange_4.3J%" EQU "*" echo SET darkwii_orange_4.3J=%darkwii_orange_4.3J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%darkwii_orange_4.2J%" EQU "*" echo SET darkwii_orange_4.2J=%darkwii_orange_4.2J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%darkwii_orange_4.1J%" EQU "*" echo SET darkwii_orange_4.1J=%darkwii_orange_4.1J%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%darkwii_orange_4.3K%" EQU "*" echo SET darkwii_orange_4.3K=%darkwii_orange_4.3K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%darkwii_orange_4.2K%" EQU "*" echo SET darkwii_orange_4.2K=%darkwii_orange_4.2K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"
if /i "%darkwii_orange_4.1K%" EQU "*" echo SET darkwii_orange_4.1K=%darkwii_orange_4.1K%>> "temp\DownloadQueues\%DLQUEUENAME%.bat"

support\sfk filter "temp\DownloadQueues\%DLQUEUENAME%.bat" -unique -write -yes>nul


if not exist temp\DLGotosADV.txt goto:quickskip
::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\DLGotosADV.txt) do call :process1 %%A
goto:quickskip
:process1
set AdvDLX=%*
set /a AdvNumberCOPY2=%AdvNumberCOPY2%+1
echo "echo %AdvDLX:~0,10%%AdvNumberCOPY2%.batredirectredirecttemp\DLGotosADV.txt">>"temp\DownloadQueues\%DLQUEUENAME%.bat"
goto:EOF
:quickskip


if not exist temp\DLnamesADV.txt goto:quickskip
::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\DLnamesADV.txt) do call :process2 %%A
goto:quickskip
:process2
echo "echo %* redirectredirecttemp\DLnamesADV.txt">>"temp\DownloadQueues\%DLQUEUENAME%.bat"
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

echo "Si existe %AdvDLX:~0,10%%AdvNumberCOPY3%.bat del %AdvDLX:~0,10%%AdvNumberCOPY3%.batredirectnul">>"temp\DownloadQueues\%DLQUEUENAME%.bat"

for /F "tokens=*" %%A in (%AdvDLX%) do call :process4 %%A
goto:tinyskip
:process4

echo "echo quote%*quoteredirectredirect%AdvDLX:~0,10%%AdvNumberCOPY3%.bat">>"temp\DownloadQueues\%DLQUEUENAME%.bat"


goto:EOF
:tinyskip

support\sfk filter -quiet temp\DLGotosADV-copy.txt -le!"%AdvDLX:~5%" -write -yes

echo "support\sfk filter -quiet %AdvDLX:~0,10%%AdvNumberCOPY3%.bat -rep _quotequotequote__ -write -yes">>"temp\DownloadQueues\%DLQUEUENAME%.bat"


goto:doitagain
::goto:EOF
:quickskip

echo ":endofqueue">>"temp\DownloadQueues\%DLQUEUENAME%.bat"

support\sfk filter "temp\DownloadQueues\%DLQUEUENAME%.bat" -rep _"redirect"_">"_ -write -yes>nul
support\sfk filter -quiet "temp\DownloadQueues\%DLQUEUENAME%.bat" -rep _"""__ -write -yes
support\sfk filter -quiet -spat "temp\DownloadQueues\%DLQUEUENAME%.bat" -rep _quote_\x22_ -rep _@_%%_ -write -yes

support\sfk filter -quiet "temp\DownloadQueues\%DLQUEUENAME%.bat" -rep _"set AdvNumber="*_"set AdvNumber=%AdvNumberCOPY%"_ -write -yes


::support\sfk filter "temp\DownloadQueues\%DLQUEUENAME%.bat" -spat -rep _@_%%_ -write -yes>nul



if exist "temp\DownloadQueues\%DLQUEUENAME%.bat" echo                                  Download Queue Saved
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
echo                                       by XFlak
echo.
echo      %Drive%\WAD la Carpeta ya existe, que te gustaria hacer?
echo.
echo           M = Combinar con descarga archivo existente %Drive%\WAD.
echo               Duplicados se omiten.
echo.
echo           R = Cambiar el titulo de la carpeta %Drive%\WAD para %Drive%\WAD#
echo               y comenzar la descarga.
echo.
echo           C = Cancelar/Menu Principal
echo.
echo           E = Salir
echo.
set /p COPY=     Escriba la seleccion aqui: 

if /i "%COPY%" EQU "M" goto:DLSettings
if /i "%COPY%" EQU "E" EXIT
if /i "%COPY%" EQU "C" goto:MENU

if /i "%COPY%" NEQ "R" echo Ha introducido una clave incorrecta
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
if /i "%retry%" EQU "1" support\sfk echo [Red]Descargar %CURRENTDL% de %DLTOTAL%: %name%
if /i "%retry%" NEQ "1" support\sfk echo [Yellow]Volver a descargar %CURRENTDL% de %DLTOTAL%: %name%
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
if /i "%category%" EQU "FORWARDER" goto:FORWARDER



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
support\sfk md5 -quiet -verify %md5% "%Drive%"\WAD\%wadname%
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

support\sfk md5 -quiet -verify %md5alt% "%Drive%"\WAD\%wadname%
if errorlevel 1 set md5altcheck=fail
IF "%md5altcheck%"=="" set md5altcheck=pass
if /i "%md5altcheck%" NEQ "fail" goto:pass

:fail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y el archivo se volvera a descargar.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%"\WAD\%wadname%>nul
if exist temp\%wadname% del temp\%wadname%>nul
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

support\sfk echo [Green]Este archivo ya existe y ha sido verificado, Saltarse descarga
echo.
set alreadyexists=yes
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %wadname%: Valido">>temp\ModMii_Log.bat
goto:NEXT
:nocheckexisting



::SAVE TO WAD FOLDER ONLY

if not exist "%Drive%"\WAD mkdir "%Drive%"\WAD

if exist temp\%wadname% goto:AlreadyinTemp
echo     Si se encuentra con largos periodos de inactividad, de tipo "C" mientras se mantiene "Ctrl",
echo     a continuacion, escriba "N", despues "Enter" (ie. Ctrl+C = N = Enter)
echo.

support\nusd %code1%%code2% %version%
move /y Support\%code1%%code2%\%code1%%code2%.wad temp\%wadname%>nul


if not exist temp\%code1%\%code2%\v%version% mkdir temp\%code1%\%code2%\v%version%
copy /y support\%code1%%code2% temp\%code1%\%code2%\v%version%\ >nul
rd /s /q support\%code1%%code2%

:AlreadyinTemp
if /i "%MENU1%" NEQ "S" copy /y temp\%wadname% "%Drive%"\WAD\%wadname% >nul
if /i "%MENU1%" EQU "S" move /y temp\%wadname% "%Drive%"\WAD\%wadname% >nul

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
::----comprobar despu�s de la descarga - si no comprobar md5, borrar y volver a descargar----
if exist "%Drive%"\WAD\%wadname% goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %wadname%: [Red]fallo">>temp\ModMii_Log.bat
echo.
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
set md5check=
set md5altcheck=
support\sfk md5 -quiet -verify %md5% "%Drive%"\WAD\%wadname%
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass
support\sfk md5 -quiet -verify %md5alt% "%Drive%"\WAD\%wadname%
if errorlevel 1 set md5altcheck=fail
IF "%md5altcheck%"=="" set md5altcheck=pass
if /i "%md5altcheck%" NEQ "fail" goto:pass

:fail
echo.
if /i "%attempt%" NEQ "1" goto:multiplefail
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado.
echo.
del "%Drive%"\WAD\%wadname%>nul
if exist temp\%wadname% del temp\%wadname%>nul
if exist temp\%code1%\%code2%\v%version% rd /s /q temp\%code1%\%code2%\v%version%
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
set multiplefail=Y
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %wadname%: [Red]Invalido">>temp\ModMii_Log.bat
goto:NEXT

:pass
echo.
support\sfk echo [Green]Descargado con exito
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %wadname%: Valido">>temp\ModMii_Log.bat
goto:NEXT



::-------------------------------cIOS Maker-----------------------------------------------------
:CIOSMAKER

if "%wadname:~-4%" EQU ".wad" set wadname=%wadname:~0,-4%

::----if exist and fails md5 check, delete and redownload----
if exist "%Drive%"\WAD\%wadname%.wad (goto:checkexisting) else (goto:nocheckexisting)
:checkexisting
set md5check=
set md5altcheck=
support\sfk md5 -quiet -verify %md5% "%Drive%"\WAD\%wadname%.wad
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

support\sfk md5 -quiet -verify %md5alt% "%Drive%"\WAD\%wadname%.wad
if errorlevel 1 set md5altcheck=fail
IF "%md5altcheck%"=="" set md5altcheck=pass
if /i "%md5altcheck%" NEQ "fail" goto:pass

:fail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%"\WAD\%wadname%.wad>nul
goto:DOWNLOADSTART2

:pass
support\sfk echo [Green]Este archivo ya existe y ha sido verificado, Saltar descarga
echo.
set alreadyexists=yes
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %wadname%.wad: Valido">>temp\ModMii_Log.bat
goto:NEXT
:nocheckexisting



::missing Support folder error message and skip
if not exist Support support\sfk echo -spat [Yellow] Falta carpeta "Soporte" - Requerido para hacer cIOSs/cMIOSs
if not exist Support support\sfk echo -spat \x20 \x20 [Yellow] Volver a descargar de ModMii tinyurl.com/ModMiiNow
if not exist Support support\sfk echo -spat \x20 \x20 [Yellow] Saltarse descarga
if not exist Support @ping 127.0.0.1 -n 5 -w 1000> nul
if not exist Support goto:NEXT


if not exist "%Drive%"\WAD mkdir "%Drive%"\WAD


:downloadbasewad
::download base wad to "%Drive%"
echo.
echo Descargar Base Wad: %basewad%
echo.




::----Check base IOS-----------
::----if exist and fails md5 check, delete and redownload----
if exist temp\%basewad%.wad (goto:checkexisting) else (goto:nocheckexisting)
:checkexisting
set md5basecheck=
set md5basealtcheck=
support\sfk md5 -quiet -verify %md5base% temp\%basewad%.wad
if errorlevel 1 set md5basecheck=fail
IF "%md5basecheck%"=="" set md5basecheck=pass
if /i "%md5basecheck%" NEQ "fail" goto:pass

support\sfk md5 -quiet -verify %md5basealt% temp\%basewad%.wad
if errorlevel 1 set md5basealtcheck=fail
IF "%md5basealtcheck%"=="" set md5basealtcheck=pass
if /i "%md5basealtcheck%" NEQ "fail" goto:pass

:fail
echo.
support\sfk echo [Yellow] Esta base wad ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
del temp\%basewad%.wad>nul
goto:downloadbasewad

:pass
echo.
support\sfk echo -spat \x20 \x20 \x20 [Green] Base Wad ya existe y se ha verificado, continua...
echo.
goto:basealreadythere
:nocheckexisting


echo     Si se encuentra con largos per�odos de inactividad, de tipo "C" mientras mantiene "Ctrl",
echo     a continuaci�n, escriba "N", despues "Enter" (ie. Ctrl+C = N = Enter)
echo.

support\nusd %code1%%code2% %version%
if not exist "%Drive%"\WAD mkdir "%Drive%"\WAD
move /y support\%code1%%code2%\%code1%%code2%.wad temp\%basewad%.wad>nul
rd /s /q support\%code1%%code2%


::----check after downloading - if md5 check fails, delete and redownload----
if exist temp\%basewad%.wad goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %wadname%.wad: [Red]Fallo">>temp\ModMii_Log.bat
echo.
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] La basewad falta, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:downloadbasewad

:checkexisting
set md5basecheck=
set md5basealtcheck=
support\sfk md5 -quiet -verify %md5base% temp\%basewad%.wad
if errorlevel 1 set md5basecheck=fail
IF "%md5basecheck%"=="" set md5basecheck=pass
if /i "%md5basecheck%" NEQ "fail" goto:pass

support\sfk md5 -quiet -verify %md5basealt% temp\%basewad%.wad
if errorlevel 1 set md5basealtcheck=fail
IF "%md5basealtcheck%"=="" set md5basealtcheck=pass
if /i "%md5basealtcheck%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado
echo.
del temp\%basewad%.wad>nul
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:downloadbasewad

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %wadname%.wad: [Red]Invalido">>temp\ModMii_Log.bat
set multiplefail=Y
echo.
goto:NEXT

:pass
echo.
support\sfk echo -spat \x20 \x20 \x20 [Green] La base Wad se ha descargado correctamente, continuar...
echo.

:basealreadythere


::----------PATCHIOS Category-------------
if /i "%category%" NEQ "patchios" goto:notpatchios
if not "%lastbasemodule%"=="" goto:notpatchios
copy /y temp\%basewad%.wad "%Drive%"\WAD\%wadname%.wad>nul
cd support
if /i "%DRIVE:~1,1%" EQU ":" (set DRIVEadj=%DRIVE%) else (set DRIVEadj=..\%DRIVE%)
if "%lastbasemodule%"=="" patchios "%DRIVEadj%"\WAD\%wadname%.wad -FS -ES -NP -VP -slot %ciosslot% -v %ciosversion%
if not "%lastbasemodule%"=="" patchios "%DRIVEadj%"\WAD\%wadname%.wad -FS -ES -NP -VP
cd..
if "%wadname:~-4%" NEQ ".wad" set wadname=%wadname%.wad
goto:wadverifyretry
:notpatchios
::----------------------------------------

::unpack base wad
echo.
echo Desempaquetar Base Wad: %basewad%
echo.

if exist %basecios% rd /s /q %basecios%
mkdir %basecios%
support\wadmii -in temp\%basewad%.wad -out %basecios%



:downloadbasewadb
::download SECOND base wadB to "%Drive%" (if applicable)
if /i "%basewadb%" EQU "none" goto:nobasewadb

echo.
echo Descargar Base Wad: %basewadb%
echo.


::----Check base IOS B-----------
::----if exist and fails md5 check, delete and redownload----
if exist temp\%basewadb%.wad (goto:checkexisting) else (goto:nocheckexisting)
:checkexisting
set md5basebcheck=
set md5basebaltcheck=
support\sfk md5 -quiet -verify %md5baseb% temp\%basewadb%.wad
if errorlevel 1 set md5basebcheck=fail
IF "%md5basebcheck%"=="" set md5basebcheck=pass
if /i "%md5basebcheck%" NEQ "fail" goto:pass

support\sfk md5 -quiet -verify %md5basebalt% temp\%basewadb%.wad
if errorlevel 1 set md5basebaltcheck=fail
IF "%md5basebaltcheck%"=="" set md5basebaltcheck=pass
if /i "%md5basebaltcheck%" NEQ "fail" goto:pass

:fail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo
echo.
del temp\%basewadb%.wad>nul
goto:downloadbasewadb

:pass
echo.
support\sfk echo -spat \x20 \x20 \x20 [Green] La base Wad se ha descargado correctamente, continuar...
echo.
goto:baseBalreadythere
:nocheckexisting


echo     Si se encuentra con largos per�odos de inactividad, de tipo "C" mientras mantiene "Ctrl",
echo     a continuaci�n, escriba "N", despues "Enter" (ie. Ctrl+C = N = Enter)
echo.

support\nusd %code1b%%code2b% %versionb%
if not exist "%Drive%"\WAD mkdir "%Drive%"\WAD
move /y support\%code1b%%code2b%\%code1b%%code2b%.wad temp\%basewadb%.wad>nul
rd /s /q support\%code1b%%code2b%




::----check after downloading - if md5 check fails, delete and redownload----
if exist temp\%basewadb%.wad goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %wadname%.wad: [Red]Fallo">>temp\ModMii_Log.bat
echo.
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] La basewad falta, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:downloadbasewadb

:checkexisting
set md5basebcheck=
set md5basebaltcheck=
support\sfk md5 -quiet -verify %md5baseb% temp\%basewadb%.wad
if errorlevel 1 set md5basebcheck=fail
IF "%md5basebcheck%"=="" set md5basebcheck=pass
if /i "%md5basebcheck%" NEQ "fail" goto:pass

support\sfk md5 -quiet -verify %md5basebalt% temp\%basewadb%.wad
if errorlevel 1 set md5basebaltcheck=fail
IF "%md5basebaltcheck%"=="" set md5basebaltcheck=pass
if /i "%md5basebaltcheck%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
del temp\%basewadb%.wad>nul
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:downloadbasewadb

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %wadname%.wad: [Red]Invalido">>temp\ModMii_Log.bat
echo.
set multiplefail=Y
goto:NEXT

:pass
echo.
support\sfk echo -spat \x20 \x20 \x20 [Green] La base Wad se ha descargado correctamente, continuar...
echo.

:baseBalreadythere

::----unpack base wad
echo.
echo Unpacking Base Wad: %basewadb%
echo.

mkdir %basewadb%
support\wadmii -in temp\%basewadb%.wad -out %basewadb%


if /i "%wadname:~0,3%" EQU "cBC" goto:cbc-stuff

::----specific for cios223v4[37+38]
::move modules that are from 38 and to be patched
move /y %basewadb%\00000001.app %basecios%\00000001.app>nul
move /y %basewadb%\%lastbasemodule%.app %basecios%\%lastbasemodule%.app>nul
rd /s /q %basewadb%
goto:nobasewadb


:cbc-stuff

::download NMM\DML-installer if missing
if exist "temp\%dlname:~0,-4%\FixElf\FixELF.exe" goto:gotit

::download unrar if missing
if not exist temp\UnRAR.exe echo.
if not exist temp\UnRAR.exe echo Downloading UnRAR
if not exist temp\UnRAR.exe start %ModMiimin%/wait support\wget -t 3 "http://files.cybergamer.com.au/richard/FIFA Online 2 Full Client v200/UnRAR.exe"
if exist UnRAR.exe move /y UnRAR.exe temp\UnRAR.exe>nul


echo.
echo Descargar %dlname%
if not exist "%dlname%" start %ModMiimin%/wait support\wget -t 3 "%URL%"
echo.

if not exist "%dlname%" (rd /s /q %basewadb%) & (rd /s /q %basecios%) & (echo.) & (support\sfk echo [Magenta] %dlname% No se ha podido descargar correctamente, saltar descarga.) & (echo "support\sfk echo %wadname%.wad: [Red]Fallo">>temp\ModMii_Log.bat) & (echo.) & (goto:NEXT)


if not exist "temp\%dlname:~0,-4%" mkdir "temp\%dlname:~0,-4%"
temp\unrar.exe x -y %dlname% "temp\%dlname:~0,-4%">nul

if exist %dlname% del %dlname%>nul

:gotit
if exist "temp\%dlname:~0,-4%\%wadname:~4,3%.elf" move /y "temp\%dlname:~0,-4%\%wadname:~4,3%.elf" "temp\%dlname:~0,-4%\FixElf\%wadname:~4,3%.elf">nul

move /y "%basewadb%\00000001.app" "temp\%dlname:~0,-4%\FixElf\MIOS.app">nul
rd /s /q %basewadb%


cd "temp\%dlname:~0,-4%\FixElf"


if exist 00000001.app del 00000001.app>nul

echo.
echo Running Crediar's FixELF to patch MIOS.app
echo.
FixELF MIOS.app %wadname:~4,3%.elf 00000001.app>nul
cd..
cd..
cd..

move /y "temp\%dlname:~0,-4%\FixElf\00000001.app" "%basecios%\00000001.app">nul

goto:repackwad




:nobasewadb



::------for theming system menu's only----------
if /i "%category%" NEQ "SMTHEME" goto:skip
goto:mym_download
:SMTHEME2

echo.
echo Patching System Theme, please wait...
echo.

rename %basecios%\00000001.app 00000001-original.app

cd temp
TMCL.exe "%mym1%" -A "%ModMiipath%\%basecios%\00000001-original.app" -o temp.csm>nul
TMCL.exe "%mym2%" -A temp.csm -o "%ModMiipath%\%basecios%\00000001.app">nul
if exist temp.csm del temp.csm>nul
cd..

del %basecios%\00000001-original.app>nul

goto:repackwad
:skip





::-----cios/cmios stuff------------
::rename *.cert and *.footer (doesn't need to be patched), rename components that need to be patched (excluding tik and tmd)

echo.
echo Parchear algunos archivos de componente BaseWad
echo.

if /i "%code2%" NEQ "%code2new%" ren %basecios%\%code1%%code2%.cert %code1%%code2new%.cert
if /i "%code2%" NEQ "%code2new%" ren %basecios%\%code1%%code2%.footer %code1%%code2new%.footer

if exist support\Diffs\%diffpath%\%diffpath%_00.diff ren %basecios%\00000000.app 00000000-original.app
if exist support\Diffs\%diffpath%\%diffpath%_01.diff ren %basecios%\00000001.app 00000001-original.app
if exist support\Diffs\%diffpath%\%diffpath%_02.diff ren %basecios%\00000002.app 00000002-original.app
if exist support\Diffs\%diffpath%\%diffpath%_%lastbasemodule%.diff ren %basecios%\%lastbasemodule%.app %lastbasemodule%-original.app


::rename tik & tmd for cMIOSs
if /i "%code2%" EQU "00000101" goto:rename
if /i "%category%" EQU "patchios" goto:rename
goto:notcMIOS
:rename
::ren %basecios%\%code1%%code2new%.tik %code1%%code2new%-original.tik

ren %basecios%\%code1%%code2new%.tmd %code1%%code2new%-original.tmd

:notcMIOS




::-------------diff patch files----------------
if exist support\Diffs\%diffpath%\%diffpath%_00.diff support\jptch  %basecios%\00000000-original.app support\Diffs\%diffpath%\%diffpath%_00.diff %basecios%\00000000.app
if exist support\Diffs\%diffpath%\%diffpath%_01.diff support\jptch  %basecios%\00000001-original.app support\Diffs\%diffpath%\%diffpath%_01.diff %basecios%\00000001.app
if exist support\Diffs\%diffpath%\%diffpath%_02.diff support\jptch  %basecios%\00000002-original.app support\Diffs\%diffpath%\%diffpath%_02.diff %basecios%\00000002.app
if exist support\Diffs\%diffpath%\%diffpath%_%lastbasemodule%.diff support\jptch  %basecios%\%lastbasemodule%-original.app support\Diffs\%diffpath%\%diffpath%_%lastbasemodule%.diff %basecios%\%lastbasemodule%.app


::patch tmd and tiks when they've been renamed to *-original.tik\tmd (for cMIOSs)
if /i "%code2%" EQU "00000101" goto:RenamedOriginal
if /i "%category%" EQU "patchios" goto:RenamedOriginal
goto:NotRenamedOriginal
:RenamedOriginal
::if exist support\Diffs\%diffpath%\%diffpath%_tik.diff support\jptch  %basecios%\%code1%%code2%-original.tik support\Diffs\%diffpath%\%diffpath%_tik.diff %basecios%\%code1%%code2new%.tik

if exist support\Diffs\%diffpath%\%diffpath%_tmd.diff support\jptch  %basecios%\%code1%%code2%-original.tmd support\Diffs\%diffpath%\%diffpath%_tmd.diff %basecios%\%code1%%code2new%.tmd
goto:deletefiles

:NotRenamedOriginal
if exist support\Diffs\%diffpath%\%diffpath%_tmd.diff support\jptch  %basecios%\%code1%%code2%.tmd support\Diffs\%diffpath%\%diffpath%_tmd.diff %basecios%\%code1%%code2new%.tmd

::use different tik diff files depending on what base wad downloaded

if not exist "support\Diffs\%diffpath%\%diffpath%_tik.diff" goto:notik
if /i "%md5basecheck%" EQU "pass" support\jptch  %basecios%\%code1%%code2%.tik support\Diffs\%diffpath%\%diffpath%_tik.diff %basecios%\%code1%%code2new%.tik
:notik
if not exist "support\Diffs\%diffpath%\%diffpath%_tik2.diff" goto:notik2
if /i "%md5basealtcheck%" EQU "pass" support\jptch  %basecios%\%code1%%code2%.tik support\Diffs\%diffpath%\%diffpath%_tik2.diff %basecios%\%code1%%code2new%.tik
:notik2


::delete un-needed original files that have already been patched
:deletefiles

if exist %basecios%\00000000-original.app del %basecios%\00000000-original.app>nul
if exist %basecios%\00000001-original.app del %basecios%\00000001-original.app>nul
if exist %basecios%\00000002-original.app del %basecios%\00000002-original.app>nul
if exist %basecios%\%lastbasemodule%-original.app del %basecios%\%lastbasemodule%-original.app>nul

::--for cMIOS's that have tiks and tmds renamed to -original
if exist %basecios%\%code1%%code2%-original.tik del %basecios%\%code1%%code2%-original.tik>nul
if exist %basecios%\%code1%%code2%-original.tmd del %basecios%\%code1%%code2%-original.tmd>nul
if /i "%code2%" EQU "00000101" goto:repackwad
if /i "%category%" EQU "patchios" goto:repackwad

if exist %basecios%\%code1%%code2%.tik del %basecios%\%code1%%code2%.tik>nul
if exist %basecios%\%code1%%code2%.tmd del %basecios%\%code1%%code2%.tmd>nul


::Korean Key Patch

if /i "%basewad:~3,2%" EQU "38" goto:nokorpatch
if /i "%basecios%" EQU "cIOS223[37-38]-v4" goto:nokorpatch
if /i "%wadname:~0,3%" EQU "cBC" goto:repackwad

echo.
echo Parche %lastbasemodule%.app para apoyar la clave comun de Corea


::IOS37-64-v3869
if /i "%basewad%" EQU "IOS37-64-v3869" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x1FD00=0xE0
if /i "%basewad%" EQU "IOS37-64-v3869" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x278E0=0x63,0xB8,0x2B,0xB4,0xF4,0x61,0x4E,0x2E,0x13,0xF2,0xFE,0xFB,0xBA,0x4C,0x9B,0x7E

::IOS57-64-v5661
if /i "%basewad%" EQU "IOS57-64-v5661" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x21340=0xE0
if /i "%basewad%" EQU "IOS57-64-v5661" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x28F5C=0x63,0xB8,0x2B,0xB4,0xF4,0x61,0x4E,0x2E,0x13,0xF2,0xFE,0xFB,0xBA,0x4C,0x9B,0x7E


::NEXT GEN BASES

::IOS37-64-v5662
if /i "%basewad%" EQU "IOS37-64-v5662" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x1FD88=0xE0
if /i "%basewad%" EQU "IOS37-64-v5662" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x27968=0x63,0xB8,0x2B,0xB4,0xF4,0x61,0x4E,0x2E,0x13,0xF2,0xFE,0xFB,0xBA,0x4C,0x9B,0x7E

::IOS53-64-v5662
if /i "%basewad%" EQU "IOS53-64-v5662" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x1FD88=0xE0
if /i "%basewad%" EQU "IOS53-64-v5662" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x27968=0x63,0xB8,0x2B,0xB4,0xF4,0x61,0x4E,0x2E,0x13,0xF2,0xFE,0xFB,0xBA,0x4C,0x9B,0x7E

::IOS55-64-v5662
if /i "%basewad%" EQU "IOS55-64-v5662" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x1FD88=0xE0
if /i "%basewad%" EQU "IOS55-64-v5662" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x27968=0x63,0xB8,0x2B,0xB4,0xF4,0x61,0x4E,0x2E,0x13,0xF2,0xFE,0xFB,0xBA,0x4C,0x9B,0x7E

::IOS56-64-v5661
if /i "%basewad%" EQU "IOS56-64-v5661" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x21424=0xE0
if /i "%basewad%" EQU "IOS56-64-v5661" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x29078=0x63,0xB8,0x2B,0xB4,0xF4,0x61,0x4E,0x2E,0x13,0xF2,0xFE,0xFB,0xBA,0x4C,0x9B,0x7E

::IOS57-64-v5918
if /i "%basewad%" EQU "IOS57-64-v5918" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x21424=0xE0
if /i "%basewad%" EQU "IOS57-64-v5918" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x29078=0x63,0xB8,0x2B,0xB4,0xF4,0x61,0x4E,0x2E,0x13,0xF2,0xFE,0xFB,0xBA,0x4C,0x9B,0x7E

::IOS58-64-v6175
if /i "%basewad%" EQU "IOS58-64-v6175" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x21424=0xE0
if /i "%basewad%" EQU "IOS58-64-v6175" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x29078=0x63,0xB8,0x2B,0xB4,0xF4,0x61,0x4E,0x2E,0x13,0xF2,0xFE,0xFB,0xBA,0x4C,0x9B,0x7E

::IOS60-64-v6174
if /i "%basewad%" EQU "IOS60-64-v6174" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x20678=0xE0
if /i "%basewad%" EQU "IOS60-64-v6174" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x28294=0x63,0xB8,0x2B,0xB4,0xF4,0x61,0x4E,0x2E,0x13,0xF2,0xFE,0xFB,0xBA,0x4C,0x9B,0x7E

echo.

:nokorpatch





::copy over extra components

echo.
echo Copia a traves de modulos personalizados
echo.

::222v4
if /i "%basecios%" EQU "cIOS222[38]-v4" copy support\Hermes\mloadv3.app %basecios%\0000000f.app

::223v4
if /i "%basecios%" EQU "cIOS223[37-38]-v4" copy support\Hermes\mloadv3.app %basecios%\0000000f.app

::222v5
if /i "%basecios%" EQU "cIOS222[38]-v5" copy support\Hermes\mloadv5.app %basecios%\0000000f.app

::223v5 base37
if /i "%basecios%" EQU "cIOS223[37]-v5" copy support\Hermes\mloadv5.app %basecios%\0000000f.app

::224v5 base57
if /i "%basecios%" EQU "cIOS224[57]-v5" copy support\Hermes\mloadv5.app %basecios%\00000013.app

::202v5.1R base60
if /i "%basecios%" EQU "cIOS202[60]-v5.1R" copy support\Hermes\mloadv5.1R.app %basecios%\0000000f.app

::222v5.1R base38
if /i "%basecios%" EQU "cIOS222[38]-v5.1R" copy support\Hermes\mloadv5.1R.app %basecios%\0000000f.app

::223v5.1R base37
if /i "%basecios%" EQU "cIOS223[37]-v5.1R" copy support\Hermes\mloadv5.1R.app %basecios%\0000000f.app

::224v5.1R base57
if /i "%basecios%" EQU "cIOS224[57]-v5.1R" copy support\Hermes\mloadv5.1R.app %basecios%\00000013.app


::249v19 base37
if /i "%basecios%" EQU "cIOS249[37]-v19" copy support\W19modules\mload.app %basecios%\0000000f.app
if /i "%basecios%" EQU "cIOS249[37]-v19" copy support\W19modules\EHCI.app %basecios%\00000010.app
if /i "%basecios%" EQU "cIOS249[37]-v19" copy support\W19modules\FAT.app %basecios%\00000011.app
if /i "%basecios%" EQU "cIOS249[37]-v19" copy support\W19modules\SDHC.app %basecios%\00000012.app
if /i "%basecios%" EQU "cIOS249[37]-v19" copy support\W19modules\DIPP.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[37]-v19" copy support\W19modules\FFSP.app %basecios%\00000014.app

::249v19 base38
if /i "%basecios%" EQU "cIOS249[38]-v19" copy support\W19modules\mload.app %basecios%\0000000f.app
if /i "%basecios%" EQU "cIOS249[38]-v19" copy support\W19modules\EHCI.app %basecios%\00000010.app
if /i "%basecios%" EQU "cIOS249[38]-v19" copy support\W19modules\FAT.app %basecios%\00000011.app
if /i "%basecios%" EQU "cIOS249[38]-v19" copy support\W19modules\SDHC.app %basecios%\00000012.app
if /i "%basecios%" EQU "cIOS249[38]-v19" copy support\W19modules\DIPP.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[38]-v19" copy support\W19modules\FFSP.app %basecios%\00000014.app

::249v20 base38
if /i "%basecios%" EQU "cIOS249[38]-v20" copy support\W20modules\mload.app %basecios%\0000000f.app
if /i "%basecios%" EQU "cIOS249[38]-v20" copy support\W20modules\EHCI.app %basecios%\00000010.app
if /i "%basecios%" EQU "cIOS249[38]-v20" copy support\W20modules\FAT.app %basecios%\00000011.app
if /i "%basecios%" EQU "cIOS249[38]-v20" copy support\W20modules\SDHC.app %basecios%\00000012.app
if /i "%basecios%" EQU "cIOS249[38]-v20" copy support\W20modules\DIPP.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[38]-v20" copy support\W20modules\ES.app %basecios%\00000014.app
if /i "%basecios%" EQU "cIOS249[38]-v20" copy support\W20modules\FFSP.app %basecios%\00000015.app

::249v20 base56
if /i "%basecios%" EQU "cIOS249[56]-v20" copy support\W20modules\mload.app %basecios%\0000000f.app
if /i "%basecios%" EQU "cIOS249[56]-v20" copy support\W20modules\EHCI.app %basecios%\00000010.app
if /i "%basecios%" EQU "cIOS249[56]-v20" copy support\W20modules\FAT.app %basecios%\00000011.app
if /i "%basecios%" EQU "cIOS249[56]-v20" copy support\W20modules\SDHC.app %basecios%\00000012.app
if /i "%basecios%" EQU "cIOS249[56]-v20" copy support\W20modules\DIPP.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[56]-v20" copy support\W20modules\ES.app %basecios%\00000014.app
if /i "%basecios%" EQU "cIOS249[56]-v20" copy support\W20modules\FFSP.app %basecios%\00000015.app

::249v19 base57
if /i "%basecios%" EQU "cIOS249[57]-v19" copy support\W19modules\mload.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[57]-v19" copy support\W19modules\EHCI.app %basecios%\00000014.app
if /i "%basecios%" EQU "cIOS249[57]-v19" copy support\W19modules\FAT.app %basecios%\00000015.app
if /i "%basecios%" EQU "cIOS249[57]-v19" copy support\W19modules\SDHC.app %basecios%\00000016.app
if /i "%basecios%" EQU "cIOS249[57]-v19" copy support\W19modules\DIPP.app %basecios%\00000017.app
if /i "%basecios%" EQU "cIOS249[57]-v19" copy support\W19modules\FFSP.app %basecios%\00000018.app

::249v20 base57
if /i "%basecios%" EQU "cIOS249[57]-v20" copy support\W20modules\mload.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[57]-v20" copy support\W20modules\EHCI.app %basecios%\00000014.app
if /i "%basecios%" EQU "cIOS249[57]-v20" copy support\W20modules\FAT.app %basecios%\00000015.app
if /i "%basecios%" EQU "cIOS249[57]-v20" copy support\W20modules\SDHC.app %basecios%\00000016.app
if /i "%basecios%" EQU "cIOS249[57]-v20" copy support\W20modules\DIPP.app %basecios%\00000017.app
if /i "%basecios%" EQU "cIOS249[57]-v20" copy support\W20modules\ES.app %basecios%\00000018.app
if /i "%basecios%" EQU "cIOS249[57]-v20" copy support\W20modules\FFSP.app %basecios%\00000019.app

::249v17b
if /i "%basecios%" EQU "cIOS249-v17b" copy support\W17bmodules\0000000f.app %basecios%\0000000f.app
if /i "%basecios%" EQU "cIOS249-v17b" copy support\W17bmodules\00000010.app %basecios%\00000010.app
if /i "%basecios%" EQU "cIOS249-v17b" copy support\W17bmodules\00000011.app %basecios%\00000011.app

::249v14
if /i "%basecios%" EQU "cIOS249-v14" copy support\W14modules\EHCI.app %basecios%\0000000f.app
if /i "%basecios%" EQU "cIOS249-v14" copy support\W14modules\SDHC.app %basecios%\00000010.app
if /i "%basecios%" EQU "cIOS249-v14" copy support\W14modules\FAT.app %basecios%\00000011.app


::249v21 base 37/38/56
if /i "%basecios%" EQU "cIOS249[37]-v21" goto:yes
if /i "%basecios%" EQU "cIOS249[38]-v21" goto:yes
if /i "%basecios%" EQU "cIOS249[53]-v21" goto:yes
if /i "%basecios%" EQU "cIOS249[55]-v21" goto:yes
if /i "%basecios%" EQU "cIOS249[56]-v21" goto:yes
goto:skip
:yes
copy support\W21modules\mload.app %basecios%\0000000f.app
copy support\W21modules\FAT.app %basecios%\00000010.app
copy support\W21modules\SDHC.app %basecios%\00000011.app
copy support\W21modules\EHCI.app %basecios%\00000012.app
copy support\W21modules\DIPP.app %basecios%\00000013.app
copy support\W21modules\ES.app %basecios%\00000014.app
copy support\W21modules\FFSP.app %basecios%\00000015.app
:skip


::249v21 base57
if /i "%basecios%" EQU "cIOS249[57]-v21" copy support\W21modules\mload.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[57]-v21" copy support\W21modules\FAT.app %basecios%\00000014.app
if /i "%basecios%" EQU "cIOS249[57]-v21" copy support\W21modules\SDHC.app %basecios%\00000015.app
if /i "%basecios%" EQU "cIOS249[57]-v21" copy support\W21modules\EHCI.app %basecios%\00000016.app
if /i "%basecios%" EQU "cIOS249[57]-v21" copy support\W21modules\DIPP.app %basecios%\00000017.app
if /i "%basecios%" EQU "cIOS249[57]-v21" copy support\W21modules\ES.app %basecios%\00000018.app
if /i "%basecios%" EQU "cIOS249[57]-v21" copy support\W21modules\FFSP.app %basecios%\00000019.app

::249v21 base58
if /i "%basecios%" EQU "cIOS249[58]-v21" copy support\W21modules\mload.app %basecios%\00000013.app
if /i "%basecios%" EQU "cIOS249[58]-v21" copy support\W21modules\FAT.app %basecios%\00000014.app
if /i "%basecios%" EQU "cIOS249[58]-v21" copy support\W21modules\SDHC.app %basecios%\00000015.app
if /i "%basecios%" EQU "cIOS249[58]-v21" copy support\W21modules\USBS.app %basecios%\00000016.app
if /i "%basecios%" EQU "cIOS249[58]-v21" copy support\W21modules\DIPP.app %basecios%\00000017.app
if /i "%basecios%" EQU "cIOS249[58]-v21" copy support\W21modules\ES.app %basecios%\00000018.app
if /i "%basecios%" EQU "cIOS249[58]-v21" copy support\W21modules\FFSP.app %basecios%\00000019.app



::249 d2x base 37/38/56
if /i "%basecios:~0,17%" EQU "cIOS249[37]-d2x-v" goto:yes
if /i "%basecios:~0,17%" EQU "cIOS249[38]-d2x-v" goto:yes
if /i "%basecios:~0,17%" EQU "cIOS249[53]-d2x-v" goto:yes
if /i "%basecios:~0,17%" EQU "cIOS249[55]-d2x-v" goto:yes
if /i "%basecios:~0,17%" EQU "cIOS249[56]-d2x-v" goto:yes
goto:skip
:yes
if exist support\d2x-beta\mload.app (copy support\d2x-beta\mload.app %basecios%\0000000f.app) else (copy Support\W21modules\mload.app %basecios%\0000000f.app)

if exist support\d2x-beta\FAT.app (copy support\d2x-beta\FAT.app %basecios%\00000010.app) else (copy support\d2xmodules\FAT.app %basecios%\00000010.app)

if exist support\d2x-beta\SDHC.app (copy support\d2x-beta\SDHC.app %basecios%\00000011.app) else (copy Support\W21modules\SDHC.app %basecios%\00000011.app)

if exist support\d2x-beta\EHCI.app (copy support\d2x-beta\EHCI.app %basecios%\00000012.app) else (copy Support\d2xmodules\EHCI.app %basecios%\00000012.app)

if exist support\d2x-beta\DIPP.app (copy support\d2x-beta\DIPP.app %basecios%\00000013.app) else (copy Support\d2xmodules\DIPP.app %basecios%\00000013.app)

if exist support\d2x-beta\ES.app (copy support\d2x-beta\ES.app %basecios%\00000014.app) else (copy support\d2xmodules\ES.app %basecios%\00000014.app)

if exist support\d2x-beta\FFSP.app (copy support\d2x-beta\FFSP.app %basecios%\00000015.app) else (copy Support\d2xmodules\FFSP.app %basecios%\00000015.app)
:skip





::249 d2x base 57
if /i "%basecios:~0,17%" EQU "cIOS249[57]-d2x-v" goto:yes
goto:skip
:yes

if exist support\d2x-beta\mload.app (copy support\d2x-beta\mload.app %basecios%\00000013.app) else (copy Support\W21modules\mload.app %basecios%\00000013.app)

if exist support\d2x-beta\FAT.app (copy support\d2x-beta\FAT.app %basecios%\00000014.app) else (copy support\d2xmodules\FAT.app %basecios%\00000014.app)

if exist support\d2x-beta\SDHC.app (copy support\d2x-beta\SDHC.app %basecios%\00000015.app) else (copy Support\W21modules\SDHC.app %basecios%\00000015.app)

if exist support\d2x-beta\EHCI.app (copy support\d2x-beta\EHCI.app %basecios%\00000016.app) else (copy Support\d2xmodules\EHCI.app %basecios%\00000016.app)

if exist support\d2x-beta\DIPP.app (copy support\d2x-beta\DIPP.app %basecios%\00000017.app) else (copy Support\d2xmodules\DIPP.app %basecios%\00000017.app)

if exist support\d2x-beta\ES.app (copy support\d2x-beta\ES.app %basecios%\00000018.app) else (copy support\d2xmodules\ES.app %basecios%\00000018.app)

if exist support\d2x-beta\FFSP.app (copy support\d2x-beta\FFSP.app %basecios%\00000019.app) else (copy Support\d2xmodules\FFSP.app %basecios%\00000019.app)
:skip



::249 d2x base 58
if /i "%basecios:~0,17%" EQU "cIOS249[58]-d2x-v" goto:yes
goto:skip
:yes

if exist support\d2x-beta\mload.app (copy support\d2x-beta\mload.app %basecios%\00000013.app) else (copy Support\W21modules\mload.app %basecios%\00000013.app)

if exist support\d2x-beta\FAT.app (copy support\d2x-beta\FAT.app %basecios%\00000014.app) else (copy support\d2xmodules\FAT.app %basecios%\00000014.app)

if exist support\d2x-beta\SDHC.app (copy support\d2x-beta\SDHC.app %basecios%\00000015.app) else (copy Support\W21modules\SDHC.app %basecios%\00000015.app)

if exist support\d2x-beta\USBS.app (copy support\d2x-beta\USBS.app %basecios%\00000016.app) else (copy Support\W21modules\USBS.app %basecios%\00000016.app)

if exist support\d2x-beta\DIPP.app (copy support\d2x-beta\DIPP.app %basecios%\00000017.app) else (copy Support\d2xmodules\DIPP.app %basecios%\00000017.app)

if exist support\d2x-beta\ES.app (copy support\d2x-beta\ES.app %basecios%\00000018.app) else (copy support\d2xmodules\ES.app %basecios%\00000018.app)

if exist support\d2x-beta\FFSP.app (copy support\d2x-beta\FFSP.app %basecios%\00000019.app) else (copy Support\d2xmodules\FFSP.app %basecios%\00000019.app)
:skip




::------sign cIOS with details---------
set d2xNumber=
set d2xhexNumber=
set baseNumber=
set basehexNumber=
set d2xsubversion=
set string=
set string1=

if /i "%code2%" EQU "00000101" goto:repackwad

echo.
echo Firma con los detalles cIOS 00000000.app


::----convert some values from dec to hex----

if /i "%basecios:~12,3%" NEQ "d2x" goto:minijump
echo "set cIOSversionNum=%d2x-beta-rev%">cIOSrev.bat
support\sfk filter -spat cIOSrev.bat -rep _\x22__ -rep _"-*"__ -write -yes>nul
call cIOSrev.bat
del cIOSrev.bat>nul
:minijump

support\sfk hex %cIOSversionNum% -digits=8 >hex.txt

::set a file with 1 line as a variable
set /p cIOShexNumber= <hex.txt
if exist hex.txt del hex.txt>nul

::-----
set baseNumber=%basewad:~3,2%
::base # for 37+38=75
if /i "%basecios%" EQU "cIOS223[37-38]-v4" set baseNumber=75
support\sfk hex %baseNumber% -digits=8 >hex.txt

::set a file with 1 line as a variable
set /p basehexNumber= <hex.txt
if exist hex.txt del hex.txt>nul


set cIOSsubversion=
::-----cIOSFamilyName (this part required for d2x betas only)-------
if /i "%basecios:~12,3%" NEQ "d2x" goto:tinyjump
set cIOSFamilyName=d2x
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat

::limit cios family name to 16 chars
set cIOSFamilyName=%cIOSFamilyName:~0,16%

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
support\sfk filter cIOSsubversion.bat -spat -rep _@_%%_ -write -yes>nul
call cIOSsubversion.bat
del cIOSsubversion.bat>nul
:tinyjump


::copy template .app
copy /y "support\00000000-template.app" "%basecios%\00000000.app">nul


::hexalter version number and base wad number
support\hexalter.exe "%basecios%\00000000.app" 0x8=0x%cIOShexNumber:~0,2%,0x%cIOShexNumber:~2,2%,0x%cIOShexNumber:~4,2%,0x%cIOShexNumber:~6,2%,0x%basehexNumber:~0,2%,0x%basehexNumber:~2,2%,0x%basehexNumber:~4,2%,0x%basehexNumber:~6,2%


::convert %cIOSFamilyName% to hex then hexalter
set var=%cIOSFamilyName%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p cIOSFamilyNamehex= <temphex.txt
del /f /q temphex.txt
set cIOSFamilyNamehex=0x%cIOSFamilyNamehex:~0,-4%
support\hexalter.exe "%basecios%\00000000.app" 0x10=%cIOSFamilyNamehex%


::only patch cIOSsubversion if not = nul
if "%cIOSsubversion%"=="" goto:tinyjump
set var=%cIOSsubversion%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p cIOSsubversionhex= <temphex.txt
del /f /q temphex.txt
set cIOSsubversionhex=0x%cIOSsubversionhex:~0,-4%
support\hexalter.exe "%basecios%\00000000.app" 0x20=%cIOSsubversionhex%
:tinyjump




::---------IRQ4 patch for d2x cIOSs w/ rev's 21007 or higher (not applicable to base 58 cIOSs)--------
if /i "%basecios:~12,3%" NEQ "d2x" goto:repackwad
if /i "%basewad:~3,2%" EQU "58" goto:repackwad

if /i "%ciosversion%" GEQ "21007" (set IRQ4patch=ON) else (set IRQ4patch=OFF)
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if /i "%IRQ4patch%" NEQ "ON" goto:repackwad

echo.
echo parches %lastbasemodule%.app con IRQ4 patch
echo.
if /i "%basewad:~3,2%" EQU "37" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x26E40=0xFF,0xFF,0x5B,0x78
if /i "%basewad:~3,2%" EQU "38" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x2668C=0xFF,0xFF,0x5A,0xFC
if /i "%basewad:~3,2%" EQU "53" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x26E40=0xFF,0xFF,0x5B,0x78
if /i "%basewad:~3,2%" EQU "55" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x26E40=0xFF,0xFF,0x5B,0x78
if /i "%basewad:~3,2%" EQU "56" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x28530=0xFF,0xFF,0x5D,0x5C
if /i "%basewad:~3,2%" EQU "57" support\hexalter.exe %basecios%\%lastbasemodule%.app 0x28530=0xFF,0xFF,0x5D,0x5C

echo.

::---------pack files into cIOS wad---------
:repackwad

echo.
echo volver a embalar Wad
echo.

support\wadmii -in "%basecios%" -out "%Drive%\WAD\%wadname%.wad"

::delete unpacked files
rd /s /q %basecios%

::Change version number and slot number (using patchios) only if required
:patchios
if /i "%ciosslot%" EQU "unchanged" goto:skip


echo.
echo Cambio de la version numero y/o numero de la ranura
echo.

cd support
if /i "%DRIVE:~1,1%" EQU ":" (set DRIVEadj=%DRIVE%) else (set DRIVEadj=..\%DRIVE%)
patchios "%Driveadj%\WAD\%wadname%.wad" -slot %ciosslot% -v %ciosversion%
cd..
echo.
:skip


if "%wadname:~-4%" NEQ ".wad" set wadname=%wadname%.wad
goto:wadverifyretry





::----------------------------------------THEMES-------------------------------------
:THEMES
if not exist "%Drive%"\ModThemes mkdir "%Drive%"\ModThemes

::----if exist and fails md5 check, delete and redownload----
if exist "%Drive%"\ModThemes\%wadname%.csm (goto:checkexisting) else (goto:nocheckexisting)
:checkexisting
set md5check=
support\sfk md5 -quiet -verify %md5% "%Drive%"\ModThemes\%wadname%.csm
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y se volvera a descargar
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%"\ModThemes\%wadname%.csm>nul
goto:DOWNLOADSTART2

:pass
support\sfk echo [Green]Este archivo ya existe y ha sido verificado, Saltar descarga
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: Valido">>temp\ModMii_Log.bat
goto:NEXT
:nocheckexisting





::-------------Download base app----------------------
echo.
echo Descarga de aplicaciones en la Base de menu del sistema %wadname:~-4%: 000000%version%.app
echo.

set dlname=000000%version%_%wadname:~-4%.app

::----if exist and fails md5 check, delete and redownload----
if not exist "%Drive%"\ModThemes\%dlname% goto:nocheckexisting
set md5basecheck=
support\sfk md5 -quiet -verify %md5base% "%Drive%"\ModThemes\%dlname%
if errorlevel 1 set md5basecheck=fail
IF "%md5basecheck%"=="" set md5basecheck=pass
if /i "%md5basecheck%" NEQ "fail" goto:pass

:fail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y se volvera a descargar
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%"\ModThemes\%dlname%>nul
if exist temp\%dlname% del temp\%dlname%>nul
goto:DOWNLOADSTART2

:pass
support\sfk echo -spat \x20 \x20 \x20 [Green] la Base de la aplicacion ya existe y ha sido verificada, Continuar...
echo.
goto:mym_download
:nocheckexisting


if exist temp\%dlname% goto:AlreadyinTemp


support\NusFileGrabber.exe %version%
if exist 000000%version%.app move /Y 000000%version%.app temp\%dlname%>nul

:AlreadyinTemp
copy /y temp\%dlname% "%Drive%"\ModThemes\%dlname% >nul




::----Check base APP-----------
::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%"\ModThemes\%dlname% goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %wadname%.csm: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
set md5basecheck=

support\sfk md5 -quiet -verify %md5base% "%Drive%"\ModThemes\%dlname%
if errorlevel 1 set md5basecheck=fail
IF "%md5basecheck%"=="" set md5basecheck=pass
if /i "%md5basecheck%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Esta aplicacion de base ya existe, pero que no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
del "%Drive%"\ModThemes\%dlname%>nul
if exist temp\%dlname% del temp\%dlname%>nul
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
set multiplefail=Y
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %wadname%.csm: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:pass
echo.
support\sfk echo -spat \x20 \x20 \x20 [Green] la Base de la aplicacion se ha descargado correctamente, Continuar...
echo.
::if /i "%AdvancedDownload%" NEQ "Y" echo "echo %wadname%.csm: Valido">>temp\ModMii_Log.bat
goto:mym_download






::-------------------mym download to build csm file---------------------

:mym_download

set mym0=%mym1%
set md5mym0=%md5mym1%
set mym2=

:mym2_download

echo.
echo Descargar %mym0%
echo.

::----if exist and fails md5 check, delete and redownload----
if not exist "temp\%mym0%" goto:nocheckexisting
set md5mymcheck=
support\sfk md5 -quiet -verify %md5mym0% "temp\%mym0%"
if errorlevel 1 set md5mymcheck=fail
IF "%md5mymcheck%"=="" set md5mymcheck=pass
if /i "%md5mymcheck%" NEQ "fail" goto:pass

:fail
echo.
support\sfk echo [Yellow] Este archivo mym ya existe, pero que no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "temp\%mym0%">nul
goto:DOWNLOADSTART2

:pass
support\sfk echo -spat \x20 \x20 \x20 [Green] El archivo ya existe y ha sido verificado, Continuar...
echo.
::if /i "%category%" EQU "SMTHEME" goto:SMTHEME2
goto:download_mym2
:nocheckexisting

start %ModMiimin%/wait support\wget -t 3 "http://nusad.googlecode.com/files/%mym0%"
if exist "%mym0%" move /Y "%mym0%" temp>nul




::----Check mym file after downloading-----------
::----check after downloading - if md5 check fails, delete and redownload----
if exist "temp\%mym0%" goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
set md5mymcheck=

support\sfk md5 -quiet -verify %md5mym0% "temp\%mym0%"
if errorlevel 1 set md5mymcheck=fail
IF "%md5mymcheck%"=="" set md5mymcheck=pass
if /i "%md5mymcheck%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
del "temp\%mym0%">nul
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
set multiplefail=Y
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:pass
echo.
support\sfk echo -spat \x20 \x20 \x20 [Green] El archivo se ha descargado correctamente, Continuar...
echo.
::if /i "%category%" EQU "SMTHEME" goto:SMTHEME2
::goto:build_csm



:download_mym2
if /i "%mym0%" EQU "%mym2%" goto:thememiiDL

if /i "%effect%" EQU "No-Spin" set mym2=optional_non_spinning_outline.mym
if /i "%effect%" EQU "No-Spin" set md5mym2=9e70e955aa9ba04cb904b350402ed5b3

if /i "%effect%" EQU "Spin" set mym2=optional_spinning_outline.mym
if /i "%effect%" EQU "Spin" set md5mym2=b66e0d93eac883651898090236c14306

if /i "%effect%" EQU "Fast-Spin" set mym2=optional_fast_spinning_outline.mym
if /i "%effect%" EQU "Fast-Spin" set md5mym2=1ddddcf02bc7024b7fde393308cdbd5f

set mym0=%mym2%
set md5mym0=%md5mym2%
goto:mym2_download



::---------thememii cmd line download-------------
:thememiiDL

echo.
echo Descargar ThemeMii Cmd Line
echo.

set ThemeMiiZip=thememii_cmd_3.5NetFramework.zip
set md5TMCL=641eadbcbb9970f066d7852286f03133
if exist "temp\DBUPDATE%currentversion%.bat" call "temp\DBUPDATE%currentversion%.bat"


::----if exist and fails md5 check, delete and redownload----
if not exist temp\TMCL.exe goto:nocheckexisting
set md5TMCLcheck=
support\sfk md5 -quiet -verify %md5TMCL% temp\TMCL.exe
if errorlevel 1 set md5TMCLcheck=fail
IF "%md5TMCLcheck%"=="" set md5TMCLcheck=pass
if /i "%md5TMCLcheck%" NEQ "fail" goto:pass

:fail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del temp\TMCL.exe>nul
goto:DOWNLOADSTART2

:pass
support\sfk echo -spat \x20 \x20 \x20 [Green] El archivo ya existe y ha sido verificado, Continuar...
echo.
goto:build_csm
:nocheckexisting


start %ModMiimin%/wait support\wget -t 3 "http://nusad.googlecode.com/files/%ThemeMiiZip%"

if exist %ThemeMiiZip% support\7za e -aoa %ThemeMiiZip% -otemp *.* -r
if exist %ThemeMiiZip% del %ThemeMiiZip%>nul


::----Check mym file after downloading-----------
::----check after downloading - if md5 check fails, delete and redownload----
if exist temp\TMCL.exe goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
set md5TMCLcheck=

support\sfk md5 -quiet -verify %md5TMCL% temp\TMCL.exe
if errorlevel 1 set md5TMCLcheck=fail
IF "%md5TMCLcheck%"=="" set md5TMCLcheck=pass
if /i "%md5TMCLcheck%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
del temp\TMCL.exe>nul
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
set multiplefail=Y
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:pass
echo.
support\sfk echo -spat \x20 \x20 \x20 [Green] El archivo se ha descargado correctamente, Continuar...
echo.
::goto:build_csm



:build_csm
if /i "%category%" EQU "SMTHEME" goto:SMTHEME2
echo.
echo Creando tema (%wadname%.csm), por favor espere...
echo.
cd temp
TMCL.exe "%mym1%" -A "%dlname%" -o temp.csm>nul
TMCL.exe "%mym2%" -A temp.csm -o "%wadname%.csm">nul
if exist temp.csm del temp.csm>nul
cd..

if exist "temp\%wadname%.csm" move /y "temp\%wadname%.csm" "%Drive%\ModThemes\%wadname%.csm">nul

::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%"\ModThemes\%wadname%.csm goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
set md5check=
support\sfk md5 -quiet -verify %md5% "%Drive%"\ModThemes\%wadname%.csm
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
del "%Drive%"\ModThemes\%wadname%.csm>nul
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
set multiplefail=Y
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Invalido">>temp\ModMii_Log.bat
goto:NEXT

:pass
echo.
support\sfk echo [Green]Descarga con exito
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: Valido">>temp\ModMii_Log.bat
goto:NEXT






::------------------------------------------CFG USB Loader Downloader--------------------------------------
:CFGDOWNLOADER

::choice=1 for most recent 249 and choice=2 for most recent 222
if /i "%cfg249%" EQU "*" set cfgchoice=1
if /i "%cfg222%" EQU "*" set cfgchoice=2

if not exist "%Drive%\apps\USBLoader_cfg\meta.xml" goto:doesntexist

echo.
echo Esta aplicacion ya existe...


::get current version if app already exists, skip if its the most recent version
support\sfk filter -quiet "%Drive%\apps\USBLoader_cfg\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat>nul
echo.
echo La version actual es %currentcode%
echo.
echo Comprobar si hay actualizaciones...
echo.

:doesntexist

::Download updates.txt
start %ModMiimin%/wait support\wget http://cfg-loader.googlecode.com/svn/trunk/updates.txt

if not exist updates.txt goto:missing


::Most Recent Version Download Link
support\sfk filter updates.txt -ls+url>cfgurl.txt
FINDSTR /N url cfgurl.txt>cfgurl2.txt
support\sfk filter cfgurl2.txt -rep _"url = "__>cfgurl.txt
del cfgurl2.txt>nul
support\sfk filter cfgurl.txt -ls+"%cfgchoice%:" -ls!"%cfgchoice%%cfgchoice%:" -lsrep _"%cfgchoice%:"_"set cfgurl="_>cfgDLsettings.bat
del cfgurl.txt>nul

::Most Recent Version Release Number
support\sfk filter updates.txt -ls+release>cfgrelease.txt
FINDSTR /N release cfgrelease.txt>cfgrelease2.txt
support\sfk filter cfgrelease2.txt -rep _"release = "__>cfgrelease.txt
del cfgrelease2.txt>nul
support\sfk filter cfgrelease.txt -ls+"%cfgchoice%:" -ls!"%cfgchoice%%cfgchoice%:" -lsrep _"%cfgchoice%:"_"set cfgrelease="_>>cfgDLsettings.bat
del cfgrelease.txt>nul

::Most Recent Version Release Date
support\sfk filter updates.txt -ls+date>cfgdate.txt
FINDSTR /N date cfgdate.txt>cfgdate2.txt
support\sfk filter cfgdate2.txt -rep _"date = "__>cfgdate.txt
del cfgdate2.txt>nul
support\sfk filter cfgdate.txt -ls+"%cfgchoice%:" -ls!"%cfgchoice%%cfgchoice%:" -lsrep _"%cfgchoice%:"_"set cfgdate="_>>cfgDLsettings.bat
del cfgdate.txt>nul

::Most Recent FULL Version number, used to download most recent 'usb-loader' folder
support\sfk filter updates.txt -ls+"release = " -rep _"release = "__>cfgFullRelease.txt
support\sfk filter cfgFullRelease.txt ++release -write -yes>nul
FINDSTR /N release cfgFullRelease.txt>cfgFullRelease2.txt
::support\sfk filter cfgFullRelease2.txt -rep _" (release)"__>cfgFullRelease.txt
del cfgFullRelease.txt>nul
support\sfk filter cfgFullRelease2.txt -ls+"1:" -ls!"11:" -lsrep _"1:"_"set cfgfullrelease="_>>cfgDLsettings.bat
del cfgFullRelease2.txt>nul


del updates.txt>nul
call cfgDLsettings.bat
del cfgDLsettings.bat>nul


if /i "%name%" EQU "Configurable USB-Loader (Most recent Full 249 version)" goto:usbloaderFolder

if not exist "%Drive%\apps\USBLoader_cfg\meta.xml" goto:doesntalreadyexist


if "%currentcode%" EQU "%cfgrelease%" goto:noupdate

echo Actualizacion de %currentcode% a %cfgrelease%
echo.
goto:update

:noupdate
support\sfk echo -spat \x20 [Green] Su version actual de %currentcode% esta actualizada, saltando la descarga
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: version que se encuentra %cfgrelease%">>temp\ModMii_Log.bat
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next




::Download most recent version of cfg loader
:doesntalreadyexist
Echo.
Echo Descargar la version mas reciente: %cfgrelease%

:update
start %ModMiimin%/wait support\wget %cfgurl%
if not exist "%Drive%"\apps\USBLoader_cfg mkdir "%Drive%"\apps\USBLoader_cfg
move /Y *.dol "%Drive%"\apps\USBLoader_cfg\boot.dol> nul


:geticon
if exist "%Drive%"\apps\USBLoader_cfg\icon.png goto:meta

if exist temp\cfgicon.png goto:skip
start %ModMiimin%/wait support\wget http://code.google.com/p/cfg-loader/logo?cct=1263052802
move /Y "logo@cct=1263052802" temp\cfgicon.png>nul

:skip
copy /Y temp\cfgicon.png "%Drive%"\apps\USBLoader_cfg\icon.png>nul



:meta
if exist temp\cfgtemplate_meta.xml goto:skip
start %ModMiimin%/wait support\wget "http://nusad.googlecode.com/files/meta.xml"
move /Y meta.xml temp\cfgtemplate_meta.xml>nul
:skip

copy /Y temp\cfgtemplate_meta.xml "%Drive%"\apps\USBLoader_cfg\meta.xml>nul
support\sfk filter "%Drive%"\apps\USBLoader_cfg\meta.xml -rep _cfgrelease_"%cfgrelease%"_ -rep _cfgdate_"%cfgdate%"_ -write -yes>nul


::----simple version check after downloading----
if exist "%Drive%\%path1%boot.dol" goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
goto:MetaChecker
::goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
::get current version from meta.xml
support\sfk filter -quiet "%Drive%\%path1%meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat>nul
if "%currentcode%" EQU "%cfgrelease%" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no pudo actualizar correctamente.
support\sfk echo [Yellow] Volver a intentar descargar la version mas reciente del archivo.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
set multiplefail=Y
goto:MetaChecker
::goto:NEXT

:pass
echo.
support\sfk echo [Green]Descargado con exito
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: version encontrada %cfgrelease%">>temp\ModMii_Log.bat
goto:NEXT




:usbloaderFolder
if not exist "%Drive%\apps\USBLoader_cfg\meta.xml" goto:skip

if "%currentcode%" EQU "%cfgfullrelease%" goto:noupdate

echo actualizacion de %currentcode% a %cfgfullrelease%
echo.
:skip

::Download most recent full version for USB-Loader Folder
echo Descarga completa mas reciente/Oficial Configurable USB Loader: Version %cfgfullrelease%
if exist "%Drive%\usb-loader" Echo.
if exist "%Drive%\usb-loader" Echo Nota: Las actuales carpetas USB-Loader se llamaran
start %ModMiimin%/wait support\wget http://cfg-loader.googlecode.com/files/Cfg_USB_Loader_%cfgfullrelease:~0,-10%.zip

::rename exsiting usb-loader folder if applicable
:renameusbloader
if not exist "%Drive%\usb-loader" goto:extractusbloader
SET /a COUNT9=%COUNT9%+1
if exist "%Drive%\usb-loader%COUNT9%" goto:renameusbloader
move "%Drive%\usb-loader" "%Drive%\usb-loader%COUNT9%">nul


:extractusbloader
if not exist "%DRIVE%\usb-loader" mkdir "%DRIVE%\usb-loader"
if not exist %Drive%\apps\USBLoader_cfg mkdir %Drive%\apps\USBLoader_cfg


support\7za e -aoa Cfg_USB_Loader_%cfgfullrelease:~0,-10%.zip -o"%Drive%\apps\USBLoader_cfg" Cfg_USB_Loader_%cfgfullrelease:~0,-10%\inSDRoot\apps\USBLoader\* -r

support\7za x -aoa Cfg_USB_Loader_%cfgfullrelease:~0,-10%.zip -o"%Drive%" Cfg_USB_Loader_%cfgfullrelease:~0,-10%\inSDRoot\usb-loader\* -r

::move all files
move /y "%Drive%\Cfg_USB_Loader_%cfgfullrelease:~0,-10%\inSDRoot\usb-loader\*" "%Drive%\usb-loader">nul

::move all folders
dir "%Drive%\Cfg_USB_Loader_%cfgfullrelease:~0,-10%\inSDRoot\usb-loader" /a:d /b>temp\list.txt

::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\list.txt) do call :processlist %%A
goto:quickskipthis
:processlist
set CurrentDIR=%*
move /y "%Drive%\Cfg_USB_Loader_%cfgfullrelease:~0,-10%\inSDRoot\usb-loader\%CurrentDIR%" "%Drive%\usb-loader\%CurrentDIR%">nul
goto:EOF
:quickskipthis

rd /s /q "%Drive%\Cfg_USB_Loader_%cfgfullrelease:~0,-10%"

del Cfg_USB_Loader_%cfgfullrelease:~0,-10%.zip>nul


::------extra for USB-Loader Setup Guide-------
if /i "%FORMAT%" EQU "NONE" goto:skip
::FAT or NTFS partition will only be valid if the \wbfs folder exists
if not exist "%Drive%\wbfs" mkdir "%Drive%\wbfs"
if not exist "%DRIVE%"\usb-loader\music mkdir "%DRIVE%"\usb-loader\music

echo Guardar la musica aqui>"%DRIVE%\usb-loader\music\Save MP3s Aqu� para jugar en el Menu USB-Loader"
if /i "%USBCONFIG%" EQU "USB" echo musica = usb:/usb-loader/music>>"%DRIVE%\usb-loader\config.txt"
if /i "%USBCONFIG%" NEQ "USB" echo musica = sd:/usb-loader/music>>"%DRIVE%\usb-loader\config.txt"

echo Desbloquear password = AAAA>>"%DRIVE%\usb-loader\config.txt"
echo Desactivar eliminar = BLAHBLAH>>"%DRIVE%\usb-loader\config.txt"
echo Deshabilitar formatear = BLAHBLAH>>"%DRIVE%\usb-loader\config.txt"
echo Desbloquear admin = BLAHBLAH>>"%DRIVE%\usb-loader\config.txt"

support\sfk filter -write -yes "%DRIVE%\usb-loader\config.txt" -rep _BLAHBLAH_1_> nul

:skip

if /i "%USBCONFIG%" NEQ "USB" goto:skip
echo covers_path = usb:/usb-loader/covers>>"%DRIVE%\usb-loader\config.txt"
echo covers_path_2d = usb:/usb-loader/covers/2d>>"%DRIVE%\usb-loader\config.txt"
echo covers_path_3d = usb:/usb-loader/covers/3d>>"%DRIVE%\usb-loader\config.txt"
echo covers_path_disc = usb:/usb-loader/covers/disc>>"%DRIVE%\usb-loader\config.txt"
echo covers_path_full = usb:/usb-loader/covers/full>>"%DRIVE%\usb-loader\config.txt"

if /i "%FORMAT%" EQU "2" support\sfk filter -write -yes "%DRIVE%\usb-loader\config.txt" -rep _usb:_ntfs:_> nul
:skip

::partition = auto is now the default value
::Will select first valid from: WBFS1, FAT1, NTFS1
::FAT or NTFS partition will only be valid if the /wbfs folder exists
::if /i "%FORMAT%" EQU "1" echo particion = FAT1>>"%DRIVE%\usb-loader\config.txt"
::if /i "%FORMAT%" EQU "2" echo particion = NTFS1>>"%DRIVE%\usb-loader\config.txt"
::if /i "%FORMAT%" EQU "3" echo particion = FAT1>>"%DRIVE%\usb-loader\config.txt"
::if /i "%FORMAT%" EQU "4" echo particion = WBFS1>>"%DRIVE%\usb-loader\config.txt"
::if /i "%FORMAT%" EQU "5" echo particion = WBFS1>>"%DRIVE%\usb-loader\config.txt"


::----simple version check after downloading----
if exist "%Drive%"\apps\USBLoader_cfg\boot.dol goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
goto:MetaChecker
::goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
::get current version from meta.xml
support\sfk filter -quiet "%Drive%\apps\USBLoader_cfg\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat>nul
if "%currentcode%" EQU "%cfgfullrelease%" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no pudo actualizar correctamente.
support\sfk echo [Yellow] Volver a intentar descargar la version mas reciente del archivo.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
set multiplefail=Y
goto:MetaChecker
::goto:NEXT

:pass
echo.
support\sfk echo [Green]Download Successful
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: version encontrada %cfgfullrelease%">>temp\ModMii_Log.bat
goto:NEXT



:noupdate
support\sfk echo -spat \x20 [Green] Su version actual de %currentcode% esta actualizada, saltar descarga
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: version encontrada %cfgfullrelease%">>temp\ModMii_Log.bat
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next


::------------------------------------------CONFIGURATOR FOR CFG USB Loader Downloader--------------------------------------
:CFGRDOWNLOADER

::Download updates.txt
start %ModMiimin%/wait support\wget "http://gwht.wdfiles.com/local--files/configurable-options/updates.txt"
if not exist updates.txt goto:missing


::Most Recent Version Download Link
support\sfk filter updates.txt -ls+url>cfgrurl.txt
FINDSTR /N url cfgrurl.txt>cfgrurl2.txt
support\sfk filter cfgrurl2.txt -rep _"url = "__>cfgrurl.txt
del cfgrurl2.txt>nul
support\sfk filter cfgrurl.txt -ls+"1:" -ls!"11:" -lsrep _"1:"_"set cfgrurl="_>cfgrDLsettings.bat
del cfgrurl.txt>nul

::Most Recent Version Release Number
support\sfk filter updates.txt -ls+release>cfgrrelease.txt
FINDSTR /N release cfgrrelease.txt>cfgrrelease2.txt
support\sfk filter cfgrrelease2.txt -rep _" "__ -rep _"release="__>cfgrrelease.txt
del cfgrrelease2.txt>nul
support\sfk filter cfgrrelease.txt -ls+"1:" -ls!"11:" -lsrep _"1:"_"set cfgrrelease="_>>cfgrDLsettings.bat
del cfgrrelease.txt>nul

del updates.txt>nul
call cfgrDLsettings.bat
del cfgrDLsettings.bat>nul

::Download most recent version
if not exist "%DRIVE%\usb-loader\cfgrrev.txt" goto:skip
echo.
echo Esta aplicacion ya existe...
echo.
set cfgrreleaseOLD=
attrib -r -h -s "%DRIVE%\usb-loader\cfgrrev.txt"
copy /y "%DRIVE%\usb-loader\cfgrrev.txt" "%DRIVE%\usb-loader\cfgrev.bat">nul
attrib +r +h +s "%DRIVE%\usb-loader\cfgrrev.txt"
call "%DRIVE%\usb-loader\cfgrev.bat"
del "%DRIVE%\usb-loader\cfgrev.bat">nul
echo La version actual es %cfgrreleaseOLD%
echo.
echo Comprobar actualizaciones...
echo.
if %cfgrreleaseOLD% GEQ %cfgrrelease% goto:noupdate
:skip

Echo.
Echo Descargar la version mas reciente: %cfgrrelease%
start %ModMiimin%/wait support\wget %cfgrurl%
if not exist "%Drive%"\USB-Loader mkdir "%Drive%"\USB-Loader

::Move most recent usb-loader folder to root of drive
support\7za e -aoa CfgLoaderConfiguratorv%cfgrrelease%.zip -o"%Drive%"\usb-loader\ * -r
del CfgLoaderConfiguratorv%cfgrrelease%.zip>nul


::----simple version check after downloading----
if exist "%DRIVE%"\usb-loader\CfgLoaderConfigurator.exe goto:pass

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:pass
echo.
support\sfk echo [Green]Descarga con exito
echo.
::save version info for next time!
if exist "%DRIVE%\usb-loader\cfgrrev.txt" attrib -r -h -s "%DRIVE%\usb-loader\cfgrrev.txt"
echo set cfgrreleaseOLD=%cfgrrelease%>"%DRIVE%\usb-loader\cfgrrev.txt"
attrib +r +h +s "%DRIVE%\usb-loader\cfgrrev.txt"
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: version encontrada %cfgrrelease%">>temp\ModMii_Log.bat
goto:NEXT

:noupdate
support\sfk echo -spat \x20 [Green] Su version actual de %cfgrreleaseOLD% esta actualizada, saltar descarga
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: version encontrada %cfgrrelease%">>temp\ModMii_Log.bat
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next


::--------------------------TANTRIC APPS AUTO-UDPATE------------------------
:TANTRIC


if not exist "%DRIVE%\%path1%\meta.xml" goto:doesntexist

echo.
echo This app already exists...


::get current version if app already exists, skip if its the most recent version
support\sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat>nul
echo.
echo La version actual es %currentcode%
echo.
echo Comprobar actualizaciones...
echo.

:doesntexist
start %ModMiimin%/wait support\wget "%updateurl%"

if not exist update.xml goto:missing

support\sfk filter -quiet update.xml -+"app version" -rep _"<app version=""_"set newcode="_ -write -yes
support\sfk filter -quiet update.xml -rep _">_""_ -write -yes
support\sfk filter -quiet update.xml -rep _""""__>code.bat
del update.xml>nul
call code.bat
del code.bat>nul

if not exist "%DRIVE%\%path1%\meta.xml" goto:doesntalreadyexist


if %currentcode% GEQ %newcode% goto:noupdate
echo actualizacion de %currentcode% a %newcode%
goto:update

:noupdate
support\sfk echo -spat \x20 [Green] Su version actual de %currentcode% esta actualizada, saltar descarga
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: version encontrada %newcode%">>temp\ModMii_Log.bat
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next

:doesntalreadyexist

::Download most recent version
Echo.
Echo Descargar la version mas reciente: %newcode%
:update
echo.
start %ModMiimin%/wait support\wget "%code1%%newcode%%code2%"
if not exist "%Drive%"\%path1% mkdir "%Drive%"\%path1%


set wadname="%zip1%%newcode%%zip2%"

support\7za x -aoa %wadname% -o"%Drive%"
::support\7za e -aoa %wadname% -o"%Drive%"/%path1% *.%version% -r

del %wadname%>nul

::----simple version check after downloading----
if exist "%DRIVE%\%path1%\meta.xml" goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
goto:MetaChecker
::goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
::get current version from meta.xml
support\sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat>nul
if %currentcode% GEQ %newcode% goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no pudo actualizar correctamente.
support\sfk echo [Yellow] Volver a intentar descargar la version mas reciente del archivo.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
set multiplefail=Y
goto:MetaChecker
::goto:NEXT

:pass
echo.
support\sfk echo [Green]Descarga con exito
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: version encontrada %newcode%">>temp\ModMii_Log.bat
goto:NEXT







::--------------------------GOOGLE CODE 'MANUAL' AUTO-UDPATE------------------------
:GOOGLEUPDATE


if not exist "%DRIVE%\%path1%\meta.xml" goto:doesntexist

echo.
echo Esta aplicacion ya existe...

::get current version if app already exists, skip if its the most recent version
::--------WARNING, if version doesn't start with "R", it will FAIL---------
support\sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>R"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat>nul
echo.
echo La version actual es %currentcode%
echo.
echo Comprobar actualizaciones...
echo.

:doesntexist
start %ModMiimin%/wait support\wget %updateurl%
if not exist %updatedlname% goto:missing
move /y %updatedlname% code.bat>nul

support\sfk filter -quiet code.bat -rep _"*name=R"_"set newcode="_ -rep _".dol&amp;*"__ -write -yes
support\sfk filter -quiet code.bat -ls+"set newcode" -write -yes
support\sfk filter -quiet code.bat -unique -write -yes
call code.bat
del code.bat>nul

set newcode0check=%newcode:~0,1%
if /i "%newcode0check%" EQU "0" (set newcodeNoZeros=%newcode:~1,10%) else (set newcodeNoZeros=%newcode%)


if not exist "%DRIVE%\%path1%\meta.xml" goto:doesntalreadyexist

if %currentcode% GEQ %newcodeNoZeros% goto:noupdate
echo Updating from %currentcode% to %newcodeNoZeros%
goto:update

:noupdate
support\sfk echo -spat \x20 [Green] Su version actual de %currentcode% esta actualizada, saltar descarga
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: version encontrada %newcodeNoZeros%">>temp\ModMii_Log.bat
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:next

:doesntalreadyexist

::Download most recent version
Echo.
Echo Descargar la version mas reciente: %newcodeNoZeros%

:update
echo.

start %ModMiimin%/wait support\wget "%code1%%newcode%%code2%"

if not exist "%Drive%"\%path1% mkdir "%Drive%"\%path1%

::----move file to new location!----
set wadname="%wadname1%%newcode%%wadname2%"
move /y %wadname% "%DRIVE%\%path1%\boot.dol">nul


::----not needed (yet), only applies when downloading zips, not dols---
::set wadname="%zip1%%newcode%%zip2%"
::support\7za x -aoa %wadname% -o"%Drive%"
::del %wadname%


::geticon if doesn't exist
if not exist "%DRIVE%\%path1%\icon.png" start %ModMiimin%/wait support\wget %iconurl%
if exist "icon.png" move /Y "icon.png" "%DRIVE%\%path1%\icon.png"

::meta
start %ModMiimin%/wait support\wget %metaurl%
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
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
goto:MetaChecker
::goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:checkexisting
::get current version from meta.xml
::-----warning, replacing "R" too, careful when applying to other thigns------
support\sfk filter -quiet "%DRIVE%\%path1%\meta.xml" -+"/version" -rep _"*<version>R"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat>nul
if %currentcode% EQU %newcodeNoZeros% goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no pudo actualizar correctamente.
support\sfk echo [Yellow] Volver a intentar descargar la version mas reciente del archivo.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
set multiplefail=Y
goto:MetaChecker
::goto:NEXT

:pass
echo.
support\sfk echo [Green]Descarga con exito
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: version encontrada %newcodeNoZeros%">>temp\ModMii_Log.bat
goto:NEXT


::--------------------------------------Cheat Codes: txtcodes from geckocodes.org------------------------------
:CHEATS

::set cheatregion=all

if exist "codeindex.txt" del "codeindex.txt" >nul
if exist "codeindextemp.txt" del "codeindextemp.txt">nul

echo.
echo       Downloading %cheatregion% Region Cheat Codes for the following console(s):
echo.
if /i "%wiicheat%" EQU "ON" echo                * Wii
if /i "%WiiWarecheat%" EQU "ON" echo                * WiiWare
if /i "%VCArcadecheat%" EQU "ON" echo                * VC Arcade
if /i "%WiiChannelscheat%" EQU "ON" echo                * Wii Channels
if /i "%Gamecubecheat%" EQU "ON" echo                * Gamecube
if /i "%NEScheat%" EQU "ON" echo                * NES/Famicom VC
if /i "%SNEScheat%" EQU "ON" echo                * Super NES/Famicom VC
if /i "%N64cheat%" EQU "ON" echo                * Nintendo 64 VC
if /i "%SMScheat%" EQU "ON" echo                * Sega Master System VC
if /i "%Segacheat%" EQU "ON" echo                * Sega Genesis/Mega Drive VC
if /i "%NeoGeocheat%" EQU "ON" echo                * NeoGeo VC
if /i "%Commodorecheat%" EQU "ON" echo                * Commodore 64 VC
if /i "%MSXcheat%" EQU "ON" echo                * MSX VC
if /i "%TurboGraFX-16cheat%" EQU "ON" echo                * TurboGraFX-16 VC
if /i "%TurboGraFX-CDcheat%" EQU "ON" echo                * TurboGraFX-CD VC
echo.
if /i "%cheatlocation%" EQU "B" echo           Localizacion(es) para guardar trucos: (txtcodes y codes\X\L)
if /i "%cheatlocation%" EQU "T" echo           Localizacion(es) para guardar trucos: (txtcodes)
if /i "%cheatlocation%" EQU "C" echo           Localizacion(es) para guardar trucos: (codes\X\L)
echo.
if /i "%overwritecodes%" EQU "OFF" echo           Sobrescribir txtcodes existentes (Desactivado)
if /i "%overwritecodes%" EQU "ON" echo           Sobrescribir txtcodes existentes (Activado)
echo.
echo       Nota: Los ajustes anteriores se pueden personalizar en las opciones de Codigo de trucos
echo.
echo.
echo   Coger de la lista actual de trucos de geckocodes.org,
echo   Por favor espere...
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
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=R&r=*&l=all"
goto:cheatrepeat

::-------WiiWare------
:allwiiwarecheats
set nextcheatlist=allvccheats
if /i "%WiiWarecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=W&r=*&l=all"
goto:cheatrepeat

::-------VC Arcade------
:allVCcheats
set nextcheatlist=allwiichannelcheats
if /i "%VCArcadecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=D&r=*&l=all"
goto:cheatrepeat

::-------Wii Channels------
:allwiichannelcheats
set nextcheatlist=allGCcheats
if /i "%WiiChannelscheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=H&r=*&l=all"
goto:cheatrepeat

::-------Gamecube------
:allGCcheats
set nextcheatlist=allNEScheats
if /i "%Gamecubecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=G&r=*&l=all"
goto:cheatrepeat

::-------NES------
:allNEScheats
set nextcheatlist=allSNEScheats
if /i "%NEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=F&r=*&l=all"
goto:cheatrepeat

::-------SNES------
:allSNEScheats
set nextcheatlist=allN64cheats
if /i "%SNEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=J&r=*&l=all"
goto:cheatrepeat

::-------N64------
:allN64cheats
set nextcheatlist=allSMScheats
if /i "%N64cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=N&r=*&l=all"
goto:cheatrepeat

::-------SMS------
:allSMScheats
set nextcheatlist=allGenesischeats
if /i "%SMScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=L&r=*&l=all"
goto:cheatrepeat

::-------Genesis------
:allGenesischeats
set nextcheatlist=allNEOcheats
if /i "%Segacheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=M&r=*&l=all"
goto:cheatrepeat

::-------NEO------
:allNEOcheats
set nextcheatlist=allCOMcheats
if /i "%NeoGeocheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=E&r=*&l=all"
goto:cheatrepeat

::-------COMMODORE------
:allCOMcheats
set nextcheatlist=allMSXcheats
if /i "%Commodorecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=C&r=*&l=all"
goto:cheatrepeat

::-------MSX------
:allMSXcheats
set nextcheatlist=allT16cheats
if /i "%MSXcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=X&r=*&l=all"
goto:cheatrepeat

::-------T16------
:allT16cheats
set nextcheatlist=allTCDcheats
if /i "%TurboGraFX-16cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=P&r=*&l=all"
goto:cheatrepeat

::-------TCD------
:allTCDcheats
set nextcheatlist=skipall
if /i "%TurboGraFX-CDcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=Q&r=*&l=all"
goto:cheatrepeat

:skipall



::--------------USA REGION---------------
if /i "%cheatregion%" NEQ "USA" goto:skipUSA

::-------Wii Games--------
set nextcheatlist=USAwiiwarecheats
if /i "%wiicheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=R&r=E&l=all"
goto:cheatrepeat

::-------WiiWare------
:USAwiiwarecheats
set nextcheatlist=USAvccheats
if /i "%WiiWarecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=W&r=E&l=all"
goto:cheatrepeat

::-------VC Arcade------
:USAVCcheats
set nextcheatlist=USAwiichannelcheats
if /i "%VCArcadecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=D&r=E&l=all"
goto:cheatrepeat

::-------Wii Channels------
:USAwiichannelcheats
set nextcheatlist=USAGCcheats
if /i "%WiiChannelscheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=H&r=E&l=all"
goto:cheatrepeat

::-------Gamecube------
:USAGCcheats
set nextcheatlist=USANEScheats
if /i "%Gamecubecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=G&r=E&l=all"
goto:cheatrepeat

::-------NES------
:USANEScheats
set nextcheatlist=USASNEScheats
if /i "%NEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=F&r=E&l=all"
goto:cheatrepeat

::-------SNES------
:USASNEScheats
set nextcheatlist=USAN64cheats
if /i "%SNEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=J&r=E&l=all"
goto:cheatrepeat

::-------N64------
:USAN64cheats
set nextcheatlist=USASMScheats
if /i "%N64cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=N&r=E&l=all"
goto:cheatrepeat

::-------SMS------
:USASMScheats
set nextcheatlist=USAGenesischeats
if /i "%SMScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=L&r=E&l=all"
goto:cheatrepeat

::-------Genesis------
:USAGenesischeats
set nextcheatlist=USANEOcheats
if /i "%Segacheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=M&r=E&l=all"
goto:cheatrepeat

::-------NEO------
:USANEOcheats
set nextcheatlist=USACOMcheats
if /i "%NeoGeocheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=E&r=E&l=all"
goto:cheatrepeat

::-------COMMODORE------
:USACOMcheats
set nextcheatlist=USAMSXcheats
if /i "%Commodorecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=C&r=E&l=all"
goto:cheatrepeat

::-------MSX------
:USAMSXcheats
set nextcheatlist=USAT16cheats
if /i "%MSXcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=X&r=E&l=all"
goto:cheatrepeat

::-------T16------
:USAT16cheats
set nextcheatlist=USATCDcheats
if /i "%TurboGraFX-16cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=P&r=E&l=all"
goto:cheatrepeat

::-------TCD------
:USATCDcheats
set nextcheatlist=skipUSA
if /i "%TurboGraFX-CDcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=Q&r=E&l=all"
goto:cheatrepeat

:skipUSA





::--------------PAL REGION---------------
if /i "%cheatregion%" NEQ "PAL" goto:skipPAL

::-------Wii Games--------
set nextcheatlist=PALwiiwarecheats
if /i "%wiicheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=R&r=P&l=all"
goto:cheatrepeat

::-------WiiWare------
:PALwiiwarecheats
set nextcheatlist=PALvccheats
if /i "%WiiWarecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=W&r=P&l=all"
goto:cheatrepeat

::-------VC Arcade------
:PALVCcheats
set nextcheatlist=PALwiichannelcheats
if /i "%VCArcadecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=D&r=P&l=all"
goto:cheatrepeat

::-------Wii Channels------
:PALwiichannelcheats
set nextcheatlist=PALGCcheats
if /i "%WiiChannelscheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=H&r=P&l=all"
goto:cheatrepeat

::-------Gamecube------
:PALGCcheats
set nextcheatlist=PALNEScheats
if /i "%Gamecubecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=G&r=P&l=all"
goto:cheatrepeat

::-------NES------
:PALNEScheats
set nextcheatlist=PALSNEScheats
if /i "%NEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=F&r=P&l=all"
goto:cheatrepeat

::-------SNES------
:PALSNEScheats
set nextcheatlist=PALN64cheats
if /i "%SNEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=J&r=P&l=all"
goto:cheatrepeat

::-------N64------
:PALN64cheats
set nextcheatlist=PALSMScheats
if /i "%N64cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=N&r=P&l=all"
goto:cheatrepeat

::-------SMS------
:PALSMScheats
set nextcheatlist=PALGenesischeats
if /i "%SMScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=L&r=P&l=all"
goto:cheatrepeat

::-------Genesis------
:PALGenesischeats
set nextcheatlist=PALNEOcheats
if /i "%Segacheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=M&r=P&l=all"
goto:cheatrepeat

::-------NEO------
:PALNEOcheats
set nextcheatlist=PALCOMcheats
if /i "%NeoGeocheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=E&r=P&l=all"
goto:cheatrepeat

::-------COMMODORE------
:PALCOMcheats
set nextcheatlist=PALMSXcheats
if /i "%Commodorecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=C&r=P&l=all"
goto:cheatrepeat

::-------MSX------
:PALMSXcheats
set nextcheatlist=PALT16cheats
if /i "%MSXcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=X&r=P&l=all"
goto:cheatrepeat

::-------T16------
:PALT16cheats
set nextcheatlist=PALTCDcheats
if /i "%TurboGraFX-16cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=P&r=P&l=all"
goto:cheatrepeat

::-------TCD------
:PALTCDcheats
set nextcheatlist=skipPAL
if /i "%TurboGraFX-CDcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=Q&r=P&l=all"
goto:cheatrepeat

:skipPAL





::--------------JAP REGION---------------
if /i "%cheatregion%" NEQ "JAP" goto:skipJAP

::-------Wii Games--------
set nextcheatlist=JAPwiiwarecheats
if /i "%wiicheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=R&r=J&l=all"
goto:cheatrepeat

::-------WiiWare------
:JAPwiiwarecheats
set nextcheatlist=JAPvccheats
if /i "%WiiWarecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=W&r=J&l=all"
goto:cheatrepeat

::-------VC Arcade------
:JAPVCcheats
set nextcheatlist=JAPwiichannelcheats
if /i "%VCArcadecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=D&r=J&l=all"
goto:cheatrepeat

::-------Wii Channels------
:JAPwiichannelcheats
set nextcheatlist=JAPGCcheats
if /i "%WiiChannelscheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=H&r=J&l=all"
goto:cheatrepeat

::-------Gamecube------
:JAPGCcheats
set nextcheatlist=JAPNEScheats
if /i "%Gamecubecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=G&r=J&l=all"
goto:cheatrepeat

::-------NES------
:JAPNEScheats
set nextcheatlist=JAPSNEScheats
if /i "%NEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=F&r=J&l=all"
goto:cheatrepeat

::-------SNES------
:JAPSNEScheats
set nextcheatlist=JAPN64cheats
if /i "%SNEScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=J&r=J&l=all"
goto:cheatrepeat

::-------N64------
:JAPN64cheats
set nextcheatlist=JAPSMScheats
if /i "%N64cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=N&r=J&l=all"
goto:cheatrepeat

::-------SMS------
:JAPSMScheats
set nextcheatlist=JAPGenesischeats
if /i "%SMScheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=L&r=J&l=all"
goto:cheatrepeat

::-------Genesis------
:JAPGenesischeats
set nextcheatlist=JAPNEOcheats
if /i "%Segacheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=M&r=J&l=all"
goto:cheatrepeat

::-------NEO------
:JAPNEOcheats
set nextcheatlist=JAPCOMcheats
if /i "%NeoGeocheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=E&r=J&l=all"
goto:cheatrepeat

::-------COMMODORE------
:JAPCOMcheats
set nextcheatlist=JAPMSXcheats
if /i "%Commodorecheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=C&r=J&l=all"
goto:cheatrepeat

::-------MSX------
:JAPMSXcheats
set nextcheatlist=JAPT16cheats
if /i "%MSXcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=X&r=J&l=all"
goto:cheatrepeat

::-------T16------
:JAPT16cheats
set nextcheatlist=JAPTCDcheats
if /i "%TurboGraFX-16cheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=P&r=J&l=all"
goto:cheatrepeat

::-------TCD------
:JAPTCDcheats
set nextcheatlist=skipJAP
if /i "%TurboGraFX-CDcheat%" NEQ "on" goto:%nextcheatlist%
start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --accept index*l=all "http://www.geckocodes.org/index.php?chid=Q&r=J&l=all"
goto:cheatrepeat

:skipJAP



support\sfk filter -quiet codeindex.txt -+"index.php?c=******" -write -yes



goto:nextstep
::----------DISABLED------------
::-----remove titles that already exist (if applicable)---------
if /i "%overwritecodes%" EQU "on" goto:nextstep
if not exist "%drive%"\txtcodes\*.txt goto:nextstep
::echo Comprobacion de los nuevos codigos de trucos
::echo Esto podria tomar un minuto, por favor espere...
::echo.
echo Los siguientes trucos ya existen y se eliminaran de la cola de descarga:
echo.
dir /b "%drive%"\txtcodes>existingcodes.txt
support\sfk filter -quiet existingcodes.txt -+.txt -rep _.txt__ -write -yes
::Loop through the existing list of codes (existingcodes.txt) and remove each existing game from codeindex.txt
for /F "tokens=*" %%A in (existingcodes.txt) do call :processthis %%A
goto:nextstep

:processthis
::this is repeated for each line of the txt.file
::"%*" (no quotes) is the variable for each line as it passes through the loop

set removetitleID=%*
echo Saltar %removetitleID%.txt...
support\sfk filter -quiet codeindex.txt -!%removetitleID% -write -yes
goto:EOF
:nextstep


if exist existingcodes.txt del existingcodes.txt>nul


support\sfk filter codeindex.txt -unique -write -yes>nul
FINDSTR /N href codeindex.txt>codeindexfull.txt
del codeindex.txt>nul

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

support\sfk filter -quiet codeindexfull2.txt -ls+"%codenumber%:<" -ls!"%codenumber%%codenumber%:<" -ls!"%codenumber%%codenumber%%codenumber%:<" -rep _"*title='*["_"set titleid="_ -rep _"] *"__ -rep _"set titleid=set titleid="_"set titleid="_ -write -yes

::support\sfk filter -quiet codeindexfull2.txt -ls+"%codenumber%:<" -ls!"%codenumber%%codenumber%:<" -ls!"%codenumber%%codenumber%%codenumber%:<" -rep _"*'Wii ["_"set titleid="_ -rep _"] *"__ -write -yes



FINDSTR /N set codeindexfull2.txt>codeindex.bat
del codeindexfull2.txt>nul

support\sfk filter -quiet codeindex.bat -ls+"1:" -rep _"1:"__ -write -yes
call codeindex.bat
del codeindex.bat>nul


::now get game name!!
copy /y codeindexfull.txt codeindexTitle.bat>nul
::add in delay so support\sfk has access to codeindexTitle.bat (Foez reported bug)
::@ping 127.0.0.1 -n 1 -w 1500> nul
support\sfk filter -quiet codeindexTitle.bat -+"%titleid%" -rep _"*c=%titleid%"_"set titlename="_ -rep _" [%titleid%]*"_"""_ -rep _>__ -write -yes
support\sfk filter -quiet codeindexTitle.bat -ls+"set titlename=" -write -yes
call codeindexTitle.bat
del codeindexTitle.bat>nul


::if /i "%cheatlocation%" EQU "T" goto:skipconsoleinfo

::now get console!!
copy /y codeindexfull.txt codeindexConsole.bat>nul
support\sfk filter -quiet codeindexConsole.bat -+"%titleid%" -rep _"*sysn' title='"_"set console="_ -rep _"'>[*"_"""_ -write -yes
support\sfk filter -quiet codeindexConsole.bat -rep _"""__ -write -yes
support\sfk filter -quiet codeindexConsole.bat -ls+"set console=" -write -yes
call codeindexConsole.bat
del codeindexConsole.bat>nul

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
echo Descargar trucos %codenumber% de %totalcodes%: %titlename% [%titleid%]

if /i "%cheatlocation%" EQU "T" goto:skip
if not exist "%drive%\codes\%consolecode%\%letter1%" mkdir "%drive%\codes\%consolecode%\%letter1%"
:skip

if /i "%overwritecodes%" EQU "on" goto:overwritecheat


::----copy existing codes to alternate location if missing----
if /i "%cheatlocation%" EQU "C" goto:skip
if not exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" goto:skip
if not exist "%drive%\txtcodes\%titleid%.txt" echo Copia desde codes\%consolecode%\%letter1%\%titleid%.txt to txtcodes\%titleid%.txt
if not exist "%drive%\txtcodes\%titleid%.txt" copy /y "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" "%drive%\txtcodes\%titleid%.txt">nul
:skip
if /i "%cheatlocation%" EQU "T" goto:skip
if not exist "%drive%\txtcodes\%titleid%.txt" goto:skip
if not exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" echo Copia desde txtcodes\%titleid%.txt to codes\%consolecode%\%letter1%\%titleid%.txt
if not exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" copy /y "%drive%\txtcodes\%titleid%.txt" "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt">nul
:skip

if /i "%cheatlocation%" EQU "C" goto:skip
if not exist "%drive%\txtcodes\%titleid%.txt" goto:downloadcheat
:skip

if /i "%cheatlocation%" EQU "T" goto:skip
if not exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" goto:downloadcheat
:skip

echo %titleid%.txt ya existe,
echo altar descarga...
echo.
goto:processcode

:overwritecheat
if /i "%cheatlocation%" EQU "C" goto:skip
if exist "%drive%\txtcodes\%titleid%.txt" echo Overwriting %drive%\txtcodes\%titleid%.txt...
:skip
if /i "%cheatlocation%" EQU "T" goto:skip
if exist "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt" echo Overwriting %drive%\codes\%consolecode%\%letter1%\%titleid%.txt...
:skip

:downloadcheat
start %ModMiimin%/wait support\wget "http://www.geckocodes.org/txt.php?txt=%titleid%"

if /i "%cheatlocation%" EQU "T" move /y "txt.php@txt=%titleid%" "%drive%\txtcodes\%titleid%.txt">nul
if /i "%cheatlocation%" EQU "C" move /y "txt.php@txt=%titleid%" "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt">nul

if /i "%cheatlocation%" EQU "B" copy /y "txt.php@txt=%titleid%" "%drive%\txtcodes\%titleid%.txt">nul
if /i "%cheatlocation%" EQU "B" move /y "txt.php@txt=%titleid%" "%drive%\codes\%consolecode%\%letter1%\%titleid%.txt">nul

::for some reason VC downloads fail, and they leave index.html as a trace instead
::if exist index.html del index.html>nul

goto:processcode

:nextstep

del codeindexfull.txt>nul
del codeindexfull2.txt>nul


::Simple Check

if /i "%cheatlocation%" EQU "C" goto:skip
If exist "%DRIVE%"\txtcodes\*.txt echo "echo Codigos de trucos: Encontrados">>temp\ModMii_Log.bat
If not exist "%DRIVE%"\txtcodes\*.txt echo "support\sfk echo Codigos de trucos: [Red]Fallo">>temp\ModMii_Log.bat
:skip

if /i "%cheatlocation%" EQU "T" goto:skip
If exist "%DRIVE%"\codes echo "echo Codigos de trucos: Encontrados">>temp\ModMii_Log.bat
If not exist "%DRIVE%"\codes echo "support\sfk echo Codigos de trucos: [Red]Fallo">>temp\ModMii_Log.bat
:skip


goto:NEXT




::------------------------NUS File Grabber Downloader---------------------

:DownloadApp

if /i "%code1%" EQU "MYMAPP" goto:MYMAPP

::SNEEKAPP
if not exist "%Drive%"\SNEEKFILES mkdir "%Drive%"\SNEEKFILES
goto:skip

:MYMAPP
if not exist "%Drive%"\ModThemes mkdir "%Drive%"\ModThemes
:skip


set filename=%wadname%
if /i "%code1%" EQU "SNEEKAPP" set path1=SNEEKFILES\
if /i "%code1%" EQU "MYMAPP" set path1=ModThemes\
set md5alt=%md5%
goto:DownloadURL


:DownloadApp2


set dlname=%wadname:~0,8%.app

if exist temp\%wadname% goto:AlreadyinTemp

support\NusFileGrabber.exe %version%
move /Y "%dlname%" temp\%wadname%>nul

:AlreadyinTemp
if /i "%code1%" EQU "MYMAPP" copy /Y temp\"%wadname%" "%Drive%"\ModThemes\%wadname%>nul
if /i "%code1%" EQU "SNEEKAPP" copy /Y temp\"%wadname%" "%Drive%"\SNEEKFILES\%wadname%>nul

goto:URLverifyretry




::-------------------------Download from URLs------------------------------
:DownloadURL
::----if exist and fails md5 check, delete and redownload----
if not exist "%Drive%\%path1%%filename%" goto:nocheckexisting
set md5check=
support\sfk md5 -quiet -verify %md5% "%Drive%\%path1%%filename%"
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%\%path1%%filename%">nul
if exist temp\%wadname% del temp\%wadname%>nul
goto:DOWNLOADSTART2

:pass
support\sfk echo [Green]Este archivo ya existe y ha sido verificado, Saltar descarga
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: Valido">>temp\ModMii_Log.bat
goto:NEXT
:nocheckexisting

if /i "%code1%" EQU "MYMAPP" goto:DownloadApp2
if /i "%code1%" EQU "SNEEKAPP" goto:DownloadApp2


:DownloadURL2
if not exist temp\%wadname% start %ModMiimin%/wait support\wget %code2%
if exist %dlname% move /y %dlname% temp\%wadname%
support\7za e -aoa temp\%wadname% -o"%Drive%"/%path1% *.%version% -r

::save identifier for bannerbombs
if /i "%code2%" EQU "http://bannerbomb.qoid.us/aads/aad1f_v108.zip" echo Bannerbombv1 >"%Drive%\%path1%Bannerbombv1.txt"
if /i "%code2%" EQU "http://bannerbomb.qoid.us/abds/abd6a_v200.zip" echo Bannerbombv2 >"%Drive%\%path1%Bannerbombv2.txt"

:URLverifyretry
if "%DRIVErestore%"=="" set DRIVErestore=%Drive%
::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%\%path1%%filename%" goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
set DRIVE=%DRIVErestore%
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
if exist temp\%wadname% del temp\%wadname%>nul
set DRIVE=%DRIVErestore%
goto:DOWNLOADSTART2

:checkexisting
set md5check=
support\sfk md5 -quiet -verify %md5% "%Drive%\%path1%%filename%"
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado
echo.
del "%Drive%\%path1%%filename%">nul
if exist temp\%wadname% del temp\%wadname%>nul
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
set DRIVE=%DRIVErestore%
goto:DOWNLOADSTART2

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
set DRIVE=%DRIVErestore%
set multiplefail=Y
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Invalido">>temp\ModMii_Log.bat
goto:NEXT

:pass
echo.
support\sfk echo [Green]Descarga con exito
echo.
set DRIVE=%DRIVErestore%
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: Valido">>temp\ModMii_Log.bat
goto:NEXT





:fullextract

set LocalAbsolute=
set DRIVErestore=%Drive%

if /i "%wadname%" EQU "WiiBackupManager.zip" goto:doit
if /i "%wadname%" EQU "FAT32_GUI_Formatter.exe" goto:doit
if /i "%filename%" EQU "ShowMiiWads.exe" goto:doit
if /i "%filename%" EQU "CustomizeMii.exe" goto:doit
if /i "%filename%" EQU "WiiGSC.exe" goto:doit
goto:skip
:doit
if /i "%PCSAVE%" EQU "Local" (set DRIVE=%homedrive%\ModMii\Program Files) & (set LocalAbsolute=%homedrive%\ModMii\Program Files\)
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" EQU "%ModMiipath:~0,2%" (set DRIVE=%homedrive%\ModMii\Program Files) & (set LocalAbsolute=%homedrive%\ModMii\Program Files\)
:skip
if not exist "%Drive%" mkdir "%Drive%"


::----if exist and fails md5 check, delete and redownload----
if not exist "%Drive%\%path1%%filename%" goto:nocheckexisting
set md5check=
support\sfk md5 -quiet -verify %md5% "%Drive%\%path1%%filename%"
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
del "%Drive%\%path1%%filename%">nul
if exist temp\%wadname% del temp\%wadname%>nul
set DRIVE=%DRIVErestore%
goto:DOWNLOADSTART2

:pass
support\sfk echo [Green]Este archivo ya existe y ha sido verificado, Saltar descarga
echo.
set DRIVE=%DRIVErestore%
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: Valido">>temp\ModMii_Log.bat
goto:NEXT
:nocheckexisting


:fullextract2

if exist "temp\%wadname%" goto:FullExtractZipAlreadyExists
if not exist temp\%dlname% start %ModMiimin%/wait support\wget %code2%
if exist %dlname% move /y %dlname% "temp\%wadname%">nul
:FullExtractZipAlreadyExists

::extract selected apps differently...


if /i "%path1%" NEQ "apps\MyMenuifyMod\" goto:notmym
::download unrar if missing
if not exist temp\UnRAR.exe echo.
if not exist temp\UnRAR.exe echo Downloading UnRAR
if not exist temp\UnRAR.exe start %ModMiimin%/wait support\wget -t 3 "http://files.cybergamer.com.au/richard/FIFA Online 2 Full Client v200/UnRAR.exe"
if exist UnRAR.exe move /y UnRAR.exe temp\UnRAR.exe>nul


temp\unrar.exe x -y "temp\%wadname%" "%Drive%\apps\"
goto:skipnormalextraction
:notmym


if /i "%wadname:~0,20%" EQU "USBLoader(s)-ahbprot" support\7za e -aoa temp\%dlname% -o"%Drive%"/WAD *.%version% -r
if /i "%wadname:~0,20%" EQU "USBLoader(s)-ahbprot" goto:skipnormalextraction

if /i "%wadname%" EQU "indiana-pwns.zip" (support\7za X -aoa temp\%wadname% -o"%Drive%" private -r) & (goto:skipnormalextraction)

if /i "%wadname%" EQU "bathaxx.zip" support\7za X -aoa temp\%wadname% -o"%Drive%" private -r
if /i "%wadname%" EQU "bathaxx.zip" goto:skipnormalextraction

if /i "%wadname%" EQU "return-jodi.zip" support\7za X -aoa temp\%wadname% -o"%Drive%" private -r
if /i "%wadname%" EQU "return-jodi.zip" goto:skipnormalextraction

if /i "%wadname%" EQU "EriHaKawai-USA+PAL.zip" support\7za X -aoa temp\%wadname% -o"%Drive%" private -r
if /i "%wadname%" EQU "EriHaKawai-USA+PAL.zip" goto:skipnormalextraction


if /i "%name%" EQU "Neogamma Backup Disc Loader" (support\7za X -aoa temp\%wadname% -o"%Drive%" apps -r) & (support\7za X -aoa temp\%wadname% -o"%Drive%" NeoGamma -r) & (goto:skipnormalextraction)


if /i "%path1%" EQU "apps\SIP\" (support\7za X -aoa temp\%wadname% -o"%Drive%" apps -r) & (goto:skipnormalextraction)

if /i "%path1%" EQU "apps\sysCheckBeta\" (support\7za X -aoa temp\%wadname% -o"%Drive%" apps -r) & (support\7za X -aoa temp\%wadname% -o"%Drive%" config -r) & (goto:skipnormalextraction)


if /i "%name%" NEQ "Joy Flow Forwarder Channel\dol" goto:skipjoyflow
::if /i "%MENU1%" EQU "S" support\7za e -aoa temp\%dlname% -o"%Drive%"/ *.wad *.dol -r
support\7za X -aoa temp\%dlname% -o"%Drive%" -r
goto:skipnormalextraction
:skipjoyflow


if /i "%name%" NEQ "switch2uneek" goto:skipS2U
if /i "%MENU1%" EQU "S" support\7za e -aoa temp\%wadname% -o"%Drive%/WAD"/ %filename% -r
if /i "%MENU1%" EQU "S" goto:skipnormalextraction
::for when MENU1 not equal to "S"
support\7za x -aoa temp\%dlname% -o"%Drive%" -r -x!switch2uneek(emulators)-4EMUNand-v11-S2RL.wad

if not exist "%DRIVEU%" mkdir "%DRIVEU%"
if not exist "%DRIVEU%"\nandpath.txt echo NOFILE>"%DRIVEU%"\nandpath.txt
if exist "%DRIVEU%"\nandslot.bin goto:skipnormalextraction
echo 00000000>dump.txt
support\sfk filter dump.txt +hextobin "%DRIVEU%"\nandslot.bin
del dump.txt>nul
goto:skipnormalextraction
:skipS2U

if /i "%wadname:~0,15%" NEQ "Homebrew_Filter" goto:skipHBF
if not exist "%Drive%\WAD" mkdir "%Drive%\WAD"
if /i "%MENU1%" NEQ "S" copy /y "temp\%wadname%" "%Drive%\%path1%%wadname%">nul
if /i "%MENU1%" EQU "S" move /y "temp\%wadname%" "%Drive%\%path1%%wadname%">nul
goto:skipnormalextraction
:skipHBF


if /i "%filename%" NEQ "WiiBackupManager.exe" goto:notWBM
if exist "%DRIVE%"\WiiBackupManager rd /s /q "%DRIVE%"\WiiBackupManager
support\7za x -aoa temp\%wadname% -o"%Drive%" -r
rename "%Drive%"\%dlname:~0,-4% WiiBackupManager

if /i "%PCSAVE%" EQU "Local" goto:createshortcuts
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" EQU "%ModMiipath:~0,2%" (goto:createshortcuts) else (goto:skip)
:createshortcuts
support\nircmd.exe shortcut "%DRIVE%\WiiBackupManager\WiiBackupManager.exe" "~$folder.desktop$" "WiiBackupManager"
support\nircmd.exe shortcut "%DRIVE%\WiiBackupManager\WiiBackupManager.exe" "~$folder.programs$\WiiBackupManager" "WiiBackupManager"
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
support\nircmd.exe shortcut "%Drive%\%path1%FAT32_GUI_Formatter.exe" "~$folder.desktop$" "FAT32 GUI Formatter"
support\nircmd.exe shortcut "%Drive%\%path1%FAT32_GUI_Formatter.exe" "~$folder.programs$\FAT32 GUI Formatter" "FAT32 GUI Formatter"
:skip
goto:skipnormalextraction
:notF32


if /i "%filename%" NEQ "ShowMiiWads.exe" goto:notSMW
if not exist "%DRIVE%"\ShowMiiWads mkdir "%DRIVE%"\ShowMiiWads


::download unrar if missing
if not exist temp\UnRAR.exe echo.
if not exist temp\UnRAR.exe echo Descargando UnRAR
if not exist temp\UnRAR.exe start %ModMiimin%/wait support\wget -t 3 "http://files.cybergamer.com.au/richard/FIFA Online 2 Full Client v200/UnRAR.exe"
if exist UnRAR.exe move /y UnRAR.exe temp\UnRAR.exe>nul


temp\unrar.exe x -y "temp\%wadname%" "%Drive%\ShowMiiWads"


if exist support\common-key.bin goto:commonkeyalreadythere

::silently build common-key.bin
echo EBE42A225E8593E448D9C5457381AAF7>support\common-key.txt
support\sfk filter support\common-key.txt +hextobin support\common-key.bin>nul
del support\common-key.txt>nul
:commonkeyalreadythere
copy /y support\common-key.bin "%Drive%\ShowMiiWads\common-key.bin">nul

if /i "%PCSAVE%" EQU "Local" goto:createshortcuts
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" EQU "%ModMiipath:~0,2%" (goto:createshortcuts) else (goto:skip)
:createshortcuts
support\nircmd.exe shortcut "%DRIVE%\ShowMiiWads\ShowMiiWads.exe" "~$folder.desktop$" "ShowMiiWads"
support\nircmd.exe shortcut "%DRIVE%\ShowMiiWads\ShowMiiWads.exe" "~$folder.programs$\ShowMiiWads" "ShowMiiWads"
:skip
goto:skipnormalextraction
:notSMW


if /i "%filename%" NEQ "CustomizeMii.exe" goto:notCM
if not exist "%DRIVE%"\CustomizeMii mkdir "%DRIVE%"\CustomizeMii

::download unrar if missing
if not exist temp\UnRAR.exe echo.
if not exist temp\UnRAR.exe echo Descargando UnRAR
if not exist temp\UnRAR.exe start %ModMiimin%/wait support\wget -t 3 "http://files.cybergamer.com.au/richard/FIFA Online 2 Full Client v200/UnRAR.exe"
if exist UnRAR.exe move /y UnRAR.exe temp\UnRAR.exe>nul

temp\unrar.exe x -y "temp\%wadname%" "%Drive%\CustomizeMii"
if /i "%PCSAVE%" EQU "Local" goto:createshortcuts
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" EQU "%ModMiipath:~0,2%" (goto:createshortcuts) else (goto:skip)
:createshortcuts
support\nircmd.exe shortcut "%DRIVE%\CustomizeMii\CustomizeMii.exe" "~$folder.desktop$" "CustomizeMii"
support\nircmd.exe shortcut "%DRIVE%\CustomizeMii\CustomizeMii.exe" "~$folder.programs$\CustomizeMii" "CustomizeMii"
:skip
goto:skipnormalextraction
:notCM


if /i "%filename%" NEQ "WiiGSC.exe" goto:notWiiGSC
if not exist "%DRIVE%"\WiiGSC mkdir "%DRIVE%"\WiiGSC
support\7za x -aoa temp\%wadname% -o"%Drive%\WiiGSC" -r
if /i "%PCSAVE%" EQU "Local" goto:createshortcuts
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" EQU "%ModMiipath:~0,2%" (goto:createshortcuts) else (goto:skip)
:createshortcuts
support\nircmd.exe shortcut "%DRIVE%\WiiGSC\WiiGSC.exe" "~$folder.desktop$" "WiiGSC"
support\nircmd.exe shortcut "%DRIVE%\WiiGSC\WiiGSC.exe" "~$folder.programs$\Wiidewii" "WiiGSC"
support\nircmd.exe shortcut "%DRIVE%\WiiGSC\CrazyInstaller.exe" "~$folder.programs$\Wiidewii" "CrazyInstaller"
support\nircmd.exe shortcut "%DRIVE%\WiiGSC\KeyStego.exe" "~$folder.programs$\Wiidewii" "KeyStego"

:skip
goto:skipnormalextraction
:notWiiGSC


if /i "%wadname%" EQU "twilight_hack_v0.1_beta1.zip" support\7za X -aoa temp\%wadname% -o"%Drive%" private -r
if /i "%wadname%" EQU "twilight_hack_v0.1_beta1.zip" goto:skipnormalextraction
if /i "%path1%" EQU "apps\homebrew_browser\" support\7za X -aoa temp\%wadname% -o"%Drive%"\apps homebrew_browser -r
if /i "%path1%" EQU "apps\homebrew_browser\" goto:skipnormalextraction

if /i "%wadname%" EQU "YU-GI-OWNED-ALL.zip" support\7za X -aoa temp\%wadname% -o"%Drive%" private -r
if /i "%wadname%" EQU "YU-GI-OWNED-ALL.zip" goto:skipnormalextraction


if /i "%path1%" EQU "apps\DOP-Mii\" support\7za e -aoa temp\%wadname% -o"%Drive%"/%path1% -x!*.cfg
if /i "%path1%" EQU "apps\DOP-Mii\" rd /s /q "%Drive%\%path1%DOP-Mii" -r >nul
if /i "%path1%" EQU "apps\DOP-Mii\" rd /s /q "%Drive%\%path1%DOP-Mii v13" -r >nul
if /i "%path1%" EQU "apps\DOP-Mii\" rd /s /q "%Drive%\%path1%config" -r >nul
if /i "%path1%" EQU "apps\DOP-Mii\" rd /s /q "%Drive%\%path1%apps" -r >nul
if /i "%path1%" EQU "apps\DOP-Mii\" mkdir "%DRIVE%\config"
if /i "%path1%" EQU "apps\DOP-Mii\" move /y "%Drive%\%path1%\DOP-Mii.cfg" "%Drive%\config\DOP-Mii.cfg" >nul
if /i "%path1%" EQU "apps\DOP-Mii\" goto:skipnormalextraction

support\7za x -aoa temp\%wadname% -o"%Drive%" -x!README
:skipnormalextraction

goto:URLverifyretry
::DONE (will retry if necessary)



:DownloadhacksToRoot
::----if exist and fails md5 check, delete and redownload----
if not exist "%Drive%"\hacks.ini goto:nocheckexisting
set md5check=
support\sfk md5 -quiet -verify %md5% "%Drive%"\hacks.ini
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
del "%Drive%"\hacks.ini>nul
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
if exist temp\%wadname% del temp\%wadname%>nul
goto:DOWNLOADSTART2

:pass
support\sfk echo [Green]Este archivo ya existe y ha sido verificado, Saltar descarga
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: Valido">>temp\ModMii_Log.bat
goto:NEXT
:nocheckexisting


if not exist temp\%wadname% start %ModMiimin%/wait support\wget %code2%
if exist %wadname% move /y %wadname% temp\%wadname%>nul
support\7za e -aoa temp\%wadname% -o"%Drive%" *.%version% -r


::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%"\hacks.ini goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Falta">>temp\ModMii_Log.bat
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
if exist temp\%wadname% del temp\%wadname%>nul
goto:DOWNLOADSTART2

:checkexisting
set md5check=
support\sfk md5 -quiet -verify %md5% "%Drive%"\hacks.ini
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
del "%Drive%"\hacks.ini>nul
if exist temp\%wadname% del temp\%wadname%>nul
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
set multiplefail=Y
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Invalido">>temp\ModMii_Log.bat
goto:NEXT

:pass
echo.
support\sfk echo [Green]Descarga con exito
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: Valido">>temp\ModMii_Log.bat
goto:NEXT



::---------------CustomDL--------------------------
:CUSTOMDL
echo     Tenga en cuenta que las descargas de personalizadas no se verifican, y no necesariamente son seguras.
echo     Asegurese de saber lo que estas haciendo! Utilice bajo su propio riesgo!
echo.


if /i "%DEC%" EQU "SM" set HEX=00000002
if /i "%DEC%" EQU "MIOS" set HEX=00000101
if /i "%DEC%" EQU "SM" goto:skiphexcalc
if /i "%DEC%" EQU "MIOS" goto:skiphexcalc

support\sfk hex %DEC% -digits=8 >hex.txt


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

echo     Si se encuentra con largos periodos de inactividad, de tipo "C" manteniendo "Ctrl",
echo     a continuacion, escriba "N", seguido de "Enter" (ie. Ctrl+C = N = Enter)
echo.
support\nusd 00000001%HEX% "%VER%"


::if not exist 00000001%HEX%\00000001%HEX%.wad goto:missing


if /i "%DEC%" EQU "SM" goto:SYSMENU
if /i "%DEC%" EQU "MIOS" goto:MIOS2

::IOS

if /i "%ROOTSAVE%" EQU "OFF" (set wadfolder=WAD\) else (set wadfolder=)

if exist support\00000001%HEX%\00000001%HEX%.wad move /Y support\00000001%HEX%\00000001%HEX%.wad "%Drive%"\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad>nul

if /i "%verfinal%" EQU "NEW" goto:option1notNUS

if /i "%OPTION1%" EQU "ON" goto:option1on
if /i "%OPTION1%" EQU "ALL" (goto:option1on) else (goto:option1noton)
:option1on
if not exist "%Drive%"\00000001\%HEX%\v%verfinal% mkdir "%Drive%"\00000001\%HEX%\v%verfinal%
if exist support\00000001%HEX% copy /Y support\00000001%HEX% "%Drive%"\00000001\%HEX%\v%verfinal% >nul
:option1noton

if /i "%OPTION1%" EQU "NUS" goto:option1NUS
if /i "%OPTION1%" EQU "ALL" (goto:option1NUS) else (goto:option1notNUS)
:option1NUS
if not exist "%Drive%"\NUS\00000001%HEX%v%verfinal% mkdir "%Drive%"\NUS\00000001%HEX%v%verfinal%
copy /y support\00000001%HEX% "%Drive%"\NUS\00000001%HEX%v%verfinal% >nul
:option1notNUS

if exist support\00000001%HEX% rd /s /q support\00000001%HEX%

if /i "IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad" EQU "IOS%DEC%v%VERFINAL%.wad" goto:nopatching

echo.
cd support
if /i "%DRIVE:~1,1%" EQU ":" (set DRIVEadj=%DRIVE%) else (set DRIVEadj=..\%DRIVE%)
if exist "%DRIVEadj%"\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad (patchios "%DRIVEadj%"\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad%PATCHCODE%%slotcode%%versioncode%) & (echo.) & (echo Note: Patches are not always successful, read the PatchIOS log above for details)
cd..
:nopatching

if exist "%DRIVE%"\%wadfolder%IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad (goto:there) else (goto:missing)



:SYSMENU
if exist support\00000001%HEX%\00000001%HEX%.wad move /Y support\00000001%HEX%\00000001%HEX%.wad "%Drive%"\%wadfolder%SystemMenu-NUS-v%VERFINAL%.wad>nul

if /i "%verfinal%" EQU "NEW" goto:option1notNUS

if /i "%OPTION1%" EQU "ON" goto:option1on
if /i "%OPTION1%" EQU "ALL" (goto:option1on) else (goto:option1noton)
:option1on
if not exist "%Drive%"\00000001\%HEX%\v%verfinal% mkdir "%Drive%"\00000001\%HEX%\v%verfinal%
if exist support\00000001%HEX% copy /Y support\00000001%HEX% "%Drive%"\00000001\%HEX%\v%verfinal% >nul
:option1noton

if /i "%OPTION1%" EQU "NUS" goto:option1NUS
if /i "%OPTION1%" EQU "ALL" (goto:option1NUS) else (goto:option1notNUS)
:option1NUS
if not exist "%Drive%"\NUS\00000001%HEX%v%verfinal% mkdir "%Drive%"\NUS\00000001%HEX%v%verfinal%
copy /y temp\%code1%\%code2%\v%version% "%Drive%"\NUS\00000001%HEX%v%verfinal% >nul
:option1notNUS

if exist support\00000001%HEX% rd /s /q support\00000001%HEX%

if exist "%Drive%"\%wadfolder%SystemMenu-NUS-v%VERFINAL%.wad (goto:there) else (goto:missing)



:MIOS2
if /i "%ROOTSAVE%" EQU "OFF" (set wadfolder=WAD\) else (set wadfolder=)
if exist support\00000001%HEX%\00000001%HEX%.wad move /Y support\00000001%HEX%\00000001%HEX%.wad "%Drive%"\%wadfolder%RVL-mios-v%VERFINAL%.wad>nul

if /i "%verfinal%" EQU "NEW" goto:option1notNUS

if /i "%OPTION1%" EQU "ON" goto:option1on
if /i "%OPTION1%" EQU "ALL" (goto:option1on) else (goto:option1noton)
:option1on
if not exist "%Drive%"\00000001\%HEX%\v%verfinal% mkdir "%Drive%"\00000001\%HEX%\v%verfinal%
if exist support\00000001%HEX% copy /Y support\00000001%HEX% "%Drive%"\00000001\%HEX%\v%verfinal% >nul
:option1noton

if /i "%OPTION1%" EQU "NUS" goto:option1NUS
if /i "%OPTION1%" EQU "ALL" (goto:option1NUS) else (goto:option1notNUS)
:option1NUS
if not exist "%Drive%"\NUS\00000001%HEX%v%verfinal% mkdir "%Drive%"\NUS\00000001%HEX%v%verfinal%
copy /y temp\%code1%\%code2%\v%version% "%Drive%"\NUS\00000001%HEX%v%verfinal% >nul
:option1notNUS

if exist support\00000001%HEX% rd /s /q support\00000001%HEX%

if exist "%Drive%"\%wadfolder%RVL-mios-v%VERFINAL%.wad (goto:there) else (goto:missing)


::----check after downloading - if md5 check fails, delete and redownload----

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
support\sfk echo -spat \x20 \x20 \x20 [Magenta] Lo mas probable es que el archivo no existe.
support\sfk echo -spat \x20 \x20 \x20 [Magenta] Revise sus valores personalizados.
echo.

if /i "%DEC%" EQU "SM" (echo "support\sfk echo SystemMenu-NUS-v%VERFINAL%.wad: [Red]Fallo">>temp\ModMii_Log.bat) & (goto:NEXT)
if /i "%DEC%" EQU "MIOS" (echo "support\sfk echo %RVL-mios-v%VERFINAL%.wad: [Red]Fallo">>temp\ModMii_Log.bat) & (goto:NEXT)
echo "support\sfk echo IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
::if exist temp\%wadname% del temp\%wadname%>nul
goto:DOWNLOADSTART2

:there
echo.
support\sfk echo [Green]Descarga avanzada con exito

if /i "%DEC%" EQU "SM" (echo "echo SystemMenu-NUS-v%VERFINAL%.wad: Found">>temp\ModMii_Log.bat) & (goto:NEXT)
if /i "%DEC%" EQU "MIOS" (echo "echo RVL-mios-v%VERFINAL%.wad: Found">>temp\ModMii_Log.bat) & (goto:NEXT)
echo "echo IOS%DEC%v%VERFINAL%%patchname%%slotname%%versionname%.wad: Found">>temp\ModMii_Log.bat
goto:NEXT



::---------------HackMii Installer support\wget Download CODE-----------------------
:wget
::----if exist and fails md5 check, delete and redownload----
if not exist "%Drive%"\apps\HackMii_Installer\boot.elf goto:nocheckexisting
set md5check=
support\sfk md5 -quiet -verify %md5% "%Drive%"\apps\HackMii_Installer\boot.elf
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
del "%Drive%"\apps\HackMii_Installer\boot.elf>nul
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
if exist temp\%wadname% del temp\%wadname%>nul
goto:DOWNLOADSTART2

:pass
support\sfk echo [Green]Este archivo ya existe y ha sido verificado, Saltar descarga
echo.
COPY /Y "%Drive%"\apps\HackMii_Installer\boot.elf "%Drive%"\boot.elf> nul
COPY /Y "%Drive%"\apps\HackMii_Installer\bootmini.elf "%Drive%"\bootmini.elf> nul
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: Valido">>temp\ModMii_Log.bat
goto:alreadyhavehackmii
:nocheckexisting



if not exist temp\%wadname% start %ModMiimin%/wait support\wget -c -l1 -r -nd --retr-symlinks -t10 -T30 --random-wait --reject "*.html" --reject "%2A" %code2%*
if not exist temp\%wadname% move /y get.*.* temp\%wadname%>nul
if not exist "%Drive%"\apps\HackMii_Installer mkdir "%Drive%"\apps\HackMii_Installer
support\7za e -aoa temp\%wadname% -o"%Drive%"\apps\HackMii_Installer *.%version% *.txt -r
support\7za e -aoa temp\%wadname% -o"%Drive%" *.%version% -r



::----check after downloading - if md5 check fails, delete and redownload----
if exist "%Drive%"\apps\HackMii_Installer\boot.elf goto:checkexisting

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
if exist temp\%wadname% del temp\%wadname%>nul
goto:DOWNLOADSTART2

:checkexisting
set md5check=
support\sfk md5 -quiet -verify %md5% "%Drive%"\apps\HackMii_Installer\boot.elf
if errorlevel 1 set md5check=fail
IF "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:pass

:fail
if /i "%attempt%" NEQ "1" goto:multiplefail
echo.
support\sfk echo [Yellow] Este archivo ya existe, pero no paso la verificacion MD5.
support\sfk echo [Yellow] La version actual del archivo sera borrado y sera descargado de nuevo.
echo.
del "%Drive%"\apps\HackMii_Installer\boot.elf>nul
if exist temp\%wadname% del temp\%wadname%>nul
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:multiplefail
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
set multiplefail=Y
if /i "%AdvancedDownload%" NEQ "Y" echo "support\sfk echo %name%: [Red]Invalido">>temp\ModMii_Log.bat
goto:NEXT

:pass
echo.
support\sfk echo [Green]Descarga con exito
echo.
if /i "%AdvancedDownload%" NEQ "Y" echo "echo %name%: Valido">>temp\ModMii_Log.bat
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


::----------------------FORWARDER------------------
:FORWARDER

if not exist "%Drive%\DOLS" mkdir "%Drive%\DOLS"

if /i "%FORWARDERTYPE:~0,1%" EQU "1" copy /y support\DOLS\SDUSBFORWARDER_v11b.dol "%Drive%\DOLS\%wadname%.dol">nul
if /i "%FORWARDERTYPE:~0,1%" EQU "2" copy /y support\DOLS\INTERNETFORWARDER.dol "%Drive%\DOLS\%wadname%.dol">nul
if /i "%FORWARDERTYPE:~0,1%" EQU "3" copy /y support\DOLS\CHANNELFORWARDER.dol "%Drive%\DOLS\%wadname%.dol">nul

::%s:/ = 0x25,0x73,0x3a,0x2f

if "%path-1%"=="" goto:nopath-1
echo Convertir %path-1% a hex
set var=%path-1%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p hex= <temphex.txt
del /f /q temphex.txt
set hex=0x%hex:~0,-4%
echo Patching %wadname%.dol with %path-1%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x68276=0x25,0x73,0x3a,0x2f,%hex%
echo.
:nopath-1

if "%path-2%"=="" goto:nopath-2
echo Converting %path-2% to hex
set var=%path-2%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p hex= <temphex.txt
del /f /q temphex.txt
set hex=0x%hex:~0,-4%
echo Parchear %wadname%.dol con %path-2%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x6837d=0x25,0x73,0x3a,0x2f,%hex%
echo.
:nopath-2

if "%path-3%"=="" goto:nopath-3
echo Convertir %path-3% a hex
set var=%path-3%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p hex= <temphex.txt
del /f /q temphex.txt
set hex=0x%hex:~0,-4%
echo Parchear %wadname%.dol con %path-3%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x68481=0x25,0x73,0x3a,0x2f,%hex%
echo.
:nopath-3

if "%path-4%"=="" goto:nopath-4
echo Converting %path-4% to hex
set var=%path-4%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p hex= <temphex.txt
del /f /q temphex.txt
set hex=0x%hex:~0,-4%
echo Patching %wadname%.dol with %path-4%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x68585=0x25,0x73,0x3a,0x2f,%hex%
echo.
:nopath-4

if "%path-5%"=="" goto:nopath-5
echo Convertir %path-5% a hex
set var=%path-5%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p hex= <temphex.txt
del /f /q temphex.txt
set hex=0x%hex:~0,-4%
echo Parchear %wadname%.dol con %path-5%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x68689=0x25,0x73,0x3a,0x2f,%hex%
echo.
:nopath-5

if "%path-6%"=="" goto:nopath-6
echo Convertir %path-6% a hex
set var=%path-6%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p hex= <temphex.txt
del /f /q temphex.txt
set hex=0x%hex:~0,-4%
echo Parchear %wadname%.dol con %path-6%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x6878d=0x25,0x73,0x3a,0x2f,%hex%
echo.
:nopath-6

if "%path-7%"=="" goto:nopath-7
echo Convertir %path-7% a hex
set var=%path-7%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p hex= <temphex.txt
del /f /q temphex.txt
set hex=0x%hex:~0,-4%
echo Parchear %wadname%.dol con %path-7%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x68891=0x25,0x73,0x3a,0x2f,%hex%
echo.
:nopath-7

if "%path-8%"=="" goto:nopath-8
echo Convertir %path-8% a hex
set var=%path-8%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p hex= <temphex.txt
del /f /q temphex.txt
set hex=0x%hex:~0,-4%
echo Parchear %wadname%.dol con %path-8%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x68995=0x25,0x73,0x3a,0x2f,%hex%
echo.
:nopath-8

if "%path-9%"=="" goto:nopath-9
echo Convertir %path-9% a hex
set var=%path-9%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p hex= <temphex.txt
del /f /q temphex.txt
set hex=0x%hex:~0,-4%
echo Parchear %wadname%.dol con %path-9%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x68a99=0x25,0x73,0x3a,0x2f,%hex%
echo.
:nopath-9

if "%path-10%"=="" goto:nopath-10
echo Convertir %path-10% a hex
set var=%path-10%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p hex= <temphex.txt
del /f /q temphex.txt
set hex=0x%hex:~0,-4%
echo Parchear %wadname%.dol con %path-10%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x68b9d=0x25,0x73,0x3a,0x2f,%hex%
echo.
:nopath-10

if "%URLPATH%"=="" goto:noURLPATH
echo Convertir %URLPATH% a hex
set var=%URLPATH%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p hex= <temphex.txt
del /f /q temphex.txt
set hex=0x%hex:~0,-4%
echo Parchear %wadname%.dol con %URLPATH%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x1f3a4=%hex%
echo.
:noURLPATH


if "%FORWARDERTITLEID%"=="" goto:noFORWARDERTITLEID

::if more than 4 chars it's already hex and skip conversion
if not "%FORWARDERTITLEID:~4%"=="" (echo %FORWARDERTITLEID%, >temphex.txt) & (goto:quickskip)

echo Convertir %FORWARDERTITLEID% a hex
set var=%FORWARDERTITLEID%
call support\Ascii2hex.bat
setlocal DISABLEDELAYEDEXPANSION
:quickskip


support\sfk filter -quiet "temphex.txt" -rep _,_,0x_ -write -yes
set /p hex= <temphex.txt
del /f /q temphex.txt
set hex=0x%hex:~0,-4%
echo Parchear %wadname%.dol con %FORWARDERTITLEID%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x2ee6=%hex:~0,9%
support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x2eee=%hex:~10%

if "%hex%"=="0x48,0x41,0x41,0x41" set bigt=02
if "%hex%"=="0x48,0x41,0x42,0x41" set bigt=02
if "%hex%"=="0x48,0x41,0x43,0x41" set bigt=02
if "%hex%"=="0x48,0x41,0x46,0x41" set bigt=02
if "%hex%"=="0x48,0x41,0x46,0x45" set bigt=02
if "%hex%"=="0x48,0x41,0x46,0x4A" set bigt=02
if "%hex%"=="0x48,0x41,0x46,0x50" set bigt=02
if "%hex%"=="0x48,0x41,0x47,0x41" set bigt=02
if "%hex%"=="0x48,0x41,0x47,0x45" set bigt=02
if "%hex%"=="0x48,0x41,0x47,0x4A" set bigt=02
if "%hex%"=="0x48,0x41,0x47,0x50" set bigt=02
if "%hex%"=="0x48,0x41,0x59,0x41" set bigt=02

if /i "%bigt%" NEQ "1" (echo.) & (echo Parchear canal tipo: 000100%bigt%) & (support\hexalter.exe "%Drive%\DOLS\%wadname%.dol" 0x2eeb=0x0%bigt%)
echo.
:noFORWARDERTITLEID




if exist "%Drive%\DOLS\%wadname%.dol" (goto:there) else (goto:missing)

::----check after downloading----

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
if /i "%FORWARDERDOLorISO%" EQU "1" echo "support\sfk echo %FORWARDERNAME% DOL: [Red]Fallo">>temp\ModMii_Log.bat
if /i "%FORWARDERDOLorISO%" EQU "2" echo "support\sfk echo %FORWARDERNAME% ISO: [Red]Fallo">>temp\ModMii_Log.bat
if /i "%FORWARDERDOLorISO%" EQU "3" echo "support\sfk echo %FORWARDERNAME% DOL and ISO: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
::if exist temp\%wadname% del temp\%wadname%
goto:DOWNLOADSTART2

:there
if /i "%FORWARDERDOLorISO%" NEQ "1" goto:FORWARDERISO
echo "echo %FORWARDERNAME% DOL: Found">>temp\ModMii_Log.bat
echo.
support\sfk echo [Green]Descarga avanzada con exito
goto:NEXT






:FORWARDERISO

echo.
echo Crear ISO Forwarder...
echo.

if /i "%FORWARDERDOLorISO%" EQU "2" move /y "%Drive%\DOLS\%FORWARDERNAME%.dol" "support\disc-template\sys\main.dol">nul
if /i "%FORWARDERDOLorISO%" NEQ "2" copy /v /y "%Drive%\DOLS\%FORWARDERNAME%.dol" "support\disc-template\sys\main.dol">nul

::make WBFS folder for forwarder ISO
if not exist "%Drive%\WBFS\%FORWARDERNAME% [%discid%]" mkdir "%Drive%\WBFS\%FORWARDERNAME% [%discid%]"
if exist "%Drive%\WBFS\%FORWARDERNAME% [%discid%]\%discid%.iso" del "%Drive%\WBFS\%FORWARDERNAME% [%discid%]\%discid%.iso" >nul

Support\wit copy -s ./Support/disc-template/ -d "%Drive%/WBFS/%FORWARDERNAME% [%discid%]/%discid%.iso" --id %discid% --name "%FORWARDERNAME%" -q -C

del "support\disc-template\sys\main.dol">nul


if exist "%Drive%\WBFS\%FORWARDERNAME% [%discid%]\%discid%.iso" echo Forwarder ISO Creada

if exist "%Drive%\WBFS\%FORWARDERNAME% [%discid%]\%discid%.iso" (goto:there) else (goto:missing)

::----check after downloading----

:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
if /i "%FORWARDERDOLorISO%" EQU "2" echo "support\sfk echo %FORWARDERNAME% ISO: [Red]Missing">>temp\ModMii_Log.bat
if /i "%FORWARDERDOLorISO%" EQU "3" echo "support\sfk echo %FORWARDERNAME% DOL: FOUND - %FORWARDERNAME% ISO: [Red]Fallo">>temp\ModMii_Log.bat
goto:NEXT

:missingretry
echo.
support\sfk echo [Yellow] The file is missing, retrying download.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:there
if /i "%FORWARDERDOLorISO%" EQU "2" echo "echo %FORWARDERNAME% ISO: Found">>temp\ModMii_Log.bat
if /i "%FORWARDERDOLorISO%" EQU "3" echo "echo %FORWARDERNAME% DOL and ISO: Found">>temp\ModMii_Log.bat
echo.
support\sfk echo [Green]Descarga avanzada con exito
goto:NEXT



::----------------MetaChecker----------------
:MetaChecker
if not exist "%DRIVE%\%path1%meta.xml" (echo "support\sfk echo %name%: [Red]Fallo">>temp\ModMii_Log.bat) & (goto:NEXT)
if not exist "%DRIVE%\%path1%boot.dol" (echo "support\sfk echo %name%: [Red]Fallo">>temp\ModMii_Log.bat) & (goto:NEXT)
support\sfk filter -quiet "%DRIVE%\%path1%meta.xml" -+"/version" -rep _"*<version>"_"set currentcode="_ -rep _"</version*"__ >currentcode.bat
call currentcode.bat
del currentcode.bat>nul
echo "support\sfk echo %name%: [Red]No actualizado[def]: version encontrada %currentcode%">>temp\ModMii_Log.bat
goto:NEXT


::----------------------NEXT----------------------
:NEXT

::if using nand builder, copy files to install folder
::if /i "%MENU1%" NEQ "S" goto:skip
::if /i "%category%" EQU "themes" goto:skip
::if /i "%WADNAME%" EQU "PriiloaderHacks.zip" goto:skip
::if /i "%category%" EQU "fullextract" set movename="%filename%"

:::move
::if "%wadname:~-4%" NEQ ".wad" (set movename="%wadname%.wad") else (set movename="%wadname%")
::move /Y "%Drive%"\%movename% "%DRIVE%"\WAD\%movename% >nul
::goto:quickskip
:::skip


::-----ROOT SAVE OPTION for IOSs (does not apply to wizard)-----
if /i "%MENU1%" EQU "W" goto:miniskip
if /i "%category%" EQU "ios" goto:noskip
if /i "%category%" EQU "patchios" (goto:noskip) else (goto:miniskip)
:noskip
if "%wadname:~-4%" NEQ ".wad" (set movename="%wadname%.wad") else (set movename="%wadname%")
if /i "%ROOTSAVE%" EQU "ON" move /Y "%Drive%"\WAD\%movename% "%DRIVE%"\%movename% >nul
:miniskip


::-----------Exceptions for DL Wizard and syscheck updater----------
if /i "%MENU1%" EQU "W" goto:exception
if /i "%MENU1%" NEQ "SU" goto:skipwizardexceptions
:exception
if "%wadname:~-4%" NEQ ".wad" (set movename="%wadname%.wad") else (set movename="%wadname%")
if /i "%name%" EQU "IOS36" move /Y "%Drive%"\WAD\%movename% "%DRIVE%"\%movename% >nul
:skipwizardexceptions
::----------------------------


if /i "%category%" EQU "userdefined" goto:quickskip
if /i "%category%" EQU "FORWARDER" goto:quickskip
if /i "%AdvancedDownload%" EQU "Y" goto:customcopyandpatch
:quickskip
support\sfk filter -quiet "temp\DLgotos.txt" -le!"%CurrentDLNAME%" -write -yes

goto:DLSETTINGS3






::-----------------------------------------cUSTOM COPY AND PATCH (only for advanced downloads)--------------------------------
:customcopyandpatch

if /i "%loadorgo%" EQU "load" goto:ADVPAGE2

if "%wadname:~-4%" EQU ".wad" set wadname=%wadname:~0,-4%

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
goto:nocopy

:makeacopy
if exist "%DRIVE%"\%wadname%.wad copy /Y "%DRIVE%"\%wadname%.wad "%DRIVE%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad>nul
:nocopy

if exist "%DRIVE%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad (goto:copyisthere) else (goto:missing)

:copyisthere
echo.
cd support
if /i "%DRIVE:~1,1%" EQU ":" (set DRIVEadj=%DRIVE%) else (set DRIVEadj=..\%DRIVE%)


patchios "%DRIVEadj%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad%PATCHCODE%%slotcode%%versioncode%

cd..
echo.
echo Nota: Los parches no siempre tienen exito, leer el registro PatchIOS arriba para mas detalles
echo.
:nopatching


if exist "%DRIVE%"\WAD\%wadnameless%%patchname%%slotname%%versionname%.wad goto:there

::----check after Advanced downloading----
:missing
if /i "%attempt%" EQU "1" goto:missingretry
echo.
support\sfk echo [Magenta] Este archivo ha fallado varias veces en la descarga correctamente, Saltar descarga.
echo.
support\sfk filter -quiet "temp\DLgotos.txt" -ls!"%CurrentDLNAME%" -write -yes
echo "support\sfk echo %wadnameless%%patchname%%slotname%%versionname%.wad: [Red]Fallo">>temp\ModMii_Log.bat
goto:DLSETTINGS3

:missingretry
echo.
support\sfk echo [Yellow] El archivo no existe, volver a intentar la descarga.
echo.
SET /a retry=%retry%+1
SET /a attempt=%attempt%+1
goto:DOWNLOADSTART2

:there

if /i "%multiplefail%" EQU "Y" (support\sfk echo [Magenta] Hash base Wad se comprobara varias veces, descargas avanzadas probablemente corrupto) else (support\sfk echo [Green]Descarga avanzadas con exito)
echo.

if /i "%multiplefail%" EQU "Y" (echo "support\sfk echo %wadnameless%%patchname%%slotname%%versionname%.wad: Encontrado, pero potencialmente corruptos">>temp\ModMii_Log.bat) else (echo "echo %wadnameless%%patchname%%slotname%%versionname%.wad: Found">>temp\ModMii_Log.bat)
:miniskip


support\sfk filter -quiet "temp\DLgotos.txt" -ls!"%CurrentDLNAME%" -write -yes
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
if exist "%DRIVE%"\SNEEK\kernel.bin del "%DRIVE%"\SNEEK\kernel.bin>nul
if exist "%DRIVE%"\SNEEK\di.bin del "%DRIVE%"\SNEEK\di.bin>nul
if exist "%DRIVE%"\SNEEK\font.bin del "%DRIVE%"\SNEEK\font.bin>nul


::Special handling of bootmii\armboot.bin to avoid deleting Bootmii-SD Files
if not exist "%DRIVE%"\bootmii\armboot.bin goto:skip

::No Bootmii-SD Files
if not exist "%DRIVE%"\bootmii\ppcboot.elf del "%DRIVE%"\bootmii\armboot.bin>nul
if not exist "%DRIVE%"\bootmii\ppcboot.elf goto:skip


::RENAME Bootmii Booter Folder
set countbootmii=0
:renamebootmii
SET /a countbootmii=%countbootmii%+1
if exist "%DRIVE%"\bootmii_SDBooter%countbootmii% goto:renamebootmii
rename "%DRIVE%"\bootmii bootmii_SDBooter%countbootmii% >nul
:skip



::Don't delete anything from USB if making Sneek or Sneek+di
if /i "%SNEEKTYPE%" EQU "SD" goto:skip
if /i "%SNEEKTYPE%" EQU "S" goto:skip
if exist "%DRIVEU%"\SNEEK\kernel.bin del "%DRIVEU%"\SNEEK\kernel.bin>nul
if exist "%DRIVEU%"\SNEEK\di.bin del "%DRIVEU%"\SNEEK\di.bin>nul
if exist "%DRIVEU%"\SNEEK\font.bin del "%DRIVEU%"\SNEEK\font.bin>nul
:skip



::get sneek rev number

set sneekrev=0
set tempsneekrev=none
set usesneektemp=off

start %ModMiimin%/wait support\wget http://code.google.com/p/sneek/downloads/list
if exist list move /y list sneekrev.bat>nul

if not exist sneekrev.bat goto:skip
support\sfk filter -quiet "sneekrev.bat" -rep _"*FS-SD module r"_"set sneekrev="_ -write -yes
support\sfk filter -quiet "sneekrev.bat" -+"set sneekrev" -write -yes
support\sfk filter -quiet "sneekrev.bat" -rep _" </a>*"__ -write -yes
call sneekrev.bat
del sneekrev.bat>nul
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

start %ModMiimin%/wait support\wget http://code.google.com/p/sneeky-compiler/downloads/list
if exist list move /y list sneekYrev.bat>nul

if not exist sneekYrev.bat goto:skip

support\sfk filter -quiet "sneekYrev.bat" -spat -rep _"*fsmodule-usb\x5fr"_"set sneekYrev="_ -write -yes
support\sfk filter -quiet "sneekYrev.bat" -+"set sneekYrev" -write -yes
support\sfk filter -quiet "sneekYrev.bat" -rep _" </a>*"__ -write -yes
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








if /i "%SNEEKTYPE%" EQU "SD" echo Crear SNEEK+DI rev%sneekYREV%
if /i "%SNEEKTYPE%" EQU "UD" echo Crear UNEEK+DI rev%sneekYREV%
if /i "%SNEEKTYPE%" EQU "U" echo Crear UNEEK rev%sneekYREV%
if /i "%SNEEKTYPE%" EQU "S" echo Crear SNEEK rev%sneekYREV%


::download unrar if missing
if not exist temp\UnRAR.exe echo.
if not exist temp\UnRAR.exe echo Descargar UnRAR
if not exist temp\UnRAR.exe start %ModMiimin%/wait support\wget -t 3 "http://files.cybergamer.com.au/richard/FIFA Online 2 Full Client v200/UnRAR.exe"
if exist UnRAR.exe move /y UnRAR.exe temp\UnRAR.exe>nul


echo.
echo Descargar Sneek Installer oficial

set wadname=SNEEKInstallerv0.6c-cred.rar
set md5=bcdd0ddb85dc63c1ad7fad0007b6b606

if exist "temp\DBUPDATE%currentversion%.bat" call "temp\DBUPDATE%currentversion%.bat"

if not exist temp\SNEEKInstaller\SNEEKInstaller.exe goto:nocheck

set md5check=
support\sfk md5 -quiet -verify %md5% temp\SneekInstaller\SneekInstaller.exe

if errorlevel 1 set md5check=fail
if "%md5check%"=="" set md5check=pass
if /i "%md5check%" NEQ "fail" goto:AlreadyinTemp

:nocheck
if exist temp\SneekInstaller rd /s /q temp\SneekInstaller
mkdir temp\SneekInstaller

start %ModMiimin%/wait support\wget -t 3 http://sneek.googlecode.com/files/%wadname%
if exist %wadname% temp\unrar.exe x -y %wadname% temp\SneekInstaller
if exist %wadname% del %wadname%>nul

:AlreadyinTemp
if not exist temp\SNEEKInstaller\SNEEKInstaller.exe goto:sneekwarning


::create empty sneek installer config file
type NUL > temp\sneekinstaller\sinst.ini
echo.


echo Descarga Autoit
if exist temp\autoit3.exe goto:AlreadyinTemp
if not exist autoit-v3-sfx.exe start %ModMiimin%/wait support\wget -t 3 http://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3-sfx.exe
if exist autoit-v3-sfx.exe support\7za e -aoa autoit-v3-sfx.exe -otemp autoit3.exe -r
if exist autoit-v3-sfx.exe del autoit-v3-sfx.exe>nul
:AlreadyinTemp
echo.

echo Descargar 0000000e.app de IOS80
if exist temp\0000000e_IOS80.app goto:AlreadyinTemp

support\NusFileGrabber.exe 0e
move /Y 0000000e.app temp\0000000e_IOS80.app>nul

:AlreadyinTemp
copy /Y temp\0000000e_IOS80.app temp\0000000e.app>nul
if not exist temp\0000000e.app goto:sneekwarning
echo.

if /i "%SNEEKTYPE%" EQU "SD" goto:DL01
if /i "%SNEEKTYPE%" EQU "UD" goto:DL01
goto:skipDL01
:DL01
echo Descargar 00000001.app de IOS60
if exist temp\00000001_IOS60.app goto:AlreadyinTemp
support\NusFileGrabber.exe 01_60
move /Y 00000001.app temp\00000001_IOS60.app>nul

:AlreadyinTemp
copy /Y temp\00000001_IOS60.app temp\00000001.app>nul
if not exist temp\00000001.app goto:sneekwarning
echo.


::FONT.BIN
if /i "%SNKFONT%" EQU "B" echo Descargar font.bin Negro (esto se puede cambiar de Blanco en las Opciones)
if /i "%SNKFONT%" EQU "W" echo Descargar font.bin Blanco(esto se puede cambiar de Negro en las Opciones)

if /i "%SNKFONT%" EQU "B" set fonturl=http://nusad.googlecode.com/files/fontb.bin
if /i "%SNKFONT%" EQU "W" set fonturl=http://nusad.googlecode.com/files/fontw.bin

if not exist temp\font%SNKFONT%.bin start %ModMiimin%/wait support\wget -t 3 %fonturl%

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
echo Descargar dimodule.elf

if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait support\wget -t 3 http://sneeky-compiler.googlecode.com/files/dimodule.elf


if exist dimodule.elf move /Y dimodule.elf temp\dimodule.elf>nul

if not exist temp\dimodule.elf start %ModMiimin%/wait support\wget -t 3 http://sneeky-compiler.googlecode.com/files/dimodule.elf

if exist dimodule.elf move /Y dimodule.elf temp\dimodule.elf

if not exist temp\dimodule.elf goto:sneekwarning
echo.
:skipDL01



echo Descargar fsmodule-usb.elf
if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait support\wget -t 3 http://sneeky-compiler.googlecode.com/files/fsmodule-usb.elf

if exist fsmodule-usb.elf move /Y fsmodule-usb.elf temp\fsmodule-usb.elf>nul

if not exist temp\fsmodule-usb.elf start %ModMiimin%/wait support\wget -t 3 http://sneeky-compiler.googlecode.com/files/fsmodule-usb.elf

if exist fsmodule-usb.elf move /Y fsmodule-usb.elf temp\fsmodule-usb.elf>nul

if not exist temp\fsmodule-usb.elf goto:sneekwarning
echo.



echo Downloading fsmodule-sd.elf
if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait support\wget -t 3 http://sneeky-compiler.googlecode.com/files/fsmodule-sd.elf
if exist fsmodule-sd.elf move /Y fsmodule-sd.elf temp\fsmodule-sd.elf>nul

if not exist temp\fsmodule-sd.elf start %ModMiimin%/wait support\wget -t 3 http://sneeky-compiler.googlecode.com/files/fsmodule-sd.elf
if exist fsmodule-sd.elf move /Y fsmodule-sd.elf temp\fsmodule-sd.elf>nul

if not exist temp\fsmodule-sd.elf goto:sneekwarning
echo.


if /i "%SNEEKTYPE:~0,1%" EQU "U" goto:SSDoff
if /i "%SSD%" EQU "on" goto:SSDon

:SSDoff
echo Downloading esmodule.elf
if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait support\wget -t 3 http://sneeky-compiler.googlecode.com/files/esmodule.elf
if exist esmodule.elf move /Y esmodule.elf temp\esmodule-sdoff.elf>nul
if exist temp\esmodule-sdoff.elf copy /Y temp\esmodule-sdoff.elf temp\esmodule.elf>nul

if not exist temp\esmodule-sdoff.elf start %ModMiimin%/wait support\wget -t 3 http://sneeky-compiler.googlecode.com/files/esmodule.elf
if exist esmodule.elf move /Y esmodule.elf temp\esmodule-sdoff.elf>nul
if exist temp\esmodule-sdoff.elf copy /Y temp\esmodule-sdoff.elf temp\esmodule.elf>nul
goto:skipSSDon

:SSDon
echo Downloading esmodule.elf (with SD Access On)
if /i "%usesneekYtemp%" EQU "off" start %ModMiimin%/wait support\wget -t 3 http://sneeky-compiler.googlecode.com/files/esmodule-sdon.elf
if exist esmodule-sdon.elf move /Y esmodule-sdon.elf temp\esmodule-sdon.elf>nul
if exist temp\esmodule-sdon.elf copy /Y temp\esmodule-sdon.elf temp\esmodule.elf>nul

if not exist temp\esmodule-sdon.elf start %ModMiimin%/wait support\wget -t 3 http://sneeky-compiler.googlecode.com/files/esmodule-sdon.elf
if exist esmodule-sdon.elf move /Y esmodule-sdon.elf temp\esmodule-sdon.elf>nul
if exist temp\esmodule-sdon.elf copy /Y temp\esmodule-sdon.elf temp\esmodule.elf>nul
:skipSSDon

if not exist temp\esmodule.elf goto:sneekwarning
echo.


echo Descargar armboot.bin
if /i "%usesneektemp%" EQU "off" start %ModMiimin%/wait support\wget -t 3 http://sneek.googlecode.com/files/armboot.bin
if exist armboot.bin move /Y armboot.bin temp\armboot.bin>nul

if not exist temp\armboot.bin start %ModMiimin%/wait support\wget -t 3 http://sneek.googlecode.com/files/armboot.bin
if exist armboot.bin move /Y armboot.bin temp\armboot.bin>nul

if not exist temp\armboot.bin goto:sneekwarning
echo.


echo Creando...
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

set DRIVEabsolute=%ModMiipath%\%DRIVE%
if /i "%DRIVE:~1,1%" EQU ":" set DRIVEabsolute=%DRIVE%

echo ControlSetText("SNEEK Installer","","[CLASS:Edit; INSTANCE:1]","%DRIVEabsolute%")>>custom.au3

::how to only change field if empty
::echo $a = ControlGetText ("SNEEK Installer","","[CLASS:Edit; INSTANCE:1]")>>custom.au3
::echo if $a = "" Then ControlSetText("SNEEK Installer","","[CLASS:Edit; INSTANCE:1]","%DRIVEabsolute%")>>custom.au3

if /i "%SNEEKTYPE%" EQU "S" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" goto:skip

set DRIVEUabsolute=%ModMiipath%\%DRIVEU%
if /i "%DRIVEU:~1,1%" EQU ":" set DRIVEUabsolute=%DRIVEU%

echo ControlSetText("SNEEK Installer","","[CLASS:Edit; INSTANCE:4]","%DRIVEUabsolute%")>>custom.au3
:skip

echo ControlClick ("SNEEK Installer","SNEEK setup","install SNEEK")>>custom.au3




cd temp\SneekInstaller
start /I %ModMiimin%SneekInstaller.exe
cd..
cd..

echo start /wait temp\AutoIt3.exe custom.au3>run.bat
call run.bat
del run.bat>nul

@ping 127.0.0.1 -n 3 -w 1000> nul

taskkill /im SneekInstaller.exe /f >nul
del custom.au3>nul

if /i "%SNKS2U%" NEQ "Y" goto:noswitch2uneek
if exist "%DRIVE%\bootmiiuneek" rd /s /q "%DRIVE%\bootmiiuneek"
rename "%DRIVE%\bootmii" "bootmiiuneek"
:noswitch2uneek


::save rev information
if /i "%sneekverbose%" EQU "on" goto:sneekverbose

if /i "%SNEEKTYPE%" EQU "SD" echo SNEEK+DI rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "S" echo SNEEK rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SSD%" EQU "off" goto:miniskip
if /i "%SNEEKTYPE%" EQU "SD" echo SNEEK+DI (con acceso a la SD) rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "S" echo SNEEK (con acceso a la SD)rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
:miniskip

if /i "%SNEEKTYPE%" EQU "UD" echo UNEEK+DI rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "UD" echo UNEEK+DI rev%sneekYREV%>"%DRIVEU%"\sneek\rev.txt

if /i "%SNEEKTYPE%" EQU "U" echo UNEEK rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "U" echo UNEEK rev%sneekYREV%>"%DRIVEU%"\sneek\rev.txt
goto:skipsneekverbose

:sneekverbose
if /i "%SNEEKTYPE%" EQU "SD" echo SNEEK+DI (detallado) rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "S" echo SNEEK (detallado) rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SSD%" EQU "off" goto:miniskip
if /i "%SNEEKTYPE%" EQU "SD" echo SNEEK+DI (detallado y el acceso a la SD) rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "S" echo SNEEK (detallado y el acceso a la SD) rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
:miniskip

if /i "%SNEEKTYPE%" EQU "UD" echo UNEEK+DI (detallado) rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "UD" echo UNEEK+DI (detallado) rev%sneekYREV%>"%DRIVEU%"\sneek\rev.txt

if /i "%SNEEKTYPE%" EQU "U" echo UNEEK (detallado) rev%sneekYREV%>"%DRIVE%"\sneek\rev.txt
if /i "%SNEEKTYPE%" EQU "U" echo UNEEK (detallado) rev%sneekYREV%>"%DRIVEU%"\sneek\rev.txt
:skipsneekverbose




if /i "%SNEEKSELECT%" EQU "3" goto:SNKNANDBUILDER
goto:finishsneekinstall3




:sneekwarning

::---------------CMD LINE MODE-------------
if /i "%cmdlinemode%" NEQ "Y" goto:notcmdfinish
if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul
echo ADVERTENCIA: Algunos archivos necesarios para la instalacion de SNEEK faltan. >temp\ModMii_CMD_LINE_Log_Errors.txt
echo Abortar la instalacion Sneek, compruebe la conexion a Internet >>temp\ModMii_CMD_LINE_Log_Errors.txt
echo A continuacion, repita la instalacion Sneek para intentarlo de nuevo. >>temp\ModMii_CMD_LINE_Log_Errors.txt
start notepad "temp\ModMii_CMD_LINE_Log_Errors.txt"
exit
:notcmdfinish

echo.
support\sfk echo -spat \x20 [Yellow] ADVERTENCIA: Algunos archivos necesarios para la instalacion de SNEEK faltan.
support\sfk echo -spat \x20 \x20 \x20 \x20 [Yellow] Abortar la instalacion Sneek, compruebe la conexion a Internet
support\sfk echo -spat \x20 \x20 \x20 \x20 [Yellow] A continuacion, repita la instalacion Sneek para intentarlo de nuevo.
echo.


echo Pulse cualquier tecla para volver al menu principal.
pause>nul
goto:MENU





::------------------------wad2nand-install wads from temp\wad to emu nand--------------------
:wad2nand

if exist support\common-key.bin goto:commonkeyalreadythere

::silently build common-key.bin
echo EBE42A225E8593E448D9C5457381AAF7>support\common-key.txt
support\sfk filter support\common-key.txt +hextobin support\common-key.bin>nul
del support\common-key.txt>nul
:commonkeyalreadythere

set nandpathadj=..\%nandpath%
if /i "%nandpath:~1,1%" EQU ":" set nandpathadj=%nandpath%

set line1="<?xml version='1.0' standalone='yes'?>"
set line2="<ShowMiiWads>"
set line3="  <Settings>"
set line4="    <Version>1.5</Version>"
set line5="    <Language>English</Language>"
set line6="    <LangFile />"
set line7="    <AutoSize>true</AutoSize>"
set line8="    <NandPath>%nandpathadj%</NandPath>"
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
set line26="    <MRU0>..\temp\WAD</MRU0>"
if "%addwadfolder%"=="" set line27="    <MRU1 />"
if not "%addwadfolder%"=="" set line27="    <MRU1>%addwadfolder%</MRU1>"
set line28="    <MRU2 />"
set line29="    <MRU3 />"
set line30="    <MRU4 />"

if "%addwadfolder%"=="" set line31="    <Foldercount>1</Foldercount>"
if not "%addwadfolder%"=="" set line31="    <Foldercount>2</Foldercount>"
set line32="    <Folder0>..\temp\WAD</Folder0>"
if "%addwadfolder%"=="" set line33=
if not "%addwadfolder%"=="" set line33="    <Folder1>%addwadfolder%</Folder1>"
set line34="  </Folders>"
set line35="</ShowMiiWads>"


echo %line1%>support\ShowMiiWads.cfg
echo %line2%>>support\ShowMiiWads.cfg
echo %line3%>>support\ShowMiiWads.cfg
echo %line4%>>support\ShowMiiWads.cfg
echo %line5%>>support\ShowMiiWads.cfg
echo %line6%>>support\ShowMiiWads.cfg
echo %line7%>>support\ShowMiiWads.cfg
echo %line8%>>support\ShowMiiWads.cfg
echo %line9%>>support\ShowMiiWads.cfg
echo %line10%>>support\ShowMiiWads.cfg
echo %line12%>>support\ShowMiiWads.cfg
echo %line13%>>support\ShowMiiWads.cfg
echo %line14%>>support\ShowMiiWads.cfg
echo %line15%>>support\ShowMiiWads.cfg
echo %line16%>>support\ShowMiiWads.cfg
echo %line17%>>support\ShowMiiWads.cfg
echo %line18%>>support\ShowMiiWads.cfg
echo %line19%>>support\ShowMiiWads.cfg
echo %line20%>>support\ShowMiiWads.cfg
echo %line21%>>support\ShowMiiWads.cfg
echo %line22%>>support\ShowMiiWads.cfg
echo %line23%>>support\ShowMiiWads.cfg
echo %line24%>>support\ShowMiiWads.cfg
echo %line25%>>support\ShowMiiWads.cfg
echo %line26%>>support\ShowMiiWads.cfg
echo %line27%>>support\ShowMiiWads.cfg
echo %line28%>>support\ShowMiiWads.cfg
echo %line29%>>support\ShowMiiWads.cfg
echo %line30%>>support\ShowMiiWads.cfg
echo %line31%>>support\ShowMiiWads.cfg
echo %line32%>>support\ShowMiiWads.cfg
if not "%addwadfolder%"=="" echo %line33%>>support\ShowMiiWads.cfg
echo %line34%>>support\ShowMiiWads.cfg
echo %line35%>>support\ShowMiiWads.cfg

support\sfk filter -quiet "support\ShowMiiWads.cfg" -rep _"""__ -write -yes
support\sfk filter -quiet "support\ShowMiiWads.cfg" -rep _"'"_"""_ -write -yes


cls
echo Cargando ShowMiiWads
echo.
echo instalando wads de: temp\WAD\
if not "%addwadfolder%"=="" echo             y de: %addwadfolder%
if not "%addwadfolder%"=="" echo.
echo     a nand emulada: %nandpath%\
echo.
echo Por favor, espera el trabajo de ShowMiiWads para terminar haciendolo...
cd support
SMW-Mod.exe
cd..

del support\ShowMiiWads.cfg>nul

::---delete non-temp files---
if exist temp\WAD\JoyFlowHNv11-HBJF.wad del temp\WAD\JoyFlowHNv11-HBJF.wad>nul
if exist temp\WAD\switch2uneek(emulators)-4EMUNand-v11-S2RL.wad del temp\WAD\switch2uneek(emulators)-4EMUNand-v11-S2RL.wad>nul
if exist temp\WAD\cIOS249-v14.wad del temp\WAD\cIOS249-v14.wad>nul
if exist temp\WAD\cBC-NMMv0.2a.wad del temp\WAD\cBC-NMMv0.2a.wad>nul
if exist temp\WAD\cBC-DML.wad del temp\WAD\cBC-DML.wad>nul


move temp\WAD\*.wad temp\>nul

::Build setting.txt
if /i "%REGION%" EQU "U" set SNKSERIAL=LU521175683
if /i "%REGION%" EQU "E" set SNKSERIAL=LEH133789940
if /i "%REGION%" EQU "J" set SNKSERIAL=LJM101175683
if /i "%REGION%" EQU "K" set SNKSERIAL=LJM101175683

support\settings %SNKSERIAL% >nul

if /i "%REGION%" EQU "K" move /y KORsetting.txt "%nandpath%"\title\00000001\00000002\data\setting.txt >nul
if /i "%REGION%" EQU "U" move /y USAsetting.txt "%nandpath%"\title\00000001\00000002\data\setting.txt >nul
if /i "%REGION%" EQU "E" move /y EURsetting.txt "%nandpath%"\title\00000001\00000002\data\setting.txt >nul
if /i "%REGION%" EQU "J" move /y JPNsetting.txt "%nandpath%"\title\00000001\00000002\data\setting.txt >nul

if /i "%REGION%" NEQ "K" del KORsetting.txt>nul
if /i "%REGION%" NEQ "E" del EURsetting.txt>nul
if /i "%REGION%" NEQ "J" del JPNsetting.txt>nul
if /i "%REGION%" NEQ "U" del USAsetting.txt>nul

:skip


if /i "%ThemeSelection%" EQU "N" goto:quickskip
echo.
echo Copiando tema personalizado

if /i "%ThemeSelection%" EQU "R" set themecolour=Red
if /i "%ThemeSelection%" EQU "G" set themecolour=Green
if /i "%ThemeSelection%" EQU "BL" set themecolour=Blue
if /i "%ThemeSelection%" EQU "O" set themecolour=Orange
move /y "temp\ModThemes\DarkWii_%themecolour%_%effect%_%SNKVERSION%%REGION%.csm" "%nandpath%"\title\00000001\00000002\content\%SMTHEMEAPP%.app>nul
:quickskip

if exist temp\ModThemes rd /s /q temp\ModThemes
if exist temp\WAD rd /s /q temp\WAD




::---------building cdf.vff----------
echo.
echo Crear cdb.vff para acelerar el tiempo necesario para poner en marcha s\uneek por primera vez
cd support
writecbd.exe
cd..
if exist support\cdb.vff move /y support\cdb.vff "%nandpath%"\title\00000001\00000002\data\cdb.vff>nul



if /i "%SNKPRI%" NEQ "Y" goto:skipSNKpri
echo.
echo Descargando Priiloader-v0.4.app
echo.
if not exist temp\Priiloader-v0.4.app start %ModMiimin%/wait support\wget -t 3 http://nusad.googlecode.com/files/Priiloader-v0.4.app
if exist Priiloader-v0.4.app move /Y Priiloader-v0.4.app temp\Priiloader-v0.4.app>nul

if not exist temp\Priiloader-v0.4.app (echo No se puede descargar Priiloader-v00.4.App, NAND emulado no tiene instalado priiloader) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:finishsneekinstall)


move /y "%nandpath%\title\00000001\00000002\content\%SMAPP%.app" "%nandpath%\title\00000001\00000002\content\1%SMAPP:~1%.app" >nul

copy /Y temp\Priiloader-v0.4.app "%nandpath%"\title\00000001\00000002\content\%SMAPP%.app>nul

if not exist "%nandpath%"\title\00000001\00000002\data mkdir "%nandpath%"\title\00000001\00000002\data >nul
move /Y temp\hacks.ini "%nandpath%"\title\00000001\00000002\data\hacks.ini >nul


if /i "%SNKJOY%" NEQ "Y" goto:skipSNKpri

echo Agregando dol JoyFlow reenviador de archivo instalado de Priiloader.
echo.

if exist temp\JoyFlow(emulators)-v11.dol move /y temp\JoyFlow(emulators)-v11.dol "%nandpath%"\title\00000001\00000002\data\main.bin>nul

:skipSNKpri

if exist temp\JoyFlow(emulators)-v11.dol del temp\JoyFlow(emulators)-v11.dol>nul

copy /y temp\ModMii_Log.bat temp\ModMii_Log_SNK.bat>nul

goto:finishsneekinstall




::----------------------------------SNEEK INSTALL FINISH------------------------------------
:finishsneekinstall


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

::check for errors - do not do if ONLY installing sneek
if /i "%SNEEKSELECT%" EQU "1" goto:nocheck

if exist temp\ModMii_Log_SNK.bat del temp\ModMii_Log_SNK.bat>nul

support\sfk filter -quiet "temp\ModMii_Log.bat" -rep _"""__ -write -yes

::count # of problematic downloads
support\sfk filter -quiet "temp\ModMii_Log.bat" -+"[Red]" -write -yes
set problematicDLs=0

setlocal ENABLEDELAYEDEXPANSION
for /f "delims=" %%i in (temp\ModMii_Log.bat) do set /a problematicDLs=!problematicDLs!+1
setlocal DISABLEDELAYEDEXPANSION

if /i "%problematicDLs%" EQU "0" (set snksuccess= Successfully) else (set snksuccess=)

if /i "%problematicDLs%" EQU "0" (set snkfailure=) else (set snkfailure= but with errors)

::resize window
SET /a LINES=%problematicDLs%+54

if %LINES% LEQ 54 set lines=54
mode con cols=85 lines=%LINES%


::---------------CMD LINE MODE-------------
if /i "%cmdlinemode%" NEQ "Y" goto:notcmdfinish
if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul
if /i "%problematicDLs%" EQU "0" exit
support\sfk filter -quiet "temp\ModMii_Log.bat" -rep _"support\sfk echo "__ -rep _"echo "__ -rep _"[Red]"__ -write -yes
move /y "temp\ModMii_Log.bat" "temp\ModMii_CMD_LINE_Log_Errors.txt">nul
start notepad "temp\ModMii_CMD_LINE_Log_Errors.txt"
exit
:notcmdfinish

:nocheck

if /i "%cmdlinemode%" EQU "Y" exit

set MENUREAL=

cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.

::both sneek install and nand build
if /i "%SNEEKSELECT%" NEQ "3" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" echo    Tiene%snksuccess% instalado SNEEK+DI rev%sneekYREV% y crear una %SNKVERSION%%REGION% Nand Emulada%snkfailure%
if /i "%SNEEKTYPE%" EQU "UD" echo    Tiene%snksuccess% instalado UNEEK+DI rev%sneekYREV% y crear una %SNKVERSION%%REGION% Nand Emulada%snkfailure%
if /i "%SNEEKTYPE%" EQU "S" echo    Tiene%snksuccess% instalado SNEEK rev%sneekYREV% y crear una %SNKVERSION%%REGION% Nand Emulada%snkfailure%
if /i "%SNEEKTYPE%" EQU "U" echo    Tiene%snksuccess% instalado UNEEK rev%sneekYREV% y crear una %SNKVERSION%%REGION% Nand Emulada%snkfailure%
:skip

::only install sneek
if /i "%SNEEKSELECT%" NEQ "1" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" echo    Usted ha instalado satisfactoriamente SNEEK+DI rev%sneekYREV%
if /i "%SNEEKTYPE%" EQU "UD" echo    Usted ha instalado satisfactoriamente UNEEK+DI rev%sneekYREV%
if /i "%SNEEKTYPE%" EQU "U" echo    Usted ha instalado satisfactoriamente UNEEK rev%sneekYREV%
if /i "%SNEEKTYPE%" EQU "S" echo    Usted ha instalado satisfactoriamente SNEEK rev%sneekYREV%
:skip

::only build nand
if /i "%SNEEKSELECT%" NEQ "2" goto:skip
if /i "%SNEEKTYPE%" EQU "SD" echo    Tiene%snksuccess% crear una %SNKVERSION%%REGION% Nand Emulada%snkfailure%
if /i "%SNEEKTYPE%" EQU "UD" echo    Tiene%snksuccess% crear una %SNKVERSION%%REGION% Nand Emulada%snkfailure%
if /i "%SNEEKTYPE%" EQU "U" echo    Tiene%snksuccess% crear una %SNKVERSION%%REGION% Nand Emulada%snkfailure%
if /i "%SNEEKTYPE%" EQU "S" echo    Tiene%snksuccess% crear una %SNKVERSION%%REGION% Nand Emulada%snkfailure%
:skip

::list problematic Download
if /i "%SNEEKSELECT%" EQU "1" goto:noproblems
if /i "%problematicDLs%" NEQ "0" echo.
if /i "%problematicDLs%" NEQ "0" echo El siguiente archivo(s) no ha podido descargar correctamente:
if /i "%problematicDLs%" NEQ "0" call temp\ModMii_Log.bat
:noproblems


echo.
if /i "%SNEEKSELECT%" NEQ "2" goto:skip
if /i "%SNEEKTYPE%" EQU "U" goto:skipsdmsg
if /i "%SNEEKTYPE%" EQU "UD" goto:skipsdmsg
:skip
if /i "%Drive%" EQU "COPY_TO_SD" echo    * Copiar el contenido de la carpeta COPY_TO_SD a la tarjeta SD
if /i "%Drive%" NEQ "COPY_TO_SD" echo    * Asegurar que %DRIVE% es la letra de unidad de la tarjeta SD
if /i "%Drive%" NEQ "COPY_TO_SD" echo    * Si %DRIVE% no es tu tarjeta SD con la letra de la unidad,
if /i "%Drive%" NEQ "COPY_TO_SD" echo      copie el contenido de el %DRIVE% carpeta en su tarjeta SD
:skipsdmsg

if /i "%SNEEKTYPE%" EQU "UD" goto:UDRIVEMSG
if /i "%SNEEKTYPE%" NEQ "U" goto:skipUDRIVEMSG
:UDRIVEMSG
if /i "%DRIVEU%" EQU "COPY_TO_USB" echo    * Copiar el contenido de la carpeta COPY_TO_USB en el disco duro FAT32
if /i "%DRIVEU%" NEQ "COPY_TO_USB" echo    * Asegurar que %DRIVEU% es tu USB HDD con la letra de la unidad
if /i "%DRIVEU%" NEQ "COPY_TO_USB" echo    * Si %DRIVEU% no es tu USB HDD con la letra de la unidad copiar
if /i "%DRIVEU%" NEQ "COPY_TO_USB" echo      el contenido de el %DRIVEU% carpeta en su disco duro USB
:skipUDRIVEMSG

if /i "%SNEEKSELECT%" EQU "2" goto:skip
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 [Red] ADVERTENCIA: SNEEK no es directamente compatible con ModMii.
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 [Red] Cualquier problema que tenga con SNEEK que no sea de resultado directo
support\sfk echo -spat \x20 \x20 \x20 \x20 [Red] de ModMii debe informarse aqui: http://code.google.com/p/sneek/
echo.
support\sfk echo -spat \x20 \x20 \x20 \x20 [Red] Este es tambien un gran lugar para aprender mas acerca de SNEEK en general.
support\sfk echo -spat \x20 \x20 \x20 \x20 [Red] Otro gran recurso es la guia: tinyurl.com/SNEEK-DI
:skip

echo.
echo    ALGUNOS CONSEJOS SNEEK RAPIDOS:
echo.
echo        * Si usted tiene problemas con S/UNEEK o canales Poderosos, copia cert.sys
echo          de un volcado nand original a su emulacion nand en la carpeta de sistema.
echo.
echo        * Al poner en marcha cualquier tipo de SNEEK, por primera vez,
echo          podria llevar un tiempo para cargar el menu del sistema,
echo          pero sera mucho mas rapido la segunda vez.
echo.

if /i "%SNKS2U%" EQU "Y" goto:quickskip
echo        * Si usted tiene BootMii como boot2, Sneek se iniciara de inmediato
echo          cuando la Wii se enciende. Para evitar que esto ocurra, cambiar el nombre
echo          la carpeta BootMii en la tarjeta SD a otra cosa.
echo.
echo        * Si usted tiene BootMii como IOS, tendra que poner en marcha BootMii como IOS
echo          para iniciar Sneek. Puede hacerlo manualmente desde el Homebrew Channel (HBC),
echo          o automaticamente via Priiloader Configurandolo con inicio automatico.
echo.
echo.
:quickskip

if /i "%SNKS2U%" NEQ "Y" goto:quickskip
echo        * Acceder Uneek/Uneek+DI con el lanzamiento de switch2uneek con
echo          Homebrew Channel. Alternativamente, puede utilizar para instalar el MMM
echo          switch2uneek forwarder channel que ModMii guarda en la tarjeta SD.
echo.
:quickskip

echo        * Cuando se utiliza SNEEK+DI o UNEEK+DI, se puede acceder al Juego/DI Menu
echo          pulsando la tecla "1" en el WiiMote. Para acceder a otras opciones
echo          (incluidas las opciones Region), debe pulsar "+" desde el menu de DI.
echo.
echo        * Para agregar juegos al menu del juego/DI, se puede utilizar para extraer ModMii
echo          Juegos de Wii a la unidad FAT32 USB duro externo.
echo.
echo        * ShowMiiWads puede ser usado para descifrar tu verdadero Wii BootMii volcado
echo          NAND (nand.bin) para su uso como NAND emulacion, y se puede agregar a medida
echo          canales/WADS a una NAND emulada.
echo          ShowMiiWads esta disponible aqui: http://code.google.com/p/showmiiwads/
echo.
echo        * Para mas informacion SNEEK mas, como el formato de un disco duro USB de SNEEK,
echo          o instalar el HBC a una NAND emulada, visite: tinyurl.com/SNEEK-DI
echo.




::---------------CMD LINE MODE-------------
if /i "%cmdlinemode%" NEQ "Y" goto:notcmdfinish
if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul
echo Despues de revisar los consejos - Pulse cualquier tecla para salir
pause>nul
exit
:notcmdfinish




echo Pulse cualquier tecla para volver al men� principal.
pause>nul

goto:MENU





::.........................................FINISH / Verify..................................
:FINISH

if exist temp\DLnames.txt del temp\DLnames.txt>nul
if exist temp\DLgotos.txt del temp\DLgotos.txt>nul

if /i "%MENU1%" EQU "S" goto:wad2nand
if /i "%MENUREAL%" EQU "S" goto:finishsneekinstall3




::force non-donators to view credits (but not in cmd line mode)
if exist support\skipscam.txt goto:finish2
if exist support\ipromisetodonate.txt goto:finish2
if /i "%cmdlinemode%" EQU "Y" goto:FINISH2
goto:credit1
:FINISH2

setlocal ENABLEDELAYEDEXPANSION
set loglines=0

if /i "%DB%" EQU "C" goto:countcustom
if not exist temp\ModMii_Log.bat goto:donecounting
support\sfk filter -quiet "temp\ModMii_Log.bat" -rep _"""__ -write -yes
for /f "delims=" %%i in (temp\ModMii_Log.bat) do set /a loglines=!loglines!+1

::count # of problematic downloads
copy /y "temp\ModMii_Log.bat" "temp\ModMii_Log_Red.bat">nul
support\sfk filter -quiet "temp\ModMii_Log_Red.bat" -+"[Red]" -write -yes
set problematicDLs=0
for /f "delims=" %%i in (temp\ModMii_Log_Red.bat) do set /a problematicDLs=!problematicDLs!+1
del "temp\ModMii_Log_Red.bat">nul
goto:donecounting

:countcustom
if exist Custom.md5 for /f "delims=" %%i in (Custom.md5) do set /a loglines=!loglines!+1

:donecounting

::resize window
SET /a LINES=%loglines%+25
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


Set FINISH=
cls

echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
if /i "%DB%" EQU "N" echo                                     DESCARGAR REGISTRO
if /i "%DB%" EQU "C" echo                              DESCARGAR REGISTRO - registro personalizado
echo.

If not exist Custom.md5 goto:SkipCustomCheck
if /i "%DB%" NEQ "C" goto:SkipCustomCheck
support\fvc -x -v Custom.md5
:SkipCustomCheck

if /i "%DB%" NEQ "N" goto:miniskip
if exist temp\ModMii_Log.bat (call temp\ModMii_Log.bat)
:miniskip

if /i "%DB%" EQU "C" goto:skipcopytoSDmsg

echo.
if /i "%problematicDLs%" EQU "0" (support\sfk echo -spat \x20 \x20[Green]* %DLTOTAL% file\x28s\x29 descargado con exito) & (goto:noproblems)

:problems
support\sfk echo -spat \x20 \x20[Red]* %problematicDLs% of %DLTOTAL% file\x28s\x29 no son validos, falta o no se actualizaron correctamente
echo.
echo    * Asegurese de tener espacio libre en: %DrivesNeedingFreeSpace%
echo      Compruebe la conexion a Internet (pruebe a desactivar el firewall/servidor proxy si es aplicable)
echo      Se recomienda seleccionar "R" para repetir la descarga.
goto:skipcopytoSDmsg

:noproblems
if /i "%USBCONFIG%" EQU "USB" goto:skipcopytoSDmsg
echo.
if /i "%Drive%" EQU "COPY_TO_SD" echo    * Copiar el contenido de la carpeta COPY_TO_SD a su tarjeta SD
if /i "%Drive%" NEQ "COPY_TO_SD" echo    * Asegurar que %DRIVE% es la letra de unidad de la tarjeta SD
if /i "%Drive%" NEQ "COPY_TO_SD" echo    * Si %DRIVE% no es tu tarjeta SD con la letra de la unidad,
if /i "%Drive%" NEQ "COPY_TO_SD" echo      copiar el contenido del %DRIVE% carpeta en su tarjeta SD
:skipcopytoSDmsg


::Warning message for 2x Bannerbomb DLs
if /i "%BB1%" NEQ "*" goto:no2xBB
if /i "%BB2%" NEQ "*" goto:no2xBB
echo.
echo    Nota: Bannerbomb v1 guarda en carpeta "private" y Bannerbomb v2 guardado en
echo          carpeta "private2". Para utilizar Bannerbomb v2 en vez de cambiar el
echo          nombre v1 en carpeta privada.
:no2xBB


echo.
echo.


::---------------CMD LINE MODE-------------
if /i "%cmdlinemode%" NEQ "Y" goto:notcmdfinish
if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul

if /i "%problematicDLs%" EQU "0" echo * %DLTOTAL% archivo(s) descargado con �xito>>temp\ModMii_Log.bat
if /i "%problematicDLs%" EQU "0" goto:noproblemscmd
echo * %problematicDLs% of %DLTOTAL% archivo(s) no son validos, falta o no se actualizaron correctamente>>temp\ModMii_Log.bat
:noproblemscmd

support\sfk filter -quiet "temp\ModMii_Log.bat" -rep _"support\sfk echo "__ -rep _"echo "__ -rep _"[Red]"__ -write -yes
move /y "temp\ModMii_Log.bat" "temp\ModMii_CMD_LINE_Log.txt">nul
if /i "%problematicDLs%" NEQ "0" start notepad "temp\ModMii_CMD_LINE_Log.txt"
exit
:notcmdfinish



if exist "%DRIVE%" echo          O = Abrir ubicacion de archivo (%Drive%)

if /i "%DB%" NEQ "C" goto:miniskip
if exist custom.md5 echo          L = Registro: Ver custom.md5 para ver que archivos fueron revisados
:miniskip

if /i "%DLTOTAL%" EQU "0" goto:dltotaliszero
echo.
echo          R = Repetir descarga
echo          S = Guardar Cola de descargas
:dltotaliszero

echo.

if /i "%DB%" EQU "N" goto:miniskip
if exist temp\ModMii_Log.bat echo          N = Verifique Descargas NUEVAS solo
:miniskip
if /i "%DB%" EQU "C" goto:miniskip
if exist Custom.md5 echo          C = Verificar los archivos con Custom.md5
:miniskip

if exist CUSTOM_COPY_TO_SD goto:tinyskip
if exist CUSTOM_COPY_TO_USB (goto:tinyskip) else (goto:nocustoms)
:tinyskip
echo.
if exist CUSTOM_COPY_TO_SD echo         CC = Copiar el contenido de CUSTOM_COPY_TO_SD a %Drive%
if exist CUSTOM_COPY_TO_USB echo        CCU = Copiar el contenido de CUSTOM_COPY_TO_USB a %DriveU%
:nocustoms


echo.
echo          M = Menu Principal
echo          E = Salir
echo.
set /p FINISH=     Escriba la seleccion aqui: 



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

if /i "%DB%" NEQ "C" goto:nolog
if not exist "custom.md5" goto:nolog
if /i "%FINISH%" EQU "L" start notepad "custom.md5"
if /i "%FINISH%" EQU "L" goto:Finish
:nolog

if not exist Custom.md5 goto:skip
if /i "%FINISH%" EQU "C" SET DB=C
if /i "%FINISH%" EQU "C" goto:Finish
:skip

if not exist temp\ModMii_Log.bat goto:skip
if /i "%FINISH%" EQU "N" SET DB=N
if /i "%FINISH%" EQU "N" goto:FINISH
:skip

if /i "%DLTOTAL%" EQU "0" goto:dltotaliszero2


if /i "%FINISH%" EQU "R" copy /y "temp\DLgotos-copy.txt" "temp\DLgotos.txt">nul
if /i "%FINISH%" EQU "R" mode con cols=85 lines=54
if /i "%FINISH%" EQU "R" goto:DLSettings2
if /i "%FINISH%" EQU "S" goto:SaveDownloadQueue
:dltotaliszero2


echo Ha introducido una clave incorrecta
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:FINISH2

::..........................DOWNLOAD SETTINGS................................
:DLSETTINGS
cls

set REALDRIVE=%DRIVE%


if /i "%MENU1%" EQU "W" goto:guide
if /i "%MENU1%" EQU "H" goto:HMguide
if /i "%MENU1%" EQU "U" goto:USBguide
if /i "%MENU1%" EQU "SU" goto:guide
:DLSETTINGS2
cls
if exist temp\ModMii_Log_SNK.bat goto:donotdeletelog
if exist temp\ModMii_Log.bat del temp\ModMii_Log.bat>nul
:donotdeletelog
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

if not exist temp\DLgotos.txt goto:FINISH
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
set name=System Menu 4.3U with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.3U_v513_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=c6406642c6b85a8c5816a7425f72655f
if /i "%effect%" EQU "Spin" set md5=bbbbb4f455cc42fa07dca861735075f2
if /i "%effect%" EQU "Fast-Spin" set md5=8c863a1f5302133287e5b4edcc4d09f3
set md5alt=%md5%
set basewad=SystemMenu_4.3U_v513
set basecios=%basewad%
set md5base=4f5c63e3fd1bf732067fa4c439c68a97
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Red_NTSC_4-x_with_wii_theme_team_edits.mym
set md5mym1=6e58d6a38a2ea3b7e3c38879320a97a8
set version=513
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2U-DWR
set name=System Menu 4.2U with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.2U_v481_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=f56cf66506359210dc4fd5a00386ed08
if /i "%effect%" EQU "Spin" set md5=7405bafb837d7056a2c0041489cd25a9
if /i "%effect%" EQU "Fast-Spin" set md5=2aa1b0ecd1259fef62a1f23f779a6267
set md5alt=%md5%
set basewad=SystemMenu_4.2U_v481
set basecios=%basewad%
set md5base=4ac52b981845473bd3655e4836d7442b
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Red_NTSC_4-x_with_wii_theme_team_edits.mym
set md5mym1=6e58d6a38a2ea3b7e3c38879320a97a8
set version=481
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1U-DWR
set name=System Menu 4.1U with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.1U_v449_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=8bf20afa9f046fd3e2c780572e483dac
if /i "%effect%" EQU "Spin" set md5=65d5d01b5fbf168043cb9e5ee916cff5
if /i "%effect%" EQU "Fast-Spin" set md5=48be3c92654d36c60de1e363b3425a70
set md5alt=%md5%
set basewad=SystemMenu_4.1U_v449
set basecios=%basewad%
set md5base=38a95a9acd257265294be41b796f6239
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Red_NTSC_4-x_with_wii_theme_team_edits.mym
set md5mym1=6e58d6a38a2ea3b7e3c38879320a97a8
set version=449
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3E-DWR
set name=System Menu 4.3E with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.3E_v514_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=be8fa11a36927b0d55870ae760f4dc7f
if /i "%effect%" EQU "Spin" set md5=f1ad4b9576cd9d1ec0ab8a1a81d6cd85
if /i "%effect%" EQU "Fast-Spin" set md5=a7fcb932e22f747be7292d51872f2aba
set md5alt=%md5%
set basewad=SystemMenu_4.3E_v514
set basecios=%basewad%
set md5base=2ec2e6fbdfc52fe5174749e7032f1bad
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Red_PAL_4-x_with_wii_theme_team_edits.mym
set md5mym1=43ee96a6c37e341d76fd8dfbb7c729ff
set version=514
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2E-DWR
set name=System Menu 4.2E with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.2E_v482_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=0b0fe6cd87ffb67bcd6c52570f451c16
if /i "%effect%" EQU "Spin" set md5=0e8637cebc0565d52dee6c6283ae3881
if /i "%effect%" EQU "Fast-Spin" set md5=6122f703ad2acd5f4d1a576b467d142d
set md5alt=%md5%
set basewad=SystemMenu_4.2E_v482
set basecios=%basewad%
set md5base=7d77be8b6df5ac893d24652db33d02cd
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Red_PAL_4-x_with_wii_theme_team_edits.mym
set md5mym1=43ee96a6c37e341d76fd8dfbb7c729ff
set version=482
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1E-DWR
set name=System Menu 4.1E with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.1E_v450_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=1960a9081b138cbb4b44ab391d1beb2d
if /i "%effect%" EQU "Spin" set md5=db4dc5ba1885049e6dd9754fb94e6e86
if /i "%effect%" EQU "Fast-Spin" set md5=551f79a731c9c40ab50e8429579a56e7
set md5alt=%md5%
set basewad=SystemMenu_4.1E_v450
set basecios=%basewad%
set md5base=688cc78b8eab4e30da04f01a81a3739f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Red_PAL_4-x_with_wii_theme_team_edits.mym
set md5mym1=43ee96a6c37e341d76fd8dfbb7c729ff
set version=450
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3J-DWR
set name=System Menu 4.3J with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.3J_v512_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=f1973ad6e4581e2242fa85432a9eeee3
if /i "%effect%" EQU "Spin" set md5=2cf98a18aff926ba348935b42ac585a1
if /i "%effect%" EQU "Fast-Spin" set md5=03565e5a1555cfa33b12a7617a67fe06
set md5alt=%md5%
set basewad=SystemMenu_4.3J_v512
set basecios=%basewad%
set md5base=df67ed4bd8f8f117741fef7952ee5c17
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii Red jap 4-x edit 3.mym
set md5mym1=393c2fae4861f089ee3ed799e9b8d60e
set version=512
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2J-DWR
set name=System Menu 4.2J with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.2J_v480_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=6ad6db286d54ee25ff13f1a3e42c3f03
if /i "%effect%" EQU "Spin" set md5=479b26c4d095471fa4e5c519bee98477
if /i "%effect%" EQU "Fast-Spin" set md5=557d93df7bd65e66137ea10c93970847
set md5alt=%md5%
set basewad=SystemMenu_4.2J_v480
set basecios=%basewad%
set md5base=0413a9aed208b193fea85db908bbdabf
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii Red jap 4-x edit 3.mym
set md5mym1=393c2fae4861f089ee3ed799e9b8d60e
set version=480
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1J-DWR
set name=System Menu 4.1J with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.1J_v448_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=75d1262328629d2a4f26e40ce7bdf6ca
if /i "%effect%" EQU "Spin" set md5=150edb73e4717634e57380046e615e58
if /i "%effect%" EQU "Fast-Spin" set md5=4b548b305118493dcd030f15f86b615e
set md5alt=%md5%
set basewad=SystemMenu_4.1J_v448
set basecios=%basewad%
set md5base=6edb4b3f7ca26c643c6bc662d159ec2e
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii Red jap 4-x edit 3.mym
set md5mym1=393c2fae4861f089ee3ed799e9b8d60e
set version=448
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart


:SM4.3K-DWR
set name=System Menu 4.3K with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.3K_v518_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=48eb64aad35de4cae0e4edf6312792ea
if /i "%effect%" EQU "Spin" set md5=47fd24e225cee6a8982d07338924b270
if /i "%effect%" EQU "Fast-Spin" set md5=ae7603e5fdf2bbed28fdcd7e43a1411b
set md5alt=%md5%
set basewad=SystemMenu_4.3K_v518
set basecios=%basewad%
set md5base=6ed8f9e75b0a54eacfbacce57c20136d
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWiiRedKor-Final.mym
set md5mym1=9d6ec39a5528693c049907dcf71252b7
set version=518
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2K-DWR
set name=System Menu 4.2K with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.2K_v486_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=cc4b9713c11dd903b6d4fa6a4a51a2af
if /i "%effect%" EQU "Spin" set md5=4aac3fe0de6298f422cabac0411ded8f
if /i "%effect%" EQU "Fast-Spin" set md5=599ce764bbb19b53eba76f2e3ca166bf
set md5alt=%md5%
set basewad=SystemMenu_4.2K_v486
set basecios=%basewad%
set md5base=40c0bf90ea07b02d610edae1d7aea39f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWiiRedKor-Final.mym
set md5mym1=9d6ec39a5528693c049907dcf71252b7
set version=486
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1K-DWR
set name=System Menu 4.1K with Dark Wii Red Theme - %effect%
set wadname=SystemMenu_4.1K_v454_DarkWiiRed_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=4cc1b28dc74ab3b126ebfeea6a9aac72
if /i "%effect%" EQU "Spin" set md5=8e4dcbf428fea759dd0fd965e6a55f9b
if /i "%effect%" EQU "Fast-Spin" set md5=525d8a50c59070b2df005a47d515b140
set md5alt=%md5%
set basewad=SystemMenu_4.1K_v454
set basecios=%basewad%
set md5base=c0e5d5c4914e76e7df7495ccf28ef869
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWiiRedKor-Final.mym
set md5mym1=9d6ec39a5528693c049907dcf71252b7
set version=454
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3U-DWG
set name=System Menu 4.3U with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.3U_v513_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=c38b75d7d73a95e6704ba18d4f6bd62c
if /i "%effect%" EQU "Spin" set md5=89d66ae6c2b25a4705e166126901cf7a
if /i "%effect%" EQU "Fast-Spin" set md5=8dfa61932c170f29bc2b5d1600b7c0fe
set md5alt=%md5%
set basewad=SystemMenu_4.3U_v513
set basecios=%basewad%
set md5base=4f5c63e3fd1bf732067fa4c439c68a97
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWiigreenntsc-final.mym
set md5mym1=7700bebff958e0ed005f4a8b308d6b4c
set version=513
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2U-DWG
set name=System Menu 4.2U with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.2U_v481_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=afa602db4b007d14d62ba1c7f8cc0a37
if /i "%effect%" EQU "Spin" set md5=29a0401891a4d4e6702aa186857e4cdc
if /i "%effect%" EQU "Fast-Spin" set md5=f363a26c4efa46d8e37a4e8fc95a4c6b
set md5alt=%md5%
set basewad=SystemMenu_4.2U_v481
set basecios=%basewad%
set md5base=4ac52b981845473bd3655e4836d7442b
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWiigreenntsc-final.mym
set md5mym1=7700bebff958e0ed005f4a8b308d6b4c
set version=481
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1U-DWG
set name=System Menu 4.1U with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.1U_v449_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=ae8ddcd3fe74c5f549b5ce7cfeccf873
if /i "%effect%" EQU "Spin" set md5=5d9d571f856b1dc07f6d46e806e511bd
if /i "%effect%" EQU "Fast-Spin" set md5=4e8f9db355a1f20a074c57b392b3b702
set md5alt=%md5%
set basewad=SystemMenu_4.1U_v449
set basecios=%basewad%
set md5base=38a95a9acd257265294be41b796f6239
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWiigreenntsc-final.mym
set md5mym1=7700bebff958e0ed005f4a8b308d6b4c
set version=449
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3E-DWG
set name=System Menu 4.3E with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.3E_v514_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=8fd78250da5a89c0471434497608e6c9
if /i "%effect%" EQU "Spin" set md5=1856308855d0f6ad271903435210da09
if /i "%effect%" EQU "Fast-Spin" set md5=24a128718e95f90894a4a1d6aee794bd
set md5alt=%md5%
set basewad=SystemMenu_4.3E_v514
set basecios=%basewad%
set md5base=2ec2e6fbdfc52fe5174749e7032f1bad
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWiigreenpal-final.mym
set md5mym1=ebc41b9910c910a5c7054108c304dcb9
set version=514
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2E-DWG
set name=System Menu 4.2E with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.2E_v482_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=887e2bbf5797f9167fd2d2670864bfc0
if /i "%effect%" EQU "Spin" set md5=3422f271af44ec2369c2a9356cd16a6c
if /i "%effect%" EQU "Fast-Spin" set md5=d1cf93f577775b2de6bf11e8831cedf7
set md5alt=%md5%
set basewad=SystemMenu_4.2E_v482
set basecios=%basewad%
set md5base=7d77be8b6df5ac893d24652db33d02cd
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWiigreenpal-final.mym
set md5mym1=ebc41b9910c910a5c7054108c304dcb9
set version=482
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1E-DWG
set name=System Menu 4.1E with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.1E_v450_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=b961e623dcf37a31bcbec4c7bff5d17c
if /i "%effect%" EQU "Spin" set md5=a53cab247691eeb7dda21213e09c3d5c
if /i "%effect%" EQU "Fast-Spin" set md5=3327d3d023e95c262de149512f708378
set md5alt=%md5%
set basewad=SystemMenu_4.1E_v450
set basecios=%basewad%
set md5base=688cc78b8eab4e30da04f01a81a3739f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWiigreenpal-final.mym
set md5mym1=ebc41b9910c910a5c7054108c304dcb9
set version=450
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3J-DWG
set name=System Menu 4.3J with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.3J_v512_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=e1bf79828225319a85c3540cde80ae95
if /i "%effect%" EQU "Spin" set md5=1cba0f8e4b4514acc9e1eac05edbb406
if /i "%effect%" EQU "Fast-Spin" set md5=d7e5d27bfb723c300ddb2468c91ab9ba
set md5alt=%md5%
set basewad=SystemMenu_4.3J_v512
set basecios=%basewad%
set md5base=df67ed4bd8f8f117741fef7952ee5c17
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWiigreenjap-final.mym
set md5mym1=c0ca64e1f0502c138113b681df7ef961
set version=512
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2J-DWG
set name=System Menu 4.2J with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.2J_v480_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=f9c35f9146e785a106666c9b11fdd2b8
if /i "%effect%" EQU "Spin" set md5=7f6f88deec86e9309d9e76b507b0044c
if /i "%effect%" EQU "Fast-Spin" set md5=fee2c0f6efcea922216e42e5d7721591
set md5alt=%md5%
set basewad=SystemMenu_4.2J_v480
set basecios=%basewad%
set md5base=0413a9aed208b193fea85db908bbdabf
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWiigreenjap-final.mym
set md5mym1=c0ca64e1f0502c138113b681df7ef961
set version=480
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1J-DWG
set name=System Menu 4.1J with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.1J_v448_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=6471709f115212164e44d6772f9cd279
if /i "%effect%" EQU "Spin" set md5=bd5bd5876e32614b420f98446dcd6050
if /i "%effect%" EQU "Fast-Spin" set md5=b61bdfdeb3c35ed984fc89a17fc3dfdb
set md5alt=%md5%
set basewad=SystemMenu_4.1J_v448
set basecios=%basewad%
set md5base=6edb4b3f7ca26c643c6bc662d159ec2e
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWiigreenjap-final.mym
set md5mym1=c0ca64e1f0502c138113b681df7ef961
set version=448
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart


:SM4.3K-DWG
set name=System Menu 4.3K with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.3K_v518_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=cbcef4b708184948e4c46314feb5608f
if /i "%effect%" EQU "Spin" set md5=d3cb71941cbd0b0721244824782a7096
if /i "%effect%" EQU "Fast-Spin" set md5=d749556228b3b17f61351e4661e13e80
set md5alt=%md5%
set basewad=SystemMenu_4.3K_v518
set basecios=%basewad%
set md5base=6ed8f9e75b0a54eacfbacce57c20136d
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Green_4.xK.mym
set md5mym1=21b0e77dfc49b0b657b81ff1f075216d
set version=518
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2K-DWG
set name=System Menu 4.2K with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.2K_v486_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=d5c698001cfb26d196f3aa8d913dcb70
if /i "%effect%" EQU "Spin" set md5=eebe040987688b7bca894d50d22076d4
if /i "%effect%" EQU "Fast-Spin" set md5=4c6966f8794dab11d720ff80ccb25e64
set md5alt=%md5%
set basewad=SystemMenu_4.2K_v486
set basecios=%basewad%
set md5base=40c0bf90ea07b02d610edae1d7aea39f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Green_4.xK.mym
set md5mym1=21b0e77dfc49b0b657b81ff1f075216d
set version=486
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1K-DWG
set name=System Menu 4.1K with Dark Wii Green Theme - %effect%
set wadname=SystemMenu_4.1K_v454_DarkWiiGreen_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=855555379983f64d5e97b3c8bf48e90b
if /i "%effect%" EQU "Spin" set md5=0b9121d362b1776ccbff65307005fbf3
if /i "%effect%" EQU "Fast-Spin" set md5=22d5524ff2856a42bfa30563d641b3ae
set md5alt=%md5%
set basewad=SystemMenu_4.1K_v454
set basecios=%basewad%
set md5base=c0e5d5c4914e76e7df7495ccf28ef869
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=DarkWii_Green_4.xK.mym
set md5mym1=21b0e77dfc49b0b657b81ff1f075216d
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

:PHOTO0
set name=Photo Channel (USA / PAL / JAP / KOR)
set code1=00010002
set code2=48414141
set version=2
set wadname=Photo-Channel-1.0-NUS-v2.wad
set md5=574e6939fe6b0f0bf11b10e6e75ad192
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
set name=IOS30v2576 (3.2 SM IOS)
set code1=00000001
set code2=0000001E
set version=2576
set wadname=IOS30-64-v2576.wad
set md5=45d7945d08eb25dc167b6f30ab8a9a9d
set md5alt=%md5%
set category=ios
goto:downloadstart

:IOS30P
set name=IOS30v12576(IOS30v2576[FS-ES-NP-VP])
set code1=00000001
set code2=0000001E
set version=2576
set wadname=IOS30v12576(IOS30v2576[FS-ES-NP-VP])
set md5=e9003966357126dfefa4061f1c7c635c
set md5alt=%md5%
set ciosslot=30
set ciosversion=12576
set category=patchios
set basewad=IOS30-64-v2576
set md5base=45d7945d08eb25dc167b6f30ab8a9a9d
set md5basealt=%md5base%
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
set name=IOS60v6174 (4.1 SM IOS)
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS60-64-v6174.wad
set md5=a8cfd7a77016227203639713db5ac34e
set md5alt=%md5%
set category=ios
goto:downloadstart



:IOS60P
set name=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set md5=c45a2bf6d560b2039f900f57cb00e7e1
set md5alt=%md5%
set ciosslot=60
set ciosversion=16174
set category=patchios
set basewad=IOS60-64-v6174
set md5base=a8cfd7a77016227203639713db5ac34e
set md5basealt=%md5base%
set basecios=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set diffpath=%basecios%
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=
goto:downloadstart


::IOS60 installed to a bunch of different SM IOS slots for brick protection
:IOS11P60
set name=IOS11v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS11v16174(IOS60v6174[FS-ES-NP-VP-DIP]).wad
set md5=32f25aaefd0bb4cf53b76c2e984d12f7
set md5alt=%md5%
set ciosslot=11
set ciosversion=16174
set category=patchios
set basewad=IOS60-64-v6174
set md5base=a8cfd7a77016227203639713db5ac34e
set md5basealt=%md5base%
set basecios=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set diffpath=%basecios%
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=
goto:downloadstart



:IOS20P60
set name=IOS20v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS20v16174(IOS60v6174[FS-ES-NP-VP-DIP]).wad
set md5=808f1d1f073adc9dc0406ead1d43a318
set md5alt=%md5%
set ciosslot=20
set ciosversion=16174
set category=patchios
set basewad=IOS60-64-v6174
set md5base=a8cfd7a77016227203639713db5ac34e
set md5basealt=%md5base%
set basecios=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set diffpath=%basecios%
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=
goto:downloadstart



:IOS30P60
set name=IOS30v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS30v16174(IOS60v6174[FS-ES-NP-VP-DIP]).wad
set md5=a68689125e3172faa04c00ef42a593b1
set md5alt=%md5%
set ciosslot=30
set ciosversion=16174
set category=patchios
set basewad=IOS60-64-v6174
set md5base=a8cfd7a77016227203639713db5ac34e
set md5basealt=%md5base%
set basecios=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set diffpath=%basecios%
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=
goto:downloadstart

:IOS40P60
set name=IOS40v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS40v16174(IOS60v6174[FS-ES-NP-VP-DIP]).wad
set md5=dd8fe0f58a019f45c792b92837125cd8
set md5alt=%md5%
set ciosslot=40
set ciosversion=16174
set category=patchios
set basewad=IOS60-64-v6174
set md5base=a8cfd7a77016227203639713db5ac34e
set md5basealt=%md5base%
set basecios=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set diffpath=%basecios%
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=
goto:downloadstart


:IOS70K
set name=IOS70v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS70v16174(IOS60v6174[FS-ES-NP-VP-DIP]).wad
set md5=2ddf180d37b35f1e9abb6982fe55f587
set md5alt=%md5%
set ciosslot=70
set ciosversion=16174
set category=patchios
set basewad=IOS60-64-v6174
set md5base=a8cfd7a77016227203639713db5ac34e
set md5basealt=%md5base%
set basecios=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set diffpath=%basecios%
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=
goto:downloadstart


:IOS80K
set name=IOS80v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS80v16174(IOS60v6174[FS-ES-NP-VP-DIP]).wad
set md5=23f3008dca379b5db2044bf09ec03276
set md5alt=%md5%
set ciosslot=80
set ciosversion=16174
set category=patchios
set basewad=IOS60-64-v6174
set md5base=a8cfd7a77016227203639713db5ac34e
set md5basealt=%md5base%
set basecios=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set diffpath=%basecios%
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=
goto:downloadstart


:IOS50P
set name=IOS50v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS50v16174(IOS60v6174[FS-ES-NP-VP-DIP]).wad
set md5=3b1f2a76fd800ddb777744a47086844b
set md5alt=%md5%
set ciosslot=50
set ciosversion=16174
set category=patchios
set basewad=IOS60-64-v6174
set md5base=a8cfd7a77016227203639713db5ac34e
set md5basealt=%md5base%
set basecios=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set diffpath=%basecios%
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=
goto:downloadstart


:IOS52P
set name=IOS52v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set code1=00000001
set code2=0000003C
set version=6174
set wadname=IOS52v16174(IOS60v6174[FS-ES-NP-VP-DIP]).wad
set md5=62fb16adb16b6b3823ef99746caaef03
set md5alt=%md5%
set ciosslot=52
set ciosversion=16174
set category=patchios
set basewad=IOS60-64-v6174
set md5base=a8cfd7a77016227203639713db5ac34e
set md5basealt=%md5base%
set basecios=IOS60v16174(IOS60v6174[FS-ES-NP-VP-DIP])
set diffpath=%basecios%
set code2new=0000003C
set lastbasemodule=0000000e
set cIOSFamilyName=
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
set name=IOS70v6687 (4.2 SM IOS)
set code1=00000001
set code2=00000046
set version=6687
set wadname=IOS70-64-v6687.wad
set md5=c38ff50344c00e17b7fe58c05d35a91c
set md5alt=%md5%
set category=ios
goto:downloadstart



:IOS70P
set name=IOS70v16687(IOS70v6687[FS-ES-NP-VP])
set code1=00000001
set code2=00000046
set version=6687
set wadname=IOS70v16687(IOS70v6687[FS-ES-NP-VP]).wad
::IOS70-64-v6687[FS-ES-NP-VP].wad
set md5=c31c4d1ad79de3a0840997a73c40b6e4
set md5alt=%md5%
set ciosslot=70
set ciosversion=16687
set category=patchios
set basewad=IOS70-64-v6687
set md5base=c38ff50344c00e17b7fe58c05d35a91c
set md5basealt=%md5base%
goto:downloadstart


:IOS80
set name=IOS80v6944
set code1=00000001
set code2=00000050
set version=6944
set wadname=IOS80-64-v6944.wad
set md5=08af8d598af53c8bc66b31228364cfd7
set md5alt=dde76a81090611406bcb3b76ac3f082c
set category=ios
goto:downloadstart


:IOS80P
set name=IOS80v16944(IOS80v6944[FS-ES-NP-VP])
set code1=00000001
set code2=00000050
set version=6944
set wadname=IOS80v16944(IOS80v6944[FS-ES-NP-VP])
set md5=9cfe4beddbf77087220191b5c8a96263
set md5alt=%md5%
set ciosslot=80
set ciosversion=16944
set category=patchios
set basewad=IOS80-64-v6944
set md5base=dde76a81090611406bcb3b76ac3f082c
set md5basealt=%md5base%
goto:downloadstart


:IOS236
set name=IOS236v65535(IOS36v3351[FS-ES-NP-VP])
set code1=00000001
set code2=00000024
set version=3351
set wadname=IOS236v65535(IOS36v3351[FS-ES-NP-VP]).wad
set md5=06259eb90e6ca115ba67720fc1a1ff80
set md5alt=%md5%
set ciosslot=236
set ciosversion=65535
set category=patchios
set basewad=IOS36-64-v3351
set md5base=daa08e17264c523049e395edad5a50fe
set md5basealt=%md5base%
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
set name=Bannerbomb v1 (for 3.0 - 4.1 Wii's)
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
set name=Bannerbomb v2 (for 4.2 Wii's)
set code1=URL
set code2=http://bannerbomb.qoid.us/abds/abd6a_v200.zip
set version=bin
set dlname=abd6a_v200.zip
set wadname=BB2.zip
set md5=d846f2c07c0a3be6fadca90dbb7356a7
if /i "%BB1%" EQU "*" (set path1=private2\wii\title\aktn\) else (set path1=private\wii\title\aktn\)
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

:sysCheck
set name=sysCheck v2.0.1
set code1=URL
set code2=http://filetrip.net/f/12865-sysCheck2.0.1.zip
set version=*
set dlname=12865-sysCheck2.0.1.zip
set wadname=sysCheck2.0.1.zip
set filename=boot.dol
set md5=3da9e9cff893357ca924649b766d6f34
set path1=apps\sysCheck\
goto:downloadstart

:sysCheckBeta
set name=sysCheck v2.1.0.b13
set code1=URL
set code2=http://syscheck.googlecode.com/files/syscheckb13.zip
set version=*
set dlname=syscheckb13.zip
set wadname=syscheckb13.zip
set filename=boot.dol
set md5=e2ec7fed32f18ed3ce9db8286cff38be
set path1=apps\sysCheckBeta\
goto:downloadstart

:SIP
set category=fullextract
set name=Simple IOS Patcher
set code1=URL
set code2=http://filetrip.net/f/25749-sip_v1.14.zip
set version=*
set dlname=25749-sip_v1.14.zip
set wadname=sip_v1.14.zip
set filename=boot.dol
set md5=fbaeb401e44cdbe0e455490190cc196d
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
set code2="http://nusad.googlecode.com/files/LockedApps-Categorii.zip"
set version=*
set dlname=LockedApps-Categorii.zip
set wadname=LockedApps-Categorii.zip
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
set md5=e321da8d59578313890a50b7a31aff7b
set path1=apps\AccioHacks\
goto:downloadstart


:MyM
set name=MyMenuifyMod
set category=fullextract
set code1=URL
set code2=http://mymenuifymod.googlecode.com/files/MyMenuifyModv1.3.dols.rar
set version=*
set dlname=MyMenuifyModv1.3.dols.rar
set wadname=MyMenuifyModv1.3.dols.rar
set filename=boot.dol
set md5=b4886e823647c5fd41a07982178ce116
set path1=apps\MyMenuifyMod\
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

:neogamma
set name=Neogamma Backup Disc Loader
set category=fullextract
set code1=URL
set code2="http://filetrip.net/f/25406-NeoGammaR9beta50.zip"
set version=*
set dlname="25406-NeoGammaR9beta50.zip"
set wadname=NeoGammaR9beta50.zip
set filename=boot.dol
set md5=edcf72d88b50673b3d198cb9d401f8aa
set path1=apps\neogamma\
goto:downloadstart

:yawm
set name=Yet Another Wad Manager Mod
set code1=URL
set code2="http://yawmm.googlecode.com/files/YAWMM.zip"
set version=*
set dlname="YAWMM.zip"
set wadname=YAWMM.zip
set filename=boot.dol
set md5=e475232c74f630aae3444e67e17d5f27
set path1=apps\yawmm\
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
set path1=apps\usbloader_cfg\
goto:downloadstart

:cfg249
set name=Configurable USB Loader (Most recent 249 version)
set category=cfg
set path1=apps\usbloader_cfg\
goto:downloadstart

:cfg222
set name=Configurable USB Loader (Most recent 222 version)
set category=cfg
set path1=apps\usbloader_cfg\
goto:downloadstart

:cfgr
set name=Configurator for Configurable USB Loader (Most recent version)
set category=cfgr
set path1=usb-loader\
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
set name=USB-Loader Forwarder Channel v11b
set code1=ZIP
set code2="http://nusad.googlecode.com/files/USBLoader(s)-ahbprot58-SD-USB-v11b-IDCL.zip"
set version=*
set dlname=USBLoader(s)-ahbprot58-SD-USB-v11b-IDCL.zip
set wadname=USBLoader(s)-ahbprot58-SD-USB-v11b-IDCL.zip
set filename=USBLoader(s)-ahbprot58-SD-USB-v11b-IDCL.wad
set md5=43f1ea1dbd52ea5188fea2f13c422e12
set md5alt=%md5%
set category=fullextract
set path1=WAD\
goto:downloadstart


:JOYF
set name=Joy Flow Forwarder Channel\dol
set code1=ZIP
set code2="http://nusad.googlecode.com/files/JoyFlow_Forwarder_wad_dol_v2.zip"
set version=*
set dlname=JoyFlow_Forwarder_wad_dol_v2.zip
set wadname=JoyFlow_Forwarder_wad_dol_v2.zip
set filename=JoyFlowHNv11-HBJF.wad
set md5=d8b0aeca3dd1a9e25b800978ca6bfa8b
set md5alt=%md5%
set category=fullextract
set path1=WAD\
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
set code2="http://nusad.googlecode.com/files/switch2uneek_ModMiiBundle_v2.zip"
set version=*
set dlname=switch2uneek_ModMiiBundle_v2.zip
set wadname=switch2uneek_ModMiiBundle_v2.zip
set filename=switch2uneek(emulators)-4RealNand-v11-S2UK.wad
set md5=088ae02a6943bd5da1c354c992b4cafa
set md5alt=%md5%
set category=fullextract
set path1=WAD\
::below is for building emu nand
if /i "%MENU1%" NEQ "S" goto:downloadstart
set filename=switch2uneek(emulators)-4EMUNand-v11-S2RL.wad
set md5=5f339cbb874161808e1414dee1166965
set md5alt=%md5%
::set path1=\
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
set path1=WAD\
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


:SMW
set name=ShowMiiWads
set category=fullextract
set code1=URL
set code2="http://showmiiwads.googlecode.com/files/ShowMiiWads 1.4.rar"
set version=*
set dlname="ShowMiiWads 1.4.rar"
set wadname=ShowMiiWads 1.4.rar
set filename=ShowMiiWads.exe
set md5=58277ad0974e59493bb3e9f8a8aca82b
set path1=ShowMiiWads\
goto:downloadstart

:CM
set name=Customize Mii
set category=fullextract
set code1=URL
set code2="http://customizemii.googlecode.com/files/CustomizeMii 3.11.rar"
set version=*
set dlname="CustomizeMii 3.11.rar"
set wadname=CustomizeMii 3.11.rar
set filename=CustomizeMii.exe
set md5=e35d75c3ad0a058149bdf45155595cfc
set path1=CustomizeMii\
goto:downloadstart

:WiiGSC
set name=Wii Game Shortcut Creator
set category=fullextract
set code1=URL
set code2="http://nusad.googlecode.com/files/WiiGSC-Unpacked-1.06b.zip"
set version=*
set dlname=WiiGSC-Unpacked-1.06b.zip
set wadname=WiiGSC-Unpacked-1.06b.zip
set filename=WiiGSC.exe
set md5=3779833ec3279dff3d415c7bd6e56fec
set path1=WiiGSC\
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
set cIOSFamilyName=hermes
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
set cIOSFamilyName=hermes
set cIOSversionNum=4
goto:downloadstart



:NMM
set name=cBC-NMMv0.2a
set wadname=cBC-NMMv0.2a
set ciosslot=unchanged
set ciosversion=
set md5=5920f84dcc5343674d08fc2c4e400b09
set md5alt=%md5%
set basewad=BC-NUS-v6
set md5base=d1593a77e24ecc95af2b393abe5d92f0
set md5basealt=%md5base%
set code1=00000001
set code2=00000100
set version=6
set basewadb=RVL-mios-v10
set md5baseb=851c27dae82bc1c758be07fa964d17cb
set md5basebalt=%md5baseb%
set code1b=00000001
set code2b=00000101
set versionb=10
set basecios=cBC-NMMv0.2a
set diffpath=%basecios%
set code2new=00000100
set lastbasemodule=
set cIOSFamilyName=
set cIOSversionNum=
set URL=http://crediar.no-ip.com/NMMv0.2a-cred.rar
set dlname=NMMv0.2a-cred.rar
goto:downloadstart



:DML
set name=cBC-DML
set wadname=cBC-DML
set ciosslot=unchanged
set ciosversion=
set md5=aaaaa5a3f60d762cf5c3f64f57ba82c9
set md5alt=%md5%
set basewad=BC-NUS-v6
set md5base=d1593a77e24ecc95af2b393abe5d92f0
set md5basealt=%md5base%
set code1=00000001
set code2=00000100
set version=6
set basewadb=RVL-mios-v10
set md5baseb=851c27dae82bc1c758be07fa964d17cb
set md5basebalt=%md5baseb%
set code1b=00000001
set code2b=00000101
set versionb=10
set basecios=cBC-DML
set diffpath=%basecios%
set code2new=00000100
set lastbasemodule=
set cIOSFamilyName=
set cIOSversionNum=
set URL=http://crediar.no-ip.com/dp-cred.rar
set dlname=dp-cred.rar
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
set cIOSFamilyName=hermes
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
set cIOSFamilyName=hermes
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
set cIOSFamilyName=hermes
set cIOSversionNum=5
goto:downloadstart


:cIOS202[60]-v5.1R
set name=cIOS202[60]-v5.1R
set wadname=cIOS202[60]-v5.1R
set ciosslot=unchanged
set ciosversion=
set md5=7e455ddeeac4f831f9235b8d37a36078
set md5alt=%md5%
set basewad=IOS60-64-v6174
set md5base=a8cfd7a77016227203639713db5ac34e
set md5basealt=%md5base%
set code1=00000001
set code2=0000003C
set version=6174
set basecios=cIOS202[60]-v5.1R
set diffpath=%basecios%
set code2new=000000ca
set lastbasemodule=0000000e
set cIOSFamilyName=hermesrodries
set cIOSversionNum=6
goto:downloadstart

:cIOS222[38]-v5.1R
set name=cIOS222[38]-v5.1R
set wadname=cIOS222[38]-v5.1R
set ciosslot=unchanged
set ciosversion=
set md5=99404fcf2af266469d93fd2ae8f0fe0a
set md5alt=%md5%
set basewad=IOS38-64-v3867
set md5base=394298e4c9ff287e69020f2405423eb4
set md5basealt=a2f935cab6a864909325cf0e8fefc349
set code1=00000001
set code2=00000026
set version=3867
set basecios=cIOS222[38]-v5.1R
set diffpath=%basecios%
set code2new=000000de
set lastbasemodule=0000000e
set cIOSFamilyName=hermesrodries
set cIOSversionNum=6
goto:downloadstart

:cIOS223[37]-v5.1R
set name=cIOS223[37]-v5.1R
set wadname=cIOS223[37]-v5.1R
set ciosslot=unchanged
set ciosversion=
set md5=488f09d029346edd84701f789c99bd31
set md5alt=%md5%
set basewad=IOS37-64-v3869
set md5base=5f4295741efab0d919e491b7151d5ed3
set md5basealt=47b658053d224af86ce11aa71bea0112
set code1=00000001
set code2=00000025
set version=3869
set basecios=cIOS223[37]-v5.1R
set diffpath=%basecios%
set code2new=000000df
set lastbasemodule=0000000e
set cIOSFamilyName=hermesrodries
set cIOSversionNum=6
goto:downloadstart

:cIOS224[57]-v5.1R
set name=cIOS224[57]-v5.1R
set wadname=cIOS224[57]-v5.1R
set ciosslot=unchanged
set ciosversion=
set md5=f9d9b2967b4568e7d3c304c5e43d4952
set md5alt=%md5%
set basewad=IOS57-64-v5661
set md5base=ba50f0d46290d74d020f0afa58811e2e
set md5basealt=bca6176ccca817e722d73130a9e73258
set code1=00000001
set code2=00000039
set version=5661
set basecios=cIOS224[57]-v5.1R
set diffpath=%basecios%
set code2new=000000e0
set lastbasemodule=00000012
set cIOSFamilyName=hermesrodries
set cIOSversionNum=6
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
set cIOSFamilyName=waninkoko
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
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
set name=DarkWii Red Theme (4.1U) - %effect%
set wadname=DarkWii_Red_%effect%_4.1U
if /i "%effect%" EQU "No-Spin" set md5=6ca906e74de1193f68b2d72728260823
if /i "%effect%" EQU "Spin" set md5=82d40f02f358857f65eba0afc6c2eef0
if /i "%effect%" EQU "Fast-Spin" set md5=2e71a697597af10aec162ca90f510d89
set mym1=DarkWii_Red_NTSC_4-x_with_wii_theme_team_edits.mym
set md5mym1=6e58d6a38a2ea3b7e3c38879320a97a8
::000000**.app
set version=7b
set md5base=6b939de8222800733f4c44ae4eadb325
set category=themes
goto:downloadstart

:DarkWii_Red_4.2U
set name=DarkWii Red Theme (4.2U) - %effect%
set wadname=DarkWii_Red_%effect%_4.2U
if /i "%effect%" EQU "No-Spin" set md5=611c287885444c6de163d42775a8ae20
if /i "%effect%" EQU "Spin" set md5=32dc95b83f1f848b49341c7f8ae58a9b
if /i "%effect%" EQU "Fast-Spin" set md5=017150040ff1e03dfc9f21705fd9fae7
set mym1=DarkWii_Red_NTSC_4-x_with_wii_theme_team_edits.mym
set md5mym1=6e58d6a38a2ea3b7e3c38879320a97a8
::000000**.app
set version=87
set md5base=7079948c6aed8aae6009e4fdf27c7171
set category=themes
goto:downloadstart

:DarkWii_Red_4.3U
set name=DarkWii Red Theme (4.3U) - %effect%
set wadname=DarkWii_Red_%effect%_4.3U
if /i "%effect%" EQU "No-Spin" set md5=d933cea8cb9e5972957cdc09aa42d0f3
if /i "%effect%" EQU "Spin" set md5=1abcc6ca6d8c7059f2fce961a267572e
if /i "%effect%" EQU "Fast-Spin" set md5=76d1dfc30350e92fd1de88c4836d022e
set mym1=DarkWii_Red_NTSC_4-x_with_wii_theme_team_edits.mym
set md5mym1=6e58d6a38a2ea3b7e3c38879320a97a8
::000000**.app
set version=97
set md5base=f388c9b11543ac2fe0912ab96064ee37
set category=themes
goto:downloadstart

:DarkWii_Red_4.1E
set name=DarkWii Red Theme (4.1E) - %effect%
set wadname=DarkWii_Red_%effect%_4.1E
if /i "%effect%" EQU "No-Spin" set md5=d86114ae32128e0cea7d15c1db23d834
if /i "%effect%" EQU "Spin" set md5=741673b5c5203f97120a7497062de684
if /i "%effect%" EQU "Fast-Spin" set md5=4bbdf31b36100b56c5eafdff2b80047b
set mym1=DarkWii_Red_PAL_4-x_with_wii_theme_team_edits.mym
set md5mym1=43ee96a6c37e341d76fd8dfbb7c729ff
::000000**.app
set version=7e
set md5base=574a3a144971ea0ec61bf8cef8d7ff80
set category=themes
goto:downloadstart

:DarkWii_Red_4.2E
set name=DarkWii Red Theme (4.2E) - %effect%
set wadname=DarkWii_Red_%effect%_4.2E
if /i "%effect%" EQU "No-Spin" set md5=4b0876a5080f92b2d8195abd63f73e6c
if /i "%effect%" EQU "Spin" set md5=4b167e3e66d90fbe774f793deeacd1a2
if /i "%effect%" EQU "Fast-Spin" set md5=720bd79de493dd208e24a9e1c0fd7223
set mym1=DarkWii_Red_PAL_4-x_with_wii_theme_team_edits.mym
set md5mym1=43ee96a6c37e341d76fd8dfbb7c729ff
::000000**.app
set version=8a
set md5base=7e7994f78941afb51e9a20085deac305
set category=themes
goto:downloadstart

:DarkWii_Red_4.3E
set name=DarkWii Red Theme (4.3E) - %effect%
set wadname=DarkWii_Red_%effect%_4.3E
if /i "%effect%" EQU "No-Spin" set md5=2a5b9861ffd8e49888a6f37c10a70c7b
if /i "%effect%" EQU "Spin" set md5=761ad0896ac98f1b243f21f563537399
if /i "%effect%" EQU "Fast-Spin" set md5=db8d035f01ce99bef0c843963fa7d4a0
set mym1=DarkWii_Red_PAL_4-x_with_wii_theme_team_edits.mym
set md5mym1=43ee96a6c37e341d76fd8dfbb7c729ff
::000000**.app
set version=9a
set md5base=41310f79497c56850c37676074ee1237
set category=themes
goto:downloadstart

:DarkWii_Red_4.1J
set name=DarkWii Red Theme (4.1J) - %effect%
set wadname=DarkWii_Red_%effect%_4.1J
if /i "%effect%" EQU "No-Spin" set md5=c6eb9dfd8a0279be749a3423ba73cc34
if /i "%effect%" EQU "Spin" set md5=8cf389fb675e0367acff73b83043ccd4
if /i "%effect%" EQU "Fast-Spin" set md5=20c1a69911ea3026ec7c45c34b1e2a3e
set mym1=DarkWii Red jap 4-x edit 3.mym
set md5mym1=393c2fae4861f089ee3ed799e9b8d60e
::000000**.app
set version=78
set md5base=f2eadf12d18e793373060222b870057d
set category=themes
goto:downloadstart

:DarkWii_Red_4.2J
set name=DarkWii Red Theme (4.2J) - %effect%
set wadname=DarkWii_Red_%effect%_4.2J
if /i "%effect%" EQU "No-Spin" set md5=f3dc6d6e1f436a6bb844dddbccc1f713
if /i "%effect%" EQU "Spin" set md5=a60a39a3927883058847484dc23cad76
if /i "%effect%" EQU "Fast-Spin" set md5=7b904662ace820e58be8d3d48dea676e
set mym1=DarkWii Red jap 4-x edit 3.mym
set md5mym1=393c2fae4861f089ee3ed799e9b8d60e
::000000**.app
set version=84
set md5base=b08998e582c48afba3a14f6d9e1e9373
set category=themes
goto:downloadstart

:DarkWii_Red_4.3J
set name=DarkWii Red Theme (4.3J) - %effect%
set wadname=DarkWii_Red_%effect%_4.3J
if /i "%effect%" EQU "No-Spin" set md5=3a223b0a67c406e5f73e361b106977fe
if /i "%effect%" EQU "Spin" set md5=a897a1bee590a898277d1680c570a77f
if /i "%effect%" EQU "Fast-Spin" set md5=0bd45acdc69beef14209d3a9b7cb5b80
set mym1=DarkWii Red jap 4-x edit 3.mym
set md5mym1=393c2fae4861f089ee3ed799e9b8d60e
::000000**.app
set version=94
set md5base=5b3ee6942a3cda716badbce3665076fc
set category=themes
goto:downloadstart

:DarkWii_Red_4.1K
set name=DarkWii Red Theme (4.1K) - %effect%
set wadname=DarkWii_Red_%effect%_4.1K
if /i "%effect%" EQU "No-Spin" set md5=cad7007eb9c263c75249e4399a61d6e0
if /i "%effect%" EQU "Spin" set md5=1190c95de65850d9c8a7ff9bbbc67f8d
if /i "%effect%" EQU "Fast-Spin" set md5=5fcc5678018739f45be4d9f4e2ae639a
set mym1=DarkWiiRedKor-Final.mym
set md5mym1=9d6ec39a5528693c049907dcf71252b7
::000000**.app
set version=81
set md5base=7eedbf1a146b29b63edbb55e04f81f98
set category=themes
goto:downloadstart

:DarkWii_Red_4.2K
set name=DarkWii Red Theme (4.2K) - %effect%
set wadname=DarkWii_Red_%effect%_4.2K
if /i "%effect%" EQU "No-Spin" set md5=0fa6db76463cce7f1c9a07a5b50dad94
if /i "%effect%" EQU "Spin" set md5=cb3398120c987be5e9765b508f95d78b
if /i "%effect%" EQU "Fast-Spin" set md5=da3b9a630900f0d2f9e2e5df47c7494c
set mym1=DarkWiiRedKor-Final.mym
set md5mym1=9d6ec39a5528693c049907dcf71252b7
::000000**.app
set version=8d
set md5base=9d72a1966370e44cb4c456c17a077bec
set category=themes
goto:downloadstart

:DarkWii_Red_4.3K
set name=DarkWii Red Theme (4.3K) - %effect%
set wadname=DarkWii_Red_%effect%_4.3K
if /i "%effect%" EQU "No-Spin" set md5=d47d6eaf291b3a635e9327ebec0c6b44
if /i "%effect%" EQU "Spin" set md5=d61e2ee9d2fad0495b47573572b21d9a
if /i "%effect%" EQU "Fast-Spin" set md5=8fa44fd6cb7395fcd8057b5a8f48b584
set mym1=DarkWiiRedKor-Final.mym
set md5mym1=9d6ec39a5528693c049907dcf71252b7
::000000**.app
set version=9d
set md5base=e6f2b0d4d5e0c095895f186009bf9516
set category=themes
goto:downloadstart

:DarkWii_Green_4.1U
set name=DarkWii Green Theme (4.1U) - %effect%
set wadname=DarkWii_Green_%effect%_4.1U
if /i "%effect%" EQU "No-Spin" set md5=226942baf867be4408f157a6e568cd89
if /i "%effect%" EQU "Spin" set md5=a5d0787e574b743a83628bd19f21c2ef
if /i "%effect%" EQU "Fast-Spin" set md5=e1dcaa66bab5d546b5ffcabdcd67bb70
set mym1=DarkWiigreenntsc-final.mym
set md5mym1=7700bebff958e0ed005f4a8b308d6b4c
::000000**.app
set version=7b
set md5base=6b939de8222800733f4c44ae4eadb325
set category=themes
goto:downloadstart

:DarkWii_Green_4.2U
set name=DarkWii Green Theme (4.2U) - %effect%
set wadname=DarkWii_Green_%effect%_4.2U
if /i "%effect%" EQU "No-Spin" set md5=7e228beb400cb1d13ed9fd2da237a04f
if /i "%effect%" EQU "Spin" set md5=5f1cd28e1c84b58f0a90efb8b976fdae
if /i "%effect%" EQU "Fast-Spin" set md5=269a4edf824d68590593108cdd255a1f
set mym1=DarkWiigreenntsc-final.mym
set md5mym1=7700bebff958e0ed005f4a8b308d6b4c
::000000**.app
set version=87
set md5base=7079948c6aed8aae6009e4fdf27c7171
set category=themes
goto:downloadstart

:DarkWii_Green_4.3U
set name=DarkWii Green Theme (4.3U) - %effect%
set wadname=DarkWii_Green_%effect%_4.3U
if /i "%effect%" EQU "No-Spin" set md5=ebe331e05bc8e0eec6b0ab33b2afb462
if /i "%effect%" EQU "Spin" set md5=8229a49a890cdf70f2ea5e8f030997ca
if /i "%effect%" EQU "Fast-Spin" set md5=74fe884437ed8d21ca2b6081cbba86de
set mym1=DarkWiigreenntsc-final.mym
set md5mym1=7700bebff958e0ed005f4a8b308d6b4c
::000000**.app
set version=97
set md5base=f388c9b11543ac2fe0912ab96064ee37
set category=themes
goto:downloadstart

:DarkWii_Green_4.1E
set name=DarkWii Green Theme (4.1E) - %effect%
set wadname=DarkWii_Green_%effect%_4.1E
if /i "%effect%" EQU "No-Spin" set md5=757e20d3a789ae6161b0665837035f89
if /i "%effect%" EQU "Spin" set md5=e71c20893391bfc8c9ae09a12232f7d7
if /i "%effect%" EQU "Fast-Spin" set md5=f568550b9f8cc96f583d2b7570d1f1cf
set mym1=DarkWiigreenpal-final.mym
set md5mym1=ebc41b9910c910a5c7054108c304dcb9
::000000**.app
set version=7e
set md5base=574a3a144971ea0ec61bf8cef8d7ff80
set category=themes
goto:downloadstart

:DarkWii_Green_4.2E
set name=DarkWii Green Theme (4.2E) - %effect%
set wadname=DarkWii_Green_%effect%_4.2E
if /i "%effect%" EQU "No-Spin" set md5=a35358952559ef1b2bd0a7388ba79c26
if /i "%effect%" EQU "Spin" set md5=d0e0545bd9ba761a2c8fe07f339da5c5
if /i "%effect%" EQU "Fast-Spin" set md5=5b2e32e044b1cb65a6d819721255785d
set mym1=DarkWiigreenpal-final.mym
set md5mym1=ebc41b9910c910a5c7054108c304dcb9
::000000**.app
set version=8a
set md5base=7e7994f78941afb51e9a20085deac305
set category=themes
goto:downloadstart

:DarkWii_Green_4.3E
set name=DarkWii Green Theme (4.3E) - %effect%
set wadname=DarkWii_Green_%effect%_4.3E
if /i "%effect%" EQU "No-Spin" set md5=43b0017ec17eb9048474ccda814f46d2
if /i "%effect%" EQU "Spin" set md5=4bb7321ac82c66445b18b5d6d4a22b7c
if /i "%effect%" EQU "Fast-Spin" set md5=b39429af75a096025f783a7958a34b31
set mym1=DarkWiigreenpal-final.mym
set md5mym1=ebc41b9910c910a5c7054108c304dcb9
::000000**.app
set version=9a
set md5base=41310f79497c56850c37676074ee1237
set category=themes
goto:downloadstart

:DarkWii_Green_4.1J
set name=DarkWii Green Theme (4.1J) - %effect%
set wadname=DarkWii_Green_%effect%_4.1J
if /i "%effect%" EQU "No-Spin" set md5=f732de09407f68112a2d2ab5ba1a4ff7
if /i "%effect%" EQU "Spin" set md5=c455874014f58a3af90a3bc428e1cd4e
if /i "%effect%" EQU "Fast-Spin" set md5=ad7500f84aa512824713e7b5c96824b3
set mym1=DarkWiigreenjap-final.mym
set md5mym1=c0ca64e1f0502c138113b681df7ef961
::000000**.app
set version=78
set md5base=f2eadf12d18e793373060222b870057d
set category=themes
goto:downloadstart

:DarkWii_Green_4.2J
set name=DarkWii Green Theme (4.2J) - %effect%
set wadname=DarkWii_Green_%effect%_4.2J
if /i "%effect%" EQU "No-Spin" set md5=03bac7103c8152eeaf65f348a2e575f9
if /i "%effect%" EQU "Spin" set md5=a0fff9dea4fd6a3797d97ca71288d613
if /i "%effect%" EQU "Fast-Spin" set md5=dfa5cac7c13c5189d8a6f7644563b648
set mym1=DarkWiigreenjap-final.mym
set md5mym1=c0ca64e1f0502c138113b681df7ef961
::000000**.app
set version=84
set md5base=b08998e582c48afba3a14f6d9e1e9373
set category=themes
goto:downloadstart

:DarkWii_Green_4.3J
set name=DarkWii Green Theme (4.3J) - %effect%
set wadname=DarkWii_Green_%effect%_4.3J
if /i "%effect%" EQU "No-Spin" set md5=7871bcd74f6cd59b5ca1b6fad02a4512
if /i "%effect%" EQU "Spin" set md5=247a01996c086bbbd45b3be6a14e0f3a
if /i "%effect%" EQU "Fast-Spin" set md5=198803a788e30cf70863854e8f04a437
set mym1=DarkWiigreenjap-final.mym
set md5mym1=c0ca64e1f0502c138113b681df7ef961
::000000**.app
set version=94
set md5base=5b3ee6942a3cda716badbce3665076fc
set category=themes
goto:downloadstart

:DarkWii_Green_4.1K
set name=DarkWii Green Theme (4.1K) - %effect%
set wadname=DarkWii_Green_%effect%_4.1K
if /i "%effect%" EQU "No-Spin" set md5=d57e3b3ff380bafad74269f3ea4df23c
if /i "%effect%" EQU "Spin" set md5=77b71748073c6b8b520cc88245a4de52
if /i "%effect%" EQU "Fast-Spin" set md5=0b892d4b1e86c3fe49fb0564828736ef
set mym1=DarkWii_Green_4.xK.mym
set md5mym1=21b0e77dfc49b0b657b81ff1f075216d
::000000**.app
set version=81
set md5base=7eedbf1a146b29b63edbb55e04f81f98
set category=themes
goto:downloadstart

:DarkWii_Green_4.2K
set name=DarkWii Green Theme (4.2K) - %effect%
set wadname=DarkWii_Green_%effect%_4.2K
if /i "%effect%" EQU "No-Spin" set md5=3c22bd52f4c47f5bd96c503e0d7d7c04
if /i "%effect%" EQU "Spin" set md5=caa369169cacc941c8b60eb3731deae7
if /i "%effect%" EQU "Fast-Spin" set md5=8f88c76c09ef8d7c4a7642cb53e9620f
set mym1=DarkWii_Green_4.xK.mym
set md5mym1=21b0e77dfc49b0b657b81ff1f075216d
::000000**.app
set version=8d
set md5base=9d72a1966370e44cb4c456c17a077bec
set category=themes
goto:downloadstart

:DarkWii_Green_4.3K
set name=DarkWii Green Theme (4.3K) - %effect%
set wadname=DarkWii_Green_%effect%_4.3K
if /i "%effect%" EQU "No-Spin" set md5=0e1dede7efd6028a3fe89009a69e69bd
if /i "%effect%" EQU "Spin" set md5=d5aa5cbbd1cfd9a9cb9300e383763cc4
if /i "%effect%" EQU "Fast-Spin" set md5=79a4a0f74108a46b44abf8435beace33
set mym1=DarkWii_Green_4.xK.mym
set md5mym1=21b0e77dfc49b0b657b81ff1f075216d
::000000**.app
set version=9d
set md5base=e6f2b0d4d5e0c095895f186009bf9516
set category=themes
goto:downloadstart

::---Dark Wii Blue Themes and SM WADs----

:DarkWii_Blue_4.1U
set name=DarkWii Blue Theme (4.1U) - %effect%
set wadname=DarkWii_Blue_%effect%_4.1U
if /i "%effect%" EQU "No-Spin" set md5=8d9ae1593265d67421838b51fb65cbc8
if /i "%effect%" EQU "Spin" set md5=89ca33042566624b5b53498224b4dd4c
if /i "%effect%" EQU "Fast-Spin" set md5=4d6778ee13de0eb80445128a902d5b51
set mym1=darkwii_blue_us.mym
set md5mym1=17501139b17f405f301bb3faaeca264d
::000000**.app
set version=7b
set md5base=6b939de8222800733f4c44ae4eadb325
set category=themes
goto:downloadstart

:DarkWii_Blue_4.2U
set name=DarkWii Blue Theme (4.2U) - %effect%
set wadname=DarkWii_Blue_%effect%_4.2U
if /i "%effect%" EQU "No-Spin" set md5=c66b1b53bdf4b88d0837327578605c50
if /i "%effect%" EQU "Spin" set md5=3e4b40968cf2c6048713cf0d3f4a4584
if /i "%effect%" EQU "Fast-Spin" set md5=2b8c228fe1b3e5ef8e0c8a97c56efb8b
set mym1=darkwii_blue_us.mym
set md5mym1=17501139b17f405f301bb3faaeca264d
::000000**.app
set version=87
set md5base=7079948c6aed8aae6009e4fdf27c7171
set category=themes
goto:downloadstart

:DarkWii_Blue_4.3U
set name=DarkWii Blue Theme (4.3U) - %effect%
set wadname=DarkWii_Blue_%effect%_4.3U
if /i "%effect%" EQU "No-Spin" set md5=0bdbc6629650b12c6dcd301aea226325
if /i "%effect%" EQU "Spin" set md5=7ae92e8f9c2b3961de82b8b52b2ab783
if /i "%effect%" EQU "Fast-Spin" set md5=17110b082cf3a10abd74e3492b022593
set mym1=darkwii_blue_us.mym
set md5mym1=17501139b17f405f301bb3faaeca264d
::000000**.app
set version=97
set md5base=f388c9b11543ac2fe0912ab96064ee37
set category=themes
goto:downloadstart

:DarkWii_Blue_4.1E
set name=DarkWii Blue Theme (4.1E) - %effect%
set wadname=DarkWii_Blue_%effect%_4.1E
if /i "%effect%" EQU "No-Spin" set md5=e4aaac309567bc296e1f367cd6f3e094
if /i "%effect%" EQU "Spin" set md5=274ca415d6768f1652481e052f6d82b3
if /i "%effect%" EQU "Fast-Spin" set md5=3e8e4336ead843c9196739e2d77b309e
set mym1=darkwii_blue_pal.mym
set md5mym1=1f41360061e112a987a458609fe72b8c
::000000**.app
set version=7e
set md5base=574a3a144971ea0ec61bf8cef8d7ff80
set category=themes
goto:downloadstart

:DarkWii_Blue_4.2E
set name=DarkWii Blue Theme (4.2E) - %effect%
set wadname=DarkWii_Blue_%effect%_4.2E
if /i "%effect%" EQU "No-Spin" set md5=5ae85dd6fb4fe49b9b688a9b5531461c
if /i "%effect%" EQU "Spin" set md5=2c4ce91117fa0d568e7c663cf86a50ae
if /i "%effect%" EQU "Fast-Spin" set md5=baee7cefd598bb9c9432686febb40c86
set mym1=darkwii_blue_pal.mym
set md5mym1=1f41360061e112a987a458609fe72b8c
::000000**.app
set version=8a
set md5base=7e7994f78941afb51e9a20085deac305
set category=themes
goto:downloadstart

:DarkWii_Blue_4.3E
set name=DarkWii Blue Theme (4.3E) - %effect%
set wadname=DarkWii_Blue_%effect%_4.3E
if /i "%effect%" EQU "No-Spin" set md5=6550e677324ec4e0e28d76ce10d292f8
if /i "%effect%" EQU "Spin" set md5=7dceafcfaf51e3b69faf39bdc9b374ac
if /i "%effect%" EQU "Fast-Spin" set md5=d6caa2c1a5036323ceaa9534d4e133d0
set mym1=darkwii_blue_pal.mym
set md5mym1=1f41360061e112a987a458609fe72b8c
::000000**.app
set version=9a
set md5base=41310f79497c56850c37676074ee1237
set category=themes
goto:downloadstart

:DarkWii_Blue_4.1J
set name=DarkWii Blue Theme (4.1J) - %effect%
set wadname=DarkWii_Blue_%effect%_4.1J
if /i "%effect%" EQU "No-Spin" set md5=ad5d712ac759c3141ca46934427a9593
if /i "%effect%" EQU "Spin" set md5=2c0353c361d72310df4416720474414b
if /i "%effect%" EQU "Fast-Spin" set md5=5eb34e20d4f8dc90eb02f22cce4a39ee
set mym1=darkwii_blue_jap.mym
set md5mym1=c2d2091d4bedb051c57741b67e4c31a1
::000000**.app
set version=78
set md5base=f2eadf12d18e793373060222b870057d
set category=themes
goto:downloadstart

:DarkWii_Blue_4.2J
set name=DarkWii Blue Theme (4.2J) - %effect%
set wadname=DarkWii_Blue_%effect%_4.2J
if /i "%effect%" EQU "No-Spin" set md5=525e4927ae88068d4e745f8f25fbea70
if /i "%effect%" EQU "Spin" set md5=d4bdef268af742ad99c4d36e85ed6053
if /i "%effect%" EQU "Fast-Spin" set md5=7f37ccea1f35326f1fc428fe55e0a7c6
set mym1=darkwii_blue_jap.mym
set md5mym1=c2d2091d4bedb051c57741b67e4c31a1
::000000**.app
set version=84
set md5base=b08998e582c48afba3a14f6d9e1e9373
set category=themes
goto:downloadstart

:DarkWii_Blue_4.3J
set name=DarkWii Blue Theme (4.3J) - %effect%
set wadname=DarkWii_Blue_%effect%_4.3J
if /i "%effect%" EQU "No-Spin" set md5=974b227b47bd942e82c365d2b9740990
if /i "%effect%" EQU "Spin" set md5=0991a3bcf8912e2d04344e0f3089c2a2
if /i "%effect%" EQU "Fast-Spin" set md5=7f0997acc99bef8cfdc0ed6fb66a42bd
set mym1=darkwii_blue_jap.mym
set md5mym1=c2d2091d4bedb051c57741b67e4c31a1
::000000**.app
set version=94
set md5base=5b3ee6942a3cda716badbce3665076fc
set category=themes
goto:downloadstart

:DarkWii_Blue_4.1K
set name=DarkWii Blue Theme (4.1K) - %effect%
set wadname=DarkWii_Blue_%effect%_4.1K
if /i "%effect%" EQU "No-Spin" set md5=76773680b0d89ab22e3b728f8d34db69
if /i "%effect%" EQU "Spin" set md5=115e7d4a930daa2ecae3c1f2667b2b89
if /i "%effect%" EQU "Fast-Spin" set md5=5e3b5a7560b36b523eb5c9e11969597c
set mym1=darkwii_blue_kor.mym
set md5mym1=9ae1d9f706c1d5da0e99f84f5b19b9fd
::000000**.app
set version=81
set md5base=7eedbf1a146b29b63edbb55e04f81f98
set category=themes
goto:downloadstart

:DarkWii_Blue_4.2K
set name=DarkWii Blue Theme (4.2K) - %effect%
set wadname=DarkWii_Blue_%effect%_4.2K
if /i "%effect%" EQU "No-Spin" set md5=5b92074b98d1e232a9b2476d96b1beac
if /i "%effect%" EQU "Spin" set md5=f26dbe88249600aea58a6495c3966720
if /i "%effect%" EQU "Fast-Spin" set md5=35b3d62410951de36c7a78f8eceea959
set mym1=darkwii_blue_kor.mym
set md5mym1=9ae1d9f706c1d5da0e99f84f5b19b9fd
::000000**.app
set version=8d
set md5base=9d72a1966370e44cb4c456c17a077bec
set category=themes
goto:downloadstart

:DarkWii_Blue_4.3K
set name=DarkWii Blue Theme (4.3K) - %effect%
set wadname=DarkWii_Blue_%effect%_4.3K
if /i "%effect%" EQU "No-Spin" set md5=9cf6fb0938c15986b45119c4f76918f3
if /i "%effect%" EQU "Spin" set md5=ab26528c080022550c38ba4b3457b998
if /i "%effect%" EQU "Fast-Spin" set md5=ece83111f518d4715ac74cb0ad398bb3
set mym1=darkwii_blue_kor.mym
set md5mym1=9ae1d9f706c1d5da0e99f84f5b19b9fd
::000000**.app
set version=9d
set md5base=e6f2b0d4d5e0c095895f186009bf9516
set category=themes
goto:downloadstart


::----------------------------------


:SM4.3U-DWB
set name=System Menu 4.3U with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.3U_v513_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=208184944e9e40e26cccb56ba9ded95e
if /i "%effect%" EQU "Spin" set md5=e04ae9125535b4b642f98f0d8984c986
if /i "%effect%" EQU "Fast-Spin" set md5=de8353a1f452e3847098e53e2c13f648
set md5alt=%md5%
set basewad=SystemMenu_4.3U_v513
set basecios=%basewad%
set md5base=4f5c63e3fd1bf732067fa4c439c68a97
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_blue_us.mym
set md5mym1=17501139b17f405f301bb3faaeca264d
set version=513
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2U-DWB
set name=System Menu 4.2U with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.2U_v481_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=f220ad7d69e2f103b600decf6d343869
if /i "%effect%" EQU "Spin" set md5=97cf290e432f0fdc3d710c4172325506
if /i "%effect%" EQU "Fast-Spin" set md5=296c8af69a17d07dc90d34561031eeec
set md5alt=%md5%
set basewad=SystemMenu_4.2U_v481
set basecios=%basewad%
set md5base=4ac52b981845473bd3655e4836d7442b
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_blue_us.mym
set md5mym1=17501139b17f405f301bb3faaeca264d
set version=481
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1U-DWB
set name=System Menu 4.1U with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.1U_v449_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=b7cdcb9ec926c1a6132c15993dcd5a5f
if /i "%effect%" EQU "Spin" set md5=41fd9a4e0d0ceb62de652d67facc2a40
if /i "%effect%" EQU "Fast-Spin" set md5=9f91138310f0c81b23ef20df60e7fd91
set md5alt=%md5%
set basewad=SystemMenu_4.1U_v449
set basecios=%basewad%
set md5base=38a95a9acd257265294be41b796f6239
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_blue_us.mym
set md5mym1=17501139b17f405f301bb3faaeca264d
set version=449
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3E-DWB
set name=System Menu 4.3E with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.3E_v514_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=0bd134b4c35655034a93991e7f90208a
if /i "%effect%" EQU "Spin" set md5=2bc34415a42b884a1050e19139110b24
if /i "%effect%" EQU "Fast-Spin" set md5=f4f70e0fdc5928f72054d3e4f318a079
set md5alt=%md5%
set basewad=SystemMenu_4.3E_v514
set basecios=%basewad%
set md5base=2ec2e6fbdfc52fe5174749e7032f1bad
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_blue_pal.mym
set md5mym1=1f41360061e112a987a458609fe72b8c
set version=514
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2E-DWB
set name=System Menu 4.2E with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.2E_v482_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=632442234b60e056c39b47cbeb8c6c85
if /i "%effect%" EQU "Spin" set md5=2ac0effb30023c7e70f633c8208ad96e
if /i "%effect%" EQU "Fast-Spin" set md5=722111b63a47301a36b2b8022bac8118
set md5alt=%md5%
set basewad=SystemMenu_4.2E_v482
set basecios=%basewad%
set md5base=7d77be8b6df5ac893d24652db33d02cd
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_blue_pal.mym
set md5mym1=1f41360061e112a987a458609fe72b8c
set version=482
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1E-DWB
set name=System Menu 4.1E with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.1E_v450_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=107db0a83d8a99f35274332c3b6ed47f
if /i "%effect%" EQU "Spin" set md5=d1001f7ee413b26693bbbc94574c8542
if /i "%effect%" EQU "Fast-Spin" set md5=dbcf12cfdb9530b994124bc6a1afb8c9
set md5alt=%md5%
set basewad=SystemMenu_4.1E_v450
set basecios=%basewad%
set md5base=688cc78b8eab4e30da04f01a81a3739f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_blue_pal.mym
set md5mym1=1f41360061e112a987a458609fe72b8c
set version=450
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3J-DWB
set name=System Menu 4.3J with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.3J_v512_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=969c66b82728206e0a98b6ff41055675
if /i "%effect%" EQU "Spin" set md5=e42de3836be79fd17c4f5d87a4ccae35
if /i "%effect%" EQU "Fast-Spin" set md5=8bc40428d6a4b913269ca1c60992a601
set md5alt=%md5%
set basewad=SystemMenu_4.3J_v512
set basecios=%basewad%
set md5base=df67ed4bd8f8f117741fef7952ee5c17
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_blue_jap.mym
set md5mym1=c2d2091d4bedb051c57741b67e4c31a1
set version=512
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2J-DWB
set name=System Menu 4.2J with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.2J_v480_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=be9adeb9cbf7b78c58ff5d2f81647be4
if /i "%effect%" EQU "Spin" set md5=d6192542ae5bf177a76eb8304b056366
if /i "%effect%" EQU "Fast-Spin" set md5=c0d59b77ea9e4df90ce3e4711263a8a7
set md5alt=%md5%
set basewad=SystemMenu_4.2J_v480
set basecios=%basewad%
set md5base=0413a9aed208b193fea85db908bbdabf
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_blue_jap.mym
set md5mym1=c2d2091d4bedb051c57741b67e4c31a1
set version=480
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1J-DWB
set name=System Menu 4.1J with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.1J_v448_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=93ed492b93c10aea51bb70c74cc7dd0f
if /i "%effect%" EQU "Spin" set md5=a44e1e4c6b25f37bd4fdd369b6e0492a
if /i "%effect%" EQU "Fast-Spin" set md5=295633593c94a5412ea112ea56c8b9d3
set md5alt=%md5%
set basewad=SystemMenu_4.1J_v448
set basecios=%basewad%
set md5base=6edb4b3f7ca26c643c6bc662d159ec2e
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_blue_jap.mym
set md5mym1=c2d2091d4bedb051c57741b67e4c31a1
set version=448
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart


:SM4.3K-DWB
set name=System Menu 4.3K with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.3K_v518_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=4d303c06467f7b1aad840e7940258659
if /i "%effect%" EQU "Spin" set md5=4ca5ff28d317316e5ded3df505d70551
if /i "%effect%" EQU "Fast-Spin" set md5=8c417199a0ecb19098cced4ee2644a7c
set md5alt=%md5%
set basewad=SystemMenu_4.3K_v518
set basecios=%basewad%
set md5base=6ed8f9e75b0a54eacfbacce57c20136d
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_blue_kor.mym
set md5mym1=9ae1d9f706c1d5da0e99f84f5b19b9fd
set version=518
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2K-DWB
set name=System Menu 4.2K with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.2K_v486_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=ab776460950c7cf69e1a6feea5f3ca91
if /i "%effect%" EQU "Spin" set md5=fe522d8e7d86c4de5dc74e510889058e
if /i "%effect%" EQU "Fast-Spin" set md5=50cdc5a0b4ed6709301a16daea943406
set md5alt=%md5%
set basewad=SystemMenu_4.2K_v486
set basecios=%basewad%
set md5base=40c0bf90ea07b02d610edae1d7aea39f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_blue_kor.mym
set md5mym1=9ae1d9f706c1d5da0e99f84f5b19b9fd
set version=486
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1K-DWB
set name=System Menu 4.1K with Dark Wii Blue Theme - %effect%
set wadname=SystemMenu_4.1K_v454_DarkWiiBlue_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=ce8c62e364755262ea039db0956cfde1
if /i "%effect%" EQU "Spin" set md5=061d7bac145dcc619bff22e028790319
if /i "%effect%" EQU "Fast-Spin" set md5=c2573966295ea908d779806ee36f74ce
set md5alt=%md5%
set basewad=SystemMenu_4.1K_v454
set basecios=%basewad%
set md5base=c0e5d5c4914e76e7df7495ccf28ef869
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_blue_kor.mym
set md5mym1=9ae1d9f706c1d5da0e99f84f5b19b9fd
set version=454
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart



::---Dark Wii Orange Themes and SM WADs----

:darkwii_orange_4.1U
set name=DarkWii Orange Theme (4.1U) - %effect%
set wadname=darkwii_orange_%effect%_4.1U
if /i "%effect%" EQU "No-Spin" set md5=182f9ab83657ef9686748c9ee7a9d1a5
if /i "%effect%" EQU "Spin" set md5=c3b081369bf61806ca92eaf415d413f4
if /i "%effect%" EQU "Fast-Spin" set md5=8a2a79eebea6de941ed70897b605ea89
set mym1=darkwii_orange_us.mym
set md5mym1=b7ced216faff9ddf08f0562a015db184
::000000**.app
set version=7b
set md5base=6b939de8222800733f4c44ae4eadb325
set category=themes
goto:downloadstart

:darkwii_orange_4.2U
set name=DarkWii Orange Theme (4.2U) - %effect%
set wadname=darkwii_orange_%effect%_4.2U
if /i "%effect%" EQU "No-Spin" set md5=b2d56a6caeddf9649b1b8b4f891824de
if /i "%effect%" EQU "Spin" set md5=335acf5e2b24993f5cc6b9cf010d0178
if /i "%effect%" EQU "Fast-Spin" set md5=c91baaab09749ad6e3134423d31caae2
set mym1=darkwii_orange_us.mym
set md5mym1=b7ced216faff9ddf08f0562a015db184
::000000**.app
set version=87
set md5base=7079948c6aed8aae6009e4fdf27c7171
set category=themes
goto:downloadstart

:darkwii_orange_4.3U
set name=DarkWii Orange Theme (4.3U) - %effect%
set wadname=darkwii_orange_%effect%_4.3U
if /i "%effect%" EQU "No-Spin" set md5=8b7d60fcb44d56ca04e7ffa2c2afc16b
if /i "%effect%" EQU "Spin" set md5=29ab50721b49366451f445db1f9b190c
if /i "%effect%" EQU "Fast-Spin" set md5=83038f2915f6d4c52e53ec478876eb53
set mym1=darkwii_orange_us.mym
set md5mym1=b7ced216faff9ddf08f0562a015db184
::000000**.app
set version=97
set md5base=f388c9b11543ac2fe0912ab96064ee37
set category=themes
goto:downloadstart

:darkwii_orange_4.1E
set name=DarkWii Orange Theme (4.1E) - %effect%
set wadname=darkwii_orange_%effect%_4.1E
if /i "%effect%" EQU "No-Spin" set md5=d5623a36f737c8aa257e2fa69a23ebcc
if /i "%effect%" EQU "Spin" set md5=2fac1a3b125aa087c478c1dc8ac00e24
if /i "%effect%" EQU "Fast-Spin" set md5=ac305f7c034a09f6cdc41769aeb7dc06
set mym1=darkwii_orange_pal.mym
set md5mym1=7a12ec9293ed353879b14d089fdc4f94
::000000**.app
set version=7e
set md5base=574a3a144971ea0ec61bf8cef8d7ff80
set category=themes
goto:downloadstart

:darkwii_orange_4.2E
set name=DarkWii Orange Theme (4.2E) - %effect%
set wadname=darkwii_orange_%effect%_4.2E
if /i "%effect%" EQU "No-Spin" set md5=368490ba87d60b1de5131d23fe4d5a2a
if /i "%effect%" EQU "Spin" set md5=1a7c4598b8e11519ec29606fba889ef4
if /i "%effect%" EQU "Fast-Spin" set md5=e079ad7aaafacaad1dd9fc40bd85e521
set mym1=darkwii_orange_pal.mym
set md5mym1=7a12ec9293ed353879b14d089fdc4f94
::000000**.app
set version=8a
set md5base=7e7994f78941afb51e9a20085deac305
set category=themes
goto:downloadstart

:darkwii_orange_4.3E
set name=DarkWii Orange Theme (4.3E) - %effect%
set wadname=darkwii_orange_%effect%_4.3E
if /i "%effect%" EQU "No-Spin" set md5=1ddfe43b14f051238498569bf22ae5e5
if /i "%effect%" EQU "Spin" set md5=f328c8a0d5f063958e6aa59dd0d00cc8
if /i "%effect%" EQU "Fast-Spin" set md5=a5646376ace20d785991be06ff98f68c
set mym1=darkwii_orange_pal.mym
set md5mym1=7a12ec9293ed353879b14d089fdc4f94
::000000**.app
set version=9a
set md5base=41310f79497c56850c37676074ee1237
set category=themes
goto:downloadstart

:darkwii_orange_4.1J
set name=DarkWii Orange Theme (4.1J) - %effect%
set wadname=darkwii_orange_%effect%_4.1J
if /i "%effect%" EQU "No-Spin" set md5=b7d9374de99a544bedf432bc80fefcde
if /i "%effect%" EQU "Spin" set md5=46674210e56fe6dd3445b0c39f8a4713
if /i "%effect%" EQU "Fast-Spin" set md5=48992863043ff22c3a5673eb9e895832
set mym1=darkwii_orange_jap.mym
set md5mym1=3819f4455aeb151cf3d695be2eb39f8d
::000000**.app
set version=78
set md5base=f2eadf12d18e793373060222b870057d
set category=themes
goto:downloadstart

:darkwii_orange_4.2J
set name=DarkWii Orange Theme (4.2J) - %effect%
set wadname=darkwii_orange_%effect%_4.2J
if /i "%effect%" EQU "No-Spin" set md5=b82f57f2ea4f6be39818b90dd444d6ff
if /i "%effect%" EQU "Spin" set md5=a3d9a36be73d59b60719c5e1c9aded80
if /i "%effect%" EQU "Fast-Spin" set md5=47a1e88fdfc13186d084fb748ccf6e87
set mym1=darkwii_orange_jap.mym
set md5mym1=3819f4455aeb151cf3d695be2eb39f8d
::000000**.app
set version=84
set md5base=b08998e582c48afba3a14f6d9e1e9373
set category=themes
goto:downloadstart

:darkwii_orange_4.3J
set name=DarkWii Orange Theme (4.3J) - %effect%
set wadname=darkwii_orange_%effect%_4.3J
if /i "%effect%" EQU "No-Spin" set md5=8f7128135c4692e4bb76b6d7ea92f242
if /i "%effect%" EQU "Spin" set md5=40b07305665167b3cbed44bb980b6b99
if /i "%effect%" EQU "Fast-Spin" set md5=a3cd673b496c9381444b5c8ad35ff633
set mym1=darkwii_orange_jap.mym
set md5mym1=3819f4455aeb151cf3d695be2eb39f8d
::000000**.app
set version=94
set md5base=5b3ee6942a3cda716badbce3665076fc
set category=themes
goto:downloadstart

:darkwii_orange_4.1K
set name=DarkWii Orange Theme (4.1K) - %effect%
set wadname=darkwii_orange_%effect%_4.1K
if /i "%effect%" EQU "No-Spin" set md5=391b4441ffa2d268b2a07d2a7828d50d
if /i "%effect%" EQU "Spin" set md5=eddeb1d07c5276ee8080441a2c3bb0dc
if /i "%effect%" EQU "Fast-Spin" set md5=6232bcce9908e52b029035aae7eeaa77
set mym1=darkwii_orange_kor.mym
set md5mym1=6ed046f6a4e0463bf09efcef464082d6
::000000**.app
set version=81
set md5base=7eedbf1a146b29b63edbb55e04f81f98
set category=themes
goto:downloadstart

:darkwii_orange_4.2K
set name=DarkWii Orange Theme (4.2K) - %effect%
set wadname=darkwii_orange_%effect%_4.2K
if /i "%effect%" EQU "No-Spin" set md5=f02a1fec1e4dead15ecfe16772db84c3
if /i "%effect%" EQU "Spin" set md5=ccd7234c7531a90184363e67ed20d64c
if /i "%effect%" EQU "Fast-Spin" set md5=fed85eba8bd1f389f326ff71ac93a97f
set mym1=darkwii_orange_kor.mym
set md5mym1=6ed046f6a4e0463bf09efcef464082d6
::000000**.app
set version=8d
set md5base=9d72a1966370e44cb4c456c17a077bec
set category=themes
goto:downloadstart

:darkwii_orange_4.3K
set name=DarkWii Orange Theme (4.3K) - %effect%
set wadname=darkwii_orange_%effect%_4.3K
if /i "%effect%" EQU "No-Spin" set md5=e6c000cc6aa319179a3ed98d6960504c
if /i "%effect%" EQU "Spin" set md5=bea48b7f5f452f73abd2485adbaf72c6
if /i "%effect%" EQU "Fast-Spin" set md5=17db3ac98b7832bb1a473cd335a2cbcd
set mym1=darkwii_orange_kor.mym
set md5mym1=6ed046f6a4e0463bf09efcef464082d6
::000000**.app
set version=9d
set md5base=e6f2b0d4d5e0c095895f186009bf9516
set category=themes
goto:downloadstart


::----------------------------------


:SM4.3U-DWO
set name=System Menu 4.3U with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.3U_v513_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=1616d0c37fc1e30480bf22f49578c49d
if /i "%effect%" EQU "Spin" set md5=6ce113c1160465ceb91ac9242139398b
if /i "%effect%" EQU "Fast-Spin" set md5=af561c3c644bb4e49b39cd721e57097a
set md5alt=%md5%
set basewad=SystemMenu_4.3U_v513
set basecios=%basewad%
set md5base=4f5c63e3fd1bf732067fa4c439c68a97
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_orange_us.mym
set md5mym1=b7ced216faff9ddf08f0562a015db184
set version=513
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2U-DWO
set name=System Menu 4.2U with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.2U_v481_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=30b6a14897a13dd29c9c1b88c108d99c
if /i "%effect%" EQU "Spin" set md5=d85e810a99a5328da77ce4330e071add
if /i "%effect%" EQU "Fast-Spin" set md5=3bf4858719cf59cc31e43b4baef51246
set md5alt=%md5%
set basewad=SystemMenu_4.2U_v481
set basecios=%basewad%
set md5base=4ac52b981845473bd3655e4836d7442b
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_orange_us.mym
set md5mym1=b7ced216faff9ddf08f0562a015db184
set version=481
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1U-DWO
set name=System Menu 4.1U with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.1U_v449_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=24cfd3ee342b602bb08deef5aef28b61
if /i "%effect%" EQU "Spin" set md5=21949b4326683f7c78688d518f849773
if /i "%effect%" EQU "Fast-Spin" set md5=a7ca64d53b383d2f21b379f232a3beee
set md5alt=%md5%
set basewad=SystemMenu_4.1U_v449
set basecios=%basewad%
set md5base=38a95a9acd257265294be41b796f6239
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_orange_us.mym
set md5mym1=b7ced216faff9ddf08f0562a015db184
set version=449
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3E-DWO
set name=System Menu 4.3E with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.3E_v514_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=63753eccf145e973e674528305051912
if /i "%effect%" EQU "Spin" set md5=e71fc8e9fd5ea6fcf854d22b880300a6
if /i "%effect%" EQU "Fast-Spin" set md5=f5dbb9ba092d7f82dabe594e29086fb5
set md5alt=%md5%
set basewad=SystemMenu_4.3E_v514
set basecios=%basewad%
set md5base=2ec2e6fbdfc52fe5174749e7032f1bad
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_orange_pal.mym
set md5mym1=7a12ec9293ed353879b14d089fdc4f94
set version=514
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2E-DWO
set name=System Menu 4.2E with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.2E_v482_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=deaa283ad0527411c85e1c4a1c7ddae7
if /i "%effect%" EQU "Spin" set md5=be416cca488f3f32a9c3e3f53c4ceae8
if /i "%effect%" EQU "Fast-Spin" set md5=eef38132575712ee082132e44dc399c6
set md5alt=%md5%
set basewad=SystemMenu_4.2E_v482
set basecios=%basewad%
set md5base=7d77be8b6df5ac893d24652db33d02cd
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_orange_pal.mym
set md5mym1=7a12ec9293ed353879b14d089fdc4f94
set version=482
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1E-DWO
set name=System Menu 4.1E with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.1E_v450_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=e5491da4798ae3a1a331466d76dca65a
if /i "%effect%" EQU "Spin" set md5=edd758b702271b70f800779cd1166e77
if /i "%effect%" EQU "Fast-Spin" set md5=0ac3b1d195d3584ab00102700738725d
set md5alt=%md5%
set basewad=SystemMenu_4.1E_v450
set basecios=%basewad%
set md5base=688cc78b8eab4e30da04f01a81a3739f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_orange_pal.mym
set md5mym1=7a12ec9293ed353879b14d089fdc4f94
set version=450
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.3J-DWO
set name=System Menu 4.3J with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.3J_v512_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=a512d89c9f6e0197188e1316263b0aa1
if /i "%effect%" EQU "Spin" set md5=a88214e21b5189726457a7bb41a338c9
if /i "%effect%" EQU "Fast-Spin" set md5=834447e2507cba7cc072538f5074f8cc
set md5alt=%md5%
set basewad=SystemMenu_4.3J_v512
set basecios=%basewad%
set md5base=df67ed4bd8f8f117741fef7952ee5c17
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_orange_jap.mym
set md5mym1=3819f4455aeb151cf3d695be2eb39f8d
set version=512
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2J-DWO
set name=System Menu 4.2J with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.2J_v480_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=f78688d354de4d6e6c972efca57df520
if /i "%effect%" EQU "Spin" set md5=1a376fcf5ba77616ec660b6d9f01225a
if /i "%effect%" EQU "Fast-Spin" set md5=5aec6c34f60f1f68daeb8f569e44a269
set md5alt=%md5%
set basewad=SystemMenu_4.2J_v480
set basecios=%basewad%
set md5base=0413a9aed208b193fea85db908bbdabf
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_orange_jap.mym
set md5mym1=3819f4455aeb151cf3d695be2eb39f8d
set version=480
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1J-DWO
set name=System Menu 4.1J with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.1J_v448_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=016b3ec82d42c33daae211b4838a19e9
if /i "%effect%" EQU "Spin" set md5=32797c1bd305036fa54682330b0d66c1
if /i "%effect%" EQU "Fast-Spin" set md5=d3c1ccebf3a92ebf9c8f6b2f586102ae
set md5alt=%md5%
set basewad=SystemMenu_4.1J_v448
set basecios=%basewad%
set md5base=6edb4b3f7ca26c643c6bc662d159ec2e
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_orange_jap.mym
set md5mym1=3819f4455aeb151cf3d695be2eb39f8d
set version=448
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart


:SM4.3K-DWO
set name=System Menu 4.3K with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.3K_v518_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=2573ecc18d5379f3ba14153e3752c682
if /i "%effect%" EQU "Spin" set md5=cc8b303c3bfc8ea58ab40382976c375d
if /i "%effect%" EQU "Fast-Spin" set md5=e5ad14286b652c3899b611bf9995e5aa
set md5alt=%md5%
set basewad=SystemMenu_4.3K_v518
set basecios=%basewad%
set md5base=6ed8f9e75b0a54eacfbacce57c20136d
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_orange_kor.mym
set md5mym1=6ed046f6a4e0463bf09efcef464082d6
set version=518
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.2K-DWO
set name=System Menu 4.2K with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.2K_v486_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=87b78be742ddc981ff1cd3b02222a6f6
if /i "%effect%" EQU "Spin" set md5=1420e3978c64b2f1ba086138e5451dff
if /i "%effect%" EQU "Fast-Spin" set md5=0a0272f19ceac321b207de57dcdc12b7
set md5alt=%md5%
set basewad=SystemMenu_4.2K_v486
set basecios=%basewad%
set md5base=40c0bf90ea07b02d610edae1d7aea39f
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_orange_kor.mym
set md5mym1=6ed046f6a4e0463bf09efcef464082d6
set version=486
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart

:SM4.1K-DWO
set name=System Menu 4.1K with Dark Wii Orange Theme - %effect%
set wadname=SystemMenu_4.1K_v454_DarkWiiOrange_%effect%
set ciosslot=unchanged
if /i "%effect%" EQU "No-Spin" set md5=bff33e9b51e024e9adcc272bc9e461a3
if /i "%effect%" EQU "Spin" set md5=b87e84bbb0a822ae1c75421b0338d62b
if /i "%effect%" EQU "Fast-Spin" set md5=e58c092cfa074648e6a9c0397b03f10a
set md5alt=%md5%
set basewad=SystemMenu_4.1K_v454
set basecios=%basewad%
set md5base=c0e5d5c4914e76e7df7495ccf28ef869
set md5basealt=%md5base%
set code1=00000001
set code2=00000002
set mym1=darkwii_orange_kor.mym
set md5mym1=6ed046f6a4e0463bf09efcef464082d6
set version=454
set lastbasemodule=00000001
set category=SMTHEME
goto:downloadstart


::--------------------------------------Custom Guide (for DL Wizard only)-------------------------------------

:guide
set installwads=

if /i "%MENU1%" EQU "U" goto:USBguide
if /i "%MENU1%" EQU "H" goto:HMguide

:guidestart
set guidename=ModMiiGuide.txt


if /i "%MENU1%" EQU "SU" set guidename=ModMii_sysCheck_Updater_Guide.txt


SET COUNT7=1
cls
if /i "%SETTINGS%" EQU "G" echo Generando Guia, por favor espere.
if /i "%SETTINGS%" NEQ "G" echo Generando Guia, por favor espere, su descarga se iniciara en breve.

if not exist "%DRIVE%" mkdir "%DRIVE%" >nul
if not exist "%Drive%"\%guidename% goto:norename
SET /a COUNT6=%COUNT6%+1
if exist "%DRIVE%"\%guidename:~0,-4%%COUNT6%.txt goto:guide
move /y "%Drive%"\%guidename% "%DRIVE%"\%guidename:~0,-4%%COUNT6%.txt >nul
:norename



echo ModMii %currentversion% Gu�a personalizada>"%Drive%"\%guidename%
echo Generada el %DATE% - %TIME%>>"%Drive%"\%guidename%
echo Comprobar si hay actualizaciones en tinyurl.com/ModMiiNow>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Esta Gu�a se ha generado con los siguientes par�metros:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
if /i "%VIRGIN%" EQU "Y" echo                * Instalar y\o actualizar todos los softmods recomendados>>"%Drive%"\%guidename%

if /i "%REGION%" EQU "K" goto:Koreansetting
if /i "%FIRMSTART%" NEQ "o" echo                * El firmware actual es %FIRMSTART%%REGION%>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo                * El firmware actual es menor que 2.2%REGION%>>"%Drive%"\%guidename%
goto:skipKoreansetting

echo .>>"%Drive%"\%guidename%

:Koreansetting
if /i "%FIRMSTART%" NEQ "o" echo                * El firmware actual es %FIRMSTART%K>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo                * El firmware actual es menor que 2.2K (Las Wii Coreanas son hackeadas diferente a las Wii de otras regiones.)>>"%Drive%"\%guidename%
:skipKoreansetting
echo                * El firmware deseado es %FIRM%%REGION%>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%PIC%" EQU "Y" echo                * Instalar Canal Fotos>>"%Drive%"\%guidename%
if /i "%NET%" EQU "Y" echo                * Instalar Canal Internet>>"%Drive%"\%guidename%
if /i "%WEATHER%" EQU "Y" echo                * Instalar Canal del Tiempo>>"%Drive%"\%guidename%
if /i "%NEWS%" EQU "Y" echo                * Instale canal de noticias>>"%Drive%"\%guidename%
if /i "%MIIQ%" EQU "Y" echo                * Instalar canal Mii>>"%Drive%"\%guidename%
if /i "%Shop%" EQU "Y" echo                * Instalar Canal Tienda (y IOS56)>>"%Drive%"\%guidename%
if /i "%Speak%" EQU "Y" echo                * Instalar canal Wii Speak>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%VIRGIN%" EQU "Y" goto:skipvirginstandard
if /i "%HM%" EQU "*" echo                * Instalar y\o actualizar el Homebrew Channel y BootMii>>"%Drive%"\%guidename%
if /i "%RECCIOS%" NEQ "Y" goto:smallskip
if /i "%CMIOSOPTION%" EQU "on" (echo                * Instale cIOSs recomendado y cMIOS>>"%Drive%"\%guidename%) else (echo                * Instalar cIOSs recomendado>>"%Drive%"\%guidename%)
:smallskip
if /i "%yawm%" EQU "*" echo                * Descargar Sin embargo, otro mod Wad Manager (YAWMM)>>"%Drive%"\%guidename%
if /i "%IOS236Installer%" EQU "*" echo                * Instalar IOS236 >>"%Drive%"\%guidename%
if /i "%pri%" EQU "*" echo                * Instalar y\o actualizar Priiloader>>"%Drive%"\%guidename%
:skipvirginstandard

if /i "%ThemeSelection%" EQU "R" echo                * Instalar Dark Wii Tema Rojo>>"%Drive%"\%guidename%
if /i "%ThemeSelection%" EQU "G" echo                * Instalar Dark Wii Tema Verde>>"%Drive%"\%guidename%
if /i "%ThemeSelection%" EQU "BL" echo                * Instalar Dark Wii Tema Azul>>"%Drive%"\%guidename%
if /i "%ThemeSelection%" EQU "O" echo                * Instalar Dark Wii Tema Naranja>>"%Drive%"\%guidename%
if /i "%ACTIVEIOS%" NEQ "ON" goto:skipupdatelog
if /i "%UpdatesIOSQ%" EQU "N" goto:skipupdatelog
echo                * actualizaci�n de IOSs activos (se puede desactivar en las opciones)>>"%Drive%"\%guidename%
if /i "%OPTION36%" EQU "off" echo                * No actualizar IOS36 (se puede activar en las opciones)>>"%Drive%"\%guidename%
goto:skip
:skipupdatelog
echo                * No actualizar IOSs activo (puede ser habilitado en las opciones)>>"%Drive%"\%guidename%
:skip

if /i "%RECCIOS%" EQU "Y" goto:semiskip
if /i "%VIRGIN%" EQU "N" goto:tinyskip
if /i "%CMIOSOPTION%" EQU "on" echo                * Instalar un cMIOS (se puede desactivar en las opciones)>>"%Drive%"\%guidename%
:semiskip
if /i "%CMIOSOPTION%" EQU "off" echo                * No instalar un cMIOS (se puede activar en las opciones)>>"%Drive%"\%guidename%
:tinyskip

if /i "%FWDOPTION%" EQU "off" echo                * No instale un canal Forwarder USB-Loader (se puede activar en las opciones)>>"%Drive%"\%guidename%
if /i "%FWDOPTION%" EQU "on" echo                * Instalar un canal Forwarder USB-Loader (se puede desactivar en las opciones)>>"%Drive%"\%guidename%

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
echo                * Disco duro externo para estar formateado como %FORMATNAME%>>"%Drive%"\%guidename%
goto:skip2
:skip
echo                * Disco duro externo formateado como %FORMATNAME%>>"%Drive%"\%guidename%
:skip2

if /i "%LOADER%" EQU "CFG" echo                * Descargar Configurable USB-Loader>>"%Drive%"\%guidename%
if /i "%LOADER%" EQU "FLOW" echo                * Descargar WiiFlow>>"%Drive%"\%guidename%
if /i "%LOADER%" EQU "ALL" echo                * Descargar Configurable USB-Loader y WiiFlow>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo                * USB-Loader Configuraci�n y los archivos de configuraci�n guardados en disco duro USB>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo                * USB-Loader Configuraci�n y los archivos de configuraci�n guardados en la tarjeta SD>>"%Drive%"\%guidename%
:skipusb


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Este software no est� a la venta. Si usted pag� por este software o un "paquete" usted ha sido estafado.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo ESTE PAQUETE NO VIENE CON ABSOLUTAMENTE NINGUNA GARANTIA>>"%Drive%"\%guidename%
echo SOLAMENTE USTED SERA RESPONSABLE POR CUALQUIER ERROR QUE ESTO PUEDA CAUSAR A SU CONSOLA WII DE NINTENDO!>>"%Drive%"\%guidename%
echo USE ESTO BAJO SU PROPIO RIESGO!>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo NOTAS IMPORTANTES:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo *Su gu�a no requiere una conexi�n Wi-Fi en tu Wii.>>"%Drive%"\%guidename%
echo *Una tarjeta SD con formato FAT (32) requerida (Los mejores resultados son con los no-SDHC, SDHC s�lo funcionar� en 4.0 o superior).>>"%DRIVE%"\%guidename%
echo *Si se producen errores durante cualquiera de los pasos a formatear la tarjeta SD como FAT o FAT32>>"%Drive%"\%guidename%
echo *Apague WiiConnect24 y sacar todas las tarjetas de memoria de GameCube/controladores cuando modifique la Wii (a menos que se indique lo contrario).>>"%DRIVE%"\%guidename%
echo *Si tu Wii siempre que se congele, el bot�n de encendido en la Wii durante 5 segundos para apagarlo y vuelva a intentarlo.>>"%Drive%"\%guidename%
echo *No vuelvas a aceptar una nueva actualizaci�n de Nintendo sin google para ver si es seguro. La �ltima actualizaci�n (a 4.3) fue lanzado a finales de junio de 2010 y no es seguro para aceptar. Si usted acepta una actualizaci�n oficial de Nintendo despu�s de modifique la Wii, usted puede perder parte o la totalidad de sus modificaciones.>>"%Drive%"\%guidename%
echo *Nunca desinstalar un men� de sistema o de IOS>>"%Drive%"\%guidename%
echo *No instale Wads no probados/temas sin BootMii o Priiloader instalado.>>"%Drive%"\%guidename%

::----USB-Loader Notes----
if /i "%USBGUIDE%" NEQ "Y" goto:skipall
if /i "%cIOS223[37-38]-v4%" EQU "*" goto:skipthis

echo *cIOS(s) necesario para utilizar USB Loaders, si le falta algun cIOS(s) ejecutar el Asistente ModMii para la funci�n softmod su Wii antes de instalar el USB-Loader y/o disco duro externo.>>"%Drive%"\%guidename%
echo *cIOS249 rev18 o superior para utilizar discos duros formateados en FAT32 o NTFS (cIOS222 rev4 o superior tambi�n funciona, pero usted tendr�a que descargar la versi�n de 222 configurable usb cargador o modificar el archivo config.txt para configurar USB-Loader)>>"%Drive%"\%guidename%
:skipthis

echo *No todos los discos duros externos son compatibles con la Wii, para obtener una lista de disco duro USB que son compatibles, consulte esta p�gina web: http://wiki.gbatemp.net/wiki/USB_Devices_Compatibility_List>>"%Drive%"\%guidename%
echo *Si tiene alguna pregunta, una gu�a m�s detallada se puede encontrar aqu�: www.sites.google.com/site/completesg/>>"%Drive%"\%guidename%
:skipall
::-------------------------

echo *Esta gu�a personalizada es buen comienzo, pero la modificacion de la Wii siempre est� evolucionando. Buscar actualizaciones en l�nea, y recuerda, Google es tu amigo.>>"%Drive%"\%guidename%
echo *Si tiene alguna pregunta, una gu�a m�s detallada se puede encontrar aqu�: www.sites.google.com/site/completesg/>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%




::-----------------------------------------virgin Korean non-4.3 Wiis-----------------------------------
If /i "%VIRGIN%" NEQ "Y" goto:nonkorean
If /i "%REGION%" NEQ "K" goto:nonkorean
If /i "%FIRMSTART%" EQU "4.3" goto:nonkorean

::---------------------------------RESTORING THE TRUCHA BUG for Korean Wiis (4.2 and under)-------------------------


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) LANZAN Multi-Mod Manager (MMM) USO DE BANNERBOMB>>"%Drive%"\%guidename%
echo    ===============================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%

If /i "%BB2%" EQU "*" echo Ejecutar bannerbomb v2, seleccionando el bot�n de la tarjeta SD en la pantalla del sistema de men� principal y seleccionar S� para cargar boot.dol/elf>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo Ejecutar bannerbomb v1, vaya a Configuraci�n, Gesti�n de Datos, los canales, tarjeta SD y la elecci�n de s� a la carga boot.dol/elf>>"%Drive%"\%guidename%
echo Nota: Si esto no funciona para usted, visite http://bannerbomb.qoid.us/ para m�s variaciones de cualquiera de las versiones de bannerbomb.>>"%DRIVE%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Esto abrir� Multi-Mod Manager.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



:KOREANEXTRA
echo %COUNT7%) INSTALAR IOS58 USO DE Multi-Mod Manager (MMM)>>"%Drive%"\%guidename%
echo    ===========================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo En el men� principal de Multi-Mod Manager, ir hacia abajo para seleccionar "WAD Manager".>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Ahora instale IOS58v6176.>>"%Drive%"\%guidename%
echo Navegue hasta el Wad y pulse dos veces "A" para instalar el IOS de forma individual.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Tenga cuidado de no instalar los Wads adicionales que se han guardado previamente en esta carpeta (que puede ser seguro, pero no puedo decirlo con seguridad).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


echo Aseg�rese de que el archivo se instal� correctamente.>>"%Drive%"\%guidename%
echo S�lo ir hacia el siguiente paso despu�s de instalar el wad, pero no salga MMM.>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



echo %COUNT7%) INSTALACION EL HOMEBREW CHANNEL (HBC) y BOOTMII>>"%Drive%"\%guidename%
echo    =================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%

echo Volver al men� principal MMM, seleccione "App Manager" y presiona A.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo lanzar el HackMii_Installer>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Esto ejecuta el instalador Hackmii (y en silencio/se instala autom�ticamente BootMii como IOS). Utilizar el instalador para instalar el Homebrew Channel (HBC) y BootMii como boot2 si es posible.>>"%DRIVE%"\%guidename%

goto:nandbackup



::---------------------------virgin NON-Korean Wiis-----------------------------------

::---------------------------------HACKMII INSTALLER-----------------------------

:nonkorean

If /i "%HM%" NEQ "*" goto:TBRGUIDE


If /i "%MENU1%" NEQ "SU" goto:miniskip
If /i "%IOS236Installer%" NEQ "*" goto:TBRGUIDE
:miniskip



echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) INSTALACI�N DE HOMEBREW CHANNEL (HBC) Y BOOTMII>>"%Drive%"\%guidename%
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
If /i "%exploitnum%" GEQ "2" echo You only need to perform ONE of the following exploits>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo.>>"%Drive%"\%guidename%


If /i "%BB1%" EQU "*" goto:skipforwardersolution
If /i "%BB2%" EQU "*" goto:skipforwardersolution
echo Note: if this Wii was previously modified, and it has either the HBC, BootMii as Boot2, or a Forwarder Channel installed, you can use that instead of an exploit.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Si se utiliza BootMii como boot2 para instalar el HBC, copiar la carpeta "BootMii" de su anterior instalaci�n de BootMii a la ra�z de tu tarjeta SD (o descargar usando ModMii). A continuaci�n, iniciar la consola Wii, BootMii se carga, vaya al men� SD, bootmini.elf carga. Esto cargar� el instalador de Hackmii lo que le permite volver a instalar el HBC.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Si se utiliza un canal Forwarder, s�lo tienes que guardar la boot.elf/dol de la aplicaci�n que desea cargar (es decir, SD:\apps\hackmii_installer\boot.elf o SD:\apps\MMM\boot.dol) a la ubicaci�n utilizada por el Canal Forwarder ESPEC�FICOS (es decir, SD:\apps\usbloader\boot.dol). A continuaci�n, iniciar el canal y el programa de instalaci�n Hackmii se carga lo que le permite volver a instalar el HBC. Atenci�n, si el canal de forwarder carga s�lo dol y no la de Elf, boot.dol lanzar MMM, a continuaci�n, utilizar el "Manager App" para cargar el instalador Hackmii.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


if /i "%FIRMSTART%" EQU "o" echo Alternativamente, usted puede actualizar su Wii a la versi�n 3.0-4.2 con un disco (es decir, NSMBW). A continuaci�n, repita el Asistente ModMii con su nuevo firmware y entonces ser� capaz de usar el exploit bannerbomb (que no requiere de un disco espec�fico para el trabajo)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo.>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo ADVERTENCIA: actualizaci�n en l�nea para v4.3 convierte injaqueable la Wii de Corea (a menos que previamente ten�a HBC v1.0.7, BootMii como Boot2v4, o instalar un canal forwarder)>>"%DRIVE%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo .>>"%Drive%"\%guidename%
:skipforwardersolution

:EXPLOITSNOW

echo.>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo Ejecutar bannerbomb v1, vaya a Configuraci�n, Gesti�n de Datos, los canales, tarjeta SD y la elecci�n de s� a la carga boot.dol/elf>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo Nota: Si esto no funciona para usted, visite http://bannerbomb.qoid.us/ para m�s variaciones de cualquiera de las versiones de bannerbomb.>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo .>>"%Drive%"\%guidename%




If /i "%BB2%" EQU "*" echo Ejecutar bannerbomb v2, seleccionando el bot�n de la tarjeta SD en la pantalla del sistema de men� principal y seleccionar S� para cargar boot.dol/elf>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo Nota: Si esto no funciona para usted, visite http://bannerbomb.qoid.us/ para m�s variaciones de cualquiera de las versiones de bannerbomb.>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo .>>"%Drive%"\%guidename%



If /i "%SMASH%" NEQ "*" goto:skipSmashStackGuide

echo SMASH STACK EXPLOIT>>"%Drive%"\%guidename%
echo ------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUISITOS:   * Una copia de "Super Smash Brothers Brawl">>"%Drive%"\%guidename%
echo               * Una tarjeta que no es SDHC (tarjetas SDHC no funcionan)>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Inserte el Super Smash Brothers Brawl Game.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Lanzar el juego sin la tarjeta SD en la Wii, cree un archivo de guardado si no tiene uno ya,>>"%Drive%"\%guidename%
echo Entonces entra en la fase del creador y eliminar todas las fases. A continuaci�n, salir del juego.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Despu�s, inserte la tarjeta SD, iniciar el juego e ir a la fase del creador,>>"%Drive%"\%guidename%
echo se debe iniciar el boot.elf/dol archivo guardado en la ra�z de tu tarjeta SD.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo If you forgot to delete the stages, you will experience an annoying but harmless crash.>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipSmashStackGuide



If /i "%PWNS%" NEQ "*" goto:skipPWNSGuide

echo INDIANA PWNS EXPLOIT>>"%Drive%"\%guidename%
echo -------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUISITOS: * Una copia de LEGO Indiana Jones>>"%Drive%"\%guidename%
echo               * Una tarjeta que no sea SDHC (tarjetas SDHC no funcionan)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Cargar el juego LEGO Indiana Jones al menos una vez>>"%Drive%"\%guidename%
echo    (de lo contrario no ser� capaz de copiar el hack).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Copia de seguridad de LEGO Indiana Jones personalizado guarda el archivo antes de copiar los archivos a la tarjeta SD (si procede):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Poner la tarjeta SD en la Wii y vuelva a encenderla.>>"%Drive%"\%guidename%
echo   b) Ir a Opciones de Wii - Gesti�n de datos - Guardar datos - Wii>>"%Drive%"\%guidename%
echo   c) Encuentre su Indiana guardado, haga clic en �l, haga clic en "Copiar", y haga clic en S�. Ahora borre el archivo guardado de la Wii.>>"%Drive%"\%guidename%
echo   d) Poner la tarjeta SD en el ordenador, y copia la carpeta "privada" de la tarjeta en un lugar seguro. Alternativamente, usted puede temporalmente cambiar su nombre.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copie los archivos de la %DRIVE% a la ra�z de su tarjeta SD (si no lo ha hecho) e ins�rtela en tu Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Ir a Opciones de Wii - Gesti�n de datos - Guardar datos - Wii - SD Card>>"%Drive%"\%guidename%
echo    luego copiar el "Pwns Indiana" guardar el que corresponde a su regi�n.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Juega el juego de Lego Indiana Jones. Cargar el nuevo archivo.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo    Usted estar� en la sala principal, caminando hacia la c�mara,>>"%Drive%"\%guidename%
echo    entrar en la primera puerta a la derecha (izquierda de Indy) y entrar en el "patio".>>"%Drive%"\%guidename%
echo    Camina hasta el final y entrar en la 'Sala de Arte ", ver� un podio con dos personajes en �l, habla con el de la izquierda.>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo    Golpear la izquierda dos veces (desplazarse a trav�s de sus art�culos) para elegir la opci�n de cambiar (Negro silueta con una flecha blanca a otra silueta de color negro)>>"%Drive%"\%guidename%
echo    Un �xito para poner en marcha el boot.elf/dol archivo guardado en la ra�z de tu tarjeta SD.>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipPWNSGuide



If /i "%YUGI%" NEQ "*" goto:skipYUGIGuide

echo YU-GI-OWNED EXPLOIT>>"%Drive%"\%guidename%
echo ------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUISITOS: * Una copia de "Yu-Gi-Oh! 5D's">>"%Drive%"\%guidename%
echo               * Una tarjeta que no sea SDHC (tarjetas SDHC no funcionan)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Cargar el Yu-Gi-Oh game al menos una vez>>"%Drive%"\%guidename%
echo    (de lo contrario no ser� capaz de copiar el hack).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Copia de seguridad de Yu-Gi-Oh personalizado guardar el archivo antes de copiar los archivos a la tarjeta SD (si procede):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Poner la tarjeta SD en la Wii y vuelva a encenderla.>>"%Drive%"\%guidename%
echo   b) Ir a Opciones de Wii - Gesti�n de datos - Guardar datos - Wii>>"%Drive%"\%guidename%
echo   c) Encuentre su Yu-Gi-Oh guardado, haga clic en �l, haga clic en "Copiar", y haga clic en S�. Ahora borre el archivo guardado de la Wii.>>"%Drive%"\%guidename%
echo   d) Poner la tarjeta SD en el ordenador, y copia la carpeta "privada" de la tarjeta en un lugar seguro. Alternativamente, usted puede temporalmente cambiar su nombre.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copie los archivos de la %DRIVE% a la ra�z de su tarjeta SD (si no lo ha hecho) e ins�rtela en tu Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Ir a Opciones de Wii - Gesti�n de datos - Guardar datos - Wii - SD Card>>"%Drive%"\%guidename%
echo    luego copiar el "Yu-Gi-Oh", guardar el que corresponda a su regi�n.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Inicia el juego Yu-Gi-Oh. El exploit se ejecuta despu�s de seguir m�s all� de la apertura del men�.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%REGION%" EQU "E" echo .>>"%Drive%"\%guidename%
if /i "%REGION%" EQU "E" echo Nota para los usuarios europeos: la configuraci�n de YU-GI-OWNED explotar PAL es de 60Hz. Si no funciona en su televisor de 50Hz, vaya a "SD:\private\wii\title\" y cambiar el nombre de "RYOP" a otra cosa cambie el nombre de "RYOP-50hz" a "RYOP" y vuelva a intentarlo. >>"%Drive%"\%guidename%

If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipYUGIGuide




If /i "%BATHAXX%" NEQ "*" goto:skipBATHAXXGuide

echo BATHAXX EXPLOIT>>"%Drive%"\%guidename%
echo --------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUISITOS: * Una copia de "LEGO Batman">>"%Drive%"\%guidename%
echo               * Tarjeta SD (no SHDC) con formato FAT16 o FAT32>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Carga el juego LEGO Batman al menos una vez>>"%Drive%"\%guidename%
echo    (de lo contrario no ser� capaz de copiar el hack).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Copia de seguridad de LEGO Batman personalizado guarda el archivo antes de copiar los archivos a la tarjeta SD (si procede):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Poner la tarjeta SD en la Wii y vuelva a encenderla.>>"%Drive%"\%guidename%
echo   b) Ir a Opciones de Wii - Gesti�n de datos - Guardar datos - Wii>>"%Drive%"\%guidename%
echo   c) Encuentre su LEGO Batman guardado, haga clic en �l, haga clic en "Copiar", y haga clic en S�. Ahora borre el archivo guardado de la Wii.>>"%Drive%"\%guidename%
echo   d) Poner la tarjeta SD en el ordenador, y copia la carpeta "privada" de la tarjeta en un lugar seguro. Alternativamente, usted puede temporalmente cambiar su nombre.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copie los archivos de la %DRIVE% a la ra�z de su tarjeta SD (si no lo ha hecho) e ins�rtela en tu Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Ir a Opciones de Wii - Gesti�n de datos - Guardar datos - Wii - SD Card>>"%Drive%"\%guidename%
echo    luego copiar el "LEGO Batman", guardar el que corresponda a su regi�n.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Inicia el juego LEGO Batman. Cargar el nuevo archivo.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo    Inicia el juego LEGO Batman. Cargar el nuevo archivo guardado Ahora se encuentra en la Baticueva, toma el ascensor en el lado derecho.>>"%Drive%"\%guidename%
echo    Luego, en la sala de trofeos, vaya a la esquina superior e ir por la puerta>>"%Drive%"\%guidename%
echo    a la "Wayne Manor". Ahora usted puede seleccionar un car�cter.>>"%Drive%"\%guidename%
echo    Elija el �ltimo car�cter permitido en la fila inferior para lanzar el exploit.>>"%Drive%"\%guidename%

If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipBATHAXXGuide


If /i "%ROTJ%" NEQ "*" goto:skipROTJGuide

echo RETURN OF THE JODI EXPLOIT>>"%Drive%"\%guidename%
echo -------------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUISITOS: * Una copia de "LEGO Star Wars">>"%Drive%"\%guidename%
echo               * Tarjeta SD (no SHDC) con formato FAT16 o FAT32>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Cargue el LEGO Star Wars al menos una vez>>"%Drive%"\%guidename%
echo    (de lo contrario no ser� capaz de copiar el hack).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Copia de seguridad de LEGO Star Wars personalizado guarda el archivo antes de copiar los archivos a la tarjeta SD (si procede):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Poner la tarjeta SD en la Wii y vuelva a encenderla.>>"%Drive%"\%guidename%
echo   b) Ir a Opciones de Wii - Gesti�n de datos - Guardar datos - Wii>>"%Drive%"\%guidename%
echo   c) Encuentre su LEGO Star Wars guardado, haga clic en �l, haga clic en "Copiar", y haga clic en S�. Ahora borre el archivo guardado de la Wii.>>"%Drive%"\%guidename%
echo   d) Poner la tarjeta SD en el ordenador, y copia la carpeta "privada" de la tarjeta en un lugar seguro. Alternativamente, usted puede temporalmente cambiar su nombre.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copie los archivos de la %DRIVE% a la ra�z de su tarjeta SD (si no lo ha hecho) e ins�rtela en tu Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Ir a Opciones de Wii - Gesti�n de datos - Guardar datos - Wii - SD Card>>"%Drive%"\%guidename%
echo    luego copiar el "LEGO Star Wars", guardar el que corresponda a su regi�n.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Inicie el LEGO Star Wars. Cargue la primera ranura de salvar (a la izquierda, en el 0,0 por ciento). >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo    Tan pronto como el nivel de carga, corre a la derecha y ver�s dos caracteres flotantes >>"%Drive%"\%guidename%
echo    Ir a la zona de delante de ellos y ver�s "Regresar de JODI" aparecer� >>"%Drive%"\%guidename%
echo    presione el bot�n "A" para lanzar el exploit. >>"%Drive%"\%guidename%

If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipROTJGuide


If /i "%TOS%" NEQ "*" goto:skipTOSGuide

echo ERI HAKAWAI EXPLOIT>>"%Drive%"\%guidename%
echo ------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUISITOS: * Una copia de "Tales of Symphonia: Dawn of the New World">>"%Drive%"\%guidename%
echo               * Tarjeta SD (no SHDC) con formato FAT16 o FAT32>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Cargue el Tales of Symphonia game al menos una vez>>"%Drive%"\%guidename%
echo    (de lo contrario no ser� capaz de copiar el hack).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Copia de seguridad de Tales of Symphonia personalizado guarda el archivo antes de copiar los archivos a la tarjeta SD (si procede):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Poner la tarjeta SD en la Wii y vuelva a encenderla.>>"%Drive%"\%guidename%
echo   b) Ir a Opciones de Wii - Gesti�n de datos - Guardar datos - Wii>>"%Drive%"\%guidename%
echo   c) Encuentre su Tales of Symphonia guardado, haga clic en �l, haga clic en "Copiar", y haga clic en S�. Ahora borre el archivo guardado de la Wii.>>"%Drive%"\%guidename%
echo   d) Poner la tarjeta SD en el ordenador, y copia la carpeta "privada" de la tarjeta en un lugar seguro. Alternativamente, usted puede temporalmente cambiar su nombre.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copie los archivos de la %DRIVE% a la ra�z de su tarjeta SD (si no lo ha hecho) e ins�rtela en tu Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Ir a Opciones de Wii - Gesti�n de datos - Guardar datos - Wii - SD Card>>"%Drive%"\%guidename%
echo    luego copiar el "Tales of Symphonia" guardar el que corresponda a su regi�n.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo E. Inicie Tales of Symphonia y cargar los datos guardados. >>"%Drive%"\%guidename%


If /i "%REGION%" NEQ "J" goto:quickskip
echo    Para los usuarios japoneses, hay dos versiones diferentes del juego.>>"%Drive%"\%guidename%
echo    Si tu juego es la versi�n "RVL-RT4J-0A-0 JPN" utilizar el guardado superior,>>"%Drive%"\%guidename%
echo    si usted tiene "RVL-RT4J-0A-1 JPN" utilizar el segundo guardado.>>"%Drive%"\%guidename%
echo    Si tiene cualquier otra versi�n del disco, probablemente no va a funcionar.>>"%Drive%"\%guidename%
:quickskip

echo .>>"%Drive%"\%guidename%
echo    Una vez que se inicia el juego (y se ve un perro saludandole a usted), presione el bot�n "MAS" para acceder al men� del juego.>>"%Drive%"\%guidename%
echo    Despl�cese hasta "Status" y presiona A.>>"%Drive%"\%guidename%


If /i "%REGION%" EQU "U" goto:noskip
If /i "%REGION%" EQU "J" goto:noskip
goto:quickskip
:noskip
echo    A continuaci�n, despl�cese hacia abajo para el segundo personaje (llamado "Giantpune"). Resaltelo, y presione A.>>"%Drive%"\%guidename%
:quickskip

If /i "%REGION%" NEQ "E" goto:quickskip
echo    A continuaci�n, despl�cese hacia abajo para el segundo personaje (llamado "Eri HaKawai"). Resaltelo, y presione A.>>"%Drive%"\%guidename%
:quickskip


If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo .>>"%Drive%"\%guidename%
:skipTOSGuide



If /i "%TWI%" NEQ "*" goto:skipTWIGuide

echo TWILIGHT HACK/EXPLOIT>>"%Drive%"\%guidename%
echo --------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUISITOS: * Una copia de The Legend of Zelda: Twilight Princess>>"%Drive%"\%guidename%
echo               * Una tarjeta que no sea SDHC (las tarjetas SDHC no funcionan)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo A. Carga el juego Twilight Princess al menos una vez>>"%Drive%"\%guidename%
echo    (de lo contrario no ser� capaz de copiar el hack).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo B. Copia de seguridad de Twilight Princess personalizado guarda el archivo antes de copiar los archivos a la tarjeta SD (si procede):>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo   a) Poner la tarjeta SD en la Wii y vuelva a encenderla.>>"%Drive%"\%guidename%
echo   b) Ir a Opciones de Wii - Gesti�n de datos - Guardar datos - Wii>>"%Drive%"\%guidename%
echo   c) Encuentre su Twilight Princess guardado, haga clic en �l, haga clic en "Copiar", y haga clic en S�.>>"%Drive%"\%guidename%
echo   d) Poner la tarjeta SD en el ordenador, y copia la carpeta "privada" de la tarjeta en un lugar seguro. Alternativamente, usted puede temporalmente cambiar su nombre.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo C. Copie los archivos de la %DRIVE% a la ra�z de su tarjeta SD (si no lo ha hecho) e ins�rtela en tu Wii>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo D. Ir a Opciones de Wii - Gesti�n de datos - Guardar datos - Wii>>"%Drive%"\%guidename%
echo    Ahora eliminar el archivo guardado de Zelda en Wii.>>"%Drive%"\%guidename%
echo    Cambie a la pesta�a de tarjeta SD y seleccione la opci�n "Twilight Hack" guardar el que corresponda a su regi�n de juego.>>"%Drive%"\%guidename%
echo    Haga clic en copiar y entonces s�. Ahora salir del men�.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo E. Inserte el The Legend of Zelda: Twilight Princess disco y ejecutar el juego.>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo .>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo Nota: Busque en la parte inferior del disco de juego en primer lugar.>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo       Si tiene RVL-RZDE-0A-2 EE.UU. en su anillo interior, que tendr� que cargar TwilightHack2 en el siguiente paso.>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo       Si dice otra cosa, cargar TwilightHack0.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo F. En la pantalla de t�tulo del juego, pulsar A y B para ir al men� principal.>>"%Drive%"\%guidename%
If /i "%REGION%" NEQ "U" echo    Ahora carga el Twilight Hack guardar el archivo.>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo    Ahora carga el Twilight Hack guardar el archivo. (v�ase la nota de arriba!).>>"%Drive%"\%guidename%

If /i "%REGION%" EQU "U" echo    Si accidentalmente se carga el archivo incorrecto y contin�a con el truco, el juego se congela pero no se asuste,>>"%Drive%"\%guidename%
If /i "%REGION%" EQU "U" echo    simplemente mantenga pulsado el bot�n de encendido durante 5 segundos para apagarlo, y luego volver a encenderlo, y empezar de nuevo.>>"%DRIVE%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo G. El juego se iniciar� de manera normal. Para ejecutar el truco, hablar con el primer car�cter que se ve, o tratar de salir de la habitaci�n.>>"%DRIVE%"\%guidename%
:skipTWIGuide





If /i "%Exploit%" NEQ "BOMB" goto:skipbombGuide

echo LETTERBOMB EXPLOIT>>"%Drive%"\%guidename%
echo ------------------>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo REQUISITOS: * una tarjeta SD o SDHC>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Vaya al "buz�n de correos" en tu Wii y mire a d�a de ayer>>"%Drive%"\%guidename%
echo (dependiendo de su zona horaria, sino que tambi�n podr�a aparecer en la actualidad).>>"%Drive%"\%guidename%
echo Haga clic en el sobre con el icono de la bomba de color rosa.>>"%Drive%"\%guidename%
:skipbombGuide


echo .>>"%Drive%"\%guidename%

If /i "%MENU1%" EQU "H" goto:HMsolution2


:HACKMIIGUIDE
If /i "%HM%" NEQ "*" goto:PRIIGUIDE

echo .>>"%Drive%"\%guidename%
echo Esto ejecuta el Hackmii Installer (y en silencio/se instala autom�ticamente BootMii como IOS). Utilizar el instalador para instalar el Homebrew Channel (HBC) y BootMii como boot2 si es posible.>>"%DRIVE%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Nota: Si recibe un mensaje de eror "no vulnerable IOS" , ejecute ModMii de nuevo y esta vez seleccione la opci�n 'Soluciones Hackmii' en lugar de 'ModMii Wizard' y siga las instrucciones de nuevo antes de continuar con esta gu�a.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Despu�s de salir del HackMii Installer, usted ser� llevado al HBC.>>"%Drive%"\%guidename%


echo Pulse el bot�n de inicio. En la esquina superior derecha se encuentra el IOS utilizado por el HBC.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Si el HBC est� usando un IOS que no sea IOS58 o el canal homebrew est� al rev�s, tomar nota de lo que se aplica posteriormente en la gu�a (que tendr� que volver a instalar el HBC).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Si est� usando IOS58 y de su HBC no est� al rev�s, puede saltarse el paso Vuelva a instalar el Canal Homebrew, cuando lleguemos a �l.>>"%DRIVE%"\%guidename%


echo .>>"%Drive%"\%guidename%



:nandbackup

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) HACER UNA COPIA NAND>>"%Drive%"\%guidename%
echo    ====================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%



echo Mientras que en el interior del Canal Homebrew, carga BootMii pulsando Inicio y hacer clic en Iniciar BootMii.>>"%Drive%"\%guidename%
echo Pulse el bot�n de encendido de la consola Wii 3 veces para llegar a la �ltima opci�n, a continuaci�n, pulse el bot�n de reinicio. [Tambi�n puede navegar con un controlador de Gamecube]>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Presione RESET para elegir la primera opci�n y siga las instrucciones que aparecen en la pantalla para hacer la copia de seguridad NAND. [Los bloques defectuosos no son un problema.]>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo La copia de seguridad meterla en una carpeta llamada BootMii,NAND.bin, y otra parte KEYS.BIN y borrar la tarjeta SD (o cambiarle el nombre). Usted necesitar� estos archivos, en situaciones de emergencia, as� que no los pierda.>>"%Drive%"\%guidename%
echo Go back to The Homebrew Channel.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Nota: si se ha instalado como BootMii boot2, entonces aparecer� tan pronto como la Wii est� encendida SIEMPRE Y CUANDO se encuentra la carpeta BootMii (mencionado anteriormente) en la ra�z de la tarjeta SD.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


::----------------------------RESTAURACI�N DEL BUG TRUCHA (con IOS236 Installer)--------------------------
:TBRGUIDE

If /i "%IOS236Installer%" NEQ "*" goto:PRIIGUIDE

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) INSTALAR UN PARCHE IOS236>>"%Drive%"\%guidename%
echo    ========================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%


echo iniciar el Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo MUY IMPORTANTE!>>"%Drive%"\%guidename%
echo En el canal Homebrew, si no tienes una conexi�n a Internet ya est� configurado, usted ver� un icono que parpadea en la esquina inferior derecha de la pantalla que indica su incapacidad para iniciar la red. Debe esperar a que el icono deje de parpadear o dejarla parpade durante 30-60 segundos antes de proceder de otra manera estas aplicaciones podr�n dar error poco despu�s de ser lanzado. Si se produce este error inocuo, pare la Wii y repita este paso desde el principio. Para aumentar sus posibilidades de �xito, agregar una conexi�n a Internet a tu Wii a trav�s del men� de Configuraci�n de Wii oficial, pero aseg�rese de decir "no" cuando se le pregunt� a realizar una actualizaci�n.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo S�lo necesita realizar uno de los siguientes m�todos.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Metodo A: Usar IOS236 Installer>>"%Drive%"\%guidename%
echo -------------------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Despu�s de esperar 30 a 60 segundos para el HBC para tratar de iniciar la red, ejecute "IOS236 installer v5 MOD". >>"%Drive%"\%guidename%
echo      Nota: Esta aplicaci�n debe ser lanzada con HBC v1.0.7 o superior para funcionar correctamente.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Deber�a decir "IOS236 installation is complete!" y volver al Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Si se producen errores, siga intentandolo y deber�a funcionar finalmente.>>"%Drive%"\%guidename%
echo Si sigues teniendo errores puede intentar usar Simple IOS Patcher en su lugar.>>"%Drive%"\%guidename%
echo Una vez que se instala con �xito cualquiera de los m�todos IOS236, puede pasar al siguiente paso.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Metodo B: Usando sencillos IOS Patcher>>"%Drive%"\%guidename%
echo ---------------------------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Despu�s de esperar 30 a 60 segundos para el HBC para tratar de iniciar la red, ejecute "IOS236 Installer". >>"%Drive%"\%guidename%
echo      Nota: Esta aplicaci�n debe ser lanzada con HBC v1.0.7 o superior para funcionar correctamente.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Seleccione la opci�n "IOS36" (ya seleccionado por defecto) y pulsar A,>>"%Drive%"\%guidename%
echo Seleccione "Install IOS to slot" y seleccione 236,>>"%Drive%"\%guidename%
echo Seleccione "Install patched IOS36", dejando a los 4 parches en "yes" y presiona A,>>"%Drive%"\%guidename%
echo Elija "Load IOS from SD card".>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Confirme su elecci�n con el bot�n A,>>"%Drive%"\%guidename%
echo Cuando se le pida, presione A para continuar la instalaci�n.>>"%Drive%"\%guidename%
echo Cuando la instalaci�n haya terminado vuelva al men� principal,>>"%Drive%"\%guidename%
echo A continuaci�n, pulse el bot�n B para salir.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Si se producen errores, siga intentando y deber�a funcionar finalmente.>>"%Drive%"\%guidename%
echo Si sigues teniendo errores puede intentar usar IOS236 installer en su lugar.>>"%Drive%"\%guidename%
echo Una vez que se instala con �xito cualquiera de los m�todos IOS236, puede pasar al siguiente paso.>>"%Drive%"\%guidename%
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

echo %COUNT7%) INSTALAR PRIILOADER>>"%Drive%"\%guidename%
echo    ==================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%

echo Lanzar "Priiloader 236 Mod" a trav�s del Canal Homebrew>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Despu�s de cargar el Priiloader installer, pulse + para instalarlo.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Usted puede obtener un error de "loader.ini" y/o password.txt" simplemente ignorar esto.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Despu�s de instalar correctamente Priiloader, puede proceder a apagar la Wii,>>"%Drive%"\%guidename%
echo luego encender la wii de nuevo mientras se mantiene el boton reset hasta que vea el men� Priiloader.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Usted debe instalar algunos hacks del men� del sistema actual (ir al men� de Sistema de opciones hacks).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo HACKS RECOMENDADO: Actualizaciones de bloques de disco, bloquear las actualizaciones en l�nea, Reemplazar la pantalla de la Salud, Auto-Presione en la pantalla de Salud, Region-Free Todo, no eliminar almacenamiento de copia de protecci�n de archivos, y mover Canal Disco.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo El men� priiloader es de color blanco por defecto, se puede cambiar a negro en la configuraci�n de Priiloader si lo prefiere.>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%

echo Una de las funciones especiales de Priiloader es que se puede autoarrancar cualquier aplicaci�n/archivo en lugar del men� del sistema. Algunas aplicaciones (como crazyIntro) no puede ser utilizado sin �l.>>"%Drive%"\%guidename%
echo Para m�s detalles sobre c�mo hacerlo, visite www.sites.google.com/site/completesg/system-hacks/priiloader>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

if /i "%installwads%" EQU "done" goto:reinstallHBC


::----------------------Install Wads (MMM)-----------------------------

:installwads

if /i "%mmm%" NEQ "*" goto:SKIP

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

echo %COUNT7%) INSTALAR WADS>>"%Drive%"\%guidename%
echo    ============>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

::MMM Instructions
echo Carga Multi-Mod Manager (MMM) a trav�s del canal homebrew.>>"%Drive%"\%guidename%
echo S� IOS%patchIOSnum% a�n no est� cargado, seleccione "Cargar otro IOS", a continuaci�n, seleccione IOS%patchIOSnum% >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Nota: Si este paso falla con el error-ret 2011 o de otro tipo, puede ser necesario volver a intentar parchear IOS%patchIOSnum%. Si la Wii estaba modificada anteriormente, puedes intentar cargar cIOS250 (u otros como 202,222,223,224,236,249)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo En el men� principal de Multi-Mod Manager, vaya hacia abajo para seleccionar "WAD Manager".>>"%Drive%"\%guidename%


goto:skipy4m
::YAWMM 4 ModMii Instructions
echo Iniciar el Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo MUY IMPORTANTE!>>"%Drive%"\%guidename%
echo En el Homebrew channel, si no tienes una conexi�n a Internet establecido, usted ver� un icono parpadeante en la esquina inferior derecha de la pantalla que indica su incapacidad para iniciar la red.>>"%Drive%"\%guidename%
echo Debe esperar a que el icono deje de parpadear o dejar que parpadear� durante 30-60 segundos antes de proceder de otra manera esta aplicaci�n espec�fica se congela poco despu�s de ser lanzado. >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Despu�s de esperar 30 a 60 segundos para que el HBC intente iniciar la red, ejecute "YAWMM 4 ModMii". >>"%Drive%"\%guidename%
echo      Nota: Esta aplicaci�n debe ser lanzada con HBC v1.0.7 o superior para funcionar correctamente.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Pulse el bot�n "A" para continuar.>>"%Drive%"\%guidename%
echo Pulse el bot�n "A" de nuevo a leer de la ranura SD. >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo MUY IMPORTANTE!>>"%Drive%"\%guidename%
echo 
Esperar durante 30-60 segundos para ver si la aplicaci�n se bloquea. Si es as�, apague el Wii y repita este paso desde el principio. Si despu�s de esperar unos 30-60 segundos, la aplicaci�n a�n no se congela, se confirma que es segura de usar.>>"%Drive%"\%guidename%
:skipy4m




echo .>>"%Drive%"\%guidename%
echo Instale los WADs siguientes desde la carpeta WAD (esta lista de WADs es �nica sobre dependiendo c�mo respondi� a las preguntas del asistente).>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Tenga cuidado de no instalar ning�n wads adicionales que se han guardado previamente en esta carpeta (que puede ser seguro, pero no puedo decirlo con seguridad).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Mantenga + durante 2 segundos para seleccionar todos los WADs en la carpeta. A continuaci�n, el bot�n A dos veces para instalar todos ellos.>>"%Drive%"\%guidename%

echo Si hay archivos que no se puedan instalar correctamente, permanecer� marcado para su instalaci�n, as� que vuelva a intentar la instalaci�n de los archivos.>>"%Drive%"\%guidename%
::echo Despu�s de la instalaci�n finalice, leer el informe de instalaci�n para asegurarse de que todos los archivos estan instalados correctamente.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo      Su lista �nica de wads para instalar son los siguientes:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



if /i "%IOS11P60%" EQU "*" echo      * IOS11v16174(IOS60v6174[FS-ES-NP-VP])>>"%Drive%"\%guidename%
if /i "%IOS20P60%" EQU "*" echo      * IOS20v16174(IOS60v6174[FS-ES-NP-VP])>>"%Drive%"\%guidename%
if /i "%IOS30P60%" EQU "*" echo      * IOS30v16174(IOS60v6174[FS-ES-NP-VP])>>"%Drive%"\%guidename%
if /i "%IOS40P60%" EQU "*" echo      * IOS40v16174(IOS60v6174[FS-ES-NP-VP])>>"%Drive%"\%guidename%
if /i "%IOS50P%" EQU "*" echo      * IOS50v14889(IOS50v4889[FS-ES-NP-VP])>>"%Drive%"\%guidename%
if /i "%IOS52P%" EQU "*" echo      * IOS52v15661(IOS52v5661[FS-ES-NP-VP])>>"%Drive%"\%guidename%
if /i "%IOS60P%" EQU "*" echo      * IOS60v16174(IOS60v6174[FS-ES-NP-VP])>>"%Drive%"\%guidename%
if /i "%IOS70P%" EQU "*" echo      * IOS70v16687(IOS70v6687[FS-ES-NP-VP])>>"%Drive%"\%guidename%
if /i "%IOS70K%" EQU "*" echo      * IOS70v16174(IOS60v6174[FS-ES-NP-VP])>>"%Drive%"\%guidename%
if /i "%IOS80P%" EQU "*" echo      * IOS80v6944[FS-ES-NP-VP]>>"%Drive%"\%guidename%
if /i "%IOS80K%" EQU "*" echo      * IOS80v16174(IOS60v6174[FS-ES-NP-VP])>>"%Drive%"\%guidename%


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

if /i "%SM4.1U-DWB%" EQU "*" echo      * SystemMenu_4.1U_v449_DarkWiiBlue>>"%Drive%"\%guidename%
if /i "%SM4.2U-DWB%" EQU "*" echo      * SystemMenu_4.2U_v481_DarkWiiBlue>>"%Drive%"\%guidename%
if /i "%SM4.3U-DWB%" EQU "*" echo      * SystemMenu_4.3U_v513_DarkWiiBlue>>"%Drive%"\%guidename%
if /i "%SM4.1E-DWB%" EQU "*" echo      * SystemMenu_4.1E_v450_DarkWiiBlue>>"%Drive%"\%guidename%
if /i "%SM4.2E-DWB%" EQU "*" echo      * SystemMenu_4.2E_v482_DarkWiiBlue>>"%Drive%"\%guidename%
if /i "%SM4.3E-DWB%" EQU "*" echo      * SystemMenu_4.3E_v514_DarkWiiBlue>>"%Drive%"\%guidename%
if /i "%SM4.1J-DWB%" EQU "*" echo      * SystemMenu_4.1J_v448_DarkWiiBlue>>"%Drive%"\%guidename%
if /i "%SM4.2J-DWB%" EQU "*" echo      * SystemMenu_4.2J_v480_DarkWiiBlue>>"%Drive%"\%guidename%
if /i "%SM4.3J-DWB%" EQU "*" echo      * SystemMenu_4.3J_v512_DarkWiiBlue>>"%Drive%"\%guidename%
if /i "%SM4.1K-DWB%" EQU "*" echo      * SystemMenu_4.1K_v454_DarkWiiBlue>>"%Drive%"\%guidename%
if /i "%SM4.2K-DWB%" EQU "*" echo      * SystemMenu_4.2K_v486_DarkWiiBlue>>"%Drive%"\%guidename%
if /i "%SM4.3K-DWB%" EQU "*" echo      * SystemMenu_4.3K_v518_DarkWiiBlue>>"%Drive%"\%guidename%

if /i "%SM4.1U-DWO%" EQU "*" echo      * SystemMenu_4.1U_v449_DarkWiiOrange>>"%Drive%"\%guidename%
if /i "%SM4.2U-DWO%" EQU "*" echo      * SystemMenu_4.2U_v481_DarkWiiOrange>>"%Drive%"\%guidename%
if /i "%SM4.3U-DWO%" EQU "*" echo      * SystemMenu_4.3U_v513_DarkWiiOrange>>"%Drive%"\%guidename%
if /i "%SM4.1E-DWO%" EQU "*" echo      * SystemMenu_4.1E_v450_DarkWiiOrange>>"%Drive%"\%guidename%
if /i "%SM4.2E-DWO%" EQU "*" echo      * SystemMenu_4.2E_v482_DarkWiiOrange>>"%Drive%"\%guidename%
if /i "%SM4.3E-DWO%" EQU "*" echo      * SystemMenu_4.3E_v514_DarkWiiOrange>>"%Drive%"\%guidename%
if /i "%SM4.1J-DWO%" EQU "*" echo      * SystemMenu_4.1J_v448_DarkWiiOrange>>"%Drive%"\%guidename%
if /i "%SM4.2J-DWO%" EQU "*" echo      * SystemMenu_4.2J_v480_DarkWiiOrange>>"%Drive%"\%guidename%
if /i "%SM4.3J-DWO%" EQU "*" echo      * SystemMenu_4.3J_v512_DarkWiiOrange>>"%Drive%"\%guidename%
if /i "%SM4.1K-DWO%" EQU "*" echo      * SystemMenu_4.1K_v454_DarkWiiOrange>>"%Drive%"\%guidename%
if /i "%SM4.2K-DWO%" EQU "*" echo      * SystemMenu_4.2K_v486_DarkWiiOrange>>"%Drive%"\%guidename%
if /i "%SM4.3K-DWO%" EQU "*" echo      * SystemMenu_4.3K_v518_DarkWiiOrange>>"%Drive%"\%guidename%


if /i "%cIOS202[60]-v5.1R%" EQU "*" echo      * cIOS202[60]-v5.1R>>"%Drive%"\%guidename%
if /i "%cIOS222[38]-v4%" EQU "*" echo      * cIOS222[38]-v4>>"%Drive%"\%guidename%
if /i "%cIOS223[37-38]-v4%" EQU "*" echo      * cIOS223[37-38]-v4>>"%Drive%"\%guidename%
if /i "%cIOS224[57]-v5.1R%" EQU "*" echo      * cIOS224[57]-v5.1R>>"%Drive%"\%guidename%
if /i "%cIOS249[56]-d2x-v6%" EQU "*" echo      * cIOS249[56]-d2x-v%d2x-beta-rev%>>"%Drive%"\%guidename%
if /i "%cIOS250[57]-d2x-v6%" EQU "*" echo      * cIOS250[57]-d2x-v%d2x-beta-rev%>>"%Drive%"\%guidename%

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
if /i "%IOS236%" EQU "*" echo      * IOS236v65535(IOS36v3351[FS-ES-NP-VP])>>"%Drive%"\%guidename%
if /i "%USBX%" NEQ "*" goto:nousbx
echo      * USBLoader(s)-ahbprot58-SD-USB-v9-IDCL>>"%Drive%"\%guidename%
echo        Este es un canal forwarder y cargar� el primer archivo que encuentre en la lista siguiente:>>"%Drive%"\%guidename%
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
echo       Notas: IOS58 es necesario para lanzar aplicaciones desde una tarjeta SD y discos duros formateados como>>"%Drive%"\%guidename%
echo              FAT32, NTFS, ext2, ext3 y ext4. Tambi�n apoya los argumentos de meta.xml>>"%Drive%"\%guidename%
echo              y es capaz de lanzar aplicaciones con acceso directo al hardware.>>"%Drive%"\%guidename%
echo.
echo        Siempre debe tener al menos un canal forwarder instalado en tu Wii,>>"%Drive%"\%guidename%
echo        de esa manera, en el caso de la actualizaci�n accidental, ser� capaz de rejakear tu Wii sin tener que depender de un disco basado en exploit>>"%Drive%"\%guidename%
:nousbx

echo .>>"%Drive%"\%guidename%

if /i "%FIRM%" EQU "%FIRMSTART%" goto:SKIP
echo Nota: Siempre que instale un nuevo sistema de men�, Priiloader se desinstala. As� que aseg�rese de volver a instalarlo despu�s (sobre todo si usted no tiene BootMii como boot2)>>"%Drive%"\%guidename%
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

if /i "%MENU1%" EQU "SU" echo %COUNT7%) REINSTALAR EL HOMEBREW CHANNEL>>"%Drive%"\%guidename%
if /i "%MENU1%" EQU "SU" echo    ==============================>>"%Drive%"\%guidename%
if /i "%MENU1%" EQU "SU" goto:skipsomestuff

if /i "%MENU1%" NEQ "SU" echo %COUNT7%) REINSTALAR EL HOMEBREW CHANNEL (si procede)>>"%Drive%"\%guidename%
if /i "%MENU1%" NEQ "SU" echo    ==============================================>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Anteriormente, usted deber�a haber comprobado qu� IOS es utilizado por el Canal Homebrew (HBC). Si el IOS utilizado por el HBC es IOS58 y el HBC no es esta al rev�s, puede saltarse este paso.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Si el HBC est� usando un IOS que no sea IOS58 o su HBC es esta al rev�s, debe volver a instalar el HBC.>>"%Drive%"\%guidename%

:skipsomestuff
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Inicie el HackMii_Installer trav�s del HBC.>>"%Drive%"\%guidename%
echo Use Hackmii_Installer para arreglar/volver a instalar el HBC. Una vez que haya vuelto a instalar el HBC con �xito, puede pasar al siguiente paso de la gu�a.>>"%Drive%"\%guidename%

If /i "%MENU1%" NEQ "SU" goto:miniskip
If /i "%IOS236Installer%" NEQ "*" echo .>>"%Drive%"\%guidename%
If /i "%IOS236Installer%" NEQ "*" echo Tambi�n debe instalar BootMii como boot2 si es posible (si no lo ha hecho).>>"%Drive%"\%guidename%
:miniskip

echo .>>"%Drive%"\%guidename%

if /i "%MENU1%" NEQ "SU" echo Si el HBC no logra cargar el HackMii_Installer (s�lo pantallas en negro), en lugar de lanzar el instalador Hackmii utilizando el m�todo descrito en el primer paso>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%



::------------------------Install Custom Theme Using MyMenuify----------------------------
:MyMGuide
If /i "%MyM%" NEQ "*" goto:noMyM

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) INSTALACION PERSONALIZADA TEMA DE MENU WII USANDO MYMENUIFYMOD (OPCIONAL)>>"%Drive%"\%guidename%
echo    ===========================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%
echo ADVERTENCIA: NO INSTALAR TEMAS SIN PROTECCI�N (BOOTMII, PRIILOADER Y RESPALDO NAND)>>"%Drive%"\%guidename%
echo          Y SOLO INSTALAR TEMAS PARA SU VERSION MEN� DEL SISTEMA ESPECIFICO Y LA REGI�N!>>"%Drive%"\%guidename%
echo.>>"%Drive%"\%guidename%
echo Lanzar MyMenuifyMod del HBC.>>"%Drive%"\%guidename%
echo.>>"%Drive%"\%guidename%


echo Navegar al tema que le gustar�a instalar>>"%Drive%"\%guidename%
echo que corresponda a la versi�n espec�fica del men� del sistema>>"%Drive%"\%guidename%
echo A continuaci�n, pulse A para instalarlo.>>"%Drive%"\%guidename%

echo.>>"%Drive%"\%guidename%
echo Si alguna vez decide restaurar el men� original tema de Wii,>>"%Drive%"\%guidename%
echo Simplemente basta con abrir MyMenuifyMod pulse de nuevo el bot�n de inicio.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
:noMyM

if /i "%USBGUIDE%" EQU "Y" goto:USBGUIDESTEP1


::--------------------After Modding-----------------------
:AFTERMODDING

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) DESPU�S DE MODIFICAR>>"%Drive%"\%guidename%
echo    =============>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1

echo .>>"%Drive%"\%guidename%


echo Cuando haya terminado de modificar tu Wii, si lo desea, puede borrar todos los archivos innecesarios>>"%Drive%"\%guidename%
echo mediante el uso de ModMii el "Liberador de espacio en un archivo". >>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

If /i "%BB1%" EQU "*" echo Si decide no utilizar la funci�n de limpieza de archivos, con el fin de evitar que se congele tu Wii cuando se accede al men� de la tarjeta SD, debe eliminar la carpeta "aktn' donde se guarda bannerbomb (SD:\private\wii\title\aktn) o cambiar el nombre completo de la carpeta "privado".>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo .>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo Si decide no utilizar la funci�n de limpieza de archivos, con el fin de evitar que se congele tu Wii cuando se accede al men� de la tarjeta SD, debe eliminar la carpeta "aktn' donde se guarda bannerbomb (SD:\private\wii\title\aktn) o cambiar el nombre completo de la carpeta "privado".>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo .>>"%Drive%"\%guidename%

echo En este momento est� pr�cticamente hecho.>>"%Drive%"\%guidename%
echo Ahora usted debe descargar las �ltimas aplicaciones homebrew y que fueron creados en>>"%Drive%"\%guidename%
echo la tarjeta SD (o disco duro USB FAT32) para que puedan ponerse en marcha a trav�s del HBC.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
if /i "%USBGUIDE%" EQU "Y" goto:skip
echo Para la reproducci�n de las copias de seguridad de un disco duro USB, ejecutar la funci�n de Configuraci�n de USB-Loader desde el men� principal de ModMii>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
:skip

echo Para la descarga de aplicaciones, usted debe:>>"%Drive%"\%guidename%
echo * Echa un vistazo a las p�ginas ModMii de lotes de descarga, ya que tiene muchas aplicaciones populares disponibles para su descarga.>>"%Drive%"\%guidename%
echo * Descargar Navegador Homebrew a trav�s de ModMii para conseguir muchas aplicaciones populares, pero esto es s�lo una solicitud en l�nea de Wii (www.sites.google.com/site/completesg/how-to-use/HBB)>>"%Drive%"\%guidename%
echo * Para los que no tienen internet en su Wii, echa un vistazo a esta lista de aplicaciones homebrew (wiibrew.org/wiki/List_of_all_homebrew).>>"%Drive%"\%guidename%
echo Otro gran recurso es webrewwii.blogspot.com>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Despu�s de conseguir todas las aplicaciones que desea, usted debe obtener un archivo boot.dol y posiblemente un icon.png y meta.xml.>>"%Drive%"\%guidename%
echo Para HBC pueda leer su tarjeta SD/USB correctamente, la tarjeta debe estar estructurada SD:/apps/nombre de la aplicaci�n/boot.dol>>"%Drive%"\%guidename%
echo Si tiene un *.dol que no se llame boot.dol, cambiale el nombre a boot.dol, de lo contrario no ser� reconocido por el HBC.>>"%Drive%"\%guidename%
echo (opcional:el icon.png y meta.xml se debe guardar en el mismo lugar que el boot.dol)>>"%Drive%"\%guidename%


::---------------------support XFLAK-----------------------
:supportxflak

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) SOPORTE XFLAK>>"%Drive%"\%guidename%
echo    =============>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo SI MODMII TRABAJ� PARA USTED, POR FAVOR VOTA A FAVOR DEL PROGRAMA AQUI (tinyurl.com/ModMiiNow)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo DONACIONES OPCIONALMENTE SE PUEDEN REALIZAR A TRAVES DE PAYPAL A XFLAK40@HOTMAIL.COM>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo IR A LOS MEJORES CANALES AQUI (tinyurl.com/topchannels)>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo OJEADA A MIS VIDEOS CRACY INTRO AQUI (tinyurl.com / crazyintro)>>"%Drive%"\%guidename%

support\sfk filter "%Drive%"\%guidename% -lsrep _.__ -write -yes>nul
start notepad "%Drive%\%guidename%"

::---------------CMD LINE MODE-------------
if /i "%cmdlinemode%" NEQ "Y" goto:notcmdfinish
if /i "%cmdguide%" NEQ "G" goto:notcmdfinish
if exist support\settings.bak move /y support\settings.bak support\settings.bat>nul
exit
:notcmdfinish


if /i "%SETTINGS%" EQU "G" goto:DOWNLOADQUEUE
if /i "%SETTINGSHM%" EQU "G" goto:HACKMIISOLUTION

goto:DLSETTINGS2





::--------------------------------------HACKMII SOLUTIONS GUIDE--------------------------------------
:HMguide
set guidename=ModMiiGuide_HackMiiFix.txt

SET COUNT7=1
cls
if /i "%SETTINGS%" EQU "G" echo Generating Guide, please wait.
if /i "%SETTINGS%" NEQ "G" echo Generating Guide, please wait, your downloads will begin shortly.

if not exist "%Drive%" mkdir "%Drive%" >nul
if not exist "%Drive%"\%guidename% goto:norename1
SET /a COUNT6=%COUNT6%+1
if exist "%Drive%"\ModMiiGuide_HackMiiFix%COUNT6%.txt goto:HMguide
move "%Drive%"\%guidename% "%Drive%"\ModMiiGuide_HackMiiFix%count6%.txt >nul
:norename1




echo ModMii %currentversion% HackMii Gu�a de soluciones>"%Drive%"\%guidename%
echo generada en %DATE% - %TIME%>>"%Drive%"\%guidename%
echo Comprobar si hay actualizaciones en tinyurl.com/ModMiiNow>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Esta Gu�a fue generada usando los siguientes par�metros:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%FIRMSTART%" NEQ "o" echo                * Firmware actual es %FIRMSTART%%REGION%>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo                * Firmware actual es inferior a 2,2>>"%Drive%"\%guidename%



echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Este software no est� a la venta. Si usted pag� por este software o un "paquete" que han sido estafados.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo ESTE PAQUETE NO VIENE CON ABSOLUTAMENTE NINGUNA GARANTIA.>>"%Drive%"\%guidename%
echo SOLAMENTE USTED SERA RESPONSABLE POR CUALQUIER ERROR QUE ESTO PUEDA CAUSAR A SU CONSOLA WII DE NINTENDO!>>"%Drive%"\%guidename%
echo USE ESTO BAJO SU PROPIO RIESGO!>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


echo NOTAS IMPORTANTES:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo *Esta gu�a no requiere una conexi�n Wi-Fi en tu Wii.>>"%Drive%"\%guidename%
echo *Una tarjeta SD con formato FAT(32) requerida (los mejores resultados son con las no-SDHC, SDHC s�lo funcionar� en 4.0 o superior).>>"%Drive%"\%guidename%
echo *Si se producen errores durante alguno de los pasos a formatear la tarjeta SD como FAT o FAT32>>"%Drive%"\%guidename%
echo *Apague WiiConnect24 y sacar todas las tarjetas de memoria de GameCube/controladores cuando modifique la Wii (a menos que se indique lo contrario).>>"%Drive%"\%guidename%
echo *Si tu Wii cada vez se congela, mantenga pulsado el bot�n de encendido en la Wii durante 5 segundos para apagarlo y vuelva a intentarlo.>>"%Drive%"\%guidename%
echo *No vuelvas a aceptar una nueva actualizaci�n de Nintendo sin primero googlear para ver si es seguro. La �ltima actualizaci�n (a 4.3) fue lanzado a finales de junio de 2010 y no es seguro de aceptar. Si usted acepta una actualizaci�n oficial de Nintendo despu�s de modificar la Wii, usted puede perder parte o la totalidad de sus modificaciones.>>"%Drive%"\%guidename%
echo *Nunca desinstalar un men� de sistema o de IOS>>"%Drive%"\%guidename%
echo *No instale wads sin probar/o temas sin BootMii o Priiloader instalado.>>"%Drive%"\%guidename%
echo *Esta gu�a personalizada es buen comienzo, pero Wii la modificaci�n siempre est� evolucionando. Buscar actualizaciones en l�nea, y recuerda, Google es tu amigo.>>"%Drive%"\%guidename%
echo *Si tiene alguna pregunta, una gu�a m�s detallada se puede encontrar aqu�: www.sites.google.com/site/completesg/>>"%Drive%"\%guidename%
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

echo %COUNT7%) LANZAN Multi-Mod Manager (MMM)>>"%Drive%"\%guidename%
echo    ==============================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo iniciar el Homebrew Channel (HBC) y cargar Multi-Mod Manager (MMM). Una vez que haya cargado MMM, pasar al siguiente paso.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Si le falta el HBC o est� fallando para cargar cualquier aplicaci�n (s�lo blackscreens), tendr� que poner en marcha MMM con cualquier otro m�todo.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%




If /i "%exploitnum%" GEQ "2" echo EXPLOITS>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo S�lo necesita utilizar uno de los siguientes exploits>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
If /i "%exploitnum%" GEQ "2" echo.>>"%Drive%"\%guidename%


If /i "%BB1%" EQU "*" goto:skipforwardersolution
If /i "%BB2%" EQU "*" goto:skipforwardersolution
echo Nota: si �sta Wii se ha modificado previamente, y que todav�a tiene instalado un canal Forwarder, se puede utilizar para lanzar MMM que en lugar de un exploit. S�lo tiene que guardar el boot.dol de la aplicaci�n que desea cargar (es decir, SD:\apps\MMM\boot.dol) a la ubicaci�n que utiliza su canal Forwarder ESPEC�FICO (es decir, SD:\apps\usbloader\boot.dol) . A continuaci�n, iniciar el canal y la aplicaci�n se cargar�.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


if /i "%FIRMSTART%" EQU "o" echo Alternativamente, usted puede actualizar su Wii a la versi�n 3.0-4.2 con un disco (es decir, NSMBW). A continuaci�n, repita el Asistente ModMii con su nuevo firmware y entonces ser� capaz de usar el exploit bannerbomb (que no requiere de un disco espec�fico para la ejecuci�n)>>"%Drive%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo.>>"%Drive%"\%guidename%

if /i "%REGION%" EQU "U" goto:skipforwardersolution
if /i "%REGION%" EQU "E" goto:skipforwardersolution
if /i "%FIRMSTART%" EQU "o" echo ADVERTENCIA: actualizaci�n en l�nea de Corea hace que v4.3 de Wii injakeable (a menos que previamente ten�a HBC v1.0.7, BootMii como Boot2v4, o instalar un canal forwarder.>>"%DRIVE%"\%guidename%
if /i "%FIRMSTART%" EQU "o" echo .>>"%Drive%"\%guidename%
:skipforwardersolution

goto:EXPLOITSNOW


:HMsolution2

::If /i "%BB2%" EQU "*" echo Ejecutar bannerbomb v2, seleccionando el bot�n de la tarjeta SD en la pantalla del sistema de men� principal y eligiendo que s� a la carga de boot.dol/elf>>"%Drive%"\%guidename%
::If /i "%BB1%" EQU "*" echo Ejecutar bannerbomb v1, vaya a Configuraci�n, Gesti�n de Datos, los canales, tarjeta SD y eligiendo s� a la carga de boot.dol/elf>>"%Drive%"\%guidename%
::echo Nota: Si no funciona para usted, visite http://bannerbomb.qoid.us/ para m�s variaciones de cualquiera de las versiones de bannerbomb.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


echo %COUNT7%) INSTALAR ALGUNOS IOSs UTILIZANDO Multi-Mod Manager (MMM)>>"%Drive%"\%guidename%
echo    ===============================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo En el men� principal de Multi-Mod Manager, ir hacia abajo para seleccionar "WAD Manager".>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Si no puede cargar su tarjeta SD, seleccione "Cargar otra IOS", a continuaci�n, seleccione IOS36.>>"%Drive%"\%guidename%
echo Si la Wii fue modificada anteriormente, intente cargar cIOS250 (u otros como 202,222,223,224,236,249).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Ahora marca de cada uno de los WADs siguientes para la instalaci�n, vaya hasta cada WAD y marcalo con el bot�n +>>"%Drive%"\%guidename%
echo Alternativamente, puede mantener + para marcar todos los WADs de la lista para la instalaci�n.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%IOS30P60%" EQU "*" echo      * IOS30v16174(IOS60v6174[FS-ES-NP-VP])>>"%Drive%"\%guidename%
if /i "%IOS31%" EQU "*" echo      * IOS31v3608>>"%Drive%"\%guidename%
if /i "%IOS33%" EQU "*" echo      * IOS33v3608>>"%Drive%"\%guidename%
if /i "%IOS34%" EQU "*" echo      * IOS34v3608>>"%Drive%"\%guidename%
if /i "%IOS35%" EQU "*" echo      * IOS35v3608>>"%Drive%"\%guidename%
if /i "%IOS36v3608%" EQU "*" echo      * IOS36v3608>>"%Drive%"\%guidename%
if /i "%IOS58%" EQU "*" echo      * IOS58v6176>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Despu�s de haber marcado los WADs arriba, pulsa 'A' dos veces para instalarlos todos.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Tenga cuidado de no instalar ning�n wads adicionales que se han guardado previamente en esta carpeta (que puede ser seguro, pero no puedo decir con seguridad).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


echo Si hay archivos no se puedan instalar correctamente, permanecer�n marcados para su instalaci�n, as� que vuelva a intentar la instalaci�n de los archivos.>>"%Drive%"\%guidename%

echo S�lo pase al siguiente paso despu�s de instalar los WADs m�s arriba, pero no salga del MMM.>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%


echo %COUNT7%) INSTALACI�N DEL HOMEBREW CHANNEL (HBC)>>"%Drive%"\%guidename%
echo    ==================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo En el men� principal de MMM, seleccione "Administrador de la aplicaci�n" y luego seleccionar el HackMii_Installer.>>"%Drive%"\%guidename%

echo Utilice el Hackmii_Installer arreglar / volver a instalar el HBC. Si no lo ha hecho, tambi�n debe instalar BootMii como boot2 (si es posible).>>"%Drive%"\%guidename%


echo Una vez que haya vuelto a instalar con �xito el HBC, ya ha terminado con esta gu�a.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%


echo Si ya sali� del MMM, se puede cargar el HackMii_Installer desde el Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Si el HBC no carga ninguna aplicaci�n (s�lo pantallazos negros), en lugar de lanzar el MMM utilizando el m�todo descrito en el paso 1, a continuaci�n, en el men� principal de MMM, seleccione "Administrador de la aplicaci�n" y luego seleccionar el HackMii_Installer.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo Esto iniciar� el instalador de HackMii, lo utilizan para instalar el Homebrew Channel.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

If /i "%BB1%" EQU "*" echo Cuando haya terminado de modificar su Wii, con el fin de evitar que se congele su Wii cuando se accede al men� de la tarjeta SD, debe de borrar la carpeta "aktn ' donde se guarda bannerbomb (SD:\private\wii\title\aktn), o cambiar el nombre de la carpeta "privado".>>"%Drive%"\%guidename%
If /i "%BB1%" EQU "*" echo .>>"%Drive%"\%guidename%
If /i "%BB2%" EQU "*" echo Cuando haya terminado de modificar su Wii, con el fin de evitar que se congele su Wii cuando se accede al men� de la tarjeta SD, debe de borrar la carpeta "aktn ' donde se guarda bannerbomb (SD:\private\wii\title\aktn), o cambiar el nombre de la carpeta "privado".>>"%Drive%"\%guidename%
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
if /i "%SETTINGS%" EQU "G" echo Generando Gu�a, por favor espere.
if /i "%SETTINGS%" NEQ "G" echo Generando Gu�a, por favor espere, su descarga se iniciar� en breve.

if not exist "%Drive%" mkdir "%Drive%" >nul
if not exist "%Drive%"\%guidename% goto:norename
SET /a COUNT6=%COUNT6%+1
if exist "%Drive%"\ModMiiGuide_USBLoaderSetup%COUNT6%.txt goto:usbguide
move "%Drive%"\%guidename% "%Drive%"\ModMiiGuide_USBLoaderSetup%count6%.txt >nul
:norename

echo ModMii %currentversion% USB-Loader Setup Custom Guide>"%Drive%"\%guidename%
echo Generated on %DATE% - %TIME%>>"%Drive%"\%guidename%
echo Check for updates at tinyurl.com/ModMiiNow>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%





echo Esta Gu�a se ha generado mediante los siguientes par�metros:>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%FORMAT%" EQU "4" goto:skip
if /i "%FORMAT%" EQU "5" goto:skip
echo                * Disco duro externo a de tener el formato %FORMATNAME%>>"%Drive%"\%guidename%
goto:skip2
:skip
echo                * Disco duro externo ya est� con formato %FORMATNAME%>>"%Drive%"\%guidename%
:skip2
if /i "%USBFolder%" EQU "*" echo                * Descargar Configurable USB-Loader>>"%Drive%"\%guidename%
if /i "%FLOW%" EQU "*" echo                * Descargar WiiFlow>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo                * USB-Loader Configuraci�n y los archivos de configuraci�n guardados en disco duro USB>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo                * Configuraci�n y los archivos de configuraci�n guardados en la tarjeta SD>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Este software no est� a la venta. Si usted pag� por este software o un "paquete" que han sido estafados.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo ESTE PAQUETE NO VIENE CON ABSOLUTAMENTE NINGUNA GARANTIA.>>"%Drive%"\%guidename%
echo SOLAMENTE USTED SERA RESPONSABLE POR CUALQUIER ERROR QUE ESTO PUEDA CAUSAR A SU CONSOLA WII DE NINTENDO>>"%Drive%"\%guidename%
echo USE ESTO BAJO SU PROPIO RIESGO!>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo NOTAS IMPORTANTES:>>"%Drive%"\%guidename%
echo ---------------->>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo *cIOS(s) requeridos para USB-Loaders, si le faltan cIOS(s) ejecutar el Asistente para la funci�n de ModMii modificar su Wii antes de instalar el USB-Loader y/o disco duro externo.>>"%Drive%"\%guidename%
echo *cIOS249 rev18 o superior para utilizar discos duros formateados en FAT32 o NTFS (cIOS222 rev4 o superior tambi�n funciona, pero usted tendr�a que descargar la versi�n de 222 configurable usb-Loader o modificar el archivo config.txt para configurar USB-Loader)>>"%Drive%"\%guidename%
echo *No todos los discos duros externos son compatibles con la Wii, para obtener una lista de disco duro USB que son compatibles, consulte la p�gina: http://wiki.gbatemp.net/wiki/USB_Devices_Compatibility_List>>"%Drive%"\%guidename%
echo *Si tiene alguna pregunta, una gu�a m�s detallada se puede encontrar aqu�: www.sites.google.com/site/completesg/>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



:USBGUIDESTEP1

if /i "%MENU1%" NEQ "W" goto:skip

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo ======================================================================================>>"%Drive%"\%guidename%
echo EL RESTO DE LA GUIA SE REALIZA EN SU ORDENADOR PARA CONFIGURAR SU USB-LOADER>>"%Drive%"\%guidename%
echo ======================================================================================>>"%Drive%"\%guidename%

:skip



if /i "%FORMAT%" NEQ "3" goto:skippartition
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) PARTICIONAR Y FORMATEAR EL DISCO DURO EXTERNO>>"%Drive%"\%guidename%
echo    ============================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Si usted tiene algo guardado en el disco duro, debe hacer una copia de seguridad ahora ya que todos los datos se perder�n una vez que complete este paso.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo Haga clic en boton derecho de 'Mi PC' y seleccione 'Manage', una nueva ventana se abrir�, en "Administraci�n de discos" haga clic en panel de la izquierda.>>"%Drive%"\%guidename%
echo Haga clic en el disco que desea particionar (aseg�rese de seleccionar la unidad correcta!), A continuaci�n, seleccione "Eliminar volumen...">>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo En el men� mitad inferior de la ventana, busque el espacio sin asignar, haga clic derecho y seleccione "Nuevo volumen simple...">>"%Drive%"\%guidename%
echo Enter the 'volume size' you want your FAT32 partition to be, and click 'Next'.>>"%Drive%"\%guidename%
echo Elija una letra de unidad para esta partici�n y haga clic en "Siguiente" (Tome nota de la letra de la unidad, ya que ser� necesario m�s adelante)>>"%Drive%"\%guidename%
echo Usted probablemente no ser� capaz de cambiar el sistema de archivos FAT32 (s�lo dar� esa opci�n si el tama�o del volumen es menor de 32 GB)>>"%Drive%"\%guidename%
echo Si no est� la opci�n FAT32, seleccione 'No formatear este volumen ", y haga clic en" Siguiente ">>"%Drive%"\%guidename%
echo (no importa si se formatea el volumen porque lo van a formatear a FAT32 m�s adelante)>>"%Drive%"\%guidename%


echo .>>"%Drive%"\%guidename%

echo En el men� mitad inferior de la ventana, busque la espacio no asignado restante (para la partici�n NTFS), haz clic derecho y seleccione "Nuevo volumen simple....">>"%Drive%"\%guidename%
echo Haga clic en "Siguiente" (para dar formato a todo el espacio del disco restante).>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Elija una letra de unidad para esta partici�n y haga clic en "Siguiente".>>"%Drive%"\%guidename%
echo Aseg�rese de que el sistema de archivos est� en NTFS a continuaci�n el nombre de la partici�n/volumen,>>"%Drive%"\%guidename%
echo Si lo desea, puede desmarcar el "Formato r�pido", haga clic en "Siguiente" y luego haga clic en "Finalizar".>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

::-----FAT32 format on unformatted partition------
echo Si lograste dar formato a la primera partici�n como FAT32, puede saltarse el resto de este paso.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

::echo Lanzar WiiBackupManager.exe guardado aqu�:>>"%Drive%"\%guidename%
::if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::echo .>>"%Drive%"\%guidename%
::echo En la parte superior de la ventana WiiBackupManager, vaya a: Herramientas--Unidades de formato...>>"%Drive%"\%guidename%
::echo Aseg�rese de seleccionar la letra de unidad correspondiente a la partici�n que desea formatear como FAT32.>>"%Drive%"\%guidename%
::echo Aseg�rese de que el sistema de archivos se establece en FAT32 y el tama�o del cl�ster es de 32 KB, a continuaci�n, haga clic en iniciar.>>"%Drive%"\%guidename%






if /i "%PCSAVE%" EQU "Portable" goto:portableF32
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" NEQ "%ModMiipath:~0,2%" goto:portableF32
:skip

echo Lanzar FAT32 GUI formateador desde accesos directos en el men� Inicio o escritorio>>"%Drive%"\%guidename%
goto:noportableF32

:portableF32
echo Launch FAT32_GUI_Formatter.exe saved here:>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\FAT32_GUI_Formatter\FAT32_GUI_Formatter.exe>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\FAT32_GUI_Formatter\FAT32_GUI_Formatter.exe>>"%Drive%"\%guidename%
:noportableF32



echo .>>"%Drive%"\%guidename%
echo Aseg�rese de seleccionar la letra de unidad correspondiente a la partici�n que desea formatear como FAT32.>>"%Drive%"\%guidename%
echo Si lo desea, puede desmarcar la casilla "Formato r�pido", a continuaci�n, haga clic en iniciar.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%



:skippartition


if /i "%FORMAT%" EQU "3" goto:skipformat
if /i "%FORMAT%" EQU "4" goto:skipcopytousb
if /i "%FORMAT%" EQU "5" goto:skipcopytousb

echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) FORMATEAR EL DISCO DURO EXTERNO (si es aplicable)>>"%Drive%"\%guidename%
echo    ==============================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo En primer lugar comprobar si el disco necesita ser formateado mediante la comprobaci�n del formato actual \ del sistema de archivos de la unidad.>>"%Drive%"\%guidename%
echo Abra "Mi PC", haga clic en el disco duro externo que desee utilizar, a continuaci�n, seleccione 'Propiedades'.>>"%Drive%"\%guidename%
echo Tome nota de la letra de la unidad del disco duro externo ya que esto ser� importante m�s adelante.>>"%Drive%"\%guidename%
echo Si el "sistema de archivos" ya tiene %FORMATNAME%, usted puede saltar este paso.>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Si usted tiene algo guardado en el disco duro, usted deber�a volver ahora que todos los datos se perder�n una vez que le de formato.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

if /i "%FORMAT%" EQU "2" goto:formatNTFS
::echo Lanzar WiiBackupManager.exe guardado aqu�:>>"%Drive%"\%guidename%
::if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::echo .>>"%Drive%"\%guidename%

::echo En la parte superior de la ventana de WiiBackupManager, vaya a: Herramientas - Unidades de formato...>>"%Drive%"\%guidename%
::echo Aseg�rese de seleccionar la letra de unidad correspondiente a la partici�n que desea formatear como FAT32.>>"%Drive%"\%guidename%
::echo Aseg�rese de que el sistema de archivos se establece en FAT32 y el tama�o del cl�ster es de 32KB, a continuaci�n, haga clic en inicio.>>"%Drive%"\%guidename%


if /i "%PCSAVE%" EQU "Portable" goto:portableF32
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" NEQ "%ModMiipath:~0,2%" goto:portableF32
:skip

echo Lanzar FAT32 GUI formatter desde accesos directos en el men� Inicio o el escritorio>>"%Drive%"\%guidename%
goto:noportableF32

:portableF32
echo Lanzar FAT32_GUI_Formatter.exe guardado aqu�:>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\FAT32_GUI_Formatter\FAT32_GUI_Formatter.exe>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\FAT32_GUI_Formatter\FAT32_GUI_Formatter.exe>>"%Drive%"\%guidename%
:noportableF32


echo .>>"%Drive%"\%guidename%
echo Aseg�rese de seleccionar la letra de unidad correspondiente a su disco duro externo.>>"%Drive%"\%guidename%
echo Si lo desea, puede desmarcar la casilla "Formato r�pido", a continuaci�n, haga clic en inicio.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

goto:notformatNTFS

:formatNTFS
::echo Lanzar WiiBackupManager.exe guardado aqu�:>>"%Drive%"\%guidename%
::if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
::echo .>>"%Drive%"\%guidename%

::echo En la parte superior de la ventana de WiiBackupManager, vaya a: Herramientas - Unidades de formato...>>"%Drive%"\%guidename%
::echo Aseg�rese de seleccionar la letra de unidad correspondiente a la partici�n que desea formatear como NTFS.>>"%Drive%"\%guidename%
::echo Aseg�rese de que el sistema de archivos se establece en NTFS, haga clic en Iniciar.>>"%Drive%"\%guidename%

echo Haga clic derecho en 'Mi PC' y seleccione 'Administrar', una nueva ventana se abrir�, en "Administraci�n de discos" haga clic en el panel izquierdo.>>"%Drive%"\%guidename%
echo Haga clic derecho en la unidad que desea formatear (aseg�rese de seleccionar la unidad de la derecha!), A continuaci�n, seleccione "Formato...'>>"%Drive%"\%guidename%
echo Seleccione "NTFS", como sistema de archivos para su uso y la entrada de un nombre para el volumen/unidad de disco.>>"%Drive%"\%guidename%
echo Si lo desea, puede desactivar el "Formato r�pido" en el cuadro de texto, haga clic en 'Aceptar', luego haga clic en 'Aceptar' de nuevo.>>"%Drive%"\%guidename%

:notformatNTFS


:skipformat


if /i "%USBCONFIG%" NEQ "USB" goto:skipcopytousb
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) COPIAR ARCHIVOS AL DISCO DURO>>"%Drive%"\%guidename%
echo    ========================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Copia todo dentro del %DRIVEU% carpeta a la ra�z de tu disco duro FAT32\partici�n.>>"%Drive%"\%guidename%

:skipcopytousb



echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) ADMINISTRAR COPIAS DE SEGURIDAD WII CON WII BACKUP MANAGER (OPCIONAL)>>"%Drive%"\%guidename%
echo    ======================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%


if /i "%PCSAVE%" EQU "Portable" goto:portableWBM
if /i "%PCSAVE%" NEQ "Auto" goto:skip
if /i "%Homedrive%" NEQ "%ModMiipath:~0,2%" goto:portableWBM
:skip

echo lanzar WiiBackupManager desde accesos directos en el men� Inicio o el escritorio>>"%Drive%"\%guidename%
goto:noportableWBM

:portableWBM
echo Lanzar WiiBackupManager.exe guardado aqu�:>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\WiiBackupManager\WiiBackupManager.exe>>"%Drive%"\%guidename%
:noportableWBM

echo .>>"%Drive%"\%guidename%

echo Puede utilizar este programa para gestionar/transferir las copias de seguridad electr�nica de los juegos de Wii.>>"%Drive%"\%guidename%
echo Es muy sencillo de utilizar, pero un tutorial detallado sobre el Administrador de copia de seguridad de Wii se puede encontrar aqu�:>>"%Drive%"\%guidename%
echo www.sites.google.com/site/completesg/backup-launchers/iso/wbfs-managers/wii-backup-manager>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Nota: Discos Originales Wii no se pueden leer/copiar mediante el uso de una computadora (a menos que tenga una de las pocas unidades de LG que es capaz de hacerlo)>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Para copiar discos ORIGINALES Wii, inserte el disco en la Wii y...>>"%Drive%"\%guidename%
if /i "%USBFOLDER%" EQU "*" echo       - Lanze Configurable USB-Loader, y pulsa en el signo m�s '+'.>>"%Drive%"\%guidename%
if /i "%LOADER%" EQU "ALL" echo         O>>"%Drive%"\%guidename%
if /i "%FLOW%" EQU "*" echo       - Lanzar WiiFlow, ir a la p�gina 2 de configuraci�n WiiFlow y seleccione "Instalar", luego seleccione "Go".>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
if /i "%FORMAT%" EQU "2" echo Advertencia: Extracci�n para NTFS es muy inestable, se recomienda agregar solamente los juegos en un disco duro NTFS usando su computadora.>>"%Drive%"\%guidename%
if /i "%FORMAT%" EQU "3" echo Advertencia: Extracci�n para NTFS es muy inestable, se recomienda agregar solamente los juegos en un disco duro NTFS usando su computadora.>>"%Drive%"\%guidename%



if /i "%USBFOLDER%" NEQ "*" goto:skip
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%

echo %COUNT7%) CONFIGURAR/PERSONALIZAR CONFIGURABLE USB-LOADER (OPCIONAL)>>"%Drive%"\%guidename%
echo    ======================================================>>"%Drive%"\%guidename%
SET /a COUNT7=%COUNT7%+1
echo .>>"%Drive%"\%guidename%

echo Para configurar/Personaliza tu USB-Loader, utilice el configurador para Configurable USB-Loader lo encontrara aqu�:>>"%Drive%"\%guidename%

if /i "%USBCONFIG%" EQU "USB" echo %DRIVEU%\usb-loader\CfgLoaderConfigurator.exe>>"%Drive%"\%guidename%
if /i "%USBCONFIG%" NEQ "USB" echo %DRIVE%\usb-loader\CfgLoaderConfigurator.exe>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo Opcional: otros temas se puede encontrar aqu�:>>"%Drive%"\%guidename%
echo http://wii.spiffy360.com/themes.php>>"%Drive%"\%guidename%

echo .>>"%Drive%"\%guidename%

echo * NOTAS IMPORTANTES SOBRE LOS VALORES PREDETERMINADOS:>>"%Drive%"\%guidename%
echo   ------------------------------------>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Dos caracter�sticas potencialmente peligrosas han sido bloqueadas:>>"%Drive%"\%guidename%
echo      1) La capacidad de eliminar/borrar juegos>>"%Drive%"\%guidename%
echo      2) la capacidad de formatear un disco duro.>>"%Drive%"\%guidename%
echo .>>"%Drive%"\%guidename%
echo Para desbloquear estas caracter�sticas, con el configurable USB-Loader men�, mantenga '1 'durante 5 segundos, a continuaci�n, introduzca la contrase�a para desbloquear estas caracter�sticas. La contrase�a es "AAAA", puede cambiar la configuraci�n de contrase�a / mediante el uso de la configuraci�n para Configurable USB Loader. Mantenga '1 'de nuevo durante 5 segundos para bloquear el USB-Loader de nuevo (o se bloquear� de nuevo autom�ticamente una vez que salga de la USB-Loader).>>"%Drive%"\%guidename%

:skip

if /i "%MENU1%" EQU "W" goto:AFTERMODDING

GOTO:supportxflak
