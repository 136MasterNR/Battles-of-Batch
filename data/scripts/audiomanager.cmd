IF NOT DEFINED VERCODE EXIT
SET "DATA_TMP_A=%CD%\data\temp\TMP_AUDIO.vbs"
SET "DATA_AUD=%CD%\data\audio"
CALL :%*
EXIT /B 0

:STOPALL
TASKKILL /F /FI "WINDOWTITLE eq WSAudio*" /T>NUL
IF EXIST "%DATA_TMP_A%" DEL /Q "%DATA_TMP_A%"
EXIT /B 0

:STOP <"Identifier": String>
TASKKILL /F /FI "WINDOWTITLE eq WSAudio.%1" /T>NUL
EXIT /B 0


:START <"Path": String> <"Indetifier": String> <"Loop": Boolean>
TASKKILL /F /FI "WINDOWTITLE eq WSAudio.%2" /T>NUL
SET "TARGETAUDIO=%DATA_AUD%\%1"
IF NOT EXIST "%TARGETAUDIO%" EXIT /B 0

SET TMP.LOOP=%3

(
	ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
	ECHO Sound.URL = "%TARGETAUDIO%"
	ECHO Sound.settings.volume = %VOLUME%
	ECHO Sound.settings.setMode "loop", %TMP.LOOP%
	ECHO Sound.Controls.play
	ECHO While Sound.playState ^<^> 1
	ECHO      WScript.Sleep 1000
	ECHO Wend
) > "%DATA_TMP_A%"

START /MIN "WSAudio.%2" CMD /C ECHO.AudioPlayer.ID:"%2"^&START /MIN /WAIT "" "%DATA_TMP_A%"

EXIT /B 0

:: IF %AUDIO.VALUE%==TRUE IF %VOLUME% NEQ 0

::CALL "%audiomanager%" START game\battle\winternight.mp3