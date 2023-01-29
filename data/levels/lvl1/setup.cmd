IF NOT DEFINED VERCODE EXIT

::REWARDS - End, +Start : In this example, it will randomize in the range of 38 to 60(<- 38+22)
SET "REWARD.MONEY=22,+38"
SET "REWARD.XP=12,+45"

::ENEMIES - Set a value between 1 - 6
SET "EN.MAX=3"

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
SET LOOT_ONCE=FALSE

SET LOOT.1=Stained_Dust
SET LOOT.1.X=2
SET LOOT.1.SAV=MATERIALS

SET LOOT.2=
SET LOOT.2.X=
SET LOOT.2.SAV=NUL

::END
EXIT /B 0