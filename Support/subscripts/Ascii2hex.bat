@echo off
(setlocal enabledelayedexpansion & set Miep=!)
set Quote="
chcp 1252>nul

:Start
:: Reset variables
set Counter=0
set AsciiCode=%var%
set DecimalCode_Puffer=
set DecimalCode=
set BinaryCode=
set HexCode=

:: Ask for hexadecimal code
::set /p AsciiCode=Ascii:   

:: Check the beginning and the end for parantheses
if "%AsciiCode:~0,1%" == "{" set Counter=1
set AsciiCode=!AsciiCode!  {p8UyY}


:Conversion

set DecimalCode_Puffer=!DecimalCode!

:: Check if finished
rem if "!AsciiCode:~%Counter%,9!" == "  {p8UyY}" goto :Finished
if not "!AsciiCode:~%Counter%,9!" == "  {p8UyY}" goto :continue

:Finished

echo !AsciiCode! | find "  {p8UyY}" >nul 2>nul && set AsciiCode=!AsciiCode:~0,-9!

set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=!AsciiCode:?!
set AsciiCode=%AsciiCode:!=%

if exist temphex.txt del /f /q temphex.txt
::echo Ascii: !AsciiCode! 1>Ascii2All.tmp
echo !HexCode! 1>>temphex.txt
::echo Dec:   !DecimalCode! 1>>Ascii2All.tmp
::echo Bin:   !BinaryCode! 1>>Ascii2All.tmp
::start notepad "Ascii2All.txt"
::echo Hex:   !HexCode!
::echo Dec:   !DecimalCode!
::echo Bin:   !BinaryCode!

::goto :Start
goto :end

:continue
:: Start of conversion from hex to ascii
if "!AsciiCode:~%Counter%,5!" == "{NUL}" set /a Counter=%Counter% + 5 & set HexCode=!HexCode!00,& set DecimalCode=!DecimalCode!0,& set BinaryCode=!BinaryCode!00000000,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!01,& set DecimalCode=!DecimalCode!1,& set BinaryCode=!BinaryCode!00000001,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!02,& set DecimalCode=!DecimalCode!2,& set BinaryCode=!BinaryCode!00000010,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!03,& set DecimalCode=!DecimalCode!3,& set BinaryCode=!BinaryCode!00000011,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!04,& set DecimalCode=!DecimalCode!4,& set BinaryCode=!BinaryCode!00000100,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!05,& set DecimalCode=!DecimalCode!5,& set BinaryCode=!BinaryCode!00000101,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!06,& set DecimalCode=!DecimalCode!6,& set BinaryCode=!BinaryCode!00000110,
if "!AsciiCode:~%Counter%,5!" == "{BEL}" set /a Counter=%Counter% + 5 & set HexCode=!HexCode!07,& set DecimalCode=!DecimalCode!7,& set BinaryCode=!BinaryCode!00000111,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!08,& set DecimalCode=!DecimalCode!8,& set BinaryCode=!BinaryCode!00001000,
if "!AsciiCode:~%Counter%,1!" == "	" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!09,& set DecimalCode=!DecimalCode!9,& set BinaryCode=!BinaryCode!00001001,
if "!AsciiCode:~%Counter%,4!" == "{LF}" set /a Counter=%Counter% + 4 & set HexCode=!HexCode!0a,& set DecimalCode=!DecimalCode!10,& set BinaryCode=!BinaryCode!00001010,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!0b,& set DecimalCode=!DecimalCode!11,& set BinaryCode=!BinaryCode!00001011,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!0c,& set DecimalCode=!DecimalCode!12,& set BinaryCode=!BinaryCode!00001100,
if "!AsciiCode:~%Counter%,4!" == "{CR}" set /a Counter=%Counter% + 4 & set HexCode=!HexCode!0d,& set DecimalCode=!DecimalCode!13,& set BinaryCode=!BinaryCode!00001101,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!0e,& set DecimalCode=!DecimalCode!14,& set BinaryCode=!BinaryCode!00001110,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!0f,& set DecimalCode=!DecimalCode!15,& set BinaryCode=!BinaryCode!00001111,

if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!10,& set DecimalCode=!DecimalCode!16,& set BinaryCode=!BinaryCode!00010000,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!11,& set DecimalCode=!DecimalCode!17,& set BinaryCode=!BinaryCode!00010001,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!12,& set DecimalCode=!DecimalCode!18,& set BinaryCode=!BinaryCode!00010010,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!13,& set DecimalCode=!DecimalCode!19,& set BinaryCode=!BinaryCode!00010011,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!14,& set DecimalCode=!DecimalCode!20,& set BinaryCode=!BinaryCode!00010100,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!15,& set DecimalCode=!DecimalCode!21,& set BinaryCode=!BinaryCode!00010101,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!16,& set DecimalCode=!DecimalCode!22,& set BinaryCode=!BinaryCode!00010110,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!17,& set DecimalCode=!DecimalCode!23,& set BinaryCode=!BinaryCode!00010111,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!18,& set DecimalCode=!DecimalCode!24,& set BinaryCode=!BinaryCode!00011000,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!19,& set DecimalCode=!DecimalCode!25,& set BinaryCode=!BinaryCode!00011001,
if "!AsciiCode:~%Counter%,5!" == "{SUB}" set /a Counter=%Counter% + 5 & set HexCode=!HexCode!1a,& set DecimalCode=!DecimalCode!26,& set BinaryCode=!BinaryCode!00011010,
if "!AsciiCode:~%Counter%,5!" == "{ESC}" set /a Counter=%Counter% + 5 & set HexCode=!HexCode!1b,& set DecimalCode=!DecimalCode!27,& set BinaryCode=!BinaryCode!00011011,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!1c,& set DecimalCode=!DecimalCode!28,& set BinaryCode=!BinaryCode!00011100,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!1d,& set DecimalCode=!DecimalCode!29,& set BinaryCode=!BinaryCode!00011101,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!1e,& set DecimalCode=!DecimalCode!30,& set BinaryCode=!BinaryCode!00011110,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!1f,& set DecimalCode=!DecimalCode!31,& set BinaryCode=!BinaryCode!00011111,

