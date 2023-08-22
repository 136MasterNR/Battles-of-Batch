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
	ECHO.Read the popup.
	START /wait "" "%DATA_TMP%\TMP_BOX.vbs"
	DEL /Q "%DATA_TMP%\TMP_BOX.vbs"
	GOTO SETTINGS
)
IF %AUDIO.VALUE%==TRUE ( SET NEW.VALUE=FALSE) ELSE ( 
	SET NEW.VALUE=TRUE
	START /MIN "" "%AudioManager%" /I
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
SET "FILE=%SETTINGS.LOAD%"

FOR /F "TOKENS=2DELIMS= " %%1 IN ("%UDERFINE%") DO (
	SET "NEW.VALUE=%%1"
)

IF /I %UDERFINE:~0,3%.==SFX. (
	SET LINE#TOSEARCH=3
	SET "REPLACEMENT=SET SFX.VOLUME=%NEW.VALUE%"
) ELSE (
	SET LINE#TOSEARCH=2
	SET "REPLACEMENT=SET VOLUME=%NEW.VALUE%"
)

IF NOT DEFINED NEW.VALUE (
	ECHO.[1A[2C[1;31mPlease enter a number after the volume command.
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
IF %NEW.VALUE:~0,1% EQU 0 IF NOT %NEW.VALUE:~1,1%[==[ (
	ECHO.[1A[2C[1;31mPlease enter a valid number after the volume command.
	TIMEOUT /T 5 >NUL
	GOTO SETTINGS
)
IF %NEW.VALUE% GTR 100 (
	ECHO.[1A[2C[1;31mNumber is too large! Please enter a number in range of 0 and 100.
	TIMEOUT /T 5 >NUL
	GOTO SETTINGS
)
IF %NEW.VALUE% LSS 0 (
	ECHO.[1A[2C[1;31mNumber is too short! Please enter a number in range of 0 and 100.
	TIMEOUT /T 5 >NUL
	GOTO SETTINGS
)

(FOR /F "TOKENS=1*DELIMS=:" %%A IN ('findstr /n "^" "%FILE%"') DO (
	SET "LINE=%%B"
	IF %%A EQU %LINE#TOSEARCH% SET "LINE=%REPLACEMENT%"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!LINE!
	ENDLOCAL
))>"%FILE%.new"
MOVE "%FILE%.new" "%FILE%">NUL
CALL %SETTINGS.LOAD%

IF %AUDIO.VALUE%==TRUE TASKKILL /F /FI "WINDOWTITLE eq wscript.exe" /T>NUL
IF %AUDIO.VALUE%==TRUE IF %VOLUME% NEQ 0 IF EXIST "%TARGETAUDIO%" (
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
