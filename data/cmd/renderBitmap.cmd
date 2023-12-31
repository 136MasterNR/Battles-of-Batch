@ECHO OFF
CALL :%*
EXIT /B 0

:PUSH
SET TMP.CHARACTERS=asfasfa
SET TMP.LINE=7
SET TMP.COLUMN=1
SET CNT=1

SET TMP.CHARACTERS=%TMP.CHARACTERS: =[1C%

:: Push each character into the bitmap
for /L %%I in (%TMP.COLUMN%, 1, %COLS%) do (
	SETLOCAL ENABLEDELAYEDEXPANSION
	CALL :PUSH-CHARACTER %%I !TMP.CHARACTERS:~%%I,1!
	ENDLOCAL
)
exit /b 0

:PUSH-CHARACTER
ENDLOCAL
echo.%2
IF NOT "%2"=="" SET "BITMAP[%TMP.LINE%,%1]=%2"
exit /b 0




:RENDER
setlocal enabledelayedexpansion

:: Create an empty bitmap
for /L %%y in (1, 1, %LINES%) do (
    for /L %%x in (1, 1, %COLS%) do (
        set "BITMAP[%%x,%%y]= "
    )
)

:: Set some pixels in the bitmap
set "BITMAP[5,2]=A"
set "BITMAP[4,3]=B"

:: Display the bitmap
for /L %%y in (1, 1, %LINES%) do (
    for /L %%x in (1, 1, %COLS%) do (
		IF NOT "!bitmap[%%x,%%y]!"=="" set /p "=[%%y;%%xH!BITMAP[%%x,%%y]!" <NUL
    )
)

endlocal
exit /b 0
