@ECHO OFF
CALL :%*
EXIT /B 0

:FILTER <File>
ECHO.Filtering...
SET "FILE=%*"
BREAK > "%FILE%.filter"


FOR /f "tokens=*delims=" %%A IN (%FILE%.ans) DO (
    CALL :FILTER %%A
)

findstr /R /V /C:"^;$" /C:"^}" /C:"frame[1-9]() {" /C:"frame[1-9][0-9]() {" /C:"frame[1-9][0-9][0-9]() {" "%FILE%.filter" > "%FILE%.filter1"


MOVE "%FILE%.filter1" "%FILE%.build" >NUL

DEL /Q "%FILE%.filter"
DEL /Q "%FILE%.filter1"

ECHO.Finished!
EXIT /B 0

:FILTER
SET "LINE=%*"
SET LINE=%LINE:"=%
SET LINE=%LINE:printf =%
SET LINE=%LINE:\e=%

ECHO.%LINE%>>"%FILE%.filter"
EXIT /B 0




:BUFFER
ECHO.Adding all frames into the buffer...
SET "FILE=%*"
SET CNT=0
SET FRAMES=0

FOR /F "DELIMS=" %%A IN (%FILE%.build) DO (
	CALL SET "BUFFER.%%FRAMES%%-%%CNT%%=%%A"
	TITLE %FRAMES%
	SET /A CNT+=1
	SETLOCAL ENABLEDELAYEDEXPANSION
	IF !CNT! EQU 48 (
		ENDLOCAL
		SET CNT=0
		SET /A FRAMES+=1
	) ELSE ENDLOCAL
)

SET BUFFER.FRAMES=%FRAMES%

ECHO.Added %BUFFER.FRAMES% frames into the buffer.

EXIT /B 0




:CLEAR
ECHO.Clearing buffer...
FOR /F "TOKENS=1DELIMS==" %%A IN ('SET BUFFER. 2^>NUL') DO SET "%%A="
ECHO.Buffer cleared.
EXIT /B 0




:DISPLAY
CLS

SETLOCAL ENABLEDELAYEDEXPANSION
FOR /L %%F IN (1, 1, %FRAMES%) DO (
	SET /P "=[H" <NUL
	FOR /L %%L IN (1, 1, 48) DO (
		ECHO.!BUFFER.%%F-%%L!
		SET "BUFFER.%%F-%%L="
	)
)
ENDLOCAL

EXIT /B 0




:NOBUFFER
SET "FILE=%*"
SET CNT=0

SET /P "=[H[?25l" <NUL
FOR /F "DELIMS=" %%A IN (%FILE%.build) DO (
	ECHO.%%A
	SET /A CNT+=1
	SETLOCAL ENABLEDELAYEDEXPANSION
	IF !CNT! EQU 48 (
		ENDLOCAL
		SET CNT=0
		SET /P "=[H" <NUL
	) ELSE ENDLOCAL
)
GOTO :NOBUFFER
EXIT /B 0
