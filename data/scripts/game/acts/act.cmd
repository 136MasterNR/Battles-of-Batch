IF NOT DEFINED VERCODE EXIT
CALL :%1 %2 %3 && (
	CALL "%SCRIPTS_GAME%\turn.cmd"
	CALL "%SCRIPTS_GAME%\turn.cmd" AV-SINGLE %CURR_TURN%
	CALL "%SCRIPTS_GAME%\turn.cmd" AV-CORRECT
	
	CALL "%SCRIPTS_GAME%\acts\effect.cmd" POISON-EFFECT
	CALL "%SCRIPTS_GAME%\acts\effect.cmd" FIRE-EFFECT
)

EXIT /B 0

:ATTACK
SET PLAYER.ATTACK.AMOUNT=
SET PLAYER.ATTACK.ENEMY.R=
SET ATK.CRIT=
SET CRIT.CHANCE=
SET ENEMY.IS.HP=

:: Add weapon bonus effects
CALL "%SCRIPTS_GAME%\acts\bonus.cmd" %WIELDING.WEAPON%

SET /A CRIT.RATE=(SKILL.CRIT_RATE*5)+EFFECT.BONUS_CRIT
SET /A CRIT.CHANCE=%random% %% 100
SET /A PLAYER.ATTACK.CNT1=((50 * SKILL.ATK) + EQUIP.BONUS_ATK + EFFECT.BONUS_ATK) / 2
SET /A PLAYER.ATTACK.AMOUNT=%random% %% PLAYER.ATTACK.CNT1 +PLAYER.ATTACK.CNT1

IF "%AUDIO.VALUE%"=="TRUE" IF NOT %SFX.VOLUME% EQU 0 (
	SETLOCAL ENABLEDELAYEDEXPANSION
	SET /A SFX.RANDOM.CRIT=%random% %% 3+1
	SET /A SFX.RANDOM.ATK=%random% %% 5+1
	SET "TARGETAEXT=.sfx"
	FOR /F "DELIMS=:" %%A IN ('TASKLIST /FI "WINDOWTITLE eq wscript.exe!TARGETAEXT!"') DO IF NOT %%A==INFO TASKKILL /F /FI "WINDOWTITLE eq wscript.exe!TARGETAEXT!" /T>NUL
	IF %CRIT.CHANCE% LSS %CRIT.RATE% (
		SET "TARGETAUDIO=%SFX.ATK.CRIT%!SFX.RANDOM.CRIT!.mp3"
		(
			ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
			ECHO Sound.URL = "!TARGETAUDIO!"
			ECHO Sound.Controls.play
			ECHO Sound.settings.volume = %SFX.VOLUME%
			ECHO Sound.settings.setMode "loop", False
			ECHO Sound.Controls.play
			ECHO While Sound.playState ^<^> 1
			ECHO      WScript.Sleep 100
			ECHO Wend
		) > "%DATA_TMP_A%"
		START /min "wscript.exe!TARGETAEXT!" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP_A%"^&EXIT
	) ELSE (
		SET "TARGETAUDIO=%SFX.ATK%!SFX.RANDOM.ATK!.mp3"
		IF EXIST "!TARGETAUDIO!" (
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "!TARGETAUDIO!"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %SFX.VOLUME%
				ECHO Sound.settings.setMode "loop", False
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP_A%"
			START /min "wscript.exe!TARGETAEXT!" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP_A%"^&EXIT
		)
	)
	ENDLOCAL
)

IF %CRIT.CHANCE% GEQ %CRIT.RATE% (
	SET ATK.CRIT=0
) ELSE (
	SET /A ATK.CRIT=PLAYER.ATTACK.AMOUNT*3
	SET /A ATK.CRIT=ATK.CRIT/4
	SET /A PLAYER.ATTACK.AMOUNT+=ATK.CRIT
)

IF DEFINED INPUTATK ( SET "PLAYER.ATTACK.ENEMY.R=%INPUTATK%" ) ELSE SET /A "PLAYER.ATTACK.ENEMY.R=%random% %% %EN.MAX% +1"
SET PLAYER.ATTACK.ENEMY=%PLAYER.ATTACK.ENEMY.R%
SET /A ENEMY.HP.NOW.%PLAYER.ATTACK.ENEMY.R%=ENEMY.HP.NOW.%PLAYER.ATTACK.ENEMY% -%PLAYER.ATTACK.AMOUNT%
SET /A ENEMY.IS.HP=ENEMY.HP.NOW.%PLAYER.ATTACK.ENEMY%
IF %ENEMY.IS.HP% LSS 0 ( SET ENEMY.HP.NOW.%PLAYER.ATTACK.ENEMY%=0)
SET PLAYER.ATTACK.AMOUNT.%PLAYER.ATTACK.ENEMY.R%=%PLAYER.ATTACK.AMOUNT%
EXIT /B 0

