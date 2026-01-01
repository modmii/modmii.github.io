::HBASmode; list, download, update
if "%HBASmode%"=="" set HBASmode=download
if "%code1%"=="" set code1=all
::set HBASmode=update

if /i "%HBASmode%" EQU "list" (echo Checking for HBAS WiiU App updates...) & (echo This may take a minute or two...) & (echo.)

set HBAScount=1
set HBAScountSuccess=0
set HBAScountFail=0
set HBAScountCurrent=0
set HBAScountSkip=0

if /i "%HBASmode%" NEQ "download" set AUSKIP=OFF

::if exist "temp\Apps-master.zip" del "temp\Apps-master.zip">nul
if exist "temp\HBASupdateList.txt" del "temp\HBASupdateList.txt">nul
if exist "temp\info.json" del "temp\info.json">nul
if exist "temp\manifest.install" del "temp\manifest.install">nul

if /i "%HBASmode%" EQU "update" goto:keepcontents

if exist "temp\HBASname.txt" del "temp\HBASname.txt">nul
if exist "temp\HBASnameNumbered.txt" del "temp\HBASnameNumbered.txt">nul

::don't download repo more than once per day to save time
if not exist temp\repo.json goto:getrepos
if not exist temp\repo.summary goto:getrepos
if not exist temp\repo.date goto:getrepos
findStr /I /C:"%date%" "temp\repo.date" >nul
IF not ERRORLEVEL 1 goto:skiperror


:getrepos
if exist "temp\repo.json" del "temp\repo.json">nul
if exist "temp\repo.summary" del "temp\repo.summary">nul
if exist "temp\repo.date" del "temp\repo.date">nul
support\wget --no-check-certificate -q -t 3 -O "temp\repo.json" "https://wiiu.cdn.fortheusers.org/repo.json"
support\wget --no-check-certificate -q -t 3 -O "temp\repo.summary" "https://wiiu.cdn.fortheusers.org/repo.summary"

::delete if file is empty
>nul findstr "^" "temp\repo.json" || del "temp\repo.json"
>nul findstr "^" "temp\repo.summary" || del "temp\repo.summary"

::simple keyword check (in case of ISP blocking)
if exist "temp\repo.json" findStr /C:"wiiu/apps/" "temp\repo.json" >nul
IF ERRORLEVEL 1 (echo HBAS Server blocked or down?) & (del "temp\repo.json")
if exist "temp\repo.summary" findStr /C:"wiiu/apps/" "temp\repo.summary" >nul
IF ERRORLEVEL 1 (echo HBAS Server blocked or down?) & (del "temp\repo.summary")

if not exist "temp\repo.json" goto:error
if not exist "temp\repo.summary" goto:error

for /f %%i in ("temp\repo.summary") do set size=%%~zi
if %size% EQU 0 goto:error

for /f %%i in ("temp\repo.json") do set size=%%~zi
if %size% EQU 0 goto:error

echo %date% >temp\repo.date
goto:skiperror
:error
support\sfk echo [%magentatext%] Download Failed
echo.
if "%DRIVErestore%"=="" set "DRIVErestore=%Drive%"
set "DRIVE=%DRIVErestore%"
echo "support\sfk echo %name%: [%redtext%]Failed">>temp\ModMii_Log.bat
goto:bottom
:skiperror

::surround name in ?'s to avoid partial duplicates
support\sfk filter -spat -quiet "temp\repo.json" -+"\x22name\x22: \x22" -rep _"*\x22name\x22: \x22"_?_ -rep _"\x22*"_?_ >temp\HBASname.txt
::support\sfk filter -spat -quiet "temp\repo.summary" -+"\x22: [" -rep _"\x22: [*"_?_ -rep _"*\x22"_?_ >temp\HBASname.txt

::preserve numbered order, useful later
findstr /N . temp\HBASname.txt>temp\HBASnameNumbered.txt

::sort, cuz why not
sort temp\HBASname.txt /o temp\HBASname.txt

::remove more_ra_arcade & more_ra_cores (too large and niche) when in download mode (instead just exclude in default skipped apps list)
::if /i "%HBASmode%" EQU "download" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fmore_ra_arcade\x3f" -le!"\x3fmore_ra_cores\x3f" -write -yes

::to speed up "all" downloads, filter out skipped apps list FIRST (if this filter is removed, skipped apps will be reported as skipped during checks)
if /i "%code1%" NEQ "all" goto:notall
if not exist Support\settings_skipped_apps.txt goto:notall
::if empty move on
>nul findstr "^" "Support\settings_skipped_apps.txt" || goto:notall

::filter legacy category and surround name in ?'s to avoid partial duplicates
support\sfk filter -quiet "Support\settings_skipped_apps.txt" -ls+"?" >temp\settings_skipped_HBASapps.txt
>nul findstr "^" "temp\settings_skipped_HBASapps.txt" || goto:notall
support\sfk echo -spat [%yellowtext%]Note some HBAS Apps are being skipped as per your ModMii settings
echo.

::Loop through the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\settings_skipped_HBASapps.txt) do call :updatelist %%A
goto:notall
:updatelist
set CurrentApp=%*
support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"%CurrentApp%" -write -yes
goto:EOF
:notall
set CurrentApp=

