IF NOT DEFINED VERCODE EXIT

::REWARDS
SET REWARD.MONEY=55,26
SET REWARD.XP=27,6

::ENEMIES
CALL "%ENEMY%" J 1 1
CALL "%ENEMY%" Y 2 1

::DISPLAY
SET LOC.W1=85
SET LOC.H1=12

SET LOC.W2=90
SET LOC.H2=24

SET LOC.WP=4
SET LOC.HP=13

::LOOT TABLE
SET LOOT.1=Dustblade
SET LOOT.1.X=1,0
SET LOOT.1.SAV=WEAPONS
SET LOOT.1.ONCE=TRUE

SET LOOT.2=Double_Marble
SET LOOT.2.X=1,1
SET LOOT.2.SAV=MATERIALS
SET LOOT.2.ONCE=FALSE

SET LOOT.3=Stained_Dust
SET LOOT.3.X=0,2
SET LOOT.3.SAV=MATERIALS
SET LOOT.3.ONCE=FALSE

::END
EXIT /B 0
