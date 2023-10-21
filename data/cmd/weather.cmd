@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
SET ARG=%*
IF NOT DEFINED ARG SET ARG=0
ECHO.
ECHO(%ARG% | FINDSTR /C:"/?">NUL && GOTO ?
ECHO(%ARG% | FINDSTR /I /C:"/REG:">NUL && (
	FOR /f "tokens=2delims=:" %%I IN ("%ARG%") DO (
		SET REGION="%%I"
	)
)

ECHO(%ARG% | FINDSTR /I /C:"/ALL">NUL && (
	FOR /f "skip=7tokens=1delims=" %%I IN ('curl https://wttr.in/%REGION%') DO (
		ECHO.%%I
	)
) || ECHO(%ARG% | FINDSTR /I /C:"/TODAY">NUL && (
	FOR /f "skip=7tokens=1delims=" %%I IN ('curl https://wttr.in/%REGION%') DO (
		IF "%%I"=="└──────────────────────────────┴──────────────────────────────┴──────────────────────────────┴──────────────────────────────┘" (
			ECHO.%%I
			EXIT /B 0
		)
		ECHO.%%I
	)
) || (
	FOR /f "tokens=1delims=" %%I IN ('curl https://wttr.in/%REGION%') DO (
		IF "%%I"=="                                                       ┌─────────────┐                                                       " (
			EXIT /B 0
		)
		ECHO.%%I
	)
)
EXIT /B 0


:?
ECHO.Show the weather report.
ECHO.  weather [/all^|/today]
ECHO.
ECHO.You can use the following switches after the command:
ECHO.  /all             Show the wheather report for today ^& the next 3 days.
ECHO.  /today           Show today's wheather report.
ECHO.  /reg:[region]    Get wheather report for a specific region.
ECHO.                   Example: wheather /reg:oymyakon
ECHO.
EXIT /B 0
