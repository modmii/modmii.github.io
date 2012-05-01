@echo off
setlocal

chdir /d "%~dp0"
if not exist support cd..

::PUSHD "%cd%"
::::PUSHD "%~dp0"
::POPD

title ModMiiSkinCMD

::make cmd window transparent and hidden
support\nircmd.exe win trans ititle "ModMiiSkinCMD" 0
support\nircmd.exe win hide ititle "ModMiiSkinCMD"

::-------------------CMD LINE SUPPORT----------------------
::pass all arguments to modmii classic

set one=%~1
if "%one%"=="" (goto:notcmd)

set cmdinput=%*
set cmdinput=%cmdinput:"=%

::ModMii.exe %cmdinput%
start ModMii.exe %cmdinput%
Exit

:notcmd

::----------------------------------------------------------

set currentversion=6.0.7
set currentversioncopy=%currentversion%
set agreedversion=

set SkinMode=Y

set PATH=%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%

chcp 437>nul
::chcp 1252>nul

if not exist temp mkdir temp

set UPDATENAME=ModMii_SP_
::set UPDATENAME=ModMii_IT_


if exist Updatetemp.bat attrib -h Updatetemp.bat
if exist Updatetemp.bat del updatetemp.bat>nul


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
IF "%OPTION36%"=="" set OPTION36=on
IF "%AudioOption%"=="" set AudioOption=on
IF "%CMIOSOPTION%"=="" set CMIOSOPTION=off
IF "%FWDOPTION%"=="" set FWDOPTION=on
IF "%Drive%"=="" set Drive=COPY_TO_SD
IF "%DriveU%"=="" set DriveU=COPY_TO_USB
IF "%ACTIVEIOS%"=="" set ACTIVEIOS=on
IF "%AUTOUPDATE%"=="" set AUTOUPDATE=on
IF "%ModMiiverbose%"=="" set ModMiiverbose=off
IF "%sneekverbose%"=="" set sneekverbose=off
IF "%neek2o%"=="" set neek2o=on
IF "%SSD%"=="" set SSD=off
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
if /i "%DRIVE%" NEQ "COPY_TO_SD" goto:skip
set DRIVE="%cd%\COPY_TO_SD"
set DRIVE=%DRIVE:&=^&%
set DRIVE=%DRIVE:~1,-1%
:skip

if /i "%DRIVE:~1,1%" EQU ":" goto:skip
set DRIVE="%cd%\%DRIVE%"
set DRIVE=%DRIVE:&=^&%
set DRIVE=%DRIVE:~1,-1%
:skip


::check if DRIVEU folder exists--if second char is ":" check if DRIVEU exists
if /i "%DRIVEU%" NEQ "COPY_TO_USB" goto:skip
set DRIVEU="%cd%\COPY_TO_USB"
set DRIVEU=%DRIVEU:&=^&%
set DRIVEU=%DRIVEU:~1,-1%
:skip

if /i "%DRIVEU:~1,1%" EQU ":" goto:skip
set DRIVEU="%cd%\%DRIVEU%"
set DRIVEU=%DRIVEU:&=^&%
set DRIVEU=%DRIVEU:~1,-1%
:skip


if /i "%ModMiiverbose%" EQU "on" support\nircmd.exe win activate ititle "ModMiiSkinCMD"
if /i "%ModMiiverbose%" EQU "on" support\nircmd.exe win trans ititle "ModMiiSkinCMD" 255

if /i "%ModMiiverbose%" EQU "off" (set ModMiimin=/min ) else (set ModMiimin=)


set watitle=ModMii Skin
set waico=support\icon.ico
set temp=temp
set wabat=%TEMP%\wabat.bat
set wasig=ModMii v%currentversion% by XFlak

::side bar - 150x300 pixels
set wabmp=support\bmp\default.bmp





if not exist support\skipscam.txt goto:nocheck
findStr /I /C:"%USERPROFILE%" "support\skipscam.txt" >nul
IF ERRORLEVEL 1 (set Trigger=) else (set Trigger=1)
if /i "%Trigger%" EQU "1" goto:skip
:nocheck


::Splash Screen for Scam Warning
::if /i "%AGREEDVERSION%" EQU "%CURRENTVERSION%" goto:nosplash


::Splash Screen - 440x340 pixel bmp
set wabmp=support\bmp\ModMiiSplash.bmp

support\wizapp SPLASH OPEN
if /i "%AGREEDVERSION%" NEQ "%CURRENTVERSION%" support\nircmd.exe wait 6000
support\nircmd.exe wait 2000
support\wizapp SPLASH CLOSE
:nosplash


::side bar - 150x300 pixels
set wabmp=support\bmp\TERMS.bmp

set waoutput=

set watext=~Por favor, escriba la palabra "yo", seguido de la palabra "acepto" con un espacio entre esas dos palabras y, a continuacion, haga clic en Siguiente para continuar.~~Si no puede seguir estas instrucciones, entonces no tiene sentido seguir modificando.


start /w support\wizapp NOBACK EB

if errorlevel 2 Exit

call "%wabat%"


if /i "%waoutput%" EQU "yo Acepto" goto:skip


if /i "%waoutput%" NEQ "skipscam" goto:miniskip
if exist support\skipscam.txt attrib -r -h -s support\skipscam.txt
echo "%USERPROFILE%">support\skipscam.txt
attrib +r +h +s support\skipscam.txt
set Trigger=1
goto:skip
:miniskip


set watext=~~~~~Ha introducido una clave incorrecta, saliendo de ModMii...

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
set wabmp=support\bmp\default.bmp

set watext=~ModMii Requiere .NET Framework 3.5...~~ModMii se descargara e iniciara el instalador para que, cuando haya terminado de instalar. NET Framework 3.5 ModMii continuara.

start support\wizapp PB OPEN

set FrameworkAttempt=0

:NETFRAMEWORK
start support\wizapp PB UPDATE 10
SET /a FrameworkAttempt=%FrameworkAttempt%+1

if exist "temp\dotNetFx35setup.exe" goto:semiskip

start %ModMiimin%/wait support\wget -t 3 "http://download.microsoft.com/download/7/0/3/703455ee-a747-4cc8-bd3e-98a615c3aedb/dotNetFx35setup.exe"

if exist dotNetFx35setup.exe move /y dotNetFx35setup.exe temp\dotNetFx35setup.exe
:semiskip

start support\wizapp PB UPDATE 50
start /wait temp\dotNetFx35setup.exe

if exist "%windir%\Microsoft.NET\Framework\v3.5" (start support\wizapp PB UPDATE 100) & (start support\wizapp PB CLOSE) & (goto:skipframeworkinstallation)

if /i "%FrameworkAttempt%" EQU "3" goto:GiveUpOnFramework
goto:NETFRAMEWORK

:GiveUpOnFramework
set watext=~~.NET Framework 3.5 Fallo en la Instalacion varias veces~~Si lo prefiere, puede intentar instalar. NET Framework 3.5 realizando una actualizacion de Windows~~Algunas de las caracteristicas de ModMii puede no funcionen correctamente sin ella. NET Framework 3.5 instalado~~Haga clic en "Siguiente", para usar de todos modos ModMii.


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
set wabmp=support\bmp\MAIN.bmp
set wafile=
set SNEEKTYPE=
set SNEEKSELECT=
set USBCONFIG=
SET UpdatesIOSQ=
set FORMAT=NONE
if /i "%ModMiiverbose%" EQU "off" (set ModMiimin=/min ) else (set ModMiimin=)
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


set watext=~~                           Elija una actividad:~~La mayoria de las actividades de ModMii crearan una guia personalizada para usted basada en sus respuestas en unas preguntas simples.

set wainput= Asistente ^&ModMii+Guia (Comenzar a modificar su Wii); ^&Asistente abstinencia+Guia (Use Casper sin mod); ^&Instalador USB-Loader+Guia; ^&Soluciones HackMii+Guia; C^&ambio Region+Guia; ^&Cargar cola Descarga; ^&Instalacion SNEEK y Creador NAND; ^&Opciones; Credi^&tos; ^&ModMii modo clasico para mas actividades

start /w support\wizapp NOBACK RB

if errorlevel 2 exit

call "%wabat%"

if "%waoutnum%"=="" goto:MENU

if /i "%waoutnum%" EQU "0" (set Menu1=W) & (set wabmp=support\bmp\WIZARD.bmp) & (goto:WPAGE1)

if /i "%waoutnum%" EQU "1" (set Menu1=S) & (set SNEEKSELECT=3) & (set AbstinenceWiz=Y) & (set wabmp=support\bmp\ABSTINENCE.bmp) & (goto:WPAGE2)

if /i "%waoutnum%" EQU "2" (set Menu1=U) & (set wabmp=support\bmp\USB.bmp) & (goto:UPAGE1)
if /i "%waoutnum%" EQU "3" (set Menu1=H) & (set wabmp=support\bmp\HackMii.bmp) & (goto:WPAGE2)
if /i "%waoutnum%" EQU "4" (set Menu1=RC) & (set wabmp=support\bmp\RegionChange.bmp) & (goto:RCPAGE1)
if /i "%waoutnum%" EQU "5" (set Menu1=L) & (set wabmp=support\bmp\DLQUEUE.bmp) & (goto:PICKDOWNLOADQUEUE)
if /i "%waoutnum%" EQU "6" (set Menu1=S) & (set wabmp=support\bmp\SNEEK.bmp) & (goto:SNKPAGE1)
if /i "%waoutnum%" EQU "7" (set Menu1=O) & (set wabmp=support\bmp\OPTIONS.bmp) & (goto:OPTIONS)


