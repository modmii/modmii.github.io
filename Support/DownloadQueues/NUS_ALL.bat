@echo off
setlocal enabledelayedexpansion

:: ModMii v6.6.4 - Download Queue - %DATE% - %TIME%
set AdvNumber=0

if /i "%GetAdvNumberOnly%" EQU "Y" goto :endofqueue

:: Queue Settings
set ROOTSAVE=off
set Option1=on

:: Queue
:: Use arrays to simplify repetitive variable setting
set "regions=U E J K"
set "versions=3.2 4.1 4.2 4.3"

for %%r in (%regions%) do (
    set EULA%%r=*
    set RS%%r=*

    for %%v in (%versions%) do (
        if not "%%r"=="K" if not "%%v"=="3.2" (
            set SM%%v%%r=*
        )
    )
)

:: Set other variables
set "iosList=30 60P 70 80"
for %%i in (%iosList%) do set IOS%%i=*

set "otherVars=BC MyM MII P0 P S SK IU IE IJ WU WE WJ NU NE NJ WSU WSE WSJ M10"
for %%v in (%otherVars%) do set %%v=*

:: IOS versions
set "iosVersions=9 12 13 14 15 17 21 22 28 31 33 34 35 36 37 38 41 43 45 46 53 55 56 57 58 59 61 62"
for %%i in (%iosVersions%) do set IOS%%i=*

set IOS36v3608=*
set IOS48v4124=*

:: Additional variables  
set "addVars=A0e A01 A0e_70 A01_60 A0e_60 A01_70 A0c A40 A42 A45 A70 A72 A75 A78 A7b A7e A84 A87 A8a A81 A8d A9d A94 A97 A9a"
for %%v in (%addVars%) do set %%v=*

:: cIOS versions
set "cIOSVersions=cIOS222[38]-v4 cIOS223[37-38]-v4 cIOS222[38]-v5 cIOS223[37]-v5 cIOS224[57]-v5 cIOS202[60]-v5.1R cIOS222[38]-v5.1R cIOS223[37]-v5.1R cIOS224[57]-v5.1R cIOS249-v14 cIOS249-v17b"
for %%c in (%cIOSVersions%) do set %%c=*

:: cIOS249 versions
set "cIOS249Versions=37 38 53 55 56 57 58 60 70 80"
for %%v in (%cIOS249Versions%) do (
    set cIOS249[%%v]-v19=*
    set cIOS249[%%v]-v20=*
    set cIOS249[%%v]-v21=*
    set cIOS249[%%v]-d2x-v10-beta52=*
)

:: MIOS versions
set RVL-cMIOS-v65535(v10)_WiiGator_WiiPower_v0.2=*
set RVL-cmios-v4_WiiGator_GCBL_v0.2=*
set RVL-cmios-v4_Waninkoko_rev5=*

:endofqueue
