:: EXPERIMENTAL!!!

IF NOT DEFINED VERCODE EXIT
SET FRAMES=0
SET POS.Y=0
SET POS.X=0
SET /A COLS.LIMIT=%COLS% - 16
SET /A LINES.LIMIT=%LINES% - 13

:: CREATE STARTING FRAME LAYERS
SET FRAME.LAYER.1=[0;0H---------------------------------------------------------------------------------------------------------------------[2;0H---------------------------------------------------------------------------------------------------------------------[3;0H---------------------------------------------------------------------------------------------------------------------[4;0H---------------------------------------------------------------------------------------------------------------------[5;0H---------------------------------------------------------------------------------------------------------------------[6;0H---------------------------------------------------------------------------------------------------------------------[7;0H---------------------------------------------------------------------------------------------------------------------[8;0H---------------------------------------------------------------------------------------------------------------------[9;0H---------------------------------------------------------------------------------------------------------------------[10;0H---------------------------------------------------------------------------------------------------------------------[11;0H---------------------------------------------------------------------------------------------------------------------[12;0H---------------------------------------------------------------------------------------------------------------------[13;0H---------------------------------------------------------------------------------------------------------------------[14;0H---------------------------------------------------------------------------------------------------------------------[15;0H---------------------------------------------------------------------------------------------------------------------[16;0H---------------------------------------------------------------------------------------------------------------------[17;0H---------------------------------------------------------------------------------------------------------------------[18;0H---------------------------------------------------------------------------------------------------------------------[19;0H---------------------------------------------------------------------------------------------------------------------[20;0H---------------------------------------------------------------------------------------------------------------------[21;0H---------------------------------------------------------------------------------------------------------------------[22;0H---------------------------------------------------------------------------------------------------------------------[23;0H---------------------------------------------------------------------------------------------------------------------[24;0H---------------------------------------------------------------------------------------------------------------------[25;0H---------------------------------------------------------------------------------------------------------------------[26;0H---------------------------------------------------------------------------------------------------------------------[27;0H---------------------------------------------------------------------------------------------------------------------[28;0H---------------------------------------------------------------------------------------------------------------------[29;0H---------------------------------------------------------------------------------------------------------------------[30;0H---------------------------------------------------------------------------------------------------------------------[31;0H---------------------------------------------------------------------------------------------------------------------[32;0H---------------------------------------------------------------------------------------------------------------------[33;0H---------------------------------------------------------------------------------------------------------------------[34;0H---------------------------------------------------------------------------------------------------------------------[35;0H---------------------------------------------------------------------------------------------------------------------[36;0H---------------------------------------------------------------------------------------------------------------------[37;0H---------------------------------------------------------------------------------------------------------------------[38;0H---------------------------------------------------------------------------------------------------------------------[39;0H---------------------------------------------------------------------------------------------------------------------[40;0H---------------------------------------------------------------------------------------------------------------------[41;0H---------------------------------------------------------------------------------------------------------------------[42;0H---------------------------------------------------------------------------------------------------------------------[43;0H---------------------------------------------------------------------------------------------------------------------[44;0H---------------------------------------------------------------------------------------------------------------------[45;0H---------------------------------------------------------------------------------------------------------------------[46;0H---------------------------------------------------------------------------------------------------------------------[47;0H---------------------------------------------------------------------------------------------------------------------[48;0H---------------------------------------------------------------------------------------------------------------------[1A
SET FRAME.LAYER.2=
SET FRAME.LAYER.3=
SET FRAME.LAYER.4=[10;25HTHIS LAYER IS ABOVE THE PLAYER MODEL

:EVENT
:: UPDATE DISPLAY
CALL :ANIMATE
SET FRAME.LAYER.2=[%POS.Y%;%POS.X%H[4C___[1B[4D//_\\_[1B[8D."\\    ".[1B[11D/          \[1B[12D^|           \_[1B[14D^|     %EYE.P.1%[1B[14D\    %EYE.P.2%[1B[14D/\/\ %EYE.P.3%[1B[13D(_. %EYE.P.4%[1B[12D^|     .-'  \[1B[12D^|  .-'.     )[1B[13D^| (  _/--.-'[1B[12D^|  `.___.'[1B[13D[3C^|   ^|[1A[8A[4D%POS.Y%;%POS.X%
SET FRAME.LAYER.3=[0;0HWASD[3CTO-MOVE[4CFPS=%FRAMES%[4CKEY=%CHOICE.INPUT%

:: DISPLAY DISPLAY
FOR /F "TOKENS=1,*DELIMS==" %%1 IN ('SET FRAME.LAYER.') DO (
	ECHO.%%2
)

%CHOICE% /T 0
SET /A FRAMES+=1
IF /I %CHOICE.INPUT%.==S. SET /A POS.Y+=2
IF /I %CHOICE.INPUT%.==W. SET /A POS.Y-=2
IF /I %CHOICE.INPUT%.==D. SET /A POS.X+=4
IF /I %CHOICE.INPUT%.==A. SET /A POS.X-=4
IF %POS.X% GEQ %COLS.LIMIT% SET POS.X=%COLS.LIMIT%
IF %POS.Y% GEQ %LINES.LIMIT% SET POS.Y=%LINES.LIMIT%
IF %POS.X% LEQ 0 SET POS.X=0
IF %POS.Y% LEQ 0 SET POS.Y=0
IF /I %CHOICE.INPUT%==Q EXIT /B 0
GOTO EVENT


:ANIMATE
SET /A EYE.P=%FRAMES% %% 6
IF %EYE.P% EQU 0 (
	SET "EYE.P.1=  ,--.-.)"
	SET "EYE.P.2= /  o \o\"
	SET "EYE.P.3= \    /_/"
	SET "EYE.P.4=  `--'__)"
) ELSE IF %EYE.P% EQU 1 (
	SET "EYE.P.1=  ____ _)"
	SET "EYE.P.2= /  o \o\"
	SET "EYE.P.3= \____/_/"
	SET "EYE.P.4=      __)"
) ELSE IF %EYE.P% EQU 2 (
	SET "EYE.P.1=        )"
	SET "EYE.P.2= .--.-,.\"
	SET "EYE.P.3= '----'-/"
	SET "EYE.P.4=      __)"
) ELSE IF %EYE.P% EQU 3 (
	SET "EYE.P.1=        )"
	SET "EYE.P.2= .____,_\"
	SET "EYE.P.3=      ' /"
	SET "EYE.P.4=      __)"
) ELSE IF %EYE.P% EQU 5 (
	SET "EYE.P.1=  ____ _)"
	SET "EYE.P.2= /  o \o\"
	SET "EYE.P.3= \____/_/"
	SET "EYE.P.4=      __)"
) ELSE IF %EYE.P% EQU 4 (
	SET "EYE.P.1=        )"
	SET "EYE.P.2= .--.-,.\"
	SET "EYE.P.3= '----'-/"
	SET "EYE.P.4=      __)"
)
EXIT /B 0