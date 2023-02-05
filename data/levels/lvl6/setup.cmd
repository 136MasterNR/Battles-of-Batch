IF NOT DEFINED VERCODE EXIT

::REWARDS
SET REWARD.MONEY=7510,215
SET REWARD.XP=44250,1250

::ENEMIES
SET EN.MAX=3

CALL "%ENEMY%" Y 1 5
CALL "%ENEMY%" 9 2 1
CALL "%ENEMY%" 9 3 1

::DISPLAY
SET LOC.W1=87
SET LOC.W2=92
SET LOC.W3=86

SET LOC.H1=6
SET LOC.H2=16
SET LOC.H3=26

::LOOT TABLE
SET LOOT.MAX=3

SET LOOT.1=Francium
SET LOOT.1.X=2,1
SET LOOT.1.SAV=MATERIALS
SET LOOT.1.ONCE=FALSE

SET LOOT.2=Black_Wood
SET LOOT.2.X=5,1
SET LOOT.2.SAV=MATERIALS
SET LOOT.2.ONCE=FALSE

SET LOOT.3=Stained_Dust
SET LOOT.3.X=0,1
SET LOOT.3.SAV=MATERIALS
SET LOOT.3.ONCE=FALSE

::END
EXIT /B 0