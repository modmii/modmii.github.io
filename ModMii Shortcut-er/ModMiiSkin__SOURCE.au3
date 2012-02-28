#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.0
 Author:         person66

 Script Function:
	Move the ModMii skin window.

 Script Version: 1.6

#ce ----------------------------------------------------------------------------

#AutoIt3Wrapper_Autoit3Dir="C:\Program Files (x86)\AutoIt3"
#AutoIt3Wrapper_Icon="C:\ModMii\Support\icon.ico"
#AutoIt3Wrapper_OutFile=ModMiiSkin.exe
#AutoIt3Wrapper_Res_Field=ProductName|ModMii Skin Launcher
#AutoIt3Wrapper_Res_Fileversion= 1.0.0.0
#AutoIt3Wrapper_Res_Field=ProductVersion|1.0.0.0
#AutoIt3Wrapper_Res_Description=ModMii Skin Launcher
#AutoIt3Wrapper_Res_LegalCopyright=ModMii by XFlak, Launcher by person66
#AutoIt3Wrapper_UseX64=N

#include <Process.au3>

AutoItSetOption("TrayIconHide", 1)
dim $WinPos, $WinPosBak, $WaitTime, $AlreadyOpen = 0, $ProcessName, $ProcessList, $run, $args, $HasArgs = "True"

;--------------------------------------------------------------
$WaitTime = 10 ;Time to wait for next ModMii window (in seconds)
;--------------------------------------------------------------

;Check for args, and run ModMii Classic if there are
if $CMDLINE[0] = 0 then $HasArgs = "False"
if $HasArgs = "True" then
For $i = 1 To $CMDLINE[0]
	$args = $args & $CMDLINE[$I] & " "
Next
ShellExecuteWait(@ScriptDir & "\ModMii.exe", $args)
exit
endif

;Check if other ModMii windows are open
if WinExists("[CLASS:WizAppWindow; TITLE:ModMii Skin]", "by XFlak") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:ModMii]", "") <> 0 then
	$AlreadyOpen = MsgBox(52, "WARNING", "It appears as if you already have a ModMii Window open." & @CRLF & @CRLF & "Running more than one instance of ModMii at a time is not" & @CRLF & "recommended and may get buggy." & @CRLF & @CRLF & "Are you sure you wish to continue?")
	if $AlreadyOpen <> 6 then
		exit
	endif
endif

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
ShellExecute(@ComSpec, '/c call "' & @ScriptDir & '\Support\ModMiiSkin.bat"', "", "", @SW_HIDE)

$run = WinWait("ModMii Skin", "by XFlak", $WaitTime)
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
	$run = WinWait("ModMii Skin", "by XFlak", $WaitTime)
	if $run = 0 then 
		exit
	else
		WinMove($run, "", $WinPos[0], $WinPos[1])
		WinActivate($run)
	endif
WEnd