if "!AsciiCode:~%Counter%,1!" == " " set /a Counter=%Counter% + 1 & set HexCode=!HexCode!20,& set DecimalCode=!DecimalCode!32,& set BinaryCode=!BinaryCode!00100000,
if "!AsciiCode:~%Counter%,1!" == "!Miep!" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!21,& set DecimalCode=!DecimalCode!33,& set BinaryCode=!BinaryCode!00100001,
if "!AsciiCode:~%Counter%,1!" == "!Quote!" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!22,& set DecimalCode=!DecimalCode!34,& set BinaryCode=!BinaryCode!00100010,
if "!AsciiCode:~%Counter%,1!" == "#" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!23,& set DecimalCode=!DecimalCode!35,& set BinaryCode=!BinaryCode!00100011,
if "!AsciiCode:~%Counter%,1!" == "$" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!24,& set DecimalCode=!DecimalCode!36,& set BinaryCode=!BinaryCode!00100100,
if "!AsciiCode:~%Counter%,1!" == "%%" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!25,& set DecimalCode=!DecimalCode!37,& set BinaryCode=!BinaryCode!00100101,
if "!AsciiCode:~%Counter%,1!" == "&" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!26,&& set DecimalCode=!DecimalCode!38,& set BinaryCode=!BinaryCode!00100110,
if "!AsciiCode:~%Counter%,1!" == "'" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!27,& set DecimalCode=!DecimalCode!39,& set BinaryCode=!BinaryCode!00100111,
if "!AsciiCode:~%Counter%,1!" == "(" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!28,& set DecimalCode=!DecimalCode!40,& set BinaryCode=!BinaryCode!00101000,
if "!AsciiCode:~%Counter%,1!" == ")" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!29,& set DecimalCode=!DecimalCode!41,& set BinaryCode=!BinaryCode!00101001,
if "!AsciiCode:~%Counter%,1!" == "*" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!2a,& set DecimalCode=!DecimalCode!42,& set BinaryCode=!BinaryCode!00101010,
if "!AsciiCode:~%Counter%,1!" == "+" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!2b,& set DecimalCode=!DecimalCode!43,& set BinaryCode=!BinaryCode!00101011,
if "!AsciiCode:~%Counter%,1!" == "," set /a Counter=%Counter% + 1 & set HexCode=!HexCode!2c,& set DecimalCode=!DecimalCode!44,& set BinaryCode=!BinaryCode!00101100,
if "!AsciiCode:~%Counter%,1!" == "-" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!2d,& set DecimalCode=!DecimalCode!45,& set BinaryCode=!BinaryCode!00101101,
if "!AsciiCode:~%Counter%,1!" == "." set /a Counter=%Counter% + 1 & set HexCode=!HexCode!2e,& set DecimalCode=!DecimalCode!46,& set BinaryCode=!BinaryCode!00101110,
if "!AsciiCode:~%Counter%,1!" == "/" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!2f,& set DecimalCode=!DecimalCode!47,& set BinaryCode=!BinaryCode!00101111,

if "!AsciiCode:~%Counter%,1!" == "0" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!30,& set DecimalCode=!DecimalCode!48,& set BinaryCode=!BinaryCode!00110000,
if "!AsciiCode:~%Counter%,1!" == "1" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!31,& set DecimalCode=!DecimalCode!49,& set BinaryCode=!BinaryCode!00110001,
if "!AsciiCode:~%Counter%,1!" == "2" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!32,& set DecimalCode=!DecimalCode!50,& set BinaryCode=!BinaryCode!00110010,
if "!AsciiCode:~%Counter%,1!" == "3" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!33,& set DecimalCode=!DecimalCode!51,& set BinaryCode=!BinaryCode!00110011,
if "!AsciiCode:~%Counter%,1!" == "4" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!34,& set DecimalCode=!DecimalCode!52,& set BinaryCode=!BinaryCode!00110100,
if "!AsciiCode:~%Counter%,1!" == "5" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!35,& set DecimalCode=!DecimalCode!53,& set BinaryCode=!BinaryCode!00110101,
if "!AsciiCode:~%Counter%,1!" == "6" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!36,& set DecimalCode=!DecimalCode!54,& set BinaryCode=!BinaryCode!00110110,
if "!AsciiCode:~%Counter%,1!" == "7" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!37,& set DecimalCode=!DecimalCode!55,& set BinaryCode=!BinaryCode!00110111,
if "!AsciiCode:~%Counter%,1!" == "8" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!38,& set DecimalCode=!DecimalCode!56,& set BinaryCode=!BinaryCode!00111000,
if "!AsciiCode:~%Counter%,1!" == "9" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!39,& set DecimalCode=!DecimalCode!57,& set BinaryCode=!BinaryCode!00111001,
if "!AsciiCode:~%Counter%,1!" == ":" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!3a,& set DecimalCode=!DecimalCode!58,& set BinaryCode=!BinaryCode!00111010,
if "!AsciiCode:~%Counter%,1!" == ";" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!3b,& set DecimalCode=!DecimalCode!59,& set BinaryCode=!BinaryCode!00111011,
if "!AsciiCode:~%Counter%,1!" == "^<" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!3c,& set DecimalCode=!DecimalCode!60,& set BinaryCode=!BinaryCode!00111100,
if "!AsciiCode:~%Counter%,1!" == "=" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!3d,& set DecimalCode=!DecimalCode!61,& set BinaryCode=!BinaryCode!00111101,
if "!AsciiCode:~%Counter%,1!" == "^>" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!3e,& set DecimalCode=!DecimalCode!62,& set BinaryCode=!BinaryCode!00111110,
if "!AsciiCode:~%Counter%,1!" == "?" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!3f,& set DecimalCode=!DecimalCode!63,& set BinaryCode=!BinaryCode!00111111,

