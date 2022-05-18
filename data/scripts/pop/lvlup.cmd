IF NOT DEFINED VERCODE EXIT
COLOR 08
ECHO.[1;37m[27A[49C   .-%RGB%255;248;186m Congrats [1;37m-.
ECHO.[49C.---'          '---.
ECHO.[49C^|   %RGB%0;255;0m↑ %RGB%0;153;255mLevel UP![1;37m    ^|
ECHO.[49C^|                  ^|
ECHO.[66C  ^|[69D[49C^| %RGB%179;233;255mYou are level %RGB%128;200;255m[4m%PLAYER.LVL%[0m[1;37m
ECHO.[49C^|                  ^|
ECHO.[49C'._______[4m[sOK[0m[1;37m_______.'
SET /P "=[u"<NUL
PAUSE>NUL
SET OLD.PLAYER.LVL=%PLAYER.LVL%
GOTO :EOF