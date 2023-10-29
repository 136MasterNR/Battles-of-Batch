@echo off
set cnt=1

:label

set /a result=(%cnt% * 3) / %1
echo.(%cnt% * 3) / %1 = %result%

set /a cnt+=1
if %cnt% lss 100 goto label

echo on
@exit /b 0