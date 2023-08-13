IF NOT DEFINED VERCODE EXIT
CALL :INDIVIDUAL %1
EXIT /B 0

:INDIVIDUAL <Enemy>
:: Reset variables
FOR /F "TOKENS=1DELIMS==" %%A IN ('SET ENEMY.ATTACK.AMOUNT.') DO (
	SET %%A=
)
:: Get the enemy
FOR /F "TOKENS=2DELIMS=." %%1 IN ("%1") DO (
	SET TMP.EN=%%1
)

:: Update the Action Values
CALL "%SCRIPTS_GAME%\turn.cmd" AV-SINGLE %CURR.TURN% %TMP.EN%

:: If enemy is dead, quit
SETLOCAL ENABLEDELAYEDEXPANSION
IF !ENEMY.HP.NOW.%TMP.EN%! LEQ 0 (
	ENDLOCAL
	SET AV.%TMP.EN%=
	EXIT /B 0
) ELSE ENDLOCAL

:: Update turns
CALL "%SCRIPTS_GAME%\turn.cmd"

:: Extract the ATK values from the enemy
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "TOKENS=1,2DELIMS=," %%A IN ("!ENEMY.ATK.AMOUNT.%TMP.EN%!") DO (
	ENDLOCAL
	SET /A "ENEMY.ATTACK.AMOUNT.%TMP.EN%=%random% %% %%A %%B"
)

:: Calculate final total damage
SET ENEMY.ATTACK.AMOUNT=0
FOR /F "TOKENS=2DELIMS==" %%A IN ('SET ENEMY.ATTACK.AMOUNT.') DO (
	SET /A ENEMY.ATTACK.AMOUNT+=%%A
)

:: Decrease player's HP accordingly
SET /A "PLAYER.HP.NOW=PLAYER.HP.NOW -ENEMY.ATTACK.AMOUNT"
IF %PLAYER.HP.NOW% LSS 0 (SET "PLAYER.HP.NOW=0")
EXIT /B 0


:SIMULTANEOUS [Not Used]
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