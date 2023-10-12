@ECHO.
@FOR /F %%I IN ('DIR /B /A *.cmd') DO @(
	@(CALL :%%I %%~nI)||ECHO.%%~nI - [38;2;238;75;43m^(!^) Unknown Script ^(!^)[0m ^(CMD^)
)
@FOR /F %%I IN ('DIR /B /A *.bat') DO @(
	@(CALL :%%I %%~nI)||ECHO.%%~nI - [38;2;238;75;43m^(!^) Unknown Script ^(!^)[0m ^(BAT^)
)
@EXIT /B 0

:bobfetch.cmd
@ECHO.%1 - [38;2;65;253;254mShow device information.[0m (CMD)
@EXIT /B 0

:commands.cmd
@ECHO.%1 - [38;2;65;253;254mShow a list of commands and their description.[0m (CMD)
@EXIT /B 0

:movie.cmd
@ECHO.%1 - [38;2;65;253;254mPlay the youtube music video "Dangerous Plains" by pedi me arxes.[0m (CMD)
@EXIT /B 0

:clear.cmd
@ECHO.%1 - [38;2;65;253;254mClear this console window, alternative for cls.[0m (CMD)
@EXIT /B 0

:debug.cmd
@ECHO.%1 - [38;2;65;253;254mEnable manual debugging mode.[0m (CMD)
@EXIT /B 0

:import.cmd
@ECHO.%1 - [38;2;65;253;254mImport an ANSI sequence. Usage: "import myfile"[0m (CMD)
@EXIT /B 0

:script.cmd
@ECHO.%1 - [38;2;65;253;254mLoad any script from the game's data files and give it parameters. [38;2;238;75;43m^(!^) Dangerous (!)[0m (CMD)
@EXIT /B 0

:lookup.cmd
@ECHO.%1 - [38;2;65;253;254mGet info of a host's IP.[0m (CMD)
@EXIT /B 0

:weather.cmd
@ECHO.%1 - [38;2;65;253;254mShow the weather report.[0m (CMD)
@EXIT /B 0

:rgb_regular_hsv.bat
@ECHO.%1 - [38;2;65;253;254mRainbow, using a specific algorithm.[0m (BAT)
@EXIT /B 0

:open.cmd
@ECHO.%1 - [38;2;65;253;254mSearch for a folder, and open it. Can take up to 1 string argument.[0m (BAT)
@EXIT /B 0

:dlc.cmd
@ECHO.%1 - [38;2;65;253;254mDLC Manager, for development purposes.[0m (CMD)
@EXIT /B 0

:anime.cmd
@ECHO.%1 - [38;2;65;253;254mA multi-framed colored animation made in ANSI.[0m (CMD)
@EXIT /B 0

:image.cmd
@ECHO.%1 - [38;2;65;253;254mA colored image made in ANSI.[0m (CMD)
@EXIT /B 0

:leveleditor.cmd
@ECHO.%1 - [38;2;65;253;254mEdit the selected level.[0m (CMD)
@EXIT /B 0

:cver.cmd
@ECHO.%1 - [38;2;65;253;254mChange game version.[0m (CMD)
@EXIT /B 0

:save.cmd
@ECHO.%1 - [38;2;65;253;254mCarry all new or changed variables outside this CMD enviroment.[0m (CMD)
@EXIT /B 0

:say.cmd
@ECHO.%1 - [38;2;65;253;254mAlternative for echo.[0m (CMD)
@EXIT /B 0
