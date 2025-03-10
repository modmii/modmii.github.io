#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=C:\ModMii\Support\icon.ico
#AutoIt3Wrapper_outfile=ModMii.exe
#AutoIt3Wrapper_UseX64=Y
#AutoIt3Wrapper_UseUpx=Y
#AutoIt3Wrapper_Res_Description=ModMii Launcher
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=ModMii by XFlak
#AutoIt3Wrapper_Res_Field=ProductName|ModMii Launcher
#AutoIt3Wrapper_Res_Field=ProductVersion|1.0.0.0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;script version 2.3 (2024-12-03)
;by XFlak, based on original ModMii Launcher by person66

;Compile using Aut2Exe, or for smaller size use autoit3wrapper.au3 (https://www.autoitscript.com/site/autoit-script-editor/downloads/)

#AutoIt3Wrapper_Autoit3Dir="C:\Program Files (x86)\AutoIt3"

AutoItSetOption("TrayIconHide", 1)
AutoItSetOption("WinTitleMatchMode", 3)

if WinExists("[CLASS:ConsoleWindowClass; TITLE:ModMii]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:ModMii nand tools]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:ModMii Inspector Wadget]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:ModMii Game Image tools]", "") <> 0 OR WinExists("[CLASS:HTML Application Host Window Class; TITLE:ModMii]", "") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:ModMii WAD tools]", "") <> 0 then
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

If $HasArgs = "True" Then
	FileCreateShortcut(@HomeDrive & "\Windows\System32\conhost.exe", @ScriptDir & "\Support\ModMii.lnk", @ScriptDir, 'cmd /c call "' & @ScriptDir & '\Support\ModMii.bat"' & $ARGS, "", @ScriptDir & "\Support\icon.ico")
    ProcessWaitClose(ShellExecute(@ScriptDir & "\Support\ModMii.lnk"))
Else
	FileCreateShortcut(@HomeDrive & "\Windows\System32\conhost.exe", @ScriptDir & "\Support\ModMii.lnk", @ScriptDir, 'cmd /c call "' & @ScriptDir & '\Support\ModMii.bat"', "", @ScriptDir & "\Support\icon.ico")
	ShellExecute(@ScriptDir & "\Support\ModMii.lnk")
EndIf
