::OSCmode; list, download, update
if "%OSCmode%"=="" set OSCmode=download
if "%code1%"=="" set code1=all
::set OSCmode=update

if /i "%OSCmode%" EQU "list" (echo Checking for OSC Wii App updates...) & (echo.)

set OSCcount=1
set OSCcountSuccess=0
set OSCcountFail=0
set OSCcountCurrent=0
set OSCcountSkip=0

if /i "%OSCmode%" NEQ "download" set AUSKIP=OFF

if exist "temp\Apps-master.zip" del "temp\Apps-master.zip">nul
if exist "temp\OSCupdateList.txt" del "temp\OSCupdateList.txt">nul

if /i "%OSCmode%" EQU "update" goto:keepcontents
if exist "temp\contents\" rd /s /q temp\contents



if /i "%code1%" NEQ "all" set "CurrentApp=%code1%"
if /i "%code1%" NEQ "all" goto:exists

support\wget --no-check-certificate -q -t 3 -O "temp\Apps-master.zip" "https://codeload.github.com/OpenShopChannel/Apps/zip/refs/heads/master"

if exist temp\Apps-master.zip support\7za e -aoa temp\Apps-master.zip -otemp\contents Apps-master\contents\*.oscmeta -r>nul



if exist "temp\contents" goto:skiperror
support\sfk echo [%magentatext%] Download Failed
echo.
if "%DRIVErestore%"=="" set "DRIVErestore=%Drive%"
set "DRIVE=%DRIVErestore%"
echo "support\sfk echo %name%: [%redtext%]Failed">>temp\ModMii_Log.bat
goto:bottom
:skiperror



::remove individual OSC updating apps from OSC Complete Library queue if also toggled, these will only ever be toggled in download mode
if /i "%Pri%" EQU "*" del "temp\contents\priiloader.oscmeta">nul
if /i "%Pri%" EQU "*" del "temp\contents\LoadPriiloader.oscmeta">nul
if /i "%WiiMC%" EQU "*" del "temp\contents\WiiMC-SS.oscmeta">nul
if /i "%fceugx%" EQU "*" del "temp\contents\fceugx.oscmeta">nul
if /i "%snes9xgx%" EQU "*" del "temp\contents\snes9xgx.oscmeta">nul
if /i "%vbagx%" EQU "*" del "temp\contents\vbagx.oscmeta">nul
if /i "%SGM%" EQU "*" del "temp\contents\SaveGame_Manager_GX.oscmeta">nul
if /i "%WIIX%" EQU "*" del "temp\contents\wiixplorer.oscmeta">nul
if /i "%WII64%" EQU "*" del "temp\contents\wii64.oscmeta">nul
if /i "%Not64%" EQU "*" del "temp\contents\not64.oscmeta">nul
if /i "%WIISX%" EQU "*" del "temp\contents\WiiSXRX.oscmeta">nul
if /i "%usbgx%" EQU "*" del "temp\contents\usbloader_gx.oscmeta">nul
if /i "%Nintendont%" EQU "*" del "temp\contents\Nintendont.oscmeta">nul
if /i "%FLOW%" EQU "*" del "temp\contents\wiiflow.oscmeta">nul
if /i "%MyM%" EQU "*" del "temp\contents\MyMenuifyMod.oscmeta">nul
if /i "%yawm%" EQU "*" del "temp\contents\yawmME.oscmeta">nul
if /i "%syscheck%" EQU "*" del "temp\contents\SysCheckME.oscmeta">nul
if /i "%ARC%" EQU "*" del "temp\contents\ARCME.oscmeta">nul
if /i "%ftpii%" EQU "*" del "temp\contents\ftpii.oscmeta">nul
if /i "%CleanRip%" EQU "*" del "temp\contents\CleanRip.oscmeta">nul
if /i "%vWii80Installer%" EQU "*" del "temp\contents\Patched_IOS80_Installer_for_vWii.oscmeta">nul
if /i "%HBB%" EQU "*" del "temp\contents\homebrew_browser.oscmeta">nul
if /i "%v43DB%" EQU "*" del "temp\contents\ww-43db-patcher.oscmeta">nul
if /i "%SCR%" EQU "*" del "system-channel-restorer.oscmeta">nul
if /i "%usbfolder%" EQU "*" del "temp\contents\usb-loader.oscmeta">nul
if /i "%csminstaller%" EQU "*" del "temp\contents\csm-installer.oscmeta">nul
if /i "%DumpMii%" EQU "*" del "temp\contents\nanddumper_ios.oscmeta">nul

::also exclude postloader if toggled as the versions provided by ModMii are better
if /i "%postLoader%" EQU "*" del "temp\contents\postloader.oscmeta">nul

