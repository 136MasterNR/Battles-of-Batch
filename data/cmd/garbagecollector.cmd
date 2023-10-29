@SET ARG=%1
@IF NOT DEFINED ARG SET ARG=0
@IF /I %ARG%==CLEAR (
	@FOR /F "TOKENS=1DELIMS==" %%A IN ('SET TMP ^| findstr /V "Local\Temp"') DO @SET %%A=
	@FOR /F "TOKENS=1DELIMS==" %%A IN ('SET TEMP ^| findstr /V "Local\Temp"') DO @SET %%A=
	ECHO.Useless variables have been removed.
	SAVE
) ELSE (
	@SET TMP | findstr /V "Local\Temp"
	@SET TEMP | findstr /V "Local\Temp"
)
@EXIT /B 0