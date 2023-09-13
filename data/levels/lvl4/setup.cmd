IF NOT DEFINED VERCODE EXIT

::REWARDS
SET REWARD.MONEY=355,50
SET REWARD.XP=620,190

::ENEMIES
CALL "%ENEMY%" Y 1 1
CALL "%ENEMY%" F 2 1
CALL "%ENEMY%" Y 3 1

::DISPLAY
SET LOC.W1=86
SET LOC.H1=9

SET LOC.W2=80
SET LOC.H2=19

SET LOC.W3=84
SET LOC.H3=29

SET LOC.WP=4
SET LOC.HP=13

::LOOT TABLE
SET LOOT.1=Stained_Dust
SET LOOT.1.X=3,2
SET LOOT.1.SAV=MATERIALS
SET LOOT.1.ONCE=FALSE

SET LOOT.2=Francium
SET LOOT.2.X=1,1
SET LOOT.2.SAV=MATERIALS
SET LOOT.2.ONCE=FALSE

::END
EXIT /B 0
