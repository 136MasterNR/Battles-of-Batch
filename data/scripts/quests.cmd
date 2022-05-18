IF NOT DEFINED VERCODE EXIT

IF NOT %1==LOAD GOTO SKIP-1

CALL "%DATA_SAVES%\QUESTS.cmd"
IF NOT DEFINED QMEM_TOTAL_MONSTERS IF %Q.TOTAL_MONSTERS% GEQ %QMAX.TOTAL_MONSTERS% ( SET QMEM_TOTAL_MONSTERS_SEEN=TRUE ) ELSE SET "QMEM_TOTAL_MONSTERS=%Q.TOTAL_MONSTERS%"
IF NOT DEFINED QMEM_TOTAL_MONSTERS_SEEN IF NOT [%QMEM_TOTAL_MONSTERS%]==[%Q.TOTAL_MONSTERS%] IF NOT %Q.TOTAL_MONSTERS% GEQ %QMAX.TOTAL_MONSTERS% (SET QMEM_TOTAL_MONSTERS=%Q.TOTAL_MONSTERS%) ELSE SET QMEM_TOTAL_MONSTERS_SEEN=TRUE&SET "QMEM_TOTAL_MONSTERS=%Q.TOTAL_MONSTERS%"&CALL "%SAVE%" 1 PLAYER.MONEY %PLAYER.MONEY% +%QREW.MONEY.TOTAL_MONSTERS%&CALL "%SAVE%" 2 PLAYER.XP %PLAYER.XP% +%QREW.XP.TOTAL_MONSTERS%&CALL "%SCRIPTS_POP%\quest.cmd" %Q.TOTAL_MONSTERS% %QMAX.TOTAL_MONSTERS% 5 %QREW.MONEY.TOTAL_MONSTERS% %QREW.XP.TOTAL_MONSTERS% %QNAME.TOTAL_MONSTERS%

IF NOT DEFINED QMEM_LOSE IF %Q.LOSE% GEQ %QMAX.LOSE% ( SET QMEM_LOSE_SEEN=TRUE ) ELSE SET "QMEM_LOSE=%Q.LOSE%"
IF NOT DEFINED QMEM_LOSE_SEEN IF NOT [%QMEM_LOSE%]==[%Q.LOSE%] IF NOT %Q.LOSE% GEQ %QMAX.LOSE% (SET QMEM_LOSE=%Q.LOSE%) ELSE SET QMEM_LOSE_SEEN=TRUE&SET "QMEM_LOSE=%Q.LOSE%"&CALL "%SAVE%" 1 PLAYER.MONEY %PLAYER.MONEY% +%QREW.MONEY.LOSE%&CALL "%SAVE%" 2 PLAYER.XP %PLAYER.XP% +%QREW.XP.LOSE%&CALL "%SCRIPTS_POP%\quest.cmd" %Q.LOSE% %QMAX.LOSE% QMEM_LOSE=%Q.LOSE% %QNAME.TOTAL_LOSE% 5 %QNAME.LOSE%
GOTO :EOF
:SKIP-1

IF %Q.TOTAL_MONSTERS% LEQ 0 ( SET Q.PERC=000 ) ELSE SET /A Q.PERC=Q.TOTAL_MONSTERS * 100000 / %QMAX.TOTAL_MONSTERS%
IF %Q.PERC% GTR 100000 SET Q.PERC=100000
IF %Q.PERC%==100000 (SET "Q.PROGRESS=%RGB.TRUE%√") ELSE (SET "Q.PROGRESS=%RGB.FALSE%Χ")
SET TESTQPERC=%Q.PERC:~0,-3%
IF NOT DEFINED TESTQPERC SET Q.PERC=0000

