IF NOT "%1x"=="x" GOTO :%1
::_/\ˍ‐‒―─━│┃┄┅┆┇┈┉┊┋╌╍╎╴╵╶╷╸╹╺╻╼╽╾╿╏–—┌┍┎┏┐┑┒┓└└┕┖┗┘┙┚┛├├┝┞┟┠┡┢┣┤┥┦┧┨┩┪┫┬┭┮┯┰┱┲┳┴┵┶┷┸┹┺┻┼┽┾┿╀╁╂╃╄╅╆╇╈╉╊╋═║╒╓╔╔╔╕╕╖╖╗╗╘╙╚╚╛╛╜╜╝╝╞╟╟╠╡╡╢╢╣╣╤╤╥╥╦╦╧╧╨╨╩╩╪╪╫╬╱╲╳╭╮╯╰≡↓
(
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                _.-------._                                                        ^|
ECHO.^|                                            ___/           \_                                    .--''--.          ^|
ECHO.^|                                 ..     ___/                 \                                  /        \         ^|
ECHO.^|                              .''  '\__/                      \_                              _/          \        '
ECHO.^|                             /                    .--.          \                            /             '-. .. ' 
ECHO.^|                          __/                ___.'    \_         \_                        _/                       
ECHO.^|                       __/                __/           \_         \                      /          _              
ECHO.^|                    __/                __/                \         \_                  _/          / \__           
ECHO.^|                 __/                 _/                    \_         \                /           /     '--..      
ECHO.^|              __/                ___/                        \         \_            _/           /            '  . 
ECHO.^|           __/               ___/                             \          \          /           _/                 .
ECHO.^|        __/              ___/                                  \_         \_      _/          _/                   ^|
ECHO.^|     __/             ___/                                        \          \    /          _/                     ^|
ECHO.^|  __/            ___/                                             \          \__/          /                       ^|
ECHO.^|_/           ___/                                                  \_                     /                        ^|
ECHO.          ___/                                                        \                  _/                         ^|
ECHO.      ___/                                                             \_              _/                           ^|
ECHO. ____/                                                                   \__        __/                             ^|
ECHO.^|                                                                           \_    _/                                ^|
ECHO.^|                                                                             '--'                                  ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
)
:NUMS
IF %PLAYER.MAP.LEVEL% GEQ 8 ( IF %SELECTED%==8 ( ECHO.[28;14H^>^|[1;32m8[0m^|^< ) ELSE ECHO.[28;14H[1;37m  8  [0m) ELSE ECHO.[28;14H[1;30m  ?  [0m
IF %PLAYER.MAP.LEVEL% GEQ 9 ( IF %SELECTED%==9 ( ECHO.[23;32H^>^|[1;32m9[0m^|^< ) ELSE ECHO.[23;32H[1;37m  9  [0m ) ELSE ECHO.[23;32H[1;30m  ?  [0m
IF %PLAYER.MAP.LEVEL% GEQ 10 ( IF %SELECTED%==10 ( ECHO.[19;56H^>^|[1;32m10[0m^|^< ) ELSE ECHO.[19;56H[1;37m  10  [0m ) ELSE ECHO.[19;56H[1;30m  ?  [0m
IF %PLAYER.MAP.LEVEL% GEQ 11 ( IF %SELECTED%==11 ( ECHO.[25;65H^>^|[1;32m11[0m^|^< ) ELSE ECHO.[25;65H[1;37m  11  [0m ) ELSE ECHO.[25;65H[1;30m  ?  [0m
IF %PLAYER.MAP.LEVEL% GEQ 12 ( IF %SELECTED%==12 ( ECHO.[32;78H^>^|[1;32m12[0m^|^< ) ELSE ECHO.[32;78H[1;37m  12  [0m ) ELSE ECHO.[32;78H[1;30m  ?  [0m
IF %PLAYER.MAP.LEVEL% GEQ 13 ( IF %SELECTED%==13 ( ECHO.[26;90H^>^|[1;32m13[0m^|^< ) ELSE ECHO.[26;90H[1;37m  13  [0m ) ELSE ECHO.[26;90H[1;30m  ?  [0m
IF %PLAYER.MAP.LEVEL% GEQ 14 ( IF %SELECTED%==14 ( CALL :GLITCHONTHEMATRIX&CALL "%MAP.LOAD%\c2.cmd" ) ELSE ECHO.[23;113H[1;37m  X  [0m) ELSE ECHO.[23;113H[1;30m  ?  [0m

CALL "%MAP.LOAD%\details.cmd" %SELECTED% %CHAPTER%
ECHO.[38;0H
EXIT /B 0
:GLITCHONTHEMATRIX
ECHO.[23;113H^>^|[1;31mX[0m^|^<
CALL "%WAIT%" 1 >NUL
ECHO.[23;113H^>^|[1;31m#[0m^|^<
CALL "%WAIT%" 1 >NUL
ECHO.[23;113H^>^|[1;31m@[0m^|^<
CALL "%WAIT%" 1 >NUL
ECHO.[23;113H^>^|[1;31m^&[0m^|^<
CALL "%WAIT%" 1 >NUL
ECHO.[23;113H^>^|[1;31m%%[0m^|^<
CALL "%WAIT%" 1 >NUL
ECHO.[23;113H^>^|[1;31m^![0m^|^<
CALL "%WAIT%" 1 >NUL
ECHO.[23;113H[1;31m[4mERR[24mOR[0m
CALL "%WAIT%" 420 >NUL
SET /A SELECTED=SELECTED-1
ECHO.[4;0H
EXIT /B 0
