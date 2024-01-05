IF NOT DEFINED VERCODE EXIT
:: Detect errors
IF "%1."=="." CALL "%DEV_ERR%" Undefined "ENEMY.TYPE" argument:Empty.&&SET LOAD.ERR=TRUE&&EXIT /B 1
IF "%2."=="." CALL "%DEV_ERR%" Undefined "ENEMY.POSITION" argument:Empty.&&SET LOAD.ERR=TRUE&&EXIT /B 1
IF "%3."=="." CALL "%DEV_ERR%" Undefined "ENEMY.LEVEL" argument:Empty.&&SET LOAD.ERR=TRUE&&EXIT /B 1
IF %3 EQU 0 CALL "%DEV_ERR%" Out of range for "ENEMY.LEVEL" argument:Value can't be zero.&&SET LOAD.ERR=TRUE&&EXIT /B 1
IF %2 EQU 0 CALL "%DEV_ERR%" Out of range for "ENEMY.SELECTOR" argument:Value can't be zero.&&SET LOAD.ERR=TRUE&&EXIT /B 1
IF %2 GTR 8 CALL "%DEV_ERR%" Out of range for "ENEMY.SELECTOR" argument:Value must be lower than 8.&&SET LOAD.ERR=TRUE&&EXIT /B 1
ECHO %3| FINDSTR /R "^[1-9][0-9]*$">NUL || CALL "%DEV_ERR%" Detected invalid enemy data:Enemy level not an integer.&&SET LOAD.ERR=TRUE&&EXIT /B 1

:: Load the enemy
CALL :%1 %1 %2 %3

:: Detect errors
IF %TEMP.EN_ATK_RAND% EQU 0 CALL "%DEV_ERR%" Out of range for "TEMP.EN_ATK_RAND" variable:Value cannot be 0.&&SET LOAD.ERR=TRUE&&EXIT /B 1
IF %TEMP.EN_HP_RAND% EQU 0 CALL "%DEV_ERR%" Out of range for "TEMP.EN_HP_RAND" variable:Value cannot be 0.&&SET LOAD.ERR=TRUE&&EXIT /B 1

:: Finalize the enemy
SET /A TEMP.EN_ATK*=%3
SET /A TEMP.EN_ATK_RAND*=((%3 * 3) / 5) + 1
SET /A TEMP.EN_HP*=%3
SET /A TEMP.EN_HP_RAND*=%3

SET "ENEMY.LVL.%2=%3"
SET "ENEMY.TYPE.%2=%1"
SET "ENEMY.ATK.AMOUNT.%2=%TEMP.EN_ATK_RAND%,+%TEMP.EN_ATK%"
SET "ENEMY.HP.AMOUNT.%2=%TEMP.EN_HP_RAND%,+%TEMP.EN_HP%"

EXIT /B 0





:Y <Yara>
SET /A TEMP.EN_ATK=1
SET /A TEMP.EN_ATK_RAND=1
SET /A TEMP.EN_HP=39
SET /A TEMP.EN_HP_RAND=2
SET "EN.%2.LINE.1=  wWw  wWw   "
SET "EN.%2.LINE.2=  (O)  (O)   "
SET "EN.%2.LINE.3=  ( \  / )   "
SET "EN.%2.LINE.4=   \ \/ /    "
SET "EN.%2.LINE.5=    \o /     "
SET "EN.%2.LINE.6=   _/ /      "
SET "EN.%2.LINE.7=  (_.'       "
EXIT /B 0

:J <Jumpo>
SET /A TEMP.EN_ATK=6
SET /A TEMP.EN_ATK_RAND=2
SET /A TEMP.EN_HP=38
SET /A TEMP.EN_HP_RAND=4
SET "EN.%2.LINE.1=       _     "
SET "EN.%2.LINE.2=     _||\    "
SET "EN.%2.LINE.3=    (_'\     "
SET "EN.%2.LINE.4=     (  |    "
SET "EN.%2.LINE.5=      \ |    "
SET "EN.%2.LINE.6=   (\__)|    "
SET "EN.%2.LINE.7=    `--.)    "
EXIT /B 0

