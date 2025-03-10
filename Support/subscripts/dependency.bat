set dependency=

if "%~1"=="" goto:fin

if /i "%~1" NEQ "wit" goto:skip
if exist "%homedrive%\Program Files (x86)" (set "wit=temp\wit64\bin\wit.exe") else (set "wit=temp\wit32\bin\wit.exe")
if exist "%wit%" goto:fin
echo.
echo Downloading wit...
if exist "%homedrive%\Program Files (x86)" (set witver=wit-v3.05a-r8638-cygwin64) else (set witver=wit-v3.05a-r8638-cygwin32)
support\wget --no-check-certificate -t 3 "https://wit.wiimm.de/download/%witver%.zip" -O temp\%witver%.zip -q --show-progress

::delete if file is empty (if empty)
>nul findstr "^" "temp\%witver%.zip" || del "temp\%witver%.zip"
if not exist "temp\%witver%.zip" (set dependency=F) & (goto:fin)

support\7za x -aoa "temp\%witver%.zip" -o"temp" -r >nul
del "temp\%witver%.zip">nul

if not exist "temp\%witver%\" (set dependency=F) & (goto:fin)

if exist "%homedrive%\Program Files (x86)" move /y "temp\%witver%" "temp\wit64">nul
if not exist "%homedrive%\Program Files (x86)" move /y "temp\%witver%" "temp\wit32">nul

if not exist %wit% (set dependency=F) & (goto:fin)
if exist "%homedrive%\Program Files (x86)" (echo %witver% >temp\wit64\witver.txt) else (echo %witver% >temp\wit32\witver.txt)
goto:fin
:skip


if /i "%~1" NEQ "ODB" goto:skip
if exist temp\OpenDolBoot.exe goto:fin
echo.
echo Downloading OpenDolBoot...
support\wget --no-check-certificate -t 3 "https://wiibrew.org/w/images/3/37/OpenDolBoot.zip" -O temp\OpenDolBoot.zip -q --show-progress
if exist temp\OpenDolBoot.zip support\7za e -aoa "temp\OpenDolBoot.zip" -o"temp" OpenDolBoot.exe -r >nul
if exist temp\OpenDolBoot.zip del temp\OpenDolBoot.zip>nul
if not exist temp\OpenDolBoot.exe set dependency=F
goto:fin
:skip

if /i "%~1" NEQ "Sharpii" goto:skip
if exist temp\Sharpii.exe goto:fin
echo.
echo Downloading Sharpii .Net Core to Send WADs to the HBC...
support\wget --no-check-certificate -t 3 "https://github.com/TheShadowEevee/Sharpii-NetCore/releases/download/v1.1.10/Sharpii-Net-Core-v1.1.10-Windows.7z" -O Sharpii-Net-Core-v1.1.10-Windows.7z -q --show-progress
if exist Sharpii-Net-Core-v1.1.10-Windows.7z support\7za e -aoa "Sharpii-Net-Core-v1.1.10-Windows.7z" -o"temp" Sharpii.exe -r >nul
if exist Sharpii-Net-Core-v1.1.10-Windows.7z del Sharpii-Net-Core-v1.1.10-Windows.7z>nul
if not exist temp\Sharpii.exe set dependency=F
goto:fin
:skip

if /i "%~1" NEQ "ShowMiiVWiiKeys" goto:skip
if exist temp\ShowMiiVWiiKeys.exe goto:fin
echo.
echo Downloading ShowMiiVWiiKeys...
::https://forums.dolphin-emu.org/attachment.php?aid=1383
support\wget --no-check-certificate -t 3 "https://github.com/CuriousTommy/ShowMiiVWiiKeys/releases/latest/download/ShowMiiVWiiKeys.zip" -O temp\ShowMiiVWiiKeys.zip -q --show-progress
if exist temp\ShowMiiVWiiKeys.zip support\7za e -aoa "temp\ShowMiiVWiiKeys.zip" -o"temp" ShowMiiVWiiKeys.exe -r >nul
if exist temp\ShowMiiVWiiKeys.zip del temp\ShowMiiVWiiKeys.zip>nul
if not exist temp\ShowMiiVWiiKeys.exe set dependency=F
goto:fin
:skip

