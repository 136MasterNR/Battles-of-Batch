IF NOT DEFINED VERCODE EXIT
CALL %PLAYERSKILLS.LOAD%
TITLE %TITLE%Upgrades Shop
REM ECHO.[0;0H[0m.------------------------------------------.----------.-------.--------.--------------------------------------------.
REM ECHO.^|                                      	   ^| Upgrades ^| Items ^| [4m[1mSkills[0m ^|                                            ^|
REM ECHO.^|                                          '----------'-------'--------'                                            ^|
ECHO.[0;0H[0m.-------------------------------------------------.-------.--------.------------------------------------------------.
ECHO.^|                                                 ^| Items ^| [4m[1mSkills[0m ^|                                                ^|
ECHO.^|                                                 '-------'--------'                                                ^|
ECHO.^|                                                      .-----.                                                      ^|
ECHO.^|                                   .------------------^|STATS^|-----------------.                                    ^|
ECHO.^|                                   '.                 '-----'                .'                                    ^|
ECHO.^|                                   .'                                        '.                                    ^|[66DLevel: %PLAYER.LVL%
ECHO.^|                                   '.                                        .'                                    ^|[66DMoney: $%PLAYER.MONEY%
ECHO.^|                                    '----------------------------------------'                                     ^|
ECHO.^|                                                                                                                   ^|
ECHO.'.-----------------------------------------------------------------------------------------------------------------.'
ECHO. ^|                                                                                                                 ^| 
ECHO. ^|                                                                                                                 ^| 
ECHO. ^|                                                                                                                 ^| 
ECHO..'-----------------------------------------------------------------------------------------------------------------'.
ECHO.'.-----------------------------------------------------------------------------------------------------------------.'
ECHO. ^|                                                                                                                 ^| 
ECHO. ^|                                                                                                                 ^| 
ECHO. ^|                                                                                                                 ^| 
ECHO..'-----------------------------------------------------------------------------------------------------------------'.
ECHO.'.-----------------------------------------------------------------------------------------------------------------.'
ECHO. ^|                                                                                                                 ^| 
ECHO. ^|                                                                                                                 ^| 
ECHO. ^|                                                                                                                 ^| 
ECHO..'-----------------------------------------------------------------------------------------------------------------'.
ECHO.'.-----------------------------------------------------------------------------------------------------------------.'
ECHO. ^|                                                                                                                 ^| 
ECHO. ^|                                                                                                                 ^| 
ECHO. ^|                                                                                                                 ^| 
ECHO..'-----------------------------------------------------------------------------------------------------------------'.
ECHO.'.-----------------------------------------------------------------------------------------------------------------.'
ECHO. ^|                                                                                                                 ^| 
ECHO. ^|                                                                                                                 ^| 
ECHO. ^|                                                                                                                 ^| 
ECHO..'-----------------------------------------------------------------------------------------------------------------'.
ECHO.^|                              Use "%RGB%10;230;235mup %RGB%100;210;200m{skill}[0m" to upgrade a skill. [1;30mExample: "up attack"[0m                            ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                    ___________________________________________                                    ^|
ECHO.^|                                  .'                                           '.                                  ^|
ECHO.^|                                  ^|             ^> [s[1;30m  Type Here   [0m^<               ^|                                  ^|
ECHO.^|                                  ^|                                             ^|                                  ^|
ECHO.^|                                  '.-------------------------------------------.'                                  ^|
ECHO.^|                                       Type "%RGB%10;230;235mswitch[0m" to switch between tabs.                                       ^|
ECHO.^|                                                                                                                   ^|
ECHO.'-------------------------------------------------------------------------------------------------------------------'[1A
SET /A NEXT.LVL.ATK=%SKILL.ATK%+1
SET /A STAT.NUM.ATK=%SKILL.ATK%*50
SET /A LVL.REQ.ATK=%SKILL.ATK%*%SKILL.ATK.MAXLVL%
SET /A SKILL.COST.ATK=%SKILL.ATK%*%SKILL.ATK.COST%
IF %LVL.REQ.ATK% GEQ 48 SET LVL.REQ.ATK=MAX
IF %PLAYER.LVL% GEQ %LVL.REQ.ATK% (SET C_LVLLOCKED=%RGB%50;204;33m&SET C_LVLLOCKED.NUM=%RGB%128;200;255m) ELSE (SET C_LVLLOCKED=%RGB%255;46;46m&SET C_LVLLOCKED.NUM=[4m%RGB%255;46;46m)
IF %PLAYER.MONEY% GEQ %SKILL.COST.ATK% (SET C_MONELOCKED=%RGB%70;232;110m$) ELSE (SET C_MONELOCKED=%RGB%255;46;46m$[4m)
ECHO.[13;5H%RGB%250;255;184mMain Attack[0m   ==   [1m▸%RGB%143;186;194m%SKILL.ATK%[0m[13;50H[1mEffects[0m: ATK %RGB%138;255;220m+%STAT.NUM.ATK%
IF %LVL.REQ.ATK%==MAX (ECHO.[13;90H%RGB%128;200;255mMaximum Level[0m) ELSE ECHO.[13;92H%C_MONELOCKED%%SKILL.COST.ATK%[0m : %C_LVLLOCKED%↑%C_LVLLOCKED.NUM%%LVL.REQ.ATK%[0m[12;86H%RGB%255;220;180mUpgrade Requirements:[14;89H%RGB%138;146;255mNext Level[0m: [1m▴%RGB%66;142;255m%NEXT.LVL.ATK%
SET /A NEXT.LVL.CRIT_RATE=%SKILL.CRIT_RATE%+1
SET /A STAT.NUM.CRIT_RATE=%SKILL.CRIT_RATE%*5
SET /A LVL.REQ.CRIT_RATE=%SKILL.CRIT_RATE%*%SKILL.CRIT_RATE.MAXLVL%
SET /A SKILL.COST.CRIT_RATE=%SKILL.CRIT_RATE%*%SKILL.CRIT_RATE.COST%
IF %LVL.REQ.CRIT_RATE% GEQ 50 SET LVL.REQ.CRIT_RATE=MAX
IF %PLAYER.LVL% GEQ %LVL.REQ.CRIT_RATE% (SET C_LVLLOCKED=%RGB%50;204;33m&SET C_LVLLOCKED.NUM=%RGB%128;200;255m) ELSE (SET C_LVLLOCKED=%RGB%255;46;46m&SET C_LVLLOCKED.NUM=[4m%RGB%255;46;46m)
IF %PLAYER.MONEY% GEQ %SKILL.COST.CRIT_RATE% (SET C_MONELOCKED=%RGB%70;232;110m$) ELSE (SET C_MONELOCKED=%RGB%255;46;46m$[4m)
ECHO.[18;7H%RGB%250;255;184mCrit Rate[0m   ==   [1m▸%RGB%143;186;194m%SKILL.CRIT_RATE%[0m[18;50H[1mEffects[0m: CRIT_RATE %RGB%138;255;220m+%STAT.NUM.CRIT_RATE%%%
IF %LVL.REQ.CRIT_RATE%==MAX (ECHO.[18;90H%RGB%128;200;255mMaximum Level[0m) ELSE ECHO.[18;92H%C_MONELOCKED%%SKILL.COST.CRIT_RATE%[0m : %C_LVLLOCKED%↑%C_LVLLOCKED.NUM%%LVL.REQ.CRIT_RATE%[0m[17;86H%RGB%255;220;180mUpgrade Requirements:[19;89H%RGB%138;146;255mNext Level[0m: [1m▴%RGB%66;142;255m%NEXT.LVL.CRIT_RATE%
SET /A NEXT.LVL.HP=%SKILL.HP%+1
SET /A STAT.NUM.HP=%SKILL.HP%*100
SET /A LVL.REQ.HP=%SKILL.HP%*%SKILL.HP.MAXLVL%
SET /A SKILL.COST.HP=%SKILL.HP%*%SKILL.HP.COST%
IF %LVL.REQ.HP% GEQ 48 SET LVL.REQ.HP=MAX
IF %PLAYER.LVL% GEQ %LVL.REQ.HP% (SET C_LVLLOCKED=%RGB%50;204;33m&SET C_LVLLOCKED.NUM=%RGB%128;200;255m) ELSE (SET C_LVLLOCKED=%RGB%255;46;46m&SET C_LVLLOCKED.NUM=[4m%RGB%255;46;46m)
IF %PLAYER.MONEY% GEQ %SKILL.COST.HP% (SET C_MONELOCKED=%RGB%70;232;110m$) ELSE (SET C_MONELOCKED=%RGB%255;46;46m$[4m)
ECHO.[23;6H%RGB%250;255;184mMax Health[0m   ==   [1m▸%RGB%143;186;194m%SKILL.HP%[0m[23;50H[1mEffects[0m: HP %RGB%138;255;220m+%STAT.NUM.HP%
IF %LVL.REQ.HP%==MAX (ECHO.[23;90H%RGB%128;200;255mMaximum Level[0m) ELSE ECHO.[23;92H%C_MONELOCKED%%SKILL.COST.HP%[0m : %C_LVLLOCKED%↑%C_LVLLOCKED.NUM%%LVL.REQ.HP%[0m[22;86H%RGB%255;220;180mUpgrade Requirements:[24;89H%RGB%138;146;255mNext Level[0m: [1m▴%RGB%66;142;255m%NEXT.LVL.HP%
GOTO :EOF