if "!AsciiCode:~%Counter%,1!" == "@" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!40,& set DecimalCode=!DecimalCode!64,& set BinaryCode=!BinaryCode!01000000,
if "!AsciiCode:~%Counter%,1!" == "A" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!41,& set DecimalCode=!DecimalCode!65,& set BinaryCode=!BinaryCode!01000001,
if "!AsciiCode:~%Counter%,1!" == "B" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!42,& set DecimalCode=!DecimalCode!66,& set BinaryCode=!BinaryCode!01000010,
if "!AsciiCode:~%Counter%,1!" == "C" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!43,& set DecimalCode=!DecimalCode!67,& set BinaryCode=!BinaryCode!01000011,
if "!AsciiCode:~%Counter%,1!" == "D" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!44,& set DecimalCode=!DecimalCode!68,& set BinaryCode=!BinaryCode!01000100,
if "!AsciiCode:~%Counter%,1!" == "E" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!45,& set DecimalCode=!DecimalCode!69,& set BinaryCode=!BinaryCode!01000101,
if "!AsciiCode:~%Counter%,1!" == "F" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!46,& set DecimalCode=!DecimalCode!70,& set BinaryCode=!BinaryCode!01000110,
if "!AsciiCode:~%Counter%,1!" == "G" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!47,& set DecimalCode=!DecimalCode!71,& set BinaryCode=!BinaryCode!01000111,
if "!AsciiCode:~%Counter%,1!" == "H" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!48,& set DecimalCode=!DecimalCode!72,& set BinaryCode=!BinaryCode!01001000,
if "!AsciiCode:~%Counter%,1!" == "I" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!49,& set DecimalCode=!DecimalCode!73,& set BinaryCode=!BinaryCode!01001001,
if "!AsciiCode:~%Counter%,1!" == "J" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!4a,& set DecimalCode=!DecimalCode!74,& set BinaryCode=!BinaryCode!01001010,
if "!AsciiCode:~%Counter%,1!" == "K" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!4b,& set DecimalCode=!DecimalCode!75,& set BinaryCode=!BinaryCode!01001011,
if "!AsciiCode:~%Counter%,1!" == "L" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!4c,& set DecimalCode=!DecimalCode!76,& set BinaryCode=!BinaryCode!01001100,
if "!AsciiCode:~%Counter%,1!" == "M" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!4d,& set DecimalCode=!DecimalCode!77,& set BinaryCode=!BinaryCode!01001101,
if "!AsciiCode:~%Counter%,1!" == "N" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!4e,& set DecimalCode=!DecimalCode!78,& set BinaryCode=!BinaryCode!01001110,
if "!AsciiCode:~%Counter%,1!" == "O" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!4f,& set DecimalCode=!DecimalCode!79,& set BinaryCode=!BinaryCode!01001111,

if "!AsciiCode:~%Counter%,1!" == "P" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!50,& set DecimalCode=!DecimalCode!80,& set BinaryCode=!BinaryCode!01010000,
if "!AsciiCode:~%Counter%,1!" == "Q" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!51,& set DecimalCode=!DecimalCode!81,& set BinaryCode=!BinaryCode!01010001,
if "!AsciiCode:~%Counter%,1!" == "R" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!52,& set DecimalCode=!DecimalCode!82,& set BinaryCode=!BinaryCode!01010010,
if "!AsciiCode:~%Counter%,1!" == "S" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!53,& set DecimalCode=!DecimalCode!83,& set BinaryCode=!BinaryCode!01010011,
if "!AsciiCode:~%Counter%,1!" == "T" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!54,& set DecimalCode=!DecimalCode!84,& set BinaryCode=!BinaryCode!01010100,
if "!AsciiCode:~%Counter%,1!" == "U" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!55,& set DecimalCode=!DecimalCode!85,& set BinaryCode=!BinaryCode!01010101,
if "!AsciiCode:~%Counter%,1!" == "V" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!56,& set DecimalCode=!DecimalCode!86,& set BinaryCode=!BinaryCode!01010110,
if "!AsciiCode:~%Counter%,1!" == "W" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!57,& set DecimalCode=!DecimalCode!87,& set BinaryCode=!BinaryCode!01010111,
if "!AsciiCode:~%Counter%,1!" == "X" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!58,& set DecimalCode=!DecimalCode!88,& set BinaryCode=!BinaryCode!01011000,
if "!AsciiCode:~%Counter%,1!" == "Y" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!59,& set DecimalCode=!DecimalCode!89,& set BinaryCode=!BinaryCode!01011001,
if "!AsciiCode:~%Counter%,1!" == "Z" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!5a,& set DecimalCode=!DecimalCode!90,& set BinaryCode=!BinaryCode!01011010,
if "!AsciiCode:~%Counter%,1!" == "[" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!5b,& set DecimalCode=!DecimalCode!91,& set BinaryCode=!BinaryCode!01011011,
if "!AsciiCode:~%Counter%,1!" == "\" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!5c,& set DecimalCode=!DecimalCode!92,& set BinaryCode=!BinaryCode!01011100,
if "!AsciiCode:~%Counter%,1!" == "]" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!5d,& set DecimalCode=!DecimalCode!93,& set BinaryCode=!BinaryCode!01011101,
if "!AsciiCode:~%Counter%,1!" == "^" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!5e,& set DecimalCode=!DecimalCode!94,& set BinaryCode=!BinaryCode!01011110,
if "!AsciiCode:~%Counter%,1!" == "_" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!5f,& set DecimalCode=!DecimalCode!95,& set BinaryCode=!BinaryCode!01011111,

