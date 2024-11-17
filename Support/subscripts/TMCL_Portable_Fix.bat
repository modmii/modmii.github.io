@echo off
setlocal enabledelayedexpansion

:: Portable ModMii Installation fix
set "ModMiiDir=%~dp0"
set "ModMiiDrive=%~d0"

if /i "%HOMEDRIVE%" EQU "%ModMiiDrive%" goto :skipPortableFix

set "ModMiiTempDir=%HOMEDRIVE%\ModMii\temp"
if not exist "%ModMiiTempDir%" mkdir "%ModMiiTempDir%"

set "files=TMCL.exe ASH.exe ICSharpCode.SharpZipLib.dll themewii.exe"
for %%f in (%files%) do (
    if exist "%ModMiiDir%\temp\%%f" (
        copy /y "%ModMiiDir%\temp\%%f" "%ModMiiTempDir%\%%f" >nul
    ) else (
        echo Warning: File %%f not found in %ModMiiDir%\temp
    )
)

cd /d "%HOMEDRIVE%\ModMii"

:skipPortableFix
echo ModMii installation fix complete.
