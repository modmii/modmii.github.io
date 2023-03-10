@echo off
setlocal

::chdir /d "%~dp0"
pushd "%~dp0"
cls
chcp 437>nul
set "PATH=%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%;%homedrive%\ModMii\temp;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0"

if not exist support cd..\..

title ModMii Uninstaller...

support\nircmd.exe win trans ititle "ModMii Uninstaller..." 0
support\nircmd.exe win hide ititle "ModMii Uninstaller..."

title ModMii Uninstaller

echo ModMii Uninstaller
echo.
echo Do not close this window unless you wish you abort the uninstallation
echo.


::check for write access
if exist "temp\test" goto:skip
mkdir "temp\test"
if not exist "temp\test" (goto:WriteError) else (goto:donecheck)

:skip
if not exist temp\test\test.txt goto:skip
del temp\test\test.txt>nul
if exist temp\test\test.txt (goto:WriteError) else (goto:donecheck)

:skip
echo test>temp\test\test.txt
if exist temp\test\test.txt goto:donecheck

:WriteError


set "filename=%~1"
if not "%filename%"=="" set "filepath=%cd%\%filename%"

if "%filename%"=="" set "filepath=%~0"
if "%filename%"=="" set "filename=%~nx0"

::echo %filename%
::echo %filepath%

support\nircmd.exe shortcut "%filepath%" "%temp%" "ModMiiUninstaller"
support\hexalter.exe "%temp%\ModMiiUninstaller.lnk" 0x15=0x20>nul

if exist "%userprofile%\Desktop\ModMii.lnk" support\hexalter.exe "%userprofile%\Desktop\ModMii.lnk" 0x15=0x20>nul
if exist "%userprofile%\Desktop\ModMii Skin.lnk" support\hexalter.exe "%userprofile%\Desktop\ModMii Skin.lnk" 0x15=0x20>nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii.lnk" support\hexalter.exe "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii.lnk" 0x15=0x20>nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii Skin.lnk" support\hexalter.exe "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii Skin.lnk" 0x15=0x20>nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Uninstall.lnk" support\hexalter.exe "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Uninstall.lnk" 0x15=0x20>nul

cd "%temp%"
start ModMiiUninstaller.lnk
exit

:donecheck
if exist "temp\test" rd /s /q "temp\test"> nul

::empty folder check, if not empty goto something, if empty delete it
dir /A /B "temp" | findstr /R ".">NUL && goto:notempty
rd /s /q "temp"> nul
:notempty




::HTA Stuff

copy /y "Support\subscripts\Uninstaller.hta" "%temp%\">nul

set replacements=
set "replacements=%replacements%-rep _"..\x5c"_"%cd:_=\x5f%\x5c"_ "


if not exist "ModMii.exe" set "replacements=%replacements%-rep _"ModMii--\x3e\x3cth"_"ModMii--\x3e\x3cth disabled"_ -rep _"(ModMii.checked = True) And "__ -rep _"ModMii.checked = checkstatus"__ "

if not exist "temp\" set "replacements=%replacements%-rep _"ModMiiTemp--\x3e\x3cth"_"ModMiiTemp--\x3e\x3cth disabled"_ -rep _" And (ModMiiTemp.checked = True)"__ -rep _"ModMiiTemp.checked = checkstatus"__ "

if not exist "COPY_TO_SD\" set "replacements=%replacements%-rep _"SDfolder--\x3e\x3cth"_"SDfolder--\x3e\x3cth disabled"_ -rep _" And (SDfolder.checked = True)"__ -rep _"SDfolder.checked = checkstatus"__ "

if not exist "COPY_TO_USB\" set "replacements=%replacements%-rep _"USBfolder--\x3e\x3cth"_"USBfolder--\x3e\x3cth disabled"_ -rep _" And (USBfolder.checked = True)"__ -rep _"USBfolder.checked = checkstatus"__ "


if not exist "Program Files\WiiBackupManager\" set "replacements=%replacements%-rep _"wbm--\x3e\x3cth"_"wbm--\x3e\x3cth disabled"_ -rep _" And (wbm.checked = True)"__ -rep _"wbm.checked = checkstatus"__ "

if not exist "Program Files\FAT32_GUI_Formatter\" set "replacements=%replacements%-rep _"f32--\x3e\x3cth"_"f32--\x3e\x3cth disabled"_ -rep _" And (f32.checked = True)"__ -rep _"f32.checked = checkstatus"__ "

