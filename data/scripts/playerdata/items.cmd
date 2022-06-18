IF NOT EXIST "%PLAYERDATA.ITEMS%" ECHO.>"%PLAYERDATA.ITEMS%"
GOTO %1 %2 %3

:SEARCH
FOR /f "delims=" %%A IN ('FINDSTR %2 %PLAYERDATA.ITEMS%') DO SET TEXT=%%A
SET ITEM.IS=0
FOR /F "tokens=*" %%A IN (%PLAYERDATA.ITEMS%) DO (
	IF %%A==%2 (
		SET ITEM.IS=1
	)
)

EXIT /B %ITEM.IS%



:REPLACE
SET TEXT.IS=FALSE
SET COUNT=0
FOR /F "tokens=*" %%A IN (%PLAYERDATA.ITEMS%) DO (
	SET /A COUNT+=1
	IF %%A==%2 (
		SET TEXT.IS=TRUE
		CALL :FINAL-COUNT
	)
)

IF %TEXT.IS%==FALSE ( ECHO.ITEM NOT FOUND&EXIT /B 0 )

SET /a Line#ToSearch=%FINAL.COUNT%
SET "Replacement=%3"
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%PLAYERDATA.ITEMS%"') DO (
	SET "Line=%%b"
	IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!Line!
	ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
EXIT /B 0

:FINAL-COUNT
SET FINAL.COUNT=%COUNT%
EXIT /B 0