IF NOT DEFINED VERCODE EXIT

CLS
ECHO.
ECHO.[2K Enemy Total HP: %ENEMY.HP.NOW.T%/%ENEMY.HP.FULL.T%[s
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /L %%I IN (1,1,%EN.MAX%) DO (
	ECHO.[u ^| %%I: !ENEMY.HP.NOW.%%I!/!ENEMY.HP.FULL.%%I! ^(-!PLAYER.ATTACK.AMOUNT.%%I!^)[s
)
ENDLOCAL

ECHO.[2K Your HP: %PLAYER.HP.NOW%/%PLAYER.HP.FULL% ^(+%PLAYER.HEAL.AMOUNT% -%ENEMY.ATTACK.AMOUNT%^)
ECHO.[2K You dealt %PLAYER.ATTACK.AMOUNT% DMG to %PLAYER.ATTACK.ENEMY%
ECHO.[2K CRIT: %ATK.CRIT%

ECHO.[2K Enemy dealt %ENEMY.ATTACK.AMOUNT% DMG to %profile%
ECHO. Turns: %TURNS%
ECHO. Rounds: %rounds%
ECHO.[s
FOR /F "TOKENS=1,2DELIMS==" %%1 IN ('SET AV.') DO (
	ECHO.[u^| %%1: %%2 [s
)
ECHO.[u          

EXIT /B 0