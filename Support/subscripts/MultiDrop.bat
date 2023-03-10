@echo off
setlocal
title ModMii MultiDrop
::chdir /d "%~dp0"
pushd "%~dp0"
cls
cd ../..
if not exist ModMii.exe exit
if not exist temp\MultiDrop.txt exit
support\sfk echo [Red]ModMii MultiDrop
echo.
echo To interrupt sending dropped files to ModMii, close this window.
echo.
echo If you manually close ModMii but want to continue sending dropped files, enter N when asked to terminate batch job
echo.
::for /f %%a in (temp\MultiDrop.txt) do (set /a TotalItems+=1)

support\sfk echo [Blue]MultiDrop Queue
::Loop through the the following once for EACH line in *.txt, but respecting & ^ using !!
setlocal ENABLEDELAYEDEXPANSION
set /a TotalItems=0
for /F "tokens=*" %%A in (temp\MultiDrop.txt) do call :process "%%A"
goto:skip
:process
set command=%*
set "command=!command:^^=^!"
set "command=!command:~1,-1!"
set /a TotalItems=%TotalItems%+1
echo %TotalItems%: "!command!"
goto:EOF
:skip
::setlocal DISABLEDELAYEDEXPANSION

echo.
support\sfk echo [Blue]Sending ModMii Commands

::Loop through the the following once for EACH line in *.txt, but respecting & ^ using !!
::setlocal ENABLEDELAYEDEXPANSION
set /a Item=0
for /F "tokens=*" %%A in (temp\MultiDrop.txt) do call :processMultilist "%%A"
goto:quickskip
:processMultilist
set command=%*
set "command=!command:^^=^!"
set "command=!command:~1,-1!"
set /a Item=%Item%+1
echo %Item% of %TotalItems%: "!command!"
start /WAIT ModMii.exe "!command!"
goto:EOF
:quickskip
::setlocal DISABLEDELAYEDEXPANSION

echo.
support\sfk echo [Green]Finished, press any key to exit
pause>nul
exit