IF NOT DEFINED VERCODE EXIT
IF NOT DEFINED SHOP.HEAL.AMOUNT SET SHOP.HEAL.AMOUNT=1
SET MAX.ITEMS=%SHOP.MAX.HEAL%
SET /A ITEM.HEAL.COST=SHOP.PRICE.HEAL*SHOP.HEAL.AMOUNT
SET /A ITEM.HEAL.COUNT.T=%PLAYER.ITEM.HEAL%+%SHOP.HEAL.AMOUNT%
SET /A ITEM.HOLD.MORE.HEAL=MAX.ITEMS-PLAYER.ITEM.HEAL
IF NOT %PLAYER.LVL% GEQ %SHOP.LVLREQ.HEAL% (
	ECHO.[1A[48C%RGB%255;0;0mThis item is locked!
	PAUSE>NUL
	EXIT /B 0
)
IF %SHOP.HEAL.AMOUNT% GTR 100 (
	ECHO.[2B[40C%RGB%255;0;0mYou can only buy 100 items at a time!
	PAUSE>NUL
	EXIT /B 0
)
IF %ITEM.HEAL.COUNT.T% GTR %MAX.ITEMS% (
	ECHO.[2B[18C%RGB%255;0;0mYou currently have %PLAYER.ITEM.HEAL%/%MAX.ITEMS% of this item! You can't buy any more than %ITEM.HOLD.MORE.HEAL% at this time!
	PAUSE>NUL
	EXIT /B 0
)
IF %PLAYER.MONEY% LSS %ITEM.HEAL.COST% (
	ECHO.[2B[44C%RGB%255;0;0mYou don't have enough money!
	PAUSE>NUL
	EXIT /B 0
)
SET "file=%DATA_SAVES%\PLAYERDATA.cmd"
SET /A Line#ToSearch=5
SET /A SAV.COUNT.HEAL=PLAYER.ITEM.HEAL+SHOP.HEAL.AMOUNT
SET "Replacement=SET PLAYER.ITEM.HEAL=%SAV.COUNT.HEAL%"
(FOR /F "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
    SET "Line=%%b"
    IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!Line!
    ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
SET /A PLAYER.MONEY-=%ITEM.HEAL.COST%
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