::remove individual HBAS updating apps from HBAS Complete Library queue if also toggled, these will only ever be toggled in download mode
if /i "%Bloopair%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fBloopair-Tiramisu\x3f" -write -yes
if /i "%AccountSwap%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fWii-U-Account-Swap\x3f" -write -yes
if /i "%appstore%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fappstore\x3f" -write -yes
if /i "%SaveMiiModWUTPort%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fSaveMiiModWUTPort\x3f" -write -yes
if /i "%CompatTitleInstaller%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fCompatTitleInstaller\x3f" -write -yes
if /i "%Screenshot_WUPS%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fScreenshot_WUPS\x3f" -write -yes
if /i "%evWii%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fevWii\x3f" -write -yes
if /i "%wup_installer_gx2_wuhb%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fwup_installer_gx2_wuhb\x3f" -write -yes
if /i "%wudd%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fwudd\x3f" -write -yes
if /i "%WiiVCLaunch%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fWiiVCLaunch\x3f" -write -yes
if /i "%WiiUIdent%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fWiiUIdent\x3f" -write -yes
if /i "%Inkay%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fInkay\x3f" -write -yes
if /i "%GiveMiiYouTube%" EQU "*" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fGiveMiiYouTube\x3f" -write -yes

:keepcontents
::if also doing file cleanup, don't update certain apps from HBAS
if /i "%HBASmode%" NEQ "update" goto:skip
if /i "%clean%" NEQ "B" goto:skip
if not exist temp\CleanItems.txt goto:skip

findStr /X /C:"\wiiu\apps\UFDiine" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fUFDiine-wuhb\x3f" -write -yes
findStr /X /C:"\wiiu\apps\wim" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fwim\x3f" -write -yes
findStr /X /C:"\wiiu\apps\Wii-U-Account-Swap" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fWii-U-Account-Swap\x3f" -write -yes
findStr /X /C:"\wiiu\apps\compat_installer" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fCompatTitleInstaller\x3f" -write -yes
findStr /X /C:"\wiiu\apps\vwii-compat-installer" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fvwii-compat-installer\x3f" -write -yes
findStr /X /C:"\wiiu\apps\wupymod" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fwupymod\x3f" -write -yes
findStr /X /C:"\wiiu\apps\wup_installer_gx2_mod" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fwup_installer_gx2_mod\x3f" -write -yes
findStr /X /C:"\wiiu\apps\wup_installer_gx2" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fwup_installer_gx2_wuhb\x3f" -write -yes
findStr /X /C:"\wiiu\apps\wup_installer_gx2" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fwup_installer_gx2\x3f" -write -yes
findStr /X /C:"\wiiu\apps\wupinstaller" "temp\CleanItems.txt" >nul
IF NOT ERRORLEVEL 1 support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3fwupinstaller\x3f" -write -yes
:skip

::single app download support
if /i "%code1%" NEQ "all" echo ?%code1%?>temp\HBASname.txt
set HBAStotal=0
for /f %%a in (temp\HBASname.txt) do set /a HBAStotal+=1

if /i "%HBAStotal%" EQU "0" (echo "echo %name%: Download Skipped">>temp\ModMii_Log.bat) & (goto:bottom)

::Loop through the the following once for EACH line in *.txt
for /F "tokens=*" %%A in (temp\HBASname.txt) do call :processHBASlist %%A
goto:quickskip
:processHBASlist

set WiiUappName=%*
::remove surrounding ?'s
set WiiUappName=%WiiUappName:~1,-1%
set "CurrentApp=%WiiUappName%"
set PriorWiiUappName=


::snip manifest.install from repo.summary
if exist temp\HBASmanifest.install del temp\HBASmanifest.install>nul
support\sfk filter -spat -quiet "temp\repo.summary" -cut "*" to "\x22%WiiUappName%\x22:" -lerep _"\x22,*"__ -rep _"\x22"__ -rep _"*U:"_"U:"_ -rep _"*G:"_"G:"_ -rep _"*L:"_"L:"_ +filter -cut "]," to "*" >temp\HBASmanifest.install

::snip info.json from repo.json
if exist temp\HBASinfo.json del temp\HBASinfo.json >nul
if exist temp\temp.txt del temp\temp.txt>nul

set WiiUpriorNum=
findStr /I /C:"?%WiiUappName%?" "temp\HBASnameNumbered.txt">temp\temp.txt
support\sfk filter -quiet "temp\temp.txt" -rep _":?*"__ -write -yes
set /p WiiUpriorNum= <temp\temp.txt
set /a WiiUpriorNum=%WiiUpriorNum%-1
::echo WiiUpriorNum: %WiiUpriorNum%
if exist temp\temp.txt del temp\temp.txt>nul


if /i "%WiiUpriorNum%" EQU "0" (set PriorWiiUappName=) & (goto:skip)

findStr /I /B /C:"%WiiUpriorNum%:" "temp\HBASnameNumbered.txt">temp\temp.txt
support\sfk filter -quiet "temp\temp.txt" -rep _"*:?"__ -write -yes

set /p PriorWiiUappName= <temp\temp.txt
set "PriorWiiUappName=%PriorWiiUappName:~0,-1%"
::echo PriorWiiUappName: %PriorWiiUappName%
if exist temp\temp.txt del temp\temp.txt>nul

:skip



