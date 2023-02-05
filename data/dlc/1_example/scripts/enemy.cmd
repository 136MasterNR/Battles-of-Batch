IF NOT DEFINED VERCODE EXIT
CALL :%1 %1 %2 %3
EXIT /B 0

::ShortName <Full Name>
:EXAMPLE <Example Enemy>

::Set the enemy's attack amount below. The attacks are randomized, thus two strings exist for that purpose.
::In the following command, set the START of the randomizer. Change only the first value, ignore the "*%3".
SET /A TEMP.EN_ATK=4*%3
::In the following command, set the STOP of the randomizer. Note that the STOP is calculated as START + STOP, in this example it becomes (4+2=)6.
SET /A TEMP.EN_ATK_RAND=2*%3
::The above example will randomize the ATK in range of 4 to 6.

::The same explanation goes for the following.
SET /A TEMP.EN_HP=46*%3
SET /A TEMP.EN_HP_RAND=5*%3
::The above example will randomize the HP in range of 46 to 51.

::Draw the enemy, this will be displayed on the screen.
SET "EN.%2.LINE.1=  wWw  wWw   "
SET "EN.%2.LINE.2=  (O)  (O)   "
SET "EN.%2.LINE.3=  ( \  / )   "
SET "EN.%2.LINE.4=   \ \/ /    "
SET "EN.%2.LINE.5=    \o /     "
SET "EN.%2.LINE.6=   _/ /      "
SET "EN.%2.LINE.7=  (_.'       "

::ignore this
SET "ENEMY.LVL.%2=%3"
SET "ENEMY.ATK.AMOUNT.%2=%TEMP.EN_ATK_RAND%,+%TEMP.EN_ATK%"
SET "ENEMY.HP.AMOUNT.%2=%TEMP.EN_HP_RAND%,+%TEMP.EN_HP%"

EXIT /B 0




































