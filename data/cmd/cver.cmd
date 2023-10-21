:cver.cmd <"Version": Integer> ["Type": String] ["/A": Switch - Carry previous saves]
@ECHO OFF

SET TMP.VERCODE=%1
IF NOT DEFINED TMP.VERCODE (
	ECHO.ERR: At least 1 argument must be given
	ECHO ON
	@EXIT /B 1
)

IF /I NOT %2.==/A. SET TMP.VERTYPE=%2
IF NOT DEFINED TMP.VERTYPE SET TMP.VERTYPE=%VERTYPE%

(
	ECHO.SET VERCODE=%TMP.VERCODE%
	ECHO.SET VERS=v%TMP.VERCODE:~0,1%.%TMP.VERCODE:~1,1%.%TMP.VERCODE:~2%
	ECHO.SET VERTYPE=ALPHA
	ECHO.EXIT /B 0
) > ..\scripts\versions.cmd

IF /I %2.==/A. XCOPY "%HTS_DATA%\BATTLESOFBATCH-%VERTYPE%-%VERCODE%" "%HTS_DATA%\BATTLESOFBATCH-%TMP.VERTYPE%-%TMP.VERCODE%" /E /I /Y

ECHO ON
@EXIT 2