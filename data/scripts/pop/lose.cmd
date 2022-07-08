IF NOT DEFINED VERCODE EXIT
IF NOT %PLAYER.MONEY% LEQ 0 (
	SET /A PLAYER.MONEY.LOSE=%random% %% 5 +5
	SET /A PLAYER.MONEY-=%PLAYER.MONEY.LOSE%
	SET "file=%DATA_SAVES%\PLAYERDATA.cmd"
	SET /A Line#ToSearch=1
	SET "Replacement=SET PLAYER.MONEY=%PLAYER.MONEY"
	(FOR /F "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
		SET "Line=%%b"
		IF %%a equ !Line#ToSearch! SET "Line=%Replacement%"
		SETLOCAL ENABLEDELAYEDEXPANSION
		ECHO(!Line!
		ENDLOCAL
	))>"%file%.new"
	MOVE "%file%.new" "%file%">NUL
)
SET "file=%DATA_SAVES%\QUESTS.cmd"
SET /A Line#ToSearch=3
SET /A Q.LOSE=%Q.LOSE%+1
SET "Replacement=SET Q.LOSE=%Q.LOSE%"
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
    SET "Line=%%b"
    IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!Line!
    ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
SET GAME.STATUS=LOSE
CLS
ECHO.You died! You lost $%PLAYER.MONEY.LOSE%...
ECHO.Press any key to return to the Menu.
PAUSE>NUL