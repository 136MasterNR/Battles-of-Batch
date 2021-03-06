@ECHO OFF
IF NOT DEFINED VERCODE EXIT
SET ARG=%1
IF DEFINED ARG IF "%ARG%"=="MANUAL" GOTO MANUAL
CHCP 65001>NUL
SET "UPDATE.LOC=%DATA_TMP%\update.cmd"
SET "UPDZIP.LOC=%tmp%\update.zip"
SET "EXTRAC.LOC=%CD%"
CURL -S "https://htssoft.tk/get-update/battlesofbatch.bat" --SSL-NO-REVOKE >"./data/temp/update.cmd"
>NUL FIND /I "SET UPDATE.VER=" ".\data\temp\update.cmd" && (
	CALL "%UPDATE.LOC%"
	DEL /Q "%UPDATE.LOC%"
)||(
	FOR %%R IN ("%UPDATE.LOC%") DO IF %%~zR LSS 1 ( ECHO.UPDATER: Failed to check for updates because the information was empty.
	) ELSE ( ECHO.UPDATER: Failed to check for updates because the information was not recognized. )
	SET OUTOFDATE=UNRE
	IF EXIST "%UPDATE.LOC%" DEL /Q "%UPDATE.LOC%"
	GOTO :EOF
)
IF %UPDATE.VER%==%VERCODE% (
	IF EXIST "%UPDATE.LOC%" DEL /Q "%UPDATE.LOC%"
	GOTO :EOF
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
		ECHO.
		ECHO.
		ECHO.WARNING!
		ECHO.Your saves and settings on this game will be erased after this update.
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
IF ERRORLEVEL 14 GOTO :EOF
IF ERRORLEVEL 0 GOTO REPEAT
GOTO :EOF
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
GOTO :EOF
:MANUAL
CLS
@SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
@ECHO OFF
SET STATE=OFFLINE
FOR /f "tokens=5,6,7" %%a IN ('PING -n 1 1.0.0.1') do (
	IF "x%%b"=="xunreachable." ECHO.No internet connection.&PAUSE>NUL&GOTO :EOF
    IF "x%%a"=="xReceived" IF "x%%c"=="x1," (ECHO.YOU: ONLINE) ELSE ECHO.Something went wrong.
)
SET STATE=OFFLINE
FOR /f "tokens=5,6,7" %%a IN ('PING -n 1 www.github.com') do (
    IF NOT "x%%b"=="xunreachable." IF "x%%a"=="xReceived" IF "x%%c"=="x1," SET STATE=ACTIVE
)
ECHO.HOST: !STATE!
SET STATE=OFFLINE
FOR /f "tokens=5,6,7" %%a IN ('PING -n 1 htssoft.tk') do (
    IF NOT "x%%b"=="xunreachable." IF "x%%a"=="xReceived" IF "x%%c"=="x1," SET STATE=ACTIVE
)
ECHO.SERVICE: !STATE!
ENDLOCAL
PAUSE>NUL
GOTO :EOF