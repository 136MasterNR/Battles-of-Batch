@ECHO OFF
SET ARG=%*
IF NOT DEFINED ARG SET ARG=0
IF "%ARG%"=="0" GOTO ?
ECHO(%ARG% | FINDSTR /C:"/?">NUL && GOTO ?
ECHO(%ARG% | FINDSTR /I /C:"/L">NUL && GOTO L
ECHO(%ARG% | FINDSTR /I /C:"/T">NUL && GOTO T

IF NOT EXIST "..\scripts" (
	ECHO.Error: Directory not found
	EXIT /B 1
)

SET P=
FOR /F "TOKENS=1,* DELIMS= " %%A IN ("%*") DO SET ARGS=%%B
FOR /R "..\scripts" %%a IN (*) DO IF "%%~nxa"=="%1.cmd" SET P=%%~dpnxa

IF NOT DEFINED P (
	@ECHO.Script not found.
	@EXIT /B 1
)

CALL "%P%" %ARGS%
ECHO ON
@EXIT /B 0

:?
ECHO.
ECHO.script [file]
ECHO.Runs a script located in the main scripts directory with parameters.
ECHO.
ECHO.You can use the following switches after the command:
ECHO.  /?          Show more information about this command.
ECHO.  /L          Show a list of all scripts.
ECHO.  /T [file]   Show the code of the script.
ECHO(%ARG% | FINDSTR /C:"/?">NUL && (
	ECHO.
	ECHO.Examples:
	ECHO.  script save 1 PLAYER.MONEY %%PLAYER.MONEY%% +150  -^>  Adds +150 money on your player.
	ECHO.  script save 1 PLAYER.XP 1000                 -^>  Sets your player XP to 1000.
	ECHO.  script items REPLACE-MAT Branch 1 WEAPONS       -^>  Upgrade your Branch once. Weapon must be present in the player
	ECHO.                                                      data.
	ECHO.  script items REPLACE-MAT Bomb 2 ITEMS           -^>  Increase the amount of Bombs by 2. Item must be present in the
	ECHO.                                                      player data.
	ECHO.  script /T deverr                                -^>  Show the code of the deverr script.
)
ECHO ON
@EXIT /B 0

:L
FOR /R "..\scripts" %%D IN (*.cmd, *.bat) DO ECHO.- %%~nD
ECHO ON
@EXIT /B 0

:T
SET "ARG=%ARG:/T =%"
SET "ARG=%ARG: /T=%"
SET "ARG=%ARG:/T=%"
IF NOT DEFINED ARG (
	ECHO.No file name was given.
	ECHO ON
	@EXIT /B 1
)
SET P=
FOR /F "TOKENS=1,* DELIMS= " %%A IN ("%*") DO SET ARGS=%%B
FOR /R "..\scripts" %%a IN (*) DO IF "%%~nxa"=="%ARG%.cmd" SET P=%%~dpnxa

IF NOT DEFINED P (
	@ECHO.Script not found.
	ECHO ON
	@EXIT /B 1
)
ECHO.
ECHO.- START -[1;37m
TYPE "%P%"
ECHO.[0m
ECHO.- END -
ECHO ON
@EXIT /B 0