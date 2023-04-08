@echo off

ECHO.Looking up '%1'...

setlocal enabledelayedexpansion

SET TARGET=%1

if not defined TARGET (
	echo.Exactly one argument is required.
	exit /b 0
)

(
set SERVER_NAME=
set SERVER_ADDRESS=
set DEVICE_NAME=
set DEVICE_ADDRESS=
set PING_DELAY=
set FIRST_DESTINATION=
set LAST_DESTINATION=
)
for /f "tokens=1,2" %%a in ('nslookup !TARGET!') do (
    if "%%a"=="Server:" set SERVER_NAME=%%b
    if "%%a"=="Address:" if defined SERVER_ADDRESS (set DEVICE_ADDRESS=%%b) else set SERVER_ADDRESS=%%b
    if "%%a"=="Name:" set DEVICE_NAME=%%b
)

if not defined TARGET (
	echo.Exactly one argument is required.
	exit /b 0
)

for /f "tokens=6 delims=,=" %%a in ('ping -n 1 !TARGET! ^| find "Average ="') do (
    set PING_DELAY=%%a
)

(
echo.
echo Host Name: !DEVICE_NAME!
echo Host Address: !DEVICE_ADDRESS!
echo Response Delay:!PING_DELAY:Average=!
)
endlocal

exit /b 0