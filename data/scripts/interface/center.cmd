IF NOT DEFINED VERCODE EXIT

:center.cmd <number of spaces available>
SET "LNGTH=:~%1,1"
:L
IF "!STR%LNGTH%!" NEQ "" GOTO END
SET "STR=%STR% "
IF "!STR%LNGTH%!" NEQ "" GOTO END
SET "STR= %STR%"
GOTO L
:END
EXIT /B 0