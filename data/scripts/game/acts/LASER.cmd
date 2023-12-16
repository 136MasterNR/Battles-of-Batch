IF NOT DEFINED VERCODE EXIT
SET W.TIME=0
SET S.TIME=12
IF "%AUDIO.VALUE%"=="TRUE" IF NOT %SFX.VOLUME% EQU 0 CALL "%AUDIOMANAGER%" START game\player\substat\laser.mp3 sfx False %SFX.VOLUME%
REM FRAME: 1
ECHO.%LOC.HP.P%
ECHO.[5B^|  ^|       ,--.-.)    
ECHO.^|   \     /  o \o\     
ECHO.^|   /\/\  \    /_/     
ECHO.^|    (_.   `--'__)     
ECHO.^|     ^|     .-'  \    
ECHO.^|     ^|  .-'._._. )   
ECHO.^|     ^| (  -'--. '    
ECHO.^|     ^|  `.___.'      
CALL "%WAIT%" 60 >NUL

REM FRAME: 2
ECHO.[8A^|  ^|       ,--.-.)    
ECHO.^|   \     /  o \o\     
ECHO.^|   /\/\  \ ' '/_/     
ECHO.^|    (_.   `--'__)     
ECHO.^|     ^|     .-'  \    
ECHO.^|     ^|  .-'.-.-.-'   
ECHO.^|     ^| (  ,_._._     
ECHO.^|     ^|  `.___.'      

REM FRAME: 3
ECHO.[8A^|  ^|       ,--.-.)    
ECHO.^|   \     /  o \o\     
ECHO.^|   /\/\  \ ' '/_/     
ECHO.^|    (_.   `--'__)     
ECHO.^|     ^|     .-'  \    
ECHO.^|     ^|  .-'"-.-.-`   
ECHO.^|     ^| ( ,.__._._    
ECHO.^|     ^|  `.____.'     
CALL "%WAIT%" 60 >NUL

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
CALL "%WAIT%" 60 >NUL

REM FRAME: L:1
ECHO.[1;31m[u.'-           
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:2   
ECHO.[u-^'=^.-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:3
ECHO.[u=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:4
ECHO.[u-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:5
ECHO.[u=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:6
ECHO.[u-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:7
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:8
ECHO.[u-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:9
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:10
ECHO.[u-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:11
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:12
ECHO.[u-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:13
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME%0 >NUL
REM FRAME: L:14
ECHO.[u-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:15
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:16
ECHO.[u-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:17
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:18
ECHO.[u-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: L:19
ECHO.[u=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: D:1
ECHO.[u-  -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: D:2
ECHO.[u. -  -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: D:3
ECHO.[u, -     -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: D:4
ECHO.[u  .   -  , -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: D:5
ECHO.[u.     -    ,  -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: D:6
ECHO.[u-      .-     ,  -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: D:7
ECHO.[u -  -     .  ,    ' -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
REM FRAME: D:8
ECHO.[u   -    .    ' -       -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %W.TIME% >NUL
ECHO.[0m[7A^|  ^|       ,--.-.)    
ECHO.^|   \     /  o \o\     
ECHO.^|   /\/\  \ ' '/_/     
ECHO.^|    (_.   `--'__)     
ECHO.^|     ^|     .-'  \    
ECHO.^|     ^|  .-'"-.-.-`   
ECHO.^|     ^| ( ,.__._._  [1;31m.      '        - -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-[0m
ECHO.^|     ^|  `.____.'     
ECHO.^|     ^|               
CALL "%WAIT%" %W.TIME% >NUL
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
CALL "%WAIT%" %W.TIME% >NUL
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
CALL "%WAIT%" %W.TIME% >NUL
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
CALL "%WAIT%" %S.TIME% >NUL
REM FRAME: D:12
CALL "%WAIT%" %S.TIME% >NUL
REM FRAME: D:13
ECHO.[1;31m[u                           '  .   -=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=
CALL "%WAIT%" %S.TIME% >NUL
REM FRAME: D:14
ECHO.[u                               ,       '-=^|-^|=^|-^|=^|-^|=^|-^|=^|-^|=^|-
CALL "%WAIT%" %S.TIME% >NUL
REM FRAME: D:15
ECHO.[u                                        .     -=^|-^|=^|-^|=^|-^|=^|-^|=
CALL "%WAIT%" %S.TIME% >NUL
REM FRAME: D:16
ECHO.[u                                               '    -=^|-^|=^|-^|=^|-
CALL "%WAIT%" %S.TIME% >NUL
REM FRAME: D:17
ECHO.[u                                                   ,      -=^|-^|=
CALL "%WAIT%" %S.TIME% >NUL
REM FRAME: D:18
ECHO.[u                                                         . '-=-
CALL "%WAIT%" %S.TIME% >NUL
REM FRAME: D:19
ECHO.[u                                                            '.-
CALL "%WAIT%" %S.TIME% >NUL
ECHO.[u                                                                [0m[47;2H[s
EXIT /B 0
