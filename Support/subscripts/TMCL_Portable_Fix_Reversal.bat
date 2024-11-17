@echo off
setlocal enabledelayedexpansion

:: Portable ModMii Installation fix and reversal
if /i "%Homedrive%" EQU "%ModMiiDrive%" goto :skipPortableFix

:: Delete specific files in the temp directory
set "tempDir=%homedrive%\ModMii\temp"
set "filesToDelete=TMCL.exe ASH.exe ICSharpCode.SharpZipLib.dll themewii.exe"

for %%f in (%filesToDelete%) do (
    if exist "!tempDir!\%%f" del "!tempDir!\%%f" >nul 2>&1
)

:: Check for and delete empty folders
call :deleteIfEmpty "%homedrive%\ModMii\temp"
call :deleteIfEmpty "%homedrive%\ModMii"

goto :skipPortableFix

:deleteIfEmpty
if exist "%~1" (
    dir /A /B "%~1" 2>nul | findstr "^" >nul || rd /s /q "%~1" >nul 2>&1
)
goto :eof

:skipPortableFix
:: Continue with the rest of your script here

endlocal
