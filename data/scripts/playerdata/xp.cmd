IF NOT DEFINED VERCODE EXIT
SET "file=%DATA_SAVES%\PLAYERDATA.cmd"
SET /a Line#ToSearch=2
SET "Replacement=SET PLAYER.XP=%PLAYER.XP%"
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
    SET "Line=%%b"
    IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!Line!
    ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
EXIT /B 0