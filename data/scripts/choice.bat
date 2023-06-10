REM : Special thanks to Grub4K for the xcopy input method! (https://gist.github.com/Grub4K/2d3f5875c488164b44454cbf37deae80)

SETLOCAL ENABLEDELAYEDEXPANSION
SET "KEY="

::Set timeout if /t used
IF /I "%1."=="/T." START "CHOICE_AUTO_SKIP" /MIN CMD /C TIMEOUT /T %2^&TASKKILL /IM xcopy.exe /F

::Get user input - provided by Grub4K
FOR /F "DELIMS=" %%A IN ('XCOPY /W "!COMSPEC!" "!COMSPEC!" 2^>NUL ^|^| ECHO.TIMEOUT') DO (
	IF NOT DEFINED KEY SET "KEY=%%A^!"
)
IF !KEY:~-1!==^^ (
	::Escape the escape character, "caret"
	SET "KEY=CARET"
) ELSE IF "!KEY:~-2!"=="&^!" (
	::Escape the seperator character, "and"
	SET "KEY=AND"
) ELSE IF "!KEY:~-8,7!."=="TIMEOUT." (
	::If /T is used and times out, return it
	SET KEY=TIMEOUT
) ELSE (
	::Take out the key from the xcopy message
	SET "KEY=!KEY:~-2,1!"
)

IF /I "%1."=="/T." TASKKILL /FI "WINDOWTITLE eq CHOICE_AUTO_SKIP*" /IM cmd.exe 1>NUL
::Make key returns more understandable
IF NOT DEFINED KEY SET KEY=BLANK
IF "!KEY!."==" ." SET KEY=SPACE
IF "!KEY!."=="	." SET KEY=TAB

::Pass the key variable outside the current local enviroment
ENDLOCAL&SET CHOICE.INPUT=%KEY%
EXIT /B