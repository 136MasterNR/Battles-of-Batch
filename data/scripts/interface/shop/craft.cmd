IF NOT DEFINED VERCODE EXIT
CALL %CRAFT.MNGR% VAR-ITEMS
TITLE %TITLE%Craft Shop
SET /A SEL.Y=(3*%CRAFT.SEL%)+8

IF %CRAFT.NAV% EQU 0 (
	ECHO.[?25l[H[0m.---------------------------------------------.-------.-------.-------.---------------------------------------------.
	ECHO.^|                                           Q ^| [4m[1mCraft[0m ^| Items ^| Skill ^| E                                           ^|
	ECHO.^|                                             '-------'-------'-------'                                             ^|
	ECHO.^|                                                                                                                   ^|
	ECHO.^|    .-----------------------.                                                                                      ^|
	ECHO.^|   /  [1;30mA  ←[0m [1mCRAFT ITEMS[0m →  D  \                   .-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+.                        ^|
	ECHO.^|  :'- - - - - - - - - - - - -':               .-'                                          '-.                     ^|
	ECHO.^|  :.                         .:               :------------: MATERIALS REQUIRED :------------:                     ^|
	ECHO.^|   :        Dustblade        :                ^| ^>                                            ^|                     ^|
	ECHO.^|  :'     Lvl 1 Lame Blade    ':               ^|   Req:      Owned:                           ^|                     ^|
	ECHO.^|  :.                         .:               ^|                                              ^|                     ^|
	ECHO.^|   :       Cold Twill        :                ^| ^>                                            ^|                     ^|
	ECHO.^|  :'    Lvl 2 Basic Pistol   ':               ^|   Req:      Owned:                           ^|                     ^|
	ECHO.^|  :.                         .:               ^|                                              ^|                     ^|
	ECHO.^|   :      [4mComradehammer[0m      :                ^| ^>                                            ^|                     ^|
	ECHO.^|  :'  Lvl 15 Super-Fi Hammer ':               ^|   Req:      Owned:                           ^|                     ^|
	ECHO.^|  :.                         .:               ^|                                              ^|                     ^|
	ECHO.^|   :                         :                : - - - - - - - - - - - - - - - - - - - - - - -:                     ^|
	ECHO.^|  :'                         ':               :               ITEM INFORMATION               :                     ^|
	ECHO.^|  :.                         .:               '-.                                          .-'                     ^|
	ECHO.^|   :                         :                  : - Weapon Type -          - Base Damage - :                       ^|
	ECHO.^|  :'                         ':                 :                                          :                       ^|
	ECHO.^|  :.                         .:                 :                                          :                       ^|
	ECHO.^|   :                         :                  :             - BONUS EFFECT -             :                       ^|
	ECHO.^|  :'                         ':                 :                                          :                       ^|
	ECHO.^|  :.                         .:                 :                                          :                       ^|
	ECHO.^|   :                         :                  :                                          :                       ^|
	ECHO.^|  :'                         ':                 :                                          :                       ^|
	ECHO.^|  :.                         .:                 :                                          :                       ^|
	ECHO.^|   :                         :                  :                                          :                       ^|
	ECHO.^|  :'                         ':                 :             - ITEM HISTORY -             :                       ^|
	ECHO.^|  :.                         .:                 :                                          :                       ^|
	ECHO.^|   :                         :                  :                                          :                       ^|
	ECHO.^|  :'                         ':                 :                                          :                       ^|
	ECHO.^|  :.                         .:                 :                                          :                       ^|
	ECHO.^|   :                         :                  :                                          :                       ^|
	ECHO.^|  :'                         ':                 :                                          :                       ^|
	ECHO.^|  :.                         .:                 :                                          :                       ^|
	ECHO.^|   :                         :                  '------------------------------------------'                       ^|
	ECHO.^|  :' Use W A S D to navigate ':                                                                                    ^|
	ECHO.^|  '---------------------------'            [1;31mTHIS IS A PROTOTYPE, FEATURES ARE TEMPORALLY DISABLED[0m                   ^|
	ECHO.^|                                                                                                                   ^|
	ECHO.^|                                                                                                                   ^|
	ECHO.^|                                                                                                                   ^|
	ECHO.^|                                                                                                                   ^|
	ECHO.^|                                                                                                                   ^|
	ECHO.^|                                                                                                                   ^|
	ECHO.'-------------------------------------------------------------------------------------------------------------------'[1A[?25h
) ELSE ECHO.[1mCRAFT  MISC[0m



ECHO.[%SEL.Y%;31H '---------------'[1B[18D                  [1B[18D                  [1B[17D----------------.

ECHO.[3A[9C^>[15C^<








ECHO.[9;52HReactive Poweder (Lvl 8 Material)[10;57H1000[10;69H1000[12;52HEternal Ethereal (Lvl 40 Material)[13;57H1000[13;69H1000[15;52HLight Resin (Lvl 12 Material)[16;57H1000[16;69H1000[22;53H    Blade    [22;81H  45  [25;52H10%% Chance to deal a total amount of     [26;52H150%% damage.                             [27;52H                                         [28;52H                                         [29;52H                                         [32;52HUnknown.                                 [33;52H                                         [34;52H                                         [35;52H                                         [36;52H                                         [37;52H                                         



























EXIT /B 0