@ECHO OFF
IF NOT DEFINED DM (
	ECHO.There was an error.
	EXIT /B 0
)
IF EXIST "%DM%\LET.DEBUG" (DEL "%DM%\LET.DEBUG"&&ECHO.Debug mode disabled.&SET "DEBUG.MODE=") ELSE ECHO.>"%DM%\LET.DEBUG"&&ECHO.Debug mode enabled.&SET "DEBUG.MODE=TRUE"
@ECHO ON
