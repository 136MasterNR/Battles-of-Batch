IF NOT DEFINED VERCODE EXIT
CALL :%*
EXIT /B %ERRORLEVEL%




:append <"Path": Quoted String> <"Line/Position": Integer> <"Name": String> <"Value": Variable>
SETLOCAL ENABLEDELAYEDEXPANSION
:: Re-assign Arguments
SET FILE_PATH=%1
SET LINE_POS=%2
SET VAR_NAME=%3
SET VAR_VALUE=%4

IF NOT DEFINED VAR_VALUE (
	ECHO.Not enough arguments provided.
	EXIT /B 0
)

:: Clear
IF EXIST "!FILE_PATH!.tmp" DEL /Q "!FILE_PATH!.tmp"
SET CNT=0
SET SUCCESS=0

:: Write
IF !LINE_POS! EQU -1 (
	%= Write at the end of the file =%
	ECHO.!VAR_NAME!=!VAR_VALUE!>>"!FILE_PATH!
	SET SUCCESS=1
) ELSE FOR /F "usebackq" %%A IN ('!FILE_PATH!') DO IF %%~zA EQU 0 (
	%= If file is empty, write as new file =%
    ECHO.!VAR_NAME!=!VAR_VALUE!>"!FILE_PATH!"
) ELSE (
	%= Otherwise, write to specific position =%
	FOR /F "DELIMS=" %%T IN ('TYPE "!FILE_PATH!"') DO (
		IF !CNT! EQU !LINE_POS! (
			%= If line is found, append the new item to that position... =%
			ECHO.!VAR_NAME!=!VAR_VALUE!>>"!FILE_PATH!.tmp"
			%= ...and after it the item previously positioned there =%
			ECHO.%%T>>"!FILE_PATH!.tmp"
			SET SUCCESS=1
		) ELSE (
			%= If position didn't match, write the existing contents of the file =%
			ECHO.%%T>>"!FILE_PATH!.tmp"
		)
		SET /A CNT+=1
	)
)
%= If nothing was written, write at the end =%
IF !SUCCESS! EQU 0 ECHO.!VAR_NAME!=!VAR_VALUE!>>"!FILE_PATH!.tmp"

:: Replace the old file with the new file.
IF EXIST "!FILE_PATH!.tmp" MOVE /Y "!FILE_PATH!.tmp" "!FILE_PATH!" 1>NUL

ENDLOCAL
EXIT /B 0




:replace <"Path": Quoted String> <"Name": String> <"Asign Variable": String>
SETLOCAL ENABLEDELAYEDEXPANSION
:: Re-assign Arguments
SET FILE_PATH=%1
SET VAR_NAME=%2
SET VAR_VALUE=%3

:: Clear
SET SUCCESS=0

FOR /F "TOKENS=1,*DELIMS==" %%1 IN ('TYPE "!FILE_PATH!"') DO (
	IF !VAR_NAME!==%%1 (
		ECHO.%%1=!VAR_VALUE!>>"!FILE_PATH!.tmp"
		SET SUCCESS=1
	) ELSE (
		ECHO.%%1=%%2>>"!FILE_PATH!.tmp"
	)
)

IF !SUCCESS! EQU 0 EXIT /B 2

IF EXIST "!FILE_PATH!.tmp" MOVE /Y "!FILE_PATH!.tmp" "!FILE_PATH!" 1>NUL

ENDLOCAL
EXIT /B 0




:read <"Path": Quoted String>
FOR /F "TOKENS=1,*DELIMS==" %%1 IN ('TYPE "%1"') DO SET %%1=%%2
EXIT /B 0
