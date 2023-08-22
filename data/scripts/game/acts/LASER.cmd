IF NOT DEFINED VERCODE EXIT
SET W.TIME=0
SET S.TIME=12
REM FRAME: 1
ECHO.[H[17B^|  ^|       ,--.-.)    
ECHO.^|   \     /  o \o\     
ECHO.^|   /\/\  \    /_/     
ECHO.^|    (_.   `--'__)     
ECHO.^|     ^|     .-'  \    
ECHO.^|     ^|  .-'._._. )   
ECHO.^|     ^| (  -'--. '    
ECHO.^|     ^|  `.___.'      
CSCRIPT "%WAIT%" 60 >NUL

REM FRAME: 2
ECHO.[8A^|  ^|       ,--.-.)    
ECHO.^|   \     /  o \o\     
ECHO.^|   /\/\  \ ' '/_/     
ECHO.^|    (_.   `--'__)     
ECHO.^|     ^|     .-'  \    
ECHO.^|     ^|  .-'.-.-.-'   
ECHO.^|     ^| (  ,_._._     
ECHO.^|     ^|  `.___.'      

REM SFX: 1
IF "%AUDIO.VALUE%"=="TRUE" (
	SETLOCAL ENABLEDELAYEDEXPANSION
	FOR /F "DELIMS=:" %%A IN ('TASKLIST /FI "WINDOWTITLE eq wscript.exe%TARGETAEXT%"') DO IF NOT %%A==INFO TASKKILL /F /FI "WINDOWTITLE eq wscript.exe%TARGETAEXT%" /T>NUL
	SET "TARGETAEXT=.sfx"
	SET "TARGETAUDIO=%SFX.LASER%.mp3"
	(
		ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
		ECHO Sound.URL = "!TARGETAUDIO!"
		ECHO Sound.Controls.play
		ECHO Sound.settings.volume = %SFX.VOLUME%
		ECHO Sound.settings.setMode "loop", False
		ECHO Sound.Controls.play
		ECHO While Sound.playState ^<^> 1
		ECHO      WScript.Sleep 100
		ECHO Wend
	) > "%DATA_TMP_A%"
	START /min "wscript.exe%TARGETAEXT%" cmd /c START /min /wait "" "%DATA_TMP_A%"^|^|EXIT^&DEL /Q "%DATA_TMP_A%"^|^|EXIT^&EXIT
	ENDLOCAL
)

REM FRAME: 3
ECHO.[8A^|  ^|       ,--.-.)    
ECHO.^|   \     /  o \o\     
ECHO.^|   /\/\  \ ' '/_/     
ECHO.^|    (_.   `--'__)     
ECHO.^|     ^|     .-'  \    
ECHO.^|     ^|  .-'"-.-.-`   
ECHO.^|     ^| ( ,.__._._    
ECHO.^|     ^|  `.____.'     
CSCRIPT "%WAIT%" 60 >NUL

REM FRAME: 4
ECHO.[8A^|  ^|       ,--.-.)    
ECHO.^|   \     /  0 \0\     
ECHO.^|   /\/\  \ ' '/_/     
ECHO.^|    (_.   `--'__)     
ECHO.^|     ^|     .-'  \_ 
ECHO.^|     ^|  .-'"-.-.-,'     
ECHO.^|     ^| (  [s          
ECHO.^|     ^| .`.__._._,    
ECHO.^|     ^|  '-.__.-'     
CSCRIPT "%WAIT%" 60 >NUL

REM FRAME: L:1
ECHO.[1;31m[u.'-           
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:2   
ECHO.[u-^'=^.-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:3
ECHO.[u=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:4
ECHO.[u-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:5
ECHO.[u=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:6
ECHO.[u-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:7
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:8
ECHO.[u-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:9
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:10
ECHO.[u-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:11
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:12
ECHO.[u-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:13
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME%0 >NUL
REM FRAME: L:14
ECHO.[u-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:15
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:16
ECHO.[u-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:17
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:18
ECHO.[u-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: L:19
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: D:1
ECHO.[u-  -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: D:2
ECHO.[u. -  -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: D:3
ECHO.[u, -     -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: D:4
ECHO.[u  .   -  , -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: D:5
ECHO.[u.     -    ,  -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: D:6
ECHO.[u-      .-     ,  -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: D:7
ECHO.[u -  -     .  ,    ' -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: D:8
ECHO.[u   -    .    ' -       -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %W.TIME% >NUL
ECHO.[0m[7A^|  ^|       ,--.-.)    
ECHO.^|   \     /  o \o\     
ECHO.^|   /\/\  \ ' '/_/     
ECHO.^|    (_.   `--'__)     
ECHO.^|     ^|     .-'  \    
ECHO.^|     ^|  .-'"-.-.-`   
ECHO.^|     ^| ( ,.__._._  [1;31m.      '        - -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-[0m
ECHO.^|     ^|  `.____.'     
ECHO.^|     ^|               
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: D:9
ECHO.[9A^|  ^|       ,--.-.)    
ECHO.^|   \     /  o \o\     
ECHO.^|   /\/\  \ ' '/_/     
ECHO.^|    (_.   `--'__)     
ECHO.^|     ^|     .-'  \    
ECHO.^|     ^|  .-'.-.-.-'   
ECHO.^|     ^| (  ,_._._              [1;31m,  '  .  -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-[0m
ECHO.^|     ^|  `.___.'      
ECHO.^|     ^|               
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: D:10
ECHO.[9A^|  ^|       ,--.-.)    
ECHO.^|   \     /  o \o\     
ECHO.^|   /\/\  \    /_/     
ECHO.^|    (_.   `--'__)     
ECHO.^|     ^|     .-'  \    
ECHO.^|     ^|  .-'._._. )   
ECHO.^|     ^| (  -'--. '                [1;31m.     '  -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=[0m
ECHO.^|     ^|  `.___.'      
ECHO.^|     ^|               
CSCRIPT "%WAIT%" %W.TIME% >NUL
REM FRAME: D:11
ECHO.[0m[9A^|  ^|       ,--.-.)    
ECHO.^|   \     /  o \o\     
ECHO.^|   /\/\  \    /_/     
ECHO.^|    (_.   `--'__)     
ECHO.^|     ^|     .-'  \    
ECHO.^|     ^|  .-'.     )   
ECHO.^|     ^| (  _/--.-'[s                    [1;31m,    .  -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-[0m
ECHO.^|     ^|  `.___.'      
ECHO.^|     ^|                
CSCRIPT "%WAIT%" %S.TIME% >NUL
REM FRAME: D:12
CSCRIPT "%WAIT%" %S.TIME% >NUL
REM FRAME: D:13
ECHO.[1;31m[u                           '  .   -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=
CSCRIPT "%WAIT%" %S.TIME% >NUL
REM FRAME: D:14
ECHO.[u                               ,       '-=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %S.TIME% >NUL
REM FRAME: D:15
ECHO.[u                                        .     -=^|-^|=^|-^|=^|-^|=^|-^|=
CSCRIPT "%WAIT%" %S.TIME% >NUL
REM FRAME: D:16
ECHO.[u                                               '    -=^|-^|=^|-^|=^|-
CSCRIPT "%WAIT%" %S.TIME% >NUL
REM FRAME: D:17
ECHO.[u                                                   ,      -=^|-^|=
CSCRIPT "%WAIT%" %S.TIME% >NUL
REM FRAME: D:18
ECHO.[u                                                         . '-=-
CSCRIPT "%WAIT%" %S.TIME% >NUL
REM FRAME: D:19
ECHO.[u                                                            '.-
CSCRIPT "%WAIT%" %S.TIME% >NUL
ECHO.[u                                                                [0m[47;2H[s
EXIT /B 0
