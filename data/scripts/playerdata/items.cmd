@IF NOT DEFINED VERCODE EXIT
IF NOT EXIST "%PLAYERDATA.ITEMS%" ECHO.>"%PLAYERDATA.ITEMS%"
GOTO %1 %2 %3

:REGISTER
SET TMP.NAME=
FOR /F "DELIMS=" %%A IN ('TYPE "%DATA_SCRIPTS%\list\items.txt"') DO (
	CALL :REGISTER_ALT %%A
)
EXIT /B 0
:REGISTER_ALT
SET TMP.LIST=%1
FOR /F "tokens=1*DELIMS=;" %%1 IN ("%TMP.LIST:$= %") DO (
	CALL :REGISTER_ALT_O %%1 %%2 %%3 %%4 %%5 %%6 %%7 %%8 %%9 %%10 %%11 %%12 %%13 %%14 %%15 %%16 %%17 %%18
)
EXIT /B 0
:REGISTER_ALT_O
SET TMP.NAME=%1
SET I.%TMP.NAME%.TYPE=%2
SET I.%TMP.NAME%.DMG=%3
SET I.%TMP.NAME%.DESC.1=%4
SET I.%TMP.NAME%.DESC.2=%5
SET I.%TMP.NAME%.DESC.3=%6
SET I.%TMP.NAME%.HIST.1=%7
SET I.%TMP.NAME%.HIST.2=%8
SET I.%TMP.NAME%.HIST.3=%9
SHIFT
SET I.%TMP.NAME%.HIST.4=%9
EXIT /B 0

:SEARCH
FOR /F "delims=" %%A IN ('FINDSTR %2 %PLAYERDATA.ITEMS%') DO SET TEXT=%%A
SET ITEM.IS=0
FOR /F "tokens=*" %%A IN ('TYPE "%PLAYERDATA.ITEMS%"') DO (
	IF %%A==%2 (
		SET ITEM.IS=1
	)
)
EXIT /B %ITEM.IS%

:LIST
FOR /F "DELIMS==" %%A IN ('SET ITEM.REG_') DO (
	SET %%A=
)
SET CNT=0
FOR /F %%A IN ('TYPE "%PLAYERDATA.ITEMS%"') DO (
	CALL :LIST_REG %%A
)
IF NOT DEFINED ITEM.REG_CNT SET ITEM.REG_CNT=0
EXIT /B 0
:LIST_REG
SET /A CNT+=1
SET VAR.IS=%1
FOR /F "tokens=1*" %%1 IN ("%VAR.IS:$= %") DO (
	SET LIST_NAME=%%1
	SET LIST_LVL=%%2
)
SET ITEM.REG_NAME.%CNT%=%LIST_NAME%
SET ITEM.REG_LVL.%CNT%=%LIST_LVL%
SET ITEM.REG_CNT=%CNT%
EXIT /B 0

:MATERIALS
FOR /F "DELIMS==" %%A IN ('SET MAT.REG_') DO (
	SET %%A=
)
SET CNT=0
FOR /F %%A IN ('TYPE "%PLAYERDATA.MATERIALS%"') DO (
	CALL :MATERIALS_REG %%A
)
IF NOT DEFINED MAT.REG_CNT SET MAT.REG_CNT=0
EXIT /B 0
:MATERIALS_REG
SET /A CNT+=1
SET VAR.IS=%1
FOR /F "tokens=1*" %%1 IN ("%VAR.IS:$= %") DO (
	SET MAT_NAME=%%1
	SET MAT_X=%%2
)
SET MAT.REG_NAME.%CNT%=%MAT_NAME%
SET MAT.REG_X.%CNT%=%MAT_X%
SET MAT.REG_CNT=%CNT%
EXIT /B 0

:WEAPONS
SET WIELDING.WEAPON=
FOR /F "DELIMS==" %%A IN ('SET WEAPONS.REG_') DO (
	SET %%A=
)
SET CNT=0
FOR /F %%A IN ('TYPE "%PLAYERDATA.WEAPONS%"') DO (
	CALL :WEAPONS_REG %%A
)
IF NOT DEFINED WEAPONS.REG_CNT SET WEAPONS.REG_CNT=0
EXIT /B 0
:WEAPONS_REG
SET /A CNT+=1
SET VAR.IS=%1
FOR /F "tokens=1,2,3" %%1 IN ("%VAR.IS:$= %") DO (
	SET UI.POS_%CNT%_W=%%1
	SET LIST_NAME=%%1
	SET LIST_LVL=%%2
	SET IS.WEAPON=%%3
	IF %%3 EQU 1 SET WIELDING.WEAPON=%CNT%
)
SET WEAPONS.REG_NAME.%CNT%=%LIST_NAME%
SET WEAPONS.REG_LVL.%CNT%=%LIST_LVL%
SET WEAPONS.REG_CNT=%CNT%
EXIT /B 0

