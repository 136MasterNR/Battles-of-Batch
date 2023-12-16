IF NOT DEFINED VERCODE EXIT
SET "DATA_AUDPLAYER=%CD%\data\scripts\audioplayer.cmd"
SET "DATA_TMP_A=%CD%\data\temp\TMP_AUDIO.vbs"
SET "DATA_AUD=%CD%\data\audio"
CALL :%*
EXIT /B 0

:STOPALL
(TASKKILL /F /FI "WINDOWTITLE eq WSAudio*" /IM "cmd.exe" /T | FINDSTR ":" && (
	TASKKILL /F /FI "WINDOWTITLE eq Administrator:  WSAudio*" /IM "cmd.exe" /T>NUL
)) >NUL
IF EXIST "%DATA_TMP_A%" DEL /Q "%DATA_TMP_A%"
EXIT /B 0

:STOP <"Identifier": String>
(TASKKILL /F /FI "WINDOWTITLE eq WSAudio.%1" /IM "cmd.exe" /T | FINDSTR ":" && (
	TASKKILL /F /FI "WINDOWTITLE eq Administrator:  WSAudio.%1" /IM "cmd.exe" /T>NUL
)) >NUL
EXIT /B 0


:START <"Path": String> <"Identifier": String> <"Loop": Boolean> <"Volume": Integer>
(TASKKILL /F /FI "WINDOWTITLE eq WSAudio.%2" /IM "cmd.exe" /T | FINDSTR ":" && (
	TASKKILL /F /FI "WINDOWTITLE eq Administrator:  WSAudio.%2" /IM "cmd.exe" /T
)) >NUL

SET "TARGETAUDIO=%DATA_AUD%\%1"
IF NOT EXIST "%TARGETAUDIO%" EXIT /B 0

SET TMP.LOOP=%3

(
	ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
	ECHO Sound.URL = "%TARGETAUDIO%"
	ECHO Sound.settings.volume = %4
	ECHO Sound.settings.setMode "loop", %TMP.LOOP%
	ECHO Sound.controls.currentPosition = 0
	ECHO Sound.controls.play
	ECHO While Sound.playState ^<^> 1
	ECHO      WScript.Sleep 10000
	ECHO Wend
) > "%DATA_TMP_A%"

IF EXIST ".\data\scripts\invisible.vbs" (
	START "wscript.exe" ".\data\scripts\invisible.vbs" "%DATA_AUDPLAYER%" %2 %DATA_TMP_A%
) ELSE START /MIN "WSAudio.%2" CMD /C "%DATA_AUDPLAYER%" %2 %DATA_TMP_A%

EXIT /B 0