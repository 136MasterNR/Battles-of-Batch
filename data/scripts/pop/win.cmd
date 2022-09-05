IF NOT DEFINED VERCODE EXIT
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("%REWARD.XP%") DO SET /A PLAYER.XP.NEW=%random% %% %%A %%B
SET /A PLAYER.XP+=%PLAYER.XP.NEW%
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("%REWARD.MONEY%") DO SET /A PLAYER.MONEY.NEW=%random% %% %%A %%B
SET /A PLAYER.MONEY+=%PLAYER.MONEY.NEW%
IF DEFINED LOOT.1 (
SETLOCAL ENABLEDELAYEDEXPANSION
SET "STR=%LOOT.1:_= % [0m^(x%LOOT.1.X%^)"
CALL "%CENTER%" 28
)
ENDLOCAL&SET "UI.LOOT.1=%STR%"
IF DEFINED LOOT.2 (
SETLOCAL ENABLEDELAYEDEXPANSION
SET "STR=%LOOT.2:_= % [0m^(x%LOOT.2.X%^)"
CALL "%CENTER%" 28
)
ENDLOCAL&SET "UI.LOOT.2=%STR%"
IF %LOOT_ONCE%==TRUE (SET TMP.ONE_TIME=%SELECTED%) ELSE SET TMP.ONE_TIME=%PLAYER.MAP.LEVEL%
COLOR 08
ECHO.[0;0H[16B[45C[1;37m.                        .
ECHO.[44C[1m-[4m^|[0m[1m- %RGB%84;255;130m You Won The Battle [1;37m -[4m^|[0m[1m-
ECHO.[44C[1m.'                        '.
ECHO.[44C[1m:                          :[%5C[26D%RGB%179;233;255mBattle: %SELECTED% - Chapter: 1[1;37m
ECHO.[44C[1m:                          :
ECHO.[44C: - - - : Rewards : - - - -:
ECHO.[44C:                          :[21D%RGB%179;233;255m %RGB.COIN%[4m%PLAYER.MONEY.NEW% Coins[0m[1;37m
ECHO.[44C[1m:                          :[21D%RGB%179;233;255m %RGB.LVL%[4m%PLAYER.XP.NEW% XP[0m[1;37m
ECHO.[44C:                          :
IF %PLAYER.MAP.LEVEL%==%TMP.ONE_TIME% (IF DEFINED LOOT.1 (ECHO.[44C: - - : Dropped Loot : - - :
ECHO.[44C:  %RGB.GREEN%%UI.LOOT.1%[1m :
IF NOT DEFINED LOOT.2 ECHO.[44C:                          :)
IF DEFINED LOOT.2 (ECHO.[44C:  %RGB.GREEN%%UI.LOOT.2%[1m :
ECHO.[44C:                          :))
ECHO.[44C[1;37m^|____________[4m[sOK[0m[1;37m____________^|
SET /P "=[u"<NUL
PAUSE>NUL%SELF_INPUT%
TITLE %TITLE%Saving ...
IF %PLAYER.MAP.LEVEL%==%TMP.ONE_TIME% (
SETLOCAL ENABLEDELAYEDEXPANSION
CALL "%ITEMS.LOADER%" REPLACE-MAT %LOOT.1% %LOOT.1.X% %LOOT.1.SAV%
IF ERRORLEVEL 60 IF DEFINED LOOT.1 IF %LOOT.1.SAV%==WEAPONS (ECHO.%LOOT.1%$%LOOT.1.X%$0>>"!PLAYERDATA.%LOOT.1.SAV%!") ELSE ECHO.%LOOT.1%$%LOOT.1.X%>>"!PLAYERDATA.%LOOT.1.SAV%!"
CALL "%ITEMS.LOADER%" REPLACE-MAT %LOOT.2% %LOOT.2.X% %LOOT.2.SAV%
IF ERRORLEVEL 60 IF DEFINED LOOT.2 IF %LOOT.2.SAV%==WEAPONS (ECHO.%LOOT.2%$%LOOT.2.X%$0>>"!PLAYERDATA.%LOOT.2.SAV%!") ELSE ECHO.%LOOT.2%$%LOOT.2.X%>>"!PLAYERDATA.%LOOT.2.SAV%!"
ENDLOCAL
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