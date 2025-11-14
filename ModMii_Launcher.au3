#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=C:\ModMii\Support\icon.ico
#AutoIt3Wrapper_outfile=ModMii.exe
#AutoIt3Wrapper_UseX64=N
#AutoIt3Wrapper_UseUpx=Y
#AutoIt3Wrapper_Res_Description=ModMii Launcher
#AutoIt3Wrapper_Res_Fileversion=2.5.0.0
#AutoIt3Wrapper_Res_LegalCopyright=ModMii by XFlak
#AutoIt3Wrapper_Res_Field=ProductName|ModMii Launcher
#AutoIt3Wrapper_Res_Field=ProductVersion|2.5.0.0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;below disables SysWOW64 redirect ensuring System32\conhost.exe can be found when running on 32-bit AND 64-bit systems: https://www.autoitscript.com/autoit3//docs/intro/64-bit_support.htm
#include <WinAPIFiles.au3>
_WinAPI_Wow64EnableWow64FsRedirection(False)
;disabling redirect may not be necessary IF using "SysNative" in place of "System32", but "SysNative" MAY only work when run as x86 application on 64-bit systems (32-bit systems untested. Confirmed SysNative fails when run as x64 app on 64-bit system): https://stackoverflow.com/questions/51260162/running-cmd-from-absolute-path-has-it-fail-to-recognise-manage-bde-command

;script version 2.5 (2025-07-07)
;by XFlak, based on original ModMii Launcher by person66

;Compile using Aut2Exe, or for smaller size use autoit3wrapper.au3 (https://www.autoitscript.com/site/autoit-script-editor/downloads/)

#AutoIt3Wrapper_Autoit3Dir="C:\Program Files (x86)\AutoIt3"

AutoItSetOption("TrayIconHide", 1)
AutoItSetOption("WinTitleMatchMode", 3)

if WinExists("[CLASS:ConsoleWindowClass; TITLE:ModMii]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:ModMii nand tools]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:ModMii Inspector Wadget]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:ModMii Game Image tools]", "") <> 0 OR WinExists("[CLASS:HTML Application Host Window Class; TITLE:ModMii]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:ModMii WAD tools]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:Administrator:  ModMii]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:Administrator:  ModMii nand tools]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:Administrator:  ModMii Inspector Wadget]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:Administrator:  ModMii Game Image tools]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:Administrator:  ModMii WAD tools]", "") <> 0 then
		$AlreadyOpen = MsgBox(52, "WARNING", "It appears as if you already have a ModMii Window open." & @CRLF & @CRLF & "Running more than one instance of ModMii at a time is not" & @CRLF & "recommended and may get buggy." & @CRLF & @CRLF & "Are you sure you wish to continue?")
	if $AlreadyOpen <> 6 then
		exit
	endif
endif

$ARGS = ""
$I = 1
While $I <= $CMDLINE[0]
    $ARGS = $ARGS & ' "' & $CMDLINE[$I]& '"'
    $I = $I + 1
WEnd
$HasArgs = "True"
If $CMDLINE[0] = 0 Then $HasArgs = "False"

$conhost = "False"
If @OSVersion = "WIN_10" OR @OSVersion = "WIN_11" OR @OSVersion = "WIN_12" Then $conhost = "True"

If $HasArgs = "True" Then
	If $conhost = "True" Then
		FileCreateShortcut(@HomeDrive & "\Windows\System32\conhost.exe", @ScriptDir & "\Support\ModMii.lnk", @ScriptDir, 'cmd /c call "' & @ScriptDir & '\Support\ModMii.bat"' & $ARGS, "", @ScriptDir & "\Support\icon.ico")
		ProcessWaitClose(ShellExecute(@ScriptDir & "\Support\ModMii.lnk"))
	Else
		FileCreateShortcut(@ComSpec, @ScriptDir & "\Support\ModMii.lnk", @ScriptDir, '/c call "' & @ScriptDir & '\Support\ModMii.bat"' & $ARGS, "", @ScriptDir & "\Support\icon.ico")
		ProcessWaitClose(ShellExecute(@ScriptDir & "\Support\ModMii.lnk"))
	EndIf
Else
	If $conhost = "True" Then
		FileCreateShortcut(@HomeDrive & "\Windows\System32\conhost.exe", @ScriptDir & "\Support\ModMii.lnk", @ScriptDir, 'cmd /c call "' & @ScriptDir & '\Support\ModMii.bat"', "", @ScriptDir & "\Support\icon.ico")
		ShellExecute(@ScriptDir & "\Support\ModMii.lnk")
	Else
		FileCreateShortcut(@ComSpec, @ScriptDir & "\Support\ModMii.lnk", @ScriptDir, '/c call "' & @ScriptDir & '\Support\ModMii.bat"', "", @ScriptDir & "\Support\icon.ico")
		ShellExecute(@ScriptDir & "\Support\ModMii.lnk")
	EndIf
EndIf