if "%PriorWiiUappName%"=="" support\sfk filter -spat -quiet "temp\repo.json" -cut "*" to "\x22packages\x22: [" +filter -cut- "*" to "{" +filter -cut- "*}," to "*" -rep _"*},*"_"}"_ -rep _"*{"_"{"_ -lsrep _"          "__ >temp\HBASinfo.json
if not "%PriorWiiUappName%"=="" support\sfk filter -spat -quiet "temp\repo.json" -cut "*" to "\x22name\x22: \x22%PriorWiiUappName%\x22," +filter -cut- "*" to "{" +filter -cut- "*}," to "*" -rep _"*},*"_"}"_ -rep _"*{"_"{"_ -lsrep _"          "__ >temp\HBASinfo.json



set file2check=

findStr /I /C:"/meta.xml" "temp\HBASmanifest.install" >nul
IF ERRORLEVEL 1 goto:skipmeta
::get meta path

support\sfk filter -quiet "temp\HBASmanifest.install" -+"meta.xml" -rep _"*: "__ -rep _/_\_ >temp\temp.txt
set /p file2check= <temp\temp.txt
::echo %file2check%

support\sfk filter -quiet -spat "temp\temp.txt" -rep _"\meta.xml*"__ -rep _"*\x5c"__ -write -yes
set /p CurrentApp= <temp\temp.txt


if exist temp\temp.txt del temp\temp.txt >nul

::above corrects CurrentApp and so manual method below no longer needed

::::%WiiUappName%	:%CurrentApp%
::::Name			:app_folder_name (containing meta.xml)
::::"CurrentApp" is WiiUappFolder, e.g. wiiu/apps/<CurrentApp>/meta.xml
::set "CurrentApp=%WiiUappName%"
::::CurrentApp overrides where they differ, any new apps added in the future should match
::if /i "%CurrentApp%" EQU "EnvSwap" set "CurrentApp=_EnvSwap"
::if /i "%CurrentApp%" EQU "CompatTitleInstaller" set "CurrentApp=compat_installer"
::if /i "%CurrentApp%" EQU "vWii_decaffeinator" set "CurrentApp=decaffeinator"
::if /i "%CurrentApp%" EQU "Crispy-Doom" set "CurrentApp=crispy-doom-u"
::if /i "%CurrentApp%" EQU "savemii_inject_mod" set "CurrentApp=savemii_injectmod"
::if /i "%CurrentApp%" EQU "Trogdor-Reburninated" set "CurrentApp=Trogdor-RB"
::if /i "%CurrentApp%" EQU "ftpiiu-cbhc" set "CurrentApp=fpiiu-cbhc"
::if /i "%CurrentApp%" EQU "Simple_SDL_Snake" set "CurrentApp=SDLSnake"
::if /i "%CurrentApp%" EQU "AM64DSPatcher" set "CurrentApp=am64ds"
::if /i "%CurrentApp%" EQU "TetrisU" set "CurrentApp=SDLTetrisU"
::if /i "%CurrentApp%" EQU "yapesdl" set "CurrentApp=yape"
::if /i "%CurrentApp%" EQU "WiiUScreenshotManager" set "CurrentApp=ScreenshotManager"
::if /i "%CurrentApp%" EQU "drc-test" set "CurrentApp=drctest"
::if /i "%CurrentApp%" EQU "Bloopair-Tiramisu" set "CurrentApp=Bloopair_pair_menu"
::if /i "%CurrentApp%" EQU "controller-test" set "CurrentApp=controllertest"

:skipmeta

if /i "%code1%" NEQ "all" goto:skipnote
if /i "%HBASmode%" NEQ "list" support\sfk echo [%cyantext%]HBAS App %HBAScount% of %HBAStotal%: %WiiUappName%
if /i "%HBASmode%" EQU "list" support\sfk echo [%redtext%]%HBAScount% of %HBAStotal%: [def]Scanning for %WiiUappName%...
:skipnote

if not "%file2check%"=="" goto:SkipFile2Check

::get binary (if not "none") from repo.json instead of manifest if possible

support\sfk filter -spat -quiet "temp\HBASinfo.json" -ls+"*\x22binary\x22: \x22" -rep _"*binary\x22: \x22"__ -rep _"\x22,*"__ >temp\temp.txt

::skip if empty
>nul findstr "^" "temp\temp.txt" || goto:skipthis

set /p file2check= <temp\temp.txt
if /i "%file2check:~0,1%" EQU "/" set "file2check=%file2check:~1%"
::echo %file2check%

if /i "%file2check%" NEQ "none" goto:SkipFile2Check
:skipthis

support\sfk filter -spat -quiet "temp\HBASmanifest.install" -!".png\x22" -!"wiiu/themes/THIS IS WHERE THE THEMES GO" -rep _"*: "__ >temp\temp.txt
set /p file2check= <temp\temp.txt
::echo %file2check%

:SkipFile2Check

if exist temp\temp.txt del temp\temp.txt >nul


if exist "%DRIVE%\%file2check%" goto:exists
::confirmed missing: clean up appstore packages info if applicable and remove from download load list if in list mode
if exist "%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%\" rd /s /q "%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%"
if /i "%HBASmode%" EQU "download" if /i "%code1%" NEQ "all" goto:CompareMetas
if /i "%HBASmode%" EQU "download" if /i "%code1%" EQU "all" goto:exists
::rather than dir'ing the temp\contents oscmeta files, apps to update when in "list mode" stored in temp\HBASname.txt
if /i "%HBASmode%" EQU "list" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3f%WiiUappName%\x3f" -write -yes
set /a HBAScount=%HBAScount%+1
goto:EOF
:exists


