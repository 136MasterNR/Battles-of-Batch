IF NOT DEFINED VERCODE EXIT

::REWARDS
SET REWARD.MONEY=640,95
SET REWARD.XP=900,125

::ENEMIES
CALL "%ENEMY%" F 1 2
CALL "%ENEMY%" S 2 1
CALL "%ENEMY%" J 3 3

::DISPLAY
SET LOC.W1=87
SET LOC.W2=92
SET LOC.W3=86

SET LOC.H1=6
SET LOC.H2=16
SET LOC.H3=26

::LOOT TABLE
SET LOOT.MAX=2

SET LOOT.1=Light_Resin
SET LOOT.1.X=2,1
SET LOOT.1.SAV=MATERIALS
SET LOOT.1.ONCE=FALSE

SET LOOT.2=Prism_Dust
SET LOOT.2.X=1,1
SET LOOT.2.SAV=MATERIALS
SET LOOT.2.ONCE=FALSE

::END
EXIT /B 0