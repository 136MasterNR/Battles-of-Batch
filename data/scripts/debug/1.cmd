IF NOT DEFINED VERCODE EXIT
ECHO.[0;0H.-------------------------------------------------------------------------------------------------------------------.
ECHO.^| ^(!) BATTLE LVL.%SELECTED% - BEGINNER'S ADVENTURE ^(%VERTYPE% v%VERS:~1%^)                                                            ^|
ECHO.^|                                                                                                                   ^|
SET /P "=|                                                                                     "<NUL
IF %ENEMY.HP.NOW.1% EQU 0 (ECHO.[[0;37m[1;30mX-X-XX-X-X[0m]                  ^|
) ELSE IF %ENEMY.HP.NOW.1% LEQ %ENEMY.HOLO.HP.1.10% (ECHO.[%RGB%143;33;33m^|[1;30m---------[0m]                  ^|
) ELSE IF %ENEMY.HP.NOW.1% LEQ %ENEMY.HOLO.HP.1.20% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|[1;30m--------[0m]                  ^|
) ELSE IF %ENEMY.HP.NOW.1% LEQ %ENEMY.HOLO.HP.1.30% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|[1;30m-------[0m]                  ^|
) ELSE IF %ENEMY.HP.NOW.1% LEQ %ENEMY.HOLO.HP.1.40% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|[1;30m------[0m]                  ^|
) ELSE IF %ENEMY.HP.NOW.1% LEQ %ENEMY.HOLO.HP.1.50% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|[1;30m-----[0m]                  ^|
) ELSE IF %ENEMY.HP.NOW.1% LEQ %ENEMY.HOLO.HP.1.60% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|[1;30m----[0m]                  ^|
) ELSE IF %ENEMY.HP.NOW.1% LEQ %ENEMY.HOLO.HP.1.70% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|%RGB%212;40;40m^|[1;30m---[0m]                  ^|
) ELSE IF %ENEMY.HP.NOW.1% LEQ %ENEMY.HOLO.HP.1.80% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|%RGB%212;40;40m^|%RGB%235;45;45m^|[1;30m--[0m]                  ^|
) ELSE IF %ENEMY.HP.NOW.1% LEQ %ENEMY.HOLO.HP.1.90% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|%RGB%212;40;40m^|%RGB%235;45;45m^|%RGB%255;48;48m^|[1;30m-[0m]                  ^|
) ELSE ECHO.[[40m%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|%RGB%212;40;40m^|%RGB%235;45;45m^|%RGB%255;48;48m^|%RGB%255;56;56m^|[0m]                  ^|
:: GTR %ENEMY.HP.FULL.1% ( IF %ENEMY.HP.NOW.1% LEQ %ENEMY.HOLO.HP.1.10:~0,1% ECHO.[^|^|         ]                  ^|
::) ELSE IF NOT %ENEMY.HP.NOW.1% LEQ %ENEMY.HOLO.HP.1.10:~0,1% ( %ENEMY.HOLO.HP.1.10% ) ELSE (ECHO.[^|^|         ]                  ^|) ELSE IF %ENEMY.HP.NOW.1% LEQ 0 ( ECHO.[- \  X  / -]                  ^| ) ELSE ECHO.[^|^|^|^|^|^|^|^|^|^|^|]                  ^|
ECHO.^|                                                                                     %EN.1.LINE.1%                 ^|
ECHO.^|                                                                                     %EN.1.LINE.2%                 ^|
ECHO.^|                                                                                     %EN.1.LINE.3%                 ^|
ECHO.^|                                                                                     %EN.1.LINE.4%                 ^|
ECHO.^|                                                                                     %EN.1.LINE.5%                 ^|
ECHO.^|                                                                                     %EN.1.LINE.6%                 ^|
ECHO.^|                                                                                     %EN.1.LINE.7%                 ^|
ECHO.^|    //_\\_                                                                                                         ^|
SET /P "=|  ."\\    ".                                                                              "<NUL
IF %ENEMY.HP.NOW.2% EQU 0 (ECHO.[[0;37m[1;30mX-X-XX-X-X[0m]             ^|
) ELSE IF %ENEMY.HP.NOW.2% LEQ %ENEMY.HOLO.HP.2.10% (ECHO.[%RGB%143;33;33m^|[1;30m---------[0m]             ^|
) ELSE IF %ENEMY.HP.NOW.2% LEQ %ENEMY.HOLO.HP.2.20% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|[1;30m--------[0m]             ^|
) ELSE IF %ENEMY.HP.NOW.2% LEQ %ENEMY.HOLO.HP.2.30% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|[1;30m-------[0m]             ^|
) ELSE IF %ENEMY.HP.NOW.2% LEQ %ENEMY.HOLO.HP.2.40% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|[1;30m------[0m]             ^|
) ELSE IF %ENEMY.HP.NOW.2% LEQ %ENEMY.HOLO.HP.2.50% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|[1;30m-----[0m]             ^|
) ELSE IF %ENEMY.HP.NOW.2% LEQ %ENEMY.HOLO.HP.2.60% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|[1;30m----[0m]             ^|
) ELSE IF %ENEMY.HP.NOW.2% LEQ %ENEMY.HOLO.HP.2.70% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|%RGB%212;40;40m^|[1;30m---[0m]             ^|
) ELSE IF %ENEMY.HP.NOW.2% LEQ %ENEMY.HOLO.HP.2.80% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|%RGB%212;40;40m^|%RGB%235;45;45m^|[1;30m--[0m]             ^|
) ELSE IF %ENEMY.HP.NOW.2% LEQ %ENEMY.HOLO.HP.2.90% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|%RGB%212;40;40m^|%RGB%235;45;45m^|%RGB%255;48;48m^|[1;30m-[0m]             ^|
) ELSE ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|%RGB%212;40;40m^|%RGB%235;45;45m^|%RGB%255;48;48m^|%RGB%255;56;56m^|[0m]             ^|
ECHO.^| /          \                                                                             %EN.2.LINE.1%            ^|
ECHO.^| ^|           \_                                                                           %EN.2.LINE.2%            ^|
ECHO.^| ^|       ,--.-.)                                                                          %EN.2.LINE.3%            ^|
ECHO.^|  \     /  o \o\                                                                          %EN.2.LINE.4%            ^|
ECHO.^|  /\/\  \    /_/                                                                          %EN.2.LINE.5%            ^|
ECHO.^|   (_.   `--'__)                                                                          %EN.2.LINE.6%            ^|
ECHO.^|    ^|     .-'  \                                                                          %EN.2.LINE.7%            ^|
ECHO.^|    ^|  .-'.     )                                                                                                  ^|
SET /P "=|    | (  _/--.-'                                                                    "<NUL
IF %ENEMY.HP.NOW.3% EQU 0 (ECHO.[[0;37m[1;30mX-X-XX-X-X[0m]                   ^|
) ELSE IF %ENEMY.HP.NOW.3% LEQ %ENEMY.HOLO.HP.3.10% (ECHO.[%RGB%143;33;33m^|[1;30m---------[0m]                   ^|
) ELSE IF %ENEMY.HP.NOW.3% LEQ %ENEMY.HOLO.HP.3.20% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|[1;30m--------[0m]                   ^|
) ELSE IF %ENEMY.HP.NOW.3% LEQ %ENEMY.HOLO.HP.3.30% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|[1;30m-------[0m]                   ^|
) ELSE IF %ENEMY.HP.NOW.3% LEQ %ENEMY.HOLO.HP.3.40% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|[1;30m------[0m]                   ^|
) ELSE IF %ENEMY.HP.NOW.3% LEQ %ENEMY.HOLO.HP.3.50% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|[1;30m-----[0m]                   ^|
) ELSE IF %ENEMY.HP.NOW.3% LEQ %ENEMY.HOLO.HP.3.60% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|[1;30m----[0m]                   ^|
) ELSE IF %ENEMY.HP.NOW.3% LEQ %ENEMY.HOLO.HP.3.70% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|%RGB%212;40;40m^|[1;30m---[0m]                   ^|
) ELSE IF %ENEMY.HP.NOW.3% LEQ %ENEMY.HOLO.HP.3.80% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|%RGB%212;40;40m^|%RGB%235;45;45m^|[1;30m--[0m]                   ^|
) ELSE IF %ENEMY.HP.NOW.3% LEQ %ENEMY.HOLO.HP.3.90% (ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|%RGB%212;40;40m^|%RGB%235;45;45m^|%RGB%255;48;48m^|[1;30m-[0m]                   ^|
) ELSE ECHO.[%RGB%143;33;33m^|%RGB%150;32;32m^|%RGB%161;32;32m^|%RGB%176;33;33m^|%RGB%186;35;35m^|%RGB%196;37;37m^|%RGB%212;40;40m^|%RGB%235;45;45m^|%RGB%255;48;48m^|%RGB%255;56;56m^|[0m]                   ^|
::IF %ENEMY.HP.NOW.1% LEQ 70 (ECHO.[^|^|^|^|^|^|^|^|^|^| ]                  ^|) ELSE ECHO.[^|^|^|^|^|^|^|^|^|^|^|]                  ^|
ECHO.^|    ^|  `.___.'                                                                      %EN.3.LINE.1%                  ^|
ECHO.^|    ^|                                                                               %EN.3.LINE.2%                  ^|
ECHO.^|                                                                                    %EN.3.LINE.3%                  ^|
ECHO.^|                                                                                    %EN.3.LINE.4%                  ^|
ECHO.^|                                                                                    %EN.3.LINE.5%                  ^|
ECHO.^|                                                                                    %EN.3.LINE.6%                  ^|
ECHO.^|                                                                                    %EN.3.LINE.7%                  ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^| DEBUG-MODE-ENABLED.                                                                                               ^|
ECHO.^|___________________________________________________________________________________________________________________^|
ECHO. 
ECHO.CMDS: ATTACK / HEAL(x%PLAYER.ITEM.HEAL%) / BOMB(x%PLAYER.ITEM.BOMB%) / NOTHING / LASER(x%PLAYER.ITEM.LASER%)
ECHO.                                                                                                                     
ECHO.                                                                                                                     
ECHO.                         You dealt %PLAYER.ATTACK.AMOUNT% DMG to %PLAYER.ATTACK.ENEMY%
ECHO.                               CRIT: %ATK.CRIT%
ECHO.                                                                                                                     
ECHO.                                                                                                                     
ECHO. Your HP: %PLAYER.HP.NOW%/%PLAYER.HP.FULL% ^(+%PLAYER.HEAL.AMOUNT% -%ENEMY.ATTACK.AMOUNT%^)
ECHO. Enemy Total HP: %ENEMY.HP.NOW.T%/%ENEMY.HP.FULL.T% ^| 1st Enemy HP: %ENEMY.HP.NOW.1%/%ENEMY.HP.FULL.1% (-%PLAYER.ATTACK.AMOUNT.1%) ^| 2nd Enemy HP: %ENEMY.HP.NOW.2%/%ENEMY.HP.FULL.2% (-%PLAYER.ATTACK.AMOUNT.2%) ^| 3rd Enemy HP: %ENEMY.HP.NOW.3%/%ENEMY.HP.FULL.3% (-%PLAYER.ATTACK.AMOUNT.3%)
ECHO. Enemy dealt %ENEMY.ATTACK.AMOUNT% DMG to you                                                                        
ECHO.                                                                                                                     
ECHO.'-------------------------------------------------------------------------------------------------------------------'
ECHO. [s
ECHO..-------------------------------------------------------------------------------------------------------------------.[2A
IF %ENEMY.HP.NOW.T% LEQ 0 GOTO WIN
IF %PLAYER.HP.NOW% LEQ 0 GOTO LOSE
SET "ADD-CMD=CLS&GOTO IN-BATTLE"
GOTO :EOF