if /i "%~1" NEQ "UnRAR" goto:skip
if exist temp\UnRAR.exe goto:fin
echo.
echo Downloading UnRAR...
support\wget --no-check-certificate -t 3 "https://sourceforge.net/projects/menuui/files/UnRAR.exe" -O temp\UnRAR.exe -q --show-progress
::delete if file is empty (if empty)
>nul findstr "^" "temp\UnRAR.exe" || del "temp\UnRAR.exe"
if not exist temp\UnRAR.exe set dependency=F
goto:fin
:skip

if /i "%~1" NEQ "wwcxtool" goto:skip
if exist temp\wwcxtool.exe goto:fin
echo.
echo Downloading wwcxtool...
support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/wwpacker184.zip" -O temp\wwpacker184.zip -q --show-progress
if exist temp\wwpacker184.zip support\7za e -aoa "temp\wwpacker184.zip" -o"temp" wwcxtool.exe -r >nul
if exist temp\wwpacker184.zip del temp\wwpacker184.zip>nul
if not exist temp\wwcxtool.exe set dependency=F
goto:fin
:skip


if /i "%~1" NEQ "wiiload" goto:skip
if exist temp\wiiload.exe goto:fin
echo.
echo Downloading wiiload.exe (and hackmii_installer_v1.2.zip)...
if not exist temp\hackmii_installer_v1.2.zip support\wget --no-check-certificate -c -l1 -r -nd --retr-symlinks -t2 -T30 --random-wait --reject html,tmp --accept-regex ".*hackmii_installer_v1\.2.*" "https://bootmii.org/download/" -q --show-progress
if not exist temp\hackmii_installer_v1.2.zip move /y "get.php@file=hackmii_installer_v1.2.zip*" temp\hackmii_installer_v1.2.zip>nul
if exist get.* del /f /q get.*
support\7za e -aoa temp\hackmii_installer_v1.2.zip -o"temp" wiiload.exe -r >nul
if not exist temp\wiiload.exe set dependency=F
goto:fin
:skip


if /i "%~1" NEQ "wilbrand" goto:skip
if exist temp\Wilbrand.exe goto:fin
echo.
echo Downloading Wilbrand.exe...
support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/Wilbrand.exe" -O temp\Wilbrand.exe -q --show-progress
::delete if file is empty (if empty)
>nul findstr "^" "temp\Wilbrand.exe" || del "temp\Wilbrand.exe"
if not exist temp\Wilbrand.exe set dependency=F
goto:fin
:skip

if /i "%~1" NEQ "nandBinCheck" goto:skip
if exist temp\nandBinCheck\nandBinCheck.exe goto:fin
echo.
echo Downloading nandBinCheck...
support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/nandBinCheck.zip" -q --show-progress
if exist nandBinCheck.zip support\7za x -aoa "nandBinCheck.zip" -o"temp\nandBinCheck" -r >nul
if exist nandBinCheck.zip del nandBinCheck.zip>nul
if not exist temp\nandBinCheck\nandBinCheck.exe set dependency=F
goto:fin
:skip


if /i "%~1" NEQ "nand-tools" goto:skip
if not exist temp\nand-tools\nand-aes-dump.exe goto:DL
if not exist temp\nand-tools\NAND-bin2raw.exe goto:DL
if exist temp\nand-tools\zestig.exe goto:fin
:DL
echo.
echo Downloading nand-tools...
support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/nand-tools.zip" -O temp\nand-tools.zip -q --show-progress
if exist temp\nand-tools.zip support\7za x -aoa "temp\nand-tools.zip" -o"temp\nand-tools" -r >nul
if exist temp\nand-tools.zip del temp\nand-tools.zip>nul

if not exist temp\nand-tools\nand-aes-dump.exe set dependency=F
if not exist temp\nand-tools\NAND-bin2raw.exe set dependency=F
if not exist temp\nand-tools\zestig.exe set dependency=F

goto:fin
:skip


if /i "%~1" NEQ "Punetwiin" goto:skip
if exist temp\Punetwiin\punetwiin.exe goto:fin
echo.
echo Downloading Punetwiin...
support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/Punetwiin.zip" -O temp\Punetwiin.zip -q --show-progress
if exist temp\Punetwiin.zip support\7za x -aoa "temp\Punetwiin.zip" -o"temp\Punetwiin" -r >nul
if exist temp\Punetwiin.zip del temp\Punetwiin.zip>nul
if not exist temp\Punetwiin\punetwiin.exe set dependency=F
goto:fin
:skip

