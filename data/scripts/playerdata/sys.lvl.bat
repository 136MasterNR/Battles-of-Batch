IF NOT DEFINED VERCODE EXIT
SET "file=%DATA_SAVES%\PLAYERDATA.cmd"
:DO
IF NOT %PLAYER.XP% GEQ %PLAYER.XP.REQ% ( GOTO :EOF )
IF %PLAYER.LVL% LSS 50 (
	SET /A PLAYER.LVL+=1
	IF %PLAYER.XP.REQ%==INF SET PLAYER.XP.REQ=50
	SET /A PLAYER.XP.REQ*=2
) ELSE IF %PLAYER.LVL% GEQ 25 (
	SET /A PLAYER.LVL=25
	SET PLAYER.XP.REQ=INF
)
SET /a Line#ToSearch=3
SET "Replacement=SET PLAYER.LVL=%PLAYER.LVL%"
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
    SET "Line=%%b"
    IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!Line!
    ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
SET /a Line#ToSearch=7
SET "Replacement=SET PLAYER.XP.REQ=%PLAYER.XP.REQ%"
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
    SET "Line=%%b"
    IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!Line!
    ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
GOTO DO