if /i "%waoutnum%" EQU "8" (start http://modmii.zzl.org/credits.html) & (goto:MENU)


if /i "%waoutnum%" EQU "9" (start ModMii.exe) & (exit)


::...................................PICK Download Queue...............................
:PICKDOWNLOADQUEUE
set DLQUEUE=
set waoutnum=
::set waoutput=
if not exist temp\DownloadQueues mkdir temp\DownloadQueues
set waoutput=%cd:&=^&%\temp\DownloadQueues\YourQueueHere.bat

set watext=Seleccione la cola de descarga que desea descargar.~~Nota, al hacer clic en Finish ModMii iniciara la descarga inmediatamente. Para ver el contenido de la cola antes de descargar utilice ModMii clasico para cargarla.~~Para crear colas de descarga personalizadas utilizar ModMii clasico.

set wainput=ModMii Cola Descarga (*.bat)


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp FINISH FB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:MENU

call "%wabat%"



set DLQUEUE=%waoutput:&=^&%

if not exist "%DLQUEUE%" goto:PICKDOWNLOADQUEUE

findStr /I /C:":endofqueue" "%DLQUEUE%" >nul
IF ERRORLEVEL 1 goto:PICKDOWNLOADQUEUE

copy /y "%DLQUEUE%" temp\DownloadQueues >nul

::get file name without path or extension
echo %DLQUEUE:&=^&% >temp\temp.txt
support\sfk filter -quiet temp\temp.txt -rep _*\__ -rep _.bat*__ -write -yes
set /p DLQUEUE= <temp\temp.txt


if not exist "%DRIVE:&=^&%" mkdir "%DRIVE:&=^&%"

set classicCMD=L %DLQUEUE:&=^&%

goto:StartModMiiClassic



::..................................................OPTIONS.................................................. 
.......
:OPTIONS
Set Options=
::set cheatoption=
set waoutnum=
set waoutput=

set watext=~~           Seleccione una opcion para revisar o cambiar:~~   Todas las configuraciones se guardan automaticamente~                           al hacer click en "Back"~              O click "Cancel" para ignorar los cambios


if /i "%AudioOption%" EQU "on" set wainput= Targeta SD ^&Unidad\ruta; ^&USB HDD Unidad\ruta; ^&Programas para PC ubicacion de Guardado; ^&Otras Opciones varias; ^&Opciones SNEEK; Buscar actualizaciones ModMii ^&Ahora; Desactivar el sonido al ^&Finalizar ( habilitado); ^&Restaurar configuracion por defecto

if /i "%AudioOption%" NEQ "on" set wainput= Targeta SD ^&Unidad\ruta; ^&USB HDD Unidad\ruta; ^&Programas para PC ubicacion de Guardado; ^&Otras Opciones varias; ^&Opciones SNEEK; Buscar actualizaciones ModMii ^&Ahora; Activar el sonido al ^&Finalizar (Desabilitado); ^&Restaurar configuracion por defecto

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
if /i "%waoutnum%" EQU "7" goto:RestoreSettings

::if /i "%waoutnum%" NEQ "6" goto:OPTIONS
if /i "%AudioOption%" EQU "on" (set AudioOption=off) else (set AudioOption=on)
goto:OPTIONS

::--------------------Restore Default Settings---------------------
:RestoreSettings
set ROOTSAVE=off
set effect=No-Spin
set PCSAVE=Auto
set OPTION1=off
set OPTION36=on
set AudioOption=on
set CMIOSOPTION=off
set FWDOPTION=on

set DRIVE="%cd%\COPY_TO_SD"
set DRIVE=%DRIVE:&=^&%
set DRIVE=%DRIVE:~1,-1%

set DRIVEU="%cd%\COPY_TO_USB"
set DRIVEU=%DRIVEU:&=^&%
set DRIVEU=%DRIVEU:~1,-1%

set ACTIVEIOS=on
set AUTOUPDATE=on
Set ModMiiverbose=off
Set SSD=off
Set sneekverbose=off
Set neek2o=on
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
set GuideOnly=off

goto:OPTIONS


::--------------------Save Settings---------------------
:SaveSettings
echo ::ModMii Settings > Support\settings.bat
echo ::ModMiiv%currentversion%>> Support\settings.bat
echo Set ROOTSAVE=%ROOTSAVE%>> Support\settings.bat
echo Set effect=%effect%>> Support\settings.bat
echo Set PCSAVE=%PCSAVE%>> Support\settings.bat
echo Set Option1=%Option1%>> Support\settings.bat
echo Set OPTION36=%OPTION36%>> Support\settings.bat
echo Set AudioOption=%AudioOption%>> Support\settings.bat
echo Set CMIOSOPTION=%CMIOSOPTION%>> Support\settings.bat
echo Set FWDOPTION=%FWDOPTION%>> Support\settings.bat


echo Set Drive=%DRIVE:&=^&%>>Support\settings.bat
echo Set DriveU=%DRIVEU:&=^&%>>Support\settings.bat
support\sfk filter -spat -quiet Support\settings.bat -rep _\x5e\x26_\x26_ -rep _\x26_\x5e\x26_ -write -yes>nul

support\sfk filter -spat -quiet Support\settings.bat -rep _\x5e\x26_\x26_ -rep _\x26_\x5e\x26_ -write -yes>nul

support\sfk filter -quiet Support\settings.bat -lerep _\__ -lerep _/__ -write -yes>nul



echo Set overwritecodes=%overwritecodes%>> Support\settings.bat
echo Set cheatregion=%cheatregion%>> Support\settings.bat
echo Set cheatlocation=%cheatlocation%>> Support\settings.bat
echo Set ACTIVEIOS=%ACTIVEIOS%>> Support\settings.bat
echo Set AUTOUPDATE=%AUTOUPDATE%>> Support\settings.bat
echo Set ModMiiverbose=%ModMiiverbose%>> Support\settings.bat
echo Set SSD=%SSD%>> Support\settings.bat
echo Set sneekverbose=%sneekverbose%>> Support\settings.bat
echo Set neek2o=%neek2o%>> Support\settings.bat
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
echo set GuideOnly=%GuideOnly%>> Support\settings.bat

::show\hide ModMiiSkinCMD
if /i "%ModMiiverbose%" EQU "on" support\nircmd.exe win activate ititle "ModMiiSkinCMD"
if /i "%ModMiiverbose%" EQU "on" support\nircmd.exe win trans ititle "ModMiiSkinCMD" 255

if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win trans ititle "ModMiiSkinCMD" 0
if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
goto:MENU

::..................................................PC SAVE.................................................. 
.......
:PCSAVE
::Set PCSAVE=
set waoutnum=
set waoutput=

set watext=~~          Ubicacion de guardado para Programas de PC~~Si se Autoselecciona guardado local de programas de PC en %homedrive% con accesos directos si se ejecuta desde ModMii %homedrive% y guardado en programas de PC portable si no se ejecuta desde ModMii %homedrive%

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

set watext=~~~~                   Otras Opciones varias

set wainput= ^&Auto-Actualizar ModMii al iniciar el programa; c^&MIOS incluido en Asistente-SysCheck; USB-Loader ^&Forwarder incluido en Asistente; ^&Actualizar IOSs activos en Asistente-SysCheck; Incluir IOS3^&6 en actualizaciones de IOS Activos; IOSs guardado en ^&Raiz en lugar de la carpeta WAD; ^&Salida Detallada para ModMiiSkin\wget y Sneek; Guardar carpeta 0000000^&1 de IOSs\SMs\etc; Guardar carpeta ^&NUS\00000001x de IOSs\SMs\etc; ^&Generar Guia unica (solo para funciones con guias)


::check correct boxes
set waoutput=
if /i "%AUTOUPDATE%" EQU "on" set waoutput=%waoutput%; #Auto-actualizacion ModMii al iniciar el programa
if /i "%CMIOSOPTION%" EQU "on" set waoutput=%waoutput%; c#MIOS includido en Asistente/Actualizador-sysCheck
if /i "%FWDOPTION%" EQU "on" set waoutput=%waoutput%; USB-Loader #Forwarder incluido en Asistente
if /i "%ACTIVEIOS%" EQU "on" set waoutput=%waoutput%; #Actualizar IOSs activos en Asistente/Actualizador-sysCheck
if /i "%OPTION36%" EQU "on" set waoutput=%waoutput%; Incluir IOS3#6 Actualizacion en los IOS activos
if /i "%ROOTSAVE%" EQU "on" set waoutput=%waoutput%; IOSs Guardado en #Raiz en lugar de la carpeta WAD
if /i "%ModMiiverbose%" EQU "on" set waoutput=%waoutput%; #Salida Detallada para ModMiiSkin\wget\Instalador Sneek

if /i "%Option1%" EQU "on" set waoutput=%waoutput%; Guardar carpeta 0000000#1 para IOSs\SMs\etc
if /i "%Option1%" EQU "all" set waoutput=%waoutput%; Guardar carpeta 0000000#1 para IOSs\SMs\etc

if /i "%Option1%" EQU "nus" set waoutput=%waoutput%; Guardar carpeta #NUS\00000001x para IOSs\SMs\etc
if /i "%Option1%" EQU "all" set waoutput=%waoutput%; Guardar carpeta #NUS\00000001x para IOSs\SMs\etc

if /i "%GuideOnly%" EQU "on" set waoutput=%waoutput%; #Generar Guia Personalizada (solo para funciones con guias)

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

findStr /I /C:"4" "%wabat%" >nul
IF not ERRORLEVEL 1 (set OPTION36=on) else (set OPTION36=off)

findStr /I /C:"5" "%wabat%" >nul
IF not ERRORLEVEL 1 (set ROOTSAVE=on) else (set ROOTSAVE=off)

findStr /I /C:"6" "%wabat%" >nul
IF not ERRORLEVEL 1 (set ModMiiverbose=on) else (set ModMiiverbose=off)

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

set watext=~~~~                             Opciones SNEEK

set wainput= Crear ^&neek2o lugar de NEEK original; ^&Acceso tarjeta SD habilitado para Sneek\Sneek+DI; SNEEK ^&salida detallada; ^&Modo Depuracion DML; ^&Font.bin de S\UNEEK+DI Blanco (en lugar de Negro)


::check correct boxes
set waoutput=
if /i "%neek2o%" EQU "on" set waoutput=%waoutput%; Crear #neek2o en lugar de NEEK  original
if /i "%SSD%" EQU "on" set waoutput=%waoutput%; #Acceso a tarjeta SD habilitado para SNEEK\SNEEK+DI
if /i "%sneekverbose%" EQU "on" set waoutput=%waoutput%; SNEEK #salida detallada
if /i "%SNKFONT%" EQU "W" set waoutput=%waoutput%; #Font.bin blanco para S\UNEEK+DI (en lugar de Negro)

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

findStr /I /C:"3" "%wabat%" >nul
IF not ERRORLEVEL 1 (set SNKFONT=W) else (set SNKFONT=B)


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


set watext=        Es esta su primera vez que modifica su Wii?~                                       -o-~  Le gustaria actualizar todos los los softmods existentes~                  (tambien conocido como rejackear)~~Nota: Solo se responde No, si usted sabe que desea~         actualizar

set wainput= ^&Si; ^&No

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

set watext=         Cual es su version actual menu de sistema?~~Nota: para comprobarlo, encienda su consola Wii, haz clic en el boton Wii en la parte inferior izquierda del menu principal del sistema, haga clic en Configuracion de Wii, entonces usted debe ver el menu del sistema en la parte superior derecha de la pantalla (es decir, 4.2U, 4,1 J, 3.2E, etc)



set wainput= 4.^&3; 4.^&2; 4.^&1; 4.^&0; 3.^&x (3.0 - 3.5); ^&Otros (^<2.2); ^&Videotutorial para ver la version menu de sistema

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
start /D SUPPORT SMver.html
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


set watext=                Cual es su Region de menu del sistema?~~Nota: para comprobarlo, encienda su consola Wii, haz clic en el boton Wii en la parte inferior izquierda del menu principal del sistema, haga clic en Configuracion de Wii, entonces usted debe ver el menu del sistema en la parte superior derecha de la pantalla (es decir, 4.2U, 4,1 J, 3.2E, etc)


if /i "%MENU1%" EQU "RC" set watext=~~~~          A que Region le gustaria cambiar?



set wainput= ^&U (USA); ^&E (Euro\PAL); ^&J (JAP); ^&K (Corea); ^&Videotutorial para ver la version menu de sistema

if /i "%MENU1%" EQU "RC" set wainput= ^&U (USA); ^&E (Euro\PAL); ^&J (JAP); ^&K (Corea)


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
start /D SUPPORT SMver.html
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


if /i "%FIRMSTART%" EQU "4.3" set watext=~~Seleccione el exploit que le gustaria utilizar para modificar su Wii.~~~Nota: El exploit Letterbomb es solo para las versiones 4,3 de Wii.
if /i "%FIRMSTART%" EQU "o" set watext=~~Seleccione el juego que desea utilizar para modificar su Wii.~~~Nota: Puede modificar su Wii sin uno de los siguientes juegos si se actualiza al menu del sistema 3.0 o superior.


set wainput=

if /i "%FIRMSTART%" EQU "4.3" goto:list4.3
if /i "%REGION%" EQU "K" set wainput= ^&Twilight Princess: The Legend of Zelda; ^&Super Smash Brothers Brawl; ^&Todos los exploits de arriba
if /i "%REGION%" NEQ "K" set wainput= ^&Twilight Princess: The Legend of Zelda; ^&Super Smash Brothers Brawl; LEGO ^&Indiana Jones; LEGO ^&Batman; LEGO Star ^&Wars; ^&Yu-Gi-Oh! 5D's; Tales of Symphonia: ^&Dawn of the New World; ^&Todos los exploits de arriba
goto:skip4.3

:list4.3
if /i "%REGION%" EQU "K" set wainput= ^&LetterBomb (Discless); ^&Super Smash Brothers Brawl
if /i "%REGION%" NEQ "K" set wainput= ^&LetterBomb (Discless); ^&Super Smash Brothers Brawl; LEGO ^&Indiana Jones; LEGO ^&Batman; LEGO Star ^&Wars; ^&Yu-Gi-Oh! 5D's; ^&Tales of Symphonia: Dawn of the New World; ^&Todos los exploits de arriba basados en disco (sin Letterbomb)
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

if /i "%REGION%" NEQ "K" goto:KOR
::set wainput= ^&Twilight Princess: The Legend of Zelda; ^&Super Smash Brothers Brawl; ^&Todos los exploits de arriba
if /i "%waoutnum%" EQU "0" set EXPLOIT=T
if /i "%waoutnum%" EQU "1" set EXPLOIT=S
if /i "%waoutnum%" EQU "2" set EXPLOIT=?
goto:gotexploit


:KOR
::set wainput= ^&Twilight Princess: The Legend of Zelda; ^&Super Smash Brothers Brawl; ^&LEGO Indiana Jones; ^&LEGO Batman; ^&LEGO Star Wars; ^&Yu-Gi-Oh! 5D's; ^&Tales of Symphonia: Dawn of the New World; ^&Todos los exploits de arriba
if /i "%waoutnum%" EQU "0" set EXPLOIT=T
if /i "%waoutnum%" EQU "1" set EXPLOIT=S
if /i "%waoutnum%" EQU "2" set EXPLOIT=L
if /i "%waoutnum%" EQU "3" set EXPLOIT=LB
if /i "%waoutnum%" EQU "4" set EXPLOIT=LS
if /i "%waoutnum%" EQU "5" set EXPLOIT=Y
if /i "%waoutnum%" EQU "6" set EXPLOIT=TOS
if /i "%waoutnum%" EQU "7" set EXPLOIT=?
goto:gotexploit


:list4.3
if /i "%REGION%" NEQ "K" goto:KOR4.3
::set wainput= ^&LetterBomb (Discless); ^&Super Smash Brothers Brawl
if /i "%waoutnum%" EQU "0" set EXPLOIT=BOMB
if /i "%waoutnum%" EQU "1" set EXPLOIT=S
goto:gotexploit


:KOR4.3
::set wainput= ^&LetterBomb (Discless); ^&Super Smash Brothers Brawl; ^&LEGO Indiana Jones; ^&LEGO Batman; ^&LEGO Star Wars; ^&Yu-Gi-Oh! 5D's; ^&Tales of Symphonia: Dawn of the New World; ^&Todos los exploits de arriba basados en disco (sin Letterbomb)
if /i "%waoutnum%" EQU "0" set EXPLOIT=BOMB
if /i "%waoutnum%" EQU "1" set EXPLOIT=S
if /i "%waoutnum%" EQU "2" set EXPLOIT=L
if /i "%waoutnum%" EQU "3" set EXPLOIT=LB
if /i "%waoutnum%" EQU "4" set EXPLOIT=LS
if /i "%waoutnum%" EQU "5" set EXPLOIT=Y
if /i "%waoutnum%" EQU "6" set EXPLOIT=TOS
if /i "%waoutnum%" EQU "7" set EXPLOIT=?
goto:gotexploit


:gotexploit



if /i "%EXPLOIT%" EQU "BOMB" (set beforebomb=WPAGE3C) & (goto:bombinfo)

if /i "%MENU1%" EQU "H" (set BACKB4DRIVE=WPAGE3C) & (goto:DRIVECHANGE)

if /i "%AbstinenceWiz%" EQU "Y" goto:NEEKrevSelect

goto:WPAGE4



::------------------letterbomb info----------------
:bombinfo


start /D SUPPORT LetterBombFrames.html


set watext=~desde ModMii deberia de abrir su navegador en http://please.hackmii.com~~Un videotutorial sobre la manera adecuada de descargar Letterbomb se puede encontrar en el panel lateral de la pagina web.~En esta pagina web, introduzca su region menu del sistema y la direccion MAC. Para encontrar la direccion MAC de tu Wii, encender la Wii, haga clic en el boton Wii en la parte inferior izquierda del menu principal del sistema, a continuacion, haga clic en Configuracion de Wii, a continuacion, en Internet, a continuacion, la consola de Informacion.~Desactive la opcion "Paquete del instalador HackMii para mi", rellenar el captcha y cortar cualquiera de los cables. Se descargara un archivo ZIP pequeño, abrir este archivo, y usted vera una carpeta de copia privada, y pegarlo en la raiz de la tarjeta SD.~desde ModMii va a generar una guia para el supuesto de que hayas hecho esto correctamente.~Haga clic en "Next" cuando este listo para continuar...

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp TB


if errorlevel 2 goto:MENU
if errorlevel 1 goto:%beforebomb%

if /i "%MENU1%" EQU "H" (set BACKB4DRIVE=bombinfo) & (goto:DRIVECHANGE)

if /i "%AbstinenceWiz%" EQU "Y" goto:NEEKrevSelect

goto:WPAGE4




::...................................Wizard Page3D - Active IOSs...............................
::change WPAGE3D with WPAGE4




::...................................Wizard Page4 - New System Menu...............................
:WPAGE4

set FIRM=
set waoutnum=
set waoutput=

set watext=~~            Seleccione el menu de sistema que desea~                       para actualizar/degradar.

if /i "%MENU1%" NEQ "RC" set watext=%watext%~~Nota: si el menu del sistema actual elije un Menu ~                  de sistema no se descargara


set wainput= 4.^&3; 4.^&2; 4.^&1 (Recomendado)
::set default
set waoutnum=2

if /i "%MENU1%" EQU "RC" goto:miniskip

if /i "%FIRMSTART%" EQU "4.3" set wainput= 4.^&3 (Recomendado); 4.^&2; 4.^&1
if /i "%FIRMSTART%" EQU "4.3" set waoutnum=0

if /i "%FIRMSTART%" EQU "4.2" set wainput= 4.^&3; 4.^&2 (Recomendado); 4.^&1
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


set watext=~~~      Elija cual de los siguientes canales desea instalar

set wainput= ^&Fotos; ^&Mii; ^&Tienda (con IOS56); ^&Internet; ^&Tiempo; ^&Noticias; ^&Wii Speak

if /i "%MENU1%" EQU "S" (set REGIONTEMP=%SNKREGION%) else (set REGIONTEMP=%REGION%)

if /i "%REGIONTEMP%" EQU "K" set wainput= ^&Fotos; ^&Mii; ^&Tienda (con IOS56)

if /i "%MENU1%" NEQ "S" goto:notS
set wainput= ^&Fotos; ^&Mii; ^&Tienda; ^&Internet; ^&Tiempo; ^&Noticias; ^&Wii Speak
if /i "%REGIONTEMP%" EQU "K" set wainput= ^&Fotos; ^&Mii; ^&Tienda
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

findStr /I /C:"4" "%wabat%" >nul
IF not ERRORLEVEL 1 set Weather=Y

findStr /I /C:"5" "%wabat%" >nul
IF not ERRORLEVEL 1 set NEWS=Y

findStr /I /C:"6" "%wabat%" >nul
IF not ERRORLEVEL 1 set Speak=Y

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


set watext=~~~~   Elija alguno de los siguientes para instalar o actualizar

if /i "%CMIOSOPTION%" EQU "on" set wainput= ^&Homebrew Channel y\o BootMii; ^&IOS236; ^&CIOSs y cMIOS Recomendados; ^&Priiloader v0.7 (y hacks menu del sistema); ^&El nuevo Wad Manager Mod (YAWMM); Tema Menu ^&Sistema; ^&USB-Loader; ^&IOSs Activos y IOSs parcheados menu del sistema

if /i "%CMIOSOPTION%" NEQ "on" set wainput= ^&Homebrew Channel y\o BootMii; ^&IOS236; ^&CIOSs Recomendados; ^&Priiloader v0.7 (y hacks menu del sistema); ^&El nuevo Wad Manager Mod (YAWMM); Tema Menu ^&Sistema; ^&USB-Loader; ^&IOSs Activos y IOSs parcheados menu del sistema


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp CL

if errorlevel 2 goto:MENU
if errorlevel 1 goto:WPAGE5


call "%wabat%"


if "%waoutnum%"=="" (set BACKB4DRIVE=WPAGE13) & (goto:DRIVECHANGE)


set AdvancedMarked=%waoutnum%

echo %waoutnum% >"%wabat%"

findStr /I /C:"0" "%wabat%" >nul
IF not ERRORLEVEL 1 set HMInstaller=Y

findStr /I /C:"1" "%wabat%" >nul
IF not ERRORLEVEL 1 set IOS236InstallerQ=Y

findStr /I /C:"2" "%wabat%" >nul
IF not ERRORLEVEL 1 set RECCIOS=Y

findStr /I /C:"3" "%wabat%" >nul
IF not ERRORLEVEL 1 set PRIQ=Y

findStr /I /C:"4" "%wabat%" >nul
IF not ERRORLEVEL 1 set yawmQ=Y

findStr /I /C:"5" "%wabat%" >nul
IF not ERRORLEVEL 1 set THEMEQ=Y

findStr /I /C:"6" "%wabat%" >nul
IF not ERRORLEVEL 1 set USBGUIDE=Y

findStr /I /C:"7" "%wabat%" >nul
IF not ERRORLEVEL 1 (set UpdatesIOSQ=Y) else (set UpdatesIOSQ=N)


if /i "%THEMEQ%" EQU "Y" goto:WPAGE20
if /i "%USBGUIDE%" EQU "Y" goto:UPAGE1

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


set watext=~~~Te gustaria instalar un tema personalizado en tu Wii?~~    Elija entre 3 efectos: No-Spin, Spin y Fast-Spin

set wainput= Ver los temas disponibles en ^&Youtube; Cambiar Efecto ^&Canal - Efecto actual: %effect%; Tema DarkWii ^&Rojo - %effect%; Tema DarkWii ^&Verde - %effect%; Tema DarkWii ^&Azul - %effect%; Tema DarkWii ^&Naranja - %effect%; ^&No, quiero el mismo viejo menu de sistema aburrido

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
start /D SUPPORT WiiThemes.html
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
if /i "%USBGUIDE%" EQU "Y" (goto:UPAGE1) else (goto:DRIVECHANGE)



::...................................Wizard Page21 - USB Loader Setup Q...............................
:WPAGE21
set USBGUIDE=
set waoutnum=
set waoutput=

::recall checked items
if not "%USBGUIDEMarked%"=="" set waoutnum=%USBGUIDEMarked%

set watext=~Quieres configurar un USB-Loader ahora?~~Notas:~Un USB-Loader permite a la Wii jugar juegos desde un disco duro externo. Este paso siempre se puede hacer por si mismo mas adelante desde Menu Principal de ModMii.

set wainput= ^&Si;~~ ^&No

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:WPAGE20

call "%wabat%"

::if blank, check "NO"
if "%waoutnum%"=="" set waoutnum=1

set USBGUIDEMarked=%waoutnum%

if /i "%waoutnum%" EQU "0" (set USBGUIDE=Y) & (goto:UPAGE1)
if /i "%waoutnum%" EQU "1" (set USBGUIDE=N) & (set BACKB4DRIVE=WPAGE21) & (goto:DRIVECHANGE)

if "%USBGUIDE%"=="" goto:WPAGE21








::...................................SD Card Location...............................
:DriveChange
set drivetemp=%DRIVE:&=^&%
set waoutnum=
set waoutput=%DRIVE:&=^&%

set wabmplast=%wabmp%
set wabmp=support\bmp\SDCARD.bmp


::makedrive if not exist
::if not exist "%DRIVE%" mkdir "%DRIVE%"

set watext=~~~Seleccionar donde guardar los archivos en su tarjeta SD


start /w support\wizapp FB DIR

if errorlevel 2 goto:MENU
if not errorlevel 1 goto:notback
set wabmp=%wabmplast%
if /i "%MENU1%" EQU "O" goto:notback
goto:%BACKB4DRIVE%
:notback

call "%wabat%"

set DRIVETEMP=%waoutput:&=^&%



::remove quotes from variable (if applicable)
echo "set DRIVETEMP=%DRIVETEMP%">temp\temp.txt
support\sfk filter -quiet temp\temp.txt -rep _""""__>temp\temp.bat

support\sfk filter -spat -quiet temp\temp.bat -rep _\x26_\x5e\x26_ -write -yes

call temp\temp.bat
del temp\temp.bat>nul
del temp\temp.txt>nul


::if second char is ":" check if drive exists

if /i "%DRIVETEMP:~1,1%" NEQ ":" goto:skipcheck
if exist "%DRIVETEMP:~0,2%" (goto:skipcheck) else (echo.)
goto:DRIVECHANGE
:skipcheck


set DRIVE=%DRIVETEMP:&=^&%
set REALDRIVE=%DRIVE:&=^&%


::autosave drive setting to settings.bat
support\sfk filter Support\settings.bat -!"Set Drive=" -write -yes>nul
echo Set Drive=%DRIVE:&=^&%>>Support\settings.bat
support\sfk filter -spat -quiet Support\settings.bat -rep _\x5e\x26_\x26_ -rep _\x26_\x5e\x26_ -write -yes>nul
support\sfk filter -quiet Support\settings.bat -lerep _\__ -lerep _/__ -write -yes>nul
::goto:

set wabmp=%wabmplast%

::if /i "%MENU1%" EQU "FC" goto:FileCleanup

if /i "%MENU1%" EQU "O" goto:options

if /i "%MENU1%" EQU "H" (set backB4wpageLast=DRIVECHANGE) & (goto:WPAGELAST)

if /i "%MENU1%" EQU "W" goto:noskip
if /i "%MENU1%" EQU "U" goto:noskip
goto:skip
:noskip
if /i "%USBCONFIG%" EQU "USB" (set backB4DRIVEU=DRIVEUCHANGE) & (goto:DRIVEUCHANGE)
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
set driveUtemp=%DRIVEU:&=^&%
set waoutnum=
set waoutput=%DRIVEU:&=^&%

set wabmplast=%wabmp%
set wabmp=support\bmp\USBDIR.bmp

::makedrive if not exist
::if not exist "%DRIVE:&=^&%" mkdir "%DRIVE:&=^&%"

set watext=~~~Seleccionar donde guardar los archivos en su disco duro USB

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp FB DIR

if errorlevel 2 goto:MENU
if not errorlevel 1 goto:notback
set wabmp=%wabmplast%
if /i "%MENU1%" EQU "O" goto:notback
goto:%BACKB4DRIVEU%
:notback

call "%wabat%"

set DRIVEUTEMP=%waoutput:&=^&%



::remove quotes from variable (if applicable)
echo "set DRIVEUTEMP=%DRIVEUTEMP%">temp\temp.txt
support\sfk filter -quiet temp\temp.txt -rep _""""__>temp\temp.bat
support\sfk filter -spat -quiet temp\temp.bat -rep _\x26_\x5e\x26_ -write -yes
call temp\temp.bat
del temp\temp.bat>nul
del temp\temp.txt>nul


::if second char is ":" check if drive exists
if /i "%DRIVEUTEMP:~1,1%" NEQ ":" goto:skipcheck
if exist "%DRIVEUTEMP:~0,2%" goto:skipcheck
goto:DRIVEUCHANGE
:skipcheck


set DRIVEU=%DRIVEUTEMP:&=^&%


::autosave drive setting to settings.bat
support\sfk filter Support\settings.bat -!"Set DriveU=" -write -yes>nul
echo Set DriveU=%DRIVEU:&=^&%>>Support\settings.bat
support\sfk filter -spat -quiet Support\settings.bat -rep _\x5e\x26_\x26_ -rep _\x26_\x5e\x26_ -write -yes>nul
support\sfk filter -quiet Support\settings.bat -lerep _\__ -lerep _/__ -write -yes>nul

::goto:

set wabmp=%wabmplast%

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

set wabmplast=%wabmp%
set wabmp=support\bmp\UPDATECHECK.bmp

set watext=~~Comprobando actualizaciones...~~Version actual %currentversion%
start support\wizapp PB OPEN
start support\wizapp PB UPDATE 20


if exist temp\list.txt del temp\list.txt>nul

start %ModMiimin%/wait support\wget -N "http://code.google.com/p/modmii/downloads/list?can=3&q=&colspec=Filename+Summary+Uploaded+ReleaseDate+Size+DownloadCount"

if exist list* (move /y list* temp\list.txt>nul) else (goto:updatefail)

start support\wizapp PB UPDATE 70

support\sfk filter -quiet "temp\list.txt" ++"ModMii" ++"zip" ++"modmii.googlecode.com/files/" -rep _*"files/ModMii"__ -rep _".zip"*__ -write -yes


if /i "%UPDATENAME%" NEQ "ModMii" support\sfk filter -quiet "temp\list.txt" ++"%UPDATENAME:~-3%" -write -yes

if /i "%UPDATENAME%" EQU "ModMii" support\sfk filter -quiet "temp\list.txt" -!"_" -write -yes

support\sfk filter -spat -quiet "temp\list.txt" -rep _*"\x5f"__ -write -yes

set /p newversion= <temp\list.txt

del temp\list.txt>nul



start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE



if %currentversion% LSS %newversion% goto:openchangelog


::----------disable Splash for now------------
::if /i "%MENU1%" EQU "O" (set wabmp=%wabmplast%) & (goto:OPTIONS) else (goto:MENU)

if %currentversion% GTR %newversion% set watext=~Esta version es mas reciente que la ultima version publica~~You got some crazy new beta shit!

if %currentversion% EQU %newversion% set watext=~Esta version esta actualizada

start support\wizapp PB OPEN
start support\wizapp PB UPDATE 100

support\nircmd.exe wait 2000

start support\wizapp PB CLOSE

set wabmp=%wabmplast%

if /i "%MENU1%" EQU "O" (goto:OPTIONS) else (goto:MENU)




:openchangelog
if /i "%Trigger%" EQU "1" (start http://modmii.zzl.org/changelog.html) else (start http://5dca4ce5.miniurls.co/)

:updateconfirm
::set updatenow=

set watext=~Una actualizacion esta disponible, le gustaria actualizar a v%newversion% ahora?~~Se recomienda leer la lista de cambios que acaba de abrir en su navegador.~~Haga clic en "Siguiente" para actualizar ahora de lo contrario haga clic en "Cancelar".


start /w support\wizapp NOBACK TB


if not errorlevel 2 goto:notcancel
set wabmp=%wabmplast%
if /i "%MENU1%" EQU "O" (goto:OPTIONS) else (goto:MENU)
:notcancel



:updatenow

set wabmp=support\bmp\UPDATING.bmp

set watext=~Actualizar de v%currentversion% a v%newversion%~~Por favor espere...

start support\wizapp PB OPEN
start support\wizapp PB UPDATE 20

::Kill ModMiiSkin.exe process so it can be updated
taskkill /im ModMiiSkin.exe /f >nul

if not exist "%UPDATENAME%%newversion%.zip" start %ModMiimin%/wait support\wget -t 3 http://modmii.googlecode.com/files/%UPDATENAME%%newversion%.zip

if not exist "%UPDATENAME%%newversion%.zip" goto:updatefail

start support\wizapp PB UPDATE 60

copy /y support\7za.exe support\7za2.exe>nul


echo @echo off>Updatetemp.bat
echo if exist "support\ModMii.bat" ren "support\ModMii.bat" "ModMii-v%currentversion%.bat">>Updatetemp.bat
echo if exist "support\ModMiiSkin.bat" ren "support\ModMiiSkin.bat" "ModMiiSkin-v%currentversion%.bat">>Updatetemp.bat
echo support\7za2 x %UPDATENAME%%newversion%.zip -aoa>>Updatetemp.bat
echo start support\wizapp PB UPDATE 100 >>Updatetemp.bat
echo del %UPDATENAME%%newversion%.zip^>nul>>Updatetemp.bat
echo del support\7za2.exe^>nul>>Updatetemp.bat
echo start support\wizapp PB CLOSE>>Updatetemp.bat
echo Start ModMiiSkin.exe>>Updatetemp.bat
echo exit>>Updatetemp.bat
start Updatetemp.bat
exit



:updatefail

start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE


set watext=~~Actualizacion de verificacion ha fallado, compruebe su conexion a Internet y la configuracion del firewall

start /w support\wizapp NOBACK TB

set wabmp=%wabmplast%

if /i "%MENU1%" EQU "O" (goto:OPTIONS) else (goto:MENU)





::...................................Wizard Last Page - Confirmation...............................
:WPAGELAST
set WLAST=
set waoutnum=
set waoutput=
set wainput=


set watext=Confirme los ajustes si son correctos, haga clic en "Finish"


if /i "%MENU1%" NEQ "W" goto:notwizard
if /i "%USBCONFIG%" NEQ "USB" set watext=%watext%~~Guardar archivos en: %Drive:&=^&%
if /i "%USBCONFIG%" EQU "USB" set watext=%watext%~~Guardar archivos en: %Drive:&=^&%~y en: %DriveU:&=^&%
:notwizard

if /i "%MENU1%" NEQ "U" goto:notusb
if /i "%USBCONFIG%" EQU "USB" set watext=%watext%~~Guardar archivos en: %DriveU:&=^&%
if /i "%USBCONFIG%" NEQ "USB" set watext=%watext%~~Guardar archivos en: %Drive:&=^&%
:notusb


if /i "%MENU1%" NEQ "S" goto:notS
if /i "%SNEEKSELECT%" NEQ "2" goto:not2
if /i "%SNEEKTYPE:~0,1%" EQU "S" set watext=%watext%~~Guardar archivos en: %Drive:&=^&%
if /i "%SNEEKTYPE:~0,1%" NEQ "S" set watext=%watext%~~Guardar archivos en: %DriveU:&=^&%
goto:notS
:not2
if /i "%SNEEKTYPE:~0,1%" EQU "S" set watext=%watext%~~Guardar archivos en: %Drive:&=^&%
if /i "%SNEEKTYPE:~0,1%" NEQ "S" set watext=%watext%~~Guardar archivos en: %Drive:&=^&%~y en: %DriveU:&=^&%
:notS

if /i "%MENU1%" EQU "H" set watext=%watext%~~Guardar archivos en: %Drive:&=^&%
if /i "%MENU1%" EQU "RC" set watext=%watext%~~Guardar archivos en: %Drive:&=^&%


if /i "%MENU1%" EQU "H" set wainput=%wainput%                       Guia Soluciones HackMii~
if /i "%MENU1%" EQU "w" set wainput=%wainput%                            Asistente ModMii~
if /i "%MENU1%" EQU "U" set wainput=%wainput%                     ModMii USB Loader Guia de instalacion~
if /i "%MENU1%" EQU "RC" set wainput=%wainput%                         Guia Cambio Region~


if /i "%MENU1%" NEQ "S" goto:notS
if /i "%SNEEKSELECT%" EQU "1" set wainput=%wainput%                         Intalacion SNEEK~
if /i "%SNEEKSELECT%" EQU "2" set wainput=%wainput%                        Creacion NAND Emulada~
if /i "%AbstinenceWiz%" EQU "Y" set wainput=%wainput%                          Asistente Abstinencia~
if /i "%AbstinenceWiz%" EQU "Y" goto:notS
if /i "%SNEEKSELECT%" EQU "3" set wainput=%wainput%    Intalacion SNEEK y Creacion NAND Emulada~
:notS


if /i "%AbstinenceWiz%" EQU "Y" goto:guideavailable
if /i "%MENU1%" EQU "S" goto:guideNOTavailable
:guideavailable
if /i "%GUIDEONLY%" EQU "on" set wainput=%wainput%~* Generar Guia Personalizada Opcion Habilitada~
:guideNOTavailable


if /i "%MENU1%" NEQ "S" goto:notS
if /i "%AbstinenceWiz%" NEQ "Y" goto:notabstinence
if /i "%FIRMSTART%" NEQ "o" set wainput=%wainput%~* Menu de sistema actual %FIRMSTART%%REGION%~
if /i "%FIRMSTART%" EQU "o" set wainput=%wainput%~* Menu de sistema actual es menor que 2.2%REGION%~
:notabstinence

if /i "%SNEEKSELECT%" EQU "2" goto:noSSDcomment
if /i "%SNEEKTYPE%" EQU "SD" set wainput=%wainput%~* Crear %neekname%: SNEEK+DI Rev%CurrentRev%
if /i "%SNEEKTYPE%" EQU "UD" set wainput=%wainput%~* Crear %neekname%: UNEEK+DI Rev%CurrentRev%
if /i "%SNEEKTYPE%" EQU "S" set wainput=%wainput%~* Crear %neekname%: SNEEK Rev%CurrentRev%
if /i "%SNEEKTYPE%" EQU "U" set wainput=%wainput%~* Crear %neekname%: UNEEK Rev%CurrentRev%

if /i "%neek2o%" EQU "on" set wainput=%wainput%~* neek2o Habilitado (se puede cambiar en opciones)
if /i "%neek2o%" NEQ "on" set wainput=%wainput%~* neek2o Desabilitado (se puede cambiar en opciones)

if /i "%SNEEKTYPE:~0,1%" NEQ "S" goto:noSSDcomment
if /i "%SSD%" EQU "on" set wainput=%wainput%~* Acceso SD Habilitado (se puede cambiar en opciones)
if /i "%SSD%" NEQ "on" set wainput=%wainput%~* Acceso SD Desabilitado (se puede cambiar en opciones)
:noSSDcomment

if /i "%SNEEKSELECT%" EQU "3" set wainput=%wainput%~

if /i "%SNEEKSELECT%" NEQ "1" set wainput=%wainput%~* Crear una %SNKVERSION%%SNKREGION% NAND Emulada

if /i "%SNEEKSELECT%" NEQ "1" set wainput=%wainput%~* setting.txt creado usando el serial #: %SNKSERIAL%

if /i "%SNKPLC%" EQU "Y" set wainput=%wainput%~* Instalar Canal Post Loader

if /i "%SNKCIOS%" EQU "Y" set wainput=%wainput%~* Instalar cIOS249 rev14

if /i "%SNKcBC%" EQU "NMM" set wainput=%wainput%~* Instalar NMM (No Mas Targetas de Memoria)

if /i "%SNKcBC%" EQU "DML" set wainput=%wainput%~* Instalar DML-r%CurrentDMLRev% a la NAND  Real

if /i "%SNKPRI%" EQU "Y" set wainput=%wainput%~* Instalar Priiloader

if /i "%SNKJOY%" EQU "Y" set wainput=%wainput%~* Instalar JoyFlow

IF not "%addwadfolder%"=="" set wainput=%wainput%~* Instalar wads desde la carpeta personalizada:~  %addwadfolder%


if /i "%ThemeSelection%" EQU "R" set wainput=%wainput%~* Instalar Dark Wii Tema Rojo - %effect%
if /i "%ThemeSelection%" EQU "G" set wainput=%wainput%~* Instalar Dark Wii Tema Verde - %effect%
if /i "%ThemeSelection%" EQU "BL" set wainput=%wainput%~* Instalar Dark Wii Tema Azul - %effect%
if /i "%ThemeSelection%" EQU "O" set wainput=%wainput%~* Instalar Dark Wii Tema Naranja - %effect%


set wainput=%wainput%~
if /i "%PIC%" EQU "Y" set wainput=%wainput%~* Instalar el Canal Fotos
if /i "%NET%" EQU "Y" set wainput=%wainput%~* Instalar el Canal Internet
if /i "%WEATHER%" EQU "Y" set wainput=%wainput%~* Instalar el Canal Tiempo
if /i "%NEWS%" EQU "Y" set wainput=%wainput%~* Instalar el Canal Noticias
if /i "%MIIQ%" EQU "Y" set wainput=%wainput%~* Instalar el Canal Mii
if /i "%Shop%" EQU "Y" set wainput=%wainput%~* Instalar el Canal tienda
if /i "%Speak%" EQU "Y" set wainput=%wainput%~* Instalar el Canal Wii Speak
set wainput=%wainput%~

goto:skipusb
:notS





if /i "%MENU1%" EQU "H" set wainput=%wainput%~* Menu de sistema actual %FIRMSTART%%REGION%
if /i "%MENU1%" EQU "H" goto:skipusb


if /i "%MENU1%" EQU "U" goto:skipwizstuff

if /i "%VIRGIN%" EQU "Y" set wainput=%wainput%~* Instalar\Actualizar todos los softmods recomendados~

if /i "%MENU1%" EQU "RC" goto:skipcurrentSM
if /i "%FIRMSTART%" NEQ "o" set wainput=%wainput%~* Menu de sistema actual %FIRMSTART%%REGION%
if /i "%FIRMSTART%" EQU "o" set wainput=%wainput%~* Menu de sistema actual menor que 2.2%REGION%
:skipcurrentSM

set wainput=%wainput%~* Menu de sistema deseado %FIRM%%REGION%

set wainput=%wainput%~
if /i "%PIC%" EQU "Y" set wainput=%wainput%~* Instalar el Canal Fotos
if /i "%NET%" EQU "Y" set wainput=%wainput%~* Instalar el Canal Internet
if /i "%WEATHER%" EQU "Y" set wainput=%wainput%~* Instalar el Canal Tiempo
if /i "%NEWS%" EQU "Y" set wainput=%wainput%~* Instalar el Canal Noticias
if /i "%MIIQ%" EQU "Y" set wainput=%wainput%~* Instalar el Canal Mii
if /i "%Shop%" EQU "Y" set wainput=%wainput%~* Instalar el Canal tienda yIOS56
if /i "%Speak%" EQU "Y" set wainput=%wainput%~* Instalar el Canal Wii Speak

set wainput=%wainput%~

if /i "%HMInstaller%" EQU "Y" set wainput=%wainput%~* Instalar\Actualizar el Homebrew Channel y BootMii

if /i "%RECCIOS%" NEQ "Y" goto:smallskip
if /i "%CMIOSOPTION%" EQU "on" (set wainput=%wainput%~* Instalar\Actualizar cIOSs y cMIOS recomendados) else (set wainput=%wainput%~* Instalar\Actualizar CIOSs recomendados)
:smallskip

if /i "%yawmQ%" EQU "Y" set wainput=%wainput%~* Descargar un nuevo Wad Manager Mod
if /i "%IOS236InstallerQ%" EQU "Y" set wainput=%wainput%~* Instalar IOS236


if /i "%PRIQ%" EQU "Y" set wainput=%wainput%~* Instalar\Actualizar Priiloader

if /i "%ThemeSelection%" EQU "R" set wainput=%wainput%~* Instalar Tema Dark Wii Rojo - %effect%
if /i "%ThemeSelection%" EQU "G" set wainput=%wainput%~* Instalar Tema Dark Wii Verde - %effect%
if /i "%ThemeSelection%" EQU "BL" set wainput=%wainput%~* Instalar Tema Dark Wii Azul - %effect%
if /i "%ThemeSelection%" EQU "O" set wainput=%wainput%~* Instalar Tema Dark Wii Naranja - %effect%

if /i "%MENU1%" EQU "RC" goto:skipusb
::---------
:skipwizstuff


if /i "%MENU1%" EQU "U" set USBGUIDE=Y
if /i "%USBGUIDE%" NEQ "Y" goto:skipusb
if /i "%MENU1%" NEQ "U" set wainput=%wainput%~

if /i "%FORMAT%" EQU "1" set FORMATNAME=FAT32
if /i "%FORMAT%" EQU "2" set FORMATNAME=NTFS
if /i "%FORMAT%" EQU "3" set FORMATNAME=Part FAT32 and Part NTFS
if /i "%FORMAT%" EQU "4" set FORMATNAME=WBFS
if /i "%FORMAT%" EQU "5" set FORMATNAME=Part FAT32 and Part WBFS

if /i "%FORMAT%" EQU "4" goto:skip
if /i "%FORMAT%" EQU "5" goto:skip

if /i "%MENU1%" NEQ "U" set wainput=%wainput%~* Disco duro externo formato como %FORMATNAME%
if /i "%MENU1%" EQU "U" set wainput=%wainput%~* Disco duro externo formato como %FORMATNAME%
goto:skip2
:skip
set wainput=%wainput%~* Disco duro externo ya esta formateado como %FORMATNAME%
:skip2

if /i "%LOADER%" EQU "CFG" set wainput=%wainput%~* Descargar Configurable USB-Loader
if /i "%LOADER%" EQU "FLOW" set wainput=%wainput%~* Descargar WiiFlow-Mod
if /i "%LOADER%" EQU "ALL" set wainput=%wainput%~* Descargar Configurable USB-Loader y WiiFlow-Mod
if /i "%USBCONFIG%" EQU "USB" set wainput=%wainput%~* USB-Loader configuracion\configurar archivos guardados en USB
if /i "%USBCONFIG%" NEQ "USB" set wainput=%wainput%~* USB-Loader configuracion\configurar archivos guardados en targeta SD

:skipusb




::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp FINISH FT

if errorlevel 2 goto:MENU
if errorlevel 1 goto:%BACKB4WPAGELAST%


set WLAST=Y

goto:StartModMiiClassic






::...................................USB-Loader Setup Page1 - Format?...............................
:UPAGE1
set FORMAT=NONE
set waoutnum=
set waoutput=

::recall checked items or set default
if not "%FORMATMarked%"=="" (set waoutnum=%FORMATMarked%) else (set waoutnum=0)

set watext=~~~   Como le gustaria su disco duro externo formateado?

if /i "%AbstinenceWiz%" NEQ "Y" set wainput= ^&FAT32; ^&NTFS; ^&Particion en parte como FAT32 y otra parte en NTFS; HDD ya esta ^&WBFS + No quiero cambiar; ^&HDD ya esta FAT32/WBFS + No quiero cambiar

if /i "%AbstinenceWiz%" EQU "Y" set wainput= ^&FAT32 (Recomendado); ^&Particion en parte como FAT32 y otra parte en NTFS

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if not errorlevel 1 goto:notback
if /i "%AbstinenceWiz%" EQU "Y" goto:SNKPAGE2
if /i "%MENU1%" EQU "U" goto:MENU
goto:WPAGE21
:notback

call "%wabat%"

set FORMATMarked=%waoutnum%

SET /a FORMAT=%waoutnum%+1


if /i "%AbstinenceWiz%" NEQ "Y" goto:NotAbstinenceWiz
if /i "%FORMAT%" EQU "1" (set BACKB4DRIVE=UPAGE1) & (goto:DriveChange)
if /i "%FORMAT%" EQU "2" (set FORMAT=3) & (set BACKB4DRIVE=UPAGE1) & (goto:DriveChange)
:NotAbstinenceWiz


goto:UPAGE1b





::...................................USB-Loader Setup Page1b - Loader?...............................
:UPAGE1b
set LOADER=
set waoutnum=
set waoutput=


::recall checked items or set default
if not "%LOADERMarked%"=="" (set waoutnum=%LOADERMarked%) else (set waoutnum=0)

set watext=~~~~           Que USB-Loader te gustaria usar?

set wainput= ^&Configurable USB-Loader (Recomendado); ^&WiiFlow-Mod; ^&Ambos Configurable USB-Loader y WiiFlow-Mod

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:UPAGE1

call "%wabat%"

set LOADERMarked=%waoutnum%

if /i "%waoutnum%" EQU "0" set LOADER=CFG
if /i "%waoutnum%" EQU "1" set LOADER=FLOW
if /i "%waoutnum%" EQU "2" set LOADER=ALL


if /i "%FORMAT%" EQU "1" goto:UPAGE2
if /i "%FORMAT%" EQU "3" goto:UPAGE2
if /i "%FORMAT%" EQU "5" goto:UPAGE2

if /i "%FORMAT%" EQU "2" (set BACKB4DRIVE=UPAGE1b) & (goto:DriveChange)
if /i "%FORMAT%" EQU "4" (set BACKB4DRIVE=UPAGE1b) & (goto:DriveChange)






::...................................USB-Loader Setup Page2 - Config on USB vs SD?...............................
:UPAGE2
set USBCONFIG=
set waoutnum=
set waoutput=


::recall checked items or set default
if not "%USBCONFIGMarked%"=="" (set waoutnum=%USBCONFIGMarked%) else (set waoutnum=0)

set watext=~~~Donde le gustaria guardar su aplicacion USB-Loader, caratulas y los archivos de configuracion?

set wainput= ^&USB (Recomendado); ^&Targeta SD

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


set watext=~~Cual de las siguientes acciones SNEEK le gustaria realizar?~~Nota: El modificador NAND Emulada y Extractor de juegos a granel de SNEEK en la actualidad solo esta disponible en ModMii Clasico

set wainput= ^&Instalacion SNEEK; ^&Creador NAND Emulada (para SNEEK); ^&Todos los de arriba (Recomendado para novatos)


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

if /i "%neek2o%" EQU "ON" (set googlecode=custom-di) & (set neekname=neek2o)
if /i "%neek2o%" NEQ "ON" (set googlecode=sneeky-compiler) & (set neekname=neek)


::echo Checking which %neekname% versions are hosted online...

set watext=~~~Comprobar que versiones %neekname% se alojan en linea...

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start support\wizapp PB OPEN


::get all list
start %ModMiimin%/wait support\wget -N "http://code.google.com/p/%googlecode%/downloads/list?can=2&q=zip&sort=-releasedate&colspec=Filename%20Summary%20Uploaded%20ReleaseDate%20Size%20DownloadCount"

start support\wizapp PB UPDATE 20

if exist list* (move /y list* temp\list.txt>nul) else (goto:nowifi)
copy /y "temp\list.txt" "temp\list2.txt">nul

support\sfk filter -spat "temp\list.txt" ++"%googlecode%.googlecode.com/files/" ++"%neekname%-rev" -rep _*"/"__ -rep _".zip*"__ -rep _"*files/"__ -rep _%neekname%-rev__ -rep _\x2528_\x28_ -rep _\x2529_\x29_ -rep _\x2520_\x20_ -rep _\x253B_\x3B_ -rep _\x252C_\x2C_ -write -yes>nul

start support\wizapp PB UPDATE 40

::get featured list
support\sfk filter -spat "temp\list2.txt" ++"%googlecode%.googlecode.com/files/" ++"%neekname%-rev" ++".zip', 'Featured'" -rep _*"/"__ -write -yes>nul

support\sfk filter -spat "temp\list2.txt" -+"Featured" -rep _".zip*"__ -rep _"*files/"__ -rep _%neekname%-rev__ -rep _\x2528_\x28_ -rep _\x2529_\x29_ -rep _\x2520_\x20_ -rep _\x253B_\x3B_ -rep _\x252C_\x2C_ -write -yes>nul

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

set watext=~~~~No se puede conectar a Internet y no hay versiones %neekname% guardadas localmente

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

Set watext=~~~  Seleccione la version de %neekname% que le gustaria construir:

set FeaturedTag=

::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\list.txt) do call :processNEEKlist %%A
goto:quickskip
:processNEEKlist
set CurrentRev=%*


if not exist temp\list2.txt goto:nofeaturedcheck
findStr /I /C:"%CurrentRev%" "temp\list2.txt" >nul
IF ERRORLEVEL 1 (set FeaturedTag=) else (set FeaturedTag= - Destacado)
:nofeaturedcheck


if not exist "temp\%neekname%\%neekname%-rev%CurrentRev%.zip" set wainput=%wainput%%CurrentRev% (hospedado en google code)%FeaturedTag%;
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
support\sfk filter "%wabat%" -rep _" (hosted on google code)"__ -rep _" - Featured"__ -write -yes>nul

call "%wabat%"

if "%waoutput%"=="" goto:neekrevsfound

set CurrentRev=%waoutput%

goto:SNKPAGE2



::...................................SNEEK Page - DML rev Selection...............................
:CurrentDMLRevSelect

if exist temp\list.txt del temp\list.txt>nul
if exist temp\list2.txt del temp\list2.txt>nul

::set googlecode=dios-mios-lite-source-project

::echo Checking which DML versions are hosted online...

set watext=~~~~     Comprobar que las versiones de DML se alojan en linea...


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start support\wizapp PB OPEN


::get all list
start %ModMiimin%/wait support\wget -N "http://code.google.com/p/dios-mios-lite-source-project/downloads/list"

start support\wizapp PB UPDATE 20


if exist list* (move /y list* temp\list.txt>nul) else (goto:nowifi)
copy /y "temp\list.txt" "temp\list2.txt">nul

support\sfk filter -spat "temp\list.txt" ++"dios-mios-lite-source-project.googlecode.com/files/" ++"DMLr" ++".elf" -!zip -!DMLST.elf -rep _*"/"__ -rep _".elf*"__ -rep _"*files/"__ -rep _DMLr__ -rep _\x2528_\x28_ -rep _\x2529_\x29_ -rep _\x2520_\x20_ -rep _\x253B_\x3B_ -rep _\x252C_\x2C_ -write -yes>nul

start support\wizapp PB UPDATE 40

::get featured list
support\sfk filter -spat "temp\list2.txt" ++"dios-mios-lite-source-project.googlecode.com/files/" ++"DMLr" ++".elf', 'Featured" -rep _*"/"__ -write -yes>nul


support\sfk filter -spat "temp\list2.txt" -+"Featured" -!zip -!DMLST.elf -rep _".elf*"__ -rep _"*files/"__ -rep _DMLr__ -rep _\x2528_\x28_ -rep _\x2529_\x29_ -rep _\x2520_\x20_ -rep _\x253B_\x3B_ -rep _\x252C_\x2C_ -write -yes>nul

start support\wizapp PB UPDATE 60

:nowifi

::get local list

if not exist "temp\DML\*.elf" goto:nolocallist

dir "temp\DML\*.elf" /b /O:-N>>temp\list.txt

support\sfk filter "temp\list.txt" -ls!"DML.elf" -ls!"DMLdebug.elf" -ls!"._DML.elf" -rep _"DMLr"__ -rep _".elf"__ -write -yes>nul
support\sfk filter "temp\list.txt" -unique -write -yes>nul

start support\wizapp PB UPDATE 80

:nolocallist


::------actual page start----------
:CurrentDMLRevSelect2

start support\wizapp PB UPDATE 100

::count # of folders in advance to set "mode"
setlocal ENABLEDELAYEDEXPANSION
SET DMLTOTAL=0
if exist temp\list.txt for /f "delims=" %%i in (temp\list.txt) do set /a DMLTOTAL=!DMLTOTAL!+1
setlocal DISABLEDELAYEDEXPANSION


start support\wizapp PB CLOSE


::Error if no revs found
if /i "%DMLTOTAL%" NEQ "0" goto:DMLrevsfound

set watext=~~~~No se puede conectar a Internet y no hay versiones DML guardadas localmente

start /w support\wizapp TB

set DML=
set CurrentDMLRev=
goto:SNKPAGE4a3


::-------------------
:DMLrevsfound
Set DMLrev=
set waoutnum=
set waoutput=
set wafile=
set wainput=


Set watext=~~       Seleccione la version de DML que quiere construir:~~DML r12+ requiere ya sea Sneek+DI r157+ o NeoGamma R9 beta 55+


::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\list.txt) do call :processDMLlist %%A
goto:quickskip
:processDMLlist
set CurrentDMLRev=%*