:keepcontents
::if also doing file cleanup, don't update certain apps from OSCwii
if /i "%OSCmode%" NEQ "update" goto:skip
if /i "%clean%" NEQ "B" goto:skip
if not exist temp\CleanItems.txt goto:skip
findStr /X /C:"\apps\Priiloader" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\priiloader.oscmeta" del "temp\contents\priiloader.oscmeta">nul
findStr /X /C:"\apps\LoadPriiloader" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\LoadPriiloader.oscmeta" del "temp\contents\LoadPriiloader.oscmeta">nul
findStr /X /C:"\apps\homebrew_browser" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\homebrew_browser.oscmeta" del "temp\contents\homebrew_browser.oscmeta">nul
findStr /X /C:"\apps\WiiXplorer" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\wiixplorer.oscmeta" del "temp\contents\wiixplorer.oscmeta">nul
findStr /X /C:"\apps\WiiModLite" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\WiiModLite.oscmeta" del "temp\contents\WiiModLite.oscmeta">nul
findStr /X /C:"\apps\MyMenuifyMod" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\MyMenuifyMod.oscmeta" del "temp\contents\MyMenuifyMod.oscmeta">nul
findStr /X /C:"\apps\csm-installer" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\csm-installer.oscmeta" del "temp\contents\csm-installer.oscmeta">nul
findStr /X /C:"\apps\some-yawmm-mod" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\some-yawmm-mod.oscmeta" del "temp\contents\some-yawmm-mod.oscmeta">nul
findStr /X /C:"\apps\AnyGlobe_Changer" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\AnyGlobe_Changer.oscmeta" del "temp\contents\AnyGlobe_Changer.oscmeta">nul
findStr /X /C:"\apps\AnyTitleDeleterMOD" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\AnyTitleDeleterMOD.oscmeta" del "temp\contents\AnyTitleDeleterMOD.oscmeta">nul
findStr /X /C:"\apps\Wii_Mini_Ethernet_Enable" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\Wii_Mini_Ethernet_Enable.oscmeta" del "temp\contents\Wii_Mini_Ethernet_Enable.oscmeta">nul
findStr /X /C:"\apps\ForecastPatcher" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\ForecastPatcher.oscmeta" del "temp\contents\ForecastPatcher.oscmeta">nul
findStr /X /C:"\apps\WiiLink-NC-Patcher" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\WiiLink-NC-Patcher.oscmeta" del "temp\contents\WiiLink-NC-Patcher.oscmeta">nul
findStr /X /C:"\apps\wiixplorer-ss" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\wiixplorer-ss.oscmeta" del "temp\contents\wiixplorer-ss.oscmeta">nul
findStr /X /C:"\apps\ARCME" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\ARCME.oscmeta" del "temp\contents\ARCME.oscmeta">nul
findStr /X /C:"\apps\yawmME" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\yawmME.oscmeta" del "temp\contents\yawmME.oscmeta">nul
findStr /X /C:"\apps\d2x-cios-installer" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\d2x-cios-installer.oscmeta" del "temp\contents\d2x-cios-installer.oscmeta">nul
findStr /X /C:"\apps\d2x-cios-installer-vwii" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 if exist "temp\contents\d2x-cios-installer-vwii.oscmeta" del "temp\contents\d2x-cios-installer-vwii.oscmeta">nul
:skip


::always exclude some mini apps if in download mode since these aren't supported by ModMii
if /i "%OSCmode%" NEQ "download" goto:skip
if exist "temp\contents\Wii_Mini_Ethernet_Enable.oscmeta" del "temp\contents\Wii_Mini_Ethernet_Enable.oscmeta">nul
if exist "temp\contents\RealWnD_Mini.oscmeta" del "temp\contents\RealWnD_Mini.oscmeta">nul
:skip

if not exist "temp\contents\*.oscmeta" (echo "echo %name%: Download Skipped">>temp\ModMii_Log.bat) & (goto:bottom)
dir "temp\contents\*.oscmeta" /b>temp\list.txt

set OSCtotal=0
for /f %%a in (temp\list.txt) do set /a OSCtotal+=1


::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\list.txt) do call :processOSClist %%A
goto:quickskip
:processOSClist
set CurrentApp=%*
set CurrentApp=%CurrentApp:~0,-8%

::if /i "%OSCmode%" EQU "download" support\sfk echo [%redtext%]Downloading %CURRENTDL% of %DLTOTAL%: %name%
if /i "%OSCmode%" NEQ "list" support\sfk echo [%cyantext%]OSC App %OSCcount% of %OSCtotal%: %CurrentApp%