::check settings_skipped_apps.txt
if not exist Support\settings_skipped_apps.txt goto:NoUpdateSettings
findStr /I /C:"?%WiiUappName%?" "Support\settings_skipped_apps.txt" >nul
IF ERRORLEVEL 1 goto:NoUpdateSettings

support\sfk echo -spat \x20\x20 [%yellowtext%]Skipping [def]as per ModMii settings...
if /i "%HBASmode%" EQU "download" echo.

if /i "%HBASmode%" EQU "list" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3f%WiiUappName%\x3f" -write -yes

if not exist "%DRIVE%\wiiu\apps\%CurrentApp%\" goto:miniskip
if exist "%DRIVE%\wiiu\apps\%CurrentApp%\" if not exist "%DRIVE%\wiiu\apps\%CurrentApp%\SkipModMiiUpdates.txt" echo If this file is saved to an app's folder ModMii will not check it for updates>"%DRIVE%\wiiu\apps\%CurrentApp%\SkipModMiiUpdates.txt"
:miniskip
if /i "%code1%" NEQ "all" echo "echo %name%: Found but skipped update check as per ModMii settings">>temp\ModMii_Log.bat
if /i "%code1%" NEQ "all" goto:bottom
set /a HBAScountSkip=%HBAScountSkip%+1
set /a HBAScount=%HBAScount%+1
goto:EOF
:NoUpdateSettings


::check for skip txt file
if not exist "%DRIVE%\wiiu\apps\%CurrentApp%\SkipModMiiUpdates.txt" goto:NoSkipTxt
support\sfk echo -spat \x20\x20 App Detected, [%yellowtext%]skipping update check [def]as %CurrentApp%\SkipModMiiUpdates.txt was found...

if /i "%HBASmode%" EQU "download" echo.
if /i "%HBASmode%" EQU "list" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3f%WiiUappName%\x3f" -write -yes
echo ?%WiiUappName%?>>Support\settings_skipped_apps.txt
support\sfk filter -spat "Support\settings_skipped_apps.txt" -unique -no-empty-lines -no-blank-lines -write -yes>nul
if /i "%code1%" NEQ "all" echo "echo %name%: Found but skipped update check as per ModMii settings">>temp\ModMii_Log.bat
if /i "%code1%" NEQ "all" goto:bottom
set /a HBAScountSkip=%HBAScountSkip%+1
set /a HBAScount=%HBAScount%+1
goto:EOF
:NoSkipTxt



:CompareMetas
if /i "%HBASmode%" EQU "list" echo    App Detected, checking for updates...

if exist temp\7zalog.txt del temp\7zalog.txt>nul
if exist temp\meta.xml del temp\meta.xml>nul
if exist temp\version.txt del temp\version.txt>nul
set CurrentAppVersion=
set LatestVersion=
set CachedVersion=nulll
set LatestFiledate=
set Filedate=
set CachedFiledate=


::if meta exists, analyze that, otherwise use dates
if exist "%DRIVE%\wiiu\apps\%CurrentApp%\meta.xml" goto:checkSDmeta
if not exist "%DRIVE%\%file2check%" goto:skip


set "ModMiiDir=%cd%"
cd /d "%DRIVE%"

for %%x in ("%file2check%") do set filedate=%%~tx
set filedate=%filedate:~3,3%%filedate:~0,3%%filedate:~6,4%
::echo %filedate%
cd /d "%ModMiiDir%"

:skip
if /i "%AUSKIP%" EQU "ON" goto:downloadHBAS
goto:GetLatestVersion


:checkSDmeta

::below fixes meta's that have 00 bytes and may make the OHBC 1.1.4 or ModMii crash upon inspecting the meta
support\sfk replace "%DRIVE%\wiiu\apps\%CurrentApp%\meta.xml" -binary /00// -yes>nul
support\sfk filter -quiet "%DRIVE%\wiiu\apps\%CurrentApp%\meta.xml" -+"/version" -rep _"*<version>"__ -rep _"</version*"__ -rep _"&"__ >temp\version.txt
set /p CurrentAppVersion= <temp\version.txt
if /i "%CurrentAppVersion:~0,1%" EQU "v" set "CurrentAppVersion=%CurrentAppVersion:~1%"
if exist temp\version.txt del temp\version.txt>nul
if /i "%HBASmode%" NEQ "list" echo Found version: %CurrentAppVersion%
if /i "%AUSKIP%" EQU "ON" goto:downloadHBAS


:GetLatestVersion
support\sfk filter -spat -quiet "temp\HBASinfo.json" -ls+"*\x22version\x22: \x22" -rep _"*version\x22: \x22"__ -rep _"\x22,*"__ >temp\version.txt
set /p LatestVersion= <temp\version.txt
if /i "%LatestVersion:~0,1%" EQU "v" set "LatestVersion=%LatestVersion:~1%"
if exist temp\version.txt del temp\version.txt>nul
if exist temp\meta.xml del temp\meta.xml>nul


