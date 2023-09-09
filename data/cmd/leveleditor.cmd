@ECHO OFF
:leveleditor.cmd [<"Integer": Level Selection> or <"OUT": Disable Terminal Support>]

IF NOT DEFINED VERCODE EXIT
IF NOT %1.==OUT. (
	PUSHD "../.."
	IF NOT %1.==. (
		SET SELECTED=%1
	)
)

:EDITOR
COLOR 0F
MODE CON:COLS=%COLS% LINES=%LINES%

IF NOT DEFINED SELECTED GOTO EXIT

ECHO.[2J[21;42H҉  Preparing Your Amazing Battle[17D[1B[s
ECHO.[u  0%%
CALL "%SCRIPTS_GAME%\loader.cmd"

:DISPLAY
SET LOAD.ERR=
(
CLS
ECHO.[?25l[0m[H.-------------------.-----------------------------------------------------------------------------------------------.
ECHO.^| Press %RGB.PINK%Q[0m to return ^|[95C^|
ECHO.^|-------------------'[95C^|
FOR /L %%I IN (1, 1, 44) DO ECHO.^|[115C^|
ECHO.'-------------------------------------------------------------------------------------------------------------------'[2A
ECHO.[13;3H     ___             
ECHO.[2C    //_\\_          
ECHO.[2C  ."\\    ".        
ECHO.[2C /          \       
ECHO.[2C ^|           \_     
ECHO.[2C ^|       ,--.-.^)    
ECHO.[2C  \     /  o \o\    
ECHO.[2C  /\/\  \    /_/    
ECHO.[2C   (_.   `--'__^)    
ECHO.[2C    ^|     .-'  \    
ECHO.[2C    ^|  .-'.     ^)   
ECHO.[2C    ^| (  _/--.-'    
ECHO.[2C    ^|  `.___.'      
ECHO.[2C    ^|               

ECHO.[47;3H^|                                                                                                                 ^|[47;3H[1mYour HP: %RGB.GREEN%%PLAYER.HP.NOW%[0m%RGB.GRAY%/%PLAYER.HP.FULL%[0m [47;40HYou dealt %PLAYER.ATTACK.AMOUNT% DMG to %PLAYER.ATTACK.ENEMY% - CRIT: %ATK.CRIT%[47;90HEnemy Total HP: %ENEMY.HP.NOW.T%/%ENEMY.HP.FULL.T%
ECHO.[46;3H[1mYour AV: %RGB.PURPLE%%AV.PLAYER%[0m ^(Your Turn^)           

ECHO.[2;45H[s:---------: HELP - ^? :---------:
ECHO.[u[1B:   %RGB.COIN%Select an enemy to edit:[0m   :
ECHO.[u[2B:    Navigate using %RGB.CYAN%U[0m and %RGB.CYAN%J[0m.   :
ECHO.[u[3B:  Press %RGB.CYAN%C[0m to create an enemy![0m :
ECHO.[u[4B:------------------------------:
ECHO.[u[5B         %RGB.AQUAMARINE%^> Edit Mode ^<[0m         
ECHO.[42;4H[s                                                          
ECHO.[u[1B:-------------------------------:
ECHO.[u[2B  %RGB.GREEN%Once done[0m[1m, press %RGB.CYAN%P[0m[1m to export.[0m
ECHO.[u[3B:-------------------------------:

ECHO.[30;4H .-----------: %RGB.PURPLE%GUIDE[0m :-----------.[1m
ECHO.[4C Use [4mI[24m ^& [4mK[24m to %RGB.YELLOW%select[0m[1m an enemy.
ECHO.[4C Use [4mW[24m [4mA[24m [4mS[24m ^& [4mD[24m to %RGB.YELLOW%move[0m[1m the enemy.
ECHO.[4C Use [4mH[24m ^& [4mK[24m to %RGB.YELLOW%move[0m[1m an enemy left
ECHO.[4C or right by just one character.
ECHO.[4C Use [4mC[24m to %RGB.YELLOW%create[0m[1m a new enemy.
ECHO.[4C Use [4mE[24m to %RGB.YELLOW%edit[0m[1m an enemy's %RGB.CYAN%data[0m[1m.
ECHO.[4C Use [4mCTRL[24m + [4mX[24m to %RGB.RED%delete[0m[1m an enemy.
ECHO.[4C Use [4mR[24m to %RGB.YELLOW%refresh[0m[1m the menu.
ECHO.[4C Use [4mCTRL[24m + [4mR[24m to %RGB.YELLOW%undo[0m[1m all changes.
)

:: Calculate the HP of all enemies together
SET ENEMY.HP.NOW.T=
FOR /L %%I IN (1,1,%EN.MAX%) DO (
	SET /A ENEMY.HP.NOW.T+=ENEMY.HP.NOW.%%I
)

:RE

:: Display the HP bars
CALL "%SCRIPTS_GAME%\hpbar_now.cmd"
CALL :BATTLE-DISPLAY_CHOICE

%CHOICE%
IF %CHOICE.INPUT%.==. GOTO DISPLAY
IF /I "%CHOICE.INPUT%"=="K" (
	CALL :BATTLE-S_CHOICE
	CALL :BATTLE-DISPLAY_CHOICE
)
IF /I "%CHOICE.INPUT%"=="I" (
	CALL :BATTLE-W_CHOICE
	CALL :BATTLE-DISPLAY_CHOICE
)
IF /I "%CHOICE.INPUT%"=="J" (
	CALL :MOVE LEFT
)
IF /I "%CHOICE.INPUT%"=="L" (
	CALL :MOVE RIGHT
)
IF /I "%CHOICE.INPUT%"=="W" (
	CALL :MOVE UP
)
IF /I "%CHOICE.INPUT%"=="S" (
	CALL :MOVE DOWN
)
IF /I "%CHOICE.INPUT%"=="A" (
	CALL :MOVE LEFT +1
)
IF /I "%CHOICE.INPUT%"=="D" (
	CALL :MOVE RIGHT +1
)
IF /I "%CHOICE.INPUT%"=="C" (
	CALL :CREATE
	GOTO DISPLAY
)
IF /I "%CHOICE.INPUT%"=="E" (
	CALL :EDIT
	GOTO DISPLAY
)
IF /I "%CHOICE.INPUT%"=="" (
	CALL :DELETE
	GOTO DISPLAY
)
IF /I "%CHOICE.INPUT%"=="P" (
	CALL :EXPORT
) ELSE ECHO.[44;44H                                             

IF /I "%CHOICE.INPUT%"=="R" (
	CLS
	GOTO DISPLAY
)
IF /I %CHOICE.INPUT%== (
	GOTO EDITOR
)
IF /I "%CHOICE.INPUT%"=="Q" (
	GOTO EXIT
)
GOTO RE

:EDIT
SET TMP.NAV=20
:EDIT-RE
SET LOAD.ERR=
COLOR 08
SETLOCAL ENABLEDELAYEDEXPANSION
ECHO.[?25l[0m[18;35H
ECHO.[42C  .-------------------------.
ECHO.[42C:-:                         :-:[26D%RGB.CYAN%Type: %RGB.YELLOW%!ENEMY.TYPE.%INPUTATK%![0m
ECHO.[42C  : -  -  -  -  -  -  -  -  :
ECHO.[42C:-:                         :-:[27D%RGB.CYAN%Level: %RGB.YELLOW%!ENEMY.LVL.%INPUTATK%![0m
ECHO.[42C  '-------------------------'
ENDLOCAL
ECHO.
ECHO.[49C%RGB.GRAY%[Use A to select][0m
ECHO.[45C%RGB.GRAY%[Use W and S to navigate][0m
ECHO.[48C%RGB.GRAY%[Press Q to return][0m
ECHO.[%TMP.NAV%;41H[1m^>[s[33C^<[0m
%CHOICE%
IF %CHOICE.INPUT%.==. GOTO EDIT-RE
IF /I %CHOICE.INPUT%==Q EXIT /B 0
IF /I %CHOICE.INPUT%==CANCEL EXIT /B 0
IF /I %CHOICE.INPUT%==W IF NOT %TMP.NAV% LEQ 20 SET /A TMP.NAV-=2
IF /I %CHOICE.INPUT%==S IF NOT %TMP.NAV% GEQ 22 SET /A TMP.NAV+=2
IF /I NOT %CHOICE.INPUT%==A GOTO EDIT-RE
:EDIT-INPUT
SET /A "TMP.SELECTED=((%TMP.NAV% - 20) / 2) + 1"
SETLOCAL ENABLEDELAYEDEXPANSION
%INPUT% "PROMPT=[u[?25h[12C[0m[1m" "length=7"
ENDLOCAL&SET UDERFINE=%UDERFINE: =_%
IF "%UDERFINE%"==")_" GOTO EDIT-INPUT
IF %TMP.SELECTED% EQU 1 (
	CALL SET TMP.OLDTYPE=%%ENEMY.TYPE.%INPUTATK%%%
	SET TMP.TYPE=%UDERFINE%
) ELSE (
	SET TMP.TYPE=%%ENEMY.TYPE.%INPUTATK%%%
)
IF %TMP.SELECTED% EQU 2 (
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO %UDERFINE%| FINDSTR /R "^[1-9][0-9]*$">NUL
	IF ERRORLEVEL 1 (
		CALL "%DEV_ERR%" Error registering enemy:Level is not an integer.
		GOTO EDIT-RE
	)
	ENDLOCAL
	SET TMP.LVL=%UDERFINE%
) ELSE SET TMP.LVL=%%ENEMY.LVL.%INPUTATK%%%
for /l %%I in (1,1,7) do (
    SET "EN.%INPUTATK%.LINE.%%I="
)

:: Register the enemy
CALL "%ENEMY%" %TMP.TYPE% %INPUTATK% %TMP.LVL%
IF NOT DEFINED EN.%INPUTATK%.LINE.1 (
	:: If it doesn't exist, return.
	CALL "%DEV_ERR%" Error registering enemy:Invalid Enemy.
	CALL "%ENEMY%" %TMP.OLDTYPE% %INPUTATK% %TMP.LVL%
	GOTO EDIT-RE
)

IF DEFINED LOAD.ERR GOTO EDIT-RE

:: Setup for the enemy.
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("!ENEMY.HP.AMOUNT.%INPUTATK%!") DO (
	ENDLOCAL
	CALL :RAND %INPUTATK% %%A %%B
)
SET /A ENEMY.HP.FULL.%INPUTATK%=ENEMY.HP.NOW.%INPUTATK%
FOR /L %%X IN (90,-10,10) DO CALL :CREATE-HPBAR %INPUTATK% %%X %%ENEMY.HP.FULL.%INPUTATK%%%
COLOR 08
GOTO EDIT-RE

:DELETE
IF %EN.MAX% LEQ 1 EXIT /B 0
FOR /F "TOKENS=3DELIMS=." %%1 IN ('SET ENEMY.TYPE.') DO (
	CALL :FIX-INDETIFIERS %INPUTATK% %%1
)
SET "ENEMY.TYPE.%EN.MAX%="
SET ENEMY.HP.NOW.%EN.MAX%=
SET /A EN.MAX-=1
SET /A INPUTATK=1
EXIT /B 0
:FIX-INDETIFIERS
SET /A TMP.PREV_CNT=%2-1
IF NOT %2 GTR %1 EXIT /B 0
SETLOCAL ENABLEDELAYEDEXPANSION
SET TMP.TYPE=!ENEMY.TYPE.%2!
SET TMP.LVL=!ENEMY.LVL.%2!
ENDLOCAL&CALL "%ENEMY%" %TMP.TYPE% %TMP.PREV_CNT% %TMP.LVL%
SET /A ENEMY.HP.NOW.%TMP.PREV_CNT%=ENEMY.HP.NOW.%2
SET /A ENEMY.HP.FULL.%TMP.PREV_CNT%=ENEMY.HP.NOW.%TMP.PREV_CNT%
SET /A LOC.W%TMP.PREV_CNT%=LOC.W%2
SET /A LOC.H%TMP.PREV_CNT%=LOC.H%2
CALL :CREATE-LOCATION %TMP.PREV_CNT% %%LOC.W%EN.MAX%%% %%LOC.H%EN.MAX%%%
FOR /L %%X IN (90,-10,10) DO CALL :CREATE-HPBAR %EN.MAX% %%X %%ENEMY.HP.FULL.%EN.MAX%%%
EXIT /B 0

:CREATE
(
COLOR 08
ECHO.[?25l[0m[18;35H┏━━━━━━━━━━━━━━━━━━━┫%RGB.CYAN%INPUT[0m┠━━━━━━━━━━━━━━━━━━━┓
ECHO.[34C┃                                             ┃
ECHO.[34C┃       What type should the enemy be^?        ┃
ECHO.[34C┃        See %RGB.CYAN%enemy.cmd[0m for reference.         ┃
ECHO.[34C┃                                             ┃
ECHO.[34C┠╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┨
ECHO.[34C┃               ^> [s            ^<               ┃
ECHO.[34C┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
ECHO.
ECHO.[43C%RGB.GRAY%[Enter Q or CANCEL to cancel]
)
SETLOCAL ENABLEDELAYEDEXPANSION
%INPUT% "PROMPT=[0m[?25h[u[1m" "length=7"
ENDLOCAL&SET TMP.TYPE=%UDERFINE: =_%
IF "%TMP.TYPE%"==")_" GOTO CREATE
IF /I %TMP.TYPE%==Q EXIT /B 0
IF /I %TMP.TYPE%==CANCEL EXIT /B 0

(
COLOR 08
ECHO.[?25l[0m[18;35H┏━━━━━━━━━━━━━━━━━━━┫%RGB.CYAN%INPUT[0m┠━━━━━━━━━━━━━━━━━━━┓
ECHO.[34C┃                                             ┃
ECHO.[34C┃       What level should the enemy be^?       ┃
ECHO.[34C┃        See %RGB.CYAN%enemy.cmd[0m for reference.         ┃
ECHO.[34C┃                                             ┃
ECHO.[34C┠╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┨
ECHO.[34C┃                   ^> [s    ^<                   ┃
ECHO.[34C┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
ECHO.
ECHO.[43C%RGB.GRAY%[Enter Q or CANCEL to cancel]
)
SETLOCAL ENABLEDELAYEDEXPANSION
%INPUT% "PROMPT=[0m[?25h[u[1m" "length=3"
ENDLOCAL&SET TMP.LVL=%UDERFINE: =_%
IF "%TMP.LVL%"==")_" GOTO CREATE
IF /I %TMP.LVL%==Q EXIT /B 0
IF /I %TMP.LVL%==CANCEL EXIT /B 0

:: Register Enemy
SET /A EN.MAX+=1
CALL "%ENEMY%" %TMP.TYPE% %EN.MAX% %TMP.LVL%
IF DEFINED LOAD.ERR (
	SET /A EN.MAX-=1
	EXIT /B 0
)
SET INPUTATK=%EN.MAX%
:: Data Setup
SET /A AV.%EN.MAX%=%EN.MAX%*10
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("!ENEMY.HP.AMOUNT.%EN.MAX%!") DO (
	ENDLOCAL
	CALL :RAND %EN.MAX% %%A %%B
)
SET /A ENEMY.HP.FULL.%EN.MAX%=ENEMY.HP.NOW.%EN.MAX%
SET /A ENEMY.HP.FULL.T+=%%2
SET LOC.W%EN.MAX%=55
SET LOC.H%EN.MAX%=20
CALL :CREATE-LOCATION %EN.MAX% %%LOC.W%EN.MAX%%% %%LOC.H%EN.MAX%%%
FOR /L %%X IN (90,-10,10) DO CALL :CREATE-HPBAR %EN.MAX% %%X %%ENEMY.HP.FULL.%EN.MAX%%%
EXIT /B 0

:MOVE
CALL :CLEAR_INFO_SELECTION

IF %1==LEFT (
	SET /A LOC.W%INPUTATK%-=1%2
)

IF %1==RIGHT (
	SET /A LOC.W%INPUTATK%+=1%2
)

IF %1==UP (
	SET /A LOC.H%INPUTATK%-=1%2
)

IF %1==DOWN (
	SET /A LOC.H%INPUTATK%+=1%2
)

SETLOCAL ENABLEDELAYEDEXPANSION
IF !LOC.H%INPUTATK%! LEQ 3 (
	ENDLOCAL
	CALL :MOVE-UNDO %1 %2
) ELSE IF !LOC.H%INPUTATK%! GEQ 40 (
	ENDLOCAL
	CALL :MOVE-UNDO %1 %2
) ELSE IF !LOC.W%INPUTATK%! LEQ 21 (
	ENDLOCAL
	CALL :MOVE-UNDO %1 %2
) ELSE IF !LOC.W%INPUTATK%! GEQ 94 (
	ENDLOCAL
	CALL :MOVE-UNDO %1 %2
) ELSE ENDLOCAL


CALL :CREATE-LOCATION %INPUTATK% %%LOC.W%INPUTATK%%% %%LOC.H%INPUTATK%%%

EXIT /B 0
:MOVE-UNDO
IF %1==LEFT (
	SET /A LOC.W%INPUTATK%+=1%2
)

IF %1==RIGHT (
	SET /A LOC.W%INPUTATK%-=1%2
)

IF %1==UP (
	SET /A LOC.H%INPUTATK%+=1%2
)

IF %1==DOWN (
	SET /A LOC.H%INPUTATK%-=1%2
)
EXIT /B 0

:CREATE-LOCATION
SET TMP=0
SET LOC.EN.%1=[%3;%2H
SET /A TMP=%2-1
SET MOV.EN.%1=[%TMP%C
SET /A TMP=%3-1
SET LOC.HP.%1=[%TMP%;%2H
EXIT /B 0

:EXPORT
SETLOCAL ENABLEDELAYEDEXPANSION
(
ECHO.IF NOT DEFINED VERCODE EXIT
ECHO.
ECHO.::REWARDS
ECHO.SET REWARD.MONEY=137,26
ECHO.SET REWARD.XP=100,26
ECHO.
ECHO.::ENEMIES
FOR /L %%I IN (1,1,%EN.MAX%) DO (
	ECHO.CALL "%%ENEMY%%" !ENEMY.TYPE.%%I! %%I !ENEMY.LVL.%%I!
)
ECHO.
ECHO.::DISPLAY
FOR /L %%I IN (1,1,%EN.MAX%) DO (
	ECHO.SET LOC.W%%I=!LOC.W%%I!
)
ECHO.
FOR /L %%I IN (1,1,%EN.MAX%) DO (
	ECHO.SET LOC.H%%I=!LOC.H%%I!
)
ECHO.
ECHO.::LOOT TABLE
ECHO.SET LOOT.MAX=3
ECHO.
ECHO.SET LOOT.1=Dustblade
ECHO.SET LOOT.1.X=1,0
ECHO.SET LOOT.1.SAV=WEAPONS
ECHO.SET LOOT.1.ONCE=TRUE
ECHO.
ECHO.SET LOOT.2=Bomb
ECHO.SET LOOT.2.X=0,1
ECHO.SET LOOT.2.SAV=ITEMS
ECHO.SET LOOT.2.ONCE=FALSE
ECHO.
ECHO.SET LOOT.3=Stained_Dust
ECHO.SET LOOT.3.X=0,1
ECHO.SET LOOT.3.SAV=MATERIALS
ECHO.SET LOOT.3.ONCE=FALSE
ECHO.
ECHO.::END
ECHO.EXIT /B 0
)>"data\levels\lvl%SELECTED%\setup.cmd"
ECHO.[44;44H%RGB.GREEN%√ %RGB.TRUE%Level has been exported at "lvl%SELECTED%\setup.cmd"[0m
ENDLOCAL
EXIT /B 0

:BATTLE-S_CHOICE
SETLOCAL ENABLEDELAYEDEXPANSION
IF %INPUTATK% GTR %EN.MAX% (SET INPUTATK=1) ELSE SET /A INPUTATK+=1
:BATTLE-S_CHOICE-RE
IF !ENEMY.HP.NOW.%INPUTATK%! EQU 0 IF %INPUTATK% GTR %EN.MAX% (SET INPUTATK=1) ELSE (
	SET /A INPUTATK+=1
	GOTO BATTLE-S_CHOICE-RE
)
IF !ENEMY.HP.NOW.%INPUTATK%! EQU 0 GOTO :BATTLE-S_CHOICE-RE
ENDLOCAL&&SET INPUTATK=%INPUTATK%
EXIT /B 0
:BATTLE-W_CHOICE
SETLOCAL ENABLEDELAYEDEXPANSION
IF %INPUTATK% LSS 1 (SET INPUTATK=%EN.MAX%) ELSE SET /A INPUTATK-=1
:BATTLE-W_CHOICE-RE
IF !ENEMY.HP.NOW.%INPUTATK%! EQU 0 IF %INPUTATK% LSS 1 (
	SET INPUTATK=%EN.MAX%
) ELSE (
	SET /A INPUTATK-=1
	GOTO BATTLE-W_CHOICE-RE
)
IF !ENEMY.HP.NOW.%INPUTATK%! EQU 0 GOTO :BATTLE-W_CHOICE-RE
ENDLOCAL&&SET INPUTATK=%INPUTATK%
EXIT /B 0
:BATTLE-DISPLAY_CHOICE
SETLOCAL ENABLEDELAYEDEXPANSION
IF DEFINED TMP.LOC_HP_OLD (
	:: Clears the info that appear on the right side when focusing on an enemy.
	ECHO.!LOC.HP.%INPUTATK%![2D  [12C  !LOC.HP.%INPUTATK%![1A             !LOC.HP.%INPUTATK%![8B            %TMP.LOC_HP_OLD%[4B[2D   [1B[3D   %TMP.LOC_HP_OLD%[11C[5B             %TMP.LOC_HP_OLD%[11C[4B             %TMP.LOC_HP_OLD%[11C[3B             [0m%TMP.LOC_HP_OLD%[11C[2B             
)
SET TMP.LOC_HP_OLD=!LOC.HP.%INPUTATK%!
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("!ENEMY.ATK.AMOUNT.%INPUTATK%!") DO (
	SET /A "ENEMY.MAXP_ATK=%%A+%%B"
	SET /A "ENEMY.MINP_ATK=%%B"
)
ECHO.!LOC.HP.%INPUTATK%![4B[2D[4m^|[0m [0m^>[1B[3D' ^>!LOC.HP.%INPUTATK%![11C[5B%RGB.PURPLE%AV:[0m !AV.%INPUTATK%!!LOC.HP.%INPUTATK%![11C[4B%RGB%245;151;151mAtk: [0m!ENEMY.MINP_ATK!~!ENEMY.MAXP_ATK!!LOC.HP.%INPUTATK%![11C[3B%RGB%176;225;187mHP: [0m!ENEMY.HP.NOW.%INPUTATK%!!LOC.HP.%INPUTATK%![11C[2B%RGB.CYAN%Lvl: [0m!ENEMY.LVL.%INPUTATK%!
ENDLOCAL&&SET TMP.LOC_HP_OLD=%TMP.LOC_HP_OLD%
EXIT /B 0

:CREATE-HPBAR
SET CNT1=%1&SET CNT2=%2&SET TMP_ENEMY.HP.FULL=%3
SET /A "ENEMY.HOLO.HP.%CNT1%.%CNT2%=%TMP_ENEMY.HP.FULL%00/100"&SET /A "ENEMY.HOLO.HP.%CNT1%.%CNT2%=ENEMY.HOLO.HP.%CNT1%.%CNT2%*(100-%CNT2%)"&SET /A "ENEMY.HOLO.HP.%CNT1%.%CNT2%=%TMP_ENEMY.HP.FULL%00-ENEMY.HOLO.HP.%CNT1%.%CNT2%"&SET /A "ENEMY.HOLO.HP.%CNT1%.%CNT2%=ENEMY.HOLO.HP.%CNT1%.%CNT2%/100"
EXIT /B 0

:RAND
SET /A "ENEMY.HP.NOW.%1=%random% %% %2 %3"
EXIT /B 0

:EXIT
IF NOT %1.==OUT. (
	POPD
	CLEAR
	ECHO ON
)
@EXIT /B 0