:N <Nimbo>
SET /A TEMP.EN_ATK=1
SET /A TEMP.EN_ATK_RAND=1
SET /A TEMP.EN_HP=154
SET /A TEMP.EN_HP_RAND=18
SET "EN.%2.LINE.1=  \\\  ///   "
SET "EN.%2.LINE.2=  ((O)(O))   "
SET "EN.%2.LINE.3=   | \ ||    "
SET "EN.%2.LINE.4=   ||\\||    "
SET "EN.%2.LINE.5=   || \ |    "
SET "EN.%2.LINE.6=   ||  ||    "
SET "EN.%2.LINE.7=  (_/  \_)   "
EXIT /B 0

:F <French>
SET /A TEMP.EN_ATK=7
SET /A TEMP.EN_ATK_RAND=2
SET /A TEMP.EN_HP=64
SET /A TEMP.EN_HP_RAND=6
SET "EN.%2.LINE.1=     wWw     "
SET "EN.%2.LINE.2=    _(O)     "
SET "EN.%2.LINE.3=   (__ \     "
SET "EN.%2.LINE.4=      ) \    "
SET "EN.%2.LINE.5=     (_  )   "
SET "EN.%2.LINE.6=       \ \   "
SET "EN.%2.LINE.7=        \(   "
EXIT /B 0

:S <Snek>
SET /A TEMP.EN_ATK=2
SET /A TEMP.EN_ATK_RAND=1
SET /A TEMP.EN_HP=49
SET /A TEMP.EN_HP_RAND=9
SET "EN.%2.LINE.1=      _oo    "
SET "EN.%2.LINE.2=   >-(_  \   "
SET "EN.%2.LINE.3=    .' __/   "
SET "EN.%2.LINE.4=   | .'      "
SET "EN.%2.LINE.5=   | |       "
SET "EN.%2.LINE.6=   |  `--.   "
SET "EN.%2.LINE.7=    `--.._)  "
EXIT /B 0

:D <Darp>
SET /A TEMP.EN_ATK=2
SET /A TEMP.EN_ATK_RAND=1
SET /A TEMP.EN_HP=289
SET /A TEMP.EN_HP_RAND=11
SET "EN.%2.LINE.1=       _     "
SET "EN.%2.LINE.2=     _||\    "
SET "EN.%2.LINE.3=    (_o\     "
SET "EN.%2.LINE.4=    / |(\    "
SET "EN.%2.LINE.5=   (( | |    "
SET "EN.%2.LINE.6=    \\| |    "
SET "EN.%2.LINE.7=     \__/    "
EXIT /B 0

:9 <Nine>
SET /A TEMP.EN_ATK=37
SET /A TEMP.EN_ATK_RAND=15
SET /A TEMP.EN_HP=300
SET /A TEMP.EN_HP_RAND=28
SET "EN.%2.LINE.1=     ,--.    "
SET "EN.%2.LINE.2=    (O)(O)   "
SET "EN.%2.LINE.3=    |(__)|   "
SET "EN.%2.LINE.4=    \__  |   "
SET "EN.%2.LINE.5=     /|\ |   "
SET "EN.%2.LINE.6=    .-' /    "
SET "EN.%2.LINE.7=    '--'     "
EXIT /B 0

:L <Lose>
SET /A TEMP.EN_ATK=5
SET /A TEMP.EN_ATK_RAND=2
SET /A TEMP.EN_HP=651
SET /A TEMP.EN_HP_RAND=6
SET "EN.%2.LINE.1=    W  W     "
SET "EN.%2.LINE.2=   (O)(O)    "
SET "EN.%2.LINE.3=     ||      "
SET "EN.%2.LINE.4=    / |      "
SET "EN.%2.LINE.5=  .'  |      "
SET "EN.%2.LINE.6= (__.-.)     "
SET "EN.%2.LINE.7=    '-'      "
EXIT /B 0

