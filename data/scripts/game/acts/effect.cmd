IF NOT DEFINED VERCODE EXIT
CALL :%1 %2 %3 %4
EXIT /B 0

:SLOWDOWN <"Enemy": Integer> <"Amount": Integer>
SET /A AV.%1+=%2
:: Log the action
CALL "%SCRIPTS_GAME%\logger.cmd" ADD Enemy [4m#%INPUTATK%[24m has been %RGB.PURPLE%slowed down[1;37m by %RGB.RED%%2[1;37m points!
EXIT /B 0

:POISON-CREATE <"Enemy/Player": Integer/String> <"Turns": Integer> <"Power": Integer>
SET EFF.POISON.%1=%2
SET EFF.POISON.%1.POWER=%3
:: Log the action
IF NOT %1==PLAYER (
	CALL "%SCRIPTS_GAME%\logger.cmd" ADD You applied %RGB.LIME%poison[0m[1m to [4m#%1[24m!%RGB.YELLOW%[0m
) ELSE (
	CALL "%SCRIPTS_GAME%\logger.cmd" ADD You have been %RGB.LIME%poisoned[0m[1m![24m[0m%RGB.YELLOW%[0m
)
EXIT /B 0
:POISON-EFFECT
FOR /F "TOKENS=3,4DELIMS=.=" %%1 IN ('SET EFF.POISON.') DO (
	IF NOT %%2==POWER IF %%1==PLAYER (
	:: Poison for player
		SET /A EFF.POISON.%%1-=1
		SETLOCAL ENABLEDELAYEDEXPANSION
		IF %PLAYER.HP.NOW% LEQ 0 (
			ENDLOCAL
				SET PLAYER.HP.NOW=0
				SET EFF.POISON.%%1=
				SET EFF.POISON.%%1.POWER=
		) ELSE (
			ENDLOCAL
			SET /A EFF.POISON.%%1-=1
			SET /A PLAYER.HP.NOW-=EFF.POISON.%%1.POWER
		)
		
		SETLOCAL ENABLEDELAYEDEXPANSION
		SET TMP.DMG=!EFF.POISON.%%1.POWER!
		ENDLOCAL&SET TMP.DMG=%TMP.DMG%
		CALL "%SCRIPTS_GAME%\logger.cmd" ADD You took %RGB.LIME%%%TMP.DMG%% poison[0m[1m damage!%RGB.YELLOW%
	) ELSE (
		:: Poison for any enemy
		SETLOCAL ENABLEDELAYEDEXPANSION
		IF NOT %%2==POWER IF NOT !ENEMY.HP.NOW.%%1! EQU 0 (
			ENDLOCAL
			SET /A "TMP.DMG=(((50 * SKILL.ATK) + EQUIP.BONUS_ATK + EFFECT.BONUS_ATK) *EFF.POISON.%%1.POWER) / 100"
			SET /A EFF.POISON.%%1-=1
			SET /A ENEMY.HP.NOW.%%1-=%TMP.DMG%

			:: Make sure that the enemy doesn't have less than 0 HP.
			SETLOCAL ENABLEDELAYEDEXPANSION
			SET /A ENEMY.HP.NOW.%%1=!ENEMY.HP.NOW.%%1! - %TMP.DMG%
			IF !ENEMY.HP.NOW.%%1! LEQ 0 (
				ENDLOCAL
				SET ENEMY.HP.NOW.%%1=0
				SET EFF.POISON.%%1=
			) ELSE IF !EFF.POISON.%%1! LEQ 0 (
				ENDLOCAL
				SET EFF.POISON.%%1=
			) ELSE ENDLOCAL
			
			:: Log the action
			CALL "%SCRIPTS_GAME%\logger.cmd" ADD Enemy [4m#%%1[0m[1m took %RGB.LIME%%%TMP.DMG%% poison[0m[1m damage![0m[0m[0m
		) ELSE ENDLOCAL
	)
)
EXIT /B 0

:FIRE-CREATE <"Enemy/Player": Integer/String> <"Turns": Integer> <"Power": Integer>
SET EFF.FIRE.%1=%2
SET EFF.FIRE.%1.POWER=%3
EXIT /B 0
:FIRE-EFFECT
FOR /F "TOKENS=3,4DELIMS=.=" %%1 IN ('SET EFF.FIRE.') DO (
	IF NOT %%2==POWER IF %%1==PLAYER (
	:: Fire for player
		SET /A EFF.FIRE.%%1-=1
		SETLOCAL ENABLEDELAYEDEXPANSION
		IF %PLAYER.HP.NOW% LEQ 0 (
			ENDLOCAL
				SET PLAYER.HP.NOW=0
				SET EFF.FIRE.%%1=
				SET EFF.FIRE.%%1.POWER=
		) ELSE (
			ENDLOCAL
			SET /A EFF.FIRE.%%1-=1
			SET /A PLAYER.HP.NOW-=EFF.FIRE.%%1.POWER
		)
		CALL "%SCRIPTS_GAME%\logger.cmd" ADD You took %RGB.ORANGE%%%TMP.DMG%% fire[0m[1m damage!%RGB.YELLOW%
	) ELSE (
	:: Fire for any enemy
		SETLOCAL ENABLEDELAYEDEXPANSION
		IF NOT %%2==POWER IF NOT !ENEMY.HP.NOW.%%1! EQU 0 (
			ENDLOCAL
			SET /A "TMP.DMG=(((50 * SKILL.ATK) + EQUIP.BONUS_ATK + EFFECT.BONUS_ATK) *EFF.FIRE.%%1.POWER) / 100"
			SET /A EFF.FIRE.%%1-=1
			SET /A ENEMY.HP.NOW.%%1-=%TMP.DMG%

			:: Make sure that the enemy doesn't have less than 0 HP.
			SETLOCAL ENABLEDELAYEDEXPANSION
			TITLE !EFF.FIRE.%%1!
			SET /A ENEMY.HP.NOW.%%1=!ENEMY.HP.NOW.%%1! - %TMP.DMG%
			IF !ENEMY.HP.NOW.%%1! LEQ 0 (
				ENDLOCAL
				SET ENEMY.HP.NOW.%%1=0
				SET EFF.FIRE.%%1=
				SET EFF.FIRE.%%1.POWER=
			) ELSE IF !EFF.FIRE.%%1! LEQ 0 (
				ENDLOCAL
				SET EFF.FIRE.%%1=
				SET EFF.FIRE.%%1.POWER=
			) ELSE ENDLOCAL
			
			:: Log the action
			CALL "%SCRIPTS_GAME%\logger.cmd" ADD Enemy [4m#%%1[0m[1m took %RGB.ORANGE%%%TMP.DMG%% fire[0m[1m damage!%RGB.YELLOW%
		) ELSE ENDLOCAL
	)
)
EXIT /B 0