if "!AsciiCode:~%Counter%,1!" == "`" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!60,& set DecimalCode=!DecimalCode!96,& set BinaryCode=!BinaryCode!01100000,
if "!AsciiCode:~%Counter%,1!" == "a" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!61,& set DecimalCode=!DecimalCode!97,& set BinaryCode=!BinaryCode!01100001,
if "!AsciiCode:~%Counter%,1!" == "b" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!62,& set DecimalCode=!DecimalCode!98,& set BinaryCode=!BinaryCode!01100010,
if "!AsciiCode:~%Counter%,1!" == "c" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!63,& set DecimalCode=!DecimalCode!99,& set BinaryCode=!BinaryCode!01100011,
if "!AsciiCode:~%Counter%,1!" == "d" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!64,& set DecimalCode=!DecimalCode!100,& set BinaryCode=!BinaryCode!01100100,
if "!AsciiCode:~%Counter%,1!" == "e" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!65,& set DecimalCode=!DecimalCode!101,& set BinaryCode=!BinaryCode!01100101,
if "!AsciiCode:~%Counter%,1!" == "f" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!66,& set DecimalCode=!DecimalCode!102,& set BinaryCode=!BinaryCode!01100110,
if "!AsciiCode:~%Counter%,1!" == "g" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!67,& set DecimalCode=!DecimalCode!103,& set BinaryCode=!BinaryCode!01100111,
if "!AsciiCode:~%Counter%,1!" == "h" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!68,& set DecimalCode=!DecimalCode!104,& set BinaryCode=!BinaryCode!01101000,
if "!AsciiCode:~%Counter%,1!" == "i" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!69,& set DecimalCode=!DecimalCode!105,& set BinaryCode=!BinaryCode!01101001,
if "!AsciiCode:~%Counter%,1!" == "j" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!6a,& set DecimalCode=!DecimalCode!106,& set BinaryCode=!BinaryCode!01101010,
if "!AsciiCode:~%Counter%,1!" == "k" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!6b,& set DecimalCode=!DecimalCode!107,& set BinaryCode=!BinaryCode!01101011,
if "!AsciiCode:~%Counter%,1!" == "l" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!6c,& set DecimalCode=!DecimalCode!108,& set BinaryCode=!BinaryCode!01101100,
if "!AsciiCode:~%Counter%,1!" == "m" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!6d,& set DecimalCode=!DecimalCode!109,& set BinaryCode=!BinaryCode!01101101,
if "!AsciiCode:~%Counter%,1!" == "n" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!6e,& set DecimalCode=!DecimalCode!110,& set BinaryCode=!BinaryCode!01101110,
if "!AsciiCode:~%Counter%,1!" == "o" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!6f,& set DecimalCode=!DecimalCode!111,& set BinaryCode=!BinaryCode!01101111,

if "!AsciiCode:~%Counter%,1!" == "p" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!70,& set DecimalCode=!DecimalCode!112,& set BinaryCode=!BinaryCode!01110000,
if "!AsciiCode:~%Counter%,1!" == "q" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!71,& set DecimalCode=!DecimalCode!113,& set BinaryCode=!BinaryCode!01110001,
if "!AsciiCode:~%Counter%,1!" == "r" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!72,& set DecimalCode=!DecimalCode!114,& set BinaryCode=!BinaryCode!01110010,
if "!AsciiCode:~%Counter%,1!" == "s" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!73,& set DecimalCode=!DecimalCode!115,& set BinaryCode=!BinaryCode!01110011,
if "!AsciiCode:~%Counter%,1!" == "t" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!74,& set DecimalCode=!DecimalCode!116,& set BinaryCode=!BinaryCode!01110100,
if "!AsciiCode:~%Counter%,1!" == "u" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!75,& set DecimalCode=!DecimalCode!117,& set BinaryCode=!BinaryCode!01110101,
if "!AsciiCode:~%Counter%,1!" == "v" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!76,& set DecimalCode=!DecimalCode!118,& set BinaryCode=!BinaryCode!01110110,
if "!AsciiCode:~%Counter%,1!" == "w" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!77,& set DecimalCode=!DecimalCode!119,& set BinaryCode=!BinaryCode!01110111,
if "!AsciiCode:~%Counter%,1!" == "x" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!78,& set DecimalCode=!DecimalCode!120,& set BinaryCode=!BinaryCode!01111000,
if "!AsciiCode:~%Counter%,1!" == "y" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!79,& set DecimalCode=!DecimalCode!121,& set BinaryCode=!BinaryCode!01111001,
if "!AsciiCode:~%Counter%,1!" == "z" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!7a,& set DecimalCode=!DecimalCode!122,& set BinaryCode=!BinaryCode!01111010,
if "!AsciiCode:~%Counter%,1!" == "{" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!7b,& set DecimalCode=!DecimalCode!123,& set BinaryCode=!BinaryCode!01111011,
if "!AsciiCode:~%Counter%,1!" == "|" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!7c,& set DecimalCode=!DecimalCode!124,& set BinaryCode=!BinaryCode!01111100,
if "!AsciiCode:~%Counter%,1!" == "}" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!7d,& set DecimalCode=!DecimalCode!125,& set BinaryCode=!BinaryCode!01111101,
if "!AsciiCode:~%Counter%,1!" == "~" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!7e,& set DecimalCode=!DecimalCode!126,& set BinaryCode=!BinaryCode!01111110,
if "!AsciiCode:~%Counter%,1!" == "∞" start msg %username% Unprintable ascii character: ∞ & REM 127

