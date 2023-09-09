Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.AppActivate WScript.Arguments.Item(0)
WScript.Quit(0)
