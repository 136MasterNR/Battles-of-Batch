IF NOT DEFINED VERCODE EXIT
CALL :%*
EXIT /B 0



:ADD <"Quest Name": String> <"Value": String>
SETLOCAL ENABLEDELAYEDEXPANSION

IF DEFINED QST.%1 (
	FOR /F "TOKENS=1,2DELIMS=;" %%A IN ("!QST.%1!") DO (
		SET /A QST.%1=%%A+%2
		SET QST.%1=!QST.%1!;%%B
	)
) ELSE (
	SET QST.%1=%2;0
	CALL :POP-NEW %1
)
CALL :UPDATE
FOR /F "TOKENS=1,2DELIMS=;" %%1 IN ("!QST.%1!") DO IF %%1 GEQ !QST_REQUIRE.%1! (
	IF %%2 EQU 0 (
		ENDLOCAL
		CALL :READ
		CALL :CLAIM %1 %%A
	) ELSE ENDLOCAL
) ELSE ENDLOCAL

CALL :READ

EXIT /B 0



:UPDATE
CALL "%IO%" REFRESH "%DATA_SAVES%\QUESTS" QST.
EXIT /B 0



:READ
FOR /F "TOKENS=1DELIMS==" %%A IN ('SET QST. 2^>NUL') DO SET %%A=
CALL "%IO%" READ "%DATA_SAVES%\QUESTS" QST.
EXIT /B 0



:CLAIM <"Quest Name": String>
SET /A PLAYER.MONEY=PLAYER.MONEY+QST_MONEY.%1
CALL "%SAVE%" "FILE=%DATA_SAVES%\PLAYERDATA.cmd" 1 /A PLAYER.MONEY= %PLAYER.MONEY%
SET /A PLAYER.XP=PLAYER.XP+QST_EXP.%1
CALL "%SAVE%" "FILE=%DATA_SAVES%\PLAYERDATA.cmd" 2 /A PLAYER.XP= %PLAYER.XP%

SETLOCAL ENABLEDELAYEDEXPANSION

IF DEFINED QST.%1 (
	FOR /F "TOKENS=1DELIMS=;" %%A IN ("!QST.%1!") DO (
		SET QST.%1=%%A;1
	)
) ELSE (
	ENDLOCAL
	EXIT /B 1
)
CALL :UPDATE

COLOR 08
ECHO.[0;0H[18B[46C   [1;37m.-%RGB%255;248;186m Quest Achieved [1;37m-.
ECHO.[46C[1;37m.---'                '---.
ECHO.[46C[1;37m^|                        ^|[%3C[25D%RGB%179;233;255m!QST_NAME.%1![1;37m
ECHO.[46C[1;37m^|                        ^|
ECHO.[46C[1;37m^|  Rewards:   Progress:  ^|
ECHO.[46C[1;37m^|                        ^|[23D%RGB%179;233;255m %RGB.COIN%$:[4m!QST_MONEY.%1![0m[1;37m
ECHO.[46C[1;37m^|                        ^|[23D%RGB%179;233;255m%RGB.LVL%XP:[4m!QST_EXP.%1![0m[1;37m
FOR /F "TOKENS=1DELIMS=;" %%A IN ("!QST.%1!") DO ECHO.[2A[60C%RGB.TRUE%%%A/!QST_REQUIRE.%1![0m
ECHO.[1B[46C^|                        ^|
ECHO.[46C[1;37m'.__________[4m[sOK[0m[1;37m__________.'
SET /P "=[u"<NUL 
PAUSE>NUL

ENDLOCAL
EXIT /B 0



:POP-NEW
COLOR 08
ECHO.[0;0H[18B[46C   [1;37m.- -%RGB%255;248;186m New Quest [1;37m- -.
ECHO.[46C[1;37m.---'                '---.
ECHO.[46C[1;37m^|                        ^|[%3C[25D%RGB%179;233;255m!QST_NAME.%1![1;37m
ECHO.[46C[1;37m^|                        ^|
ECHO.[46C[1;37m^|       Progress:        ^|
ECHO.[46C[1;37m^|                        ^|
FOR /F "TOKENS=1DELIMS=;" %%A IN ("!QST.%1!") DO ECHO.[1A[55C%RGB.TRUE%%%A/!QST_REQUIRE.%1![0m
ECHO.[46C[1;37m^|                        ^|
ECHO.[46C[1;37m'.__________[4m[sOK[0m[1;37m__________.'
SET /P "=[u"<NUL 
PAUSE>NUL
CLS
EXIT /B 0



:BUFFER
FOR /F "TOKENS=1,*DELIMS==" %%1 IN ('TYPE "%DATA_SCRIPTS%\raw\quests.ini"') DO CALL :BUFFER-NEXT %%1 %%2
EXIT /B 0
:BUFFER-NEXT
SET TMP.TEXT=%1
IF NOT DEFINED TMP.TEXT EXIT /B 0

IF %TMP.TEXT:~0,1%]==[] SET TMP.CAT=%TMP.TEXT:]=%
IF %TMP.TEXT:~0,1%]==[] (
	SET TMP.CAT=%TMP.CAT:[=%
	EXIT /B 0
)

SET TMP.TEXT=%2
SET TMP.TEXT=%TMP.TEXT:"=%

SET QST_%1.%TMP.CAT%=%TMP.TEXT%

SET TMP.TEXT=
EXIT /B 0