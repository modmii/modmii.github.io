::Portable ModMii Installation fix, reversal
if /i "%Homedrive%" EQU "%ModMiiDrive%" goto:skipPortableFix
if exist "%homedrive%\ModMii\temp\TMCL.exe" del "%homedrive%\ModMii\temp\TMCL.exe">nul
if exist "%homedrive%\ModMii\temp\ASH.exe" del "%homedrive%\ModMii\temp\ASH.exe">nul
if exist "%homedrive%\ModMii\temp\ICSharpCode.SharpZipLib.dll" del "%homedrive%\ModMii\temp\ICSharpCode.SharpZipLib.dll">nul
if exist "%homedrive%\ModMii\temp\themewii.exe" del "%homedrive%\ModMii\temp\themewii.exe">nul

::check for and delete empty folders
dir /A /B "%homedrive%\ModMii\temp" | findstr /R ".">NUL && goto:notempty
rd /s /q "%homedrive%\ModMii\temp"> nul
:notempty
dir /A /B "%homedrive%\ModMii" | findstr /R ".">NUL && goto:skipPortableFix
rd /s /q "%homedrive%\ModMii"> nul
:skipPortableFix
