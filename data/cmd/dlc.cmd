@ECHO OFF
SET ARG=%*
IF NOT DEFINED ARG SET ARG=0
ECHO.
IF "%ARG%"=="0" GOTO ?
SET "DLC.PATH=..\dlc"
ECHO(%ARG% | FINDSTR /C:"/?">NUL && GOTO ?
IF NOT EXIST "%DLC.PATH%" (
	ECHO.Error: Directory not found
	EXIT /B 1
)
ECHO(%ARG% | FINDSTR /I /C:"/L">NUL && GOTO L

ECHO(%ARG% | FINDSTR /C:"/">NUL && (
	ECHO.Error: Invalid switch
	ECHO ON
	@EXIT /B 0
)

SET P=
FOR /D %%D IN ("%DLC.PATH%\*") DO IF "%%~nxD"=="%ARG%" SET "P=%%~fD"

IF NOT DEFINED P (
	ECHO.Error: DLC pack not found.
	EXIT /B 1
)

:: LOADER ::

SET ".LOADER=DLC.PATH"
%.LOADER%

ECHO.Load finished.

ECHO ON
@EXIT /B 0


:: SWITCHES ::

:L
FOR /D %%D IN ("%DLC.PATH%\*") DO IF NOT "%%~nD"=="" ECHO.- %%~nD
ECHO ON
@EXIT /B 0

:?
ECHO.Extracts a DLC pack and adds it in to the game.
ECHO.  dlc [packTitle] [/switch]
ECHO.
ECHO.You can use the following switches after the command:
ECHO.  /?          Show information about this command.
ECHO.  /L          Show a list of all DLC packs.
ECHO ON
@EXIT /B 0