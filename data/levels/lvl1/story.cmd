ECHO.[2J[20;50H[0[1m.
ECHO.[21;49H^|
ECHO.[22;50H'
ECHO.[20;66H.
ECHO.[21;67H^|
ECHO.[22;66H'
SET /P "=[22;52H[0[1m" <NUL
REN "%TXT%" "txt.cmd.cmd"
START /B "" CMD /Q /C CALL "%TXT%.cmd" FADE-IN "Ashes of Home"
TIMEOUT /T 3 >NUL
REN "%TXT%.cmd" "txt.cmd"
CLS
ECHO.[0m
CALL "%TXT%" TYPE /A `This and that.`
ECHO.
ECHO.
::CALL "%TXT%" TYPE /A `The snowstorm is getting pretty bad out there, isn't it?`, Main Character says to Astrid, his wife, while settling into a comfortable chair by the fireplace, gaze fixed on Astrid.
EXIT /B 0
