IF %SELECTED% LSS 1 SET SELECTED=1
IF %SELECTED% GTR %PLAYER.MAP.LEVEL% SET SELECTED=%PLAYER.MAP.LEVEL%
IF %SELECTED% GEQ 8 (SET CHAPTER=2) ELSE SET CHAPTER=1