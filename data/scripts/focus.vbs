Dim WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")
Dim ARGS
Set ARGS = WScript.Arguments

' Check if an argument is provided
If ARGS.Count = 0 Then
    WScript.Echo "Usage: focus.vbs ""Window Title"""
    WScript.Quit(1)
End If

' Attempt to activate the window
WshShell.AppActivate ARGS.Item(0)

WScript.Quit(0)
