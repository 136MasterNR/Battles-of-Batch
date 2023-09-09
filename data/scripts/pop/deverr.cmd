IF NOT DEFINED VERCODE EXIT
SET ARGS=%*
SET ARGS=%ARGS: =_%
SET ARGS=%ARGS::= %
SET TMP.ADD=:
(
COLOR 08
ECHO.[?25l[0m[18;35H┏━━━━━━━━━━━━━━━━━━━┫%RGB.RED%ERROR[0m┠━━━━━━━━━━━━━━━━━━━┓
ECHO.[34C[s┃                                             ┃
FOR %%A IN (%ARGS%) DO ECHO.[34C┃                                             ┃
ECHO.[u
FOR %%A IN (%ARGS%) DO (
	SET TMP.MSG=[36C[1;37m%%A
	CALL :OUTPUT
)
ECHO.[34C┃                                             ┃
ECHO.[34C┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
)
PAUSE>NUL
EXIT /B 0

:OUTPUT
ECHO.%TMP.MSG:_= %%TMP.ADD%
IF DEFINED TMP.ADD SET TMP.ADD=
EXIT /B 0