if exist "%DRIVE%\apps\%CurrentApp%" goto:exists
if /i "%OSCmode%" EQU "download" if /i "%code1%" NEQ "all" goto:CompareMetas
if /i "%OSCmode%" EQU "download" if /i "%code1%" EQU "all" goto:checkskip
if /i "%OSCmode%" EQU "list" del "temp\contents\%CurrentApp%.oscmeta">nul
goto:EOF
:exists

if not exist "%DRIVE%\apps\%CurrentApp%" goto:CompareMetas

:checkskip
::check settings_skipped_apps.txt
if not exist Support\settings_skipped_apps.txt goto:NoUpdateSettings
findStr /I /C:":%CurrentApp%:" "Support\settings_skipped_apps.txt" >nul
IF ERRORLEVEL 1 goto:NoUpdateSettings


if /i "%OSCmode%" EQU "download" if /i "%code1%" EQU "all" support\sfk echo %CurrentApp%: [%yellowtext%]Skipping [def]as per ModMii settings...
if /i "%OSCmode%" NEQ "download" if /i "%code1%" EQU "all" support\sfk echo [%redtext%]%OSCcount%: [def]%CurrentApp%: [%yellowtext%]Skipping [def]as per ModMii settings...
if /i "%code1%" NEQ "all" support\sfk echo %CurrentApp%: [%yellowtext%]Skipping [def]as per ModMii settings...
if /i "%OSCmode%" EQU "download" echo.
if /i "%OSCmode%" NEQ "update" if exist "temp\contents\%CurrentApp%.oscmeta" del "temp\contents\%CurrentApp%.oscmeta">nul
if exist "%DRIVE%\apps\%CurrentApp%\" if not exist "%DRIVE%\apps\%CurrentApp%\SkipModMiiUpdates.txt" echo If this file is saved to an app's folder ModMii will not check it for updates>"%DRIVE%\apps\%CurrentApp%\SkipModMiiUpdates.txt"
if /i "%code1%" NEQ "all" echo "echo %name%: Found but skipped update check as per ModMii settings">>temp\ModMii_Log.bat
if /i "%code1%" NEQ "all" goto:bottom
set /a OSCcountSkip=%OSCcountSkip%+1
set /a OSCcount=%OSCcount%+1
goto:EOF
:NoUpdateSettings


::check for skip txt file
if not exist "%DRIVE%\apps\%CurrentApp%\SkipModMiiUpdates.txt" goto:NoSkipTxt
if /i "%code1%" EQU "all" support\sfk echo [%redtext%]%OSCcount%: [def]%CurrentApp% Detected, [%yellowtext%]skipping update check [def]as %CurrentApp%\SkipModMiiUpdates.txt was found...
if /i "%code1%" NEQ "all" support\sfk echo %CurrentApp% Detected, [%yellowtext%]skipping update check [def]as %CurrentApp%\SkipModMiiUpdates.txt was found...
if /i "%OSCmode%" EQU "download" echo.
if /i "%OSCmode%" NEQ "update" if exist "temp\contents\%CurrentApp%.oscmeta" del "temp\contents\%CurrentApp%.oscmeta">nul
echo :%CurrentApp%:>>Support\settings_skipped_apps.txt
support\sfk filter -spat "Support\settings_skipped_apps.txt" -unique -no-empty-lines -no-blank-lines -write -yes>nul
if /i "%code1%" NEQ "all" echo "echo %name%: Found but skipped update check as per ModMii settings">>temp\ModMii_Log.bat
if /i "%code1%" NEQ "all" goto:bottom
set /a OSCcountSkip=%OSCcountSkip%+1
set /a OSCcount=%OSCcount%+1
goto:EOF
:NoSkipTxt



:CompareMetas
if /i "%OSCmode%" EQU "list" support\sfk echo [%redtext%]%OSCcount%: [def]%CurrentApp% Detected, checking for updates...

if exist temp\7zalog.txt del temp\7zalog.txt>nul
if exist temp\meta.xml del temp\meta.xml>nul
if exist temp\version.txt del temp\version.txt>nul
set CurrentAppVersion=
set LatestVersion=
set CachedVersion=nulll

::if no meta, boot.dol or boot.elf then force update
if not exist "%DRIVE%\apps\%CurrentApp%\meta.xml" (echo No meta.xml detected, updating app now...) & (goto:downloadOSC)
if exist "%DRIVE%\apps\%CurrentApp%\boot.dol" goto:continue
if exist "%DRIVE%\apps\%CurrentApp%\boot.elf" goto:continue
echo No boot.dol or boot.elf detected, updating app now...
goto:downloadOSC
:continue

