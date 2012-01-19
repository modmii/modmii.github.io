;Small autoit script by person66 to make ModMii.bat open with an icon
IF FileExists(@WorkingDir & "\Support\ModMii.lnk") Then FileDelete(@WorkingDir & "\Support\ModMii.lnk")
$ARGS = ""
$I = 1
While $I <= $CMDLINE[0]
	$ARGS = $ARGS & $CMDLINE[$I] & " "
	$I = $I + 1
WEnd
FileCreateShortcut(@ComSpec, @ScriptDir & "\Support\ModMii.lnk", @ScriptDir, '/c call "' & @ScriptDir & '\Support\ModMii.bat" ' & $ARGS, "", @ScriptDir & "\Support\icon.ico")
ShellExecuteWait(@ScriptDir & "\Support\ModMii.lnk")