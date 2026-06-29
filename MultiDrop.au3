AutoItSetOption("TrayIconHide", 1)
	FileCreateShortcut(@ComSpec, @ScriptDir & "\MultiDrop.lnk", @ScriptDir, '/c call "' & @ScriptDir & '\MultiDrop.bat"', "", @ScriptDir & "\MultiDrop.ico")
	ShellExecute(@ScriptDir & "\MultiDrop.lnk")