if not exist temp\list2.txt goto:nofeaturedcheck
findStr /I /C:"%CurrentDMLRev%" "temp\list2.txt" >nul
IF ERRORLEVEL 1 (set FeaturedTag=) else (set FeaturedTag= - Destacado)
:nofeaturedcheck

if not exist "temp\DML\DMLr%CurrentDMLRev%.elf" set wainput=%wainput%%CurrentDMLRev% (hospedado en google code)%FeaturedTag%;
if exist "temp\DML\DMLr%CurrentDMLRev%.elf" set wainput=%wainput%%CurrentDMLRev%%FeaturedTag%;

goto:EOF
:quickskip

::remove last ; to delete empty selection
set wainput=%wainput:~0,-1%

start /w support\wizapp LB SINGLE


if errorlevel 2 goto:MENU
if not errorlevel 1 goto:notback
set DML=
set CurrentDMLRev=
goto:SNKPAGE4a3
:notback

::remove featured\hosted tags before retrieving selection
support\sfk filter "%wabat%" -rep _" (hosted on google code)"__ -rep _" - Featured"__ -write -yes>nul

call "%wabat%"

if "%waoutput%"=="" goto:DMLrevsfound

set CurrentDMLRev=%waoutput%

goto:SNKPAGE5



::...................................SNEEK Page2 - SNEEK TYPE...............................
:SNKPAGE2
set SNEEKTYPE=
set FORMAT=
set waoutnum=
set waoutput=

