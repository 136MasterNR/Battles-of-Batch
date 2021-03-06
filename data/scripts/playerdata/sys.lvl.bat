IF NOT DEFINED VERCODE EXIT
SET "file=%DATA_SAVES%\PLAYERDATA.cmd"
:DO
IF NOT %PLAYER.XP% GEQ %PLAYER.XP.REQ% ( GOTO :EOF )
IF %PLAYER.LVL% LSS 60 (
	SET /A PLAYER.LVL+=1
	IF %PLAYER.XP.REQ%==INF SET PLAYER.XP.REQ=50
	IF %PLAYER.LVL% LEQ 9 (SET /A PLAYER.XP.REQ=PLAYER.XP.REQ*5) ELSE IF %PLAYER.LVL% LEQ 35 (SET /A PLAYER.XP.REQ=PLAYER.XP.REQ*3) ELSE SET /A PLAYER.XP.REQ=PLAYER.XP.REQ*2
	SET /A PLAYER.XP.REQ=PLAYER.XP.REQ/2
) ELSE IF %PLAYER.LVL% GEQ 50 (
	SET /A PLAYER.LVL=60
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