::if CurrentAppVersion is nul (or if Filedate is not nul), get DATE instead
if "%Filedate%"=="" goto:skip
::get date
support\sfk filter -spat -quiet "temp\HBASinfo.json" -ls+"*\x22appCreated\x22: \x22" -rep _"*appCreated\x22: \x22"__ -rep _"\x22,*"__ >temp\temp.txt
set /p LatestFiledate= <temp\temp.txt
if exist temp\temp.txt del temp\temp.txt>nul
::echo Actual Filedate: %Filedate%
::echo Date from repo.json and info.json: %LatestFiledate%
if /i "%Filedate%" EQU "%LatestFiledate%" set "CurrentAppVersion=%LatestVersion%"
:skip


if /i "%HBASmode%" EQU "list" goto:skip

if "%filedate%"=="" goto:miniskip
if not "%CurrentAppVersion%"=="" echo Found version: %CurrentAppVersion%
if "%CurrentAppVersion%"=="" echo Found version date: %filedate%
if "%CurrentAppVersion%"=="" echo Latest version: %LatestVersion%
:miniskip
if not "%CurrentAppVersion%"=="" goto:smallskip
if not "%LatestFiledate%"=="" echo Latest version date: %LatestFiledate%
:smallskip

if not "%CurrentAppVersion%"=="" echo Latest version: %LatestVersion%
:skip

if "%filedate%"=="" goto:miniskip
if "%CurrentAppVersion%"=="" (set "CurrentAppVersion=Unknown version: %Filedate%") & (goto:skip)
:miniskip

::check for version numbers that are greater or equal
::check for when version info is formatted properly
call Support\subscripts\CompareVersions.bat "%CurrentAppVersion%" "%LatestVersion%"
if /i "%CompareResult%" EQU "EQU" goto:UpToDate
if /i "%CompareResult%" EQU "GTR" goto:newershit
if /i "%CurrentAppVersion%" NEQ "%LatestVersion%" goto:skip
:UpToDate
if /i "%HBASmode%" EQU "list" goto:miniskip
support\sfk echo [%greentext%]App is up to date
echo.
if /i "%code1%" NEQ "all" echo "echo %name%: Up to date (%LatestVersion%)">>temp\ModMii_Log.bat
:miniskip

set /a HBAScountCurrent=%HBAScountCurrent%+1
set /a HBAScount=%HBAScount%+1
if /i "%HBASmode%" EQU "list" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3f%WiiUappName%\x3f" -write -yes

if not exist "%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%" mkdir "%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%"
if exist "temp\HBASinfo.json" move /y "temp\HBASinfo.json" "%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%\info.json">nul
if exist "temp\HBASmanifest.install" move /y "temp\HBASmanifest.install" "%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%\manifest.install">nul

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

:checkagain3
if /i %str1len% LSS %str2len% (set /A str1len+=1) & (set "CurrentAppVersionZ=0%CurrentAppVersionZ%")
if /i %str1len% GTR %str2len% (set /A str2len+=1) & (set "LatestVersionZ=0%LatestVersionZ%")
if /i %str1len% NEQ %str2len% goto:checkagain3

if /i "1%CurrentAppVersionZ%" LSS "1%LatestVersionZ%" goto:notnum

::found newer version!
:newershit
if /i "%HBASmode%" EQU "list" goto:miniskip
if /i "%code1%" NEQ "all" echo "echo %name%: Detected newer version than on HBAS (%CurrentAppVersion% vs %LatestVersion%)">>temp\ModMii_Log.bat
:miniskip
support\sfk echo [%greentext%]Detected newer version than on HBAS (%CurrentAppVersion% vs %LatestVersion%)
if /i "%HBASmode%" NEQ "list" echo.
set /a HBAScountCurrent=%HBAScountCurrent%+1
set /a HBAScount=%HBAScount%+1
if /i "%HBASmode%" EQU "list" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3f%WiiUappName%\x3f" -write -yes
if /i "%code1%" NEQ "all" goto:bottom
goto:EOF
:notnum


::check for DATES that are greater
if "%filedate%"=="" goto:notnum
if "%LatestFiledate%"=="" goto:notnum

::convert filedate from dd/mm/yyyy to yyyymmdd
set /a "LatestFiledateFixed=%LatestFiledate:~-4%%LatestFiledate:~3,2%%LatestFiledate:~0,2%"
set /a "filedateFixed=%filedate:~-4%%filedate:~3,2%%filedate:~0,2%"

::add 1 day to filedateFixed to compensate for dif timezones
set y=%filedate:~-4%
set m=%filedate:~3,2%
set d=%filedate:~0,2%

::unpad for :tomorrow to work properly
if /i "%d:~0,1%" EQU "0" set d=%d:~1%
if /i "%m:~0,1%" EQU "0" set m=%m:~1%

:tomorrow
   set /a d+=1

   if %d% gtr 31 (
      set d=1
      set /a m+=1

      if %m% gtr 12 (
         set m=1
         set /a y+=1
      )
   )
xcopy /d:%m%-%d%-%y% /h /l "%~f0" "%~f0\" >nul 2>&1 || goto:tomorrow

::pad m & d to 2 digits if needed
if /i "%d:~1,1%" EQU "" set d=0%d%
if /i "%m:~1,1%" EQU "" set m=0%m%

set /a "filedateFixedp1=%y%%m%%d%"
::echo %filedateFixedp1%


if %filedateFixedp1% LSS %LatestFiledateFixed% goto:notnum

