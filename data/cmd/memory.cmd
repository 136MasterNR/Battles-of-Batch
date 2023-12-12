@ECHO OFF
CALL :%* 2>NUL || FOR /F "TOKENS=1,2DELIMS==" %%A IN ('SET') DO (
	ECHO.%%A=%%B[0m <NUL > CON
)
@EXIT /B 0

:SIZE
SET>".\MEMORY_OUT.DMP"
FOR %%A IN (".\MEMORY_OUT.DMP") DO ECHO Memory usage is at %%~ZA bytes.
DEL /Q ".\MEMORY_OUT.DMP"
EXIT /B 0

:CLEAR-ALL
FOR /F "TOKENS=1DELIMS==" %%A IN ('SET') DO SET "%%A="
EXIT /B 0

:GC
IF /I %1.==CLEAR. (
	FOR /F "TOKENS=1DELIMS==" %%A IN ('SET TMP ^| FINDSTR /V "Local\Temp"') DO @SET %%A=
	FOR /F "TOKENS=1DELIMS==" %%A IN ('SET TEMP ^| FINDSTR /V "Local\Temp"') DO @SET %%A=
	FOR /F "TOKENS=1DELIMS==" %%A IN ('SET VAR.') DO SET %%A=
	FOR /F "TOKENS=1DELIMS==" %%A IN ('SET CRAFT.UI') DO SET %%A=
	IF DEFINED ARG SET ARG=
	ECHO.Useless variables have been removed.
	SAVE
) ELSE (
	SET TMP | FINDSTR /V "Local\Temp"
	SET TEMP | FINDSTR /V "Local\Temp"
	SET VAR.
	SET CRAFT.UI
	IF DEFINED ARG ECHO.ARG=%ARG%
)
EXIT /B 0