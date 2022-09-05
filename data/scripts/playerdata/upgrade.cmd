IF NOT DEFINED VERCODE EXIT
IF %1==MAX (
	ECHO.[1A[44C%RGB%255;0;0mThis skill is already at max!
	PAUSE>NUL
	EXIT /B 0
)
IF NOT %PLAYER.LVL% GEQ %2 (
	ECHO.[1A[44C%RGB%255;0;0mThis skill upgrade is locked!
	PAUSE>NUL
	EXIT /B 0
)
IF %PLAYER.MONEY% LSS %3 (
	ECHO.[1A[44C%RGB%255;0;0mYou don't have enough money!
	PAUSE>NUL
	EXIT /B 0
)
SET "file=%DATA_SAVES%\SKILLS.cmd"
SET /A Line#ToSearch=%4
SET /A SAV=%5+1
SET "Replacement=SET %5=%SAV%"
(FOR /F "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
    SET "Line=%%b"
    IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!Line!
    ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
SET "file=%DATA_SAVES%\PLAYERDATA.cmd"
SET /A PLAYER.MONEY=%PLAYER.MONEY%-%3
SET /a Line#ToSearch=1
SET "Replacement=SET PLAYER.MONEY=%PLAYER.MONEY%"
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
    SET "Line=%%b"
    IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!Line!
    ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
EXIT /B 0