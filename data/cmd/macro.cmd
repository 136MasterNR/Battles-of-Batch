@ECHO OFF
IF %1.==. (
	DOSKEY /macros:all
	EXIT /B 0
)
IF %2.==. (
	DOSKEY /macros | findstr /i "%1=" > nul || (
		ECHO.Macro %1 does not exist.
		EXIT /B 0
	)

	DOSKEY %1=
	ECHO.Macro %1 cleared.
	EXIT /B 0
)

DOSKEY %1=%2 $*
ECHO.Macro %1 assigned to %2 successfully.
EXIT /B 0
