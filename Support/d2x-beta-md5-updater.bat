@echo off
setlocal

::KeepInvalidOverride=Y will automatically be added\removed from settings.bat before\after running this script


::chdir /d "%~dp0"
pushd "%~dp0"
cls
if not exist support cd..

set PATH=%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%;%homedrive%\ModMii\temp
chcp 437>nul


echo d2x cIOS beta MD5 Updater
echo -------------------------
echo.
echo Building d2x-beta cIOSs...

:Repeat
echo.
echo The 1st time ModMii runs the cIOSs will be invalid and open a text window
echo The 2nd time ModMii runs the cIOSs should be valid and not open a text window
echo.

if not exist Support\d2x-beta\d2x-beta.bat (echo Error: Missing Support\d2x-beta\d2x-beta.bat) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (exit)

if not exist temp\DownloadQueues mkdir temp\DownloadQueues


::build dummy files to speed up build

call Support\d2x-beta\d2x-beta.bat

::remove setting path's with an & symbol and force default
if exist Support\settings.bat support\sfk filter -spat Support\settings.bat -!"\x26" -write -yes>nul

::remove LegacyCIOS=Y from ModMii settings if not enabled in this script yet
if /i "%LegacyCIOS%" NEQ "Y" support\sfk filter "Support\settings.bat" -ls!"Set LegacyCIOS=" -write -yes>nul

if exist Support\settings.bat call Support\settings.bat


if "%Drive%"=="" set Drive=COPY_TO_SD

::check if drive folder exists--if second char is ":" check if drive exists
if /i "%DRIVE%" EQU "%cd%\COPY_TO_SD" set DRIVE=COPY_TO_SD
if /i "%DRIVE:~1,1%" NEQ ":" goto:skipcheck
if exist "%DRIVE:~0,2%" (goto:skipcheck) else (set DRIVE=COPY_TO_SD)
:skipcheck


if not exist "%Drive%\WAD" mkdir "%Drive%\WAD"


::build d2xAll queue

echo set AdvNumber=0 >temp\DownloadQueues\d2xAll.bat
echo if /i '?GetAdvNumberOnly?' EQU 'Y' goto:endofqueue>>temp\DownloadQueues\d2xAll.bat
echo Set ROOTSAVE=off>>temp\DownloadQueues\d2xAll.bat

echo Set cIOS249[37]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS249[37]-d2x-v%d2x-beta-rev%.wad"
echo Set cIOS250[37]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS250[37]-d2x-v%d2x-beta-rev%.wad"

echo Set cIOS248[38]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS248[38]-d2x-v%d2x-beta-rev%.wad"
echo Set cIOS249[38]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS249[38]-d2x-v%d2x-beta-rev%.wad"
echo Set cIOS250[38]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS250[38]-d2x-v%d2x-beta-rev%.wad"

echo Set cIOS249[56]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS249[56]-d2x-v%d2x-beta-rev%.wad"
echo Set cIOS250[56]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS250[56]-d2x-v%d2x-beta-rev%.wad"

echo Set cIOS249[53]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS249[53]-d2x-v%d2x-beta-rev%.wad"
echo Set cIOS250[53]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS250[53]-d2x-v%d2x-beta-rev%.wad"

echo Set cIOS249[55]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS249[55]-d2x-v%d2x-beta-rev%.wad"
echo Set cIOS250[55]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS250[55]-d2x-v%d2x-beta-rev%.wad"

echo Set cIOS249[57]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS249[57]-d2x-v%d2x-beta-rev%.wad"
echo Set cIOS250[57]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS250[57]-d2x-v%d2x-beta-rev%.wad"

echo Set cIOS249[58]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS249[58]-d2x-v%d2x-beta-rev%.wad"
echo Set cIOS250[58]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS250[58]-d2x-v%d2x-beta-rev%.wad"
echo Set cIOS251[58]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS251[58]-d2x-v%d2x-beta-rev%.wad"


