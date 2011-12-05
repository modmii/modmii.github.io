@echo off
setlocal

if not exist support cd..

if not exist temp\DownloadQueues mkdir temp\DownloadQueues

::build d2xAll queue
if exist temp\DownloadQueues\d2xAll.bat goto:skip

echo set AdvNumber=0 >temp\DownloadQueues\d2xAll.bat
echo if /i '?GetAdvNumberOnly?' EQU 'Y' goto:endofqueue>>temp\DownloadQueues\d2xAll.bat
echo Set ROOTSAVE=off>>temp\DownloadQueues\d2xAll.bat
echo Set Option1=off>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[37]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[38]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[56]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[53]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[55]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[57]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS249[58]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[37]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[38]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[53]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[55]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[56]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[57]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo Set cIOS250[58]-d2x-v6=*>>temp\DownloadQueues\d2xAll.bat
echo :endofqueue>>temp\DownloadQueues\d2xAll.bat

support\sfk filter -spat temp\DownloadQueues\d2xAll.bat -rep _\x27_\x22_ -rep _\x3f_\x25_ -rep _"AdvNumber=0 "_"AdvNumber=0"_ -write -yes>nul

:skip
echo d2x cIOS beta MD5 Updater
echo -------------------------
echo.
echo Building d2x-beta cIOSs...
echo.
echo The 1st time ModMii runs the cIOSs will be invalid and open a text window
echo The 2nd time ModMii runs the cIOSs should be valid and not open a text window
echo.


echo @echo off>d2xAll-Downloader.bat
echo setlocal>>d2xAll-Downloader.bat
echo call support\ModMii.bat L d2xALL>>d2xAll-Downloader.bat

start /wait d2xAll-Downloader.bat

::del d2xAll-Downloader.bat>nul

if exist Support\settings.bat call Support\settings.bat
if "%Drive%"=="" set Drive=COPY_TO_SD

if exist d2xALL.md5 del d2xALL.md5>nul
support\fvc -c -a MD5 -r "%DRIVE%"\WAD\*.wad>>d2xALL.md5

if not exist Support\d2x-beta\d2x-beta.bat (echo Error: Missing Support\d2x-beta\d2x-beta.bat) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (exit)

echo Updating d2x MD5s...
call Support\d2x-beta\d2x-beta.bat

copy /y Support\d2x-beta\d2x-beta.bat Support\d2x-beta\d2x-beta.bak>nul

set number=0

:top
SET /a number=%number%+1
if /i "%number%" EQU "1" set cios=cIOS249[37]
if /i "%number%" EQU "2" set cios=cIOS250[37]
if /i "%number%" EQU "3" set cios=cIOS249[38]
if /i "%number%" EQU "4" set cios=cIOS250[38]
if /i "%number%" EQU "5" set cios=cIOS249[53]
if /i "%number%" EQU "6" set cios=cIOS250[53]
if /i "%number%" EQU "7" set cios=cIOS249[55]
if /i "%number%" EQU "8" set cios=cIOS250[55]
if /i "%number%" EQU "9" set cios=cIOS249[56]
if /i "%number%" EQU "10" set cios=cIOS250[56]
if /i "%number%" EQU "11" set cios=cIOS249[57]
if /i "%number%" EQU "12" set cios=cIOS250[57]
if /i "%number%" EQU "13" set cios=cIOS249[58]
if /i "%number%" EQU "14" set cios=cIOS250[58]

copy /y d2xALL.md5 temp\d2xALL.txt>nul

support\sfk filter -spat temp\d2xALL.txt -+"%cios%-d2x-v%d2x-beta-rev%.wad" -rep _" *"__ -write -yes>nul

set /p ciosmd5= <temp\d2xALL.txt

::echo %cios%-d2x-v%d2x-beta-rev% MD5 = %ciosmd5%

support\sfk filter -spat Support\d2x-beta\d2x-beta.bat -rep _"%cios%-d2x-v\x22 set md5="*_"%cios%-d2x-v\x22 set md5=%ciosmd5%"_ -write -yes>nul

::delete wad: it will be reconstructed and confirmed later

del "%DRIVE%\WAD\%cios%-d2x-v%d2x-beta-rev%.wad">nul


if "%number%" NEQ "14" goto:top

echo.
echo d2x-beta.bat Updated
echo.

del temp\d2xALL.txt>nul
del d2xALL.md5>nul

if exist "Support\More-cIOSs\d2x-v%d2x-beta-rev%" rd /s /q "Support\More-cIOSs\d2x-v%d2x-beta-rev%"
mkdir "Support\More-cIOSs\d2x-v%d2x-beta-rev%"
copy /y Support\d2x-beta\* "Support\More-cIOSs\d2x-v%d2x-beta-rev%\">nul

del "Support\More-cIOSs\d2x-v%d2x-beta-rev%\d2x-beta.bak">nul

if exist "d2x-v%d2x-beta-rev%.zip" del "d2x-v%d2x-beta-rev%.zip">nul

cd Support\More-cIOSs
..\7za a -t7z "..\..\d2x-v%d2x-beta-rev%.zip" "d2x-v%d2x-beta-rev%\*.bat"
..\7za a -t7z "..\..\d2x-v%d2x-beta-rev%.zip" "d2x-v%d2x-beta-rev%\*.app"

cd "d2x-v%d2x-beta-rev%"

if exist "*.xml" ..\..\7za a -t7z "..\..\..\d2x-v%d2x-beta-rev%.zip" "*.xml"
if exist "*.txt" ..\..\7za a -t7z "..\..\..\d2x-v%d2x-beta-rev%.zip" "*.txt"
cd ..\..\..

echo.
echo ModMii about to verify
echo If there are 0 errors this window will close
echo.

::call support\ModMii.bat L d2xALL
start /wait d2xAll-Downloader.bat
del d2xAll-Downloader.bat>nul

findStr /I /C:"14 file(s) downloaded succcessfully" temp\ModMii_CMD_LINE_Log.txt >nul
IF not ERRORLEVEL 1 exit
echo.
echo d2x-beta.bat not updated successfully
pause