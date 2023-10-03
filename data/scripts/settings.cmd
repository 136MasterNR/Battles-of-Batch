IF NOT DEFINED VERCODE EXIT
SET NEW.VALUE=
SET "FILE=%SETTINGS.LOAD%"
CALL :%1 %2 %3 %4 || EXIT /B 1
EXIT /B 0

:SET
IF "%1"=="TRUE" (SET NEW.VALUE=FALSE)ELSE SET NEW.VALUE=TRUE
SET /A Line#ToSearch=%2
SET "Replacement=SET %3=%NEW.VALUE%"
CALL "%SAVE%" "FILE=%SETTINGS.LOAD%" %2 /S %3= %NEW.VALUE%
CALL %SETTINGS.LOAD%

:: Commands for specific settings
IF %3==RICHPRESENCE.VALUE IF %RICHPRESENCE.VALUE%==FALSE (
	TASKKILL /F /IM "easyrp.exe" /T>NUL
) ELSE IF %RICHPRESENCE.VALUE%==TRUE (
	START /MIN "RichManager" "%RichManager%"
	START /MIN "RichManager" "%RichManager%" START
)
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
IF %AUDIO.VALUE%==TRUE (
	IF %AUDIO.VALUE%==TRUE IF %VOLUME% NEQ 0 START "" /MIN CMD /C "%AUDIOMANAGER%" STOPALL
	SET NEW.VALUE=FALSE
) ELSE ( 
	SET NEW.VALUE=TRUE
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
IF %AUDIO.VALUE%==TRUE IF %VOLUME% NEQ 0 CALL "%AUDIOMANAGER%" START system\villageambiance.mp3 menu True %VOLUME%
EXIT /B 0


:VOLUME
IF NOT DEFINED VERCODE EXIT
SET "FILE=%SETTINGS.LOAD%"

FOR /F "TOKENS=1,2DELIMS= " %%1 IN ("%UDERFINE%") DO (
	SET "TMP.SETT=%%1"
	SET "NEW.VALUE=%%2"
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
	ECHO.[1A[2C[1;31mPlease enter a number in range of 1 and 100.
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

IF /I %TMP.SETT%==SFX (
	CALL "%SAVE%" "FILE=%SETTINGS.LOAD%" 3 /S SFX.VOLUME= %NEW.VALUE%
) ELSE (
	CALL "%SAVE%" "FILE=%SETTINGS.LOAD%" 2 /S VOLUME= %NEW.VALUE%
)
CALL %SETTINGS.LOAD%

IF /I "%TMP.SETT: =%"=="VOLUME" IF %AUDIO.VALUE%==TRUE IF %VOLUME% NEQ 0 (
	CALL "%AUDIOMANAGER%" STOPALL
	CALL "%AUDIOMANAGER%" START system\villageambiance.mp3 menu True %VOLUME%
) ELSE START "" /MIN CMD /C "%AUDIOMANAGER%" STOPALL
EXIT /B 0