::recall checked items or set default
if not "%SNEEKTYPEMarked%"=="" (set waoutnum=%SNEEKTYPEMarked%) else (set waoutnum=4)

if /i "%SNEEKSELECT%" NEQ "2" set watext=~~       Que tipo de Sneek quieres instalar?
if /i "%SNEEKSELECT%" EQU "2" set watext=~~Que tipo de Sneek le gustaria construir una memoria NAND emular en?

if /i "%SNEEKSELECT%" NEQ "1" set watext=%watext%~~Nota: NAND construidas para cualquier tipo de trabajo SNEEK con cualquier otro tipo de SNEEK y CUALQUIER region Wii puede utilizar cualquier region NAND emulada.


set wainput= UNEEK+^&DI; SNEEK+^&DI; ^&UNEEK; ^&SNEEK; ^&Informacion sobre estos tipos de NEEK

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
if /i "%SNEEKTYPE%" EQU "U" goto:UPAGE1
if /i "%SNEEKTYPE%" EQU "UD" goto:UPAGE1
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

set watext=~---UNEEK+DI---~* Wii NAND Emulada/HDD externo esta en FAT32~* Carga juegos Wii de tu disco duro externo FAT32~* Puede cargar aplicaciones de una tarjeta SD~* Lectora DVD deshabilitada para juegos, pero no para aplicaciones~---SNEEK+DI---~* Wii NAND Emulada/de memoria esta en la tarjeta SD~* Cargar juegos Wii de tu disco duro externo FAT32~* Cargar juegos GameCube desde SD usando DML~* Carga aplicaciones fuera de un disco duro USB FAT32~* Lectora DVD deshabilitada para juegos pero no para aplicaciones~---UNEEK---~* Igual que UNEEK+DI pero la Lectora DVD esta habilitada y no carga juegos fuera de un disco duro FAT32~---SNEEK---~* Igual que SNEEK+DI pero la Lectora DVD esta habilitada y no carga juegos fuera de un disco duro FAT32

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp TB

