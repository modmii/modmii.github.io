echo.
echo Caution! The version of d2x cIOS selected in ModMii's Options (v%d2x-beta-rev%)
echo is not the recommended\default version (v%d2x-bundled%).
echo.
echo Would you like to revert to the default d2x version now? (Y/N)
echo.
:defaultd2x
set defaultd2x="
set /p defaultd2x=Enter Selection Here: 
set "defaultd2x=%defaultd2x:"=%"

if /i "%defaultd2x%" NEQ "Y" goto:notY

set "d2x-beta-rev=%d2x-bundled%"
if exist support\d2x-beta rd /s /q support\d2x-beta
goto:skipcheck
:notY

if /i "%defaultd2x%" EQU "N" goto:skipcheck

:badkey
echo You Have Entered an Incorrect Key
echo.
goto:defaultd2x

:skipcheck
echo.
