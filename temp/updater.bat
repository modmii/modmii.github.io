::get info and return to caller UNLESS temp\currentversion.txt is detected, not currentversionInfo.txt
@echo off
set newversion=7.0.3
set changelogURL=https://modmii.github.io/changelog.html

::Enable new hidden "set debug=on" setting when testing offline updater.bat changes, careful that this file does not accidentally get deleted during development\testing, save a copy of updater.bat the same folder as ModMii.exe and rename it Updatetemp.bat to test
::note when ModMii downloads updater.bat it is renamed to Updatetemp.bat for legacy purposes
if /i "%debug%" EQU "on" copy "Updatetemp.bat" "Updatetemp_backup.bat">nul

::do not change the below from 6.6.3 for the foreseable future, effective 6.6.4 variable will get updated

if "%currentversion%"=="" set currentversion=6.6.3
if exist temp\currentversionInfo.txt set /p currentversion= <temp\currentversionInfo.txt
if exist temp\skin.txt (set updatermode=skin) else (set updatermode=classic)


if %currentversion% NEQ 7.0.3 goto:skip
if /i "%DBversion%" EQU "24.12.04" goto:skip
echo.
echo Updating File Download Database (DB.bat) with minor changes to fix broken links...
echo.
start /min /wait support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/master/Support/subscripts/DB.bat" -O Support/subscripts/DB.bat
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

title ModMiiUpdater
set UPDATENAME=ModMii
if exist temp\skin.txt (set updatermode=skin) else (set updatermode=classic)

copy /y support\7za.exe support\7za2.exe>nul

if /i "%updatermode%" EQU "skin" goto:skin


setlocal
chcp 437>nul
::mode con cols=85
color 1f

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
start /min /wait support\wget --no-check-certificate -t 3 https://github.com/modmii/modmii.github.io/releases/download/%newversion%/%UPDATENAME%.zip
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

setlocal
chcp 437>nul


if exist "Support\Skins\Default\UPDATING.bmp" (set "wabmp=Support\Skins\Default\UPDATING.bmp") else (set wabmp=support\bmp\UPDATING.bmp)
if exist "Support\Skins\%skin%\UPDATING.bmp" set "wabmp=Support\Skins\%skin%\UPDATING.bmp"


set watext=~Updating from v%currentversion% to v%newversion%~~Please Wait...

start support\wizapp2.exe PB OPEN
start support\wizapp2.exe PB UPDATE 25

::Kill ModMiiSkin.exe process so it can be updated
taskkill /im ModMiiSkin.exe /f >nul



if exist "%UPDATENAME%.zip" del "%UPDATENAME%.zip">nul
start /min /wait support\wget --no-check-certificate -t 3 https://github.com/modmii/modmii.github.io/releases/download/%newversion%/%UPDATENAME%.zip
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