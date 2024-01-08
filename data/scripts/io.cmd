IF NOT DEFINED VERCODE EXIT
GOTO :%*




:APPEND <"Path": String> <"Line/Position": Integer> <"Name": String> <"Value": String>
SHIFT
SETLOCAL ENABLEDELAYEDEXPANSION
:: Re-assign Arguments
SET FILE_PATH=%1
SET LINE_POS=%2
SET VAR_NAME=%3
SET VAR_VALUE=%4

SET FILE_PATH=%FILE_PATH:"=%

IF NOT EXIST "!FILE_PATH!" (
	>&2 ECHO.I/O APPEND ERR: File doesn't exist.
	EXIT /B 1
)

IF NOT DEFINED VAR_NAME (
	>&2 ECHO.I/O APPEND ERR: Not enough arguments provided.
	EXIT /B 1
)

:: Clear
IF EXIST "!FILE_PATH!.tmp" DEL /Q "!FILE_PATH!.tmp"
SET CNT=0
SET SUCCESS=0

:: Write
IF !LINE_POS! EQU -1 (
	%= Write at the end of the file =%
	>>"!FILE_PATH!" ECHO.!VAR_NAME!=!VAR_VALUE!
	SET SUCCESS=1
) ELSE FOR /F "usebackq" %%A IN ('!FILE_PATH!') DO IF %%~zA EQU 0 (
	%= If file is empty, write as new file =%
    >"!FILE_PATH!" ECHO.!VAR_NAME!=!VAR_VALUE!
) ELSE (
	%= Otherwise, write to specific position =%
	FOR /F "DELIMS=" %%T IN ('TYPE "!FILE_PATH!"') DO (
		IF !CNT! EQU !LINE_POS! (
			%= If line is found, append the new item to that position... =%
			>>"!FILE_PATH!.tmp" ECHO.!VAR_NAME!=!VAR_VALUE!
			%= ...and after it the item previously positioned there =%
			>>"!FILE_PATH!.tmp" ECHO.%%T
			SET SUCCESS=1
		) ELSE (
			%= If position didn't match, write the existing contents of the file =%
			>>"!FILE_PATH!.tmp" ECHO.%%T
		)
		SET /A CNT+=1
	)
)
%= If nothing was written, write at the end =%
IF !SUCCESS! EQU 0 >>"!FILE_PATH!.tmp" ECHO.!VAR_NAME!=!VAR_VALUE!

:: Replace the old file with the new file.
IF EXIST "!FILE_PATH!.tmp" MOVE /Y "!FILE_PATH!.tmp" "!FILE_PATH!" 1>NUL

ENDLOCAL
EXIT /B 0




:REPLACE <"Path": String> <"Name": String> <"Asign Variable": String>
SHIFT
SETLOCAL ENABLEDELAYEDEXPANSION
:: Re-assign Arguments
SET FILE_PATH=%1
SET VAR_NAME=%2
SET VAR_VALUE=%3

SET FILE_PATH=%FILE_PATH:"=%

IF NOT EXIST "!FILE_PATH!" (
	>&2 ECHO.I/O REPLACE ERR: File doesn't exist.
	EXIT /B 1
)

IF NOT DEFINED VAR_NAME (
	>&2 ECHO.I/O REPLACE ERR: Not enough arguments provided.
	EXIT /B 1
)

:: Clear
IF EXIST "!FILE_PATH!.tmp" DEL /Q "!FILE_PATH!.tmp"
SET SUCCESS=0

:: Write
FOR /F "TOKENS=1,*DELIMS==" %%1 IN ('TYPE "!FILE_PATH!"') DO (
	IF !VAR_NAME!==%%1 (
		>>"!FILE_PATH!.tmp" ECHO.%%1=!VAR_VALUE!
		SET SUCCESS=1
	) ELSE (
		ECHO.%%1=%%2>>"!FILE_PATH!.tmp"
	)
)

IF !SUCCESS! EQU 0 (
	IF EXIST "!FILE_PATH!.tmp" DEL /Q "!FILE_PATH!.tmp"
	EXIT /B 2
)

IF EXIST "!FILE_PATH!.tmp" MOVE /Y "!FILE_PATH!.tmp" "!FILE_PATH!" 1>NUL

ENDLOCAL
EXIT /B 0




:UPDATE <"Path": String>
SHIFT
SETLOCAL ENABLEDELAYEDEXPANSION

SET FILE_PATH=%1

SET FILE_PATH=!FILE_PATH:"=!

IF NOT EXIST "%1" (
	>&2 ECHO.I/O UPDATE ERR: File doesn't exist.
	EXIT /B 1
)

:: Clear
IF EXIST "!FILE_PATH!.tmp" DEL /Q "!FILE_PATH!.tmp"

:: Write
FOR /F "TOKENS=1DELIMS==" %%1 IN ('TYPE "!FILE_PATH!"') DO (
	ECHO.%%1=!%%1!>>"!FILE_PATH!.tmp"
)

IF EXIST "!FILE_PATH!.tmp" MOVE /Y "!FILE_PATH!.tmp" "!FILE_PATH!" 1>NUL

ENDLOCAL
EXIT /B 0




:REFRESH <"Path": String> <"Array Name": String>
SHIFT
SETLOCAL ENABLEDELAYEDEXPANSION

SET FILE_PATH=%1

SET FILE_PATH=!FILE_PATH:"=!

IF EXIST "!FILE_PATH!.tmp" DEL /Q "!FILE_PATH!.tmp"

FOR /F "TOKENS=2,*DELIMS=.=" %%1 IN ('SET %2') DO (
	>>"%DATA_SAVES%\QUESTS.tmp" ECHO.%%1=%%2
)

IF EXIST "!FILE_PATH!.tmp" MOVE /Y "!FILE_PATH!.tmp" "!FILE_PATH!" 1>NUL

ENDLOCAL
EXIT /B 0




:READ <"Path": String> ["Array Name": String]
SHIFT
SET FILE_PATH=%1
SET FILE_PATH=%FILE_PATH:"=%

FOR /F "TOKENS=1,*DELIMS==" %%1 IN ('TYPE "%FILE_PATH%"') DO SET %2%%1=%%2
EXIT /B 0




:INI <"Path": String>  <"Category": String>
SHIFT
SET SWITCH=0

SET TMP.POS=0

FOR /F "TOKENS=1DELIMS=:" %%A IN ('FINDSTR /N /I /C:"[%2]" %1') DO (
    SET /A TMP.POS=%%A
)

IF %TMP.POS% EQU 0 EXIT /B 1

FOR /F "SKIP=%TMP.POS%TOKENS=1,*DELIMS=" %%1 IN ('TYPE %1') DO (
	CALL :INI_PROC %2 %%1 %%2 || EXIT /B 0
)

EXIT /B 0
:INI_PROC
SET TMP.LINE=%2
SET TMP.TEXT=%3
IF DEFINED TMP.TEXT SET TMP.TEXT=%TMP.TEXT:"=%
IF "%TMP.LINE:~0,1%"=="[" EXIT /B 1
SET INI_%2=%TMP.TEXT%
EXIT /B 0
