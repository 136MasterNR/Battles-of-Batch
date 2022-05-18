@ECHO OFF
CHCP 437>NUL
2>>".\data\logs\audManag\fatal.log" (SET "STARTED=1"&CALL :VAR)
@IF /I DEFINED STARTED ( 2>NUL ) ELSE ( EXIT /B )
:VAR
TITLE AudioManagerHTS
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
SET "LOG_ERROR=%LOGS%\error.log"
SET "LOG_WSCRIPT=%LOGS%\wscript.log"
SET "LOG_INFO=%LOGS%\info.log"
SET "LOG_ERROR.OLD=%LOGS%\old.error.log"
SET "LOG_WSCRIPT.OLD=%LOGS%\old.wscript.old.log"
SET "LOG_INFO.OLD=%LOGS%\old.info.log"
SET "INFO=ECHO.INFO - "
IF NOT EXIST "%LOGS%" MD "%LOGS%"
IF EXIST "%LOG_WSCRIPT%" IF EXIST "%LOG_WSCRIPT.OLD%" ( DEL /Q "%LOG_WSCRIPT.OLD%" ) ELSE REN "%LOG_WSCRIPT%" "old.wscript.log"
IF EXIST "%LOG_INFO%" IF EXIST "%LOG_INFO.OLD%" ( DEL /Q "%LOG_INFO.OLD%" ) ELSE REN "%LOG_INFO%" "old.info.log"
%INFO%Log Started: %TIME% >"%LOG_WSCRIPT%"
%INFO%Log Started: %TIME% >"%LOG_INFO%"
%INFO%Log Started: %TIME% >>"%LOG_ERROR%"
:START
IF EXIST "%DATA_SETTINGS%\settings.cmd" CALL "%SETTINGS.LOAD%"
IF %AUDIO.VALUE%==FALSE GOTO END-CONFIRM
IF EXIST "%APPDATA%\HTS_DATA\BATTLESOFBATCH-%GVER%\SETTINGS\OFFSOUNDS.dll" EXIT
MODE CON:COLS=58 LINES=6
TASKLIST /FI "IMAGENAME eq wscript.exe" >>"%LOG_WSCRIPT%" 2>NUL | FIND /I /N "wscript.exe"
IF /I "%ERRORLEVEL%"=="0" ( ECHO.[1;30mINFO: Detected audio! ) ELSE ( ECHO.[1;30mINFO: No audio. )
ECHO.[0m
ECHO.[31m^(!!^)    DO NOT close or click inside this window!    ^(!!^)[0m
ECHO.        [1;31mIf you accidentally did, press backspace.
TIMEOUT /T 1 /NOBREAK>NUL
2>>".\data\logs\errors.txt" ( SET "STARTED=1"&CALL :STARTUP-COMPLETE )
@IF /I DEFINED STARTED ( 2>NUL ) ELSE ( EXIT /B )
TASKLIST /FI "WINDOWTITLE eq Battles of Batch -*" 2>NUL |FINDSTR /B /C:"INFO: No tasks are running">NUL && (TASKLIST /FI "WINDOWTITLE eq Select Battles of Batch -*" 2>NUL |FINDSTR /B /C:"INFO: No tasks are running">NUL && (GOTO END) || (GOTO START))
GOTO START
:END
TIMEOUT /T 1 >NUL
TASKLIST /FI "WINDOWTITLE eq Battles of Batch -*" 2>NUL |FINDSTR /B /C:"INFO: No tasks are running">NUL && (TASKLIST /FI "WINDOWTITLE eq Select Battles of Batch -*" 2>NUL |FINDSTR /B /C:"INFO: No tasks are running">NUL && (GOTO END-CONFIRM) || (GOTO START))
:END-CONFIRM
%INFO%Exit Code %ERRORLEVEL% >>"%LOG_INFO%"
%INFO%Exit Code %ERRORLEVEL% >>"%LOG_ERROR%"
TASKKILL /F /FI "WINDOWTITLE eq wscript.exe*" /T>NUL
IF EXIST "%DATA_TMP_A%" DEL /Q "%DATA_TMP_A%"
EXIT