::found newer version!
if /i "%HBASmode%" EQU "list" goto:miniskip2
if /i "%code1%" EQU "all" goto:miniskip
if %filedateFixedp1% EQU %LatestFiledateFixed% echo "echo %name%: App is up to date (actually 1 day older; likely timezone)">>temp\ModMii_Log.bat
if %filedateFixedp1% GTR %LatestFiledateFixed% echo "echo %name%: Detected newer version than on HBAS (%filedate% vs %LatestFiledate%)">>temp\ModMii_Log.bat
:miniskip

if %filedateFixedp1% EQU %LatestFiledateFixed% support\sfk echo [%greentext%]App is up to date (actually 1 day older; likely timezone)
if %filedateFixedp1% GTR %LatestFiledateFixed% support\sfk echo [%greentext%]Detected newer version than on HBAS (%filedate% vs %LatestFiledate%)
if /i "%HBASmode%" NEQ "list" echo.
:miniskip2

set /a HBAScountCurrent=%HBAScountCurrent%+1
set /a HBAScount=%HBAScount%+1
if /i "%HBASmode%" EQU "list" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3f%WiiUappName%\x3f" -write -yes
if /i "%code1%" NEQ "all" goto:bottom
goto:EOF
:notnum





if /i "%HBASmode%" NEQ "list" goto:downloadHBAS


::HBASmode=list & update exists
set /a HBAScount=%HBAScount%+1
if "%LatestFiledate%"=="" echo %WiiUappName%: update from %CurrentAppVersion% to %LatestVersion%>>temp\HBASupdateList.txt
if not "%LatestFiledate%"=="" echo %WiiUappName%: update from %CurrentAppVersion% to %LatestVersion% [%LatestFiledate%]>>temp\HBASupdateList.txt

if /i "%code1%" NEQ "all" goto:bottom
goto:EOF


::download
:downloadHBAS

::check if cached zip is latest
if exist temp\meta.xml del temp\meta.xml>nul
if not exist "temp\HBAS\%WiiUappName%.zip" goto:nocached
support\7za e -aoa "temp\HBAS\%WiiUappName%.zip" -o"temp" meta.xml -r>nul
if not exist temp\meta.xml goto:nometa
::below fixes meta's that have 00 bytes and may make the OHBC 1.1.4 or ModMii crash upon inspecting the meta
support\sfk replace "temp\meta.xml" -binary /00// -yes>nul
support\sfk filter -quiet "temp\meta.xml" -+"/version" -rep _"*<version>"__ -rep _"</version*"__ -rep _"&"__ >temp\version.txt
goto:SetCachedVersion
:nometa

::get cached version from info.json
if exist temp\info.json del temp\info.json>nul

support\7za e -aoa "temp\HBAS\%WiiUappName%.zip" -o"temp" info.json -r>nul
if not exist temp\info.json goto:nocached
support\sfk filter -spat -quiet "temp\info.json" -ls+"*\x22version\x22: \x22" -rep _"*version\x22: \x22"__ -rep _"\x22,*"__ >temp\version.txt


:SetCachedVersion
set /p CachedVersion= <temp\version.txt
if /i "%CachedVersion:~0,1%" EQU "v" set "CachedVersion=%CachedVersion:~1%"
if exist temp\version.txt del temp\version.txt>nul
if exist temp\meta.xml del temp\meta.xml>nul


::if CurrentAppVersion is nul (or if Filedate is not nul), get DATE instead
if "%Filedate%"=="" goto:skip
::get date
support\7za l "temp\HBAS\%WiiUappName%.zip" >temp\zip.txt
support\sfk filter -quiet "temp\zip.txt" -cut "*" to "----" -ls!"Listing archive:" -ls!"Path = " -le!"manifest.install" -le!"info.json" -le!"meta.xml" -le!"icon.png" -rep _-_/_ -rep _" *"__ -write -yes
set /p CachedFiledate= <temp\zip.txt
if exist temp\zip.txt del temp\zip.txt>nul

::echo Actual Filedate: %Filedate%
::echo Date from repo.json and info.json: %CachedFiledate%
if /i "%Filedate%" EQU "%CachedFiledate%" set "CurrentAppVersion=%CachedVersion%"
if "%CurrentAppVersion%"=="" set "CurrentAppVersion=Unknown version: %Filedate%"
:skip
if exist temp\info.json del temp\info.json>nul

::force using cached version if AUSKIP enabled
if /i "%AUSKIP%" NEQ "ON" goto:skipthis
echo Auto-Update Skip (AU) Option Enabled; skipping update check and using cached version
echo Cached version: %CachedVersion%
set "LatestVersion=%CachedVersion%"
set "LatestFiledate=%CachedFiledate%"


::check for version numbers that are greater or equal
::check for when version info is formatted properly
call Support\subscripts\CompareVersions.bat "%CurrentAppVersion%" "%CachedVersion%"
if /i "%CompareResult%" EQU "EQU" goto:UpToDate
if /i "%CompareResult%" EQU "GTR" goto:newershit

if /i "%CurrentAppVersion%" NEQ "%CachedVersion%" goto:skip
:UpToDate
set /a HBAScountCurrent=%HBAScountCurrent%+1
support\sfk echo [%greentext%]App is up to date with cached version
echo.
if /i "%code1%" NEQ "all" echo "echo %name%: Up to date with cached version (%CachedVersion%)">>temp\ModMii_Log.bat

