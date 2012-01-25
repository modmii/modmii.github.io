;Small autoit script by person66 to make ModMii.bat open with an icon
AutoItSetOption("TrayIconHide", 1)
If FileExists(@WorkingDir & "\Support\ModMii.lnk") Then FileDelete(@WorkingDir & "\Support\ModMii.lnk")
$ARGS = ""
$I = 1
While $I <= $CMDLINE[0]
        $ARGS = $ARGS & $CMDLINE[$I] & " "
        $I = $I + 1
WEnd
$HasArgs = "True"
If $CMDLINE[0] = 0 Then $HasArgs = "False" 
FileCreateShortcut(@ComSpec, @ScriptDir & "\Support\ModMii.lnk", @ScriptDir, '/c call "' & @ScriptDir & '\Support\ModMii.bat" ' & $ARGS, "", @ScriptDir & "\Support\icon.ico")
If $HasArgs = "True" Then
ShellExecuteWait(@ScriptDir & "\Support\ModMii.lnk")
Else
ShellExecute(@ScriptDir & "\Support\ModMii.lnk")
EndIf