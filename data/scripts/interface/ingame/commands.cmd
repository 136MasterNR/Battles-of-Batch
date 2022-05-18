@ECHO OFF
SET /P "=[42;22H"<NUL
SETLOCAL ENABLEDELAYEDEXPANSION
SET "STR=ATTACK / HEAL(x%PLAYER.ITEM.HEAL%) / BOMB(x%PLAYER.ITEM.BOMB%) / NOTHING / LASER(x%PLAYER.ITEM.LASER%)"
SET "CSIZE=75"
SET "LEN=0"
:STRLEN_LOOP
IF NOT "!!STR:~%LEN%!!"=="" SET /A "LEN+=1" & GOTO :STRLEN_LOOP
SET "CLINE=---------------------------------------------------------------------------------------------------"
SET "SPACES=                                                                                                   "
CALL ECHO .%%CLINE:~0,%CSIZE%%%.
SET /A "PREF_LEN=%CSIZE%-%LEN%-2"
SET /A "PREF_LEN/=2"
SET /A "SUF_LEN=%CSIZE%-%LEN%-2-%PREF_LEN%"
SET /P "=[20C"<NUL
CALL ECHO {  %%SPACES:~0,%PREF_LEN%%%%%STR%%%%SPACES:~0,%SUF_LEN%%%  }
SET /P "=[21C"<NUL
CALL ECHO '%%CLINE:~0,%CSIZE%%%'
ENDLOCAL