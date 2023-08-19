@ECHO OFF
CHCP 437>NUL
IF NOT EXIST ".\data\logs\audManag" MD ".\data\logs\audManag"
2>>".\data\logs\audManag\fatal.log" (CALL :START)
EXIT 1
:START
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "TOKENS=3DELIMS=" %%I IN ('TASKLIST /FI "WINDOWTITLE eq AudioManager*"') DO (
	TASKKILL /F /FI "WINDOWTITLE eq wscript.exe" /T>NUL
	IF NOT "%%I"=="" SET STARTED=TRUE
)
IF NOT DEFINED STARTED EXIT /B 0
ENDLOCAL

TITLE AudioManager
SET "DATA=.\data"
SET "DATA_TMP=%DATA%\temp"
SET "DATA_SCRIPTS=%DATA%\scripts"
SET "DATA_TMP_A=%DATA_TMP%\TMP_AUDIO.vbs"
CALL "%DATA_SCRIPTS%\versions.cmd"
SET "HTS_DATA=%APPDATA%\HTS_DATA"
SET "MAIN_GAME=%HTS_DATA%\BATTLESOFBATCH-%VERTYPE%-%VERCODE%"
SET "DATA_SAVES=%MAIN_GAME%\SAVES"
SET "DATA_SETTINGS=%MAIN_GAME%\SETTINGS"
SET "LOGS=%DATA%\logs\audManag"
SET "LOG_WSCRIPT=%LOGS%\wscript.log"
SET "LOG_INFO=%LOGS%\info.log"
SET "INFO=ECHO.INFO - "
IF NOT EXIST "%LOGS%" MD "%LOGS%"
IF EXIST "%LOG_WSCRIPT%" IF EXIST "%LOG_WSCRIPT.OLD%" ( DEL /Q "%LOG_WSCRIPT.OLD%" ) ELSE REN "%LOG_WSCRIPT%" "old.wscript.log"
IF EXIST "%LOG_INFO%" IF EXIST "%LOG_INFO.OLD%" ( DEL /Q "%LOG_INFO.OLD%" ) ELSE REN "%LOG_INFO%" "old.info.log"
%INFO%Log Started: %TIME% >"%LOG_WSCRIPT%"
%INFO%Log Started: %TIME% >"%LOG_INFO%"
:START
IF EXIST "%DATA_SETTINGS%\settings.cmd" CALL "%SETTINGS.LOAD%"
IF %AUDIO.VALUE%==FALSE GOTO END

MODE CON:COLS=53 LINES=5
ECHO.[0m
ECHO.[31m^(!!^)  DO NOT close or click inside this window!  ^(!!^)[0m
ECHO.      [1;31mIf you accidentally did, press backspace.[0m
ECHO.[36m ^(?^)  Every wscript.exe task is an audio player  ^(?^) [0m

IF EXIST LET.DEBUG (
	TASKLIST /FI "IMAGENAME eq wscript.exe*" | FIND /I /N ":" >NUL && (
	ECHO.[1;30mINFO: No audio.[1A) || ECHO.INFO: Detected audio![1A
)

TIMEOUT /T 1 /NOBREAK>NUL

(
	TASKLIST /FI "WINDOWTITLE eq Battles Of Batch*" | FIND /I /N "cmd.exe" && GOTO START
	TASKLIST /FI "WINDOWTITLE eq Select Battles Of Batch*" | FIND /I /N "cmd.exe" && GOTO START
	TASKLIST /FI "WINDOWTITLE eq Battles Of Batch*" | FIND /I /N "cmd.exe" && GOTO START
	
	TASKLIST /FI "WINDOWTITLE eq Administrator:  Battles Of Batch*" | FIND /I /N "cmd.exe" && GOTO START
	TASKLIST /FI "WINDOWTITLE eq Administrator:  Select Battles Of Batch*" | FIND /I /N "cmd.exe" && GOTO START
	TASKLIST /FI "WINDOWTITLE eq Administrator:  Battles Of Batch*" | FIND /I /N "cmd.exe" && GOTO START

	TASKLIST /FI "WINDOWTITLE eq Battles Of Batch*" | FIND /I /N "WindowsTerminal.exe" && GOTO START
	TASKLIST /FI "WINDOWTITLE eq Select Battles Of Batch*" | FIND /I /N "WindowsTerminal.exe" && GOTO START
	TASKLIST /FI "WINDOWTITLE eq Battles Of Batch*" | FIND /I /N "WindowsTerminal.exe" && GOTO START
)>nul

:END
%ERRORLEVEL% >>"%LOG_INFO%"
%INFO%Exit Code %ERRORLEVEL% >>"%LOG_INFO%"
TASKKILL /F /FI "WINDOWTITLE eq wscript.exe*" /T>NUL
IF EXIST "%DATA_TMP_A%" DEL /Q "%DATA_TMP_A%"
EXIT