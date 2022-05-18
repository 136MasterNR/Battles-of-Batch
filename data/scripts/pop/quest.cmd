IF NOT DEFINED VERCODE EXIT
SET Q.POPUP.IS=TRUE
FOR /F "TOKENS=5,* DELIMS= " %%A IN ("%*") DO SET Q.POPUP.NAME=%%B
COLOR 08
ECHO.[0;0H[18B[46C   [1;37m.-%RGB%255;248;186m Quest Achieved [1;37m-.
ECHO.[46C[1;37m.---'                '---.
ECHO.[46C[1;37m^|                        ^|[%3C[25D%RGB%179;233;255m%Q.POPUP.NAME%[1;37m
ECHO.[46C[1;37m^|                        ^|
ECHO.[46C[1;37m^|  Rewards:   Porgress:  ^|
ECHO.[46C[1;37m^|                        ^|[23D%RGB%179;233;255m %RGB.COIN%$:[4m%4[0m[1;37m
ECHO.[46C[1;37m^|                        ^|[23D%RGB%179;233;255m%RGB.LVL%XP:[4m%5[0m[1;37m
ECHO.[2A[60C%RGB.TRUE%%1/%2[0m
ECHO.[1B[46C^|                        ^|
ECHO.[46C[1;37m'.__________[4m[sOK[0m[1;37m__________.'
SET /P "=[u"<NUL 
PAUSE>NUL
GOTO :EOF