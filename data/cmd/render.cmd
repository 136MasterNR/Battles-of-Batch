@ECHO OFF
CALL :%* || DEL /Q ".\tmp.cmd"
EXIT /B 0

REM Build for both buffer and no-buffer options.
:BUILD <File>
SET "FILE=%*"

IF NOT DEFINED FILE ECHO.No argument provided.&EXIT /B 0

SET "FILE=.\renders\%FILE%"
IF NOT EXIST "%FILE%.ans" ECHO.ANSI not found.&EXIT /B 0

BREAK > "%FILE%.filter"

ECHO.[2KFiltering...[1A

(
	ECHO.@ECHO OFF
	ECHO.ECHO.
	ECHO.:LOOP
	ECHO.TIMEOUT /T 1 >NUL
	ECHO.FOR %%%%A IN ^(^"%FILE%.filter^"^) DO ECHO.[1A[G[14CProcessed %%%%~zA bytes
	ECHO.GOTO LOOP
)>"tmp.cmd"

START /B "" CMD /C .\tmp.cmd ^& EXIT

FOR /f "tokens=*delims=" %%A IN (%FILE%.ans) DO (
    CALL :FILTERER %%A
)

SET FRAME_CNT=-1
for /f "delims=" %%A in (%FILE%.filter) do (
    IF "%%A"=="}" (
		GOTO :END-CNT
	)
	SET /A FRAME_CNT+=1
)
:END-CNT

findstr /R /V /C:"^;$" /C:"^}" /C:"frame[1-9]() {" /C:"frame[1-9][0-9]() {" /C:"frame[1-9][0-9][0-9]() {" "%FILE%.filter" > "%FILE%.build"

DEL /Q ".\tmp.cmd"
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



REM Buffer for the display option.
:BUFFER
SET "FILE=%*"
IF NOT DEFINED FRAME_CNT ECHO.Variable FRAME_CNT not defined.&EXIT /B 1

IF NOT DEFINED FILE ECHO.No argument provided.&EXIT /B 0

SET "FILE=.\renders\%FILE%"
IF NOT EXIST "%FILE%.build" ECHO.Build not found.&EXIT /B 0

ECHO.Adding all frames with %FRAME_CNT% lines each into the buffer...

SET CNT=0
SET FRAMES=0

FOR /F "DELIMS=" %%A IN (%FILE%.build) DO (
	CALL SET "BUFFER.%%FRAMES%%-%%CNT%%=%%A"
	SET /A CNT+=1
	SETLOCAL ENABLEDELAYEDEXPANSION
	IF !CNT! EQU %FRAME_CNT% (
		ENDLOCAL
		SET CNT=0
		SET /A FRAMES+=1
	) ELSE ENDLOCAL
)

SET BUFFER.FRAMES=%FRAMES%
ECHO.Added %BUFFER.FRAMES% frames into the buffer.

EXIT /B 0





REM Render with buffer, directly from memory.
:DISPLAY
CLS

ECHO.[?25l

SETLOCAL ENABLEDELAYEDEXPANSION
:DISPLAY-RE
FOR /L %%F IN (1, 1, %FRAMES%) DO (
	SET /P "=[H" <NUL
	FOR /L %%L IN (1, 1, 48) DO (
		SET /P "=!BUFFER.%%F-%%L![E" <NUL
	)
)
GOTO DISPLAY-RE
ENDLOCAL

EXIT /B 0





REM Render with no buffer, directly from file storage.
:NOBUFFER
SET "FILE=%*"

IF NOT DEFINED FILE ECHO.No argument provided.&EXIT /B 0

SET "FILE=.\renders\%FILE%"
IF NOT EXIST "%FILE%.build" ECHO.Build not found.&EXIT /B 0

SET CNT=0

SET /P "=[H[?25l" <NUL
:NOBUFFER-RE
FOR /F "DELIMS=" %%A IN (%FILE%.build) DO (
	ECHO.%%A
	SET /A CNT+=1
	SETLOCAL ENABLEDELAYEDEXPANSION
	IF !CNT! EQU %FRAME_CNT% (
		ENDLOCAL
		SET CNT=0
		SET /P "=[H" <NUL
	) ELSE ENDLOCAL
)
GOTO :NOBUFFER-RE
EXIT /B 0

















REM Compact builder, for the compact-display option.
:CBUILD
SET "FILE=%*"

IF NOT DEFINED FILE ECHO.No argument provided.&EXIT /B 0

SET "FILE=.\renders\%FILE%"
IF NOT EXIST "%FILE%.ans" ECHO.ANSI not found.&EXIT /B 0

BREAK > "%FILE%.filter"
BREAK > "%FILE%.filtered"
BREAK > "%FILE%.build"

ECHO.[2KFiltering...[1A

(
	ECHO.@ECHO OFF
	ECHO.ECHO.
	ECHO.:LOOP
	ECHO.TIMEOUT /T 1 >NUL
	ECHO.FOR %%%%A IN ^(^"%FILE%.filter^"^) DO ECHO.[A[G[14CProcessed %%%%~zA bytes
	ECHO.GOTO LOOP
)>"tmp.cmd"

START /B "" CMD /C .\tmp.cmd ^& EXIT

FOR /F "tokens=*delims=" %%A IN (%FILE%.ans) DO CALL :FILTERER %%A

SET FRAME_CNT=-1
for /f "delims=" %%A in (%FILE%.filter) do (
    IF "%%A"=="}" (
		GOTO :END-CNT
	)
	SET /A FRAME_CNT+=1
)
:END-CNT

FINDSTR /R /V /C:"^;$" /C:"^}" /C:"frame[1-9]() {" /C:"frame[1-9][0-9]() {" /C:"frame[1-9][0-9][0-9]() {" "%FILE%.filter" > "%FILE%.filtered"

DEL /Q ".\tmp.cmd"

ECHO.[2KBuilding...[1A
(
	ECHO.@ECHO OFF
	ECHO.ECHO.
	ECHO.:LOOP
	ECHO.TIMEOUT /T 1 >NUL
	ECHO.FOR %%%%A IN ^(^"%FILE%.build^"^) DO ECHO.[A[G[14CProcessed %%%%~zA bytes
	ECHO.GOTO LOOP
)>"tmp.cmd"

START /B "" CMD /C .\tmp.cmd ^& EXIT

SET CNT=0

SET /P "=[H" <NUL >>"%FILE%.build"
FOR /f "delims=" %%A IN (%FILE%.filtered) DO CALL :COMPACT-BUILDER %%A

DEL /Q "%FILE%.filter"
DEL /Q "%FILE%.filtered"
DEL /Q ".\tmp.cmd"
ECHO.Finished!
EXIT /B 0

:COMPACT-BUILDER
SET /A CNT+=1

SET /P "=%*[B[G" <NUL >>"%FILE%.build"

IF %CNT% EQU %FRAME_CNT% (
	SET CNT=0
	ECHO.>>"%FILE%.build"
	SET /P "=[H" <NUL >>"%FILE%.build"
)

EXIT /B 0




REM Compact display option, feeds directly from file storage.
:CDISPLAY
SET "FILE=%*"

IF NOT DEFINED FILE ECHO.No argument provided.&EXIT /B 0

SET "FILE=.\renders\%FILE%"
IF NOT EXIST "%FILE%.build" ECHO.Build not found.&EXIT /B 0

ECHO.[?25l

:COMPACT-DISPLAY-RE
TYPE "%FILE%.build" > CON
GOTO :COMPACT-DISPLAY-RE

EXIT /B 0












REM Clean up stuff.
:CLEAR
ECHO.Clearing buffer...
FOR /F "TOKENS=1DELIMS==" %%A IN ('SET BUFFER. 2^>NUL') DO SET "%%A="
ECHO.Buffer cleared.
ECHO.Deleting builds...
DEL ".\renders\*.build" /Q 2>NUL
ECHO.Builds deleted.
EXIT /B 0