::get info and return to caller UNLESS temp\currentversion.txt is detected, not currentversionInfo.txt
@echo off
set newversion=8.0.0
set changelogURL=https://modmii.github.io/changelog.html

::Enable new hidden "set debug=on" setting when testing offline updater.bat changes, careful that this file does not accidentally get deleted during development\testing, save a copy of updater.bat the same folder as ModMii.exe and rename it Updatetemp.bat to test
::note when ModMii downloads updater.bat it is renamed to Updatetemp.bat for legacy purposes
if /i "%debug%" EQU "on" copy "Updatetemp.bat" "Updatetemp_backup.bat">nul

::do not change the below from 6.6.3 for the foreseable future, effective 6.6.4 variable will get updated
if "%currentversion%"=="" set currentversion=6.6.3
if exist temp\currentversionInfo.txt set /p currentversion= <temp\currentversionInfo.txt
if exist temp\skin.txt (set updatermode=skin) else (set updatermode=classic)


::recommended d2x version check
::update below with latest recommended d2x
set CurrentcIOS=d2x-v11-beta2
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat

if not exist support\d2x-beta\d2x-beta.bat goto:continue

set "watitlebak=%watitle%"
set "watextbak=%watext%"
set watitle=ModMii d2x cIOS Warning
set "watext=Warning: d2x-v%d2x-beta-rev% cIOS is enabled but %CurrentcIOS% is recommended, consider enabling it in ModMii Classic's options"
if /i "%d2x-beta-rev%" NEQ "%CurrentcIOS:~5%" echo %watext%
if /i "%updatermode%" EQU "skin" if /i "%d2x-beta-rev%" NEQ "%CurrentcIOS:~5%" start support\wizapp MB exclamation
set "watitle=%watitlebak%"
set "watext=%watextbak%"

if exist support\d2x-beta\d2x-beta.bat goto:skip

:continue
if /i "%d2x-beta-rev%" EQU "%CurrentcIOS:~5%" goto:skip
::download and extract recommended d2x beta
::note if in skin mode and ModMiiverbose is off then this will happen silently during update checks
echo.
echo Downloading and enabling latest recommended d2x cIOS: %CurrentcIOS%
echo.
echo This can be changed in ModMii Classic's Options
echo.
support\wget --output-document %CurrentcIOS%.zip --no-check-certificate -t 3 "https://github.com/modmii/modmii.github.io/blob/master/temp/d2x/%CurrentcIOS%.7z?raw=true" -q --show-progress
echo.

::delete if file is empty
>nul findstr "^" "%CurrentcIOS%.zip" || del "%CurrentcIOS%.zip"

if not exist "%CurrentcIOS%.zip" goto:badkey
if not exist "support\More-cIOSs\%CurrentcIOS%" mkdir "support\More-cIOSs\%CurrentcIOS%"
support\7za e -aoa "%CurrentcIOS%.zip" -o"support\More-cIOSs\%CurrentcIOS%" *.* -r
del "%CurrentcIOS%.zip">nul
if not exist "support\More-cIOSs\%CurrentcIOS%\d2x-beta.bat" (rd /s /q "support\More-cIOSs\%CurrentcIOS%") & (goto:badkey)

if exist support\d2x-beta rd /s /q support\d2x-beta
mkdir support\d2x-beta
copy /y "support\More-cIOSs\%CurrentcIOS%\*" "support\d2x-beta">nul
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
echo.
if /i "%d2x-beta-rev%" EQU "%CurrentcIOS:~5%" (echo %CurrentcIOS% cIOS successfully enabled!) else (goto:badkey)
echo.
goto:skip

:badkey
echo.
echo Something went wrong, %CurrentcIOS% cIOS not enabled...
echo.
:skip


if %currentversion% NEQ 8.0.0 goto:skip
if /i "%DBversion%" EQU "25.03.11" goto:skip
echo.
echo Updating File Download Database (DB.bat) with minor changes...
support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/d7c5d1bc2415c3a5439daa41807f9ced1af67854/Support/subscripts/DB.bat" -O Support/subscripts/DB.bat -q --show-progress
echo.
call Support/subscripts/DB.bat
:skip


if %currentversion% NEQ 7.0.3 goto:skip
if /i "%DBversion%" EQU "24.12.04" goto:skip
echo.
echo Updating File Download Database (DB.bat) with minor changes to fix broken links...
support\wget --no-check-certificate -t 3 "https://github.com/modmii/modmii.github.io/blob/5a4b38942341d312eeee58b92915d1b1bcba85d8/Support/subscripts/DB.bat" -O Support/subscripts/DB.bat -q --show-progress
echo.
call Support/subscripts/DB.bat
:skip


if %currentversion% GEQ 7.0.3 goto:skip
::update old str2hax DNS's, latest change in mid-2024 during 7.0.2 reign
support\sfk filter "Support\Guide\str2hax.001" -rep _"18.188.135.9"_"3.143.163.250"_ -rep _"173.201.71.14"_"3.143.163.250"_ -rep _"97.74.103.14"_"3.143.163.250"_ -write -yes>nul
:skip


