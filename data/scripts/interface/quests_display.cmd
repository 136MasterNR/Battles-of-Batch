IF NOT DEFINED VERCODE EXIT

(
ECHO.[?25l[H[0m.--------------------------------------------------.-------------.--------------------------------------------------.
ECHO.^|                                                  ^| SIDE QUESTS ^|                                                  ^|
ECHO.'--------------------------------------------------'------.------'--------------------------------------------------'
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          ^|                                                          
ECHO.                                                          '                                                          
ECHO.                                      [1;37mComplete all quests to unlock new quests![0m                                      
ECHO..---------------------------------------------------------.---------------------------------------------------------.[4;3H
)

FOR /L %%I IN (1,1,7) DO (
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

SET CNT=5

FOR /F "TOKENS=1DELIMS=" %%1 IN ('SET QST.') DO (
	CALL :DISPLAY %%1
)
EXIT /B 0



:DISPLAY
SETLOCAL ENABLEDELAYEDEXPANSION

SET TMP.QUEST=%1
SET TMP.QUEST=!TMP.QUEST:*.=!

FOR /F "TOKENS=1DELIMS=;" %%1 IN ("!%1!") DO (
	SET TMP.REACHED=%%1
)

IF !TMP.REACHED! LEQ 0 ( SET Q.PERC=000 ) ELSE SET /A Q.PERC=TMP.REACHED * 100000 / QST_REQUIRE.%TMP.QUEST%
IF !Q.PERC! GTR 100000 SET Q.PERC=100000
IF !Q.PERC!==100000 (SET "Q.PROGRESS=%RGB.TRUE%√") ELSE (SET "Q.PROGRESS=%RGB.FALSE%Χ")

:: Make sure it's always one percent higher
SET /A Q.PERC+=999

SET REQUIRE=!QST_REQUIRE.%TMP.QUEST%!

ECHO.[%CNT%;3H.----------------------------------------------------.  
ECHO.--' [1;37mQuest #1[0m: [s                                         '--[u"!QST_NAME.%TMP.QUEST%!"
ECHO.    %RGB%255;247;94mObjective[0m: [s                                           [u!QST_DESC.%TMP.QUEST%:$REQUIRE=%REQUIRE%!
ECHO.    %RGB%190;255;179mProgress[0m: [s                                            
ECHO.[u[1;37m!Q.PERC:~0,-3!%%[0m (!Q.PROGRESS![0m: Total !TMP.REACHED!)[0m
ECHO.--. %RGB%128;255;253mRewards[0m: [s                                          .--
ECHO.[u%RGB.COIN%!QST_MONEY.%TMP.QUEST%! Coins[0m - %RGB.LVL%!QST_EXP.%TMP.QUEST%! XP[0m
ECHO.  '----------------------------------------------------'  
ENDLOCAL
SET /A CNT+=6
EXIT /B 0