if "!AsciiCode:~%Counter%,1!" == "±" start msg %username% Unprintable ascii character: ± & REM 128
if "!AsciiCode:~%Counter%,1!" == "≤" start msg %username% Unprintable ascii character: ≤ & REM 129
if "!AsciiCode:~%Counter%,1!" == "ë" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!82,& set DecimalCode=!DecimalCode!130,& set BinaryCode=!BinaryCode!10000010,
if "!AsciiCode:~%Counter%,1!" == "ü" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!83,& set DecimalCode=!DecimalCode!131,& set BinaryCode=!BinaryCode!10000011,
if "!AsciiCode:~%Counter%,1!" == "ì" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!84,& set DecimalCode=!DecimalCode!132,& set BinaryCode=!BinaryCode!10000100,
if "!AsciiCode:~%Counter%,1!" == "≥" start msg %username% Unprintable ascii character: ≥ & REM 133
if "!AsciiCode:~%Counter%,1!" == "≈" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!86,& set DecimalCode=!DecimalCode!134,& set BinaryCode=!BinaryCode!10000110,
if "!AsciiCode:~%Counter%,1!" == "Œ" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!87,& set DecimalCode=!DecimalCode!135,& set BinaryCode=!BinaryCode!10000111,
if "!AsciiCode:~%Counter%,1!" == "¥" start msg %username% Unprintable ascii character: ¥ & REM 136
if "!AsciiCode:~%Counter%,1!" == "π" start msg %username% Unprintable ascii character: π & REM 137
if "!AsciiCode:~%Counter%,1!" == "∫" start msg %username% Unprintable ascii character: ∫ & REM 138
if "!AsciiCode:~%Counter%,1!" == "ª" start msg %username% Unprintable ascii character: ª & REM 139
if "!AsciiCode:~%Counter%,1!" == "º" start msg %username% Unprintable ascii character: º & REM 140
if "!AsciiCode:~%Counter%,1!" == "ø" start msg %username% Unprintable ascii character: ø & REM 141
if "!AsciiCode:~%Counter%,1!" == "¿" start msg %username% Unprintable ascii character: ¿ & REM 142
if "!AsciiCode:~%Counter%,1!" == "¡" start msg %username% Unprintable ascii character: ¡ & REM 143

if "!AsciiCode:~%Counter%,1!" == "¬" start msg %username% Unprintable ascii character: ¬ & REM 144
if "!AsciiCode:~%Counter%,1!" == "√" start msg %username% Unprintable ascii character: √ & REM 145
if "!AsciiCode:~%Counter%,1!" == "ƒ" start msg %username% Unprintable ascii character: ƒ & REM 146
REM Missing Ascii Code 147 - relating to 134
if "!AsciiCode:~%Counter%,1!" == "»" start msg %username% Unprintable ascii character: » & REM 148
if "!AsciiCode:~%Counter%,1!" == "…" start msg %username% Unprintable ascii character: … & REM 149
if "!AsciiCode:~%Counter%,1!" == " " start msg %username% Unprintable ascii character:   & REM 150
if "!AsciiCode:~%Counter%,1!" == "À" start msg %username% Unprintable ascii character: À & REM 151
if "!AsciiCode:~%Counter%,1!" == "Ã" start msg %username% Unprintable ascii character: Ã & REM 152
if "!AsciiCode:~%Counter%,1!" == "Õ" start msg %username% Unprintable ascii character: Õ & REM 153
REM Missing Ascii Code 154 - relating to 135
if "!AsciiCode:~%Counter%,1!" == "Ÿ" start msg %username% Unprintable ascii character: Ÿ & REM 155
if "!AsciiCode:~%Counter%,1!" == "⁄" start msg %username% Unprintable ascii character: ⁄ & REM 156
if "!AsciiCode:~%Counter%,1!" == "€" start msg %username% Unprintable ascii character: € & REM 157
if "!AsciiCode:~%Counter%,1!" == "‹" start msg %username% Unprintable ascii character: ‹ & REM 158
if "!AsciiCode:~%Counter%,1!" == "ﬂ" start msg %username% Unprintable ascii character: ﬂ & REM 159