if not exist "Program Files\ShowMiiWads\" set "replacements=%replacements%-rep _"SMW--\x3e\x3cth"_"SMW--\x3e\x3cth disabled"_ -rep _" And (SMW.checked = True)"__ -rep _"SMW.checked = checkstatus"__ "

if not exist "Program Files\CustomizeMii\" set "replacements=%replacements%-rep _"CM--\x3e\x3cth"_"CM--\x3e\x3cth disabled"_ -rep _" And (CM.checked = True)"__ -rep _"CM.checked = checkstatus"__ "

if not exist "Program Files\WiiGSC\" set "replacements=%replacements%-rep _"WiiGSC--\x3e\x3cth"_"WiiGSC--\x3e\x3cth disabled"_ -rep _" And (WiiGSC.checked = True)"__ -rep _"WiiGSC.checked = checkstatus"__ "

if not exist "Program Files\ohneschwanzenegger\" set "replacements=%replacements%-rep _"ohnes--\x3e\x3cth"_"ohnes--\x3e\x3cth disabled"_ -rep _" And (ohnes.checked = True)"__ -rep _"ohnes.checked = checkstatus"__ "

if not exist "Program Files\Dolphin-x64\" set "replacements=%replacements%-rep _"Dolphin--\x3e\x3cth"_"Dolphin--\x3e\x3cth disabled"_ -rep _" And (Dolphin.checked = True)"__ -rep _"Dolphin.checked = checkstatus"__ "

if not exist "Program Files\OpenShopChannel\" set "replacements=%replacements%-rep _"OSC--\x3e\x3cth"_"OSC--\x3e\x3cth disabled"_ -rep _" And (OSC.checked = True)"__ -rep _"OSC.checked = checkstatus"__ "


if exist "%homedrive%\Program Files (x86)" (set bit=64) else (set bit=32)

if not exist "Program Files\FileZilla_win%bit%\" set "replacements=%replacements%-rep _"FILEZILLA--\x3e\x3cth"_"FILEZILLA--\x3e\x3cth disabled"_ -rep _" And (FILEZILLA.checked = True)"__ -rep _"FILEZILLA.checked = checkstatus"__ "


if not exist "Program Files\HxD\" set "replacements=%replacements%-rep _"hxd--\x3e\x3cth"_"hxd--\x3e\x3cth disabled"_ -rep _" And (hxd.checked = True)"__ -rep _"hxd.checked = checkstatus"__ "

if not exist "Program Files\Diskitude\" set "replacements=%replacements%-rep _"Diskitude--\x3e\x3cth"_"Diskitude--\x3e\x3cth disabled"_ -rep _" And (Diskitude.checked = True)"__ -rep _"Diskitude.checked = checkstatus"__ "

if not exist "Program Files\NKit\" set "replacements=%replacements%-rep _"Nkit--\x3e\x3cth"_"Nkit--\x3e\x3cth disabled"_ -rep _" And (Nkit.checked = True)"__ -rep _"Nkit.checked = checkstatus"__ "

if not exist "Program Files\RiiConnect24Patcher\" set "replacements=%replacements%-rep _"RC24--\x3e\x3cth"_"RC24--\x3e\x3cth disabled"_ -rep _" And (RC24.checked = True)"__ -rep _"RC24.checked = checkstatus"__ "

if not exist "Program Files\h2testw\" set "replacements=%replacements%-rep _"SDTEST--\x3e\x3cth"_"SDTEST--\x3e\x3cth disabled"_ -rep _" And (SDTEST.checked = True)"__ -rep _"SDTEST.checked = checkstatus"__ "


if exist "%homedrive%\Program Files (x86)" (set hashfolder=hashmyfiles-x64) else (set hashfolder=hashmyfiles)

if not exist "Program Files\%hashfolder%\" set "replacements=%replacements%-rep _"HashMF--\x3e\x3cth"_"HashMF--\x3e\x3cth disabled"_ -rep _" And (HashMF.checked = True)"__ -rep _"HashMF.checked = checkstatus"__ "

if not exist "Program Files\ThemeMii\" set "replacements=%replacements%-rep _"ThemeMiiMod--\x3e\x3cth"_"ThemeMiiMod--\x3e\x3cth disabled"_ -rep _" And (ThemeMiiMod.checked = True)"__ -rep _"ThemeMiiMod.checked = checkstatus"__ "

