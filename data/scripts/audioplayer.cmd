@ECHO OFF
TITLE WSAudio.%1
ECHO.WS.AudioPlayer.ID:"%1"
SHIFT
ECHO.Location:"%1 %2 %3 %4 %5 %6 %7 %8 %9"
START /MIN /WAIT "" "%1 %2 %3 %4 %5 %6 %7 %8 %9"
EXIT 0