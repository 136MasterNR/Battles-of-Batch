::This is a testing file, it is not used anywhere in the game.

SETLOCAL ENABLEDELAYEDEXPANSION
SET Y=%2
SET X=%3
SET /A X.OFF=%3% - 1
SET /A Y.0=%2% - 10
SET /A Y.1=%2% - 9
SET /A Y.2=%2% - 8
SET /A Y.3=%2% - 7
SET /A Y.4=%2% - 6
SET /A Y.5=%2% - 5
SET /A Y.6=%2% - 4
SET /A Y.7=%2% - 3
SET /A Y.8=%2% - 2
SET /A Y.9=%2% - 1
GOTO %1
ENDLOCAL
EXIT 0 /B


:TREE
ECHO.[%Y%;%X%H[%Y.0%A     _ .-. _
ECHO.[%X.OFF%C[%Y.1%A    /~~   ~~\
ECHO.[%X.OFF%C[%Y.2%A /~~         ~~\
ECHO.[%X.OFF%C[%Y.3%A{               }
ECHO.[%X.OFF%C[%Y.4%A \  _-     -_  /
ECHO.[%X.OFF%C[%Y.5%A   ~  \\ //  ~
ECHO.[%X.OFF%C[%Y.6%A_- -   ^| ^| _- _
ECHO.[%X.OFF%C[%Y.7%A  _ -  ^| ^|   -_
ECHO.[%X.OFF%C[%Y.8%A      // \\
ENDLOCAL