if not exist "%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%" mkdir "%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%"
support\7za e -aoa "temp\HBAS\%WiiUappName%.zip" -o"%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%" info.json manifest.install -r >nul

set /a HBAScount=%HBAScount%+1
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

:checkagain4
if /i %str1len% LSS %str2len% (set /A str1len+=1) & (set "CurrentAppVersionZ=0%CurrentAppVersionZ%")
if /i %str1len% GTR %str2len% (set /A str2len+=1) & (set "CachedVersionZ=0%CachedVersionZ%")
if /i %str1len% NEQ %str2len% goto:checkagain4

if /i "1%CurrentAppVersionZ%" LSS "1%CachedVersionZ%" goto:notnum

::found newer version!
:newershit
if /i "%code1%" NEQ "all" echo "echo %name%: Detected newer version than cached (%CurrentAppVersion% vs %CachedVersion%)">>temp\ModMii_Log.bat

support\sfk echo [%greentext%]Detected newer version than cached (%CurrentAppVersion% vs %CachedVersion%)
echo.
set /a HBAScountCurrent=%HBAScountCurrent%+1
set /a HBAScount=%HBAScount%+1
::if /i "%HBASmode%" EQU "list" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3f%WiiUappName%\x3f" -write -yes
if /i "%code1%" NEQ "all" goto:bottom
goto:EOF
:notnum


::check for DATES that are greater
if "%filedate%"=="" goto:notnum
if "%CachedFiledate%"=="" goto:notnum

::check date in yyyymmdd format
set /a "CachedFiledateFixed=%CachedFiledate:~-4%%CachedFiledate:~3,2%%CachedFiledate:~0,2%"
set /a "filedateFixedp1=%filedate:~-4%%filedate:~3,2%%filedate:~0,2%"

::add 1 day to filedateFixedp1 to compensate for dif timezones
set y=%filedate:~-4%
set m=%filedate:~3,2%
set d=%filedate:~0,2%

::unpad for :tomorrow2 to work properly
if /i "%d:~0,1%" EQU "0" set d=%d:~1%
if /i "%m:~0,1%" EQU "0" set m=%m:~1%

:tomorrow2
   set /a d+=1

   if %d% gtr 31 (
      set d=1
      set /a m+=1

      if %m% gtr 12 (
         set m=1
         set /a y+=1
      )
   )
xcopy /d:%m%-%d%-%y% /h /l "%~f0" "%~f0\" >nul 2>&1 || goto:tomorrow2
::pad m & d to 2 digits if needed
if /i "%d:~1,1%" EQU "" set d=0%d%
if /i "%m:~1,1%" EQU "" set m=0%m%
set /a "filedateFixedp1=%y%%m%%d%"
::echo %filedateFixedp1%


if %filedateFixedp1% LSS %CachedFiledateFixed% goto:notnum

::found newer version!
if /i "%code1%" EQU "all" goto:miniskip
if %filedateFixedp1% EQU %CachedFiledateFixed% echo "echo %name%: App is up to date (actually 1 day older; likely timezone)">>temp\ModMii_Log.bat
if %filedateFixedp1% GTR %CachedFiledateFixed% echo "echo %name%: Detected newer version than cached (%filedate% vs %CachedFiledate%)">>temp\ModMii_Log.bat
:miniskip

if %filedateFixedp1% EQU %CachedFiledateFixed% support\sfk echo [%greentext%]App is up to date (actually 1 day older; likely timezone)
if %filedateFixedp1% GTR %CachedFiledateFixed% support\sfk echo [%greentext%]Detected newer version than cached (%filedate% vs %CachedFiledate%)
echo.
set /a HBAScountCurrent=%HBAScountCurrent%+1
set /a HBAScount=%HBAScount%+1
::if /i "%HBASmode%" EQU "list" support\sfk filter -spat -quiet "temp\HBASname.txt" -le!"\x3f%WiiUappName%\x3f" -write -yes
if /i "%code1%" NEQ "all" goto:bottom
goto:EOF
:notnum


goto:nocached
:skipthis




::get LatestVersion if not retrieved earlier
if not "%LatestVersion%"=="" goto:nocached

support\sfk filter -spat -quiet "temp\HBASinfo.json" -ls+"*\x22version\x22: \x22" -rep _"*version\x22: \x22"__ -rep _"\x22,*"__ >temp\version.txt
set /p LatestVersion= <temp\version.txt

if /i "%LatestVersion:~0,1%" EQU "v" set "LatestVersion=%LatestVersion:~1%"
if exist temp\version.txt del temp\version.txt>nul
:nocached

set /a HBAScount=%HBAScount%+1

::download only if not already cached
if not exist temp\HBAS mkdir temp\HBAS
if /i "%LatestVersion%" NEQ "%CachedVersion%" support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\HBAS\%WiiUappName%.zip" "https://wiiu.cdn.fortheusers.org/zips/%WiiUappName%.zip"

if exist "temp\HBAS\%WiiUappName%.zip" support\7za x -aoa "temp\HBAS\%WiiUappName%.zip" -o"%Drive%" -x!info.json -x!manifest.install -x!"screen*.png" -r >temp\7zalog.txt


if not exist temp\7zalog.txt goto:fail
findStr /I /C:"Everything is Ok" "temp\7zalog.txt" >nul
IF ERRORLEVEL 1 goto:fail

