@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

:RENDER-LOOP
IF NOT EXIST ".\buffer_layer_1.cmd" EXIT

:: Memory optimization
SETLOCAL ENABLEDELAYEDEXPANSION

SET LAYERS=1
:RENDER-BUFFER
:: Call the buffer for all found layers
CALL ".\buffer_layer_!LAYERS!.cmd"
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

:: End of rendering, repeat
GOTO RENDER-LOOP
