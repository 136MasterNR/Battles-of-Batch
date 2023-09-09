@ECHO OFF
IF NOT DEFINED VERCODE EXIT
SET ARG=%1
CHCP 65001>NUL
SET "UPDATE.LOC=%DATA_TMP%\update.cmd"
SET "UPDZIP.LOC=%tmp%\update.zip"
SET "EXTRAC.LOC=%CD%"
CURL -S "https://136masternr.github.io/HTS-Studios/get-update/battlesofbatch.bat" --SSL-NO-REVOKE >"./data/temp/update.cmd"
>NUL FIND /I "SET UPDATE.VER=" ".\data\temp\update.cmd" && (
	CALL "%UPDATE.LOC%"
	DEL /Q "%UPDATE.LOC%"
)||(
	FOR %%R IN ("%UPDATE.LOC%") DO IF %%~zR LSS 1 ( ECHO.UPDATER: Failed to check for updates because the information was empty.
	) ELSE ( ECHO.UPDATER: Failed to check for updates because the information was not recognized. )
	IF EXIST "%UPDATE.LOC%" DEL /Q "%UPDATE.LOC%"
	EXIT /B 0
)
IF DEFINED ARG IF "%ARG%"=="MANUAL" GOTO MANUAL
IF %UPDATE.VER% LEQ %VERCODE% (
	IF EXIST "%UPDATE.LOC%" DEL /Q "%UPDATE.LOC%"
	EXIT /B 0
)
IF EXIST "updatenow.info" GOTO INSTANT_UPDATE
:REPEAT
CLS
ECHO.You are not running the latest version of the game.
ECHO.Would you like to update right now?
ECHO.
ECHO.Current v%VERCODE%
ECHO.New     v%UPDATE.VER%
ECHO.
ECHO.Changelog: %CHANGELOG.URL%
ECHO.
CHOICE /N /C:ABCDEFGHIJKLMNOPQRSTUVWXYZ /M "Press Y or N: "%1
IF ERRORLEVEL 26 GOTO REPEAT
IF ERRORLEVEL 25 (
	IF EXIST "%tmp%\%~nx0" DEL /F /Q "%tmp%\%~nx0"
	ECHO F|XCOPY /S /Q /Y "%~0" "%tmp%\%~nx0"
	IF %RESET.DATA%==TRUE ( 
		CLS
		ECHO.WARNING!
		ECHO.Your saves and settings will not be kept after this update.
		ECHO.This might be so because there is a major update on the saving system.
		ECHO.Do you still wish to continue?
		ECHO.
		ECHO.Press anything to continue or restart the game and disable the updates.
		PAUSE>NUL
	) ELSE ECHO D|XCOPY /S "%MAIN_GAME%" "%HTS_DATA%\BATTLESOFBATCH-%VERTYPE%-%UPDATE.VER%\"
	ECHO.>"updatenow.info"
	START "BATTLESOFBATCH_UPDATE" "%tmp%\%~nx0" /I
	EXIT
)
IF ERRORLEVEL 15 GOTO REPEAT
IF ERRORLEVEL 14 EXIT /B 0
IF ERRORLEVEL 0 GOTO REPEAT
EXIT /B 0
:UNZIPFILE <ExtractTo> <ZipLocation>
SET VBS="%TMP%\_.VBS"
IF EXIST "%VBS%" DEL /F /Q "%VBS%"
>%VBS% ECHO Set fso = CreateObject("Scripting.FileSystemObject")
>>%VBS% ECHO If NOT fso.FolderExists(%1) Then
>>%VBS% ECHO fso.CreateFolder(%1)
>>%VBS% ECHO End If
>>%VBS% ECHO set objShell = CreateObject("Shell.Application")
>>%VBS% ECHO set FilesInZip=objShell.NameSpace(%2).items
>>%VBS% ECHO objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%VBS% ECHO Set fso = Nothing
>>%VBS% ECHO Set objShell = Nothing
CSCRIPT //NOLOGO "%VBS%"
ECHO.Cleaning up ...
IF EXIST "%VBS%" DEL /F /Q "%VBS%"
IF EXIST "%UPDZIP.LOC%" DEL /F /Q "%UPDZIP.LOC%"
ENDLOCAL
ECHO.Update seems to be successful.
ECHO.Press any key to clean up temp files ^& exit.
PAUSE>NUL
DEL /F /Q "%tmp%\%~nx0"&&EXIT
:INSTANT_UPDATE
IF EXIST "updatenow.info" ( DEL /Q "updatenow.info" ) ELSE EXIT
CLS
TITLE UPDATING ...
ECHO.- Please wait -
ECHO.
ECHO. Downloading update ...
CURL -S "%UPDATE.URL%" --SSL-NO-REVOKE >"%UPDZIP.LOC%"
ECHO. Replacing new files ...
SETLOCAL
CALL :UNZIPFILE "%EXTRAC.LOC%" "%UPDZIP.LOC%"
EXIT /B 0
:MANUAL
CLS
@SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
@ECHO OFF
ECHO.{ CONNECTION }
SET STATE=OFFLINE
FOR /f "tokens=5,6,7" %%a IN ('PING -n 1 1.0.0.1') do (
	IF "x%%b"=="xunreachable." CLS&ECHO.No internet connection.&PAUSE>NUL&EXIT /B 0
    IF "x%%a"=="xReceived" IF "x%%c"=="x1," (ECHO.YOU: ONLINE) ELSE ECHO.Something went wrong.
)
SET STATE=OFFLINE
FOR /f "tokens=5,6,7" %%a IN ('PING -n 1 www.github.com') do (
    IF NOT "x%%b"=="xunreachable." IF "x%%a"=="xReceived" IF "x%%c"=="x1," SET STATE=ACTIVE
)
ECHO.HOST: !STATE!
SET STATE=OFFLINE
FOR /f "tokens=5,6,7" %%a IN ('PING -n 1 136masternr.github.io') do (
    IF NOT "x%%b"=="xunreachable." IF "x%%a"=="xReceived" IF "x%%c"=="x1," SET STATE=ACTIVE
)
ECHO.SERVICE: !STATE!
ECHO.
ECHO.{ INSTALLED }
ECHO.GAME: %VERS%, %VERTYPE% ^(%VERCODE%^)
ECHO.AUDIO MANAGER: %VERCOD.AUDIO_MANAGER%
ECHO.
ECHO.{ COMPARE }
ECHO.Current v%VERCODE%
ECHO.Latest  v%UPDATE.VER%
ENDLOCAL
ECHO.
ECHO.Press any key to return...
PAUSE>NUL
EXIT /B 0
