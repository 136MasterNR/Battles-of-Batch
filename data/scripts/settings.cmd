IF NOT DEFINED VERCODE EXIT
SET NEW.VALUE=
SET "FILE=%SETTINGS.LOAD%"
CALL :%1 %2 %3 %4 || EXIT /B 1
EXIT /B 0

:SET
IF "%1"=="TRUE" (SET NEW.VALUE=FALSE)ELSE SET NEW.VALUE=TRUE
SET /A Line#ToSearch=%2
SET "Replacement=SET %3=%NEW.VALUE%"
(FOR /F "tokens=1*delims=:" %%a IN ('findstr /n "^" "%FILE%"') DO (
	SET "Line=%%b"
	IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!Line!
	ENDLOCAL
))>"%FILE%.new"
MOVE "%FILE%.new" "%FILE%">NUL
CALL %SETTINGS.LOAD%
EXIT /B 0

:AUDIO
IF "%DENIED_AUDIO%"=="TRUE" (
	CLS
	ECHO.X=Msgbox^("Audio is unsupported on your device. Your device does not meet the audio requirements.",0+48,"Audio is unsupported."^)> "%DATA_TMP%\TMP_BOX.vbs"
	START /wait "" "%DATA_TMP%\TMP_BOX.vbs"
	DEL /Q "%DATA_TMP%\TMP_BOX.vbs"
	GOTO SETTINGS
)
IF %AUDIO.VALUE%==TRUE ( SET NEW.VALUE=FALSE) ELSE ( 
	SET NEW.VALUE=TRUE
	START /min "" "%AudioManager%"
)
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
EXIT /B 0


:VOLUME
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
EXIT /B 0