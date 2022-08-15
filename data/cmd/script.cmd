@ECHO OFF
@IF %1.==. (
	ECHO.ERR: MISSING 1 ARG
	EXIT /B 1
)
@SET P=
@FOR /F "TOKENS=1,* DELIMS= " %%A IN ("%*") DO SET ARGS=%%B
@FOR /R ..\scripts %%a IN (*) DO IF "%%~nxa"=="%1.cmd" SET P=%%~dpnxa
@IF NOT DEFINED P (
	@ECHO.Script not found.
	@EXIT /B 1
)
@CALL "%P%" %ARGS%
@ECHO ON&&EXIT /B 0