:LIST_EQ
SET CNT=0
FOR /F %%A IN (%PLAYERDATA.EQ%) DO (
	CALL :CNT
	IF NOT %%A==EMPTY CALL :LIST_EQ_C %%A %CNT%
	CALL :LIST_EQ_ %%A
)
EXIT /B 0
:LIST_EQ_
SET VAR.IS=%1
FOR /F "tokens=1*" %%1 IN ("%VAR.IS:$= %") DO (
	SET LIST_NAME=%%1
	SET LIST_LVL=%%2
)
SET ITEM.EQ_NAME.%CNT%=%LIST_NAME%
SET ITEM.EQ_LVL.%CNT%=%LIST_LVL%
SET ITEM.EQ_CNT=%CNT%
EXIT /B 0
:LIST_EQ_C
SETLOCAL ENABLEDELAYEDEXPANSION
IF NOT !ITEM.REG_NAME.%CNT%!.==. EXIT /B 0
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%PLAYERDATA.EQ%"') DO (
	SET "Line=%%b"
	IF %%a EQU %CNT% SET "Line=EMPTY"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!Line!
	ENDLOCAL
))>"%PLAYERDATA.EQ%.new"
MOVE "%PLAYERDATA.EQ%.new" "%PLAYERDATA.EQ%">NUL
ENDLOCAL
EXIT /B 0

:CNT
SET /A CNT+=1
EXIT /B 0

:EQUIP
SETLOCAL ENABLEDELAYEDEXPANSION
IF !ITEM.REG_NAME.%3!.==. EXIT /B 1
FOR /f "delims=" %%A IN ('FINDSTR %2 %PLAYERDATA.ITEMS%') DO SET TEXT=%%A
REM FOR /F "tokens=*" %%A IN (%PLAYERDATA.EQ%) DO (
	REM IF %%A==%3 (
		REM EXIT /B 2
	REM )
REM )
CALL :REPLACE %3
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%PLAYERDATA.EQ%"') DO (
	SET "Line=%%b"
	IF %%a EQU %2 SET "Line=%3"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!Line!
	ENDLOCAL
))>"%PLAYERDATA.EQ%.new"
MOVE "%PLAYERDATA.EQ%.new" "%PLAYERDATA.EQ%">NUL
ENDLOCAL
EXIT /B 0

:EQUIP_W
SETLOCAL ENABLEDELAYEDEXPANSION
SET CNT.FIND_W=0
SET TMP.W_EQUIP=
::IF !ITEM.REG_NAME.%3!.==. EXIT /B 1
::FOR /f "delims=" %%A IN ('FINDSTR %2 %PLAYERDATA.ITEMS%') DO SET TEXT=%%A
FOR /F "tokens=*" %%A IN ('TYPE "%PLAYERDATA.WEAPONS%"') DO (
	CALL :EQUIP_W_FIND %%A %2
)
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%PLAYERDATA.WEAPONS%"') DO (
	SET "Line=%%b"
	IF %%a EQU %CNT.FIND_W.FINAL% SET "Line=%CNT.FIND_W.NAME%0"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!Line!
	ENDLOCAL
))>"%PLAYERDATA.WEAPONS%.new"
MOVE "%PLAYERDATA.WEAPONS%.new" "%PLAYERDATA.WEAPONS%">NUL
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%PLAYERDATA.WEAPONS%"') DO (
	SET "Line=%%b"
	IF %%a EQU %2 SET "Line=%TMP.W_EQUIP:~0,-1%1"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!Line!
	ENDLOCAL
))>"%PLAYERDATA.WEAPONS%.new"
MOVE "%PLAYERDATA.WEAPONS%.new" "%PLAYERDATA.WEAPONS%">NUL
ENDLOCAL
EXIT /B 0
:EQUIP_W_FIND
SET /A CNT.FIND_W+=1
SET TMP.W_REMOVE=%1
IF %CNT.FIND_W%==%2 (
	FOR /F "tokens=*" %%A IN ("%TMP.W_REMOVE%") DO SET TMP.W_EQUIP=%%A
)
IF %TMP.W_REMOVE:~-1%==1 (
	IF NOT DEFINED CNT.FIND_W.FINAL SET CNT.FIND_W.FINAL=%CNT.FIND_W%
	SET CNT.FIND_W.NAME=%TMP.W_REMOVE:~0,-1%
	EXIT /B 0
) ELSE EXIT /B 0
:UNEQUIP_W
SETLOCAL ENABLEDELAYEDEXPANSION
SET CNT.FIND_W=0
SET TMP.W_EQUIP=
::IF !ITEM.REG_NAME.%3!.==. EXIT /B 1
::FOR /f "delims=" %%A IN ('FINDSTR %2 %PLAYERDATA.ITEMS%') DO SET TEXT=%%A
FOR /F "tokens=*" %%A IN ('TYPE "%PLAYERDATA.WEAPONS%"') DO (
	CALL :EQUIP_W_FIND %%A %2
)
(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%PLAYERDATA.WEAPONS%"') DO (
	SET "Line=%%b"
	IF %%a EQU %CNT.FIND_W.FINAL% SET "Line=%CNT.FIND_W.NAME%0"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!Line!
	ENDLOCAL
))>"%PLAYERDATA.WEAPONS%.new"
MOVE "%PLAYERDATA.WEAPONS%.new" "%PLAYERDATA.WEAPONS%">NUL
ENDLOCAL
EXIT /B 0

