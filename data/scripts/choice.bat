SET "KEY="
::IF NOT "%1."=="." CALL :AUTOSKIP %1
FOR /F "DELIMS=" %%A IN ('XCOPY /W "!COMSPEC!" "!COMSPEC!" 2^>NUL') DO (
    IF NOT DEFINED KEY SET "KEY=%%A^!"
)
::TASKKILL /FI "WindowTitle eq %RND.AUTOSKIP%" /F >NUL
IF !KEY:~-1!==^^ (
    SET "KEY=^"
) ELSE SET "KEY=!KEY:~-2,1!"
IF NOT DEFINED KEY SET KEY=r
IF "!KEY!."==")." SET KEY=EXT_
SET ERRORLEVEL=!KEY!
IF EXIST LET.DEBUG ECHO.!KEY!>>LOG.txt
EXIT /B

:::AUTOSKIP
::SET RND.AUTOSKIP=AUTO-SKIP-%RANDOM%-%RANDOM%
::START "%RND.AUTOSKIP%" CMD /C TIMEOUT /T 15^&TASKKILL /IM "xcopy.exe" /F
::EXIT /B