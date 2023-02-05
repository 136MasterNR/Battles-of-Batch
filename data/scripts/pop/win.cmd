IF NOT DEFINED VERCODE EXIT
SET DROPPED_LOOT=
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("%REWARD.XP%") DO SET /A PLAYER.XP.NEW=%random% %% (1+%%B) +%%A
SET /A PLAYER.XP+=%PLAYER.XP.NEW%
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("%REWARD.MONEY%") DO SET /A PLAYER.MONEY.NEW=%random% %% (1+%%B) +%%A
SET /A PLAYER.MONEY+=%PLAYER.MONEY.NEW%
COLOR 08
ECHO.[15;45H[1;37m .                        . 
ECHO.[44C[1m-[4m^|[0m[1m- %RGB%84;255;130m You Won The Battle [1;37m -[4m^|[0m[1m-
ECHO.[44C[1m.'                        '.
ECHO.[44C[1m:                          :[%5C[26D%RGB%179;233;255mBattle: %SELECTED% - Chapter: 1[1;37m
ECHO.[44C[1m:                          :
ECHO.[44C: - - - : Rewards : - - - -:
ECHO.[44C:                          :[21D%RGB%179;233;255m %RGB.COIN%[4m%PLAYER.MONEY.NEW% Coins[0m[1;37m
ECHO.[44C[1m:                          :[21D%RGB%179;233;255m %RGB.LVL%[4m%PLAYER.XP.NEW% XP[0m[1;37m
IF %LOOT.1.ONCE%==TRUE (SET "TMP=IF %SELECTED% EQU %PLAYER.MAP.LEVEL% ") ELSE SET "TMP="
FOR /L %%I IN (1, 1, %LOOT.MAX%) DO (
	CALL :DISPLAY-LOOT %%I
)
ECHO.[44C:                          :
ECHO.[44C[1;37m:----------: [4m[sOK[0m[1;37m :----------:
SET /P "=[u"<NUL
PAUSE>NUL
TITLE %TITLE%Saving ...
FOR /L %%I IN (1, 1, %LOOT.MAX%) DO (
	CALL :SAVE-LOOT %%I
)
CALL "%PLAYERDATA.XP%"
CALL "%PLAYERDATA.MONEY%"
IF NOT %SELECTED% GEQ %PLAYER.MAP.LEVEL% GOTO SKIP-SAVE
SET /A PLAYER.MAP.LEVEL+=1
SET "file=%DATA_SAVES%\PLAYERDATA.cmd"
SET /A Line#ToSearch=4
SET "Replacement=SET PLAYER.MAP.LEVEL=%PLAYER.MAP.LEVEL%"
(FOR /F "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
    SET "Line=%%b"
    IF %%a EQU %Line#ToSearch% SET "Line=%Replacement%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!Line!
    ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
:SKIP-SAVE
SET /A Line#ToSearch=6
SET /A COMPLETED.MAPS=COMPLETED.MAPS+1
SET "Replacement=SET COMPLETED.MAPS=%COMPLETED.MAPS%"
(FOR /F "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
    SET "Line=%%b"
    IF %%a EQU %Line#ToSearch% SET "Line=%Replacement%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!Line!
    ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
SET "file=%DATA_SAVES%\QUESTS.cmd"
SET /A Line#ToSearch=1
SET /A Q.TOTAL_MONSTERS=%Q.TOTAL_MONSTERS%+3
SET "Replacement=SET Q.TOTAL_MONSTERS=%Q.TOTAL_MONSTERS%"
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%file%"') DO (
    SET "Line=%%b"
    IF %%a equ %Line#ToSearch% SET "Line=%Replacement%"
    SETLOCAL ENABLEDELAYEDEXPANSION
    ECHO(!Line!
    ENDLOCAL
))>"%file%.new"
MOVE "%file%.new" "%file%">NUL
EXIT /B 0

:DISPLAY-LOOT
SETLOCAL ENABLEDELAYEDEXPANSION
IF !LOOT.%1.X! EQU 0 EXIT /B 0
IF !LOOT.%1.ONCE!==TRUE (
	IF %SELECTED% NEQ %PLAYER.MAP.LEVEL% EXIT /B 0
	SET "LOOT.ONCE.MSG=ONCE"
) ELSE SET "LOOT.ONCE.MSG="
IF NOT DEFINED DROPPED_LOOT (
	ECHO.[44C:                          :
	ECHO.[44C: - - : Dropped Loot : - - :
	SET DROPPED_LOOT=TRUE
)
SET "STR=!LOOT.%1:_= ! [0mx!LOOT.%1.X! %LOOT.ONCE.MSG%"
CALL "%CENTER%" 26
ECHO.[44C:  %RGB.GREEN%!STR![1m :
ENDLOCAL&SET DROPPED_LOOT=%DROPPED_LOOT%
EXIT /B 0

:SAVE-LOOT
SETLOCAL ENABLEDELAYEDEXPANSION
IF !LOOT.%1.X! EQU 0 EXIT /B 0
IF !LOOT.%1.ONCE!==TRUE IF %SELECTED% NEQ %PLAYER.MAP.LEVEL% EXIT /B 0
CALL "%ITEMS.LOADER%" REPLACE-MAT !LOOT.%1! !LOOT.%1.X! !LOOT.%1.SAV!
SET TMP=!LOOT.%1.SAV!
IF ERRORLEVEL 60 IF !TMP!==WEAPONS (ECHO.!LOOT.%1!$!LOOT.%1.X!$0>>"!PLAYERDATA.%TMP%!") ELSE ECHO.!LOOT.%1!$!LOOT.%1.X!>>"!PLAYERDATA.%TMP%!"
ENDLOCAL
EXIT /B 0