if errorlevel 2 goto:MENU

goto:SNKPAGE2


::...................................SNEEK Page3 - SNEEK REGION...............................
:SNKPAGE3

if /i "%SNEEKTYPE:~0,1%" EQU "S" set nandpath=%DRIVE:&=^&%
if /i "%SNEEKTYPE:~0,1%" EQU "U" set nandpath=%DRIVEU:&=^&%

set DITYPE=off
if /i "%SNEEKTYPE%" EQU "UD" set DITYPE=on
if /i "%SNEEKTYPE%" EQU "SD" set DITYPE=on

set SNKREGION=
set waoutnum=
set waoutput=

::recall checked items
if not "%SNKREGIONMarked%"=="" set waoutnum=%SNKREGIONMarked%

set watext=~~~         Que region le gustaria para su NAND emulada?


set wainput= ^&U (USA); ^&E (Euro\PAL); ^&J (JAP); ^&K (Corea)


::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp RB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:%B4SNKPAGE3%

call "%wabat%"

set SNKREGIONMarked=%waoutnum%

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

set watext=~~~Que version del sistema del menu le gustaria que fuese su NAND emulada?

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



::...................................SNEEK Page4a - Post Loader Channel...............................
::many modmii classic pages turned into one
:SNKPAGE4a
set THEMEQ=
set SNKPLC=
set SNKCIOS=
set SNKPRI=
set SNKcBC=
set SNKJOY=
::set addwadfolder=

