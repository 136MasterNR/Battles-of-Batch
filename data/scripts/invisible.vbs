Set objShell = CreateObject("WScript.Shell")

Dim strArgs
For i = 1 To WScript.Arguments.Count - 1
	strArgs = strArgs & WScript.Arguments(i) & " "
Next

objShell.Run Chr(34) & WScript.Arguments(0) & Chr(34) & " " & strArgs, 0, True