if "!AsciiCode:~%Counter%,1!" == "ˇ" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!a0,& set DecimalCode=!DecimalCode!160,& set BinaryCode=!BinaryCode!10100000,
if "!AsciiCode:~%Counter%,1!" == "≠" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!a1,& set DecimalCode=!DecimalCode!161,& set BinaryCode=!BinaryCode!10100001,
if "!AsciiCode:~%Counter%,1!" == "Ω" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!a2,& set DecimalCode=!DecimalCode!162,& set BinaryCode=!BinaryCode!10100010,
if "!AsciiCode:~%Counter%,1!" == "ú" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!a3,& set DecimalCode=!DecimalCode!163,& set BinaryCode=!BinaryCode!10100011,
if "!AsciiCode:~%Counter%,1!" == "œ" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!a4,& set DecimalCode=!DecimalCode!164,& set BinaryCode=!BinaryCode!10100100,
if "!AsciiCode:~%Counter%,1!" == "æ" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!a5,& set DecimalCode=!DecimalCode!165,& set BinaryCode=!BinaryCode!10100101,
if "!AsciiCode:~%Counter%,1!" == "›" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!a6,& set DecimalCode=!DecimalCode!166,& set BinaryCode=!BinaryCode!10100110,
if "!AsciiCode:~%Counter%,1!" == "ı" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!a7,& set DecimalCode=!DecimalCode!167,& set BinaryCode=!BinaryCode!10100111,
if "!AsciiCode:~%Counter%,1!" == "˘" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!a8,& set DecimalCode=!DecimalCode!168,& set BinaryCode=!BinaryCode!10101000,
if "!AsciiCode:~%Counter%,1!" == "∏" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!a9,& set DecimalCode=!DecimalCode!169,& set BinaryCode=!BinaryCode!10101001,
if "!AsciiCode:~%Counter%,1!" == "¶" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!aa,& set DecimalCode=!DecimalCode!170,& set BinaryCode=!BinaryCode!10101010,
if "!AsciiCode:~%Counter%,1!" == "Æ" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ab,& set DecimalCode=!DecimalCode!171,& set BinaryCode=!BinaryCode!10101011,
if "!AsciiCode:~%Counter%,1!" == "™" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ac,& set DecimalCode=!DecimalCode!172,& set BinaryCode=!BinaryCode!10101100,
if "!AsciiCode:~%Counter%,1!" == "" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ad,& set DecimalCode=!DecimalCode!173,& set BinaryCode=!BinaryCode!10101101,
if "!AsciiCode:~%Counter%,1!" == "©" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ae,& set DecimalCode=!DecimalCode!174,& set BinaryCode=!BinaryCode!10101110,
if "!AsciiCode:~%Counter%,1!" == "Ó" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!af,& set DecimalCode=!DecimalCode!175,& set BinaryCode=!BinaryCode!10101111,

if "!AsciiCode:~%Counter%,1!" == "¯" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!b0,& set DecimalCode=!DecimalCode!176,& set BinaryCode=!BinaryCode!10110000,
if "!AsciiCode:~%Counter%,1!" == "Ò" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!b1,& set DecimalCode=!DecimalCode!177,& set BinaryCode=!BinaryCode!10110001,
if "!AsciiCode:~%Counter%,1!" == "˝" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!b2,& set DecimalCode=!DecimalCode!178,& set BinaryCode=!BinaryCode!10110010,
if "!AsciiCode:~%Counter%,1!" == "¸" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!b3,& set DecimalCode=!DecimalCode!179,& set BinaryCode=!BinaryCode!10110011,
if "!AsciiCode:~%Counter%,1!" == "Ô" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!b4,& set DecimalCode=!DecimalCode!180,& set BinaryCode=!BinaryCode!10110100,
if "!AsciiCode:~%Counter%,1!" == "Ê" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!b5,& set DecimalCode=!DecimalCode!181,& set BinaryCode=!BinaryCode!10110101,
if "!AsciiCode:~%Counter%,1!" == "Ù" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!b6,& set DecimalCode=!DecimalCode!182,& set BinaryCode=!BinaryCode!10110110,
if "!AsciiCode:~%Counter%,1!" == "˙" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!b7,& set DecimalCode=!DecimalCode!183,& set BinaryCode=!BinaryCode!10110111,
if "!AsciiCode:~%Counter%,1!" == "˜" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!b8,& set DecimalCode=!DecimalCode!184,& set BinaryCode=!BinaryCode!10111000,
if "!AsciiCode:~%Counter%,1!" == "˚" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!b9,& set DecimalCode=!DecimalCode!185,& set BinaryCode=!BinaryCode!10111001,
if "!AsciiCode:~%Counter%,1!" == "ß" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ba,& set DecimalCode=!DecimalCode!186,& set BinaryCode=!BinaryCode!10111010,
if "!AsciiCode:~%Counter%,1!" == "Ø" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!bb,& set DecimalCode=!DecimalCode!187,& set BinaryCode=!BinaryCode!10111011,
if "!AsciiCode:~%Counter%,1!" == "¨" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!bc,& set DecimalCode=!DecimalCode!188,& set BinaryCode=!BinaryCode!10111100,
if "!AsciiCode:~%Counter%,1!" == "´" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!bd,& set DecimalCode=!DecimalCode!189,& set BinaryCode=!BinaryCode!10111101,
if "!AsciiCode:~%Counter%,1!" == "Û" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!be,& set DecimalCode=!DecimalCode!190,& set BinaryCode=!BinaryCode!10111110,
if "!AsciiCode:~%Counter%,1!" == "®" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!bf,& set DecimalCode=!DecimalCode!191,& set BinaryCode=!BinaryCode!10111111,