set waoutnum=
set waoutput=

::recall checked items
if not "%SNKMarked%"=="" set waoutnum=%SNKMarked%


set watext=~~Elija cual de los siguientes hay que instalar a su NAND emulada?


::use question marks instead of ^&, will be replaced later

set wainput= Tema Menu ?Sistema; Post?Loader (Aplicacion\USB Loader); cIOS?249 rev14 (necesario para algunas aplicaciones); ?Priiloader (y Hacks Menu Sistema); Carpeta personalizada de ?WADs


if /i "%AbstinenceWiz%" EQU "Y" goto:noNMMDML
if /i "%SNEEKTYPE%" EQU "SD" set wainput=%wainput%; ?Dios Mios Lite -O- No mas Targetas de Memoria
if /i "%SNEEKTYPE%" NEQ "SD" set wainput=%wainput%; No ?Mas Targetas de Memoria (NMM)
:noNMMDML



if /i "%SNEEKTYPE:~0,1%" NEQ "U" goto:notUneek
set wainput=%wainput%; ?JoyFlow (USB-Loader)
if /i "%AbstinenceWiz%" EQU "Y" goto:notUneek
if /i "%neek2o%" EQU "off" set wainput=%wainput%; ?Switch2Uneek (lanzar diferentes NANDs)
:notUneek


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

