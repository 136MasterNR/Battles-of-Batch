IF NOT DEFINED VERCODE EXIT

:CHARCNT.cmd <string>
SETLOCAL ENABLEDELAYEDEXPANSION
SET STRING=%1
SET CNT=0
FOR /L %%A IN (0,1,100) DO (
    SET "CHAR=!STRING:~%%A,1!"
    IF NOT "!CHAR!"=="" (
        SET /A "CNT+=1"
    ) ELSE (
		GOTO END
	)
)

:END
ENDLOCAL&SET CHARCNT=%CNT%
EXIT /B 0