::get info and return to caller UNLESS temp\currentversion.txt is detected, not currentversionInfo.txt
@echo off
set newversion=6.6.3
set changelogURL=https://modmii.github.io/changelog.html

::Enable new hidden "set debug=on" setting when testing offline updater.bat changes, careful that this file does not accidentally get deleted during development\testing, save a copy of updater.bat the same folder as ModMii.exe and rename it Updatetemp.bat to test
::note when ModMii downloads updater.bat it is renamed to Updatetemp.bat for legacy purposes
if /i "%debug%" EQU "on" copy "Updatetemp.bat" "Updatetemp_backup.bat">nul

::check if patch required for ModMii 6.6.3 and lower
::do not change the below from 6.6.3 for the foreseable future, effective 6.6.4 variable will get updated

if "%currentversion%"=="" set currentversion=6.6.3
if exist temp\currentversionInfo.txt set /p currentversion= <temp\currentversionInfo.txt
if exist temp\skin.txt (set updatermode=skin) else (set updatermode=classic)

if %currentversion% GEQ 6.6.4 goto:skip

::force redownload of old cached ARCME.zip
if not exist "temp\ARCME.zip" goto:skiparcme
::hash is for old zip, if hashes match, then rename it
support\sfk md5 -quiet -verify 4eff09f8a16ab6157edcb339bd909ed3 "temp\ARCME.zip"
if not errorlevel 1 move /y "temp\ARCME.zip" "temp\ARCME_1.0.5.zip"> nul
:skiparcme




::if "support\NusFileGrabber.exe" is missing modmii will override version to 0.0.0 to force a full update, no need to apply patch if missing
if not exist "support\NusFileGrabber.exe" goto:skip
::if hashes match, then skip patching
support\sfk md5 -quiet -verify 97e91117b6750b03e0980f54f9db8c38 "Support\NusFileGrabber.exe"
if not errorlevel 1 goto:skip

echo.
echo Auto-patching ModMii to fix some NUS download issues
echo Downloading 2022-07-29 patch files...
::when updating make sure to catch all instances of ModMii.6.6.3.patch.zip
if exist temp\ModMii.6.6.3.patch.zip del temp\ModMii.6.6.3.patch.zip>nul
start /min /wait support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/ModMii.6.6.3.patch.zip" -O temp\ModMii.6.6.3.patch.zip
if exist temp\ModMii.6.6.3.patch.zip support\7za x -aoa "temp\ModMii.6.6.3.patch.zip" -o"%cd%" -r
if exist temp\ModMii.6.6.3.patch.zip del temp\ModMii.6.6.3.patch.zip>nul

::check if hashes match now
support\sfk md5 -quiet -verify 97e91117b6750b03e0980f54f9db8c38 "Support\NusFileGrabber.exe"
if not errorlevel 1 (set patchresult=pass) else (set patchresult=fail)

if /i "%AudioOption%" NEQ "on" goto:nosound
if /i "%patchresult%" EQU "pass" (start support\nircmd.exe mediaplay 3000 "support\Success.mp3") else (start support\nircmd.exe mediaplay 3000 "support\Fail.mp3")
:nosound

echo.
if /i "%patchresult%" EQU "pass" (support\sfk echo [Green]Patching successful!) else (support\sfk echo [Red]Patching failed!)
echo.

::pop up for both skin and classic

set watitle=ModMii Auto-Patcher
set waico=support\icon.ico
set wabmp=support\bmp\default.bmp
if "%wasig%"=="" set wasig=Brought to you by XFlak

set watext=~ModMii auto-patched itself to fix some NUS download issues.~~~I can't believe it's been over 12 years that I've been developing ModMii, I can barely remember back when it was still called NUS Auto Downloader!~~~Thanks for all your continued support, every little bit helps and it really means a lot.~~~~~~6.6.4 is coming...~it's BIG...~and so's my to do list...

if /i "%patchresult%" EQU "pass" start /w support\wizapp NOBACK TB

set watitle=ModMii Skin

if /i "%patchresult%" NEQ "pass" (set watext=ModMii tried and failed to patch itself to fix some NUS download issues) & (start /w support\wizapp MB STOP)

:skip



if not exist temp\currentversion.txt goto:ReturnToCaller
set /p currentversion= <temp\currentversion.txt


title ModMiiUpdater
set UPDATENAME=ModMii
if exist temp\skin.txt (set updatermode=skin) else (set updatermode=classic)

copy /y support\7za.exe support\7za2.exe>nul

if /i "%updatermode%" EQU "skin" goto:skin


setlocal
chcp 437>nul
mode con cols=85
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

if exist "%UPDATENAME%%newversion%.zip" del "%UPDATENAME%%newversion%.zip">nul
start /min /wait support\wget --no-check-certificate -t 3 https://github.com/modmii/modmii.github.io/releases/download/%newversion%/%UPDATENAME%%newversion%.zip
if not exist "%UPDATENAME%%newversion%.zip" goto:updatefail

