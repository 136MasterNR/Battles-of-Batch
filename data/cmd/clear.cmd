@ECHO OFF
TASKKILL /F /FI "WINDOWTITLE eq wscript.exe" /T>NUL
CLS
ECHO.[1;1HBattles of Batch [Version %VERCODE% / %VERTYPE% %VERS%]
ECHO.^(^!^) Run "EXIT" to return.[0;0H
VER
@ECHO ON