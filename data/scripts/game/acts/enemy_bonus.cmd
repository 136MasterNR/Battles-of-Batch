IF NOT DEFINED VERCODE EXIT
SETLOCAL ENABLEDELAYEDEXPANSION
SET TMP.ENEMY=!ENEMY.TYPE.%1!
ENDLOCAL&SET TMP.ENEMY=%TMP.ENEMY%
CALL :%TMP.ENEMY% %1 || EXIT /B 0
EXIT /B 0






:Y <"Enemy ID": Integer>
IF %ENEMY_MISS%==TRUE EXIT /B 0

:: Extract the ATK values from the enemy
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "TOKENS=1,2DELIMS=," %%A IN ("!ENEMY.ATK.AMOUNT.%1!") DO (
	ENDLOCAL
	SET /A "TMP.DMG=%random% %% %%A %%B"
)
SET /A "TMP.CHANCE=%random% %% 100"
SET /A "TMP.AMOUNT=%random% %% 1 +1"

IF DEFINED EFF.FIRE.PLAYER IF %TMP.AMOUNT% LEQ %EFF.FIRE.PLAYER.POWER% EXIT /B 0

IF %TMP.CHANCE% LEQ 20 CALL "%SCRIPTS_GAME%\acts\effect.cmd" FIRE-CREATE PLAYER %TMP.AMOUNT% %TMP.DMG%
EXIT /B 0






:N <"Enemy ID": Integer>
:: Chance
SET /A TMP.RND=%random% %% 4 +1
IF %TMP.RND% LEQ 3 (
	SET LET_ENEMY_ATK=FALSE
) ELSE EXIT /B 0

:: Check if at least one enemy is alive, except itself.
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /L %%I IN (1, 1, %EN.MAX%) DO (
	IF /I NOT !ENEMY.TYPE.%%I!==N IF !ENEMY.HP.NOW.%%I! GTR 0 (
		ENDLOCAL
		GOTO N-RE
	)
)
ENDLOCAL

SET AV.%1+=10
SET LET_ENEMY_ATK=TRUE
EXIT /B 0

:N-RE
SET /A TMP.RND=%random% %% %EN.MAX% +1
IF %TMP.RND%==%1 GOTO N-RE

:: Find the right enemy to support
SETLOCAL ENABLEDELAYEDEXPANSION
IF !ENEMY.HP.NOW.%TMP.RND%! LEQ 0 (
	ENDLOCAL
	GOTO N-RE
)
IF /I !ENEMY.TYPE.%TMP.RND%!==N (
	ENDLOCAL
	GOTO N-RE
)
ENDLOCAL

:: And finally, initiate the effect
SET /A AV.%TMP.RND%-=AV.%TMP.RND%

