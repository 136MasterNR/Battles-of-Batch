IF NOT DEFINED VERCODE EXIT
SETLOCAL ENABLEDELAYEDEXPANSION
SET TMP.ENEMY=!ENEMY.TYPE.%1!
ENDLOCAL&SET TMP.ENEMY=%TMP.ENEMY%
CALL :%TMP.ENEMY% %1 || EXIT /B 0
EXIT /B 0

:S <"Enemy ID": Integer>
:: Extract the ATK values from the enemy
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "TOKENS=1,2DELIMS=," %%A IN ("!ENEMY.ATK.AMOUNT.%1!") DO (
	ENDLOCAL
	SET /A "TMP.DMG=%random% %% %%A %%B"
)
CALL "%SCRIPTS_GAME%\acts\effect.cmd" POISON-CREATE PLAYER 4 %TMP.DMG%
EXIT /B 0