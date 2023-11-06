CLS
SET /P "=[22;55H" <NUL
CALL "%TXT%" fade-in "[22;49HNow Loading ...[23;49HPlease wait ..."
CALL "%TXT%" fade-out "[22;49HNow Loading ...[23;49HPlease wait ..."
CALL "%TXT%" fade-in "[22;52HLoad has[23;52Hfinished!"
CALL "%TXT%" fade-out "[22;52HLoad has[23;52Hfinished!"
EXIT /B 0
