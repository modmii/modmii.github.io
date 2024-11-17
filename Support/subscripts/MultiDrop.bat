@echo off
setlocal enabledelayedexpansion
title ModMii MultiDrop
pushd "%~dp0"
cd ..\..
if not exist ModMii.exe (
    echo Error: ModMii.exe not found.
    goto :exit
)
if not exist temp\MultiDrop.txt (
    echo Error: temp\MultiDrop.txt not found.
    goto :exit
)

cls
support\sfk echo [Red]ModMii MultiDrop
echo.
echo To interrupt sending dropped files to ModMii, close this window.
echo.
echo If you manually close ModMii but want to continue sending dropped files, enter N when asked to terminate batch job
echo.

support\sfk echo [Blue]MultiDrop Queue
set /a TotalItems=0
for /F "usebackq delims=" %%A in ("temp\MultiDrop.txt") do (
    set "command=%%~A"
    set /a TotalItems+=1
    echo !TotalItems!: "!command!"
)

echo.
support\sfk echo [Blue]Sending ModMii Commands

set /a Item=0
for /F "usebackq delims=" %%A in ("temp\MultiDrop.txt") do (
    set "command=%%~A"
    set /a Item+=1
    echo !Item! of !TotalItems!: "!command!"
    start /WAIT ModMii.exe "!command!"
)

echo.
support\sfk echo [Green]Finished, press any key to exit
pause>nul

:exit
exit /b
