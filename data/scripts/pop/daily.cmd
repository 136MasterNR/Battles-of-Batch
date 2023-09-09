IF NOT DEFINED VERCODE EXIT
GOTO CHECK
EXIT /B 0

:CHECK
:: Daily rewards check
FOR /F "DELIMS=" %%N IN ('DATE /T') DO (
	IF EXIST "%DATA_SAVES%\MEMORY" (
		FOR /F "DELIMS=" %%O IN (%DATA_SAVES%\MEMORY) DO (
			SETLOCAL ENABLEDELAYEDEXPANSION
			SET TMP.1=%%N
			SET TMP.2=%%O
			IF NOT "!TMP.1: =!"=="!TMP.2: =!" (
				ENDLOCAL
				CALL :DAILY %%N
				EXIT /B 1
			) ELSE ENDLOCAL
			GOTO CHECK-SKIP
		)
	) ELSE (
		ECHO.%%N>"%DATA_SAVES%\MEMORY"
		ECHO.0>>"%DATA_SAVES%\MEMORY"
	)
)
:CHECK-SKIP
EXIT /B 0

:DAILY
:: Update the memory
FOR /F "SKIP=1DELIMS=" %%O IN (%DATA_SAVES%\MEMORY) DO (
	SET /A TMP.DAYS=%%O+1
)
ECHO.%*>"%DATA_SAVES%\MEMORY"
ECHO.%TMP.DAYS%>>"%DATA_SAVES%\MEMORY"

:: Get rewards
SET /A TMP.ADD_MONEY=(%RANDOM% %% 50 +100) * (PLAYER.LVL*TMP.DAYS)
IF %TMP.ADD_MONEY% LEQ 10 SET /A TMP.ADD_MONEY=(%RANDOM% %% 5 +10)

SET /A TMP.NEW_PLAYER_MONEY=PLAYER.MONEY + TMP.ADD_MONEY

SET "TMP.LIST=Stained_Dust,Black_Wood,Francium,Prism_Dust"

SET /A TMP.RAND_DROP=%RANDOM% %% 3+1
SET /A TMP.RAND_DROP_AMOUNT=%RANDOM% %% 4+1

FOR /F "TOKENS=%TMP.RAND_DROP%DELIMS=," %%I IN ("%TMP.LIST%") DO (
	CALL :SAVE-MAT %%I %TMP.RAND_DROP_AMOUNT%
	SET TMP.DROP_1=%%I
	SET TMP.DROP_1_AMOUNT=%TMP.RAND_DROP_AMOUNT%
)

:LOOP-SECOND_MAT
SET /A TMP.RAND_DROP=%RANDOM% %% 3+1
SET /A TMP.RAND_DROP_AMOUNT=%RANDOM% %% 4+1

FOR /F "TOKENS=%TMP.RAND_DROP%DELIMS=," %%I IN ("%TMP.LIST%") DO (
	SET TMP.DROP_2=%%I
	SET TMP.DROP_2_AMOUNT=%TMP.RAND_DROP_AMOUNT%
	SETLOCAL ENABLEDELAYEDEXPANSION
	IF "!TMP.DROP_1!"=="!TMP.DROP_2!" GOTO LOOP-SECOND_MAT
	ENDLOCAL
	CALL :SAVE-MAT %%I %TMP.RAND_DROP_AMOUNT%
)

CALL "%SAVE%" "FILE=%DATA_SAVES%\PLAYERDATA.cmd" 1 /A PLAYER.MONEY= %TMP.NEW_PLAYER_MONEY%
COLOR 08
ECHO.[0m[19;46H[1m.----' %RGB%84;255;130mDaily Reward[0m[1m '----.
ECHO.[44C[1m.'                        '.[0m
SETLOCAL ENABLEDELAYEDEXPANSION
SET "STR=Day %TMP.DAYS%: %RGB.COIN%[4m%TMP.ADD_MONEY% Coins[0m"
CALL "%CENTER%" 51
ECHO.[44C[1m:                          :[27D%RGB%179;233;255m %STR%
ECHO.[44C[1m:                          :[0m
ECHO.[44C[1m: - - - : Materials : - - -:[0m
SET "STR=%RGB.GREEN%%TMP.DROP_1:_= % [0mx%TMP.DROP_1_AMOUNT%"
CALL "%CENTER%" 43
ECHO.[44C[1m:                          :[24D%STR%
SET "STR=%RGB.GREEN%%TMP.DROP_2:_= % [0mx%TMP.DROP_2_AMOUNT%"
CALL "%CENTER%" 43
ECHO.[44C[1m:                          :[24D%STR%
ENDLOCAL
ECHO.[44C[1m:                          :[0m
ECHO.[44C[1m:----------: [4m[sOK[24m :----------:[0m
SET /P "=[u"<NUL
pause>NUL
EXIT /B 0

:SAVE-MAT
CALL "%ITEMS.LOADER%" REPLACE-MAT %1 %2 MATERIALS
IF ERRORLEVEL 60 ECHO.%1$%2>>"%PLAYERDATA.MATERIALS%"
EXIT /B 0