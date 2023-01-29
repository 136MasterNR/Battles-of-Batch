IF NOT DEFINED VERCODE EXIT
GOTO %1

:INVENTORY
ECHO.[0m[12;42H [s. Equipped Items
SETLOCAL ENABLEDELAYEDEXPANSION
SET TMP.STR=!WEAPONS.REG_NAME.%WIELDING.WEAPON%!
IF NOT DEFINED SLOTW.LINE CALL :CREATE_LINE W
IF !WEAPONS.REG_NAME.%WIELDING.WEAPON%![==[ (
	ECHO.[42C' .-------.
	IF %INV.SEL% EQU 0 (
		ECHO.[42C:-: %RGB.CYAN%Fists[0m ^| ^<-
		SET INV.SEL_NAME=ATTACK
	) ELSE (
		ECHO.[42C:-: Fists ^|   
	)
	ECHO.[42C. '-------'
) ELSE (
	ECHO.[42C' .--!SLOTW.LINE!.
	IF %INV.SEL% EQU 0 (
		ECHO.[42C:-: %RGB.CYAN%!WEAPONS.REG_NAME.%WIELDING.WEAPON%:_= ![0m ^| ^<-
		SET INV.SEL_NAME=ATTACK
	) ELSE (
		ECHO.[42C:-: !WEAPONS.REG_NAME.%WIELDING.WEAPON%:_= ! ^|   
	)
	ECHO.[42C. '--!SLOTW.LINE!'
)
FOR /L %%A IN (1,1,%ITEM.EQ_CNT%) DO (
	IF NOT !ITEM.EQ_NAME.%%A!==EMPTY (
		CALL :DISPLAYIT %%A !ITEM.EQ_NAME.%%A! %INV.SEL%
	) ELSE (
		ECHO.[42C' .------------.
		IF %INV.SEL% EQU %%A (
			ECHO.[42C:-: [1;30mEmpty Slot[0m ^| ^<-
			SET INV.SEL_NAME=EMPTY
		) ELSE ECHO.[42C:-: [1;30mEmpty Slot[0m ^|   
		ECHO.[42C. '------------'
	)
)
ENDLOCAL&SET INV.SEL_NAME=%INV.SEL_NAME%&SET SLOTW.LINE=%SLOTW.LINE%
ECHO.
ECHO.[42CNavigate using %RGB.LVL%W[0m and %RGB.LVL%S[0m
ECHO.[42CSelect pressing any key
EXIT /B 0

:DISPLAYIT
SET TMP.EQ_N=!ITEM.EQ_NAME.%1!
SET "TMP.STR=!ITEM.REG_NAME.%2!!ITEM.REG_LVL.%TMP.EQ_N%!"
SET TMP.LINE=-
CALL :CREATE_LINE %1
ECHO.[42C' .------!SLOT%1.LINE!.
IF %INV.SEL%==%1 (
	ECHO.[42C:-: %RGB.CYAN%!ITEM.REG_NAME.%2![0m [1m^(%RGB.COIN%x!ITEM.REG_LVL.%TMP.EQ_N%![0m[1m^)[0m ^| ^<-
	SET INV.SEL_NAME=!ITEM.REG_NAME.%2!
) ELSE ECHO.[42C:-: [1m!ITEM.REG_NAME.%2![0m ^(x!ITEM.REG_LVL.%TMP.EQ_N%!^) ^|   
ECHO.[42C. '------!SLOT%1.LINE!'
EXIT /B 0

:CREATE_LINE
IF DEFINED TMP.STR (
	SET "SLOT%1.LINE=!SLOT%1.LINE!-"
	SET "TMP.STR=%TMP.STR:~1%"
	GOTO CREATE_LINE
)
EXIT /B 0