IF NOT DEFINED VERCODE EXIT
IF "%DENIED_AUDIO%"=="TRUE" (
	CLS
	ECHO.X=Msgbox^("Audio is unsupported on your device. Your device does not meet the audio requirements.",0+48,"Audio is unsupported."^)> "%DATA_TMP%\TMP_BOX.vbs"
	START /wait "" "%DATA_TMP%\TMP_BOX.vbs"
	DEL /Q "%DATA_TMP%\TMP_BOX.vbs"
	GOTO SETTINGS
)
SET NEW.VALUE=
IF %AUDIO.VALUE%==TRUE ( SET NEW.VALUE=FALSE) ELSE ( 
	SET NEW.VALUE=TRUE
	START /min "" "%AudioManager%"
)
SET "FILE=%SETTINGS.LOAD%"
SET /A Line#ToSearch=1
SET "Replacement=SET AUDIO.VALUE=%NEW.VALUE%"
(FOR /F "tokens=1*delims=:" %%a IN ('findstr /n "^" "%FILE%"') DO (
	SET "Line=%%b"
	IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!Line!
	ENDLOCAL
))>"%FILE%.new"
MOVE "%FILE%.new" "%FILE%">NUL
CALL "%SETTINGS.LOAD%"
CALL "%MENU.AUDIO%"
GOTO :EOF