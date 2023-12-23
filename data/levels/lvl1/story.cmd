ECHO.[2J[20;50H[0[1m.
ECHO.[21;49H^|
ECHO.[22;50H'
ECHO.[20;66H.
ECHO.[21;67H^|
ECHO.[22;66H'

:: Fade animation
SET /P "=[22;52H[0[1m" <NUL
REN "%TXT%" "txt.cmd.cmd"
START /B "" CMD /Q /C CALL "%TXT%.cmd" FADE-IN "Ashes of Home"
TIMEOUT /T 3 >NUL
REN "%TXT%.cmd" "txt.cmd.cmd.cmd"

:: Type animation
CLS
SET /P "=[0m" <NUL
START /B "" CMD /Q /C CALL "%TXT%.cmd.cmd" TYPE /A `The snowstorm is getting pretty bad out there, isn't it?`, αMain Characterς says to αAstridς, his wife, while settling into a comfortable chair by the fireplace, gaze fixed on αAstridς.
TIMEOUT /T 30 >NUL

::END
TIMEOUT /T 0 /NOBREAK >NUL
REN "%TXT%.cmd.cmd" "txt.cmd"
CLS
EXIT /B 0
