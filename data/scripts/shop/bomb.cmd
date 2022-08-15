IF NOT DEFINED VERCODE EXIT
IF NOT DEFINED SHOP.BOMB.AMOUNT SET SHOP.BOMB.AMOUNT=1
SET MAX.ITEMS=%SHOP.MAX.BOMB%
SET /A ITEM.BOMB.COST=SHOP.PRICE.BOMB*SHOP.BOMB.AMOUNT
SET /A ITEM.BOMB.COUNT.T=%PLAYER.ITEM.BOMB%+%SHOP.BOMB.AMOUNT%
SET /A ITEM.HOLD.MORE.BOMB=MAX.ITEMS-PLAYER.ITEM.BOMB
IF NOT %PLAYER.LVL% GEQ %SHOP.LVLREQ.BOMB% (
	ECHO.[1A[48C%RGB%255;0;0mThis item is locked!
	PAUSE>NUL
	EXIT /B 0
)
IF %SHOP.BOMB.AMOUNT% GTR 100 (
	ECHO.[2B[40C%RGB%255;0;0mYou can only buy 100 items at a time!
	PAUSE>NUL
	EXIT /B 0
)
IF %ITEM.BOMB.COUNT.T% GTR %MAX.ITEMS% (
	ECHO.[2B[18C%RGB%255;0;0mYou currently have %PLAYER.ITEM.BOMB%/%MAX.ITEMS% of this item! You can't buy any more than %ITEM.HOLD.MORE.BOMB% at this time!
	PAUSE>NUL
	EXIT /B 0
)
IF %PLAYER.MONEY% LSS %ITEM.BOMB.COST% (
	ECHO.[1A[44C%RGB%255;0;0mYou don't have enough money!
	PAUSE>NUL
	EXIT /B 0
)
SET "file=%DATA_SAVES%\PLAYERDATA.cmd"
SET /A Line#ToSearch=6
SET /A SAV.COUNT.BOMB=PLAYER.ITEM.BOMB+SHOP.BOMB.AMOUNT
SET "Replacement=SET PLAYER.ITEM.BOMB=%SAV.COUNT.BOMB%"
(FOR /F "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
    SET "Line=%%b"
    IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!Line!
    ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
SET /A PLAYER.MONEY-=%ITEM.BOMB.COST%
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