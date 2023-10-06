IF NOT DEFINED VERCODE EXIT
CALL %PLAYERSKILLS.LOAD%
START /MIN "RichManager" "%RichManager%" State=Upgrading skills;Details=Shop;LargeImage=preview_skills;LargeImageTooltip=;SmallImage=icon;SmallImageTooltip=Battles of Batch
TITLE %TITLE%Upgrades Shop
(
ECHO.[?25h[H[0m.---------------------------------------------.-------.-------.-------.---------------------------------------------.
ECHO.^|                                             ^| Craft ^| Items ^| [4m[1mSkill[0m ^|                                             ^|
ECHO.^|                                             '-------'-------'-------'                                             ^|
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
ECHO.^|                               Use "%RGB%10;230;235mup %RGB%100;210;200m{skill}[0m" to upgrade a skill. [1;30mExample: "up crit"[0m                             ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|                                    ___________________________________________                                    ^|
ECHO.^|                                  .'                                           '.                                  ^|
ECHO.^|                                  ^|             ^> [s[1;30m  Type Here   [0m^<               ^|                                  ^|
ECHO.^|                                  ^|                                             ^|                                  ^|
ECHO.^|                                  '.-------------------------------------------.'                                  ^|
ECHO.^|                            Type "%RGB%10;230;235mswitch[0m" or the %RGB%10;230;235mname[0m of the tab to switch between tabs.                           ^|
ECHO.^|                                                                                                                   ^|
ECHO.'-------------------------------------------------------------------------------------------------------------------'[1A
)

::ATK
SET LVL.REQ.ATK=
SET SKILL.COST.ATK=
FOR /F "TOKENS=%SKILL.ATK%DELIMS=;" %%I IN ("%SKILL.ATK.LVLS%") DO (
	SET LVL.REQ.ATK=%%I
)
FOR /F "TOKENS=%SKILL.ATK%DELIMS=;" %%I IN ("%SKILL.ATK.COST%") DO (
	SET SKILL.COST.ATK=%%I
)
IF NOT DEFINED LVL.REQ.ATK SET LVL.REQ.ATK=MAX
IF NOT DEFINED SKILL.COST.ATK SET SKILL.COST.ATK=0

SET /A NEXT.LVL.ATK=SKILL.ATK + 1
SET /A STAT.NUM.ATK=SKILL.ATK * SKILL.ATK.BASE

IF %PLAYER.LVL% GEQ %LVL.REQ.ATK% (
	SET C_LVLLOCKED=%RGB%50;204;33m
	SET C_LVLLOCKED.NUM=%RGB%128;200;255m
) ELSE (
	SET C_LVLLOCKED=%RGB%255;46;46m
	SET C_LVLLOCKED.NUM=[4m%RGB%255;46;46m
)
IF %PLAYER.MONEY% GEQ %SKILL.COST.ATK% (
	SET C_MONELOCKED=%RGB%70;232;110m$
) ELSE (
	SET C_MONELOCKED=%RGB%255;46;46m$[4m
)
ECHO.[13;5H%RGB%250;255;184mMain Attack[0m   ==   [1m▸%RGB%143;186;194m%SKILL.ATK%[0m[13;50H[1mEffects[0m: ATK %RGB%138;255;220m+%STAT.NUM.ATK%
IF %LVL.REQ.ATK%==MAX (
	ECHO.[13;90H%RGB%128;200;255mMaximum Level[0m
) ELSE ECHO.[13;92H%C_MONELOCKED%%SKILL.COST.ATK%[0m : %C_LVLLOCKED%↑%C_LVLLOCKED.NUM%%LVL.REQ.ATK%[0m[12;86H%RGB%255;220;180mUpgrade Requirements:[14;89H%RGB%138;146;255mNext Level[0m: [1m▴%RGB%66;142;255m%NEXT.LVL.ATK%

::CRIT
SET LVL.REQ.CRIT_RATE=
SET SKILL.COST.CRIT_RATE=
FOR /F "TOKENS=%SKILL.CRIT_RATE%DELIMS=;" %%I IN ("%SKILL.CRIT_RATE.LVLS%") DO (
	SET LVL.REQ.CRIT_RATE=%%I
)
FOR /F "TOKENS=%SKILL.CRIT_RATE%DELIMS=;" %%I IN ("%SKILL.CRIT_RATE.COST%") DO (
	SET SKILL.COST.CRIT_RATE=%%I
)
IF NOT DEFINED LVL.REQ.CRIT_RATE SET LVL.REQ.CRIT_RATE=MAX
IF NOT DEFINED SKILL.COST.CRIT_RATE SET SKILL.COST.CRIT_RATE=0

SET /A NEXT.LVL.CRIT_RATE=%SKILL.CRIT_RATE%+1
SET /A STAT.NUM.CRIT_RATE=SKILL.CRIT_RATE * SKILL.CRIT_RATE.BASE

IF %LVL.REQ.CRIT_RATE% GEQ 50 SET LVL.REQ.CRIT_RATE=MAX
IF %PLAYER.LVL% GEQ %LVL.REQ.CRIT_RATE% (
	SET C_LVLLOCKED=%RGB%50;204;33m
	SET C_LVLLOCKED.NUM=%RGB%128;200;255m
) ELSE (
	SET C_LVLLOCKED=%RGB%255;46;46m
	SET C_LVLLOCKED.NUM=[4m%RGB%255;46;46m
)
IF %PLAYER.MONEY% GEQ %SKILL.COST.CRIT_RATE% (
	SET C_MONELOCKED=%RGB%70;232;110m$
) ELSE (
	SET C_MONELOCKED=%RGB%255;46;46m$[4m
)
ECHO.[18;7H%RGB%250;255;184mCrit Rate[0m   ==   [1m▸%RGB%143;186;194m%SKILL.CRIT_RATE%[0m[18;50H[1mEffects[0m: CRIT_RATE %RGB%138;255;220m+%STAT.NUM.CRIT_RATE%%%
IF %LVL.REQ.CRIT_RATE%==MAX (
	ECHO.[18;90H%RGB%128;200;255mMaximum Level[0m
) ELSE ECHO.[18;92H%C_MONELOCKED%%SKILL.COST.CRIT_RATE%[0m : %C_LVLLOCKED%↑%C_LVLLOCKED.NUM%%LVL.REQ.CRIT_RATE%[0m[17;86H%RGB%255;220;180mUpgrade Requirements:[19;89H%RGB%138;146;255mNext Level[0m: [1m▴%RGB%66;142;255m%NEXT.LVL.CRIT_RATE%

::HP
SET LVL.REQ.HP=
SET SKILL.COST.HP=
FOR /F "TOKENS=%SKILL.HP%DELIMS=;" %%I IN ("%SKILL.HP.LVLS%") DO (
	SET LVL.REQ.HP=%%I
)
FOR /F "TOKENS=%SKILL.HP%DELIMS=;" %%I IN ("%SKILL.HP.COST%") DO (
	SET SKILL.COST.HP=%%I
)
IF NOT DEFINED LVL.REQ.HP SET LVL.REQ.HP=MAX
IF NOT DEFINED SKILL.COST.HP SET SKILL.COST.HP=0

SET /A NEXT.LVL.HP=SKILL.HP+1
SET /A STAT.NUM.HP=SKILL.HP*SKILL.HP.BASE

IF %LVL.REQ.HP% GEQ 48 SET LVL.REQ.HP=MAX
IF %PLAYER.LVL% GEQ %LVL.REQ.HP% (
	SET C_LVLLOCKED=%RGB%50;204;33m
	SET C_LVLLOCKED.NUM=%RGB%128;200;255m
) ELSE (
	SET C_LVLLOCKED=%RGB%255;46;46m
	SET C_LVLLOCKED.NUM=[4m%RGB%255;46;46m
)
IF %PLAYER.MONEY% GEQ %SKILL.COST.HP% (
	SET C_MONELOCKED=%RGB%70;232;110m$
) ELSE (
	SET C_MONELOCKED=%RGB%255;46;46m$[4m
)
ECHO.[23;6H%RGB%250;255;184mMax Health[0m   ==   [1m▸%RGB%143;186;194m%SKILL.HP%[0m[23;50H[1mEffects[0m: HP %RGB%138;255;220m+%STAT.NUM.HP%
IF %LVL.REQ.HP%==MAX (
	ECHO.[23;90H%RGB%128;200;255mMaximum Level[0m
) ELSE ECHO.[23;92H%C_MONELOCKED%%SKILL.COST.HP%[0m : %C_LVLLOCKED%↑%C_LVLLOCKED.NUM%%LVL.REQ.HP%[0m[22;86H%RGB%255;220;180mUpgrade Requirements:[24;89H%RGB%138;146;255mNext Level[0m: [1m▴%RGB%66;142;255m%NEXT.LVL.HP%

::Storage
SET LVL.REQ.STO=
SET SKILL.COST.STO=
FOR /F "TOKENS=%SKILL.STO%DELIMS=;" %%I IN ("%SKILL.STO.LVLS%") DO (
	SET LVL.REQ.STO=%%I
)
FOR /F "TOKENS=%SKILL.STO%DELIMS=;" %%I IN ("%SKILL.STO.COST%") DO (
	SET SKILL.COST.STO=%%I
)
IF NOT DEFINED LVL.REQ.STO SET LVL.REQ.STO=MAX
IF NOT DEFINED SKILL.COST.STO SET SKILL.COST.STO=0

SET /A NEXT.LVL.STO=SKILL.STO+1
SET /A STAT.NUM.STO=SKILL.STO*SKILL.STO.BASE

IF %LVL.REQ.STO% GEQ 48 SET LVL.REQ.STO=MAX
IF %PLAYER.LVL% GEQ %LVL.REQ.STO% (
	SET C_LVLLOCKED=%RGB%50;204;33m
	SET C_LVLLOCKED.NUM=%RGB%128;200;255m
) ELSE (
	SET C_LVLLOCKED=%RGB%255;46;46m
	SET C_LVLLOCKED.NUM=[4m%RGB%255;46;46m
)
IF %PLAYER.MONEY% GEQ %SKILL.COST.STO% (
	SET C_MONELOCKED=%RGB%70;232;110m$
) ELSE (
	SET C_MONELOCKED=%RGB%255;46;46m$[4m
)
ECHO.[28;6H%RGB%250;255;184mMax Health[0m   ==   [1m▸%RGB%143;186;194m%SKILL.STO%[0m[28;50H[1mEffects[0m: STORAGE %RGB%138;255;220m×%STAT.NUM.STO%
IF %LVL.REQ.STO%==MAX (
	ECHO.[28;90H%RGB%128;200;255mMaximum Level[0m
) ELSE ECHO.[28;92H%C_MONELOCKED%%SKILL.COST.STO%[0m : %C_LVLLOCKED%↑%C_LVLLOCKED.NUM%%LVL.REQ.STO%[0m[27;86H%RGB%255;220;180mUpgrade Requirements:[29;89H%RGB%138;146;255mNext Level[0m: [1m▴%RGB%66;142;255m%NEXT.LVL.STO%

EXIT /B 0