set md5=
if not exist "%Drive%\%path1%%filename%" goto:skip

::check settings_skipped_apps.txt
if not exist Support\settings_skipped_apps.txt goto:NoUpdateSettings
findStr /I /C:"'%name%'" "Support\settings_skipped_apps.txt" >nul
IF ERRORLEVEL 1 goto:NoUpdateSettings
support\sfk echo %name% Detected, [%yellowtext%]skipping update check [def]as per ModMii settings...
goto:skip
:NoUpdateSettings

echo %name% Detected, checking for updates...
echo.
if not exist "%homedrive%\Windows\System32\certutil.exe" (echo certutil.exe missing, unable to check if up to date, skipping...) & (@ping 127.0.0.1 -n 2 -w 1000> nul) & (goto:skip)

if not exist "temp\check_versions.date" goto:nodatecheck
if not exist "temp\check_versions.txt" goto:nodatecheck
findStr /I /C:"%date%" "temp\check_versions.date" >nul
IF not ERRORLEVEL 1 goto:skipcheck_versions

:nodatecheck
support\wget --no-check-certificate -q -t 3 -O "temp\check_versions.txt" "https://aroma.foryour.cafe/api/check_versions"
::delete if file is empty
>nul findstr "^" "temp\check_versions.txt" || del "temp\check_versions.txt"
if exist "temp\check_versions.txt" (echo %date% >temp\check_versions.date) & (goto:skipcheck_versions)
::error
echo Unable to check if up to date, skipping...
@ping 127.0.0.1 -n 2 -w 1000> nul
goto:skip
:skipcheck_versions

if exist "temp\%name%.txt" del "temp\%name%.txt">nul
support\sfk filter -spat -quiet "temp\check_versions.txt" -rep _"*\x22name\x22:\x22%name%\x22"__ +filter -spat -+"\x22path\x22:\x22%path1:\=/%%filename%\x22" -rep _"\x22asset\x22*"__ -rep _"*\x22sha1\x22"__ -rep _"\x22,*"__ -rep _"*\x22"__ >"temp\%name%.txt"
if exist "temp\%name%.txt" set /p md5= <"temp\%name%.txt"

certutil -hashfile "%Drive%\%path1%%filename%" SHA1>"temp\sha1.txt"
findStr /I /B /C:"%md5%" "temp\sha1.txt" >nul

IF NOT ERRORLEVEL 1 goto:skip
set /a OtherUpdateItems=%OtherUpdateItems%+1
set /a updateitems=%updateitems%+1
echo %name%>>temp\OTHERupdateList.txt
echo set %name%=*>temp\temp.bat
call temp\temp.bat
:skip