findStr /I /C:"^&JoyFlow" "%wabat%" >nul
IF not ERRORLEVEL 1 set SNKJOY=Y

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
if not "%addwadfolder%"=="" set waoutput=%addwadfolder%


set watext=~~~Seleccione la carpeta de WADs que le gustaria instalar en su NAND emulada

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start /w support\wizapp FB DIR

if errorlevel 2 goto:MENU
if errorlevel 1 goto:SNKPAGE4a

call "%wabat%"

if not exist "%waoutput%\*.wad" goto:noWADserror

set addwadfolder=%waoutput%


::goto
if /i "%SNKcBC%" EQU "choose" goto:SNKPAGE4a3
goto:SNKPAGE5


::Error if no WADs found
:noWADserror

set watext=~~~~No que se encuentran WADs en la carpeta especificada, por favor intente otra carpeta.

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
if not "%SNKcBCMarked%"=="" set waoutnum=%SNKcBCMarked%

set watext=          Te gustaria usar DML o NMM?~~DML r12+ se instala en NAND real y acceder a traves de una NAND emulada (o NeoGamma) que le permite jugar juegos GameCube de una tarjeta SD.~~NMM le permite guardar la carga\partidas guardadas GameCube se utiliza una tarjeta SD en lugar de una tarjeta de memoria de GC.

set wainput= ^&Dios Mios Lite (DML); ^&No Mas Targetas de Memoria (NMM)


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

if /i "%waoutnum%" EQU "0" (set SNKcBC=DML) & (goto:CurrentDMLRevSelect)
if /i "%waoutnum%" EQU "1" set SNKcBC=NMM

if "%SNKcBC%"=="" goto:SNKPAGE4a3

goto:SNKPAGE5



::...................................SNEEK Page5 - SNEEK SERIAL...............................
:SNKPAGE5
set waoutnum=
set waoutput=

if /i "%SNEEKTYPE:~0,1%" EQU "S" set nandpath=%DRIVE:&=^&%
if /i "%SNEEKTYPE:~0,1%" EQU "U" set nandpath=%DRIVEU:&=^&%

if /i "%neek2o%" EQU "ON" goto:DOIT
if /i "%SNKS2U%" EQU "N" goto:quickskip
:DOIT
SET NANDcount=0
if /i "%SNKREGION%" EQU "U" set nandregion=us
if /i "%SNKREGION%" EQU "E" set nandregion=eu
if /i "%SNKREGION%" EQU "J" set nandregion=jp
if /i "%SNKREGION%" EQU "K" set nandregion=kr
if not exist "%nandpath:&=^&%\nands\pl_%nandregion%" set nandpath=%nandpath:&=^&%\nands\pl_%nandregion%
if not exist "%nandpath:&=^&%\nands\pl_%nandregion%" goto:quickskip

:NANDname
SET /a NANDcount=%NANDcount%+1
if not exist "%nandpath:&=^&%\nands\pl_%nandregion%%NANDcount%" set nandpath=%nandpath:&=^&%\nands\pl_%nandregion%%NANDcount%
if not exist "%nandpath:&=^&%\nands\pl_%nandregion%%NANDcount%" goto:quickskip
goto:NANDname
:quickskip

set watext=~~Introduzca los 11 o 12 digitos numero de serie que te gustaria utilizar para crear el setting.txt para su NAND emulada, o utilice el numero predeterminado que se proporciona a continuacion.

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
if /i "%SNKcBC%" EQU "DML" goto:CurrentDMLRevSelect
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


set watext=Seguro que quiere Cambiar la Region su Wii?~~Notas Importantes:~~* No es necesario El cambio de region para jugar a otros juegos de otra region. Por ejemplo, se puede jugar a un juego japo en una Wii modificada de EE.UU. sin cambiar la region.~* se puede jugar a un juego japo en una Wii modificada de EE.UU. sin cambiar la region.~~Advertencias:~~* Si utiliza el Canal de Compras en una Wii, debe iniciar el canal y eliminar su cuenta antes de iniciar esta guía en su Wii. Si no el Canal Tienda Wii da error.~* ModMii esta cambiando la region la guia asume que su Wii ya esta modificada con el Homebrew Channel, IOS236 y BootMii. Si falta alguno de los que utilizan el Asistente para ModMii antes de continuar con esta guia.~~Haga clic en "Siguiente" si usted decide seguir...

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"

start /w support\wizapp TB

if errorlevel 2 goto:MENU
if errorlevel 1 goto:MENU

goto:WPAGE3




::----------------------Start ModMii Classic----------------------
:StartModMiiClassic

::set watext=~~~ModMii Trabajo Clasico...

::::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
::start support\wizapp PB OPEN

if /i "%MENU1%" EQU "L" goto:sendcmd

::---------ModMii Wizard-------------
if /i "%MENU1%" NEQ "W" goto:notwizard

set classicCMD=W %FIRMSTART% %REGION% %FIRM%

::THEMES
if /i "%ThemeSelection%" EQU "R" set classicCMD=%classicCMD% Red
if /i "%ThemeSelection%" EQU "G" set classicCMD=%classicCMD% Green
if /i "%ThemeSelection%" EQU "BL" set classicCMD=%classicCMD% Blue
if /i "%ThemeSelection%" EQU "O" set classicCMD=%classicCMD% Orange

::Wii CHANNELS
if /i "%PIC%" EQU "Y" set classicCMD=%classicCMD% PHOTO
if /i "%MIIQ%" EQU "Y" set classicCMD=%classicCMD% MII
if /i "%Shop%" EQU "Y" set classicCMD=%classicCMD% SHOP
if /i "%NET%" EQU "Y" set classicCMD=%classicCMD% NET
if /i "%Weather%" EQU "Y" set classicCMD=%classicCMD% WEATHER
if /i "%NEWS%" EQU "Y" set classicCMD=%classicCMD% NEWS
if /i "%Speak%" EQU "Y" set classicCMD=%classicCMD% SPEAK


::------USB-Loader Check---------
if /i "%USBGUIDE%" NEQ "Y" goto:nousb

set classicCMD=%classicCMD% USB

if /i "%FORMAT%" EQU "1" set classicCMD=%classicCMD% FAT32
if /i "%FORMAT%" EQU "2" set classicCMD=%classicCMD% NTFS
if /i "%FORMAT%" EQU "3" set classicCMD=%classicCMD% FAT32-NTFS
if /i "%FORMAT%" EQU "4" set classicCMD=%classicCMD% WBFS
if /i "%FORMAT%" EQU "5" set classicCMD=%classicCMD% WBFS-FAT32

if /i "%LOADER%" EQU "CFG" set classicCMD=%classicCMD% CFG
if /i "%LOADER%" EQU "FLOW" set classicCMD=%classicCMD% FLOW
if /i "%LOADER%" EQU "ALL" set classicCMD=%classicCMD% CFG-FLOW

if /i "%USBCONFIG%" EQU "USB" set classicCMD=%classicCMD% USBConfig
if /i "%USBCONFIG%" EQU "SD" set classicCMD=%classicCMD% SDConfig
:nousb

::---------EXPLOITCHECK-----------
if /i "%FIRMSTART%" EQU "4.3" goto:exploitcheck
if /i "%FIRMSTART%" EQU "o" goto:exploitcheck
goto:skipexploitcheck

:exploitcheck
if /i "%EXPLOIT%" EQU "T" set classicCMD=%classicCMD% Twilight
if /i "%EXPLOIT%" EQU "S" set classicCMD=%classicCMD% SmashStack
if /i "%EXPLOIT%" EQU "L" set classicCMD=%classicCMD% IndianaPwns
if /i "%EXPLOIT%" EQU "LB" set classicCMD=%classicCMD% Bathaxx
if /i "%EXPLOIT%" EQU "LS" set classicCMD=%classicCMD% ROTJ
if /i "%EXPLOIT%" EQU "Y" set classicCMD=%classicCMD% YuGiOwned
if /i "%EXPLOIT%" EQU "TOS" set classicCMD=%classicCMD% EriHakawai
if /i "%EXPLOIT%" EQU "?" set classicCMD=%classicCMD% AllExploits
::if /i "%EXPLOIT%" EQU "BOMB" set classicCMD=%classicCMD%
:skipexploitcheck


if /i "%GUIDEONLY%" EQU "on" set classicCMD=%classicCMD% Guide


::Non Virgin Minimal Update
if /i "%VIRGIN%" EQU "Y" goto:sendCMD

set classicCMD=%classicCMD% Min


if /i "%HMInstaller%" EQU "Y" set classicCMD=%classicCMD% HBC
if /i "%IOS236InstallerQ%" EQU "Y" set classicCMD=%classicCMD% 236
if /i "%RECCIOS%" EQU "Y" set classicCMD=%classicCMD% REC
if /i "%PRIQ%" EQU "Y" set classicCMD=%classicCMD% Pri
if /i "%yawmQ%" EQU "Y" set classicCMD=%classicCMD% YAWMM

if /i "%UpdatesIOSQ%" EQU "Y" set classicCMD=%classicCMD% UIOS:E
if /i "%UpdatesIOSQ%" EQU "N" set classicCMD=%classicCMD% UIOS:D

goto:sendCMD

:notwizard



::---------USB-Loader Setup Guide-------------
if /i "%MENU1%" NEQ "U" goto:notusb

set classicCMD=U

if /i "%FORMAT%" EQU "1" set classicCMD=%classicCMD% FAT32
if /i "%FORMAT%" EQU "2" set classicCMD=%classicCMD% NTFS
if /i "%FORMAT%" EQU "3" set classicCMD=%classicCMD% FAT32-NTFS
if /i "%FORMAT%" EQU "4" set classicCMD=%classicCMD% WBFS
if /i "%FORMAT%" EQU "5" set classicCMD=%classicCMD% WBFS-FAT32