::save packages info
if not exist "%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%" mkdir "%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%"

support\7za e -aoa "temp\HBAS\%WiiUappName%.zip" -o"%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%" info.json manifest.install -r >temp\7zalog.txt


if not exist temp\7zalog.txt goto:fail
findStr /I /C:"Everything is Ok" "temp\7zalog.txt" >nul
IF ERRORLEVEL 1 goto:fail
if not exist "%DRIVE%\wiiu\apps\appstore\.get\packages\%WiiUappName%\info.json" goto:fail


::pass
if exist temp\7zalog.txt del temp\7zalog.txt>nul
if "%LatestVersion%"=="" (support\sfk echo [%greentext%]Download Successful) & goto:microskip
if "%CurrentAppVersion%"=="" support\sfk echo [%greentext%]Downloaded %LatestVersion% Successfully
if not "%CurrentAppVersion%"=="" support\sfk echo [%greentext%]Updated Successfully
:microskip


if /i "%HBASmode%" NEQ "list" echo.
set /a HBAScountSuccess=%HBAScountSuccess%+1

if /i "%HBASmode%" EQU "list" goto:miniskip
if /i "%code1%" EQU "all" goto:miniskip
if "%LatestVersion%"=="" (echo "echo %name%: Downloaded">>temp\ModMii_Log.bat) & (goto:miniskip)
if "%CurrentAppVersion%"=="" echo "echo %name%: Downloaded %LatestVersion%">>temp\ModMii_Log.bat
if "%CurrentAppVersion%"=="" goto:miniskip

if "%LatestFiledate%"=="" echo "echo %name%: Updated from %CurrentAppVersion% to %LatestVersion%">>temp\ModMii_Log.bat
if not "%LatestFiledate%"=="" echo "echo %name%: Updated from %CurrentAppVersion% to %LatestVersion% [%LatestFiledate%]">>temp\ModMii_Log.bat
:miniskip

if /i "%code1%" NEQ "all" goto:bottom
goto:EOF


:fail
if exist temp\7zalog.txt del temp\7zalog.txt>nul
::if it fails, try deleting cached zip, so on next attempt if the zip is the issue it will fix itself
if exist "temp\HBAS\%WiiUappName%.zip" del "temp\HBAS\%WiiUappName%.zip">nul
support\sfk echo [%magentatext%]Download Failed, skipping....
echo.
set /a HBAScountFail=%HBAScountFail%+1

if /i "%HBASmode%" EQU "list" goto:miniskip
if /i "%code1%" EQU "all" goto:miniskip
echo "support\sfk echo %name%: [%redtext%]Failed">>temp\ModMii_Log.bat
:miniskip

if /i "%code1%" NEQ "all" goto:bottom
goto:EOF

:quickskip

if /i "%code1%" NEQ "all" goto:bottom


::if /i "%HBASmode%" EQU "list" start notepad "temp\HBASupdateList.txt"

::clean up
::clean up not needed for HBAS

if /i "%HBASmode%" NEQ "list" echo.
if /i "%HBASmode%" EQU "download" support\sfk echo [%greentext%]HBAS Complete Wii App Library Download Finished
if /i "%HBASmode%" EQU "update" support\sfk echo [%greentext%]HBAS App Updates Finished
if /i "%HBASmode%" NEQ "list" echo.

if /i "%HBASmode%" EQU "list" goto:bottom




if /i "%HBASmode%" NEQ "update" goto:notupdate

if /i "%HBAScountFail%" EQU "0" echo "echo %name%: %HBAScountSuccess% Downloaded\Updated">>temp\ModMii_Log.bat
if /i "%HBAScountFail%" NEQ "0" echo "echo %name%: %HBAScountSuccess% Downloaded\Updated and %HBAScountFail% Failed">>temp\ModMii_Log.bat
goto:bottom



:notupdate
if /i "%HBAScountSkip%" NEQ "0" goto:skip

if /i "%HBAScountFail%" EQU "0" echo "echo %name%: %HBAScountSuccess% Downloaded\Updated and %HBAScountCurrent% confirmed up to date or newer">>temp\ModMii_Log.bat
if /i "%HBAScountFail%" NEQ "0" echo "echo %name%: %HBAScountSuccess% Downloaded\Updated, %HBAScountCurrent% confirmed up to date or newer and %HBAScountFail% Failed">>temp\ModMii_Log.bat
goto:bottom

:skip

if /i "%HBAScountFail%" EQU "0" echo "echo %name%: %HBAScountSuccess% Downloaded\Updated, %HBAScountCurrent% up to date or newer and %HBAScountSkip% Skipped">>temp\ModMii_Log.bat
if /i "%HBAScountFail%" NEQ "0" echo "echo %name%: %HBAScountSuccess% Downloaded\Updated, %HBAScountCurrent% up to date or newer, %HBAScountSkip% Skipped and %HBAScountFail% Failed">>temp\ModMii_Log.bat


:bottom
if "%DRIVErestore%"=="" set "DRIVErestore=%Drive%"

::call settings to restore AUSKIP to default setting
if exist Support\settings.bat call Support\settings.bat

set "DRIVE=%DRIVErestore%"

echo %HBAScountCurrent% >temp\HBAScountCurrent.txt
echo %HBAScountSkip% >temp\HBAScountSkip.txt
