IF NOT DEFINED VERCODE EXIT
SET ARG=%*
IF DEFINED ARG SET TMP.ARG=%ARG:"=%
IF "%TMP.ARG%"=="START" (
	CALL :LAUNCH
	EXIT 0
)

IF DEFINED ARG (
	FOR /F "TOKENS=1-6DELIMS=;" %%1 IN ("%ARG:[and]=^&%") DO (
		SET %%1
		SET %%2
		SET %%3
		SET %%4
		SET %%5
		SET %%6
	)>NUL
)

(
ECHO.;https://github.com/Pizzabelly/EasyRP
ECHO.[Identifiers]
ECHO.ClientID=1150024331540312074
ECHO.[State]
IF /I "%State%"=="nul" (ECHO.State=᲼᲼) ELSE ECHO.State=%State%
IF /I "%Details%"=="nul" (ECHO.Details=᲼᲼) ELSE ECHO.Details=%Details%
ECHO.StartTimestamp=%StartTimestamp%
ECHO.EndTimestamp=%EndTimestamp%
ECHO.[Images]
ECHO.LargeImage=%LargeImage%
ECHO.LargeImageTooltip=%LargeImageTooltip%
ECHO.SmallImage=%SmallImage%
ECHO.SmallImageTooltip=%SmallImageTooltip%
) > "%CD%\data\scripts\rp\config.ini"
EXIT 0

:LAUNCH "config.ini"
TITLE RichManager
PUSHD "%CD%\data\scripts\rp"
@echo off
TASKLIST /FI "WINDOWTITLE eq RichManager - Live Update*" | find /i "cmd.exe" > nul
IF ERRORLEVEL 1 (
    IF EXIST "config.ini" START /MIN CMD /C "title RichManager - Live Update&ECHO.|call easyrp.exe&EXIT 0"
)
POPD
EXIT /B 0