IF NOT DEFINED VERCODE EXIT

:center.cmd <"Spaces Available": Integer>
SET "LNGTH=:~%1,1"
:L
IF "!STR%LNGTH%!" NEQ "" GOTO END
SET "STR=%STR% "
IF "!STR%LNGTH%!" NEQ "" GOTO END
SET "STR= %STR%"
GOTO L
:END
EXIT /B 0