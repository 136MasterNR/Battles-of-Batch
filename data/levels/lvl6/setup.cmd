IF NOT DEFINED VERCODE EXIT
::CONFIG
SET "REWARD.MONEY=215,+7510"
SET "REWARD.XP=5250,+42250"
SET LOOT_ONCE=FALSE
SET LOOT.1=Francium
SET LOOT.1.X=2
SET LOOT.1.SAV=MATERIALS
SET LOOT.2=Black_Wood
SET LOOT.2.X=5
SET LOOT.2.SAV=MATERIALS
SET "EN.MAX=3"
CALL "%ENEMY%" Y 1 5
CALL "%ENEMY%" 9 2 1
CALL "%ENEMY%" 9 3 1
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