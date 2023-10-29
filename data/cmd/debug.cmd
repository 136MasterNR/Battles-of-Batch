@ECHO OFF

SET ARGS=%*
IF DEFINED ARGS (
	CLS
	CALL :%ARGS%
	EXIT /B 0
)

IF NOT DEFINED DM (
	ECHO.There was an error.
	EXIT /B 0
)

IF EXIST "%DM%\LET.DEBUG" (DEL "%DM%\LET.DEBUG"&&ECHO.Debug mode disabled.&SET "DEBUG.MODE=") ELSE ECHO.>"%DM%\LET.DEBUG"&&ECHO.Debug mode enabled.&SET "DEBUG.MODE=TRUE"
ECHO ON
@EXIT /B 0





:wscript <[RAW]>
IF /I NOT %1.==RAW. (
	ECHO.[H-----------------------------------------------------------------------------
	FOR /F "TOKENS=1,9DELIMS=," %%1 IN ('TASKLIST /V /FO CSV ^| FINDSTR /C:"wscript"') DO (
		ECHO.Process: %%1
		ECHO.[1A[34CTitle: %%2
		ECHO.-----------------------------------------------------------------------------
	)
) ELSE (
	ECHO.[H
	TASKLIST /V /FO CSV | FINDSTR /C:"wscript"
)

GOTO wscript





:choice <[RAW]>
%CHOICE%
ECHO.%CHOICE.INPUT%
ECHO.%CHOICE.INPUT% | CLIP
IF %CHOICE.INPUT%==TIMEOUT EXIT /B 0

GOTO choice