:: Log the action
SETLOCAL ENABLEDELAYEDEXPANSION
SET TMP.ENEMY2=!ENEMY.TYPE.%TMP.RND%!
SET TMP.ENEMY=!ENEMY.TYPE.%1!
ENDLOCAL&SET TMP.ENEMY=%TMP.ENEMY%&SET TMP.ENEMY2=%TMP.ENEMY2%
CALL "%SCRIPTS_GAME%\logger.cmd" ADD Enemy [4m%TMP.ENEMY%[24m ^(#%1^) has %RGB.CYAN%advanced forward[0m[1m enemy [4m%TMP.ENEMY2%[24m ^(#%TMP.RND%^)!%RGB.YELLOW%
EXIT /B 0






:F <"Enemy ID": Integer>
IF %ENEMY_MISS%==TRUE EXIT /B 0

SET /A TMP.DMG=ENEMY.LVL.%1 * 2

IF DEFINED EFF.BLEED.PLAYER IF %TMP.DMG% LEQ %EFF.BLEED.PLAYER.POWER% EXIT /B 0

SET /A TMP.RND=%random% %% 4 +1
IF %TMP.RND% LEQ 3 (
	CALL "%SCRIPTS_GAME%\acts\effect.cmd" BLEED-CREATE PLAYER %TMP.DMG%
)
EXIT /B 0






:S <"Enemy ID": Integer>
IF %ENEMY_MISS%==TRUE EXIT /B 0

:: Extract the ATK values from the enemy
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "TOKENS=1,2DELIMS=," %%A IN ("!ENEMY.ATK.AMOUNT.%1!") DO (
	ENDLOCAL
	SET /A "TMP.DMG=(%random% %% %%A %%B)*3"
)

IF DEFINED EFF.POISON.PLAYER IF %TMP.DMG% LEQ %EFF.POISON.PLAYER.POWER% EXIT /B 0

CALL "%SCRIPTS_GAME%\acts\effect.cmd" POISON-CREATE PLAYER 3 %TMP.DMG%
EXIT /B 0





:D <"Enemy ID": Integer>
:: Make sure enemy with the specific criteria exists
SET TMP.MIN=2147483647
SET TMP.TARGET=
FOR /L %%I IN (1, 1, %EN.MAX%) DO (
	SETLOCAL ENABLEDELAYEDEXPANSION
	IF /I NOT !ENEMY.TYPE.%%I!==D IF !ENEMY.HP.NOW.%%I! GTR 0 IF !ENEMY.HP.NOW.%%I! LSS !ENEMY.HP.FULL.%%I! IF !ENEMY.HP.NOW.%%I! LSS !TMP.MIN! (
		ENDLOCAL
		SET /A TMP.MIN=ENEMY.HP.NOW.%%I
		SET TMP.TARGET=%%I
	)
	ENDLOCAL
)
IF %TMP.MIN% EQU 2147483647 (
	EXIT /B 0
)

:: And finally, initiate the unique effect
SET LET_ENEMY_ATK=FALSE
SET /A "TMP.AMOUNT=%random% %% (ENEMY.HP.FULL.%1 * 5 / 100) +(ENEMY.HP.FULL.%1 * 15 / 100)"

SET /A "ENEMY.HP.NOW.%1-=TMP.AMOUNT"
SET /A "ENEMY.HP.NOW.%TMP.TARGET%+=TMP.AMOUNT"

SETLOCAL ENABLEDELAYEDEXPANSION
IF !ENEMY.HP.NOW.%TMP.TARGET%! GTR !ENEMY.HP.FULL.%TMP.TARGET%! (
	ENDLOCAL
	SET /A ENEMY.HP.NOW.%TMP.TARGET%=ENEMY.HP.FULL.%TMP.TARGET%
) ELSE ENDLOCAL

SETLOCAL ENABLEDELAYEDEXPANSION
IF !ENEMY.HP.NOW.%1! LSS 0 (
	ENDLOCAL
	SET /A ENEMY.HP.NOW.%1=0
) ELSE ENDLOCAL

:: Log the action
SETLOCAL ENABLEDELAYEDEXPANSION
SET TMP.ENEMY2=!ENEMY.TYPE.%TMP.TARGET%!
SET TMP.ENEMY=!ENEMY.TYPE.%1!
ENDLOCAL&SET TMP.ENEMY=%TMP.ENEMY%&SET TMP.ENEMY2=%TMP.ENEMY2%
CALL "%SCRIPTS_GAME%\logger.cmd" ADD Enemy [4m%TMP.ENEMY%[24m ^(#%1^) %RGB.PINK%sacrificed[0m[1m %RGB.RED%%TMP.AMOUNT%[0m[1m HP to %RGB.YELLOW%heal[0m[1m [4m%TMP.ENEMY2%[24m ^(#%TMP.RND%^)!
EXIT /B 0





:Goblin <"Enemy ID": Integer>
IF %ENEMY_MISS%==TRUE EXIT /B 0

:: Extract the ATK values from the enemy
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "TOKENS=1,2DELIMS=," %%A IN ("!ENEMY.ATK.AMOUNT.%1!") DO (
	ENDLOCAL
	SET /A "TMP.DMG=%random% %% %%A %%B"
)
CALL "%SCRIPTS_GAME%\acts\effect.cmd" FIRE-CREATE PLAYER 6 %TMP.DMG%
EXIT /B 0