if /i "%~1" NEQ "LZ77Helper" goto:skip
if exist temp\LZ77Helper\LZ77Helper.bat goto:fin
echo.
echo Downloading LZ77Helper...
support\wget --no-check-certificate -t 3 "https://github.com/xflak/lz77helper/releases/latest/download/lz77helper.zip" -O temp\LZ77Helper.zip -q --show-progress
if exist temp\LZ77Helper.zip support\7za x -aoa "temp\LZ77Helper.zip" -o"temp\LZ77Helper" -r >nul
if exist temp\LZ77Helper.zip del temp\LZ77Helper.zip>nul
if not exist temp\LZ77Helper\LZ77Helper.bat set dependency=F
goto:fin
:skip


if /i "%~1" NEQ "LegacyCIOS" goto:skip

if not exist support\wadmii.exe goto:DL
if not exist support\TMDedit.exe goto:DL
if not exist support\libWiiSharp.dll goto:DL
if exist support\patchIOS.exe goto:fin
:DL
echo.
echo Downloading LegacyCIOS tools...
support\wget --no-check-certificate -t 3 "https://github.com/modmii/modmii.github.io/releases/download/7.0.2/ModMii.zip" -O temp\ModMii_7.0.2.zip -q --show-progress
support\7za e -aoa temp\ModMii_7.0.2.zip -o"Support" wadmii.exe TMDedit.exe libWiiSharp.dll patchIOS.exe -r >nul
if not exist Support\wadmii.exe set dependency=F
if not exist Support\TMDedit.exe set dependency=F
if not exist Support\libWiiSharp.dll set dependency=F
if not exist Support\patchIOS.exe set dependency=F
if exist temp\ModMii_7.0.2.zip del temp\ModMii_7.0.2.zip>nul

goto:fin
:skip



if /i "%~1" NEQ "NETframework" goto:skip
::.NET Framework 3.5 check+installation
if exist "%windir%\Microsoft.NET\Framework\v3.5" goto:skip

::get different framework installer if running windows 7 or lower
set "code2=https://download.visualstudio.microsoft.com/download/pr/b635098a-2d1d-4142-bef6-d237545123cb/2651b87007440a15209cac29634a4e45/dotnetfx35.exe"
set "dlname=dotnetfx35.exe"
if /i %winver% LSS 8 (set "code2=https://download.microsoft.com/download/7/0/3/703455ee-a747-4cc8-bd3e-98a615c3aedb/dotNetFx35setup.exe") & (set "dlname=dotNetFx35setup.exe")

set FrameworkAttempt=0
:NETFRAMEWORK
SET /a FrameworkAttempt=%FrameworkAttempt%+1
if exist "temp\%dlname%" goto:semiskip
echo.
echo Downloading .NET Framework 3.5 Installer
support\wget --no-check-certificate -t 3 "%code2%" -O "temp\%dlname%" -q --show-progress
::delete if file is empty (if empty)
>nul findstr "^" "temp\%dlname%" || del "temp\%dlname%"
if exist "temp\%dlname%" goto:semiskip
if /i "%FrameworkAttempt%" EQU "3" goto:GiveUpOnFramework
goto:NETFRAMEWORK
:semiskip
echo Launching installer and waiting for installation to finish...
echo.
start /wait temp\%dlname%

if exist "temp\%dlname%" del "temp\%dlname%">nul
if exist "%windir%\Microsoft.NET\Framework\v3.5" goto:skip
if /i "%FrameworkAttempt%" EQU "3" goto:GiveUpOnFramework
echo Installation Failed, retrying...
echo.
goto:NETFRAMEWORK

:GiveUpOnFramework
set dependency=F
echo.
echo.
echo .NET Framework 3.5 Installation Failed Multiple Times
echo Alternatively, you can try installing .NET Framework 3.5 by performing a Windows Update
echo.
echo ModMii's legacy cIOS building method will not work properly without .NET Framework 3.5
echo.
goto:fin2
:skip



