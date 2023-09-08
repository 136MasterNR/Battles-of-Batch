IF NOT DEFINED VERCODE EXIT

::REWARDS - Start, End : In this example, it will randomize in the range of 84 to 96 (Why 96? Cuz 84+12)
SET REWARD.MONEY=84,12
SET REWARD.XP=50,15

::ENEMIES
REM - IMPORTANT - MER
:: When adding more enemies, make sure to add the additional
:: variables for the locations and anything else.
:: Take for example the lvl2's setup config file.

CALL "%ENEMY%" Y 1 1
CALL "%ENEMY%" Y 2 1

::DISPLAY - W = Width Pos    H = Height Pos
SET LOC.W1=87
SET LOC.W2=92

SET LOC.H1=10
SET LOC.H2=19

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