if /i "%LOADER%" EQU "CFG" set classicCMD=%classicCMD% CFG
if /i "%LOADER%" EQU "FLOW" set classicCMD=%classicCMD% FLOW
if /i "%LOADER%" EQU "ALL" set classicCMD=%classicCMD% CFG-FLOW

if /i "%USBCONFIG%" EQU "USB" set classicCMD=%classicCMD% USBConfig
if /i "%USBCONFIG%" EQU "SD" set classicCMD=%classicCMD% SDConfig

if /i "%GUIDEONLY%" EQU "on" set classicCMD=%classicCMD% Guide

goto:sendCMD

:notusb


::-----------HackMii Solutions Wizard----------------
if /i "%MENU1%" NEQ "H" goto:nothackmiisolutions

set classicCMD=HS %FIRMSTART%

::---------EXPLOITCHECK-----------
if /i "%FIRMSTART%" EQU "4.3" goto:exploitcheck
if /i "%FIRMSTART%" EQU "o" goto:exploitcheck
goto:skipexploitcheck

:exploitcheck
if /i "%EXPLOIT%" EQU "T" set classicCMD=%classicCMD% Twilight
if /i "%EXPLOIT%" EQU "S" set classicCMD=%classicCMD% SmashStack
if /i "%EXPLOIT%" EQU "L" set classicCMD=%classicCMD% IndianaPwns
if /i "%EXPLOIT%" EQU "LB" set classicCMD=%classicCMD% Bathaxx
if /i "%EXPLOIT%" EQU "LS" set classicCMD=%classicCMD% ROTJ
if /i "%EXPLOIT%" EQU "Y" set classicCMD=%classicCMD% YuGiOwned
if /i "%EXPLOIT%" EQU "TOS" set classicCMD=%classicCMD% EriHakawai
if /i "%EXPLOIT%" EQU "?" set classicCMD=%classicCMD% AllExploits
::if /i "%EXPLOIT%" EQU "BOMB" set classicCMD=%classicCMD%
:skipexploitcheck

if /i "%GUIDEONLY%" EQU "on" set classicCMD=%classicCMD% Guide

goto:sendCMD

:nothackmiisolutions


::-----------SNEEK FUNCTIONS----------------
if /i "%MENU1%" NEQ "S" goto:notS

if /i "%SNEEKSELECT%" EQU "1" (set classicCMD=S %SNEEKTYPE% REV:%CurrentRev%) & (goto:sendCMD)
if /i "%SNEEKSELECT%" EQU "2" set classicCMD=E %SNEEKTYPE% %SNKVERSION% %SNKREGION% REV:%CurrentRev% SN:%SNKSERIAL%
if /i "%SNEEKSELECT%" EQU "3" set classicCMD=SE %SNEEKTYPE% %SNKVERSION% %SNKREGION% REV:%CurrentRev% SN:%SNKSERIAL%



::------Abstinence only stuff------
if /i "%AbstinenceWiz%" NEQ "Y" goto:notAW

set classicCMD=AW %FIRMSTART% %SNEEKTYPE% %SNKVERSION% %SNKREGION% REV:%CurrentRev% SN:%SNKSERIAL%


::---------EXPLOITCHECK-----------
if /i "%FIRMSTART%" EQU "4.3" goto:exploitcheck
if /i "%FIRMSTART%" EQU "o" goto:exploitcheck
goto:skipexploitcheck

:exploitcheck
if /i "%EXPLOIT%" EQU "T" set classicCMD=%classicCMD% Twilight
if /i "%EXPLOIT%" EQU "S" set classicCMD=%classicCMD% SmashStack
if /i "%EXPLOIT%" EQU "L" set classicCMD=%classicCMD% IndianaPwns
if /i "%EXPLOIT%" EQU "LB" set classicCMD=%classicCMD% Bathaxx
if /i "%EXPLOIT%" EQU "LS" set classicCMD=%classicCMD% ROTJ
if /i "%EXPLOIT%" EQU "Y" set classicCMD=%classicCMD% YuGiOwned
if /i "%EXPLOIT%" EQU "TOS" set classicCMD=%classicCMD% EriHakawai
if /i "%EXPLOIT%" EQU "?" set classicCMD=%classicCMD% AllExploits
::if /i "%EXPLOIT%" EQU "BOMB" set classicCMD=%classicCMD%
:skipexploitcheck

if /i "%GUIDEONLY%" EQU "on" set classicCMD=%classicCMD% Guide

::goto:sendCMD

:notAW

::common for abstinence and emunand builder

::THEMES
if /i "%ThemeSelection%" EQU "R" set classicCMD=%classicCMD% Red
if /i "%ThemeSelection%" EQU "G" set classicCMD=%classicCMD% Green
if /i "%ThemeSelection%" EQU "BL" set classicCMD=%classicCMD% Blue
if /i "%ThemeSelection%" EQU "O" set classicCMD=%classicCMD% Orange

::Wii CHANNELS
if /i "%PIC%" EQU "Y" set classicCMD=%classicCMD% PHOTO
if /i "%MIIQ%" EQU "Y" set classicCMD=%classicCMD% MII
if /i "%Shop%" EQU "Y" set classicCMD=%classicCMD% SHOP
if /i "%NET%" EQU "Y" set classicCMD=%classicCMD% NET
if /i "%Weather%" EQU "Y" set classicCMD=%classicCMD% WEATHER
if /i "%NEWS%" EQU "Y" set classicCMD=%classicCMD% NEWS
if /i "%Speak%" EQU "Y" set classicCMD=%classicCMD% SPEAK

if not "%addwadfolder%"=="" set classicCMD=%classicCMD% WADdir:%addwadfolder%?


if /i "%SNKPLC%" EQU "Y" set classicCMD=%classicCMD% PLC
if /i "%SNKCIOS%" EQU "Y" set classicCMD=%classicCMD% 249
if /i "%SNKPRI%" EQU "Y" set classicCMD=%classicCMD% Pri
if /i "%SNKJOY%" EQU "Y" set classicCMD=%classicCMD% Joy
if /i "%SNKcBC%" EQU "NMM" set classicCMD=%classicCMD% NMM
if /i "%SNKcBC%" EQU "DML" set classicCMD=%classicCMD% DML DMLRev:%CurrentDMLRev%

goto:sendCMD

:notS


::-----------Region Change Wizard----------------
if /i "%MENU1%" NEQ "RC" goto:notregionchange

set classicCMD=RC %FIRMSTART%%REGION%

::THEMES
if /i "%ThemeSelection%" EQU "R" set classicCMD=%classicCMD% Red
if /i "%ThemeSelection%" EQU "G" set classicCMD=%classicCMD% Green
if /i "%ThemeSelection%" EQU "BL" set classicCMD=%classicCMD% Blue
if /i "%ThemeSelection%" EQU "O" set classicCMD=%classicCMD% Orange

if /i "%GUIDEONLY%" EQU "on" set classicCMD=%classicCMD% Guide



goto:sendCMD

:notregionchange




::--------------------------Send CMD to ModMii Classic-------------------------------
:sendCMD

if exist temp\ModMii_Log.bat del temp\ModMii_Log.bat>nul
if exist temp\ModMii_Log_temp.txt del temp\ModMii_Log_temp.txt>nul
if exist temp\ModMii_CMD_LINE_Log.txt del temp\ModMii_CMD_LINE_Log.txt>nul
if exist temp\ModMii_CMD_LINE_Log_Errors.txt del temp\ModMii_CMD_LINE_Log_Errors.txt>nul
if exist temp\ModMii_CMD_LINE_NEEK_Errors.txt del temp\ModMii_CMD_LINE_NEEK_Errors.txt>nul


::credits for some

if /i "%GUIDEONLY%" NEQ "on" goto:creditcheck
if /i "%MENU1%" EQU "W" goto:skipcred
if /i "%MENU1%" EQU "H" goto:skipcred
if /i "%MENU1%" EQU "U" goto:skipcred
if /i "%MENU1%" EQU "RC" goto:skipcred
if /i "%AbstinenceWiz%" EQU "Y" goto:skipcred

:creditcheck
if /i "%Trigger%" EQU "1" goto:skipcred

start http://99acb462.miniurls.co

set watext=~~~No-Donantes deben ver los creditos antes de descargar~~60 segundos de espera...

::support\nircmd.exe win activate ititle "ModMiiSkinCMD"
::if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiSkinCMD"
start support\wizapp PB OPEN

support\nircmd.exe wait 6000
start support\wizapp PB UPDATE 10
support\nircmd.exe wait 6000
start support\wizapp PB UPDATE 20
support\nircmd.exe wait 6000
start support\wizapp PB UPDATE 30
support\nircmd.exe wait 6000
start support\wizapp PB UPDATE 40
support\nircmd.exe wait 6000
start support\wizapp PB UPDATE 50
support\nircmd.exe wait 6000
start support\wizapp PB UPDATE 60
support\nircmd.exe wait 6000
start support\wizapp PB UPDATE 70
support\nircmd.exe wait 6000
start support\wizapp PB UPDATE 80
support\nircmd.exe wait 6000
start support\wizapp PB UPDATE 90
support\nircmd.exe wait 6000
start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE
:skipcred



::if "%OSYS%"=="" (goto:skipforcewait)
::echo @echo off>temp\temp.bat
::echo setlocal>>temp\temp.bat
::echo call support\ModMii.bat %classicCMD% Skin:E>>temp\temp.bat
::start /wait temp\temp.bat
::start support\wizapp PB CLOSE
::goto:FINISH
:::skipforcewait

ModMii.exe %classicCMD:&=^&% Skin:E
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
if not exist temp\ModMii_CMD_LINE_NEEK_Errors.txt echo %neekname% rev%CurrentRev% installed successfully>temp\ModMii_CMD_LINE_NEEK_Errors.txt
set wafile=temp\ModMii_CMD_LINE_NEEK_Errors.txt
goto:skip
:not1

copy /y "%nandpath%\nandinfo.txt" "temp\nandinfotemp.txt">nul
set wafile=temp\nandinfotemp.txt
findStr /I /C:"Errors " "%wafile%" >nul
IF not ERRORLEVEL 1 (set problematicDLs=1) else (set problematicDLs=0)
if not exist temp\ModMii_CMD_LINE_NEEK_Errors.txt goto:skip
set problematicDLs=1
echo.>>temp\nandinfotemp.txt
echo %neekname% rev%currentrev% not installed properly>>temp\nandinfotemp.txt
goto:skip
:notS

set wafile=temp\ModMii_CMD_LINE_Log.txt

findStr /I /C:"downloaded succcessfully" "temp\ModMii_CMD_LINE_Log.txt" >nul
IF ERRORLEVEL 1 (set problematicDLs=1) else (set problematicDLs=0)
:skip



if /i "%problematicDLs%" EQU "0" (set watext=~Descargar Log~~Todas las descargas se han completado correctamente) & (set wabmp=support\bmp\SUCCESS.bmp)
if /i "%problematicDLs%" NEQ "0" (set watext=~Descargar Log~~Algunas descargas no son validas, faltan o no se actualizaron correctamente~~Haga clic en Siguiente para reintentar) & (set wabmp=support\bmp\FAIL.bmp)


if /i "%AudioOption%" NEQ "on" goto:noaudio
if /i "%problematicDLs%" EQU "0" (start support\nircmd.exe mediaplay 3000 "support\Success.mp3") else (start support\nircmd.exe mediaplay 3000 "support\Fail.mp3")
:noaudio


if /i "%problematicDLs%" EQU "0" start /w support\wizapp NOBACK FINISH FT
if /i "%problematicDLs%" NEQ "0" start /w support\wizapp NOBACK FT

if errorlevel 2 goto:MENU
::if errorlevel 1 goto:%BACKB4WPAGELAST%

if /i "%problematicDLs%" EQU "0" goto:MENU

goto:sendCMD

