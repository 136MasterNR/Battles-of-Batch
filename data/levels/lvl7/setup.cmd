IF NOT DEFINED VERCODE EXIT
::CONFIG
SET "REWARD.MONEY=215,+8510"
SET "REWARD.XP=10000,+90000"
SET "EN.MAX=3"
CALL "%ENEMY%" J 1 5
CALL "%ENEMY%" L 2 1
CALL "%ENEMY%" J 3 5
SET LOC.EN.1=[5;87H
SET LOC.EN.2=[16;82H
SET LOC.EN.3=[26;86H
SET MOV.EN.1=[86C
SET MOV.EN.2=[81C
SET MOV.EN.3=[85C
SET LOC.HP.1=[4;87H
SET LOC.HP.2=[15;82H
SET LOC.HP.3=[25;86H
GOTO :EOF