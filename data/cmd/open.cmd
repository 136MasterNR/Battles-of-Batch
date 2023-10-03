@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

ECHO(%* | FINDSTR /C:"/?">NUL && GOTO ?

ECHO(%* | FINDSTR /C:"/">NUL && (
	ECHO.Error: Invalid switch
	ECHO ON
	@EXIT /B 0
)

IF %1.==. (
	EXPLORER .
	EXIT /B 0
)

FOR /R /D %%I IN (*) DO (
    IF /I "%%~nxI"=="%1" (
		EXPLORER "%%~dpnI"
        EXIT /B
    )
)


FOR /D /R "%DATA%" %%I IN (*) DO (
    IF /I "%%~nxI"=="%1" (
		EXPLORER "%%~dpnI"
        EXIT /B
    )
)

ECHO.Err: Directory "%1" was not found

ECHO ON
@EXIT /B 0