::below fixes meta's that have 00 bytes and may make the OHBC 1.1.4 or ModMii crash upon inspecting the meta
support\sfk replace "%DRIVE%\apps\%CurrentApp%\meta.xml" -binary /00// -yes>nul
support\sfk filter -quiet "%DRIVE%\apps\%CurrentApp%\meta.xml" -+"/version" -rep _"*<version>"__ -rep _"</version*"__ -rep _"&"__ >temp\version.txt
set /p CurrentAppVersion= <temp\version.txt
if /i "%CurrentAppVersion:~0,1%" EQU "v" set "CurrentAppVersion=%CurrentAppVersion:~1%"
if exist temp\version.txt del temp\version.txt>nul

::WHEN GX r1283 IS RELEASED THE LINES BELOW CAN BE REMOVED (until ":notGX")
::compensate for GX "v4.0 r1282" (test versions)
if /i "%CurrentApp%" NEQ "usbloader_gx" goto:notGX
if exist "%DRIVE%\apps\usbloader_gx\DO NOT REUPLOAD.txt" del "%DRIVE%\apps\usbloader_gx\DO NOT REUPLOAD.txt">nul
if /i "%CurrentAppVersion%" NEQ "4.0 r1282" goto:notGX
findStr /I /C:"release_date>202503" "%DRIVE%\apps\usbloader_gx\meta.xml" >nul
IF NOT ERRORLEVEL 1 set "CurrentAppVersion=v%CurrentAppVersion% test version"
::added v prefix back to the above to force "v4.0 r1282 test version" to appear older than "4.0 r1282"
:notGX

if /i "%OSCmode%" NEQ "list" echo Found version: %CurrentAppVersion%
if /i "%AUSKIP%" EQU "ON" goto:downloadOSC

::https://hbb1.oscwii.org/api/v3/contents/%CurrentApp%/%CurrentApp%.zip
::https://hbb1.oscwii.org/unzipped_apps/%CurrentApp%/apps/%CurrentApp%/meta.xml

::get latest meta version
if exist temp\meta.xml del temp\meta.xml>nul

support\wget --no-check-certificate -q -t 3 -O "temp\meta.xml" "https://hbb1.oscwii.org/unzipped_apps/%CurrentApp%/apps/%CurrentApp%/meta.xml"
::delete if file is empty (if empty)
>nul findstr "^" "temp\meta.xml" || del "temp\meta.xml"

::if cannot find meta online, check if zip cached in temp folder
if exist temp\meta.xml goto:metafound
if exist "temp\%CurrentApp%.zip" support\7za e -aoa "temp\%CurrentApp%.zip" -o"temp" meta.xml -r>nul
if not exist temp\meta.xml goto:downloadOSC
:metafound

::below fixes meta's that have 00 bytes and may make the OHBC 1.1.4 or ModMii crash upon inspecting the meta
support\sfk replace "temp\meta.xml" -binary /00// -yes>nul
support\sfk filter -quiet "temp\meta.xml" -+"/version" -rep _"*<version>"__ -rep _"</version*"__ -rep _"&"__ >temp\version.txt
set /p LatestVersion= <temp\version.txt
if /i "%LatestVersion:~0,1%" EQU "v" set "LatestVersion=%LatestVersion:~1%"

if exist temp\version.txt del temp\version.txt>nul
if exist temp\meta.xml del temp\meta.xml>nul


if /i "%OSCmode%" NEQ "list" echo Latest version: %LatestVersion%

::check for version numbers that are greater or equal
::check for when version info is formatted properly
call Support\subscripts\CompareVersions.bat "%CurrentAppVersion%" "%LatestVersion%"
if /i "%CompareResult%" EQU "EQU" goto:UpToDate
if /i "%CompareResult%" EQU "GTR" goto:newershit

if /i "%CurrentAppVersion%" NEQ "%LatestVersion%" goto:skip
:UpToDate
if /i "%OSCmode%" EQU "list" goto:miniskip
support\sfk echo [%greentext%]App is up to date
echo.
if /i "%code1%" NEQ "all" echo "echo %name%: Up to date (%LatestVersion%)">>temp\ModMii_Log.bat
:miniskip

set /a OSCcountCurrent=%OSCcountCurrent%+1
set /a OSCcount=%OSCcount%+1
if /i "%OSCmode%" EQU "list" del "temp\contents\%CurrentApp%.oscmeta">nul
if /i "%code1%" NEQ "all" goto:bottom
goto:EOF
:skip

::check for version numbers that are greater
::check for when version info is NOT formatted properly
if /i "%CurrentAppVersion%" LSS "9999999999999999999999" (set "CurrentAppVersion=%CurrentAppVersion%") else (goto:notnum)
if /i "%LatestVersion%" LSS "9999999999999999999999" (set "LatestVersion=%LatestVersion%") else (goto:notnum)
::above is not a perfect check for numbers, but serves this purpose well

