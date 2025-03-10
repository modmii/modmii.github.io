::Usage: CompareVersions.bat "1" "2"
::%CompareResult% answer refers to 1st number and results can be: GTR, LSS, EQU, Invalid
set CompareResult=Invalid
if "%~1"=="" goto:fin
if "%~2"=="" goto:fin

echo("%~1" | findstr /R /C:"\"[0-9.]*\"" >nul && set CompareResult=Valid || set CompareResult=Invalid
if /i "%CompareResult%" EQU "Invalid" goto:fin

echo("%~2" | findstr /R /C:"\"[0-9.]*\"" >nul && set CompareResult=Valid || set CompareResult=Invalid
if /i "%CompareResult%" EQU "Invalid" goto:fin

set CompareResult=Invalid

@powershell -command "&{exit(([version]$args[0]).CompareTo([version]$args[1]))}" "%~1.0" "%~2.0"
@IF ERRORLEVEL 1 (set CompareResult=GTR)  ELSE (
 IF ERRORLEVEL 0 (set CompareResult=EQU) ELSE set CompareResult=LSS)

:fin
::echo %CompareResult%
