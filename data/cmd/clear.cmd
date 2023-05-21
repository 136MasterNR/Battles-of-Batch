@ECHO OFF
TITLE %TITLE%Command Line Enviroment
MODE CON:COLS=126 LINES=9216
CLS
COLOR 07
ECHO.[38;2;166;255;245m^(•^) [38;2;207;255;250mBattles of Batch [37m[Version %VERCODE% / %VERTYPE% %VERS%]
ECHO.[38;2;166;255;245m^(•^) [38;2;207;255;250mMicrosoft Windows [37m[Version %WINVER:]=%]
ECHO.[38;2;235;64;52m^(^!^) [38;2;245;108;98mRun "EXIT" to return.[0m[3H
PROMPT [38;2;132;217;52mbob@terminal[0m[1m:[38;2;113;155;198m%cd:~-9,9%[0m$$ 
ECHO ON