IF NOT DEFINED VERCODE EXIT
SET ARGS=%*
SET ARGS=%ARGS: =_%
SET ARGS=%ARGS::= %
SET TMP.ADD=:
(
COLOR 08
ECHO.[?25l[0m[16;36H┏━━━━━━━━━━━━━━━━━━━┫%RGB.RED%ERROR[0m┠━━━━━━━━━━━━━━━━━━━┓
ECHO.[35C[s┃                                             ┃
FOR %%A IN (%ARGS%) DO ECHO.[35C┃                                             ┃
ECHO.[u
FOR %%A IN (%ARGS%) DO (
	SET TMP.MSG=[37C[1;37m%%A
	CALL :OUTPUT
)
ECHO.[35C┃                                             ┃
ECHO.[35C┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
ECHO.[56C[s
)
PAUSE>NUL
EXIT /B 0

:OUTPUT
ECHO.%TMP.MSG:_= %%TMP.ADD%
IF DEFINED TMP.ADD SET TMP.ADD=
EXIT /B 0