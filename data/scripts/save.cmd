IF NOT DEFINED VERCODE EXIT
SET "file=%DATA_SAVES%\PLAYERDATA.cmd"
SET /a Line#ToSearch=%1
SET /A NEWVALUE=%3 %4
SET "Replacement=SET %2=%NEWVALUE%"
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
    SET "Line=%%b"
    IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!Line!
    ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
CALL "%DATA_SAVES%\PLAYERDATA.cmd"
GOTO :EOF