if /i "%~1" NEQ "spin" goto:skip
if not exist temp\optional_non_spinning_outline.mym goto:downloadit
if not exist temp\optional_spinning_outline.mym goto:downloadit
if exist temp\optional_fast_spinning_outline.mym goto:skip
:downloadit
echo.
echo Downloading Theme Spin Effects...
support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/mym_spin_effects.zip" -O temp\mym_spin_effects.zip -q --show-progress
if exist temp\mym_spin_effects.zip support\7za x -aoa "temp\mym_spin_effects.zip" -o"temp" -r
if exist temp\mym_spin_effects.zip del temp\mym_spin_effects.zip>nul

if not exist temp\optional_non_spinning_outline.mym set dependency=F
if not exist temp\optional_spinning_outline.mym set dependency=F
if not exist temp\optional_fast_spinning_outline.mym set dependency=F
goto:fin
:skip





if /i "%~1" NEQ "themewii" goto:skip
set FrameworkAttempt=0
if not exist temp\themewii\themewii.exe goto:downloadit
if not exist temp\themewii\ASH.exe goto:downloadit
goto:framework45
:downloadit
echo.
echo Downloading themewii.exe (.NET Framework 4.5 version)...

support\wget --no-check-certificate -t 3 "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/themewii_dotnet45.zip" -O temp\themewii_dotnet45.zip -q --show-progress

::delete if file is empty (if empty)
>nul findstr "^" "temp\themewii_dotnet45.zip" || del "temp\themewii_dotnet45.zip"
if not exist "temp\themewii_dotnet45.zip" (set dependency=F) & (goto:fin)

if not exist temp\themewii\ mkdir temp\themewii

support\7za x -aoa "temp\themewii_dotnet45.zip" -o"temp\themewii" -r >nul
del "temp\themewii_dotnet45.zip">nul

if not exist temp\themewii\themewii.exe (set dependency=F) & (goto:fin)
if not exist temp\themewii\ASH.exe (set dependency=F) & (goto:fin)

:framework45
::confirm net framework 4.5 or above installed
if exist "temp\4.reg" del "temp\4.reg">nul
START /MIN /WAIT REG EXPORT "HKLM\Software\Microsoft\NET Framework Setup\NDP\v4\Full" "temp\4.reg" /Y
if not exist "temp\4.reg" goto:NETFRAMEWORK4

cmd /a /c type "temp\4.reg">"temp\4.reg.txt"
support\sfk filter -quiet -spat -nocheck "temp\4.reg.txt" -inc "[HKEY_LOCAL_MACHINE\Software\Microsoft\NET Framework Setup\NDP\v4\Full]" to "\x22Version\x22=\x22" -+"\x22Version\x22=\x22" -rep _*=__ -rep _\x22__ -write -yes
set FrameworkVer=
set /p FrameworkVer= <"temp\4.reg.txt"
set FrameworkVer=%FrameworkVer:~0,3%

del "temp\4.reg">nul
if exist "temp\4.reg.txt" del "temp\4.reg.txt">nul

if %FrameworkVer% GEQ 4.5 goto:fin



:NETFRAMEWORK4
if /i "%FrameworkAttempt%" EQU "3" goto:GiveUpOnFramework4
SET /a FrameworkAttempt=%FrameworkAttempt%+1
if exist "temp\dotNetFx45_Full_setup.exe" goto:semiskip
echo.
echo Downloading .NET Framework 4.5 Installer
support\wget --no-check-certificate -t 3 "https://download.microsoft.com/download/B/A/4/BA4A7E71-2906-4B2D-A0E1-80CF16844F5F/dotNetFx45_Full_setup.exe" -O "temp\dotNetFx45_Full_setup.exe" -q --show-progress
::delete if file is empty (if empty)
>nul findstr "^" "temp\dotNetFx45_Full_setup.exe" || del "temp\dotNetFx45_Full_setup.exe"
if exist "temp\dotNetFx45_Full_setup.exe" goto:semiskip

goto:NETFRAMEWORK4
:semiskip
echo Launching installer and waiting for installation to finish...
echo.
start /wait temp\dotNetFx45_Full_setup.exe

del "temp\dotNetFx45_Full_setup.exe">nul

::check again
goto:framework45


:GiveUpOnFramework4
set dependency=F
echo.
echo .NET Framework 4.5 Installation Failed Multiple Times
echo.
echo ModMii's theme building method will not work properly without .NET Framework 4.5-4.8.1
echo.
goto:fin2
:skip




:fin

if /i "%dependency%" EQU "F" echo Download Failed!

:fin2