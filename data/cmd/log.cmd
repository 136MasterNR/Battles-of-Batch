@ECHO OFF

:: Config
SET "logFile=..\logs\errors.txt"

IF /I %1==CLEAR BREAK>"%logFile%"

IF /I %1==LIVE START "" "%~dpfx0" __LIVE
IF %1==__LIVE GOTO :LIVE

ECHO ON
@EXIT /B 0





:LIVE
SET OZ=0
SET CONN_TRUE=1
SET CONN_FALSE=1

:LOGEXIST
IF NOT EXIST "%logFile%" (
	TITLE Waiting for log ... ^(%TIME%^)
	TIMEOUT /T 1 1>NUL 2>NUL >NUL
	GOTO LOGEXIST
)
TITLE Now Live Logging - %logFile%'

:REPEAT
IF NOT EXIST "%logFile%" (
    ECHO.[0;1mERROR: The log file was not found.
	PAUSE>NUL&EXIT
) 1>NUL 2>NUL >NUL

SET LL=
COPY "%logFile%" ".\logLogger.txt" >NUL
FOR /F "usebackq" %%A IN ('%logFile%') DO SET Z=%%~zA

IF %OZ%==%Z% GOTO REPEAT

SET OZ=%Z%
TIMEOUT /T 1 >NUL
CLS
TYPE .\logLogger.txt
TITLE Now Live Logging - %logFile%
ENDLOCAL
ECHO.
ECHO.%LL%[1A

GOTO REPEAT