if %currentversion% GEQ 6.6.4 goto:skiparcme
::force redownload of old cached ARCME.zip
if not exist "temp\ARCME.zip" goto:skiparcme
::hash is for old zip, if hashes match, then rename it
support\sfk md5 -quiet -verify 4eff09f8a16ab6157edcb339bd909ed3 "temp\ARCME.zip"
if not errorlevel 1 move /y "temp\ARCME.zip" "temp\ARCME_1.0.5.zip"> nul
:skiparcme



if not exist temp\currentversion.txt goto:ReturnToCaller


setlocal
chcp 437>nul


set /p currentversion= <temp\currentversion.txt

if exist Support\settings.bat call Support\settings.bat
IF "%AudioOption%"=="" set AudioOption=on
IF "%skin%"=="" set skin=Default
if exist "Support\Skins\Default\Fail.mp3" (set "Fail.mp3=Support\Skins\Default\Fail.mp3") else (set "Fail.mp3=Support\Fail.mp3")
if exist "Support\Skins\%skin%\Fail.mp3" set "Fail.mp3=Support\Skins\%skin%\Fail.mp3"
if exist "Support\Skins\Default\Success.mp3" (set "Success.mp3=Support\Skins\Default\Success.mp3") else (set "Success.mp3=Support\Success.mp3")
if exist "Support\Skins\%skin%\Success.mp3" set "Success.mp3=Support\Skins\%skin%\Success.mp3"
set waico=support\icon.ico
set wasig=Brought to you by XFlak
set watitle=ModMii Updater

title ModMiiUpdater
set UPDATENAME=ModMii

if /i "%updatermode%" EQU "classic" color 1f



::min requirements check

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

if /i "%updatermode%" EQU "skin" goto:skinWarning



cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo Unfortunately this PC does not meet ModMii's minimum system requirements.
echo.
echo ModMii v8.0.0 and above requires 64-bit Windows 8.1 or higher.
echo.
echo You can manually install the latest ModMii but many features will not work.
echo.

if %currentversion% LSS 7.0.3 goto:tinyskip
echo Press any key to return to ModMii v%currentversion%...
pause> nul
Start ModMii.exe
exit
:tinyskip

echo Press any key to update ModMii to v7.0.3 which is the last update
echo that does not require 64-bit Windows 8.1 or higher
echo.
pause
set newversion=7.0.3
goto:continue


:skinWarning

::make cmd window transparent and hidden
if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win trans ititle "ModMiiUpdater" 0
if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiUpdater"


if exist "Support\Skins\Default\UPDATECHECK.bmp" (set "wabmp=Support\Skins\Default\UPDATECHECK.bmp") else (set wabmp=support\bmp\UPDATECHECK.bmp)
if exist "Support\Skins\%skin%\UPDATECHECK.bmp" set "wabmp=Support\Skins\%skin%\UPDATECHECK.bmp"

set watext=Unfortunately this PC does not meet ModMii's minimum system requirements.~~ModMii v8.0.0 and above requires 64-bit Windows 8.1 or higher.~~You can manually install the latest ModMii but many features will not work.

if %currentversion% GEQ 7.0.3 set "watext=%watext%~~Click any button to return to ModMiiSkin v%currentversion%"

if %currentversion% LSS 7.0.3 set "watext=%watext%~~Click Cancel to return to ModMiiSkin v%currentversion%, or click Next to update to v7.0.3 which is the last update that does not require 64-bit Windows 8.1 or higher."

start /w support\wizapp NOBACK TB
if errorlevel 2 (Start ModMiiSkin.exe) & (exit)

if %currentversion% GEQ 7.0.3 (Start ModMiiSkin.exe) & (exit)

set newversion=7.0.3
::goto:continue


:continue

copy /y support\7za.exe support\7za2.exe>nul
if /i "%updatermode%" EQU "skin" goto:skin


cls
echo                                        ModMii                                v%currentversion%
echo                                       by XFlak
echo.
echo.
echo                            Updating from v%currentversion% to v%newversion%
echo.
echo.
echo                                     Please Wait...
echo.

if exist "%UPDATENAME%.zip" del "%UPDATENAME%.zip">nul
support\wget --no-check-certificate -t 3 https://github.com/modmii/modmii.github.io/releases/download/%newversion%/%UPDATENAME%.zip -q --show-progress
if not exist "%UPDATENAME%.zip" goto:updatefail

::if exist "support\ModMii.bat" ren "support\ModMii.bat" "ModMii-v%currentversion%.bat"
::if exist "support\ModMiiSkin.bat" ren "support\ModMiiSkin.bat" "ModMiiSkin-v%currentversion%.bat"
support\7za2 x %UPDATENAME%.zip -aoa

