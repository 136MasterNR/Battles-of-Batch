IF NOT "%1x"=="x" GOTO :%1
::_/\ˍ‐‒―─━│┃┄┅┆┇┈┉┊┋╌╍╎╴╵╶╷╸╹╺╻╼╽╾╿╏–—┌┍┎┏┐┑┒┓└└┕┖┗┘┙┚┛├├┝┞┟┠┡┢┣┤┥┦┧┨┩┪┫┬┭┮┯┰┱┲┳┴┵┶┷┸┹┺┻┼┽┾┿╀╁╂╃╄╅╆╇╈╉╊╋═║╒╓╔╔╔╕╕╖╖╗╗╘╙╚╚╛╛╜╜╝╝╞╟╟╠╡╡╢╢╣╣╤╤╥╥╦╦╧╧╨╨╩╩╪╪╫╬╱╲╳╭╮╯╰≡↓
(
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                              __________                                           ^|
ECHO.^|                                                            _╱          ╲                                          ^|
ECHO.^|                                                         __╱             ╲                                         ^|
ECHO.^|______           ________                               ╱        ____     ╲                                        ^|
ECHO.^|      ╲__     __╱        ╲___                          ╱        ╱    ╲     ╲                                       ^|
ECHO.^|         ╲___╱               ╲_                       ╱      __╱      ╲     ╲                                      ^|
ECHO.^|_____              ____        ╲__                   ╱      ╱          ╲     ╲                                     ^|
ECHO.^|     ╲__         _╱    ╲_         ╲_                ╱      ╱            ╲     ╲                                    ^|
ECHO.^|        ╲_______╱        ╲___       ╲____          ╱      ╱              ╲     ╲__________                         ^|
ECHO.^|                             ╲___        ╲________╱      ╱                ╲               ╲                        ^|
ECHO.^|                                 ╲____                  ╱                  ╲               ╲                       ^|
ECHO.^|                                      ╲____            ╱                    ╲__________     ╲                      ^|
ECHO.^|                                           ╲__________╱                                ╲     ╲                     ^|
ECHO.^|                                                                                       ╱     ╱                     ^|
ECHO.^|                                                                                       ╲     ╲                     ^|
ECHO.^|                                                                                       ╱     ╱                     ^|
ECHO.^|                                                                                       ╲     ╲__                   ^|
ECHO.^|                                                                                       ╱        ╲_                 ^|
ECHO.^|                                                                                       ╲          ╲_____           ^|
ECHO.^|                                                                                        ╲_____          ╲____      ^|
ECHO.^|                                                                                              ╲              ╲___  ^|
ECHO.^|                                                                                               ╲______           ╲_^|
ECHO.^|                                                                                                      ╲__           
ECHO.^|                                                                                                         ╲__        
ECHO.^|                                                                                                            ╲______ 
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
)
:NUMS
IF %SELECTED%==1 ( ECHO.[16;12H^>^|[1;32m1[0m^|^<) ELSE ECHO.[16;12H[1;37m  1  [0m
IF %PLAYER.MAP.LEVEL% GEQ 2 ( IF %SELECTED%==2 ( ECHO.[16;28H^>^|[1;32m2[0m^|^< ) ELSE ECHO.[16;28H[1;37m  2  [0m ) ELSE ECHO.[16;28H[1;30m  ?  [0m
IF %PLAYER.MAP.LEVEL% GEQ 3 ( IF %SELECTED%==3 ( ECHO.[20;49H^>^|[1;32m3[0m^|^< ) ELSE ECHO.[20;49H[1;37m  3  [0m ) ELSE ECHO.[20;49H[1;30m  ?  [0m
IF %PLAYER.MAP.LEVEL% GEQ 4 ( IF %SELECTED%==4 ( ECHO.[11;67H^>^|[1;32m4[0m^|^< ) ELSE ECHO.[11;67H[1;37m  4  [0m ) ELSE ECHO.[11;67H[1;30m  ?  [0m
IF %PLAYER.MAP.LEVEL% GEQ 5 ( IF %SELECTED%==5 ( ECHO.[19;82H^>^|[1;32m5[0m^|^< ) ELSE ECHO.[19;82H[1;37m  5  [0m ) ELSE ECHO.[19;82H[1;30m  ?  [0m
IF %PLAYER.MAP.LEVEL% GEQ 6 ( IF %SELECTED%==6 ( ECHO.[27;92H^>^|[1;32m6[0m^|^< ) ELSE ECHO.[27;92H[1;37m  6  [0m ) ELSE ECHO.[27;92H[1;30m  ?  [0m
IF %PLAYER.MAP.LEVEL% GEQ 7 ( IF %SELECTED%==7 ( ECHO.[32;111H^>^|[1;31mX[0m^|^<) ELSE ECHO.[32;111H[1;37m  X  [0m ) ELSE ECHO.[32;111H[1;30m  ?  [0m

CALL "%MAP.LOAD%\details.cmd" %SELECTED% %CHAPTER%
ECHO.[38;0H
