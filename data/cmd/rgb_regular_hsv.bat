@ECHO OFF
SET R=255
SET G=0
SET B=0
MODE CON:COLS=117 LINES=48
:RE
IF %B%==0 IF %R% GTR 0 (
	IF %G%==255 (
		SET /A R-=1
	) ELSE (
		SET /A G+=1
	)
	GOTO RUN
)
IF %G% GTR 0 (
	IF %B%==255 (
		SET /A G-=1
	) ELSE (
		SET /A B+=1
	)
	GOTO RUN
)
IF %B% GTR 0 (
	IF %R%==255 (
		SET /A B-=1
	) ELSE (
		SET /A R+=1
	)
)
:RUN
TITLE RGB (%R%, %G%, %B%) HSV REGULAR
ECHO.[H[?25l[48;2;%R%;%G%;%B%m                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [E                                                                                                                     [H
GOTO RE
