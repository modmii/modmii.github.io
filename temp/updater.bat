::get info and return to caller UNLESS temp\currentversion.txt is detected, not currentversionInfo.txt
@echo off
if not exist Support\ModMii.bat cd..
set newversion=8.0.6
set changelogURL=https://modmii.github.io/changelog.html
set "wabmplast=%wabmp%"

::update below with latest recommended d2x
set RecD2XcIOS=d2x-v11-beta3
::update below with the version of d2x bundled with the latest version of ModMii
set BundledcIOS=d2x-v11-beta3

::Enable hidden "set debug=on" setting when testing offline temp\updater.bat changes
if /i "%debug%" EQU "on" if exist "temp\updater.bat" copy "temp\updater.bat" "temp\updater_backup.bat">nul
if /i "%debug%" EQU "on" if exist "Updatetemp.bat" copy "Updatetemp.bat" "Updatetemp_backup.bat">nul

::do not change the below from 6.6.3 for the foreseable future, effective 6.6.4 variable will get updated
if "%currentversion%"=="" set currentversion=6.6.3
if exist temp\currentversionInfo.txt set /p currentversion= <temp\currentversionInfo.txt
if exist temp\skin.txt (set updatermode=skin) else (set updatermode=classic)

::recommended d2x version check
if exist "Support\settings.bat" support\sfk filter -spat "Support\settings.bat" -ls!"set \x22RecD2XcIOS=" -write -yes>nul
echo Set "RecD2XcIOS=%RecD2XcIOS%">> Support\settings.bat

if not exist support\d2x-beta\d2x-beta.bat goto:continue
call support\d2x-beta\d2x-beta.bat


if /i "%d2x-beta-rev%" NEQ "%RecD2XcIOS:~5%" echo Warning: d2x-v%d2x-beta-rev% cIOS is enabled but %RecD2XcIOS% is recommended, consider enabling it in ModMii Classic's options
if /i "%updatermode%" EQU "skin" if /i "%d2x-beta-rev%" NEQ "%RecD2XcIOS:~5%" start support\nircmd.exe infobox "Warning: d2x-v%d2x-beta-rev% cIOS is enabled but %RecD2XcIOS% is recommended, consider enabling it in ModMii Classic's options" "d2x Version Warning"


if exist support\d2x-beta\d2x-beta.bat goto:skip

:continue
if /i "%d2x-beta-rev%" EQU "%RecD2XcIOS:~5%" goto:skip
::download and extract recommended d2x beta
::note if in skin mode and ModMiiverbose is off then this will happen silently during update checks
echo.
echo Enabling latest recommended d2x cIOS: %RecD2XcIOS%
echo.
echo This can be changed in ModMii Classic's Options
echo.

if exist "support\More-cIOSs\%RecD2XcIOS%\d2x-beta.bat" goto:pickup

support\wget --no-check-certificate -q --show-progress -t 3 -O "%RecD2XcIOS%.zip" "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/d2x/%RecD2XcIOS%.7z"
echo.

::delete if file is empty
>nul findstr "^" "%RecD2XcIOS%.zip" || del "%RecD2XcIOS%.zip"

if not exist "%RecD2XcIOS%.zip" goto:badkey
if not exist "support\More-cIOSs\%RecD2XcIOS%" mkdir "support\More-cIOSs\%RecD2XcIOS%"
support\7za e -aoa "%RecD2XcIOS%.zip" -o"support\More-cIOSs\%RecD2XcIOS%" *.* -r
del "%RecD2XcIOS%.zip">nul
if not exist "support\More-cIOSs\%RecD2XcIOS%\d2x-beta.bat" (rd /s /q "support\More-cIOSs\%RecD2XcIOS%") & (goto:badkey)

:pickup
if exist support\d2x-beta rd /s /q support\d2x-beta
mkdir support\d2x-beta
copy /y "support\More-cIOSs\%RecD2XcIOS%\*" "support\d2x-beta">nul
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
echo.
if /i "%d2x-beta-rev%" EQU "%RecD2XcIOS:~5%" (echo %RecD2XcIOS% cIOS successfully enabled!) else (goto:badkey)
echo.
goto:skip

