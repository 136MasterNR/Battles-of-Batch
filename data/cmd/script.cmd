@ECHO OFF
@IF %1.==. (
	ECHO.
	ECHO.script [file]
	ECHO.Runs a script located in the main scripts directory.
	EXIT /B 1
)
IF NOT EXIST "..\scripts" 
@SET P=
@FOR /F "TOKENS=1,* DELIMS= " %%A IN ("%*") DO SET ARGS=%%B
@FOR /R ..\scripts %%a IN (*) DO IF "%%~nxa"=="%1.cmd" SET P=%%~dpnxa
@IF NOT DEFINED P (
	@ECHO.Script not found.
	@EXIT /B 1
)
@CALL "%P%" %ARGS%
@ECHO ON
@EXIT /B 0