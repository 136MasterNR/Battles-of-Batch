@ECHO OFF
::CHCP 437>NUL
IF EXIST "%*.ans" (
	FOR /F "DELIMS=" %%A IN (%*.ans) DO ECHO.%%A
) ELSE ECHO.ANSI with name "%*.ans" was not found.
CHCP 65001>NUL
@ECHO ON