:badkey
echo.
echo Something went wrong, %RecD2XcIOS% cIOS not enabled...
echo.
:skip

call Support\subscripts\DB.bat

::workaround for 8.0.1 & 8.0.2 autoupdate bug
if /i "%updatermode%" NEQ "skin" if %currentversion% EQU 8.0.1 set debug=on
if /i "%updatermode%" NEQ "skin" if %currentversion% EQU 8.0.2 set debug=on


::WiiPy BugFix for emunands for 8.0.0-8.0.3
if %currentversion% EQU 8.0.0 goto:fixWiiPy
if %currentversion% EQU 8.0.1 goto:fixWiiPy
if %currentversion% EQU 8.0.2 goto:fixWiiPy
if %currentversion% NEQ 8.0.3 goto:skip
:fixWiiPy
::hash is for new wiipy, if hashes match, then skip
support\sfk md5 -quiet -verify f3dc114161f3566ffb400e6120e2f01f "Support\wiipy\wiipy.exe"
if not errorlevel 1 goto:skip
echo.
echo Updating WiiPy to fix emunand title installation issues...
if exist temp\WiiPy-Windows-bin.zip del temp\WiiPy-Windows-bin.zip>nul
support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\WiiPy-Windows-bin.zip" "https://raw.githubusercontent.com/xflak/xflak.github.io/main/stuff/WiiPy-Windows-bin_2025-04-19.zip"
echo.
::delete if file is empty
>nul findstr "^" "temp\WiiPy-Windows-bin.zip" || del "temp\WiiPy-Windows-bin.zip"
if not exist "temp\WiiPy-Windows-bin.zip" (echo WiiPy Download Failed...) & (goto:skip)
support\7za x -aoa "temp\WiiPy-Windows-bin.zip" -o"Support\wiipy"
IF %ERRORLEVEL% NEQ 0 echo WiiPy Update Failed...
IF %ERRORLEVEL% EQU 0 support\sfk filter "Support\subscripts\CollectWadInfo.bat" -rep _"Valid (Unmodified)"_"Legitimate (Unmodified TMD + Ticket)"_ -write -yes>nul
if exist temp\WiiPy-Windows-bin.zip del temp\WiiPy-Windows-bin.zip>nul
:skip


if %currentversion% NEQ 8.0.0 goto:skip
if /i "%DBversion%" EQU "25.03.24" goto:skip
echo.
echo Updating File Download Database (DB.bat) with minor changes...
support\wget --no-check-certificate -q --show-progress -t 3 -O "Support\subscripts\DB.bat" "https://raw.githubusercontent.com/modmii/modmii.github.io/1d74b8c460d9bd82e5a87f774a3c1954f29d1567/Support/subscripts/DB.bat"
echo.
call Support\subscripts\DB.bat
:skip


if %currentversion% NEQ 7.0.3 goto:skip
if /i "%DBversion%" EQU "24.12.04" goto:skip
echo.
echo Updating File Download Database (DB.bat) with minor changes to fix broken links...
support\wget --no-check-certificate -q --show-progress -t 3 -O "Support\subscripts\DB.bat" "https://raw.githubusercontent.com/modmii/modmii.github.io/5a4b38942341d312eeee58b92915d1b1bcba85d8/Support/subscripts/DB.bat"
echo.
call Support\subscripts\DB.bat
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


