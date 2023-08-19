IF NOT DEFINED VERCODE EXIT
CALL :%*
EXIT /B 0

:ADD <"Text": String>
FOR /L %%I IN (6,-1,1) DO (
	CALL :ADD-SET %%I
)
SET LOG.1=%*
CALL :DISPLAY
EXIT /B 0
:ADD-SET <"Index": Integer>
IF NOT DEFINED LOG.%1 EXIT /B 0
SETLOCAL ENABLEDELAYEDEXPANSION
SET /A TMP.NUM=%1+1
SET TMP.TXT=!LOG.%1!
ENDLOCAL&SET LOG.%TMP.NUM%=%TMP.TXT%
EXIT /B 0

:DISPLAY
CALL "%DATA_SCRIPTS%\charcnt.cmd" %LOG.1%
IF NOT DEFINED CHARCNT EXIT /B 0

:: Remove a specific amount of characters, because of ANSI.
SET /A CHARCNT=(CHARCNT-70)/2
ECHO.[33;3H                                                 [33;3H.[s
FOR /L %%I IN (1,1,%CHARCNT%) DO (
	ECHO.[u-[s
)
ECHO.[u: ACTIONS LOG :%UI.LINE_CHARS%[s
FOR /L %%I IN (1,1,%CHARCNT%) DO (
	ECHO.[u-[s
)

:: Clear the old text
ECHO.[u.
FOR /F "TOKENS=2DELIMS==" %%1 IN ('SET LOG.') DO (
	ECHO.[3C                                        
)

:: Print the new text
ECHO.[u.
FOR /F "TOKENS=2DELIMS==" %%1 IN ('SET LOG.') DO (
	ECHO.[3C[0m[1m%%1[0m
)
EXIT /B 0