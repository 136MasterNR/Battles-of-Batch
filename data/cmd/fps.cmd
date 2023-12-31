@ECHO OFF
SET TMP=0
SET CNT=0
:L
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

GOTO :L