SETLOCAL ENABLEDELAYEDEXPANSION
CALL :%1
CALL "%CENTER%" STR 115
ECHO.[2;2H%STR%
SET "STR=%RGB.CYAN%Chapter[0m: [1m%CHAPTER%     %RGB.YELLOW%Level[0m: [1m!MAP.NAME.%SELECTED%:_= ! %RGB.GRAY%#%SELECTED%[0m"
CALL "%CENTER%" STR 115
ECHO.[1C%STR%
ENDLOCAL
EXIT /B 0

:1
SET "STR=%RGB.TRUE%Recommended Lvl[0m: [1m-    %RGB.FALSE%Enemies[0m: [1mYara ↑1[0m, [1mYara ↑1[0m"
EXIT /B 0
:2
SET "STR=%RGB.TRUE%Recommended Lvl[0m: [1m1    %RGB.FALSE%Enemies[0m: [1mJumpo ↑1[0m, [1mYara ↑1[0m"
EXIT /B 0
:3
SET "STR=%RGB.TRUE%Recommended Lvl[0m: [1m2    %RGB.FALSE%Enemies[0m: [1mYara ↑1[0m, [1mNimbo ↑1, [1mYara ↑2[0m"
EXIT /B 0
:4
SET "STR=%RGB.TRUE%Recommended Lvl[0m: [1m3    %RGB.FALSE%Enemies[0m: [1mYara ↑1[0m, [1mFrench ↑1, [1mYara ↑2[0m"
EXIT /B 0
:5
SET "STR=%RGB.TRUE%Recommended Lvl[0m: [1m5    %RGB.FALSE%Enemies[0m: [1mYara ↑1[0m, [1mFrench ↑1, [1mYara ↑2[0m"
EXIT /B 0
:6
SET "STR=- Corrupted Data -"
EXIT /B 0
:7
SET "STR=- Corrupted Data -"
EXIT /B 0
:8
SET "STR=- Corrupted Data -"
EXIT /B 0
:9
SET "STR=- Corrupted Data -"
EXIT /B 0
:10
SET "STR=- Corrupted Data -"
EXIT /B 0
:11
SET "STR=- Corrupted Data -"
EXIT /B 0
:12
SET "STR=- Corrupted Data -"
EXIT /B 0
:13
SET "STR=- Corrupted Data -"
EXIT /B 0
:14
SET "STR=- Corrupted Data -"
EXIT /B 0
:15
SET "STR=- Corrupted Data -"
EXIT /B 0
:16
SET "STR=- Corrupted Data -"
EXIT /B 0
:17
SET "STR=- Corrupted Data -"
EXIT /B 0
:18
SET "STR=- Corrupted Data -"
EXIT /B 0
:19
SET "STR=- Corrupted Data -"
EXIT /B 0
:20
SET "STR=- Corrupted Data -"
EXIT /B 0
:21
SET "STR=- Corrupted Data -"
EXIT /B 0