::remove periods, check str length and pad shorter one with 0s to make equal, and prepend 1
set "CurrentAppVersionZ=%CurrentAppVersion:.=%"
set "LatestVersionZ=%LatestVersion:.=%"

::get string length
(echo "%CurrentAppVersionZ%" & echo.) | findstr /O . | more +1 | (set /P RESULT= & call exit /B %%RESULT%%)
set /A str1len=%ERRORLEVEL%-5

(echo "%LatestVersionZ%" & echo.) | findstr /O . | more +1 | (set /P RESULT= & call exit /B %%RESULT%%)
set /A str2len=%ERRORLEVEL%-5

:checkagain
if /i %str1len% LSS %str2len% (set /A str1len+=1) & (set "CurrentAppVersionZ=0%CurrentAppVersionZ%")
if /i %str1len% GTR %str2len% (set /A str2len+=1) & (set "LatestVersionZ=0%LatestVersionZ%")
if /i %str1len% NEQ %str2len% goto:checkagain

if /i "1%CurrentAppVersionZ%" LSS "1%LatestVersionZ%" goto:notnum

::found newer version!
:newershit
if /i "%OSCmode%" EQU "list" goto:miniskip
if /i "%code1%" NEQ "all" echo "echo %name%: Detected newer version than on OSC (%CurrentAppVersion% vs %LatestVersion%)">>temp\ModMii_Log.bat
:miniskip
support\sfk echo [%greentext%]Detected newer version than on OSC (%CurrentAppVersion% vs %LatestVersion%)
if /i "%OSCmode%" NEQ "list" echo.
set /a OSCcountCurrent=%OSCcountCurrent%+1
set /a OSCcount=%OSCcount%+1
if /i "%OSCmode%" EQU "list" del "temp\contents\%CurrentApp%.oscmeta">nul
if /i "%code1%" NEQ "all" goto:bottom
goto:EOF
:skip

:notnum


if /i "%OSCmode%" NEQ "list" (echo Updating...) & (goto:downloadOSC)


::OSCmode=list & update exists
set /a OSCcount=%OSCcount%+1
echo %CurrentApp%: update from %CurrentAppVersion% to %LatestVersion%>>temp\OSCupdateList.txt
if /i "%code1%" NEQ "all" goto:bottom
goto:EOF


::download
:downloadOSC

::check if cached zip is latest
if exist temp\meta.xml del temp\meta.xml>nul
if not exist "temp\%CurrentApp%.zip" goto:nocached
support\7za e -aoa "temp\%CurrentApp%.zip" -o"temp" meta.xml -r>nul
::below fixes meta's that have 00 bytes and may make the OHBC 1.1.4 or ModMii crash upon inspecting the meta
if not exist temp\meta.xml goto:nocached
support\sfk replace "temp\meta.xml" -binary /00// -yes>nul
support\sfk filter -quiet "temp\meta.xml" -+"/version" -rep _"*<version>"__ -rep _"</version*"__ -rep _"&"__ >temp\version.txt
set /p CachedVersion= <temp\version.txt
if /i "%CachedVersion:~0,1%" EQU "v" set "CachedVersion=%CachedVersion:~1%"
if exist temp\version.txt del temp\version.txt>nul
if exist temp\meta.xml del temp\meta.xml>nul

::force using cached version if AUSKIP enabled
if /i "%AUSKIP%" NEQ "ON" goto:skipthis
if /i "%OSCmode%" NEQ "list" echo Auto-Update Skip (AU) Option Enabled; skipping update check and using cached version
if /i "%OSCmode%" NEQ "list" echo Cached version: %CachedVersion%
set "LatestVersion=%CachedVersion%"


::check for version numbers that are greater or equal
::check for when version info is formatted properly
call Support\subscripts\CompareVersions.bat "%CurrentAppVersion%" "%CachedVersion%"
if /i "%CompareResult%" EQU "EQU" goto:UpToDate
if /i "%CompareResult%" EQU "GTR" goto:newershit

if /i "%CurrentAppVersion%" NEQ "%CachedVersion%" goto:skip
:UpToDate
if /i "%OSCmode%" EQU "list" goto:miniskip
set /a OSCcountCurrent=%OSCcountCurrent%+1
support\sfk echo [%greentext%]App is up to date with cached version
echo.
if /i "%code1%" NEQ "all" echo "echo %name%: Up to date with cached version (%LatestVersion%)">>temp\ModMii_Log.bat
:miniskip

set /a OSCcount=%OSCcount%+1
if /i "%code1%" NEQ "all" goto:bottom
goto:EOF
:skip


