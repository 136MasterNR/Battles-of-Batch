IF NOT DEFINED VERCODE EXIT
::CONFIG
SET "REWARD.MONEY=95,+400"
SET "REWARD.XP=125,+900"
SET LOOT_ONCE=FALSE
SET LOOT.1=Light_Resin
SET LOOT.1.X=2
SET LOOT.1.SAV=MATERIALS
SET LOOT.2=
SET LOOT.2.X=
SET LOOT.2.SAV=NUL
SET "EN.MAX=3"
CALL "%ENEMY%" F 1 2
CALL "%ENEMY%" S 2 1
CALL "%ENEMY%" J 3 3
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