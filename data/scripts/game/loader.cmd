IF NOT DEFINED VERCODE EXIT
SET "ADD-CMD=::Controlled by the debug mode"
SET "CNT.FADEOUT=0"
SET FADE=
SET TMP.LOC_HP_OLD=
SET ENEMY.ATK.DEALT=0
SET "PLAYER.HP.NOW=NUL"
SET "PLAYER.ATTACK.ENEMY=NONE"
SET PLAYER.ATTACK.AMOUNT=0
SET ENEMY.HP.NOW.1=0
SET ENEMY.HP.NOW.2=0
SET ENEMY.HP.NOW.3=0
SET ENEMY.HP.NOW.T=0
SET /A "PLAYER.HP.FULL=100*%SKILL.HP%"
SET "PLAYER.ATTACK.ENEMY.R=NONE"
SET "GAME.STATUS=NUL"
SET ENEMY.ATTACK.AMOUNT=0
SET "HEAL.USES.NOW=%HEAL.USES%"
SET "BOMB.USES.NOW=%BOMB.USES%"
::HP Bar Setup
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("%ENEMY.HP.AMOUNT.1%") DO SET /A "ENEMY.HP.NOW.1=%random% %% %%A %%B"
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("%ENEMY.HP.AMOUNT.2%") DO SET /A "ENEMY.HP.NOW.2=%random% %% %%A %%B"
FOR /F "TOKENS=1-2 DELIMS=," %%A IN ("%ENEMY.HP.AMOUNT.3%") DO SET /A "ENEMY.HP.NOW.3=%random% %% %%A %%B"
SET ENEMY.HP.FULL.1=%ENEMY.HP.NOW.1%
SET ENEMY.HP.FULL.2=%ENEMY.HP.NOW.2%
SET ENEMY.HP.FULL.3=%ENEMY.HP.NOW.3%
SET /A ENEMY.HP.FULL.T=ENEMY.HP.NOW.1 + ENEMY.HP.NOW.2 + ENEMY.HP.NOW.3
SET PLAYER.HP.NOW=%PLAYER.HP.FULL%
SET PLAYER.HEAL.AMOUNT=0
SETLOCAL ENABLEEXTENSIONS
:1-90
SET /A "ENEMY.HOLO.HP.1.90=%ENEMY.HP.FULL.1%00/100"
SET /A "ENEMY.HOLO.HP.1.90=%ENEMY.HOLO.HP.1.90%*10"
SET /A "ENEMY.HOLO.HP.1.90=%ENEMY.HP.FULL.1%00-%ENEMY.HOLO.HP.1.90%"
SET /A "ENEMY.HOLO.HP.1.90=%ENEMY.HOLO.HP.1.90%/100"
:1-80
SET /A "ENEMY.HOLO.HP.1.80=%ENEMY.HP.FULL.1%00/100"
SET /A "ENEMY.HOLO.HP.1.80=%ENEMY.HOLO.HP.1.80%*20"
SET /A "ENEMY.HOLO.HP.1.80=%ENEMY.HP.FULL.1%00-%ENEMY.HOLO.HP.1.80%"
SET /A "ENEMY.HOLO.HP.1.80=%ENEMY.HOLO.HP.1.80%/100"
:1-70
SET /A "ENEMY.HOLO.HP.1.70=%ENEMY.HP.FULL.1%00/100"
SET /A "ENEMY.HOLO.HP.1.70=%ENEMY.HOLO.HP.1.70%*30"
SET /A "ENEMY.HOLO.HP.1.70=%ENEMY.HP.FULL.1%00-%ENEMY.HOLO.HP.1.70%"
SET /A "ENEMY.HOLO.HP.1.70=%ENEMY.HOLO.HP.1.70%/100"
:1-60
SET /A "ENEMY.HOLO.HP.1.60=%ENEMY.HP.FULL.1%00/100"
SET /A "ENEMY.HOLO.HP.1.60=%ENEMY.HOLO.HP.1.60%*40"
SET /A "ENEMY.HOLO.HP.1.60=%ENEMY.HP.FULL.1%00-%ENEMY.HOLO.HP.1.60%"
SET /A "ENEMY.HOLO.HP.1.60=%ENEMY.HOLO.HP.1.60%/100"
:1-50
SET /A "ENEMY.HOLO.HP.1.50=%ENEMY.HP.FULL.1%00/100"
SET /A "ENEMY.HOLO.HP.1.50=%ENEMY.HOLO.HP.1.50%*50"
SET /A "ENEMY.HOLO.HP.1.50=%ENEMY.HP.FULL.1%00-%ENEMY.HOLO.HP.1.50%"
SET /A "ENEMY.HOLO.HP.1.50=%ENEMY.HOLO.HP.1.50%/100"
:1-40
SET /A "ENEMY.HOLO.HP.1.40=%ENEMY.HP.FULL.1%00/100"
SET /A "ENEMY.HOLO.HP.1.40=%ENEMY.HOLO.HP.1.40%*60"
SET /A "ENEMY.HOLO.HP.1.40=%ENEMY.HP.FULL.1%00-%ENEMY.HOLO.HP.1.40%"
SET /A "ENEMY.HOLO.HP.1.40=%ENEMY.HOLO.HP.1.40%/100"
:1-30
SET /A "ENEMY.HOLO.HP.1.30=%ENEMY.HP.FULL.1%00/100"
SET /A "ENEMY.HOLO.HP.1.30=%ENEMY.HOLO.HP.1.30%*70"
SET /A "ENEMY.HOLO.HP.1.30=%ENEMY.HP.FULL.1%00-%ENEMY.HOLO.HP.1.30%"
SET /A "ENEMY.HOLO.HP.1.30=%ENEMY.HOLO.HP.1.30%/100"
:1-20
SET /A "ENEMY.HOLO.HP.1.20=%ENEMY.HP.FULL.1%00/100"
SET /A "ENEMY.HOLO.HP.1.20=%ENEMY.HOLO.HP.1.20%*80"
SET /A "ENEMY.HOLO.HP.1.20=%ENEMY.HP.FULL.1%00-%ENEMY.HOLO.HP.1.20%"
SET /A "ENEMY.HOLO.HP.1.20=%ENEMY.HOLO.HP.1.20%/100"
:1-10
SET /A "ENEMY.HOLO.HP.1.10=%ENEMY.HP.FULL.1%00/100"
SET /A "ENEMY.HOLO.HP.1.10=%ENEMY.HOLO.HP.1.10%*90"
SET /A "ENEMY.HOLO.HP.1.10=%ENEMY.HP.FULL.1%00-%ENEMY.HOLO.HP.1.10%"
SET /A "ENEMY.HOLO.HP.1.10=%ENEMY.HOLO.HP.1.10%/100"
:1.00
ENDLOCAL&SET ENEMY.HOLO.HP.1.90=%ENEMY.HOLO.HP.1.90%&SET ENEMY.HOLO.HP.1.80=%ENEMY.HOLO.HP.1.80%&SET ENEMY.HOLO.HP.1.70=%ENEMY.HOLO.HP.1.70%&SET ENEMY.HOLO.HP.1.60=%ENEMY.HOLO.HP.1.60%&SET ENEMY.HOLO.HP.1.50=%ENEMY.HOLO.HP.1.50%&SET ENEMY.HOLO.HP.1.40=%ENEMY.HOLO.HP.1.40%&SET ENEMY.HOLO.HP.1.30=%ENEMY.HOLO.HP.1.30%&SET ENEMY.HOLO.HP.1.20=%ENEMY.HOLO.HP.1.20%&SET ENEMY.HOLO.HP.1.10=%ENEMY.HOLO.HP.1.10%
::ENEMY.2
SETLOCAL ENABLEEXTENSIONS
:2-90
SET /A "ENEMY.HOLO.HP.2.90=%ENEMY.HP.FULL.2%00/100"
SET /A "ENEMY.HOLO.HP.2.90=%ENEMY.HOLO.HP.2.90%*10"
SET /A "ENEMY.HOLO.HP.2.90=%ENEMY.HP.FULL.2%00-%ENEMY.HOLO.HP.2.90%"
SET /A "ENEMY.HOLO.HP.2.90=%ENEMY.HOLO.HP.2.90%/100"
:2-80
SET /A "ENEMY.HOLO.HP.2.80=%ENEMY.HP.FULL.2%00/100"
SET /A "ENEMY.HOLO.HP.2.80=%ENEMY.HOLO.HP.2.80%*20"
SET /A "ENEMY.HOLO.HP.2.80=%ENEMY.HP.FULL.2%00-%ENEMY.HOLO.HP.2.80%"
SET /A "ENEMY.HOLO.HP.2.80=%ENEMY.HOLO.HP.2.80%/100"
:2-70
SET /A "ENEMY.HOLO.HP.2.70=%ENEMY.HP.FULL.2%00/100"
SET /A "ENEMY.HOLO.HP.2.70=%ENEMY.HOLO.HP.2.70%*30"
SET /A "ENEMY.HOLO.HP.2.70=%ENEMY.HP.FULL.2%00-%ENEMY.HOLO.HP.2.70%"
SET /A "ENEMY.HOLO.HP.2.70=%ENEMY.HOLO.HP.2.70%/100"
:2-60
SET /A "ENEMY.HOLO.HP.2.60=%ENEMY.HP.FULL.2%00/100"
SET /A "ENEMY.HOLO.HP.2.60=%ENEMY.HOLO.HP.2.60%*40"
SET /A "ENEMY.HOLO.HP.2.60=%ENEMY.HP.FULL.2%00-%ENEMY.HOLO.HP.2.60%"
SET /A "ENEMY.HOLO.HP.2.60=%ENEMY.HOLO.HP.2.60%/100"
:2-50
SET /A "ENEMY.HOLO.HP.2.50=%ENEMY.HP.FULL.2%00/100"
SET /A "ENEMY.HOLO.HP.2.50=%ENEMY.HOLO.HP.2.50%*50"
SET /A "ENEMY.HOLO.HP.2.50=%ENEMY.HP.FULL.2%00-%ENEMY.HOLO.HP.2.50%"
SET /A "ENEMY.HOLO.HP.2.50=%ENEMY.HOLO.HP.2.50%/100"
:2-40
SET /A "ENEMY.HOLO.HP.2.40=%ENEMY.HP.FULL.2%00/100"
SET /A "ENEMY.HOLO.HP.2.40=%ENEMY.HOLO.HP.2.40%*60"
SET /A "ENEMY.HOLO.HP.2.40=%ENEMY.HP.FULL.2%00-%ENEMY.HOLO.HP.2.40%"
SET /A "ENEMY.HOLO.HP.2.40=%ENEMY.HOLO.HP.2.40%/100"
:2-30
SET /A "ENEMY.HOLO.HP.2.30=%ENEMY.HP.FULL.2%00/100"
SET /A "ENEMY.HOLO.HP.2.30=%ENEMY.HOLO.HP.2.30%*70"
SET /A "ENEMY.HOLO.HP.2.30=%ENEMY.HP.FULL.2%00-%ENEMY.HOLO.HP.2.30%"
SET /A "ENEMY.HOLO.HP.2.30=%ENEMY.HOLO.HP.2.30%/100"
:2-20
SET /A "ENEMY.HOLO.HP.2.20=%ENEMY.HP.FULL.2%00/100"
SET /A "ENEMY.HOLO.HP.2.20=%ENEMY.HOLO.HP.2.20%*80"
SET /A "ENEMY.HOLO.HP.2.20=%ENEMY.HP.FULL.2%00-%ENEMY.HOLO.HP.2.20%"
SET /A "ENEMY.HOLO.HP.2.20=%ENEMY.HOLO.HP.2.20%/100"
:2-10
SET /A "ENEMY.HOLO.HP.2.10=%ENEMY.HP.FULL.2%00/100"
SET /A "ENEMY.HOLO.HP.2.10=%ENEMY.HOLO.HP.2.10%*90"
SET /A "ENEMY.HOLO.HP.2.10=%ENEMY.HP.FULL.2%00-%ENEMY.HOLO.HP.2.10%"
SET /A "ENEMY.HOLO.HP.2.10=%ENEMY.HOLO.HP.2.10%/100"
:2-00
ENDLOCAL&SET ENEMY.HOLO.HP.2.90=%ENEMY.HOLO.HP.2.90%&SET ENEMY.HOLO.HP.2.80=%ENEMY.HOLO.HP.2.80%&SET ENEMY.HOLO.HP.2.70=%ENEMY.HOLO.HP.2.70%&SET ENEMY.HOLO.HP.2.60=%ENEMY.HOLO.HP.2.60%&SET ENEMY.HOLO.HP.2.50=%ENEMY.HOLO.HP.2.50%&SET ENEMY.HOLO.HP.2.40=%ENEMY.HOLO.HP.2.40%&SET ENEMY.HOLO.HP.2.30=%ENEMY.HOLO.HP.2.30%&SET ENEMY.HOLO.HP.2.20=%ENEMY.HOLO.HP.2.20%&SET ENEMY.HOLO.HP.2.10=%ENEMY.HOLO.HP.2.10%
::ENEMY.3
SETLOCAL ENABLEEXTENSIONS
:3-90
SET /A "ENEMY.HOLO.HP.3.90=%ENEMY.HP.FULL.3%00/100"
SET /A "ENEMY.HOLO.HP.3.90=%ENEMY.HOLO.HP.3.90%*10"
SET /A "ENEMY.HOLO.HP.3.90=%ENEMY.HP.FULL.3%00-%ENEMY.HOLO.HP.3.90%"
SET /A "ENEMY.HOLO.HP.3.90=%ENEMY.HOLO.HP.3.90%/100"
:3-80
SET /A "ENEMY.HOLO.HP.3.80=%ENEMY.HP.FULL.3%00/100"
SET /A "ENEMY.HOLO.HP.3.80=%ENEMY.HOLO.HP.3.80%*20"
SET /A "ENEMY.HOLO.HP.3.80=%ENEMY.HP.FULL.3%00-%ENEMY.HOLO.HP.3.80%"
SET /A "ENEMY.HOLO.HP.3.80=%ENEMY.HOLO.HP.3.80%/100"
:3-70
SET /A "ENEMY.HOLO.HP.3.70=%ENEMY.HP.FULL.3%00/100"
SET /A "ENEMY.HOLO.HP.3.70=%ENEMY.HOLO.HP.3.70%*30"
SET /A "ENEMY.HOLO.HP.3.70=%ENEMY.HP.FULL.3%00-%ENEMY.HOLO.HP.3.70%"
SET /A "ENEMY.HOLO.HP.3.70=%ENEMY.HOLO.HP.3.70%/100"
:3-60
SET /A "ENEMY.HOLO.HP.3.60=%ENEMY.HP.FULL.3%00/100"
SET /A "ENEMY.HOLO.HP.3.60=%ENEMY.HOLO.HP.3.60%*40"
SET /A "ENEMY.HOLO.HP.3.60=%ENEMY.HP.FULL.3%00-%ENEMY.HOLO.HP.3.60%"
SET /A "ENEMY.HOLO.HP.3.60=%ENEMY.HOLO.HP.3.60%/100"
:3-50
SET /A "ENEMY.HOLO.HP.3.50=%ENEMY.HP.FULL.3%00/100"
SET /A "ENEMY.HOLO.HP.3.50=%ENEMY.HOLO.HP.3.50%*50"
SET /A "ENEMY.HOLO.HP.3.50=%ENEMY.HP.FULL.3%00-%ENEMY.HOLO.HP.3.50%"
SET /A "ENEMY.HOLO.HP.3.50=%ENEMY.HOLO.HP.3.50%/100"
:3-40
SET /A "ENEMY.HOLO.HP.3.40=%ENEMY.HP.FULL.3%00/100"
SET /A "ENEMY.HOLO.HP.3.40=%ENEMY.HOLO.HP.3.40%*60"
SET /A "ENEMY.HOLO.HP.3.40=%ENEMY.HP.FULL.3%00-%ENEMY.HOLO.HP.3.40%"
SET /A "ENEMY.HOLO.HP.3.40=%ENEMY.HOLO.HP.3.40%/100"
:3-30
SET /A "ENEMY.HOLO.HP.3.30=%ENEMY.HP.FULL.3%00/100"
SET /A "ENEMY.HOLO.HP.3.30=%ENEMY.HOLO.HP.3.30%*70"
SET /A "ENEMY.HOLO.HP.3.30=%ENEMY.HP.FULL.3%00-%ENEMY.HOLO.HP.3.30%"
SET /A "ENEMY.HOLO.HP.3.30=%ENEMY.HOLO.HP.3.30%/100"
:3-20
SET /A "ENEMY.HOLO.HP.3.20=%ENEMY.HP.FULL.3%00/100"
SET /A "ENEMY.HOLO.HP.3.20=%ENEMY.HOLO.HP.3.20%*80"
SET /A "ENEMY.HOLO.HP.3.20=%ENEMY.HP.FULL.3%00-%ENEMY.HOLO.HP.3.20%"
SET /A "ENEMY.HOLO.HP.3.20=%ENEMY.HOLO.HP.3.20%/100"
:3-10
SET /A "ENEMY.HOLO.HP.3.10=%ENEMY.HP.FULL.3%00/100"
SET /A "ENEMY.HOLO.HP.3.10=%ENEMY.HOLO.HP.3.10%*90"
SET /A "ENEMY.HOLO.HP.3.10=%ENEMY.HP.FULL.3%00-%ENEMY.HOLO.HP.3.10%"
SET /A "ENEMY.HOLO.HP.3.10=%ENEMY.HOLO.HP.3.10%/100"
:3-00
ENDLOCAL&SET ENEMY.HOLO.HP.3.90=%ENEMY.HOLO.HP.3.90%&SET ENEMY.HOLO.HP.3.80=%ENEMY.HOLO.HP.3.80%&SET ENEMY.HOLO.HP.3.70=%ENEMY.HOLO.HP.3.70%&SET ENEMY.HOLO.HP.3.60=%ENEMY.HOLO.HP.3.60%&SET ENEMY.HOLO.HP.3.50=%ENEMY.HOLO.HP.3.50%&SET ENEMY.HOLO.HP.3.40=%ENEMY.HOLO.HP.3.40%&SET ENEMY.HOLO.HP.3.30=%ENEMY.HOLO.HP.3.30%&SET ENEMY.HOLO.HP.3.20=%ENEMY.HOLO.HP.3.20%&SET ENEMY.HOLO.HP.3.10=%ENEMY.HOLO.HP.3.10%
::PLAYER
SETLOCAL ENABLEEXTENSIONS
:P-9
SET /A "PLAYER.HOLO.HP.90=%PLAYER.HP.FULL%00/100"
SET /A "PLAYER.HOLO.HP.90=%PLAYER.HOLO.HP.90%*10"
SET /A "PLAYER.HOLO.HP.90=%PLAYER.HP.FULL%00-%PLAYER.HOLO.HP.90%"
SET /A "PLAYER.HOLO.HP.90=%PLAYER.HOLO.HP.90%/100"
:P-8
SET /A "PLAYER.HOLO.HP.80=%PLAYER.HP.FULL%00/100"
SET /A "PLAYER.HOLO.HP.80=%PLAYER.HOLO.HP.80%*20"
SET /A "PLAYER.HOLO.HP.80=%PLAYER.HP.FULL%00-%PLAYER.HOLO.HP.80%"
SET /A "PLAYER.HOLO.HP.80=%PLAYER.HOLO.HP.80%/100"
:P-70
SET /A "PLAYER.HOLO.HP.70=%PLAYER.HP.FULL%00/100"
SET /A "PLAYER.HOLO.HP.70=%PLAYER.HOLO.HP.70%*30"
SET /A "PLAYER.HOLO.HP.70=%PLAYER.HP.FULL%00-%PLAYER.HOLO.HP.70%"
SET /A "PLAYER.HOLO.HP.70=%PLAYER.HOLO.HP.70%/100"
:P-60
SET /A "PLAYER.HOLO.HP.60=%PLAYER.HP.FULL%00/100"
SET /A "PLAYER.HOLO.HP.60=%PLAYER.HOLO.HP.60%*40"
SET /A "PLAYER.HOLO.HP.60=%PLAYER.HP.FULL%00-%PLAYER.HOLO.HP.60%"
SET /A "PLAYER.HOLO.HP.60=%PLAYER.HOLO.HP.60%/100"
:P-50
SET /A "PLAYER.HOLO.HP.50=%PLAYER.HP.FULL%00/100"
SET /A "PLAYER.HOLO.HP.50=%PLAYER.HOLO.HP.50%*50"
SET /A "PLAYER.HOLO.HP.50=%PLAYER.HP.FULL%00-%PLAYER.HOLO.HP.50%"
SET /A "PLAYER.HOLO.HP.50=%PLAYER.HOLO.HP.50%/100"
:P-40
SET /A "PLAYER.HOLO.HP.40=%PLAYER.HP.FULL%00/100"
SET /A "PLAYER.HOLO.HP.40=%PLAYER.HOLO.HP.40%*60"
SET /A "PLAYER.HOLO.HP.40=%PLAYER.HP.FULL%00-%PLAYER.HOLO.HP.40%"
SET /A "PLAYER.HOLO.HP.40=%PLAYER.HOLO.HP.40%/100"
:P-30
SET /A "PLAYER.HOLO.HP.30=%PLAYER.HP.FULL%00/100"
SET /A "PLAYER.HOLO.HP.30=%PLAYER.HOLO.HP.30%*70"
SET /A "PLAYER.HOLO.HP.30=%PLAYER.HP.FULL%00-%PLAYER.HOLO.HP.30%"
SET /A "PLAYER.HOLO.HP.30=%PLAYER.HOLO.HP.30%/100"
:P-20
SET /A "PLAYER.HOLO.HP.20=%PLAYER.HP.FULL%00/100"
SET /A "PLAYER.HOLO.HP.20=%PLAYER.HOLO.HP.20%*80"
SET /A "PLAYER.HOLO.HP.20=%PLAYER.HP.FULL%00-%PLAYER.HOLO.HP.20%"
SET /A "PLAYER.HOLO.HP.20=%PLAYER.HOLO.HP.20%/100"
:P-10
SET /A "PLAYER.HOLO.HP.10=%PLAYER.HP.FULL%00/100"
SET /A "PLAYER.HOLO.HP.10=%PLAYER.HOLO.HP.10%*90"
SET /A "PLAYER.HOLO.HP.10=%PLAYER.HP.FULL%00-%PLAYER.HOLO.HP.10%"
SET /A "PLAYER.HOLO.HP.10=%PLAYER.HOLO.HP.10%/100"
:P-00
ENDLOCAL&SET PLAYER.HOLO.HP.90=%PLAYER.HOLO.HP.90%&SET PLAYER.HOLO.HP.80=%PLAYER.HOLO.HP.80%&SET PLAYER.HOLO.HP.70=%PLAYER.HOLO.HP.70%&SET PLAYER.HOLO.HP.60=%PLAYER.HOLO.HP.60%&SET PLAYER.HOLO.HP.50=%PLAYER.HOLO.HP.50%&SET PLAYER.HOLO.HP.40=%PLAYER.HOLO.HP.40%&SET PLAYER.HOLO.HP.30=%PLAYER.HOLO.HP.30%&SET PLAYER.HOLO.HP.20=%PLAYER.HOLO.HP.20%&SET PLAYER.HOLO.HP.10=%PLAYER.HOLO.HP.10%
SET A_1=
SET A_2=
SET B_1=
SET B_2=
SET C_1=
SET C_2=
IF NOT %ENEMY.HP.NOW.2%==0 SET "A_1=IF %ENEMY.HP.NOW.1% LSS %ENEMY.HP.NOW.2% "
IF NOT %ENEMY.HP.NOW.3%==0 SET "A_2=IF %ENEMY.HP.NOW.1% LSS %ENEMY.HP.NOW.3% "
IF NOT %ENEMY.HP.NOW.1%==0 SET "B_1=IF %ENEMY.HP.NOW.2% LSS %ENEMY.HP.NOW.1% "
IF NOT %ENEMY.HP.NOW.3%==0 SET "B_2=IF %ENEMY.HP.NOW.2% LSS %ENEMY.HP.NOW.3% "
IF NOT %ENEMY.HP.NOW.1%==0 SET "C_1=IF %ENEMY.HP.NOW.3% LSS %ENEMY.HP.NOW.1% "
IF NOT %ENEMY.HP.NOW.2%==0 SET "C_2=IF %ENEMY.HP.NOW.3% LSS %ENEMY.HP.NOW.2% "
IF NOT %ENEMY.HP.NOW.1%==0 %A_1%%A_2%SET INPUTATK=1
IF NOT %ENEMY.HP.NOW.2%==0 %B_1%%B_2%SET INPUTATK=2
IF NOT %ENEMY.HP.NOW.3%==0 %C_1%%C_2%SET INPUTATK=3
EXIT /B 0