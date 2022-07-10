IF NOT DEFINED VERCODE EXIT
IF %PLAYER.ITEM.HEAL% LSS 1 (
	ECHO.[47;3H%RGB%255;18;18mYou don't have enough items![0m
	PAUSE>NUL
	ECHO.[47;3H                            
	GOTO :EOF
)
SET "file=%DATA_SAVES%\PLAYERDATA.cmd"
SET /A Line#ToSearch=5
SET /A PLAYER.ITEM.HEAL-=1
SET "Replacement=SET PLAYER.ITEM.HEAL=%PLAYER.ITEM.HEAL%"
(FOR /F "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
	SET "Line=%%b"
	IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!Line!
	ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
SET /A "PLAYER.HEAL.AMOUNT=%random% %% 17 +43"
IF NOT %PLAYER.HP.NOW% GEQ %PLAYER.HP.FULL% SET /A "PLAYER.HP.NOW=%PLAYER.HP.NOW% +%PLAYER.HEAL.AMOUNT%"
IF %PLAYER.HP.NOW% GTR %PLAYER.HP.FULL% (
	SET /A "PLAYER.HP.NOW=%PLAYER.HP.FULL%"
	SET PLAYER.HEAL.AMOUNT=0
)
CALL "%ACT.ENEMY_ATK%"
GOTO :EOF