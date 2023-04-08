SETLOCAL ENABLEDELAYEDEXPANSION
FOR /L %%I IN (1,1,!EN.MAX!) DO (
	IF !ENEMY.HP.NOW.%%I! LEQ 0 (
		ENDLOCAL
		CALL :CREATE_FRAMES %%I
		SETLOCAL ENABLEDELAYEDEXPANSION
	)
)
ENDLOCAL
EXIT /B 0

:CREATE_FRAMES
SET ARG=%1
SETLOCAL ENABLEDELAYEDEXPANSION
IF NOT "!FRAME.FADE.%1!."=="==========." (
	ENDLOCAL
	IF NOT "%FADE%."=="----------." (
		CALL :SAVE_FRAME %ARG% %%FADE%%
		CALL :FINALIZE_FRAME %ARG% %%FADE%%
		CALL "%SCRIPTS_GAME%\enemy_display.cmd"
		GOTO CREATE_FRAMES
	)
)
ENDLOCAL
SET FADE=
EXIT /B 0

:SAVE_FRAME
SET "FADE=%2-"
EXIT /B 0

:FINALIZE_FRAME
SET ARG=%2
SET FRAME.FADE.%1=%ARG:-==%
SET FADE=%2
EXIT /B 0