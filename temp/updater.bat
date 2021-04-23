::get info and return to caller UNLESS temp\currentversion.txt is detected
@echo off
set newversion=6.6.3
set changelogURL=https://modmii.github.io/changelog.html
if exist temp\currentversion.txt (set /p currentversion= <temp\currentversion.txt) else (goto:ReturnToCaller)
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
Start ModMii.exe
exit


:updatefail
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


start support\wizapp2.exe PB UPDATE 66

if exist "support\ModMii.bat" ren "support\ModMii.bat" "ModMii-v%currentversion%.bat"
if exist "support\ModMiiSkin.bat" ren "support\ModMiiSkin.bat" "ModMiiSkin-v%currentversion%.bat"
support\7za2 x %UPDATENAME%%newversion%.zip -aoa
start support\wizapp2.exe PB UPDATE 100
del %UPDATENAME%%newversion%.zip>nul
start support\wizapp2.exe PB CLOSE
del support\7za2.exe>nul
del support\wizapp2.exe>nul
Start ModMiiSkin.exe
exit




:updatefailskin
start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE

set watext=~~Update check has failed, check your internet connection and firewall settings.~~Click any button to return to ModMiiSkin v%currentversion%
start /w support\wizapp NOBACK TB

::set wabmp=%wabmplast%
Start ModMiiSkin.exe
exit


::ReturnToCaller should be the last line
:ReturnToCaller