IF NOT DEFINED VERCODE EXIT
::CONFIG
SET "REWARD.MONEY=35,+20"
SET "REWARD.XP=15,+40"
SET "EN.MAX=3"
CALL "%ENEMY%" Y 1 7
CALL "%ENEMY%" Y 2 9
CALL "%ENEMY%" Y 3 8
SET LOC.EN.1=[5;87H
SET LOC.EN.2=[14;92H
SET LOC.EN.3=[23;86H
SET LOC.EN.4=[32;86H
SET MOV.EN.1=[86C
SET MOV.EN.2=[91C
SET MOV.EN.3=[85C
SET MOV.EN.4=[85C
SET LOC.HP.1=[4;87H
SET LOC.HP.2=[13;92H
SET LOC.HP.3=[22;86H
SET LOC.HP.4=[31;86H
EXIT /B 0