:SKELETON <Skeleton>
SET /A TEMP.EN_ATK=3
SET /A TEMP.EN_ATK_RAND=1
SET /A TEMP.EN_HP=63
SET /A TEMP.EN_HP_RAND=5
SET "EN.%2.LINE.1=[49m    [38;2;255;79;79;49m▄▄▄[38;2;173;51;51;49m▄[49m    [m"
SET "EN.%2.LINE.2=[49m   [48;2;255;255;255m [38;2;255;255;255;48;2;35;31;51m▄[48;2;255;255;255m [38;2;255;255;255;48;2;35;31;51m▄[38;2;202;218;250;48;2;255;255;255m▄[49;38;2;173;51;51m▀[49m   [m"
SET "EN.%2.LINE.3=[49;38;2;180;202;214m▀[38;2;153;173;182;49m▄[49m [49;38;2;202;218;250m▀[49;38;2;255;255;255m▀[49;38;2;202;218;250m▀[38;2;202;218;250;48;2;255;255;255m▄[49m  [38;2;206;206;206;49m▄[49m  [m"
SET "EN.%2.LINE.4=[49m  [38;2;249;245;82;48;2;120;135;142m▄[38;2;202;218;250;48;2;177;175;58m▄[49;38;2;255;255;255m▀▀[48;2;202;218;250m [49;38;2;255;255;255m▀[49;38;2;89;86;82m▀[49m   [m"
SET "EN.%2.LINE.5=[49m    [49;38;2;105;58;50m▀[49;38;2;162;175;200m▀[48;2;162;175;200m [49;38;2;162;175;200m▀[49m    [m"
SET "EN.%2.LINE.6=[49m     [38;2;127;136;156;48;2;162;175;200m▄[49;38;2;127;136;156m▀[38;2;143;84;60;48;2;127;136;156m▄[49m    [m"
SET "EN.%2.LINE.7=[49m    [49;38;2;66;61;114m▀[49;38;2;35;31;51m▀[49m [49;38;2;88;52;37m▀[49m    [m"
EXIT /B 0

:ZOMBIE <Zombie>
SET /A TEMP.EN_ATK=2
SET /A TEMP.EN_ATK_RAND=1
SET /A TEMP.EN_HP=43
SET /A TEMP.EN_HP_RAND=5
SET "EN.%2.LINE.1=[49m    [38;2;255;145;219;49m▄[38;2;224;122;184;49m▄[38;2;136;231;95;49m▄▄[49m    [m"
SET "EN.%2.LINE.2=[49m    [38;2;136;231;95;48;2;219;65;65m▄[38;2;84;191;65;48;2;136;231;95m▄[38;2;136;231;95;48;2;180;53;53m▄[48;2;84;191;65m [49m    [m"
SET "EN.%2.LINE.3=[49m  [38;2;84;191;65;49m▄[38;2;68;153;51;49m▄[38;2;106;63;44;49m▄[38;2;106;63;44;48;2;255;255;255m▄[38;2;74;44;31;48;2;201;201;201m▄[48;2;68;153;51m [49m    [m"
SET "EN.%2.LINE.4=[49m  [49;38;2;68;153;51m▀[38;2;84;191;65;48;2;136;231;95m▄[38;2;147;87;62;48;2;84;191;65m▄[48;2;147;87;62m [38;2;106;63;44;48;2;147;87;62m▄[48;2;106;63;44m [49m    [m"
SET "EN.%2.LINE.5=[49m    [38;2;74;44;31;48;2;106;63;44m▄[38;2;249;245;82;48;2;202;218;250m▄[38;2;102;57;85;48;2;147;87;62m▄[38;2;72;40;59;48;2;74;44;31m▄[49m    [m"
SET "EN.%2.LINE.6=[49m     [48;2;86;80;149m [48;2;129;120;224m [38;2;69;106;52;48;2;117;108;202m▄[49m    [m"
SET "EN.%2.LINE.7=[49m    [49;38;2;67;62;32m▀[49;38;2;161;149;77m▀[49;38;2;107;99;52m▀▀[49m    [m"
EXIT /B 0

