IF NOT DEFINED VERCODE EXIT

::REWARDS
SET "REWARD.MONEY=35,+20"
SET "REWARD.XP=12,+45"

::LOOT TABLE
SET LOOT_ONCE=FALSE
  SET LOOT.1=Stained_Dust
 SET LOOT.1.X=2
SET LOOT.1.SAV=MATERIALS
  SET LOOT.2=
 SET LOOT.2.X=
SET LOOT.2.SAV=NUL

::ENEMIES
SET "EN.MAX=3"
CALL "%ENEMY%" Y 1 1
CALL "%ENEMY%" Y 2 1
CALL "%ENEMY%" Y 3 2

::DISPLAY
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

::END
EXIT /B 0