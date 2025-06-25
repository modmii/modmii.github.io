set errorlevel=
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat

::recommended d2x version check = "RecD2XcIOS"
if not "%RecD2XcIOS%"=="" goto:proceed

if /i "%debug%" EQU "on" goto:debugskip
if exist temp\updater.bat attrib -h temp\updater.bat
if exist temp\updater.bat del temp\updater.bat>nul
:debugskip

if /i "%debug%" NEQ "on" support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\updater.bat" "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/updater.bat"
if not exist temp\updater.bat support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\updater.bat" "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/updater.bat"
::delete if file is empty (if empty)
>nul findstr "^" "temp\updater.bat" || del "temp\updater.bat"
if not exist temp\updater.bat goto:proceed

support\sfk filter -quiet "temp\updater.bat" -ls+"set RecD2XcIOS=">temp\RecD2XcIOS.bat
if exist temp\RecD2XcIOS.bat call temp\RecD2XcIOS.bat
if /i "%debug%" NEQ "on" del temp\updater.bat>nul
:proceed


if "%RecD2XcIOS%"=="" goto:BundledD2X
if /i "%d2x-beta-rev%" EQU "%RecD2XcIOS:~5%" goto:skipcheck

::recommended d2x

set watext=~Caution!~~The version of d2x cIOS selected in ModMii Classic's Options (v%d2x-beta-rev%) is not the recommended version (v%RecD2XcIOS:~5%).~~Click "Next" to switch to the recommended d2x version now, or "Cancel" to continue with v%d2x-beta-rev%
start /w support\wizapp TB

::cancel
if errorlevel 2 goto:skipcheck
::back
::if errorlevel 1 goto:WPAGE0
if errorlevel 1 goto:skipcheck
::next

if /i "%d2x-bundled%" EQU "%RecD2XcIOS:~5%" goto:clearD2X

::download and extract recommended d2x beta
echo Enabling %RecD2XcIOS%...
if exist "support\More-cIOSs\%RecD2XcIOS%\d2x-beta.bat" goto:pickup
support\wget --no-check-certificate -q --show-progress -t 3 -O "temp\%RecD2XcIOS%.zip" "https://raw.githubusercontent.com/modmii/modmii.github.io/master/temp/d2x/%RecD2XcIOS%.7z"

::delete if file is empty
>nul findstr "^" "temp\%RecD2XcIOS%.zip" || del "temp\%RecD2XcIOS%.zip"

if not exist "temp\%RecD2XcIOS%.zip" (echo Failed to download %RecD2XcIOS%, reverting to bundled v%d2x-bundled% instead...) & (goto:clearD2X)
if not exist "support\More-cIOSs\%RecD2XcIOS%" mkdir "support\More-cIOSs\%RecD2XcIOS%"
support\7za e -aoa "temp\%RecD2XcIOS%.zip" -o"support\More-cIOSs\%RecD2XcIOS%" *.* -r
del "temp\%RecD2XcIOS%.zip">nul
if not exist "support\More-cIOSs\%RecD2XcIOS%\d2x-beta.bat" (rd /s /q "support\More-cIOSs\%RecD2XcIOS%") & (echo Failed to download %RecD2XcIOS%, reverting to bundled v%d2x-bundled% instead...) & (goto:clearD2X)

:pickup
if exist support\d2x-beta rd /s /q support\d2x-beta
mkdir support\d2x-beta
copy /y "support\More-cIOSs\%RecD2XcIOS%\*" "support\d2x-beta">nul
if exist support\d2x-beta\d2x-beta.bat call support\d2x-beta\d2x-beta.bat
if /i "%d2x-beta-rev%" NEQ "%RecD2XcIOS:~5%" (echo Failed to download %RecD2XcIOS%, reverting to bundled v%d2x-bundled% instead...) & (goto:clearD2X)
echo %RecD2XcIOS% Enabled
goto:skipcheck




:BundledD2X
if /i "%d2x-beta-rev%" EQU "%d2x-bundled%" goto:skipcheck

set watext=~Caution!~~The version of d2x cIOS selected in ModMii Classic's Options (v%d2x-beta-rev%) is not the default version (v%d2x-bundled%).~~Click "Next" to revert to the default d2x version now, or "Cancel" to continue with v%d2x-beta-rev%
start /w support\wizapp TB

::cancel
if errorlevel 2 goto:skipcheck
::back
::if errorlevel 1 goto:WPAGE0
if errorlevel 1 goto:skipcheck
::next

:clearD2X
set "d2x-beta-rev=%d2x-bundled%"
if exist support\d2x-beta rd /s /q support\d2x-beta
echo d2x-v%d2x-beta-rev% Enabled
:skipcheck
::after calling this subscript need to control for "Back" button when errorlevel is 1 - "if /i %errorlevel% EQU 1 goto:somewhere"
