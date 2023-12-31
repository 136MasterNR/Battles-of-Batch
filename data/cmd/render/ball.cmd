@ECHO OFF
SET POS=1
SET ACCEL=125
SET SWITCH=0
SET HEIGHT=2
:L
IF NOT EXIST ".\buffer_layer_1.cmd" EXIT

SET /A WEIGHT=140-HEIGHT
IF %WEIGHT% LEQ 0 EXIT
SET /A MAX_HEIGHT=HEIGHT+25

IF %SWITCH% EQU 0 (
	SET /A POS+=1
	IF %ACCEL% GTR 5 SET /A ACCEL-=7
	IF %POS% GEQ 47 (
		SET SWITCH=1
		SET /A HEIGHT+=10
	)
) ELSE IF %SWITCH% EQU 1 (
	SET /A POS-=1
	IF %POS% LEQ %MAX_HEIGHT% IF %ACCEL% LEQ %WEIGHT% SET /A ACCEL+=4
	IF %POS% LEQ %HEIGHT% SET SWITCH=0
)

IF %ACCEL% LEQ 5 SET ACCEL=3

CALL :display
CALL "%WAIT%" %ACCEL%
GOTO L

:display
SET /A POS_1=POS+1
(
	ECHO SET "map[4.%POS%]=[15C/'\"
	ECHO SET "map[4.%POS_1%]=[15C\./"
	ECHO EXIT /B 0
) > .\buffer_layer_4.cmd || GOTO display
EXIT /B 0