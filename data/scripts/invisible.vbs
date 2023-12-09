Dim strArgs
For i = 1 To WScript.Arguments.Count - 1
	strArgs = strArgs & WScript.Arguments(i) & " "
Next
CreateObject("WScript.Shell").Run Chr(34) & WScript.Arguments(0) & Chr(34) & " " & strArgs, 0, True
