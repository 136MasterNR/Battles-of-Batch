IF NOT DEFINED VERCODE EXIT
CALL :INDIVIDUAL %1
EXIT /B 0

:INDIVIDUAL <Enemy>

:: Reset variables
SET LET_ENEMY_ATK=TRUE
SET ENEMY_MISS=FALSE
FOR /F "TOKENS=1DELIMS==" %%A IN ('SET ENEMY.ATTACK.AMOUNT. 2^>NUL') DO (
	SET %%A=
)

:: Get the enemy
FOR /F "TOKENS=2DELIMS=." %%1 IN ("%1") DO (
	SET TMP.EN=%%1
)

SETLOCAL ENABLEDELAYEDEXPANSION
SET TMP.ENEMY=!ENEMY.TYPE.%TMP.EN%!
ENDLOCAL&SET TMP.ENEMY=%TMP.ENEMY%

:: Check if enemy missed
SET /A "TMP.CHANCE=%random% %% 100"
IF %TMP.CHANCE% LEQ 2 (
	CALL "%SCRIPTS_GAME%\logger.cmd" ADD Enemy [4m%TMP.ENEMY%[24m ^(#%TMP.EN%^) has %RGB.RED%missed[0m[1m!%RGB.YELLOW%[0m
	SET ENEMY_MISS=TRUE
)

:: Unique skills
CALL "%SCRIPTS_GAME%\acts\enemy_bonus.cmd" %TMP.EN%

:: Update the Action Values
CALL "%SCRIPTS_GAME%\turn.cmd" AV-SINGLE %CURR_TURN% %TMP.EN%

:: If enemy is dead, quit
SETLOCAL ENABLEDELAYEDEXPANSION
IF !ENEMY.HP.NOW.%TMP.EN%! LEQ 0 (
	ENDLOCAL
	EXIT /B 0
) ELSE ENDLOCAL

:: Update turns
CALL "%SCRIPTS_GAME%\turn.cmd"

:: Whether to initiate attack sequence, if FALSE then end here
IF %LET_ENEMY_ATK%==FALSE EXIT /B 0

:: If missed, end here
IF %ENEMY_MISS%==TRUE EXIT /B 0

:: Extract the ATK values from the enemy
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "TOKENS=1,2DELIMS=," %%A IN ("!ENEMY.ATK.AMOUNT.%TMP.EN%!") DO (
	ENDLOCAL
	SET /A "ENEMY.ATTACK.AMOUNT.%TMP.EN%=%random% %% (%%A+1) %%B"
)

:: Check if enemy dealt no damage
SETLOCAL ENABLEDELAYEDEXPANSION
IF !ENEMY.ATTACK.AMOUNT.%TMP.EN%! LEQ 0 (
	ENDLOCAL
	CALL "%SCRIPTS_GAME%\logger.cmd" ADD Enemy [4m%TMP.ENEMY%[24m ^(#%TMP.EN%^) did %RGB.YELLOW%nothing[0m[1m![0m[0m[0m[0m[0m
	EXIT /B 0
) ELSE ENDLOCAL

:: Calculate final total damage
SET ENEMY.ATTACK.AMOUNT=0
FOR /F "TOKENS=2DELIMS==" %%A IN ('SET ENEMY.ATTACK.AMOUNT.') DO (
	SET /A ENEMY.ATTACK.AMOUNT+=%%A
)

:: Decrease player's HP accordingly
SET /A "PLAYER.HP.NOW=PLAYER.HP.NOW -ENEMY.ATTACK.AMOUNT"
IF %PLAYER.HP.NOW% LSS 0 (SET "PLAYER.HP.NOW=0")

CALL "%SCRIPTS_GAME%\logger.cmd" ADD Enemy [4m%TMP.ENEMY%[24m ^(#%TMP.EN%^) dealt %RGB.RED%%ENEMY.ATTACK.AMOUNT%[0m[1m damage to you!%RGB.YELLOW%[0m
EXIT /B 0


:SIMULTANEOUS [Not Used & Needs Update]
:: Reset variables
FOR /F "TOKENS=1DELIMS==" %%A IN ('SET ENEMY.ATTACK.AMOUNT.') DO (
	SET /A %%A=0
)

::Create random amounts of dmg for every enemy individually
FOR /L %%I IN (1,1,%EN.MAX%) DO (
	SETLOCAL ENABLEDELAYEDEXPANSION
	FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("!ENEMY.ATK.AMOUNT.%%I!") DO IF !ENEMY.HP.NOW.%%I! NEQ 0 (
		ENDLOCAL
		SET /A "ENEMY.ATTACK.AMOUNT.%%I=%random% %% %%A %%B"
	) ELSE ENDLOCAL
)

::Calculate the final total damage
SET ENEMY.ATTACK.AMOUNT=0
FOR /F "TOKENS=2 DELIMS==" %%A IN ('SET ENEMY.ATTACK.AMOUNT.') DO (
	SET /A ENEMY.ATTACK.AMOUNT+=%%A
)

::Decrease player's HP accordingly
SET /A "PLAYER.HP.NOW=PLAYER.HP.NOW -ENEMY.ATTACK.AMOUNT"
IF %PLAYER.HP.NOW% LSS 0 (SET "PLAYER.HP.NOW=0")
EXIT /B 0