if not exist "Program Files\GCBM\" set "replacements=%replacements%-rep _"GCBM--\x3e\x3cth"_"GCBM--\x3e\x3cth disabled"_ -rep _" And (GCBM.checked = True)"__ -rep _"GCBM.checked = checkstatus"__ "


::edit HTA
support\sfk filter -quiet -spat "%temp%\Uninstaller.hta" %replacements%-write -yes




::-----------This is where the magic happens------------------
if exist "%temp%\tempcheck.bat" del /f /q "%temp%\tempcheck.bat"

set "ModMiiDir=%cd%"
cd /d "%temp%"
start /wait Uninstaller.hta
cd /d "%ModMiiDir%"

if exist "%temp%\tempcheck.bat" goto:skip

echo.
echo Uninstallation aborted
@ping 127.0.0.1 -n 2 -w 1000> nul
exit


:skip

::make window visible, focused and activated

::title ModMii Uninstaller...
::start /wait support\nircmd.exe win trans ititle "ModMii Uninstaller..." 255
::start /wait support\nircmd.exe win focus ititle "ModMii Uninstaller..."
::start /wait support\nircmd.exe win activate ititle "ModMii Uninstaller..."
::title ModMii Uninstaller


call "%temp%\tempcheck.bat"

echo Uninstalling, please wait...
echo.



if /i "%SDfolder%" EQU "*" rd /s /q "COPY_TO_SD"> nul
if /i "%USBfolder%" EQU "*" rd /s /q "COPY_TO_USB"> nul
if /i "%ModMiiTemp%" EQU "*" rd /s /q "temp"> nul


if /i "%wbm%" NEQ "*" goto:skip
if exist "Program Files\WiiBackupManager\" rd /s /q "Program Files\WiiBackupManager\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\WiiBackupManager.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\WiiBackupManager.lnk">nul
if exist "%userprofile%\Desktop\WiiBackupManager.lnk" del "%userprofile%\Desktop\WiiBackupManager.lnk">nul
:skip

if /i "%f32%" NEQ "*" goto:skip
if exist "Program Files\FAT32_GUI_Formatter\" rd /s /q "Program Files\FAT32_GUI_Formatter\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\FAT32 GUI Formatter.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\FAT32 GUI Formatter.lnk">nul
if exist "%userprofile%\Desktop\FAT32 GUI Formatter.lnk" del "%userprofile%\Desktop\FAT32 GUI Formatter.lnk">nul
:skip

if /i "%SMW%" NEQ "*" goto:skip
if exist "Program Files\ShowMiiWads\" rd /s /q "Program Files\ShowMiiWads\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ShowMiiWads.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ShowMiiWads.lnk">nul
if exist "%userprofile%\Desktop\ShowMiiWads.lnk" del "%userprofile%\Desktop\ShowMiiWads.lnk">nul
:skip

if /i "%CM%" NEQ "*" goto:skip
if exist "Program Files\CustomizeMii\" rd /s /q "Program Files\CustomizeMii\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\CustomizeMii.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\CustomizeMii.lnk">nul
if exist "%userprofile%\Desktop\CustomizeMii.lnk" del "%userprofile%\Desktop\CustomizeMii.lnk">nul
:skip

if /i "%WiiGSC%" NEQ "*" goto:skip
if exist "Program Files\WiiGSC\" rd /s /q "Program Files\WiiGSC\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Wii Game Shortcut Creator.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Wii Game Shortcut Creator.lnk">nul
if exist "%userprofile%\Desktop\Wii Game Shortcut Creator.lnk" del "%userprofile%\Desktop\Wii Game Shortcut Creator.lnk">nul

::also remove start menu shortcut for "Crazy Installer.lnk" when uninstalling WiiGSC
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Crazy Installer.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Crazy Installer.lnk">nul
:skip

if /i "%ohnes%" NEQ "*" goto:skip
if exist "Program Files\ohneschwanzenegger\" rd /s /q "Program Files\ohneschwanzenegger\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ohneschwanzenegger.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ohneschwanzenegger.lnk">nul
if exist "%userprofile%\Desktop\ohneschwanzenegger.lnk" del "%userprofile%\Desktop\ohneschwanzenegger.lnk">nul
:skip

