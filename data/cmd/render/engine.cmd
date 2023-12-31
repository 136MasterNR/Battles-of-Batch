@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
SET TMP=0
SET CNT=0

:RENDER-LOOP
IF NOT EXIST ".\buffer_layer_1.cmd" EXIT

:: Memory optimization
SETLOCAL ENABLEDELAYEDEXPANSION

SET LAYERS=1
:RENDER-BUFFER
:: Call the buffer for all found layers
CALL ".\buffer_layer_!LAYERS!.cmd" || GOTO RENDER-BUFFER
SET /A LAYERS+=1
IF EXIST ".\buffer_layer_!LAYERS!.cmd" GOTO RENDER-BUFFER

:RENDER-DISPLAY
:: Display the lines ...
FOR /L %%y IN (1, 1, %LINES%) DO (
	:: ... display all additional layers linked to this line
	FOR /L %%l in (1, 1, !LAYERS!) DO (
		IF DEFINED map[%%l.%%y] SET /p "=[%%yH!map[%%l.%%y]!" <NUL
	)
)

:: Clear buffer memory
ENDLOCAL

:: Calculate FPS
(
	SET /A CNT+=1
	FOR /f "tokens=2,3delims=:,." %%1 IN ("%TIME%") DO (
		SET TIMER=%%1%%2
	)
)

IF %TMP% LSS %TIMER% (
	SET TMP=%TIMER%
	TITLE FPS: %CNT%
	SET CNT=0
)

:: End of rendering, loop
GOTO RENDER-LOOP
