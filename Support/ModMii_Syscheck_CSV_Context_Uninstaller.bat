@echo off
setlocal

chdir /d "%~dp0"
set PATH=%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%
chcp 437>nul

if not exist Support cd..

reg query HKCR\.csv>temp.txt

Support\sfk filter -quiet temp.txt ++Default -rep _*" "__ -write -yes

set /p key= <temp.txt
::set key=* to add to context for ALL files

del temp.txt>nul

> %TEMP%.\TEMP.REG ECHO Windows Registry Editor Version 5.00
>>%TEMP%.\TEMP.REG ECHO.
>>%TEMP%.\TEMP.REG ECHO [-HKEY_CLASSES_ROOT\%key%\shell\Analyze Syscheck Log using ModMii]
>>%TEMP%.\TEMP.REG ECHO.
::>>%TEMP%.\TEMP.REG ECHO [HKEY_CLASSES_ROOT\%key%\shell\Analyze Syscheck Log using ModMii\command]
::>>%TEMP%.\TEMP.REG ECHO @="\"%cd:\=\\\\%\\\\ModMii.exe\" %%1"
::>>%TEMP%.\TEMP.REG ECHO.


START /WAIT REGEDIT /S "%TEMP%\TEMP.REG"

DEL "%TEMP%\TEMP.REG">nul
