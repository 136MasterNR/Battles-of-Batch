@ECHO.
@FOR /F %%I IN ('DIR /B /A *.cmd') DO @(
	@CALL :%%I %%~nsI||ECHO.%%~nsI - [38;2;238;75;43m^(!^) Unknown Script ^(!^)[0m ^(CMD^)
)
@FOR /F %%I IN ('DIR /B /A *.bat') DO @(
	@CALL :%%I %%~nI||ECHO.%%~nI - [38;2;238;75;43m^(!^) Unknown Script ^(!^)[0m ^(BAT^)
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

:audio.cmd
@ECHO.%1 - [38;2;65;253;254mTaskkill all audio tasks played by wscript.exe.[0m (CMD)
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