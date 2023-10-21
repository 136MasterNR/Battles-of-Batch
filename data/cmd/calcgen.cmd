@echo off
set cnt=1

:label

set /a result=%1*%cnt%
echo.%1 * %cnt% = %result%

set /a cnt+=1
if %cnt% lss 100 goto label

echo on
@exit /b 0