::check for version numbers that are greater
::check for when version info is NOT formatted properly
if /i "%CurrentAppVersion%" LSS "9999999999999999999999" (set "CurrentAppVersion=%CurrentAppVersion%") else (goto:notnum)
if /i "%CachedVersion%" LSS "9999999999999999999999" (set "CachedVersion=%CachedVersion%") else (goto:notnum)
::above is not a perfect check for numbers, but serves this purpose well

::remove periods, check str length and pad shorter one with 0s to make equal, and prepend 1
set "CurrentAppVersionZ=%CurrentAppVersion:.=%"
set "CachedVersionZ=%CachedVersion:.=%"

::get string length
(echo "%CurrentAppVersionZ%" & echo.) | findstr /O . | more +1 | (set /P RESULT= & call exit /B %%RESULT%%)
set /A str1len=%ERRORLEVEL%-5

(echo "%CachedVersionZ%" & echo.) | findstr /O . | more +1 | (set /P RESULT= & call exit /B %%RESULT%%)
set /A str2len=%ERRORLEVEL%-5

:checkagain2
if /i %str1len% LSS %str2len% (set /A str1len+=1) & (set "CurrentAppVersionZ=0%CurrentAppVersionZ%")
if /i %str1len% GTR %str2len% (set /A str2len+=1) & (set "CachedVersionZ=0%CachedVersionZ%")
if /i %str1len% NEQ %str2len% goto:checkagain2

if /i "1%CurrentAppVersionZ%" LSS "1%CachedVersionZ%" goto:notnum

::found newer version!
:newershit
if /i "%OSCmode%" EQU "list" goto:miniskip
if /i "%code1%" NEQ "all" echo "echo %name%: Detected newer version than cached (%CurrentAppVersion% vs %CachedVersion%)">>temp\ModMii_Log.bat
:miniskip

support\sfk echo [%greentext%]Detected newer version than cached (%CurrentAppVersion% vs %CachedVersion%)
if /i "%OSCmode%" NEQ "list" echo.
set /a OSCcountCurrent=%OSCcountCurrent%+1
set /a OSCcount=%OSCcount%+1
if /i "%OSCmode%" EQU "list" del "temp\contents\%CurrentApp%.oscmeta">nul
if /i "%code1%" NEQ "all" goto:bottom
goto:EOF
:skip

:notnum




goto:nocached
:skipthis

::get LatestVersion if not retrieved earlier
if not "%LatestVersion%"=="" goto:nocached

support\wget --no-check-certificate -q -t 3 -O "temp\meta.xml" "https://hbb1.oscwii.org/unzipped_apps/%CurrentApp%/apps/%CurrentApp%/meta.xml"


::delete if file is empty (if empty)
>nul findstr "^" "temp\meta.xml" || del "temp\meta.xml"
if not exist temp\meta.xml (set "LatestVersion=%CachedVersion%") & (goto:nocached)

::below fixes meta's that have 00 bytes and may make the OHBC 1.1.4 or ModMii crash upon inspecting the meta
support\sfk replace "temp\meta.xml" -binary /00// -yes>nul
support\sfk filter -quiet "temp\meta.xml" -+"/version" -rep _"*<version>"__ -rep _"</version*"__ -rep _"&"__ >temp\version.txt
set /p LatestVersion= <temp\version.txt
if /i "%LatestVersion:~0,1%" EQU "v" set "LatestVersion=%LatestVersion:~1%"
if exist temp\version.txt del temp\version.txt>nul
if exist temp\meta.xml del temp\meta.xml>nul
:nocached

set /a OSCcount=%OSCcount%+1
::download only if not already cached
::GX won't primarily be downloaded from oscwii.org by special request from its developer
if /i "%LatestVersion%" EQU "%CachedVersion%" goto:jump
if /i "%CurrentApp%" NEQ "usbloader_gx" support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\%CurrentApp%.zip" "https://hbb1.oscwii.org/api/contents/%CurrentApp%/%CurrentApp%.zip"
if /i "%CurrentApp%" NEQ "usbloader_gx" goto:jump

::parse github api to get actual latest DL link
if not "%gxURL%"=="" goto:halfjump
if exist "temp\gx.json" del "temp\gx.json">nul
support\wget --no-check-certificate -q -t 3 -O "temp\gx.json" "https://api.github.com/repos/wiidev/usbloadergx/releases/latest"
support\sfk filter "temp\gx.json" -+"browser_download_url" +filter -spat -le+".zip\x22" -rep _*http_http_ -rep _\x22__ > temp\latest2.json
set /p gxURL= <"temp\latest2.json"
if "%gxURL%"=="" set "gxURL=https://hbb1.oscwii.org/api/contents/%CurrentApp%/%CurrentApp%.zip"
if exist "temp\gx.json" del "temp\gx.json">nul
if exist "temp\latest2.json" del "temp\latest2.json">nul
:halfjump
support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\%CurrentApp%.zip" "%gxURL%"
:jump

