@ECHO OFF
SET GET_POS=1
SET OLD_POS=%GET_POS%
START /B "" CMD /C ".\physicsBG.cmd" ^& EXIT
:LOOP                   
ECHO.[%GET_POS%;0H[1AFALLING SIMULATION: 
%CHOICE%
IF /I %CHOICE.INPUT%==S SET /A GET_POS+=1
IF /I %CHOICE.INPUT%==W SET /A GET_POS-=1
ECHO.[%OLD_POS%;0H[1A                   
SET OLD_POS=%GET_POS%
ECHO.%GET_POS%>GET_POS
GOTO :LOOP