if "!AsciiCode:~%Counter%,1!" == "∑" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!c0,& set DecimalCode=!DecimalCode!192,& set BinaryCode=!BinaryCode!11000000,
if "!AsciiCode:~%Counter%,1!" == "µ" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!c1,& set DecimalCode=!DecimalCode!193,& set BinaryCode=!BinaryCode!11000001,
if "!AsciiCode:~%Counter%,1!" == "∂" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!c2,& set DecimalCode=!DecimalCode!194,& set BinaryCode=!BinaryCode!11000010,
if "!AsciiCode:~%Counter%,1!" == "«" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!c3,& set DecimalCode=!DecimalCode!195,& set BinaryCode=!BinaryCode!11000011,
if "!AsciiCode:~%Counter%,1!" == "é" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!c4,& set DecimalCode=!DecimalCode!196,& set BinaryCode=!BinaryCode!11000100,
if "!AsciiCode:~%Counter%,1!" == "è" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!c5,& set DecimalCode=!DecimalCode!197,& set BinaryCode=!BinaryCode!11000101,
if "!AsciiCode:~%Counter%,1!" == "í" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!c6,& set DecimalCode=!DecimalCode!198,& set BinaryCode=!BinaryCode!11000110,
if "!AsciiCode:~%Counter%,1!" == "Ä" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!c7,& set DecimalCode=!DecimalCode!199,& set BinaryCode=!BinaryCode!11000111,
if "!AsciiCode:~%Counter%,1!" == "‘" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!c8,& set DecimalCode=!DecimalCode!200,& set BinaryCode=!BinaryCode!11001000,
if "!AsciiCode:~%Counter%,1!" == "ê" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!c9,& set DecimalCode=!DecimalCode!201,& set BinaryCode=!BinaryCode!11001001,
if "!AsciiCode:~%Counter%,1!" == "“" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ca,& set DecimalCode=!DecimalCode!202,& set BinaryCode=!BinaryCode!11001010,
if "!AsciiCode:~%Counter%,1!" == "”" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!cb,& set DecimalCode=!DecimalCode!203,& set BinaryCode=!BinaryCode!11001011,
if "!AsciiCode:~%Counter%,1!" == "ﬁ" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!cc,& set DecimalCode=!DecimalCode!204,& set BinaryCode=!BinaryCode!11001100,
if "!AsciiCode:~%Counter%,1!" == "÷" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!cd,& set DecimalCode=!DecimalCode!205,& set BinaryCode=!BinaryCode!11001101,
if "!AsciiCode:~%Counter%,1!" == "◊" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ce,& set DecimalCode=!DecimalCode!206,& set BinaryCode=!BinaryCode!11001110,
if "!AsciiCode:~%Counter%,1!" == "ÿ" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!cf,& set DecimalCode=!DecimalCode!207,& set BinaryCode=!BinaryCode!11001111,

if "!AsciiCode:~%Counter%,1!" == "—" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!d0,& set DecimalCode=!DecimalCode!208,& set BinaryCode=!BinaryCode!11010000,
if "!AsciiCode:~%Counter%,1!" == "•" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!d1,& set DecimalCode=!DecimalCode!209,& set BinaryCode=!BinaryCode!11010001,
if "!AsciiCode:~%Counter%,1!" == "„" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!d2,& set DecimalCode=!DecimalCode!210,& set BinaryCode=!BinaryCode!11010010,
if "!AsciiCode:~%Counter%,1!" == "‡" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!d3,& set DecimalCode=!DecimalCode!211,& set BinaryCode=!BinaryCode!11010011,
if "!AsciiCode:~%Counter%,1!" == "‚" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!d4,& set DecimalCode=!DecimalCode!212,& set BinaryCode=!BinaryCode!11010100,
if "!AsciiCode:~%Counter%,1!" == "Â" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!d5,& set DecimalCode=!DecimalCode!213,& set BinaryCode=!BinaryCode!11010101,
if "!AsciiCode:~%Counter%,1!" == "ô" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!d6,& set DecimalCode=!DecimalCode!214,& set BinaryCode=!BinaryCode!11010110,
if "!AsciiCode:~%Counter%,1!" == "û" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!d7,& set DecimalCode=!DecimalCode!215,& set BinaryCode=!BinaryCode!11010111,
if "!AsciiCode:~%Counter%,1!" == "ù" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!d8,& set DecimalCode=!DecimalCode!216,& set BinaryCode=!BinaryCode!11011000,
if "!AsciiCode:~%Counter%,1!" == "Î" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!d9,& set DecimalCode=!DecimalCode!217,& set BinaryCode=!BinaryCode!11011001,
if "!AsciiCode:~%Counter%,1!" == "È" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!da,& set DecimalCode=!DecimalCode!218,& set BinaryCode=!BinaryCode!11011010,
if "!AsciiCode:~%Counter%,1!" == "Í" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!db,& set DecimalCode=!DecimalCode!219,& set BinaryCode=!BinaryCode!11011011,
if "!AsciiCode:~%Counter%,1!" == "ö" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!dc,& set DecimalCode=!DecimalCode!220,& set BinaryCode=!BinaryCode!11011100,
if "!AsciiCode:~%Counter%,1!" == "Ì" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!dd,& set DecimalCode=!DecimalCode!221,& set BinaryCode=!BinaryCode!11011101,
if "!AsciiCode:~%Counter%,1!" == "Ë" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!de,& set DecimalCode=!DecimalCode!222,& set BinaryCode=!BinaryCode!11011110,
if "!AsciiCode:~%Counter%,1!" == "·" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!df,& set DecimalCode=!DecimalCode!223,& set BinaryCode=!BinaryCode!11011111,