:GOBLIN <Goblin>
SET /A TEMP.EN_ATK=4
SET /A TEMP.EN_ATK_RAND=2
SET /A TEMP.EN_HP=82
SET /A TEMP.EN_HP_RAND=6
SET "EN.%2.LINE.1=[49m      [38;2;0;255;193;49m▄▄[38;2;16;183;139;49m▄[49m   [m"
SET "EN.%2.LINE.2=[49m   [38;2;0;255;193;49m▄[48;2;0;255;193m [38;2;82;76;39;48;2;0;255;193m▄[48;2;16;183;139m [49;38;2;164;184;140m▀[49m    [m"
SET "EN.%2.LINE.3=[49m  [49;38;2;0;255;193m▀[49;38;2;16;121;91m▀[38;2;53;82;40;48;2;16;183;139m▄[38;2;53;82;40;48;2;0;255;193m▄[38;2;214;240;254;48;2;16;183;139m▄[38;2;72;40;59;48;2;146;165;173m▄[38;2;116;65;96;49m▄[49m   [m"
SET "EN.%2.LINE.4=[49m   [38;2;16;130;98;49m▄[38;2;42;23;35;49m▄[38;2;116;65;96;48;2;214;240;254m▄[48;2;116;65;96m [38;2;72;40;59;48;2;116;65;96m▄[38;2;116;65;96;48;2;72;40;59m▄[38;2;51;29;43;48;2;72;40;59m▄[49m  [m"
SET "EN.%2.LINE.5=[49m    [49;38;2;16;183;139m▀[49;38;2;116;65;96m▀[38;2;51;29;43;48;2;72;40;59m▄▄[48;2;51;29;43m [49;38;2;51;29;43m▀[49m  [m"
SET "EN.%2.LINE.6=[49m     [49;38;2;105;58;50m▀[49;38;2;60;32;29m▀[38;2;147;87;62;49m▄[38;2;105;58;50;48;2;128;144;151m▄[49m   [m"
SET "EN.%2.LINE.7=[49m            [m"
EXIT /B 0

:WISP <Wisp>
SET /A TEMP.EN_ATK=2
SET /A TEMP.EN_ATK_RAND=3
SET /A TEMP.EN_HP=55
SET /A TEMP.EN_HP_RAND=3
SET "EN.%2.LINE.1=[49m   [38;2;139;254;254;49m▄▄▄▄[49m     [m"
SET "EN.%2.LINE.2=[49m  [38;2;109;119;250;48;2;139;254;254m▄[38;2;139;254;254;48;2;80;227;253m▄[38;2;80;227;253;48;2;139;254;254m▄▄[38;2;96;105;221;48;2;80;227;253m▄[48;2;66;184;204m [49m    [m"
SET "EN.%2.LINE.3=[49m  [38;2;139;254;254;48;2;96;105;221m▄[38;2;80;227;253;48;2;109;119;250m▄[48;2;80;227;253m [38;2;66;184;204;48;2;109;119;250m▄[38;2;66;184;204;48;2;96;105;221m▄[48;2;55;152;169m [49m    [m"
SET "EN.%2.LINE.4=[49m   [49;38;2;66;184;204m▀▀[38;2;66;184;204;48;2;55;152;169m▄[38;2;55;152;169;48;2;66;184;204m▄▄[48;2;55;152;169m [38;2;55;152;169;49m▄[49;38;2;55;152;169m▀[49m [m"
SET "EN.%2.LINE.5=[49m            [m"
SET "EN.%2.LINE.6=[49m            [m"
SET "EN.%2.LINE.7=[49m            [m"
EXIT /B 0

:_ <???>
SET /A TEMP.EN_ATK=0
SET /A TEMP.EN_ATK_RAND=0
SET /A TEMP.EN_HP=2147483646
SET /A TEMP.EN_HP_RAND=1
SET "EN.%2.LINE.1=  wWw  wWw   "
SET "EN.%2.LINE.2=  (-)  (-)   "
SET "EN.%2.LINE.3=  ( \  / )   "
SET "EN.%2.LINE.4=   \ \/ /    "
SET "EN.%2.LINE.5=    \- /     "
SET "EN.%2.LINE.6=   _/ /      "
SET "EN.%2.LINE.7=  (_.'       "
EXIT /B 0