SET PLAYER.ATTACK.AMOUNT=
SET PLAYER.ATTACK.ENEMY.R=
SET ATK.CRIT=
SET CRIT.CHANCE=
SET ENEMY.IS.HP=

SET /A "CRIT.RATE=%SKILL.CRIT_RATE%*5"
SET /A "CRIT.CHANCE=%random% %% 100"
SET /A "PLAYER.ATTACK.CNT1=((50*SKILL.ATK)+EQUIP.BONUS_ATK)/2"
SET /A "PLAYER.ATTACK.AMOUNT=%random% %% %PLAYER.ATTACK.CNT1% +%PLAYER.ATTACK.CNT1%"
IF %CRIT.CHANCE% GTR %CRIT.RATE% ( SET ATK.CRIT=0 ) ELSE ( SET /A ATK.CRIT=PLAYER.ATTACK.AMOUNT*3&SET /A ATK.CRIT=ATK.CRIT/4&SET /A PLAYER.ATTACK.AMOUNT+=ATK.CRIT )

IF DEFINED INPUTATK ( SET "PLAYER.ATTACK.ENEMY.R=%INPUTATK%" ) ELSE SET /A "PLAYER.ATTACK.ENEMY.R=%random% %% %EN.MAX% +1"
SET PLAYER.ATTACK.ENEMY=%PLAYER.ATTACK.ENEMY.R%
SET UDERFINE=ATK
SET /A ENEMY.HP.NOW.%PLAYER.ATTACK.ENEMY.R%=ENEMY.HP.NOW.%PLAYER.ATTACK.ENEMY% -%PLAYER.ATTACK.AMOUNT%
SET /A ENEMY.IS.HP=ENEMY.HP.NOW.%PLAYER.ATTACK.ENEMY%
IF %ENEMY.IS.HP% LSS 0 ( SET ENEMY.HP.NOW.%PLAYER.ATTACK.ENEMY%=0)
SET PLAYER.ATTACK.AMOUNT.%PLAYER.ATTACK.ENEMY.R%=%PLAYER.ATTACK.AMOUNT%
SET "TARGETAEXT=.sfx"
SET /A SFX.RANDOM.CRIT=%random%%%3+1
SET /A SFX.RANDOM.ATK=%random%%%5+1
FOR /F "DELIMS=:" %%A IN ('TASKLIST /FI "WINDOWTITLE eq wscript.exe%TARGETAEXT%"') DO IF NOT %%A==INFO TASKKILL /F /FI "WINDOWTITLE eq wscript.exe%TARGETAEXT%" /T>NUL
IF "%AUDIO.VALUE%"=="TRUE" IF %CRIT.CHANCE% LEQ %CRIT.RATE% (
	SETLOCAL ENABLEDELAYEDEXPANSION
	SET "TARGETAUDIO=%SFX.ATK.CRIT%%SFX.RANDOM.CRIT%.mp3"
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
	START /min "wscript.exe%TARGETAEXT%" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP_A%"^&EXIT
) ELSE (
	SETLOCAL ENABLEDELAYEDEXPANSION
	SET "TARGETAUDIO=%SFX.ATK%%SFX.RANDOM.ATK%.mp3"
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
		START /min "wscript.exe%TARGETAEXT%" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP_A%"^&EXIT
	)
)
ENDLOCAL
EXIT /B 0