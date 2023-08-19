IF NOT DEFINED VERCODE EXIT

::REWARDS
SET REWARD.MONEY=510,25
SET REWARD.XP=9500,500

::ENEMIES
CALL "%ENEMY%" WISP 1 15
CALL "%ENEMY%" SKELETON 2 15
CALL "%ENEMY%" SKELETON 3 15
CALL "%ENEMY%" WISP 4 14

::DISPLAY
SET LOC.W1=80
SET LOC.W2=71
SET LOC.W3=71
SET LOC.W4=80

SET LOC.H1=5
SET LOC.H2=14
SET LOC.H3=25
SET LOC.H4=34

::LOOT TABLE
SET LOOT.MAX=2

SET LOOT.1=Exalted_Nickel
SET LOOT.1.X=4,5
SET LOOT.1.SAV=MATERIALS
SET LOOT.1.ONCE=FALSE

SET LOOT.2=Black_Wood
SET LOOT.2.X=21,5
SET LOOT.2.SAV=MATERIALS
SET LOOT.2.ONCE=FALSE

::END
EXIT /B 0