:REPLACE
SET FOUND=FALSE
SET COUNT=0
FOR /F "tokens=*" %%A IN (%PLAYERDATA.EQ%) DO (
	SET /A COUNT+=1
	IF %%A==%1 (
		SET FOUND=TRUE
		CALL :FINAL-COUNT
	)
)

IF %FOUND%==FALSE ( EXIT /B 0 )

(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%PLAYERDATA.EQ%"') DO (
	SET "Line=%%b"
	IF %%a EQU %FINAL.COUNT% SET "Line=EMPTY"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!Line!
	ENDLOCAL
))>"%PLAYERDATA.EQ%.new"
MOVE "%PLAYERDATA.EQ%.new" "%PLAYERDATA.EQ%">NUL
EXIT /B 0

:FINAL-COUNT
SET FINAL.COUNT=%COUNT%
EXIT /B 0

:REPLACE-MAT
SET FOUND=FALSE
SET COUNT=0

SETLOCAL ENABLEDELAYEDEXPANSION
SET FILE=!PLAYERDATA.%4!
ENDLOCAL&SET TMP.FILE=%FILE%

FOR /F "tokens=*" %%A IN (%TMP.FILE%) DO (
	CALL :REPLACE-MAT_A %%A %2
)

IF %FOUND%==FALSE ( EXIT /B 60 )

SET /A TMP.R_AMOUNT.PLUS=%TMP.R_AMOUNT%+%3

IF %4==WEAPONS SET TMP.R_AMOUNT.PLUS=%TMP.R_AMOUNT.PLUS%$0

(FOR /f "tokens=1*delims=:" %%a IN ('findstr /n "^" "%TMP.FILE%"') DO (
	SET "Line=%%b"
	IF %%a EQU %FINAL.COUNT% SET "Line=%TMP.R_NAME%$%TMP.R_AMOUNT.PLUS%"
	SETLOCAL ENABLEDELAYEDEXPANSION
	ECHO(!Line!
	ENDLOCAL
))>"%TMP.FILE%.new"
MOVE "%TMP.FILE%.new" "%TMP.FILE%">NUL
EXIT /B 0
:REPLACE-MAT_A
SET /A COUNT+=1
IF %FOUND%==FALSE CALL :REPLACE-MAT_B %1 %2
EXIT /B 0
:REPLACE-MAT_B
SET TMP=%1
FOR /F "TOKENS=1,2*" %%A IN ("%TMP:$= %") DO (
	SET TMP.R_NAME=%%A
	SET TMP.R_AMOUNT=%%B
	IF %%A==%2 (
		SET FOUND=TRUE
		CALL :FINAL-COUNT
	)
)
EXIT /B 0

:ADD
ECHO.%1ed %3 lvl:%4 in %2
SET "ARG=%2"
SET "ARG0=%3"
SET "ARG1=%4"
@IF NOT DEFINED ARG (
	@ECHO.[38;5;196mError[0m: Missing arguement.
	EXIT /B 1
)
@IF NOT DEFINED ARG0 (
	@ECHO.[38;5;196mError[0m: Missing arguement.
	EXIT /B 1
)
@IF NOT DEFINED ARG1 (
	@ECHO.[38;5;196mError[0m: Missing arguement.
	EXIT /B 1
)
@IF /I "%ARG%"=="WEAPONS" (
	@ECHO.%3$%4$0>>"%PLAYERDATA.WEAPONS%"
	EXIT /B 0
)
@IF /I "%ARG%"=="ITEMS" (
	@ECHO.%3$%4>>"%PLAYERDATA.ITEMS%"
) ELSE @ECHO.[38;5;196mInvalid arguement[0m: The requested destination is invalid.
@EXIT /B 0