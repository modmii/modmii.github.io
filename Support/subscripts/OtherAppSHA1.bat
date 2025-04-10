::get sha1 of latest version now, save as md5 variable, if is longer than 32 chars modmii will know it's sha1
set md5=
if not exist "%Drive%\%path1%%filename%" (set md5alt=%md5%) & (goto:bottom)
if not exist "%homedrive%\Windows\System32\certutil.exe" (set md5alt=%md5%) & (goto:bottom)

if not exist "temp\check_versions.date" goto:nodatecheck
if not exist "temp\check_versions.txt" goto:nodatecheck
findStr /I /C:"%date%" "temp\check_versions.date" >nul
IF not ERRORLEVEL 1 goto:skipcheck_versions

:nodatecheck
support\wget --no-check-certificate -t 3 "https://aroma.foryour.cafe/api/check_versions" -O temp\check_versions.txt -q
::delete if file is empty
>nul findstr "^" "temp\check_versions.txt" || del "temp\check_versions.txt"
if exist "temp\check_versions.txt" (echo %date% >temp\check_versions.date) & (goto:skipcheck_versions)
::error
set md5alt=%md5%
goto:bottom
:skipcheck_versions

if exist "temp\%name%.txt" del "temp\%name%.txt">nul
support\sfk filter -spat -quiet "temp\check_versions.txt" -rep _"*\x22name\x22:\x22%name%\x22"__ +filter -spat -+"\x22path\x22:\x22%path1:\=/%%filename%\x22" -rep _"\x22asset\x22*"__ -rep _"*\x22sha1\x22"__ -rep _"\x22,*"__ -rep _"*\x22"__ >"temp\%name%.txt"
if exist "temp\%name%.txt" set /p md5= <"temp\%name%.txt"
set md5alt=%md5%
:bottom
