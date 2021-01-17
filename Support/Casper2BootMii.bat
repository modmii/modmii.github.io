@echo off
setlocal

chdir /d "%~dp0"
if not exist support cd..

set PATH=%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%;%homedrive%\ModMii\temp
chcp 437>nul

::remove setting path's with an & symbol and force default
if exist Support\settings.bat support\sfk filter -spat Support\settings.bat -!"\x26" -write -yes>nul
if exist Support\settings.bat call Support\settings.bat
if "%Drive%"=="" set Drive=COPY_TO_SD

if not exist temp\DownloadQueues mkdir temp\DownloadQueues

echo set AdvNumber=0 >temp\DownloadQueues\CasperBootMiiSD.bat
echo if /i '?GetAdvNumberOnly?' EQU 'Y' goto:endofqueue>>temp\DownloadQueues\CasperBootMiiSD.bat
echo Set ROOTSAVE=off>>temp\DownloadQueues\CasperBootMiiSD.bat
echo Set Option1=off>>temp\DownloadQueues\CasperBootMiiSD.bat
echo Set casper=*>>temp\DownloadQueues\CasperBootMiiSD.bat
echo Set bootmiisd=*>>temp\DownloadQueues\CasperBootMiiSD.bat
echo :endofqueue>>temp\DownloadQueues\CasperBootMiiSD.bat

support\sfk filter -spat temp\DownloadQueues\CasperBootMiiSD.bat -rep _\x27_\x22_ -rep _\x3f_\x25_ -rep _"AdvNumber=0 "_"AdvNumber=0"_ -write -yes>nul

echo Casper2BootMii
echo --------------
echo.
echo Downloading Casper and BootMii SD Card files using ModMii...
echo.
echo In addition to the above files you will need an exploit
echo saved to your SD Card. This will allow you to access
echo BootMii even on non-modified Wiis.
echo.


ModMii.exe L CasperBootMiiSD

findStr /I /C:"2 file(s) downloaded succcessfully" temp\ModMii_CMD_LINE_Log.txt >nul
IF not ERRORLEVEL 1 goto:success
echo.
echo Downloads Failed, press any key to exit
pause>nul
exit


:success

copy /y "%DRIVE%\apps\Casper\boot.elf" "%DRIVE%\boot.elf">nul
copy /y "%DRIVE%\bootmii\armboot.bin" "%DRIVE%\bootmii_ios.bin">nul

echo.
echo SUCCESS!
echo.

echo Press any key to close this window
pause>nul

