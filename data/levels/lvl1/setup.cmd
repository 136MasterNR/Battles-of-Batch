IF NOT DEFINED VERCODE EXIT

::REWARDS - Start, End : In this example, it will randomize in the range of 38 to 60(<- 38+22)
SET REWARD.MONEY=44,22
SET REWARD.XP=30,15

::ENEMIES - Set a value between 1 - 8
SET EN.MAX=3

REM - IMPORTANT - MER
:: When adding more than 3 enemies, make sure to add the additional
:: variables for the locations and the additional calls aswell.
:: Take for example the lvl2's setup config file.

CALL "%ENEMY%" Y 1 1
CALL "%ENEMY%" Y 2 1
CALL "%ENEMY%" Y 3 2

::DISPLAY - W = Width Pos    H = Height Pos
SET LOC.W1=87
SET LOC.W2=92
SET LOC.W3=86

SET LOC.H1=8
SET LOC.H2=17
SET LOC.H3=26

::LOOT TABLE - Find the list of items inside scripts\list\items.txt
:: Item name, Randomized Amount, Type(Materials, Items, Weapons), Claim only the first time?
SET LOOT.MAX=2

SET LOOT.1=Stained_Dust
SET LOOT.1.X=2,1
SET LOOT.1.SAV=MATERIALS
SET LOOT.1.ONCE=FALSE

SET LOOT.2=Branch
SET LOOT.2.X=0,1
SET LOOT.2.SAV=WEAPONS
SET LOOT.2.ONCE=FALSE

::END
EXIT /B 0