ECHO.[5;3H.----------------------------------------------------.  
ECHO.--' [1;37mQuest #1[0m: [s                                         '--
ECHO.[u"%QNAME.TOTAL_MONSTERS%"
ECHO.    %RGB%255;247;94mObjective[0m: [s                                           
ECHO.[u%QDESC.TOTAL_MONSTERS%
ECHO.    %RGB%190;255;179mProgress[0m: [s                                            
ECHO.[u[1;37m%Q.PERC:~0,-3%%%[0m (%Q.PROGRESS%[0m: Total %Q.TOTAL_MONSTERS%)[0m
ECHO.--. %RGB%128;255;253mRewards[0m: [s                                          .--
ECHO.[u%RGB.COIN%%QREW.MONEY.TOTAL_MONSTERS% Coins[0m - %RGB.LVL%%QREW.XP.TOTAL_MONSTERS% XP[0m
ECHO.  '----------------------------------------------------'  


IF %Q.MONSTER_TYPE% LEQ 0 ( SET Q.PERC=000 ) ELSE SET /A Q.PERC=Q.MONSTER_TYPE * 100000 / 29
IF %Q.PERC% GTR 100000 SET Q.PERC=100000
IF %Q.PERC%==100000 (SET "Q.PROGRESS=%RGB.TRUE%√") ELSE (SET "Q.PROGRESS=%RGB.FALSE%Χ")
SET TESTQPERC=%Q.PERC:~0,-3%
IF NOT DEFINED TESTQPERC SET Q.PERC=0000

ECHO.  .----------------------------------------------------.  
ECHO.--' [1;37mQuest #2[0m: [s                                         '--
ECHO.[u"%QNAME.MTYPE%"
ECHO.    %RGB%255;247;94mObjective[0m: [s                                           
ECHO.[u%QDESC.MTYPE%
ECHO.    %RGB%190;255;179mProgress[0m: [s                                            
ECHO.[u[1;37m%Q.PERC:~0,-3%%%[0m (%Q.PROGRESS%[0m: %Q.MONSTER_TYPE%/29)[0m
ECHO.--. %RGB%128;255;253mRewards[0m: [s                                          .--
ECHO.[u%RGB.COIN%1200 Coins[0m - %RGB.LVL%1750 XP[0m
ECHO.  '----------------------------------------------------'  


IF %Q.LOSE% LEQ 0 ( SET Q.PERC=000 ) ELSE SET /A Q.PERC=Q.LOSE * 100000 / 5
IF %Q.PERC% GTR 100000 SET Q.PERC=100000
IF %Q.PERC:~0,-3%==100 (SET "Q.PROGRESS=%RGB.TRUE%√") ELSE (SET "Q.PROGRESS=%RGB.FALSE%Χ")
SET TESTQPERC=%Q.PERC:~0,-3%
IF NOT DEFINED TESTQPERC SET Q.PERC=0000

ECHO.  .----------------------------------------------------.  
ECHO.--' [1;37mQuest #3[0m: [s                                         '--
ECHO.[u"%QNAME.LOSE%"
ECHO.    %RGB%255;247;94mObjective[0m: [s                                           
ECHO.[u%QDESC.LOSE%
ECHO.    %RGB%190;255;179mProgress[0m: [s                                            
ECHO.[u[1;37m%Q.PERC:~0,-3%%%[0m (%Q.PROGRESS%[0m: Total %Q.LOSE%)[0m
ECHO.--. %RGB%128;255;253mRewards[0m: [s                                          .--
ECHO.[u%RGB.COIN%%QREW.MONEY.LOSE% Coins[0m - %RGB.LVL%%QREW.XP.LOSE% XP[0m
ECHO.  '----------------------------------------------------'  


FOR /L %%I IN (4,1,7) DO (
	ECHO.  .----------------------------------------------------.  
	ECHO.--' [0mQuest #%%I[0m: [1;30m"???"[0m                                    '--
	ECHO.    [0mObjective[0m: [1;30m*Mysterious Music Plays*
	ECHO.    [0mProgress[0m: [s                                            
	ECHO.[u[1;30m^(Locked^)[0m
	ECHO.--. [0mRewards[0m: [1;30m∞ Coins - ∞ XP[0m                            .--
	ECHO.  '----------------------------------------------------'  
)
ECHO.[4;0H
FOR /L %%I IN (8,1,9) DO (
	ECHO.[59C  .----------------------------------------------------.  
	ECHO.[59C--' [0mQuest #%%I[0m: [1;30m"???"[0m                                    '--
	ECHO.[59C    [0mObjective[0m: [1;30m*Mysterious Music Plays*
	ECHO.[59C    [0mProgress[0m: [s                                            
	ECHO.[59C[u[1;30m^(Locked^)[0m
	ECHO.[59C--. [0mRewards[0m: [1;30m∞ Coins - ∞ XP[0m                            .--
	ECHO.[59C  '----------------------------------------------------'  
)
FOR /L %%I IN (10,1,14) DO (
	ECHO.[59C  .----------------------------------------------------.  
	ECHO.[59C--' [0mQuest #%%I[0m: [1;30m"???"[0m                                   '--
	ECHO.[59C    [0mObjective[0m: [1;30m*Mysterious Music Plays*
	ECHO.[59C    [0mProgress[0m: [s                                            
	ECHO.[59C[u[1;30m^(Locked^)[0m
	ECHO.[59C--. [0mRewards[0m: [1;30m∞ Coins - ∞ XP[0m                            .--
	ECHO.[59C  '----------------------------------------------------'  
)
GOTO :EOF