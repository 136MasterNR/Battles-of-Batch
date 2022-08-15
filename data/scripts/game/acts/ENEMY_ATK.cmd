IF NOT DEFINED VERCODE EXIT
ENDLOCAL
SET /A "ENEMY.1.ATTACK.AMOUNT=0"
SET /A "ENEMY.2.ATTACK.AMOUNT=0"
SET /A "ENEMY.3.ATTACK.AMOUNT=0"
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("%ENEMY.ATK.AMOUNT.1%") DO IF %ENEMY.HP.NOW.1% NEQ 0 SET /A "ENEMY.1.ATTACK.AMOUNT=(%random% %% %%A %%B)"
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("%ENEMY.ATK.AMOUNT.2%") DO IF %ENEMY.HP.NOW.2% NEQ 0 SET /A "ENEMY.2.ATTACK.AMOUNT=(%random% %% %%A %%B)"
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("%ENEMY.ATK.AMOUNT.3%") DO IF %ENEMY.HP.NOW.3% NEQ 0 SET /A "ENEMY.3.ATTACK.AMOUNT=(%random% %% %%A %%B)"
SET /A "ENEMY.ATTACK.AMOUNT=ENEMY.1.ATTACK.AMOUNT+ENEMY.2.ATTACK.AMOUNT+ENEMY.3.ATTACK.AMOUNT"
SET /A "PLAYER.HP.NOW=%PLAYER.HP.NOW% -%ENEMY.ATTACK.AMOUNT%"
IF %PLAYER.HP.NOW% LSS 0 (SET "PLAYER.HP.NOW=0")
EXIT /B 0