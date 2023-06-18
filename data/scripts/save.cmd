IF NOT DEFINED VERCODE EXIT

:save.cmd "FILE=<path>" <line> <variable> <value>
SET %1

SET /A LINE#TOSEARCH=%2
SET /A NEWVALUE=%4 %5
SET "REPLACEMENT=SET %3=%NEWVALUE%"

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