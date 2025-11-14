::Usage: CompareVersions.bat "1" "2"
::%CompareResult% answer refers to the 1st number and results can be: GTR, LSS, EQU, Invalid
set "CompareResult=Invalid"
if "%~1"=="" goto:fin
if "%~2"=="" goto:fin

setlocal ENABLEDELAYEDEXPANSION

::read arguments and remove quotes & spaces
set "v1=%~1"
set "v1=%v1:"=%"
set "v1=%v1: =%"
set "v2=%~2"
set "v2=%v2:"=%"
set "v2=%v2: =%"

::default comparison result for valid inputs
set "CompareResult=EQU"

::loop through each segment
:compareloop
::extract first segment of v1
for /F "tokens=1* delims=." %%A in ("!v1!") do (
    set "s1=%%A"
    set "v1=%%B"
)
if "!s1!"=="" set "s1=0"

::extract first segment of v2
for /F "tokens=1* delims=." %%A in ("!v2!") do (
    set "s2=%%A"
    set "v2=%%B"
)
if "!s2!"=="" set "s2=0"

::numeric check (invalid if segment is not a number)
set /a test1=!s1! >nul 2>&1
if errorlevel 1 (
    set "CompareResult=Invalid"
    goto:fin
)

set /a test2=!s2! >nul 2>&1
if errorlevel 1 (
    set "CompareResult=Invalid"
    goto:fin
)

::numeric comparison
if !s1! GTR !s2! (
    set "CompareResult=GTR"
    goto:fin
)
if !s1! LSS !s2! (
    set "CompareResult=LSS"
    goto:fin
)

::continue loop if more segments exist, else finish
if "!v1!"=="" if "!v2!"=="" goto:fin
goto:compareloop

:fin
::pass CompareResult back to global environment
endlocal & set "CompareResult=%CompareResult%"

::echo %CompareResult%
