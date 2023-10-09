IF NOT DEFINED VERCODE EXIT
SET ARG=%1
IF NOT DEFINED ARG ( CALL :TURN ) ELSE CALL :%ARG% %2
EXIT /B 0

:TURN
SET /A TURNS+=1
SET /A TURNS.T+=1

:: Execute commands every turn
CALL "%SCRIPTS_GAME%\acts\effect.cmd" FIRE-EFFECT
CALL "%SCRIPTS_GAME%\acts\effect.cmd" BLEED-EFFECT
CALL "%SCRIPTS_GAME%\visual.cmd"

:: Update the amount of enemies that are still alive
SET TMP.CNT=0
FOR /F %%1 IN ('SET AV.') DO (
	SET /A TMP.CNT+=1
)

SET /A CHECK=%TURNS% %% %TMP.CNT%
IF %CHECK% EQU 1 (
	SET /A ROUNDS+=1
	SET TURNS=1
	
	::Execute commands every round
	CALL "%SCRIPTS_GAME%\acts\effect.cmd" POISON-EFFECT
)
EXIT /B 0

:AV-SINGLE
:: Get the smallest Action Value
CALL :FIND-SMALLEST
:: Decrease the desired Action Value
SET /A %1-=%SMALLEST_AV%

SETLOCAL ENABLEDELAYEDEXPANSION
IF !%1! LEQ 0 (
	ENDLOCAL
	SET %1=100
) ELSE ENDLOCAL
EXIT /B 0

:AV
:: Get the smallest Action Value
CALL :FIND-SMALLEST

:: Decrease the Action Value of all enemies.
FOR /F "TOKENS=1,2DELIMS==" %%1 IN ('SET AV.') DO (
	SET /A %%1=%%2-%SMALLEST_AV%
)
EXIT /B 0

:FIND-SMALLEST
SET SMALLEST_AV=2147483647
FOR /F "TOKENS=2DELIMS==" %%1 IN ('SET AV.') DO (
	CALL :FIND-SMALLEST-IF %%1
)
IF SMALLEST_AV EQU 2147483647 SET SMALLEST_AV=2
EXIT /B 0
:FIND-SMALLEST-IF
IF %1 LEQ %SMALLEST_AV% (
	IF NOT %1 EQU 0 SET SMALLEST_AV=%1
)
EXIT /B 0

:ACT
SET CURR_TURN=NONE
SET EXIT=
FOR /F "TOKENS=1,2DELIMS==" %%1 IN ('SET AV.') DO (
	CALL :ACT-IF %%1 %%2
	%EXIT%
)
IF %CURR_TURN%==NONE (
	CALL :AV
	GOTO ACT
)
IF %CURR_TURN%==AV.PLAYER EXIT /B 0

FOR /F "TOKENS=2DELIMS=." %%1 IN ("%CURR_TURN%") DO (
	SET TMP.EN=%%1
)

:: If enemy is dead, delete its action value and repeat this function
SETLOCAL ENABLEDELAYEDEXPANSION
IF !ENEMY.HP.NOW.%TMP.EN%! LEQ 0 (
	ENDLOCAL
	SET AV.%TMP.EN%=
	GOTO ACT
) ELSE ENDLOCAL

EXIT /B 0
:ACT-IF
SETLOCAL ENABLEDELAYEDEXPANSION
IF %2 EQU 0 (
	SET CURR_TURN=%1
	SET EXIT=EXIT /B 0
)
ENDLOCAL&SET CURR_TURN=%CURR_TURN%
EXIT /B 0

:AV-INCREASE <"Enemy ID": Integer> <"Amount": Integer>
SET /A AV.%1+=%2
EXIT /B 0

:AV-INCREASE-ALL <"Amount": Integer>
FOR /F "TOKENS=1DELIMS==" %%1 IN ('SET AV.') DO (
	IF NOT %%1==AV.PLAYER SET /A %%1+=%1
)
EXIT /B 0

:AV-CORRECT
FOR /F "TOKENS=1,2DELIMS=.=" %%1 IN ('SET AV.') DO (
	IF NOT %%2==PLAYER (
		SETLOCAL ENABLEDELAYEDEXPANSION
		IF !ENEMY.HP.NOW.%%2! EQU 0 (
			ENDLOCAL
			SET %%1.%%2=
		) ELSE ENDLOCAL
	)
)
EXIT /B 0
