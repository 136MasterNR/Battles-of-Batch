IF NOT DEFINED VERCODE EXIT
::CONFIG
SET "REWARD.MONEY=152,+250"
SET "REWARD.XP=420,+750"
SET LOOT_ONCE=TRUE
SET LOOT.1=
SET LOOT.1.X=
SET LOOT.1.SAV=NUL
SET LOOT.2=
SET LOOT.2.X=
SET LOOT.2.SAV=NUL
SET "EN.MAX=3"
CALL "%ENEMY%" F 1 1
CALL "%ENEMY%" F 2 1
CALL "%ENEMY%" N 3 2
SET LOC.EN.1=[5;87H
SET LOC.EN.2=[14;92H
SET LOC.EN.3=[23;86H
SET MOV.EN.1=[86C
SET MOV.EN.2=[91C
SET MOV.EN.3=[85C
SET LOC.HP.1=[4;87H
SET LOC.HP.2=[13;92H
SET LOC.HP.3=[22;86H
EXIT /B 0