if /i "%Dolphin%" NEQ "*" goto:skip
if exist "Program Files\Dolphin-x64\" rd /s /q "Program Files\Dolphin-x64\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Dolphin.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Dolphin.lnk">nul
if exist "%userprofile%\Desktop\Dolphin.lnk" del "%userprofile%\Desktop\Dolphin.lnk">nul
:skip


if /i "%OSC%" NEQ "*" goto:skip
if exist "Program Files\OpenShopChannel\" rd /s /q "Program Files\OpenShopChannel\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Open Shop Channel.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Open Shop Channel.lnk">nul
if exist "%userprofile%\Desktop\Open Shop Channel.lnk" del "%userprofile%\Desktop\Open Shop Channel.lnk">nul
:skip


if /i "%FILEZILLA%" NEQ "*" goto:skip
if exist "Program Files\FileZilla_win%bit%\" rd /s /q "Program Files\FileZilla_win%bit%\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\FileZilla.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\FileZilla.lnk">nul
if exist "%userprofile%\Desktop\FileZilla.lnk" del "%userprofile%\Desktop\FileZilla.lnk">nul
:skip


if /i "%hxd%" NEQ "*" goto:skip
if exist "Program Files\HxD\" rd /s /q "Program Files\HxD\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\HxD.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\HxD.lnk">nul
if exist "%userprofile%\Desktop\HxD.lnk" del "%userprofile%\Desktop\HxD.lnk">nul
:skip

if /i "%Diskitude%" NEQ "*" goto:skip
if exist "Program Files\Diskitude\" rd /s /q "Program Files\Diskitude\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Diskitude.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Diskitude.lnk">nul
if exist "%userprofile%\Desktop\Diskitude.lnk" del "%userprofile%\Desktop\Diskitude.lnk">nul
:skip


if /i "%Nkit%" NEQ "*" goto:skip
if exist "Program Files\Nkit\" rd /s /q "Program Files\Nkit\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Nkit.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Nkit.lnk">nul
if exist "%userprofile%\Desktop\Nkit.lnk" del "%userprofile%\Desktop\Nkit.lnk">nul
:skip


if /i "%RC24%" NEQ "*" goto:skip
if exist "Program Files\RiiConnect24Patcher\" rd /s /q "Program Files\RiiConnect24Patcher\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\RiiConnect24 Patcher.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\RiiConnect24 Patcher.lnk">nul
if exist "%userprofile%\Desktop\RiiConnect24 Patcher.lnk" del "%userprofile%\Desktop\RiiConnect24 Patcher.lnk">nul
:skip


if /i "%SDTEST%" NEQ "*" goto:skip
if exist "Program Files\h2testw\" rd /s /q "Program Files\h2testw\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\H2testw.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\H2testw.lnk">nul
if exist "%userprofile%\Desktop\H2testw.lnk" del "%userprofile%\Desktop\H2testw.lnk">nul
:skip


if /i "%HashMF%" NEQ "*" goto:skip
if exist "Program Files\%hashfolder%\" rd /s /q "Program Files\%hashfolder%\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\HashMyFiles.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\HashMyFiles.lnk">nul
if exist "%userprofile%\Desktop\HashMyFiles.lnk" del "%userprofile%\Desktop\HashMyFiles.lnk">nul
:skip


if /i "%ThemeMiiMod%" NEQ "*" goto:skip
if exist "Program Files\ThemeMii\" rd /s /q "Program Files\ThemeMii\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ThemeMii Mod.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ThemeMii Mod.lnk">nul
if exist "%userprofile%\Desktop\ThemeMii Mod.lnk" del "%userprofile%\Desktop\ThemeMii Mod.lnk">nul
:skip


if /i "%GCBM%" NEQ "*" goto:skip
if exist "Program Files\GCBM\" rd /s /q "Program Files\GCBM\"> nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\GameCube Backup Manager.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\GameCube Backup Manager.lnk">nul
if exist "%userprofile%\Desktop\GameCube Backup Manager.lnk" del "%userprofile%\Desktop\GameCube Backup Manager.lnk">nul
:skip


::delete ModMii's Program Files folder if empty

if not exist "Program Files" goto:notempty
::empty folder check, if not empty goto something, if empty delete it
dir /A /B "Program Files" | findstr /R ".">NUL && goto:notempty
rd /s /q "Program Files"> nul
:notempty


