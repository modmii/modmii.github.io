::ModMii v8.0.0 - Download Queue - Thu 12/28/2024
set AdvNumber=0
if /i "%GetAdvNumberOnly%" EQU "Y" goto:endofqueue

::Queue
SET AccioHacks=*
SET CheatCodes=*
::SET CheatZip=*

::toggle Cheatzip if no txtcodes already exist
if not exist "%DRIVE%"\txtcodes\*.txt set CheatZip=*

echo.
echo You've accessed a special Download Queue that will save copies of cheats from txtcodes\ to codes\ in AccioHacks format
echo.

if /i "%CheatZip%" NEQ "*" goto:skip
echo ModMii will also download Cheat Codes (txtcodes) in bulk since you have none saved here:
echo "%DRIVE%\txtcodes\*.txt"
echo.
echo Reload this queue with txtcodes where expected if you don't want ModMii to download codes and only copy existing ones
echo.
pause
goto:endofqueue
:skip

echo The only codes to be copied to AccioHacks format will be those already saved here:
echo "%DRIVE%\txtcodes\*.txt"
echo.
echo Alternatively, also add Cheat Codes (txtcodes) to your queue from Download Page 2.
echo.
pause

:endofqueue