if "!AsciiCode:~%Counter%,1!" == "Ö" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!e0,& set DecimalCode=!DecimalCode!224,& set BinaryCode=!BinaryCode!11100000,
if "!AsciiCode:~%Counter%,1!" == "˛" start msg %username% Unprintable ascii character: ˛ & REM 225
if "!AsciiCode:~%Counter%,1!" == "É" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!e2,& set DecimalCode=!DecimalCode!226,& set BinaryCode=!BinaryCode!11100010,
if "!AsciiCode:~%Counter%,1!" == "∆" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!e3,& set DecimalCode=!DecimalCode!227,& set BinaryCode=!BinaryCode!11100011,
if "!AsciiCode:~%Counter%,1!" == "Ñ" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!e4,& set DecimalCode=!DecimalCode!228,& set BinaryCode=!BinaryCode!11100100,
if "!AsciiCode:~%Counter%,1!" == "Ü" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!e5,& set DecimalCode=!DecimalCode!229,& set BinaryCode=!BinaryCode!11100101,
if "!AsciiCode:~%Counter%,1!" == "ë" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!e6,& set DecimalCode=!DecimalCode!230,& set BinaryCode=!BinaryCode!11100110,
if "!AsciiCode:~%Counter%,1!" == "á" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!e7,& set DecimalCode=!DecimalCode!231,& set BinaryCode=!BinaryCode!11100111,
if "!AsciiCode:~%Counter%,1!" == "ä" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!e8,& set DecimalCode=!DecimalCode!232,& set BinaryCode=!BinaryCode!11101000,
if "!AsciiCode:~%Counter%,1!" == "ë" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!e9,& set DecimalCode=!DecimalCode!233,& set BinaryCode=!BinaryCode!11101001,
if "!AsciiCode:~%Counter%,1!" == "à" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ea,& set DecimalCode=!DecimalCode!234,& set BinaryCode=!BinaryCode!11101010,
if "!AsciiCode:~%Counter%,1!" == "â" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!eb,& set DecimalCode=!DecimalCode!235,& set BinaryCode=!BinaryCode!11101011,
if "!AsciiCode:~%Counter%,1!" == "ç" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ec,& set DecimalCode=!DecimalCode!236,& set BinaryCode=!BinaryCode!11101100,
if "!AsciiCode:~%Counter%,1!" == "°" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ed,& set DecimalCode=!DecimalCode!237,& set BinaryCode=!BinaryCode!11101101,
if "!AsciiCode:~%Counter%,1!" == "å" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ee,& set DecimalCode=!DecimalCode!238,& set BinaryCode=!BinaryCode!11101110,
if "!AsciiCode:~%Counter%,1!" == "ã" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ef,& set DecimalCode=!DecimalCode!239,& set BinaryCode=!BinaryCode!11101111,

if "!AsciiCode:~%Counter%,1!" == "–" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!f0,& set DecimalCode=!DecimalCode!240,& set BinaryCode=!BinaryCode!11110000,
if "!AsciiCode:~%Counter%,1!" == "§" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!f1,& set DecimalCode=!DecimalCode!241,& set BinaryCode=!BinaryCode!11110001,
if "!AsciiCode:~%Counter%,1!" == "ï" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!f2,& set DecimalCode=!DecimalCode!242,& set BinaryCode=!BinaryCode!11110010,
if "!AsciiCode:~%Counter%,1!" == "¢" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!f3,& set DecimalCode=!DecimalCode!243,& set BinaryCode=!BinaryCode!11110011,
if "!AsciiCode:~%Counter%,1!" == "ì" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!f4,& set DecimalCode=!DecimalCode!244,& set BinaryCode=!BinaryCode!11110100,
if "!AsciiCode:~%Counter%,1!" == "‰" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!f5,& set DecimalCode=!DecimalCode!245,& set BinaryCode=!BinaryCode!11110101,
if "!AsciiCode:~%Counter%,1!" == "î" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!f6,& set DecimalCode=!DecimalCode!246,& set BinaryCode=!BinaryCode!11110110,
if "!AsciiCode:~%Counter%,1!" == "ˆ" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!f7,& set DecimalCode=!DecimalCode!247,& set BinaryCode=!BinaryCode!11110111,
if "!AsciiCode:~%Counter%,1!" == "õ" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!f8,& set DecimalCode=!DecimalCode!248,& set BinaryCode=!BinaryCode!11111000,
if "!AsciiCode:~%Counter%,1!" == "ó" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!f9,& set DecimalCode=!DecimalCode!249,& set BinaryCode=!BinaryCode!11111001,
if "!AsciiCode:~%Counter%,1!" == "£" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!fa,& set DecimalCode=!DecimalCode!250,& set BinaryCode=!BinaryCode!11111010,
if "!AsciiCode:~%Counter%,1!" == "ñ" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!fb,& set DecimalCode=!DecimalCode!251,& set BinaryCode=!BinaryCode!11111011,
if "!AsciiCode:~%Counter%,1!" == "Å" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!fc,& set DecimalCode=!DecimalCode!252,& set BinaryCode=!BinaryCode!11111100,
if "!AsciiCode:~%Counter%,1!" == "Ï" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!fd,& set DecimalCode=!DecimalCode!253,& set BinaryCode=!BinaryCode!11111101,
if "!AsciiCode:~%Counter%,1!" == "Á" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!fe,& set DecimalCode=!DecimalCode!254,& set BinaryCode=!BinaryCode!11111110,
if "!AsciiCode:~%Counter%,1!" == "ò" set /a Counter=%Counter% + 1 & set HexCode=!HexCode!ff,& set DecimalCode=!DecimalCode!255,& set BinaryCode=!BinaryCode!11111111,


:: Check if an error occured
if "!DecimalCode_Puffer!" == "!DecimalCode!" set /a Counter=%Counter% + 1

goto :Conversion

:end