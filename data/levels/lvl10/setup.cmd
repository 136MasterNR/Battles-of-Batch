IF NOT DEFINED VERCODE EXIT
::CONFIG
SET "REWARD.MONEY=35,+20"
SET "REWARD.XP=45,+50"
SET LOOT_ONCE=FALSE
SET LOOT.1=Exalted_Nickel
SET LOOT.1.X=3
SET LOOT.1.SAV=MATERIALS
SET LOOT.2=Prism_Dust
SET LOOT.2.X=4
SET LOOT.2.SAV=MATERIALS
SET "EN.MAX=3"
CALL "%ENEMY%" Y 1 10
CALL "%ENEMY%" Y 2 9
CALL "%ENEMY%" Y 3 9
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