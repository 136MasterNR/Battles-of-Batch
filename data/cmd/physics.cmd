@ECHO OFF
CLS
SET GET_POS=3
SET OLD_POS=%GET_POS%
START /B "" CMD /C ".\physicsBG.cmd" ^& EXIT
ECHO.[%GET_POS%;0H[1APHYSICS SIMULATION: 
:LOOP                   
%CHOICE%
IF /I %CHOICE.INPUT%==S SET /A GET_POS+=1
IF /I %CHOICE.INPUT%==W IF NOT %GET_POS% LEQ 3 SET /A GET_POS-=1
ECHO.[%OLD_POS%;0H[1A                   [%GET_POS%;0H[1APHYSICS SIMULATION: 
SET OLD_POS=%GET_POS%
ECHO.%GET_POS%>..\temp\GET_POS
GOTO :LOOP
