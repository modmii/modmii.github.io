@echo off
setlocal enabledelayedexpansion
set "Miep=!"
set "Quote=""
chcp 1252>nul

:Start
:: Reset variables
set "Counter=0"
set "AsciiCode=%var%"
set "DecimalCode_Puffer="
set "DecimalCode="
set "BinaryCode="
set "HexCode="

:: Remove leading/trailing spaces and add end marker
set "AsciiCode=!AsciiCode: =!"
set "AsciiCode=!AsciiCode!{p8UyY}"

:Conversion
set "DecimalCode_Puffer=!DecimalCode!"

:: Check if finished
if "!AsciiCode:~%Counter%,6!" == "{p8UyY}" goto :Finished

:: Convert current character
call :ConvertChar "!AsciiCode:~%Counter%,1!"
set /a "Counter+=1"
goto :Conversion

:Finished
:: Remove end marker and clean up AsciiCode
set "AsciiCode=!AsciiCode:{p8UyY}=!"
set "AsciiCode=!AsciiCode:?=!"
set "AsciiCode=%AsciiCode:!=%"

:: Output results
if exist temphex.txt del /f /q temphex.txt
echo !HexCode! 1>>temphex.txt
goto :end

:ConvertChar
:: Conversion logic for each character
set "char=%~1"
if "%char%"=="" set "HexCode=!HexCode!00," & set "DecimalCode=!DecimalCode!0," & set "BinaryCode=!BinaryCode!00000000," & exit /b
if "%char%"==" " set "HexCode=!HexCode!20," & set "DecimalCode=!DecimalCode!32," & set "BinaryCode=!BinaryCode!00100000," & exit /b
if "%char%"=="!" set "HexCode=!HexCode!21," & set "DecimalCode=!DecimalCode!33," & set "BinaryCode=!BinaryCode!00100001," & exit /b
:: Add more character conversions here...

:: Handle unprintable characters
echo Unprintable ascii character: %char%
exit /b

:end