::skip if cIOS not listed in d2x-beta.bat (check only needed for bases 60/70/80 which don't exist if older than v8 beta 42)
findStr /I /C:"cIOS249[60]" "Support\d2x-beta\d2x-beta.bat" >nul
IF ERRORLEVEL 1 goto:notfound

echo Set cIOS249[60]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS249[60]-d2x-v%d2x-beta-rev%.wad"
echo Set cIOS250[60]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS250[60]-d2x-v%d2x-beta-rev%.wad"

echo Set cIOS249[70]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS249[70]-d2x-v%d2x-beta-rev%.wad"
echo Set cIOS250[70]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS250[70]-d2x-v%d2x-beta-rev%.wad"

echo Set cIOS249[80]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS249[80]-d2x-v%d2x-beta-rev%.wad"
echo Set cIOS250[80]-d2x-v10-beta52=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS250[80]-d2x-v%d2x-beta-rev%.wad"
:notfound


::skip vWii if not supported by this beta
if not exist "Support\d2x-beta\ciosmaps_vWii.xml" goto:skipvwii

::skip vWii if LegacyCIOS enabled since no need for legacy altmd5's for vWii
if /i "%LegacyCIOS%" EQU "Y" goto:skipvwii

echo Set cIOS249[56]-d2x-vWii=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS249[56]-d2x-v%d2x-beta-rev%-vWii.wad"
echo Set cIOS250[57]-d2x-vWii=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS250[57]-d2x-v%d2x-beta-rev%-vWii.wad"
echo Set cIOS251[58]-d2x-vWii=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS251[58]-d2x-v%d2x-beta-rev%-vWii.wad"


::disable cIOS248[38]-d2x-vWii if not supported in ciosmaps_vWii.xml
::check ciosmaps_vWii.xml for 'base ios="38"'
findStr /I /C:"base ios=\"38\"" "Support\d2x-beta\ciosmaps_vWii.xml" >nul
IF ERRORLEVEL 1 goto:skipvwii

echo Set cIOS248[38]-d2x-vWii=*>>temp\DownloadQueues\d2xAll.bat
echo dummy>"%DRIVE%\WAD\cIOS248[38]-d2x-v%d2x-beta-rev%-vWii.wad"

:skipvwii

echo :endofqueue>>temp\DownloadQueues\d2xAll.bat

support\sfk filter -spat temp\DownloadQueues\d2xAll.bat -rep _\x27_\x22_ -rep _\x3f_\x25_ -rep _"AdvNumber=0 "_"AdvNumber=0"_ -write -yes>nul

echo Set KeepInvalidOverride=Y>>Support\settings.bat

::echo @echo off>d2xAll-Downloader.bat
::echo setlocal>>d2xAll-Downloader.bat
::echo call support\ModMii.bat L d2xALL>>d2xAll-Downloader.bat
::start /wait d2xAll-Downloader.bat

ModMii.exe L d2xALL



::del d2xAll-Downloader.bat>nul

if exist Support\settings.bat call Support\settings.bat
if "%Drive%"=="" set Drive=COPY_TO_SD
::::old way dependent upon fvc.exe, delete later
::if exist d2xALL.md5 del d2xALL.md5>nul
::support\fvc -c -a MD5 -r "%DRIVE%"\WAD\*.wad>>d2xALL.md5

echo Updating d2x MD5s...
echo.
call Support\d2x-beta\d2x-beta.bat

copy /y Support\d2x-beta\d2x-beta.bat Support\d2x-beta\d2x-beta.bak>nul

set number=0

:top
SET /a number=%number%+1
if /i "%number%" EQU "1" set cios=cIOS248[38]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "2" set cios=cIOS249[37]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "3" set cios=cIOS250[37]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "4" set cios=cIOS249[38]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "5" set cios=cIOS250[38]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "6" set cios=cIOS249[53]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "7" set cios=cIOS250[53]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "8" set cios=cIOS249[55]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "9" set cios=cIOS250[55]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "10" set cios=cIOS249[56]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "11" set cios=cIOS250[56]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "12" set cios=cIOS249[57]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "13" set cios=cIOS250[57]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "14" set cios=cIOS249[58]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "15" set cios=cIOS250[58]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "16" set cios=cIOS249[60]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "17" set cios=cIOS250[60]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "18" set cios=cIOS249[70]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "19" set cios=cIOS250[70]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "20" set cios=cIOS249[80]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "21" set cios=cIOS250[80]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "22" set cios=cIOS251[58]-d2x-v%d2x-beta-rev%.wad
if /i "%number%" EQU "23" set cios=cIOS249[56]-d2x-v%d2x-beta-rev%-vWii.wad
if /i "%number%" EQU "24" set cios=cIOS250[57]-d2x-v%d2x-beta-rev%-vWii.wad
if /i "%number%" EQU "25" set cios=cIOS251[58]-d2x-v%d2x-beta-rev%-vWii.wad
if /i "%number%" EQU "26" set cios=cIOS248[38]-d2x-v%d2x-beta-rev%-vWii.wad

::::old way dependent upon fvc.exe, delete later
::copy /y d2xALL.md5 temp\d2xALL.txt>nul
::support\sfk filter -spat temp\d2xALL.txt -+"%cios%" -rep _" *"__ -write -yes>nul
::set /p ciosmd5= <temp\d2xALL.txt

echo Updating %number% of 26: %cios%

if not exist "%DRIVE%\WAD\%cios%" (echo Not applicable and or doesn't exist, skipping...) & (echo.) & (goto:skiphashes)

support\sfk md5 "%DRIVE%\WAD\%cios%">temp\cios.md5
set /p ciosmd5= <"temp\cios.md5"
echo MD5 = %ciosmd5%

if /i "%LegacyCIOS%" EQU "Y" goto:altonly

if /i "%cios:~-9%" NEQ "-vWii.wad" support\sfk filter -spat Support\d2x-beta\d2x-beta.bat -rep _"\x22\x25wadname\x3a\x7e0,17\x25\x22 EQU \x22%cios:~0,17%\x22 set md5="*_"\x22\x25wadname\x3a\x7e0,17\x25\x22 EQU \x22%cios:~0,17%\x22 set md5=%ciosmd5%"_ -write -yes

if /i "%cios:~-9%" EQU "-vWii.wad" support\sfk filter -spat Support\d2x-beta\d2x-beta.bat -rep _"\x22\x25name\x3a\x7e0,17\x25\x22 EQU \x22%cios:~0,17%\x22 set md5="*_"\x22\x25name\x3a\x7e0,17\x25\x22 EQU \x22%cios:~0,17%\x22 set md5=%ciosmd5%"_ -write -yes

:altonly

if /i "%cios:~-9%" NEQ "-vWii.wad" support\sfk filter -spat Support\d2x-beta\d2x-beta.bat -rep _"\x22\x25wadname\x3a\x7e0,17\x25\x22 EQU \x22%cios:~0,17%\x22 set md5alt="*_"\x22\x25wadname\x3a\x7e0,17\x25\x22 EQU \x22%cios:~0,17%\x22 set md5alt=%ciosmd5%"_ -write -yes

if /i "%cios:~-9%" EQU "-vWii.wad" support\sfk filter -spat Support\d2x-beta\d2x-beta.bat -rep _"\x22\x25name\x3a\x7e0,17\x25\x22 EQU \x22%cios:~0,17%\x22 set md5alt="*_"\x22\x25name\x3a\x7e0,17\x25\x22 EQU \x22%cios:~0,17%\x22 set md5alt=%ciosmd5%"_ -write -yes



::UPDATE MD5 for cIOS251[38] is only an option in ModMii v6.6.0-6.6.3, so if not updated it won't be an issue for most people (this is the same as 249[38] with its slot changed to 251 by patchios.exe
if /i "%LegacyCIOS%" NEQ "Y" goto:skip
if /i "%cios%" NEQ "cIOS249[38]-d2x-v%d2x-beta-rev%.wad" goto:skip
if not exist "%Drive%\WAD\%cios%" goto:skip
echo.
echo Going the extra mile and updating cIOS251[38] which is only an option in ModMii v6.6.0-6.6.3
echo.

set cios=cIOS251[38]-d2x-v%d2x-beta-rev%.wad
move /y "%Drive%\WAD\cIOS249[38]-d2x-v%d2x-beta-rev%.wad" "%Drive%\WAD\%cios%">nul

cd support
if /i "%DRIVE:~1,1%" EQU ":" (set "DRIVEadj=%DRIVE%") else (set "DRIVEadj=..\%DRIVE%")
patchios "%Driveadj%\WAD\%cios%" -slot 251 -v %ciosversion%
cd..

support\sfk md5 "%DRIVE%\WAD\%cios%">temp\cios.md5
set /p ciosmd5= <"temp\cios.md5"
echo MD5 = %ciosmd5%

support\sfk filter -spat Support\d2x-beta\d2x-beta.bat -rep _"\x22\x25wadname\x3a\x7e0,17\x25\x22 EQU \x22%cios:~0,17%\x22 set md5="*_"\x22\x25wadname\x3a\x7e0,17\x25\x22 EQU \x22%cios:~0,17%\x22 set md5=%ciosmd5%"_ -write -yes
echo.
:skip


::delete wad: it will be reconstructed and confirmed later
del "%DRIVE%\WAD\%cios%">nul

:skiphashes

if /i "%LegacyCIOS%" EQU "Y" if "%number%" NEQ "22" goto:top
if /i "%LegacyCIOS%" NEQ "Y" if "%number%" NEQ "26" goto:top



echo.
echo d2x-beta.bat Updated
echo.


if exist "Support\More-cIOSs\d2x-v%d2x-beta-rev%" rd /s /q "Support\More-cIOSs\d2x-v%d2x-beta-rev%"
mkdir "Support\More-cIOSs\d2x-v%d2x-beta-rev%"
copy /y Support\d2x-beta\* "Support\More-cIOSs\d2x-v%d2x-beta-rev%\">nul

del "Support\More-cIOSs\d2x-v%d2x-beta-rev%\d2x-beta.bak">nul

if exist "d2x-v%d2x-beta-rev%.7z" del "d2x-v%d2x-beta-rev%.7z">nul

cd Support\More-cIOSs
..\7za a -t7z "..\..\d2x-v%d2x-beta-rev%.7z" "d2x-v%d2x-beta-rev%\*.bat"
..\7za a -t7z "..\..\d2x-v%d2x-beta-rev%.7z" "d2x-v%d2x-beta-rev%\*.app"

cd "d2x-v%d2x-beta-rev%"

if exist "*.xml" ..\..\7za a -t7z "..\..\..\d2x-v%d2x-beta-rev%.7z" "*.xml"
if exist "*.txt" ..\..\7za a -t7z "..\..\..\d2x-v%d2x-beta-rev%.7z" "*.txt"
cd ..\..\..

echo.
echo.
echo ModMii about to verify...
echo.

::remove LegacyCIOS=Y from ModMii settings if not enabled in this script yet
if /i "%LegacyCIOS%" NEQ "Y" support\sfk filter "Support\settings.bat" -ls!"Set LegacyCIOS=" -write -yes>nul

support\sfk filter "Support\settings.bat" -ls!"Set KeepInvalidOverride=" -write -yes>nul

::Set LegacyCIOS=

ModMii.exe L d2xALL

support\sfk filter "Support\settings.bat" -ls!"Set KeepInvalidOverride=" -ls!"Set LegacyCIOS=" -write -yes>nul

findStr /I /C:"Invalid" temp\ModMii_CMD_LINE_Log.txt >nul
IF ERRORLEVEL 1 goto:success
echo.
echo Something went wrong, press any key to exit...
pause>nul
exit




:success
if /i "%LegacyCIOS%" EQU "Y" goto:success2
echo SUCCESS!
echo.
echo Press any key to also update alt hashes to support legacy cIOS build method, or close this window now
pause>nul
echo.

:LegacyCheck
if not exist "%windir%\Microsoft.NET\Framework\v3.5" goto:warning
if not exist Support\WadMii.exe goto:warning
if not exist Support\libWiiSharp.dll goto:warning
if not exist Support\tmdedit.exe goto:warning
if exist Support\patchIOS.exe goto:skipwarning
:warning
echo To update alt hashes to also support legacy cIOS build method add missing files and press any key to try again
echo.
if not exist Support\WadMii.exe echo  - Support\WadMii.exe is missing
if not exist Support\patchIOS.exe echo  - Support\patchIOS.exe is missing
if not exist Support\tmdedit.exe echo  - Support\tmdedit.exe is missing
if not exist Support\libWiiSharp.dll echo  - Support\libWiiSharp.dll is missing
if not exist "%windir%\Microsoft.NET\Framework\v3.5" echo  - .NET Framework 3.5 not installed
echo.
echo Files can be retrieved from ModMii 7.0.2 here:
echo https://github.com/modmii/modmii.github.io/releases/download/7.0.2/ModMii.zip
echo.
echo Press any key to check re-check and continue, or close this window now
pause>nul
goto:LegacyCheck
:skipwarning

Set LegacyCIOS=Y
echo Set LegacyCIOS=Y>>Support\settings.bat

echo Building Legacy d2x-beta cIOSs...
goto:Repeat


:success2
echo Legacy CIOS md5s updated successfully!
echo.
echo Press any key to exit
pause>nul
exit