if exist "support\ModMii.bat" ren "support\ModMii.bat" "ModMii-v%currentversion%.bat"
if exist "support\ModMiiSkin.bat" ren "support\ModMiiSkin.bat" "ModMiiSkin-v%currentversion%.bat"
support\7za2 x %UPDATENAME%%newversion%.zip -aoa
del %UPDATENAME%%newversion%.zip>nul
del support\7za2.exe>nul

::patch now too instead of later
echo Applying latest ModMii patch updates...
echo.
if exist temp\ModMii.6.6.3.patch.zip del temp\ModMii.6.6.3.patch.zip>nul
start /min /wait support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/ModMii.6.6.3.patch.zip" -O temp\ModMii.6.6.3.patch.zip

if not exist temp\ModMii.6.6.3.patch.zip goto:updateOKpatchFAIL
support\7za x -aoa "temp\ModMii.6.6.3.patch.zip" -o"Support" -r
del temp\ModMii.6.6.3.patch.zip>nul


if /i "%AudioOption%" EQU "on" start support\nircmd.exe mediaplay 3000 "support\Success.mp3"
Start ModMii.exe
exit

:updateOKpatchFAIL
if /i "%AudioOption%" EQU "on" start support\nircmd.exe mediaplay 3000 "support\Fail.mp3"
echo   Update succeeded but patching failed.
echo.
echo   Press any key to start ModMii v%newversion%
pause>nul
Start ModMii.exe
exit




:updatefail

if /i "%AudioOption%" EQU "on" start support\nircmd.exe mediaplay 3000 "support\Fail.mp3"
echo   Update failed, check your internet connection and firewall settings.
echo.
echo   Press any key to return to ModMii v%currentversion%
pause>nul
Start ModMii.exe
exit



:skin
::make cmd window transparent and hidden
support\nircmd.exe win trans ititle "ModMiiUpdater" 0
support\nircmd.exe win hide ititle "ModMiiUpdater"

copy /y support\wizapp.exe support\wizapp2.exe>nul

setlocal
chcp 437>nul


set wabmp=support\bmp\UPDATING.bmp

set watext=~Updating from v%currentversion% to v%newversion%~~Please Wait...

start support\wizapp PB OPEN
start support\wizapp PB UPDATE 25

::Kill ModMiiSkin.exe process so it can be updated
taskkill /im ModMiiSkin.exe /f >nul



if exist "%UPDATENAME%%newversion%.zip" del "%UPDATENAME%%newversion%.zip">nul
start /min /wait support\wget --no-check-certificate -t 3 https://github.com/modmii/modmii.github.io/releases/download/%newversion%/%UPDATENAME%%newversion%.zip
if not exist "%UPDATENAME%%newversion%.zip" goto:updatefailskin


start support\wizapp2.exe PB UPDATE 50

if exist "support\ModMii.bat" ren "support\ModMii.bat" "ModMii-v%currentversion%.bat"
if exist "support\ModMiiSkin.bat" ren "support\ModMiiSkin.bat" "ModMiiSkin-v%currentversion%.bat"
support\7za2 x %UPDATENAME%%newversion%.zip -aoa
start support\wizapp2.exe PB UPDATE 80
del %UPDATENAME%%newversion%.zip>nul


::patch now too instead of later
echo Applying latest ModMii patch updates...
echo.
if exist temp\ModMii.6.6.3.patch.zip del temp\ModMii.6.6.3.patch.zip>nul
start /min /wait support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/ModMii.6.6.3.patch.zip" -O temp\ModMii.6.6.3.patch.zip
start support\wizapp PB UPDATE 90
if not exist temp\ModMii.6.6.3.patch.zip goto:updateOKpatchFAILskin
support\7za x -aoa "temp\ModMii.6.6.3.patch.zip" -o"Support" -r
del temp\ModMii.6.6.3.patch.zip>nul

start support\wizapp PB UPDATE 100

start support\wizapp2.exe PB CLOSE
del support\7za2.exe>nul
del support\wizapp2.exe>nul
if /i "%AudioOption%" EQU "on" start support\nircmd.exe mediaplay 3000 "support\Success.mp3"
Start ModMiiSkin.exe
exit


:updateOKpatchFAILskin
start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE

set watext=~~Update succeeded but patching failed..~~Click any button to return to ModMiiSkin v%currentversion%
if /i "%AudioOption%" EQU "on" start support\nircmd.exe mediaplay 3000 "support\Fail.mp3"
start /w support\wizapp NOBACK TB

::set wabmp=%wabmplast%
Start ModMiiSkin.exe
exit


:updatefailskin
start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE

set watext=~~Update check has failed, check your internet connection and firewall settings.~~Click any button to return to ModMiiSkin v%currentversion%
if /i "%AudioOption%" EQU "on" start support\nircmd.exe mediaplay 3000 "support\Fail.mp3"
start /w support\wizapp NOBACK TB

::set wabmp=%wabmplast%
Start ModMiiSkin.exe
exit


::ReturnToCaller should be the last line
:ReturnToCaller