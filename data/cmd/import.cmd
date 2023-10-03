@ECHO OFF
::CHCP 437>NUL
IF EXIST "%*.ans" (TYPE %*.ans)ELSE ECHO.ANSI with name "%*.ans" was not found.
CHCP 65001>NUL
@ECHO ON