if not exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii" goto:notempty
::empty folder check, if not empty goto something, if empty delete it
dir /A /B "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii" | findstr /R ".">NUL && goto:notempty
rd /s /q "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii"> nul
:notempty




if /i "%ModMii%" NEQ "*" goto:skipmodmii

if exist "ModMii.exe" del "ModMii.exe">nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii.lnk">nul
if exist "%userprofile%\Desktop\ModMii.lnk" del "%userprofile%\Desktop\ModMii.lnk">nul

if exist "ModMiiSkin.exe" del "ModMiiSkin.exe">nul
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii Skin.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\ModMii Skin.lnk">nul
if exist "%userprofile%\Desktop\ModMii Skin.lnk" del "%userprofile%\Desktop\ModMii Skin.lnk">nul

if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Open ModMii Folder.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Open ModMii Folder.lnk">nul

if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Website & Help.lnk" del "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\Website & Help.lnk">nul


::remove ModMii Launchpad if exists, but only the folder, not the toolbar, cuz reasons
if exist "C:\ModMii\temp\ModMii Launchpad" rd /s /q "C:\ModMii\temp\ModMii Launchpad"> nul
if not exist "C:\ModMii\temp" goto:skiplaunchpad
dir /A /B "C:\ModMii\temp" | findstr /R ".">NUL && goto:skiplaunchpad
rd /s /q "C:\ModMii\temp"> nul
if not exist "C:\ModMii" goto:skiplaunchpad
dir /A /B "C:\ModMii" | findstr /R ".">NUL && goto:skiplaunchpad
rd /s /q "C:\ModMii"> nul
:skiplaunchpad


::remove ModMii right-click context if installed
:uninstallcontext
> "%TEMP%.\TEMP.REG" ECHO Windows Registry Editor Version 5.00
>>"%TEMP%.\TEMP.REG" ECHO.
>>"%TEMP%.\TEMP.REG" ECHO [-HKEY_CURRENT_USER\SOFTWARE\Classes\*\shell\Open with ModMii]
>>"%TEMP%.\TEMP.REG" ECHO.
>>"%TEMP%.\TEMP.REG" ECHO [-HKEY_CURRENT_USER\Software\Classes\directory\shell\Open with ModMii]
>>"%TEMP%.\TEMP.REG" ECHO.
::to make verbose, remove this part:  *>&1 | Out-Null
powershell "Invoke-Command {reg import '"%TEMP%.\TEMP.REG"' *>&1 | Out-Null}"
DEL "%TEMP%\TEMP.REG">nul




if exist "Program Files\" goto:KeepUninstaller
:FullClean
::full uninstall of all components
if exist "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\" rd /s /q "%appdata%\Microsoft\Windows\Start Menu\Programs\ModMii\"> nul
if exist "Uninstall.exe" del "Uninstall.exe">nul
::if exist "Uninstaller.exe" del "Uninstaller.exe">nul

::no need to retain custom uninstaller files at this point
if exist Support\uninstall.dat move /y Support\uninstall.dat "uninstall.dat">nul
if exist Support\uninstall_l.ifl move /y Support\uninstall_l.ifl "uninstall_l.ifl">nul
if exist Support\Uninstall2.exe move /y Support\Uninstall2.exe "Uninstall.exe">nul


echo @echo Off>"%temp%\TEMP.bat"
echo @ping 127.0.0.1 -n 2 -w 1000^> nul>>"%temp%\TEMP.bat"
echo rd /s /q "%cd%\Support"^> nul>>"%temp%\TEMP.bat"
::empty folder check, if not empty goto something, if empty delete it
echo dir /A /B "%cd%" ^| findstr /R "."^>NUL ^&^& goto:notempty>>"%temp%\TEMP.bat"
echo rd /s /q "%cd%"^> nul>>"%temp%\TEMP.bat"
echo :notempty>>"%temp%\TEMP.bat"

echo cd /d "%cd%">>"%temp%\TEMP.bat"
echo if exist Uninstall.exe start Uninstall.exe>>"%temp%\TEMP.bat"

::vbs to run script invisibly, "nircmd.exe exec hide" can run hidden but not hide+wait
echo Set ws = WScript.CreateObject("WScript.Shell")>"%temp%\temp.vbs"
echo cmd = "%temp%\TEMP.bat">>"%temp%\temp.vbs"
echo ret = ws.Run(cmd, 0, True)>>"%temp%\temp.vbs"
echo Set ws = Nothing>>"%temp%\temp.vbs"


