REM : Speical thanks to Grub4K for providing us with this open source code.
REM : Find it here: https://gist.github.com/Grub4K/2d3f5875c488164b44454cbf37deae80
REM : I WAS NOT GIVEN RIGHTS TO USE THIS CODE, CONTACT US IF YOU DON'T WANT US TO USE THIS CODE!

IF NOT DEFINED VERCODE EXIT
SETLOCAL ENABLEDELAYEDEXPANSION
SET "PROMPT="
SET "SYMBOL="
SET "LENGTH="
SET "ALLOWED=qwertyuiopasdfghjklzxcmvbn1234567890_ "
SET "INVALID="

:: PARSE FLAGS DICT
:FLAGS
IF NOT "%~1" == "" (
    SET "%~1"
    SHIFT
    GOTO FLAGS
)
:: FETCH NEEDED CHARACTERS
FOR /F %%A IN ('COPY /Z "%COMSPEC%" NUL') DO SET "CR=%%A"
FOR /F %%A IN ('"PROMPT $H&FOR %%B IN (1) DO REM"') DO SET "BS=%%A"
:: START OF PROGRAM
IF NOT DEFINED SYMBOL (
    SET "SYMBOL=^!KEY^!"
)
SET "INPUT=."
>CON <NUL SET /P "=.!BS! !BS!!PROMPT!"
:INPUT
SET "KEY="
FOR /F "DELIMS=" %%A IN ('XCOPY /W "!COMSPEC!" "!COMSPEC!" 2^>NUL') DO (
    IF NOT DEFINED KEY SET "KEY=%%A^!"
)
IF !KEY:~-1!==^^ (
    SET "KEY=^"
) ELSE SET "KEY=!KEY:~-2,1!"
IF !KEY! EQU !BS! (
    IF NOT "!INPUT!" == "." (
        SET "INPUT=!INPUT:~0,-1!"
        <NUL SET /P "=!BS! !BS!" >CON
    )
) ELSE IF !KEY! EQU !CR! (
    >CON ECHO:
    ECHO:!INPUT:~1!
    EXIT /B 0
) ELSE (
    IF DEFINED LENGTH (
        IF "!INPUT:~-%LENGTH%!" NEQ "!INPUT!" (
            GOTO INPUT
        )
    )
    FOR %%A IN ("!KEY!") DO (
        IF DEFINED ALLOWED (
            IF "!ALLOWED:%%~A=!" EQU "!ALLOWED!" (
                GOTO INPUT
            )
        ) ELSE (
            IF DEFINED INVALID (
                IF "!INVALID:%%~A=!" NEQ "!INVALID!" (
                    GOTO INPUT
                )
            )
        )
        SET "INPUT=!INPUT!!KEY!"
		>CON <NUL SET /P "=.!BS! !BS!%SYMBOL%"
    )
)
CALL :DETECT-HILIGHT
GOTO INPUT
REM : The code is midified from this point and on.
:DETECT-HILIGHT
IF DEFINED HIGHLIGHT (
	>CON <NUL SET /P "=.[u[1D %INPUT:~1%[1;37m [1D"
	SET HIGHLIGHT=
)
IF "%INPUT_PART%"=="items" (
	IF NOT "%INPUT_TXT%]"=="%INPUT_PART%]" (
		>CON <NUL SET /P "=.            [13D [1D"
		SET INPUT_TXT=%INPUT_PART%
	)
	IF /I "%INPUT:~1,4%"=="BUY " (
		SET "HIGHLIGHT=%RGB.LVL%"
		>CON <NUL SET /P "=.[u!HIGHLIGHT!%INPUT:~1,4%%RGB.COIN%%INPUT:~5%[1;37m [1D"
	) ELSE IF /I "%INPUT:~1%"=="BUY" CALL :SUPERHIGHTLIGHT %RGB.LVL%
	IF /I "%INPUT:~1,5%"=="BOMB " (
		SET "HIGHLIGHT=%RGB.LVL%"
		>CON <NUL SET /P "=.[u!HIGHLIGHT!%INPUT:~1,5%%RGB.COIN%%INPUT:~6%[1;37m [1D"
	) ELSE IF /I "%INPUT:~1%"=="BOMB" CALL :SUPERHIGHTLIGHT %RGB.LVL%
	IF /I "%INPUT:~1,5%"=="HEAL " (
		SET "HIGHLIGHT=%RGB.LVL%"
		>CON <NUL SET /P "=.[u!HIGHLIGHT!%INPUT:~1,5%%RGB.COIN%%INPUT:~6%[1;37m [1D"
	) ELSE IF /I "%INPUT:~1%"=="HEAL" CALL :SUPERHIGHTLIGHT %RGB.LVL%
	IF /I "%INPUT:~1%"=="SWITCH" CALL :SUPERHIGHTLIGHT %RGB%10;230;235m
	IF /I "%INPUT:~1%"=="SKILLS" CALL :SUPERHIGHTLIGHT %RGB%10;230;235m
	IF /I "%INPUT:~1%"=="BACK" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	IF /I "%INPUT:~1%"=="EXIT" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	IF /I "%INPUT:~1%"=="QUIT" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	IF /I "%INPUT:~1%"=="RE" CALL :SUPERHIGHTLIGHT [1;30m
)
IF "%INPUT_PART%"=="skills" (
	IF NOT "%INPUT_TXT%]"=="%INPUT_PART%]" (
		>CON <NUL SET /P "=.            [13D [1D"
		SET INPUT_TXT=%INPUT_PART%
	)
	IF /I "%INPUT:~1,3%"=="UP " (
		SET "HIGHLIGHT=[1D▴%RGB.LVL%"
		>CON <NUL SET /P "=.[u!HIGHLIGHT!%INPUT:~1,3%%RGB.COIN%%INPUT:~4%[1;37m [1D"
	) ELSE IF /I "%INPUT:~1%"=="UP" CALL :SUPERHIGHTLIGHT [1D▴%RGB.LVL%
	IF /I "%INPUT:~1%"=="SWITCH" CALL :SUPERHIGHTLIGHT %RGB%10;230;235m
	IF /I "%INPUT:~1%"=="ITEMS" CALL :SUPERHIGHTLIGHT %RGB%10;230;235m
	IF /I "%INPUT:~1%"=="EXIT" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	IF /I "%INPUT:~1%"=="BACK" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	IF /I "%INPUT:~1%"=="QUIT" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	IF /I "%INPUT:~1%"=="RE" CALL :SUPERHIGHTLIGHT [1;30m
)
IF "%INPUT_PART%"=="options" (
	IF /I "%INPUT:~1,7%"=="VOLUME " (
		SET "HIGHLIGHT=%RGB%187;203;250m"
		>CON <NUL SET /P "=.[u!HIGHLIGHT!%INPUT:~1,7%%RGB.COIN%%INPUT:~8%[1;37m [1D"
	) ELSE IF /I "%INPUT:~1%"=="VOLUME" CALL :SUPERHIGHTLIGHT %RGB%187;203;250m
	IF /I "%INPUT:~1%"=="UPDATE" CALL :SUPERHIGHTLIGHT %RGB%187;203;250m
	IF /I "%INPUT:~1%"=="UPDATER" CALL :SUPERHIGHTLIGHT %RGB%187;203;250m
	IF /I "%INPUT:~1%"=="KEYS" CALL :SUPERHIGHTLIGHT %RGB%187;203;250m
	IF /I "%INPUT:~1%"=="MUSIC" CALL :SUPERHIGHTLIGHT %RGB%187;203;250m
	IF /I "%INPUT:~1%"=="AUDIO" CALL :SUPERHIGHTLIGHT %RGB%187;203;250m
	IF /I "%INPUT:~1%"=="SHORTCUT KEYS" CALL :SUPERHIGHTLIGHT %RGB%187;203;250m
	IF /I "%INPUT:~1%"=="EXIT" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	IF /I "%INPUT:~1%"=="BACK" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	IF /I "%INPUT:~1%"=="QUIT" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	IF /I "%INPUT:~1%"=="REFRESH" CALL :SUPERHIGHTLIGHT [1;30m
)
GOTO :EOF
:SUPERHIGHTLIGHT
SET "HIGHLIGHT=%*"
>CON <NUL SET /P "=.[u!HIGHLIGHT!%INPUT:~1%[1;37m%EXTENDED_HIGHLIGHT% [1D"
SET "EXTENDED_HIGHLIGHT="
GOTO :EOF
REM IF "%INPUT_PART%"=="menu" (
	REM SET /A CNT+=1
	REM IF /I "%INPUT:~1%"=="PLAY" CALL :SUPERHIGHTLIGHT %RGB%128;210;255m
	REM IF /I "%INPUT:~1%"=="START" CALL :SUPERHIGHTLIGHT %RGB%128;210;255m
	REM IF /I "%INPUT:~1%"=="SHOP" CALL :SUPERHIGHTLIGHT %RGB%105;255;147m
	REM IF /I "%INPUT:~1%"=="SKILLS" CALL :SUPERHIGHTLIGHT %RGB%105;255;147m
	REM IF /I "%INPUT:~1%"=="ITEMS" CALL :SUPERHIGHTLIGHT %RGB%105;255;147m
	REM IF /I "%INPUT:~1%"=="OPTIONS" CALL :SUPERHIGHTLIGHT %RGB%249;241;165m
	REM IF /I "%INPUT:~1%"=="SETTINGS" CALL :SUPERHIGHTLIGHT %RGB%249;241;165m
	REM IF /I "%INPUT:~1%"=="SETTING" CALL :SUPERHIGHTLIGHT %RGB%249;241;165m
	REM IF /I "%INPUT:~1%"=="OPTION" CALL :SUPERHIGHTLIGHT %RGB%249;241;165m
	REM IF /I "%INPUT:~1%"=="PREFERENCE" CALL :SUPERHIGHTLIGHT %RGB%249;241;165m
	REM IF /I "%INPUT:~1%"=="PREFERENCES" CALL :SUPERHIGHTLIGHT %RGB%249;241;165m
	REM IF /I "%INPUT:~1%"=="SET" CALL :SUPERHIGHTLIGHT %RGB%249;241;165m
	REM IF /I "%INPUT:~1%"=="QUESTS" CALL :SUPERHIGHTLIGHT %RGB%138;167;255m
	REM IF /I "%INPUT:~1%"=="MAP" CALL :SUPERHIGHTLIGHT %RGB%128;210;255m
	REM IF /I "%INPUT:~1%"=="FIGHT" CALL :SUPERHIGHTLIGHT %RGB%128;210;255m
	REM IF /I "%INPUT:~1%"=="BATTLE" CALL :SUPERHIGHTLIGHT %RGB%128;210;255m
	REM IF /I "%INPUT:~1%"=="START GAME" CALL :SUPERHIGHTLIGHT %RGB%128;210;255m
	REM IF /I "%INPUT:~1%"=="HTS" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	REM IF /I "%INPUT:~1%"=="CHEATS" CALL :SUPERHIGHTLIGHT [1;30m
	REM IF /I "%INPUT:~1%"=="CREDITS" CALL :SUPERHIGHTLIGHT [1;30m
	REM IF /I "%INPUT:~1%"=="CMD" CALL :SUPERHIGHTLIGHT [1;30m
	REM IF /I "%INPUT:~1%"=="EXIT" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	REM IF /I "%INPUT:~1%"=="QUIT" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	REM IF /I "%INPUT:~1%"=="RESTART" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	REM IF /I "%INPUT:~1%"=="RE" CALL :SUPERHIGHTLIGHT [1;30m
	REM IF /I "%INPUT:~1%"=="UPDATE" CALL :SUPERHIGHTLIGHT [1;30m
	REM IF "%INPUT:~1%"=="FUCK YOU" (
		REM SET "EXTENDED_HIGHLIGHT=[3DME "
		REM CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	REM ) ELSE IF /I "%INPUT:~1%"=="FUCK YOU" (
		REM SET "EXTENDED_HIGHLIGHT=[3Dme "
		REM CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	REM )
	REM IF /I "%INPUT:~1%"=="I HATE THIS GAME" (
		REM SET "EXTENDED_HIGHLIGHT=[16D%RGB.TRUE%I LOVE THIS GAME[1;37m"
		REM CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	REM )
REM )
REM IF "%INPUT_PART%"=="map" (
	REM IF /I "%INPUT:~1,8%"=="CHAPTER " (
		REM SET "HIGHLIGHT=%RGB.LVL%"
		REM >CON <NUL SET /P "=.[u!HIGHLIGHT!%INPUT:~1,8%%RGB.COIN%%INPUT:~9%[1;37m [1D"
	REM ) ELSE IF /I "%INPUT:~1%"=="CHAPTER" CALL :SUPERHIGHTLIGHT %RGB.LVL%
	REM IF /I "%INPUT:~1%"=="START" CALL :SUPERHIGHTLIGHT %RGB.TRUE%
	REM IF /I "%INPUT:~1%"=="PLAY" CALL :SUPERHIGHTLIGHT %RGB.TRUE%
	REM IF /I "%INPUT:~1%"=="EXIT" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	REM IF /I "%INPUT:~1%"=="QUIT" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	REM IF /I "%INPUT:~1%"=="BACK" CALL :SUPERHIGHTLIGHT %RGB.FALSE%
	REM IF /I "%INPUT:~1%"=="RE" CALL :SUPERHIGHTLIGHT [1;30m
	REM IF /I "%INPUT:~1%"=="FORWARD" CALL :SUPERHIGHTLIGHT %RGB.LVL%
	REM IF /I "%INPUT:~1%"=="PREV" CALL :SUPERHIGHTLIGHT %RGB.LVL%
REM )