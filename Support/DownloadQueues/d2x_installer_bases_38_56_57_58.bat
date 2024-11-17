@echo off
setlocal enabledelayedexpansion

:: ModMii v6.6.4 - Download Queue - Mon 02/13/2023 - 23:00:22.00
set AdvNumber=4
if /i "%GetAdvNumberOnly%" EQU "Y" goto:endofqueue

::Queue Settings
Set ROOTSAVE=ON
Set Option1=off

::Queue
(
echo temp\AdvDL1.bat
echo temp\AdvDL2.bat
echo temp\AdvDL3.bat
echo temp\AdvDL4.bat
) > temp\DLGotosADV.txt

(
echo Advanced Download: IOS38-64-v4123
echo Advanced Download: IOS56-64-v5661
echo Advanced Download: IOS57-64-v5918
echo Advanced Download: IOS58-64-v6175
) > temp\DLnamesADV.txt

:: Function to create AdvDL files
:createAdvDL
if exist temp\AdvDL%1.bat del temp\AdvDL%1.bat
(
echo set name=Advanced Download: IOS%2-64-v%3
echo set DEC=%2
echo set VERFINAL=%3
echo set patchname=
echo set slotname=
echo set versionname=
echo set HEX=
echo set VER=%3
echo set wadfolder=
echo set PATCHCODE=
echo set slotcode=
echo set versioncode=
echo set category=userdefined
) > temp\AdvDL%1.bat
support\sfk filter -quiet temp\AdvDL%1.bat -rep _"__ -write -yes
goto:eof

:: Create AdvDL files
call :createAdvDL 1 38 4123
call :createAdvDL 2 56 5661
call :createAdvDL 3 57 5918
call :createAdvDL 4 58 6175

:endofqueue