:Bomb
IF NOT DEFINED ITEM.REG_LVL.BOMB (
	ECHO.[47;3H%RGB%255;18;18mYou don't have any bombs![0m
	PAUSE>NUL                        
	EXIT /B 1
)
IF "%AUDIO.VALUE%"=="TRUE" IF NOT %SFX.VOLUME% EQU 0 (
	SETLOCAL ENABLEDELAYEDEXPANSION
	SET "TARGETAEXT=.sfx"
	FOR /F "DELIMS=:" %%A IN ('TASKLIST /FI "WINDOWTITLE eq wscript.exe!TARGETAEXT!"') DO IF NOT %%A==INFO TASKKILL /F /FI "WINDOWTITLE eq wscript.exe!TARGETAEXT!" /T>NUL
	SET "TARGETAUDIO=%SFX.BOMB%.mp3"
	(
		ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
		ECHO Sound.URL = "!TARGETAUDIO!"
		ECHO Sound.Controls.play
		ECHO Sound.settings.volume = %SFX.VOLUME%
		ECHO Sound.settings.setMode "loop", False
		ECHO Sound.Controls.play
		ECHO While Sound.playState ^<^> 1
		ECHO      WScript.Sleep 100
		ECHO Wend
	) > "%DATA_TMP_A%"
	START /min "wscript.exe%TARGETAEXT%" cmd /c START /min /wait "" "%DATA_TMP_A%"^|^|EXIT^&DEL /Q "%DATA_TMP_A%"^|^|EXIT^&EXIT
	ENDLOCAL
)
IF %ITEM.REG_LVL.BOMB% LEQ 1 (
	(
		TYPE "%PLAYERDATA.ITEMS%" | FINDSTR /V Bomb
	)>"%PLAYERDATA.ITEMS%.new"
	MOVE "%PLAYERDATA.ITEMS%.new" "%PLAYERDATA.ITEMS%" >NUL
	CALL :REMOVE-ITEM-EQ Heal
	SET ITEM.REG_LVL.BOMB=
) ELSE CALL "%ITEMS.LOADER%" REPLACE-MAT Bomb 1-2 ITEMS
ENDLOCAL
CALL "%ITEMS.LOADER%" LIST
CALL "%ITEMS.LOADER%" LIST_EQ
IF ERRORLEVEL 60 ECHO.ERROR&PAUSE>NUL&EXIT /B 1
SET PLAYER.ATTACK.AMOUNT=0
FOR /L %%I IN (1,1,%EN.MAX%) DO (
	CALL :Bomb-CALC %%I
)

CALL "%SCRIPTS_GAME%\turn.cmd" AV-INCREASE-ALL 100

SET PLAYER.ATTACK.ENEMY=all enemies
EXIT /B 0
:Bomb-CALC
SET /A TMP=ENEMY.HP.NOW.%1
IF %TMP%==0 (SET "PLAYER.ATTACK.AMOUNT.%1=0") ELSE SET /A "PLAYER.ATTACK.AMOUNT.%1=%random% %% 14 +5"
IF %INPUTATK% EQU %1 SET /A PLAYER.ATTACK.AMOUNT.%1=(PLAYER.ATTACK.AMOUNT.%1) * 3
IF NOT %TMP% LEQ 0 (
	SET /A TMP=TMP - PLAYER.ATTACK.AMOUNT.%1
)
SET /A PLAYER.ATTACK.AMOUNT+=PLAYER.ATTACK.AMOUNT.%1
IF %TMP% LSS 0 ( SET /A "TMP=0" ) ELSE IF %TMP% LSS 0 SET "PLAYER.ATTACK.AMOUNT.%1=0"

SET ENEMY.HP.NOW.%1=%TMP%
EXIT /B 0

:Heal
IF NOT DEFINED ITEM.REG_LVL.HEAL (
	ECHO.[47;3H%RGB%255;18;18mYou don't have enough items![0m
	PAUSE>NUL
	ECHO.[47;3H                            
	EXIT /B 1
)
SET "file=%DATA_SAVES%\PLAYERDATA.cmd"
IF %ITEM.REG_LVL.HEAL% LEQ 1 (
	CALL "%ITEMS.LOADER%" REMOVE-ITEM-EQ Heal
	(
		TYPE "%PLAYERDATA.ITEMS%" | FINDSTR /V Heal
	)>"%PLAYERDATA.ITEMS%.new"
	MOVE "%PLAYERDATA.ITEMS%.new" "%PLAYERDATA.ITEMS%" >NUL
	SET ITEM.REG_LVL.HEAL=
) ELSE CALL "%ITEMS.LOADER%" REPLACE-MAT Heal 1-2 ITEMS
CALL "%ITEMS.LOADER%" LIST
CALL "%ITEMS.LOADER%" LIST_EQ
SET /A "PLAYER.HEAL.AMOUNT=%random% %% 17 +43"
IF NOT %PLAYER.HP.NOW% GEQ %PLAYER.HP.FULL% SET /A "PLAYER.HP.NOW=%PLAYER.HP.NOW% +%PLAYER.HEAL.AMOUNT%"
IF %PLAYER.HP.NOW% GTR %PLAYER.HP.FULL% (
	SET /A "PLAYER.HP.NOW=%PLAYER.HP.FULL%"
	SET PLAYER.HEAL.AMOUNT=0
)
EXIT /B 0

:NOTHING
EXIT /B 0