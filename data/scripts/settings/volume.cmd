IF NOT DEFINED VERCODE EXIT
SET NEW.VALUE=%UDERFINE:~7%
IF NOT DEFINED NEW.VALUE (
	ECHO.[1A[2C[1;31mPlease type a number after the volume command.
	TIMEOUT /T 5 >NUL
	GOTO SETTINGS
)
SET "VAR="
SETLOCAL ENABLEDELAYEDEXPANSION 
FOR /F "DELIMS=0123456789" %%I IN ("%NEW.VALUE%") DO SET "DEFINEVOLUME=%%I"
IF DEFINED DEFINEVOLUME (
	ECHO.[1A[2C[1;31mPlease enter a number which is around 1 and 100.
	TIMEOUT /T 5 >NUL
	GOTO SETTINGS
)
ENDLOCAL
IF %NEW.VALUE% GTR 100 (
	ECHO.[1A[2C[1;31mNumber is too large! Please enter a number around 1 and 100.
	TIMEOUT /T 5 >NUL
	GOTO SETTINGS
)
IF %NEW.VALUE% LEQ 0 (
	ECHO.[1A[2C[1;31mNumber is too short! Please enter a number around 1 and 100.
	TIMEOUT /T 5 >NUL
	GOTO SETTINGS
)
SET "FILE=%SETTINGS.LOAD%"
SET /A Line#ToSearch=2
SET "Replacement=SET VOLUME=%NEW.VALUE%"
(FOR /F "tokens=1*delims=:" %%a IN ('findstr /n "^" "%FILE%"') DO (
	SET "Line=%%b"
	IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!Line!
	ENDLOCAL
))>"%FILE%.new"
MOVE "%FILE%.new" "%FILE%">NUL
CALL %SETTINGS.LOAD%
IF %AUDIO.VALUE%==TRUE IF EXIST "%TARGETAUDIO%" (
	TASKKILL /F /FI "WINDOWTITLE eq wscript.exe" /T>NUL
	(
		ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
		ECHO Sound.URL = "%TARGETAUDIO%"
		ECHO Sound.Controls.play
		ECHO Sound.settings.volume = %VOLUME%
		ECHO Sound.settings.setMode "loop", True
		ECHO Sound.Controls.play
		ECHO While Sound.playState ^<^> 1
		ECHO      WScript.Sleep 100
		ECHO Wend
	) > "%DATA_TMP_A%"
	START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP_A%"^&EXIT
)
GOTO :EOF