::0401
if %currentversion% GEQ 8.0.0 goto:skip
for /f "tokens=2 delims==" %%G in ('wmic os get localdatetime /value') do set datetime=%%G
set "CurDate=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%"
goto:skip2
:skip
FOR /F "tokens=*" %%g IN ('support\sfk date') do (SET CurDate=%%g)
:skip2
if /i "%CurDate:~-4%" NEQ "0401" if exist temp\settings0401.bat if exist "Support\Skins\aluben\settings0402.bat" call "Support\Skins\aluben\settings0402.bat"
if /i "%CurDate:~-4%" NEQ "0401" goto:skip0401
echo.
support\sfk echo Easter Egg Cheat Code Hint: [%redtext%]MUSIC
echo.
if /i "%updatermode%" NEQ "skin" color A0
set "whitetext=0"
set "backgroundcolor=A"
set "greentext=Blue"
echo set "whitetext=0"> temp\settings0401.bat
echo set "backgroundcolor=A">> temp\settings0401.bat
echo set "greentext=Blue">> temp\settings0401.bat
support\sfk filter -spat Support\settings.bat -ls!"if exist temp\settings0401.bat" -write -yes>nul
echo if exist temp\settings0401.bat call temp\settings0401.bat>> Support\settings.bat
if exist Support\Skins\aluben\settings.dat goto:skipDL
support\wget --no-check-certificate -q -t 3 -O "temp\aluben.zip" "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/Skins/aluben.zip"
if not exist "Support\Skins\aluben" mkdir "Support\Skins\aluben"
if exist temp\aluben.zip support\7za e -aoa "temp\aluben.zip" -o"Support\Skins\aluben" *.* -r >nul
if exist temp\aluben.zip del temp\aluben.zip>nul
if not exist Support\Skins\aluben\settings.dat rd /s /q Support\Skins\aluben
:skipDL
if exist "Support\Skins\aluben\settings0401.bat" (copy /y "Support\Skins\aluben\settings0401.bat" "temp\settings0401.bat" >nul) & (call "Support\Skins\aluben\settings0401.bat")
:skip0401




::min requirements check
if %currentversion% GEQ %newversion% goto:continue

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

::if exists it means this msg has been seen already and the user is ready to update to 7.0.3

if exist temp\currentversion.txt (set newversion=7.0.3) & (goto:continue)
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
pause>nul
echo.
echo Ignore any messages indicating your ModMii is up to date...
echo.
set "newversion=%currentversion%"
goto:ReturnToCaller
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

set "newversion=%currentversion%"

start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE

start /w support\wizapp NOBACK TB
if not errorlevel 2 goto:not2
goto:ReturnToCaller
:not2

if %currentversion% GEQ 7.0.3 goto:ReturnToCaller

set newversion=7.0.3
::goto:continue


:continue


if not exist temp\currentversion.txt goto:ReturnToCaller

::workaround for 8.0.1 & 8.0.2 autoupdate bug (reversal)
set debug=

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
support\wget --no-check-certificate -q --show-progress -t 3 -O "%UPDATENAME%.zip" "https://github.com/modmii/modmii.github.io/releases/download/%newversion%/%UPDATENAME%.zip"
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


::check to see if bundled d2x is toggled, if so erase d2x-beta folder (only difference is bundled d2x has version # set to 65535)
if not exist support\d2x-beta\d2x-beta.bat goto:skip
call support\d2x-beta\d2x-beta.bat
if /i "%d2x-beta-rev%" EQU "%BundledcIOS:~5%" rd /s /q support\d2x-beta
:skip


if %currentversion% GEQ 7.0.4 goto:skip
::check for legacy d2x-beta.bat's, if "magicword2" found no need for further checks
if not exist support\d2x-beta\d2x-beta.bat goto:skip
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
support\wget --no-check-certificate -q --show-progress -t 3 -O "%UPDATENAME%.zip" "https://github.com/modmii/modmii.github.io/releases/download/%newversion%/%UPDATENAME%.zip"
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

::check to see if bundled d2x is toggled, if so erase d2x-beta folder (only difference is bundled d2x has version # set to 65535)
if not exist support\d2x-beta\d2x-beta.bat goto:skip
call support\d2x-beta\d2x-beta.bat
if /i "%d2x-beta-rev%" EQU "%BundledcIOS:~5%" rd /s /q support\d2x-beta
:skip


if %currentversion% GEQ 7.0.4 goto:skip
::check for legacy d2x-beta.bat's, if "magicword2" found no need for further checks
if not exist support\d2x-beta\d2x-beta.bat goto:skip
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
start support\wizapp PB UPDATE 100
start support\wizapp PB CLOSE
start /w support\wizapp NOBACK TB

::set wabmp=%wabmplast%
Start ModMiiSkin.exe
exit


::ReturnToCaller should be kept at the end
:ReturnToCaller
if not "%wabmplast%"=="" set "wabmp=%wabmplast%"
if exist temp\currentversionInfo.txt del temp\currentversionInfo.txt>nul
if exist temp\skin.txt del temp\skin.txt>nul
