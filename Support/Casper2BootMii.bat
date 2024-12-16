@echo off
setlocal enabledelayedexpansion

:: Change to the script's directory
pushd "%~dp0"
cls

:: Check if support folder exists, if not, go up one directory
if not exist support cd..

:: Set PATH
set "PATH=%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%;%homedrive%\ModMii\temp"
chcp 437 >nul

:: Remove settings with '&' symbol and set default
if exist "Support\settings.bat" (
    support\sfk filter -spat "Support\settings.bat" -!"\x26" -write -yes >nul
    call "Support\settings.bat"
)

:: Set default drive if not specified
if not defined Drive set "Drive=COPY_TO_SD"

:: Check if drive folder exists or if it's a valid drive letter
if /i "%DRIVE%" equ "%cd%\COPY_TO_SD" (
    set "DRIVE=COPY_TO_SD"
) else if /i "%DRIVE:~1,1%" equ ":" (
    if not exist "%DRIVE:~0,2%" set "DRIVE=COPY_TO_SD"
)

:: Create DownloadQueues directory if it doesn't exist
if not exist "temp\DownloadQueues" mkdir "temp\DownloadQueues"

:: Create CasperBootMiiSD.bat file
(
    echo set AdvNumber=0
    echo if /i "%%GetAdvNumberOnly%%" equ "Y" goto:endofqueue
    echo set ROOTSAVE=off
    echo set Option1=off
    echo set casper=*
    echo set bootmiisd=*
    echo :endofqueue
) > "temp\DownloadQueues\CasperBootMiiSD.bat"

:: Filter CasperBootMiiSD.bat file
support\sfk filter -spat "temp\DownloadQueues\CasperBootMiiSD.bat" -rep _'_"_ -rep _?_%_ -rep _"AdvNumber=0 "_"AdvNumber=0"_ -write -yes >nul

:: Display information
echo Casper2BootMii
echo --------------
echo.
echo Downloading Casper and BootMii SD Card files using ModMii...
echo.
echo In addition to the above files you will need an exploit
echo saved to your SD Card. This will allow you to access
echo BootMii even on non-modified Wiis.
echo.

:: Run ModMii
ModMii.exe L CasperBootMiiSD

:: Check if download was successful
findstr /I /C:"2 file(s) downloaded successfully" "temp\ModMii_CMD_LINE_Log.txt" >nul
if errorlevel 1 (
    echo.
    echo Downloads Failed, press any key to exit
    pause >nul
    exit /b 1
)

:: Copy and rename files
copy /y "%DRIVE%\apps\Casper\boot.elf" "%DRIVE%\boot.elf" >nul
if exist "%Drive%\boot.dol" del "%Drive%\boot.dol" >nul
copy /y "%DRIVE%\bootmii\armboot.bin" "%DRIVE%\bootmii_ios.bin" >nul

:: Display success message
echo.
echo SUCCESS!
echo.
echo Press any key to close this window
pause >nul
