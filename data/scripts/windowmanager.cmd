@ECHO OFF
:LOOP
FOR /F "TOKENS=2 DELIMS=:" %%A IN ('MODE CON ^| FIND "Columns"') DO SET /A WIDTH=%%A
IF %WIDTH%==126 EXIT
IF NOT %WIDTH%==%1 (
	TASKKILL /IM xcopy.exe /F >NUL
)
TIMEOUT /T 2 /NOBREAK >NUL
GOTO :LOOP
