IF NOT DEFINED VERCODE EXIT

::REWARDS - Start, End : In this example, it will randomize in the range of 24 to 30 (Why 30? Cuz 24+6)
SET REWARD.MONEY=26,4
SET REWARD.XP=23,5

::ENEMIES
:: When adding more enemies, make sure to add the additional variables for the locations.
:: Take for example the lvl2's setup config file.
::
:: Arguments: Type, Identifier, Level
CALL "%ENEMY%" Y 1 1
CALL "%ENEMY%" Y 2 1

:: - DISPLAY -
:: W = Width, H = Height
SET LOC.W1=92
SET LOC.H1=14

SET LOC.W2=89
SET LOC.H2=24

:: Positions for Player
SET LOC.WP=4
SET LOC.HP=13

:: - LOOT TABLE -
:: Find the list of items inside scripts\list\items.txt
:: Item name, Randomized Amount, Type(Materials, Items, Weapons), Claim only the first time?
SET LOOT.1=Stained_Dust
SET LOOT.1.X=0,2
SET LOOT.1.SAV=MATERIALS
SET LOOT.1.ONCE=FALSE

SET LOOT.2=Branch
SET LOOT.2.X=0,1
SET LOOT.2.SAV=WEAPONS
SET LOOT.2.ONCE=FALSE

::END
EXIT /B 0
