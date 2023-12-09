@ECHO OFF
CALL :%*
EXIT /B 0

:FILTER <File>
ECHO.Filtering...
SET "FILE=%*"
BREAK > "%FILE%.filter"


FOR /f "tokens=*delims=" %%A IN (%FILE%.ans) DO (
    CALL :FILTERER %%A
)

findstr /R /V /C:"^;$" /C:"^}" /C:"frame[1-9]() {" /C:"frame[1-9][0-9]() {" /C:"frame[1-9][0-9][0-9]() {" "%FILE%.filter" > "%FILE%.filter1"


MOVE "%FILE%.filter1" "%FILE%.build" >NUL

DEL /Q "%FILE%.filter"
DEL /Q "%FILE%.filter1"

ECHO.Finished!
EXIT /B 0

:FILTERER
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




:DISPLAY
CLS

SETLOCAL ENABLEDELAYEDEXPANSION
FOR /L %%F IN (1, 1, %FRAMES%) DO (
	SET /P "=[H" <NUL
	FOR /L %%L IN (1, 1, 48) DO (
		ECHO.!BUFFER.%%F-%%L!
	)
)
ENDLOCAL

EXIT /B 0




:CLEAR
ECHO.Clearing buffer...
FOR /F "TOKENS=1DELIMS==" %%A IN ('SET BUFFER. 2^>NUL') DO SET "%%A="
ECHO.Buffer cleared.
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




@ECHO OFF
CALL :%*
EXIT /B 0

:COMPACT-BUILD
ECHO.Filtering...
SET "FILE=%*"
BREAK > "%FILE%.filter"
BREAK > "%FILE%.filtered"
BREAK > "%FILE%.build"


FOR /f "tokens=*delims=" %%A IN (%FILE%.ans) DO CALL :FILTERER %%A

findstr /R /V /C:"^;$" /C:"^}" /C:"frame[1-9]() {" /C:"frame[1-9][0-9]() {" /C:"frame[1-9][0-9][0-9]() {" "%FILE%.filter" > "%FILE%.filtered"

ECHO.Building...

SET CNT=0
SET PART1=[H
SET PART2=
SET PART3=
SET PART4=
SET PART5=
SET PART6=

FOR /f "delims=" %%A IN (%FILE%.filtered) DO CALL :COMPACT-BUILDER %%A


DEL /Q "%FILE%.filter"
DEL /Q "%FILE%.filtered"

ECHO.Finished!
EXIT /B 0

:COMPACT-BUILDER
SET /A CNT+=1

IF %CNT% LEQ 9 (
	SET "PART1=%PART1%[1B[G%*"
) ELSE IF %CNT% LEQ 18 (
	SET "PART2=%PART2%[1B[G%*"
) ELSE IF %CNT% LEQ 27 (
	SET "PART3=%PART3%[1B[G%*"
) ELSE IF %CNT% LEQ 36 (
	SET "PART4=%PART4%[1B[G%*"
) ELSE IF %CNT% LEQ 45 (
	SET "PART5=%PART5%[1B[G%*"
) ELSE IF %CNT% LEQ 54 (
	SET "PART6=%PART6%[1B[G%*"
)

IF %CNT% EQU 48 CALL :COMPACT-BUILDER-FINISH

EXIT /B 0

:COMPACT-BUILDER-FINISH
SET /P "=%PART1%" <NUL >>"%FILE%.build"
SET /P "=%PART2%" <NUL >>"%FILE%.build"
SET /P "=%PART3%" <NUL >>"%FILE%.build"
SET /P "=%PART4%" <NUL >>"%FILE%.build"
SET /P "=%PART5%" <NUL >>"%FILE%.build"
ECHO.%PART6%>>"%FILE%.build"

SET CNT=0
SET PART1=[H
SET PART2=
SET PART3=
SET PART4=
SET PART5=
SET PART6=
EXIT /B 0

:COMPACT-DISPLAY
SET "FILE=%*"

TYPE "%FILE%.build" > CON

EXIT /B 0
