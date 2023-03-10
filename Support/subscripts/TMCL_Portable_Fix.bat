::Portable ModMii Installation fix
set "ModMiiDir=%cd%"
if /i "%Homedrive%" EQU "%ModMiiDrive%" goto:skipPortableFix
if not exist "%homedrive%\ModMii\temp" mkdir "%homedrive%\ModMii\temp"
copy /y "temp\TMCL.exe" "%homedrive%\ModMii\temp\TMCL.exe">nul
copy /y "temp\ASH.exe" "%homedrive%\ModMii\temp\ASH.exe">nul
copy /y "temp\ICSharpCode.SharpZipLib.dll" "%homedrive%\ModMii\temp\ICSharpCode.SharpZipLib.dll">nul
copy /y "temp\themewii.exe" "%homedrive%\ModMii\temp\themewii.exe">nul
cd /d "%homedrive%\ModMii"
:skipPortableFix
