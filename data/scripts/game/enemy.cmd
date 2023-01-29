IF NOT DEFINED VERCODE EXIT
IF "%1."=="." CALL "%DEV_ERR%" Undefined "ENEMY.TYPE" argument:Empty.&&SET LOAD.ERR=TRUE&&EXIT /B 1
IF "%2."=="." CALL "%DEV_ERR%" Undefined "ENEMY.POSITION" argument:Empty.&&SET LOAD.ERR=TRUE&&EXIT /B 1
IF "%3."=="." CALL "%DEV_ERR%" Undefined "ENEMY.LEVEL" argument:Empty.&&SET LOAD.ERR=TRUE&&EXIT /B 1
IF %3 EQU 0 CALL "%DEV_ERR%" Out of range for "ENEMY.LEVEL" argument:Value can't be zero.&&SET LOAD.ERR=TRUE&&EXIT /B 1
IF %2 EQU 0 CALL "%DEV_ERR%" Out of range for "ENEMY.SELECTOR" argument:Value can't be zero.&&SET LOAD.ERR=TRUE&&EXIT /B 1
IF %2 GTR 8 CALL "%DEV_ERR%" Out of range for "ENEMY.SELECTOR" argument:Value must be lower than 6.&&SET LOAD.ERR=TRUE&&EXIT /B 1
CALL :%1 %1 %2 %3
EXIT /B 0

:Y <Yara>
SET /A TEMP.EN_ATK=4*%3
SET /A TEMP.EN_ATK_RAND=2*%3
SET "ENEMY.ATK.AMOUNT.%2=%TEMP.EN_ATK_RAND%,+%TEMP.EN_ATK%"
SET /A TEMP.EN_HP=46*%3
SET /A TEMP.EN_HP_RAND=5*%3
SET "ENEMY.HP.AMOUNT.%2=%TEMP.EN_HP_RAND%,+%TEMP.EN_HP%"
SET "ENEMY.LVL.%2=%3"
SET "EN.%2.LINE.1=  wWw  wWw   "
SET "EN.%2.LINE.2=  (O)  (O)   "
SET "EN.%2.LINE.3=  ( \  / )   "
SET "EN.%2.LINE.4=   \ \/ /    "
SET "EN.%2.LINE.5=    \o /     "
SET "EN.%2.LINE.6=   _/ /      "
SET "EN.%2.LINE.7=  (_.'       "
EXIT /B 0

:J <Jumpo>
SET /A TEMP.EN_ATK=10*%3
SET /A TEMP.EN_ATK_RAND=6*%3
SET "ENEMY.ATK.AMOUNT.%2=%TEMP.EN_ATK_RAND%,+%TEMP.EN_ATK%"
SET /A TEMP.EN_HP=74*%3
SET /A TEMP.EN_HP_RAND=7*%3
SET "ENEMY.HP.AMOUNT.%2=%TEMP.EN_HP_RAND%,+%TEMP.EN_HP%"
SET "ENEMY.LVL.%2=%3"
SET "EN.%2.LINE.1=       _     "
SET "EN.%2.LINE.2=     _||\    "
SET "EN.%2.LINE.3=    (_'\     "
SET "EN.%2.LINE.4=     (  |    "
SET "EN.%2.LINE.5=      \ |    "
SET "EN.%2.LINE.6=   (\__)|    "
SET "EN.%2.LINE.7=    `--.)    "
EXIT /B 0

:N <Nimbo>
SET /A TEMP.EN_ATK=5*%3
SET /A TEMP.EN_ATK_RAND=2*%3
SET "ENEMY.ATK.AMOUNT.%2=%TEMP.EN_ATK_RAND%,+%TEMP.EN_ATK%"
SET /A TEMP.EN_HP=361*%3
SET /A TEMP.EN_HP_RAND=25*%3
SET "ENEMY.HP.AMOUNT.%2=%TEMP.EN_HP_RAND%,+%TEMP.EN_HP%"
SET "ENEMY.LVL.%2=%3"
SET "EN.%2.LINE.1=  \\\  ///   "
SET "EN.%2.LINE.2=  ((O)(O))   "
SET "EN.%2.LINE.3=   | \ ||    "
SET "EN.%2.LINE.4=   ||\\||    "
SET "EN.%2.LINE.5=   || \ |    "
SET "EN.%2.LINE.6=   ||  ||    "
SET "EN.%2.LINE.7=  (_/  \_)   "
EXIT /B 0

