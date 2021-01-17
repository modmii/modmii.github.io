#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.0
 Author:         person66

 Script Function:
	Move the ModMii skin window.

 Script Version: 1.4

#ce ----------------------------------------------------------------------------

#include <Process.au3>

AutoItSetOption("TrayIconHide", 1)
dim $WinPos, $WinPosBak, $WaitTime, $AlreadyOpen = 0, $ProcessName, $ProcessList, $run, $args, $HasArgs = "True"

;--------------------------------------------------------------
$WaitTime = 10 ;Time to wait for next ModMii window (in seconds)
;--------------------------------------------------------------

;Check and kill other instances of this script (skips if other ModMii windows are open)
if $AlreadyOpen = 0 then
	$ProcessName = _ProcessGetName(@AutoItPID)
	$ProcessList = ProcessList($ProcessName)
	For $i = 1 To $ProcessList[0][0]
		if $ProcessList[$i][1] <> @AutoItPID then
			ProcessClose($ProcessList[$i][1])
		endif
	Next
EndIf

;Main part
ShellExecute(@ComSpec, '/c call "' & @ScriptDir & '\ModMii Installer.bat"')

$run = WinWait("ModMii Installer", "by XFlak", $WaitTime)
if $run = 0 then 
	exit
endif

While 1
	While 1
		if WinExists($run) <> 1 then
			exitloop
		else
			$WinPos = WinGetPos($run)
			if $WinPos <> 0 then
				$WinPosBak = $WinPos
			else
				$WinPos = $WinPosBak
				exitloop
			endif
		endif
	WEnd
	$run = WinWait("ModMii Installer", "by XFlak", $WaitTime)
	if $run = 0 then 
		exit
	else
		WinMove($run, "", $WinPos[0], $WinPos[1])
		WinActivate($run)
	endif
WEnd