if exist "temp\%CurrentApp%.zip" support\7za x -aoa "temp\%CurrentApp%.zip" -o"%Drive%" -x!__MACOSX -x!readme* -x!gcmm_1.5.2 -x!history.txt -x!*license.txt -x!READ.MII -x!manual.html -x!"Homebrew Browser Guide and Help" -x!src -x!gpl.txt -x!LICENSE -x!WiiPhysics_Readme.txt -x!"apps\.DS_Store" -x!"wii7800\wii7800.conf" >temp\7zalog.txt

if not exist temp\7zalog.txt goto:fail
findStr /I /C:"Everything is Ok" "temp\7zalog.txt" >nul
IF ERRORLEVEL 1 goto:fail
if not exist "%DRIVE%\apps\%CurrentApp%\meta.xml" goto:fail


::pass

::next 2 lines will count apps that were redownloaded in LIST mode due to missing meta or boot files
if /i "%OSCmode%" EQU "list" set /a OSCcountCurrent=%OSCcountCurrent%+1
if /i "%OSCmode%" EQU "list" set /a OSCcount=%OSCcount%+1

if exist temp\7zalog.txt del temp\7zalog.txt>nul
if "%LatestVersion%"=="" (support\sfk echo [%greentext%]Download Successful) & goto:microskip
if "%CurrentAppVersion%"=="" support\sfk echo [%greentext%]Downloaded %LatestVersion% Successfully
if not "%CurrentAppVersion%"=="" support\sfk echo [%greentext%]Updated Successfully
:microskip

if /i "%OSCmode%" NEQ "list" echo.
set /a OSCcountSuccess=%OSCcountSuccess%+1

if /i "%OSCmode%" EQU "list" goto:miniskip
if /i "%code1%" EQU "all" goto:miniskip
if "%LatestVersion%"=="" (echo "echo %name%: Downloaded">>temp\ModMii_Log.bat) & (goto:miniskip)
if "%CurrentAppVersion%"=="" echo "echo %name%: Downloaded %LatestVersion%">>temp\ModMii_Log.bat
if not "%CurrentAppVersion%"=="" echo "echo %name%: Updated from %CurrentAppVersion% to %LatestVersion%">>temp\ModMii_Log.bat
:miniskip

if /i "%code1%" NEQ "all" goto:bottom
goto:EOF


:fail
if exist temp\7zalog.txt del temp\7zalog.txt>nul
::if it fails, try deleting cached zip, so on next attempt if the zip is the issue it will fix itself
if exist "temp\%CurrentApp%.zip" del "temp\%CurrentApp%.zip">nul
support\sfk echo [%magentatext%]Download Failed, skipping....
echo.
set /a OSCcountFail=%OSCcountFail%+1

if /i "%OSCmode%" EQU "list" goto:miniskip
if /i "%code1%" EQU "all" goto:miniskip
echo "support\sfk echo %name%: [%redtext%]Missing">>temp\ModMii_Log.bat
:miniskip

if /i "%code1%" NEQ "all" goto:bottom
goto:EOF

:quickskip


::if /i "%OSCmode%" EQU "list" start notepad "temp\OSCupdateList.txt"
if /i "%OSCmode%" EQU "list" goto:noclean
::clean up

if not exist "%Drive%\postloader_historii.txt" goto:skip
if not exist "%Drive%\apps\postloader\" del "%Drive%\postloader_historii.txt">nul
if exist "%Drive%\postloader_historii.txt" move /Y "%Drive%\postloader_historii.txt" "%Drive%\apps\postloader\postloader_historii.txt">nul
:skip

if not exist "%Drive%\postloader_readmii.txt" goto:skip
if not exist "%Drive%\apps\postloader\" del "%Drive%\postloader_readmii.txt">nul
if exist "%Drive%\postloader_readmii.txt" move /Y "%Drive%\postloader_readmii.txt" "%Drive%\apps\postloader\postloader_readmii.txt">nul
:skip

if not exist "%Drive%\gnuboy-gx.txt" goto:skip
if not exist "%Drive%\apps\gnuboy\" del "%Drive%\gnuboy-gx.txt">nul
if exist "%Drive%\gnuboy-gx.txt" move /Y "%Drive%\gnuboy-gx.txt" "%Drive%\apps\gnuboy\gnuboy-gx.txt">nul
:skip

if not exist "%Drive%\Manual_HatariWii.pdf" goto:noclean
if not exist "%Drive%\apps\hatari\" del "%Drive%\Manual_HatariWii.pdf">nul
if exist "%Drive%\Manual_HatariWii.pdf" move /Y "%Drive%\Manual_HatariWii.pdf" "%Drive%\apps\hatari\Manual_HatariWii.pdf">nul
:noclean


