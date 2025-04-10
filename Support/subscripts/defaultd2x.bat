if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat

::recommended d2x version check = "RecD2XcIOS"
if not "%RecD2XcIOS%"=="" goto:proceed

if /i "%debug%" EQU "on" goto:debugskip
if exist Updatetemp.bat attrib -h Updatetemp.bat
if exist Updatetemp.bat del Updatetemp.bat>nul
:debugskip

if /i "%debug%" NEQ "on" support\wget --no-check-certificate "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/updater.bat" -O Updatetemp.bat -q
if not exist Updatetemp.bat support\wget --no-check-certificate "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/updater.bat" -O Updatetemp.bat -q
::delete if file is empty (if empty)
>nul findstr "^" "Updatetemp.bat" || del "Updatetemp.bat"
if not exist Updatetemp.bat goto:proceed

support\sfk filter -quiet "Updatetemp.bat" -ls+"set RecD2XcIOS=">temp\RecD2XcIOS.bat
if exist temp\RecD2XcIOS.bat call temp\RecD2XcIOS.bat
if /i "%debug%" NEQ "on" del Updatetemp.bat>nul
:proceed

echo.

if "%RecD2XcIOS%"=="" goto:BundledD2X
if /i "%d2x-beta-rev%" EQU "%RecD2XcIOS:~5%" goto:skipcheck

::recommended d2x
echo Caution! The version of d2x cIOS selected in ModMii's Options (v%d2x-beta-rev%)
echo is not the recommended version (v%RecD2XcIOS:~5%).
echo.
echo Would you like to switch to the recommended d2x version now? (Y/N)
echo.
:RECd2x
set defaultd2x="
set /p defaultd2x=Enter Selection Here: 
set "defaultd2x=%defaultd2x:"=%"

if /i "%defaultd2x%" NEQ "Y" goto:notY

if /i "%d2x-bundled%" EQU "%RecD2XcIOS:~5%" goto:clearD2X
echo.

::download and extract recommended d2x beta
echo Enabling %RecD2XcIOS%...
echo.
if exist "support\More-cIOSs\%RecD2XcIOS%\d2x-beta.bat" goto:pickup
support\wget --output-document %RecD2XcIOS%.zip --no-check-certificate -t 3 "https://github.com/modmii/modmii.github.io/blob/master/temp/d2x/%RecD2XcIOS%.7z?raw=true" -q --show-progress
echo.

::delete if file is empty
>nul findstr "^" "%RecD2XcIOS%.zip" || del "%RecD2XcIOS%.zip"

if not exist "%RecD2XcIOS%.zip" (echo Failed to download %RecD2XcIOS%, reverting to bundled v%d2x-bundled% instead...) & (goto:clearD2X)
if not exist "support\More-cIOSs\%RecD2XcIOS%" mkdir "support\More-cIOSs\%RecD2XcIOS%"
support\7za e -aoa "%RecD2XcIOS%.zip" -o"support\More-cIOSs\%RecD2XcIOS%" *.* -r
del "%RecD2XcIOS%.zip">nul
if not exist "support\More-cIOSs\%RecD2XcIOS%\d2x-beta.bat" (rd /s /q "support\More-cIOSs\%RecD2XcIOS%") & (echo Failed to download %RecD2XcIOS%, reverting to bundled v%d2x-bundled% instead...) & (goto:clearD2X)

:pickup
if exist support\d2x-beta rd /s /q support\d2x-beta
mkdir support\d2x-beta
copy /y "support\More-cIOSs\%RecD2XcIOS%\*" "support\d2x-beta">nul
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
echo.
if /i "%d2x-beta-rev%" NEQ "%RecD2XcIOS:~5%" (echo Failed to download %RecD2XcIOS%, reverting to bundled v%d2x-bundled% instead...) & (goto:clearD2X)
echo.
goto:skipcheck
:notY

if /i "%defaultd2x%" EQU "N" goto:skipcheck
echo You Have Entered an Incorrect Key
echo.
goto:RECd2x



:BundledD2X
if /i "%d2x-beta-rev%" EQU "%d2x-bundled%" goto:skipcheck

echo Caution! The version of d2x cIOS selected in ModMii's Options (v%d2x-beta-rev%)
echo is not the default version (v%d2x-bundled%).
echo.
echo Would you like to revert to the default d2x version now? (Y/N)
echo.
:defaultd2x
set defaultd2x="
set /p defaultd2x=Enter Selection Here: 
set "defaultd2x=%defaultd2x:"=%"

if /i "%defaultd2x%" NEQ "Y" goto:notY

:clearD2X
set "d2x-beta-rev=%d2x-bundled%"
if exist support\d2x-beta rd /s /q support\d2x-beta
goto:skipcheck
:notY

if /i "%defaultd2x%" EQU "N" goto:skipcheck
echo You Have Entered an Incorrect Key
echo.
goto:defaultd2x

:skipcheck
echo.
