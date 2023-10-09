IF NOT DEFINED VERCODE EXIT
CALL %PLAYERSKILLS.LOAD%
START /MIN "RichManager" "%RichManager%" State=Upgrading skills;Details=Shop;LargeImage=preview_skills;LargeImageTooltip=;SmallImage=icon;SmallImageTooltip=Battles of Batch
TITLE %TITLE%Upgrades Shop
(
ECHO.[?25l[H[0m.---.-----------------------------------------.-------.-------.-------.---------------------------------------------.
ECHO.^| %RGB.PINK%Q[0m ^|                                       Z ^| Craft ^| Items ^| [4m[1mSkill[0m ^| C                                           ^|
ECHO.^|---'                                         '-------'-------'-------'                                             ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|[66D▸ %RGB.CYAN%Level[0m: [0m[1m↑%RGB.CYAN%%PLAYER.LVL%[0m
ECHO.^|                                                                                                                   ^|[66D▸ %RGB.TRUE%Money[0m: %RGB.MONEY%$%PLAYER.MONEY%[0m
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                          [1mUse %RGB.CYAN%[4mW A S D[0m[1m to change selection![0m                                         ^|
ECHO.^|                                                                                                                   ^|
ECHO.'-------------------------------------------------------------------------------------------------------------------'[H
)

SET POS_X=0
SET CNT=0

CALL :CREATE UNKNOWN
CALL :CREATE UNKNOWN
CALL :CREATE UNKNOWN
CALL :CREATE UNKNOWN
CALL :CREATE UNKNOWN
CALL :CREATE UNKNOWN
CALL :CREATE UNKNOWN
CALL :CREATE UNKNOWN
CALL :CREATE UNKNOWN

SET UI_LIST=
SET POS_X=0
SET CNT=0

CALL :CREATE ATK Attack
CALL :CREATE HP Health
CALL :CREATE CRIT_RATE Crit_Rate
CALL :CREATE STO Storage

EXIT /B 0


:CREATE <"Skill Type": String> <"Display Name": String>
SET POS_Y=0
SET /A POS_X=11 + CNT
SET /A CNT+=36

IF %POS_X% GTR 110 (
	SET /A "POS_X=11 + (CNT-(4*36))"
	SET /A POS_Y+=13
)

IF %POS_X% GTR 110 (
	SET /A "POS_X=11 + (CNT-(7*36))"
	SET /A POS_Y+=12
)

IF %1==UNKNOWN (
	ECHO.[7H[%POS_Y%B[%POS_X%C[2D%RGB.GRAY%.--------: Locked :--------.

	ECHO.[%POS_X%C[2D%RGB.GRAY%:                          :
	ECHO.[%POS_X%C[2D%RGB.GRAY%:                          :
	ECHO.[%POS_X%C[2D%RGB.GRAY%'                          '
		
	ECHO.[3A[%POS_X%C%RGB.GRAY%Level: ▸0
	ECHO.[%POS_X%C%RGB.GRAY%Effect: ^?^?^?
	
	ECHO.[2B[%POS_X%C[2D%RGB.GRAY%:                          :
	ECHO.[%POS_X%C[2D%RGB.GRAY%:                          :
	ECHO.[%POS_X%C[2D%RGB.GRAY%:                          :
	ECHO.[%POS_X%C[2D%RGB.GRAY%'--------------------------'
	ECHO.[5A[%POS_X%C[2D.-- %RGB.GRAY%Upgrade Requirements --.
	ECHO.[1B[%POS_X%C[5C%RGB.GRAY%Unknown Stats[0m
	ENDLOCAL
	EXIT /B 0
)

SET /A TMP.SKILL=SKILL.%1

SETLOCAL ENABLEDELAYEDEXPANSION
SET NAME=%2
SET LVL.REQ=
SET SKILL.COST=

:: Extract the level values
FOR /F "TOKENS=%TMP.SKILL%DELIMS=;" %%I IN ("!SKILL.%1.LVLS!") DO (
	SET LVL.REQ=%%I
)
:: Extract the price values
FOR /F "TOKENS=%TMP.SKILL%DELIMS=;" %%I IN ("!SKILL.%1.COST!") DO (
	SET SKILL.COST=%%I
)

:: If not defined, that indicates that extraction has failed
:: to find a new item, which means that it has maxed out.
IF NOT DEFINED LVL.REQ SET LVL.REQ=MAX
IF NOT DEFINED SKILL.COST SET SKILL.COST=0

SET /A NEXT.LVL=SKILL.%1 + 1
SET /A STAT.NUM=SKILL.%1 * SKILL.%1.BASE
SET /A NEXT.STAT.NUM=(SKILL.%1 + 1) * SKILL.%1.BASE

:Output
CALL "%DATA_SCRIPTS%\charcnt.cmd" %NAME%
SET /A UI.LENGTH=((26-CHARCNT)/2) - 2
FOR /L %%I IN (1, 1, !UI.LENGTH!) DO SET UI=!UI!-
SET /A MODULO=!CHARCNT! %% 2

IF !MODULO! EQU 1 (
	SET UI_X=-
) ELSE SET UI_X=

(
ECHO.[7H[%POS_Y%B[%POS_X%C[2D.!UI!: %RGB.YELLOW%%NAME:_= %[0m :!UI!!UI_X!.

ECHO.[%POS_X%C[2D:                          :
ECHO.[%POS_X%C[2D:                          :
ECHO.[%POS_X%C[2D'                          '
ECHO.[3A[%POS_X%C%RGB.BLUE%Level[0m: [1m▸%RGB.CYAN%!SKILL.%1![0m
ECHO.[%POS_X%C%RGB.BLUE%Effect[0m: [1m%1 %RGB.TRUE%+!STAT.NUM![0m

ECHO.[2B[%POS_X%C[2D:                          :
ECHO.[%POS_X%C[2D:                          :
ECHO.[%POS_X%C[2D:                          :
ECHO.[%POS_X%C[2D'--------------------------'
ECHO.[5A[%POS_X%C[2D[0m.-- %RGB.ORANGE%Upgrade Requirements[0m --.
)

:: Check if player is over the required level, then colorize UI accordingly
IF %PLAYER.LVL% GEQ !LVL.REQ! (
	SET C_LVLLOCKED=[0m[1m↑%RGB.CYAN%
) ELSE (
	SET C_LVLLOCKED=%RGB.RED%↑[4m
)

:: Check if player has enough money, then colorize UI accordingly
IF %PLAYER.MONEY% GEQ !SKILL.COST! (
	SET C_MONELOCKED=%RGB.MONEY%$
) ELSE (
	SET C_MONELOCKED=%RGB.RED%$[4m
)

IF !LVL.REQ!==MAX (
	ECHO.[1B[%POS_X%C[5C%RGB.CYAN%Maximum Level[0m
) ELSE (
	ECHO.[%POS_X%C[1m- %RGB.YELLOW%Cost[0m: !C_MONELOCKED!!SKILL.COST![0m : !C_LVLLOCKED!!LVL.REQ![0m
	ECHO.[%POS_X%C[1m+ %RGB.PURPLE%Level[0m: %RGB.LIME%▴!NEXT.LVL![0m
	ECHO.[%POS_X%C[1m+ %RGB.PURPLE%Effect[0m: %RGB.LIGHTGRAY%%1 %RGB.LIME%+!NEXT.STAT.NUM![0m
)

IF !LVL.REQ!==MAX (
	ENDLOCAL
	SET UI_LIST=%UI_LIST%MAX;
) ELSE IF "!C_MONELOCKED!"=="%RGB.RED%$[4m" (
	ENDLOCAL
	SET UI_LIST=%UI_LIST%FALSE;
) ELSE IF "!C_LVLLOCKED!"=="%RGB.RED%↑[4m" (
	ENDLOCAL
	SET UI_LIST=%UI_LIST%FALSE;
) ELSE (
	ENDLOCAL
	SET UI_LIST=%UI_LIST%TRUE;
)

EXIT /B 0
