@ECHO OFF
FOR /F "TOKENS=2,* DELIMS= " %%A IN ("%*") DO SET ARGS=%%B
CMD /B "" "..\scripts\%1.cmd" %ARGS%
@ECHO ON