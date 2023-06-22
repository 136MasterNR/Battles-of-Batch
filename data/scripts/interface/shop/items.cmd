IF NOT DEFINED VERCODE EXIT
TITLE %TITLE%Items Shop
CALL "%ITEMS.LOADER%" LIST
(
ECHO.[?25l[H[0m.---------------------------------------------.-------.-------.-------.---------------------------------------------.
ECHO.^|                                             ^| Craft ^| [4m[1mItems[0m ^| Skill ^|                                             ^|
ECHO.^|                                             '-------'-------'-------'                                             ^|
ECHO.^|                                                      .-----.                                                      ^|
ECHO.^|                                   .------------------^|STATS^|-----------------.                                    ^|
ECHO.^|                                   '.                 '-----'                .'                                    ^|
ECHO.^|                                   .'                                        '.                                    ^|[66DLevel: %PLAYER.LVL%
ECHO.^|                                   '.                                        .'                                    ^|[66DMoney: $%PLAYER.MONEY%
ECHO.^|                                    '----------------------------------------'                                     ^|
ECHO.^|                                                                                                                   ^|
ECHO.^|      :----------------------:              .-.---------------------.-.               .--------------------.       ^|
ECHO.'.-----' Weapons ╀ Explosives '-----.  .----' '  Ͼrafting  Materials  ' '----.  .-----'-.  Potion Ϫ Misc.  .-'-----.'
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO. ^|                                  ^|  ^|                                     ^|  ^|                                  ^| 
ECHO..'----------------------------------'  '-------------------------------------'  '----------------------------------'.
ECHO.^|                               Use "%RGB%10;230;235mbuy %RGB%100;210;200m{item}[0m" to buy an item. [1;30mExample: "buy bomb 5"[0m                              ^|
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
ECHO.'-------------------------------------------------------------------------------------------------------------------'[3A
)
IF %PLAYER.LVL% GEQ %SHOP.LVLREQ.BOMB% (SET C_LVLLOCKED=%RGB.CYAN%&SET C_LVLLOCKED.NUM=[1m) ELSE (SET C_LVLLOCKED=%RGB.RED%&SET C_LVLLOCKED.NUM=[4m%RGB%255;46;46m)
IF %PLAYER.MONEY% GEQ %SHOP.PRICE.BOMB% (SET C_MONELOCKED=%RGB.GREEN%$) ELSE (SET C_MONELOCKED=%RGB.RED%$[4m)
IF DEFINED ITEM.REG_LVL.BOMB (SET "UI.SHOP=%ITEM.REG_LVL.BOMB%") ELSE SET "UI.SHOP=0")
ECHO.[32A[3C%RGB%255;255;255mBomb[0m : %C_MONELOCKED%100[0m : %C_LVLLOCKED%↑[0m%C_LVLLOCKED.NUM%%SHOP.LVLREQ.BOMB%[0m        [%RGB%143;186;194m%UI.SHOP%[0m/%RGB%143;186;194m%SHOP.MAX.BOMB%[0m]

IF %PLAYER.LVL% GEQ %SHOP.LVLREQ.HEAL% (SET C_LVLLOCKED=%RGB.CYAN%&SET C_LVLLOCKED.NUM=[1m) ELSE (SET C_LVLLOCKED=%RGB.RED%&SET C_LVLLOCKED.NUM=[4m%RGB%255;46;46m)
IF %PLAYER.MONEY% GEQ %SHOP.PRICE.HEAL% (SET C_MONELOCKED=%RGB.GREEN%$) ELSE (SET C_MONELOCKED=%RGB.RED%$[4m)
IF DEFINED ITEM.REG_LVL.HEAL (SET "UI.SHOP=%ITEM.REG_LVL.HEAL%") ELSE SET "UI.SHOP=0")
ECHO.[1A[82C%RGB%255;255;255mHeal[0m : %C_MONELOCKED%10[0m : %C_LVLLOCKED%↑[0m%C_LVLLOCKED.NUM%%SHOP.LVLREQ.HEAL%[0m         [%RGB%143;186;194m%UI.SHOP%[0m/%RGB%143;186;194m%SHOP.MAX.HEAL%[0m]

EXIT /B 0