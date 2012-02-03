;Small AutoIt (3.3.8.0) script by person66 to make ModMii.bat open with an icon
AutoItSetOption("TrayIconHide", 1)
dim $args, $HasArgs = "True"
For $i = 1 To $CMDLINE[0]
	$args = $args & $CMDLINE[$I] & " "
Next
If $CMDLINE[0] = 0 Then $HasArgs = "False"
If $HasArgs = "True" Then
	FileCreateShortcut(@ComSpec, @ScriptDir & "\ModMii Installer.lnk", @ScriptDir, '/c call "' & @ScriptDir & '\ModMii Installer.bat"', "", @ScriptDir & "\icon.ico")
	ShellExecuteWait(@ScriptDir & "\ModMii Installer.lnk", $args)
Else
	if WinExists("[CLASS:WizAppWindow; TITLE:ModMii Skin]", "by XFlak") <> 0 OR WinExists("[CLASS:ConsoleWindowClass; TITLE:ModMii]", "") <> 0 then
		$AlreadyOpen = MsgBox(52, "WARNING", "It appears as if you already have a ModMii Window open." & @CRLF & @CRLF & "Running more than one instance of ModMii at a time is not" & @CRLF & "reccommended and may get buggy." & @CRLF & @CRLF & "Are you sure you wish to continue?")
		if $AlreadyOpen <> 6 then
			exit
		endif
	endif
	FileCreateShortcut(@ComSpec, @ScriptDir & "\ModMii Installer.lnk", @ScriptDir, '/c call "' & @ScriptDir & '\ModMii Installer.bat"', "", @ScriptDir & "\icon.ico")
	ShellExecute(@ScriptDir & "\ModMii Installer.lnk")
EndIf