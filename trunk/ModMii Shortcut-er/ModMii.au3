;Small autoit script by person66 to make ModMii.bat open with an icon
If FileExists( @WorkingDir & "\Support\ModMii.lnk") Then FileDelete( @WorkingDir & "\Support\ModMii.lnk")
;Get arguments
$args = ""
$i = 1
while $i <= $CmdLine[0]
    $args = $args & $CmdLine[$i] & " "
    $i = $i + 1
wend
FileCreateShortcut( @WorkingDir & "\Support\ModMii.bat", @WorkingDir & "\Support\ModMii.lnk", @WorkingDir, $args, "", @WorkingDir & "\Support\icon.ico" )
ShellExecute(@WorkingDir & "\Support\ModMii.lnk")