:F <French>
SET /A TEMP.EN_ATK=14*%3
SET /A TEMP.EN_ATK_RAND=6*%3
SET "ENEMY.ATK.AMOUNT.%2=%TEMP.EN_ATK_RAND%,+%TEMP.EN_ATK%"
SET /A TEMP.EN_HP=286*%3
SET /A TEMP.EN_HP_RAND=11*%3
SET "ENEMY.HP.AMOUNT.%2=%TEMP.EN_HP_RAND%,+%TEMP.EN_HP%"
SET "ENEMY.LVL.%2=%3"
SET "EN.%2.LINE.1=    wWw      "
SET "EN.%2.LINE.2=    (O)_     "
SET "EN.%2.LINE.3=    / __)    "
SET "EN.%2.LINE.4=   / (       "
SET "EN.%2.LINE.5=  (  _)      "
SET "EN.%2.LINE.6=  / /        "
SET "EN.%2.LINE.7=  )/         "
EXIT /B 0

:S <Snek>
SET /A TEMP.EN_ATK=18*%3
SET /A TEMP.EN_ATK_RAND=8*%3
SET "ENEMY.ATK.AMOUNT.%2=%TEMP.EN_ATK_RAND%,+%TEMP.EN_ATK%"
SET /A TEMP.EN_HP=385*%3
SET /A TEMP.EN_HP_RAND=13*%3
SET "ENEMY.HP.AMOUNT.%2=%TEMP.EN_HP_RAND%,+%TEMP.EN_HP%"
SET "ENEMY.LVL.%2=%3"
SET "EN.%2.LINE.1=    oo_      "
SET "EN.%2.LINE.2=   /  _)-<   "
SET "EN.%2.LINE.3=   \__ `.    "
SET "EN.%2.LINE.4=      `. |   "
SET "EN.%2.LINE.5=      _| |   "
SET "EN.%2.LINE.6=   ,-'   |   "
SET "EN.%2.LINE.7=  (_..--'    "
EXIT /B 0

:9 <Nine>
SET /A TEMP.EN_ATK=37*%3
SET /A TEMP.EN_ATK_RAND=15*%3
SET "ENEMY.ATK.AMOUNT.%2=%TEMP.EN_ATK_RAND%,+%TEMP.EN_ATK%"
SET /A TEMP.EN_HP=590*%3
SET /A TEMP.EN_HP_RAND=28*%3
SET "ENEMY.HP.AMOUNT.%2=%TEMP.EN_HP_RAND%,+%TEMP.EN_HP%"
SET "ENEMY.LVL.%2=%3"
SET "EN.%2.LINE.1=    ,--.     "
SET "EN.%2.LINE.2=   (O)(O)    "
SET "EN.%2.LINE.3=   |(__)|    "
SET "EN.%2.LINE.4=   |  __/    "
SET "EN.%2.LINE.5=   | /|\     "
SET "EN.%2.LINE.6=   \ `-.     "
SET "EN.%2.LINE.7=    `--'     "
EXIT /B 0

:L <Lose>
SET /A TEMP.EN_ATK=9*%3
SET /A TEMP.EN_ATK_RAND=4*%3
SET "ENEMY.ATK.AMOUNT.%2=%TEMP.EN_ATK_RAND%,+%TEMP.EN_ATK%"
SET /A TEMP.EN_HP=8400*%3
SET /A TEMP.EN_HP_RAND=250*%3
SET "ENEMY.HP.AMOUNT.%2=%TEMP.EN_HP_RAND%,+%TEMP.EN_HP%"
SET "ENEMY.LVL.%2=%3"
SET "EN.%2.LINE.1=    W  W     "
SET "EN.%2.LINE.2=   (O)(O)    "
SET "EN.%2.LINE.3=     ||      "
SET "EN.%2.LINE.4=     | \     "
SET "EN.%2.LINE.5=     |  `.   "
SET "EN.%2.LINE.6=    (.-.__)  "
SET "EN.%2.LINE.7=     `-'     "
EXIT /B 0




































