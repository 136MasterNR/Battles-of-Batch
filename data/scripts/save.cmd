IF NOT DEFINED VERCODE EXIT

:save.cmd "FILE=<path>" <line> [/A] <variable> [<variable>]
SET %1

SET LINE#TOSEARCH=%2
IF %3.==/A. (
	SET /A REPLACEMENT=%5%6%7%8%9
	CALL SET "REPLACEMENT=SET %4=%%REPLACEMENT%%"
) ELSE (
	SET REPLACEMENT=%3=%4%5%6%7%8%9
)

(FOR /f "tokens=1*delims=:" %%A IN ('findstr /n "^" "%FILE%"') DO (
    SET "LINE=%%B"
    IF %%A EQU %LINE#TOSEARCH% SET "LINE=%REPLACEMENT%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!LINE!
    ENDLOCAL
))>"%FILE%.new"

MOVE "%FILE%.new" "%FILE%">NUL
CALL "%DATA_SAVES%\PLAYERDATA.cmd"

EXIT /B 0