if /i "%OSCmode%" NEQ "list" echo.
if /i "%OSCmode%" EQU "download" support\sfk echo [%greentext%]OSC Complete Wii App Library Download Finished
if /i "%OSCmode%" EQU "update" support\sfk echo [%greentext%]OSC App Updates Finished
if /i "%OSCmode%" NEQ "list" echo.

if /i "%OSCmode%" EQU "list" goto:bottom


if /i "%OSCmode%" NEQ "update" goto:notupdate

if /i "%OSCcountFail%" EQU "0" echo "echo %name%: %OSCcountSuccess% Downloaded\Updated">>temp\ModMii_Log.bat
if /i "%OSCcountFail%" NEQ "0" echo "echo %name%: %OSCcountSuccess% Downloaded\Updated and %OSCcountFail% Failed">>temp\ModMii_Log.bat
goto:bottom

:notupdate


if /i "%OSCcountSkip%" NEQ "0" goto:skip

if /i "%OSCcountFail%" EQU "0" echo "echo %name%: %OSCcountSuccess% Downloaded\Updated and %OSCcountCurrent% confirmed up to date or newer">>temp\ModMii_Log.bat
if /i "%OSCcountFail%" NEQ "0" echo "echo %name%: %OSCcountSuccess% Downloaded\Updated, %OSCcountCurrent% confirmed up to date or newer and %OSCcountFail% Failed">>temp\ModMii_Log.bat
goto:bottom

:skip

if /i "%OSCcountFail%" EQU "0" echo "echo %name%: %OSCcountSuccess% Downloaded\Updated, %OSCcountCurrent% up to date or newer and %OSCcountSkip% Skipped">>temp\ModMii_Log.bat
if /i "%OSCcountFail%" NEQ "0" echo "echo %name%: %OSCcountSuccess% Downloaded\Updated, %OSCcountCurrent% up to date or newer, %OSCcountSkip% Skipped and %OSCcountFail% Failed">>temp\ModMii_Log.bat


:bottom
::only for Syscheck updater, when downloading yawmme, ensure default wm_config is in place
if /i "%MENU1%" NEQ "SU" goto:bottom2
if /i "%code1%" NEQ "yawmME" goto:bottom2
if not exist "%DRIVE%\WAD\wm_config.txt" goto:skip

::check if config only has comments and blank lines, if so skip building a new config
support\sfk filter -quiet "%DRIVE%\WAD\wm_config.txt" -ls!";">temp\wm_config.txt
support\sfk filter "temp\wm_config.txt" -no-empty-lines -no-blank-lines -write -yes>nul
::delete if file is empty (if empty)
>nul findstr "^" "temp\wm_config.txt" || del "temp\wm_config.txt"
if not exist "temp\wm_config.txt" goto:bottom2

move /y "%DRIVE%\WAD\wm_config.txt" "%DRIVE%\WAD\wm_config_%random%.txt">nul

:skip
echo ;Config file format, No spaces precedes the keyword on a line>"%DRIVE%\WAD\wm_config.txt"
echo ;Password=>>"%DRIVE%\WAD\wm_config.txt"
echo ;StartupPath=/WAD>>"%DRIVE%\WAD\wm_config.txt"
echo ;cIOSVersion=249 >>"%DRIVE%\WAD\wm_config.txt"
echo ; FatDevice: sd usb usb2 gcsda gcsdb>>"%DRIVE%\WAD\wm_config.txt"
echo ;FatDevice=sd>>"%DRIVE%\WAD\wm_config.txt"
echo ; NANDDevice: Disable SD USB: Note that WM will prompt for NAND device only if you selected cIOS=249 >>"%DRIVE%\WAD\wm_config.txt"
echo ;NANDDevice=Disable>>"%DRIVE%\WAD\wm_config.txt"
echo ; Settings for SMB shares>>"%DRIVE%\WAD\wm_config.txt"
echo ;SMBUser=>>"%DRIVE%\WAD\wm_config.txt"
echo ;SMBPassword=>>"%DRIVE%\WAD\wm_config.txt"
echo ;SMBShare=>>"%DRIVE%\WAD\wm_config.txt"
echo ;SMBhostIP=>>"%DRIVE%\WAD\wm_config.txt"

:bottom2
if "%DRIVErestore%"=="" set "DRIVErestore=%Drive%"

::call settings to restore AUSKIP to default setting
if exist Support\settings.bat call Support\settings.bat

set "DRIVE=%DRIVErestore%"

echo %OSCcountCurrent% >temp\OSCcountCurrent.txt
echo %OSCcountSkip% >temp\OSCcountSkip.txt
