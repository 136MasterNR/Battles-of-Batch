@ECHO OFF
CALL :%* || SET
@EXIT /B 0

:SIZE
SET>".\MEMORY_OUT.DMP"
FOR %%A IN (".\MEMORY_OUT.DMP") DO ECHO Memory usage is %%~ZA bytes.
DEL /Q ".\MEMORY_OUT.DMP"
EXIT /B 0

:CLEAR-ALL
FOR /F "TOKENS=1DELIMS==" %%A IN ('SET') DO SET "%%A="
EXIT /B 0

:GC
ECHO ON
@SET ARG=%1
@IF NOT DEFINED ARG SET ARG=0
@IF /I %ARG%==CLEAR @(
	FOR /F "TOKENS=1DELIMS==" %%A IN ('SET TMP ^| FINDSTR /V "Local\Temp"') DO @SET %%A=
	FOR /F "TOKENS=1DELIMS==" %%A IN ('SET TEMP ^| FINDSTR /V "Local\Temp"') DO @SET %%A=
	ECHO.Useless variables have been removed.
	SAVE
) ELSE (
	@SET TMP | FINDSTR /V "Local\Temp"
	@SET TEMP | FINDSTR /V "Local\Temp"
)
@EXIT /B 0