IF %ERRORLEVEL% EQU 0 goto:continue
::if exist "support\ModMii-v%currentversion%.bat" ren "support\ModMii-v%currentversion%.bat" "ModMii.bat"
::if exist "support\ModMiiSkin-v%currentversion%.bat" ren "support\ModMiiSkin-v%currentversion%.bat" "ModMiiSkin.bat"
del support\7za2.exe>nul
if exist %UPDATENAME%.zip del %UPDATENAME%.zip>nul
goto:updatefail

:continue
if exist %UPDATENAME%.zip del %UPDATENAME%.zip>nul
del support\7za2.exe>nul


if %currentversion% GEQ 7.0.4 goto:skip
::check for legacy d2x-beta.bat's, if "magicword2" found no need for further checks
if not exist support\d2x-beta goto:skip
findStr "magicword2" "support\d2x-beta\d2x-beta.bat" >nul
IF ERRORLEVEL 1 goto:skip
rd /s /q support\d2x-beta
echo.
echo d2x cIOS version restored to default but you can change it again in Options
echo.
@ping 127.0.0.1 -n 2 -w 1000> nul
:skip


if /i "%AudioOption%" EQU "on" start support\nircmd.exe mediaplay 3000 "%Success.mp3%"
Start ModMii.exe
exit



:updatefail

if /i "%AudioOption%" EQU "on" start support\nircmd.exe mediaplay 3000 "%Fail.mp3%"
echo   Update failed, check your internet connection and antivirus\firewall settings.
echo.
echo   Press any key to return to ModMii v%currentversion%
pause>nul
Start ModMii.exe
exit



:skin
::make cmd window transparent and hidden
if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win trans ititle "ModMiiUpdater" 0
if /i "%ModMiiverbose%" NEQ "on" support\nircmd.exe win hide ititle "ModMiiUpdater"

copy /y support\wizapp.exe support\wizapp2.exe>nul


if exist "Support\Skins\Default\UPDATING.bmp" (set "wabmp=Support\Skins\Default\UPDATING.bmp") else (set wabmp=support\bmp\UPDATING.bmp)
if exist "Support\Skins\%skin%\UPDATING.bmp" set "wabmp=Support\Skins\%skin%\UPDATING.bmp"


set watext=~Updating from v%currentversion% to v%newversion%~~Please Wait...

start support\wizapp2.exe PB OPEN
start support\wizapp2.exe PB UPDATE 25

::Kill ModMiiSkin.exe process so it can be updated
taskkill /im ModMiiSkin.exe /f >nul



if exist "%UPDATENAME%.zip" del "%UPDATENAME%.zip">nul
support\wget --no-check-certificate -t 3 https://github.com/modmii/modmii.github.io/releases/download/%newversion%/%UPDATENAME%.zip -q --show-progress
if not exist "%UPDATENAME%.zip" goto:updatefailskin


start support\wizapp2.exe PB UPDATE 50

::if exist "support\ModMii.bat" ren "support\ModMii.bat" "ModMii-v%currentversion%.bat"
::if exist "support\ModMiiSkin.bat" ren "support\ModMiiSkin.bat" "ModMiiSkin-v%currentversion%.bat"
support\7za2 x %UPDATENAME%.zip -aoa

IF %ERRORLEVEL% EQU 0 goto:continue
::if exist "support\ModMii-v%currentversion%.bat" ren "support\ModMii-v%currentversion%.bat" "ModMii.bat"
::if exist "support\ModMiiSkin-v%currentversion%.bat" ren "support\ModMiiSkin-v%currentversion%.bat" "ModMiiSkin.bat"
del support\7za2.exe>nul
del support\wizapp2.exe>nul
if exist %UPDATENAME%.zip del %UPDATENAME%.zip>nul
goto:updatefailskin

:continue
start support\wizapp2.exe PB UPDATE 80
start support\wizapp2.exe PB UPDATE 100
start support\wizapp2.exe PB CLOSE

del support\7za2.exe>nul
del support\wizapp2.exe>nul
if exist %UPDATENAME%.zip del %UPDATENAME%.zip>nul

if %currentversion% GEQ 7.0.4 goto:skip
::check for legacy d2x-beta.bat's, if "magicword2" found no need for further checks
if not exist support\d2x-beta goto:skip
findStr "magicword2" "support\d2x-beta\d2x-beta.bat" >nul
IF ERRORLEVEL 1 goto:skip
rd /s /q support\d2x-beta
::echo.
echo d2x cIOS version restored to default but you can change it again in Options
::echo.
::@ping 127.0.0.1 -n 2 -w 1000> nul
:skip



if /i "%AudioOption%" EQU "on" start support\nircmd.exe mediaplay 3000 "%Success.mp3%"
Start ModMiiSkin.exe
exit


:updatefailskin
start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE

set watext=~~Update check has failed, check your internet connection and antivirus\firewall settings.~~Click any button to return to ModMiiSkin v%currentversion%
if /i "%AudioOption%" EQU "on" start support\nircmd.exe mediaplay 3000 "%Fail.mp3%"
start /w support\wizapp NOBACK TB

::set wabmp=%wabmplast%
Start ModMiiSkin.exe
exit


::ReturnToCaller should be the last line
:ReturnToCaller