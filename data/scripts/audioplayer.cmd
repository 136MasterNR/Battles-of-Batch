@ECHO OFF
TITLE WSAudio.%1
SHIFT
ECHO.WS.AudioPlayer.ID:"%1"
START /MIN /WAIT "" "%1 %2 %3 %4 %5 %6 %7 %8 %9"
EXIT 0