cd /d "%temp%"
start temp.vbs
::start TEMP.bat
goto:fin


:KeepUninstaller
::need to retain custom uninstaller files at this point



echo @echo off>"%temp%\TEMP.bat"
echo @ping 127.0.0.1 -n 2 -w 1000^> nul>>"%temp%\TEMP.bat"

::move to root modmii folder before deleting Support
echo if exist "%cd%\Support\icon.ico" move /y "%cd%\Support\icon.ico" "%cd%\icon.ico"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\Support\sfk.exe" move /y "%cd%\Support\sfk.exe" "%cd%\sfk.exe"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\Support\nircmd.exe" move /y "%cd%\Support\nircmd.exe" "%cd%\nircmd.exe"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\Support\hexalter.exe" move /y "%cd%\Support\hexalter.exe" "%cd%\hexalter.exe"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\Support\subscripts\Uninstaller.hta" move /y "%cd%\Support\subscripts\Uninstaller.hta" "%cd%\Uninstaller.hta"^>nul>>"%temp%\TEMP.bat"
::don't delete\move current bat while running, need to use copy command instead of move UNLESS running from a separate temp.bat
echo if exist "%cd%\Support\subscripts\Uninstaller.bat" move /y "%cd%\Support\subscripts\Uninstaller.bat" "%cd%\Uninstaller.bat"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\Support\uninstall.dat" move /y "%cd%\Support\uninstall.dat" "%cd%\uninstall.dat"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\Support\uninstall_l.ifl" move /y "%cd%\Support\uninstall_l.ifl" "%cd%\uninstall_l.ifl"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\Support\Uninstall2.exe" move /y "%cd%\Support\Uninstall2.exe" "%cd%\Uninstall2.exe"^>nul>>"%temp%\TEMP.bat"

echo rd /s /q "%cd%\Support"^> nul>>"%temp%\TEMP.bat"

echo if not exist "%cd%\Support\subscripts" mkdir "%cd%\Support\subscripts">>"%temp%\TEMP.bat"

echo if exist "%cd%\uninstall.dat" move /y "%cd%\uninstall.dat" "%cd%\Support\uninstall.dat"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\uninstall_l.ifl" move /y "%cd%\uninstall_l.ifl" "%cd%\Support\uninstall_l.ifl"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\Uninstall2.exe" move /y "%cd%\Uninstall2.exe" "%cd%\Support\Uninstall2.exe"^>nul>>"%temp%\TEMP.bat"

echo if exist "%cd%\icon.ico" move /y "%cd%\icon.ico" "%cd%\Support\icon.ico"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\sfk.exe" move /y "%cd%\sfk.exe" "%cd%\Support\sfk.exe"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\nircmd.exe" move /y "%cd%\nircmd.exe" "%cd%\Support\nircmd.exe"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\hexalter.exe" move /y "%cd%\hexalter.exe" "%cd%\Support\hexalter.exe"^>nul>>"%temp%\TEMP.bat"

echo if exist "%cd%\Uninstaller.hta" move /y "%cd%\Uninstaller.hta" "%cd%\Support\subscripts\Uninstaller.hta"^>nul>>"%temp%\TEMP.bat"
echo if exist "%cd%\Uninstaller.bat" move /y "%cd%\Uninstaller.bat" "%cd%\Support\subscripts\Uninstaller.bat"^>nul>>"%temp%\TEMP.bat"


::vbs to run script invisibly, "nircmd.exe exec hide" can run hidden but not hide+wait
echo Set ws = WScript.CreateObject("WScript.Shell")>"%temp%\temp.vbs"
echo cmd = "%temp%\TEMP.bat">>"%temp%\temp.vbs"
echo ret = ws.Run(cmd, 0, True)>>"%temp%\temp.vbs"
echo Set ws = Nothing>>"%temp%\temp.vbs"

cd /d "%temp%"
start temp.vbs
::start TEMP.bat
goto:fin


:skipmodmii


::check if everything uninstalled (except temp, copy_to_sd and copy_to_usb), and clean up if necessary
if exist "Program Files\" goto:fin
if exist "ModMii.exe" goto:fin

goto:FullClean


:fin
::echo Finished
::pause
