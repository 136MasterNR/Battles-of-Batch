IF NOT DEFINED VERCODE EXIT
IF %SELECTED% EQU 1 (
	ECHO.[2;45H[s:---------: HELP - ^? :---------:
	ECHO.[u[1B: %RGB.COIN%Select an enemy to attack:[0m   :
	ECHO.[u[2B: Navigate using %RGB.CYAN%W[0m and %RGB.CYAN%S[0m, then[0m :
	ECHO.[u[3B: press %RGB.CYAN%A[0m to make your action![0m :
	ECHO.[u[4B:------------------------------:
	IF %CURR_TURN%==AV.PLAYER (
		ECHO.[u[5B         %RGB.GREEN%^> Your Turn ^<[0m         
	) ELSE (
		ECHO.[u[5B      %RGB.RED%... Enemy's Turn ...[0m   
	)
) ELSE (
	ECHO.[2;47H[s:------------------------:
	ECHO.[u[2B:------------------------:
	ECHO.[u[1B:                        :[23D%RGB.YELLOW%Round: %ROUNDS%  [0m^|[1D[1A.[1D[2B'[1A%RGB.YELLOW%  Turn: %TURNS.T%[0m
	IF %CURR_TURN%==AV.PLAYER (
		ECHO.[u[3B       %RGB.GREEN%^> Your Turn ^<[0m       
	) ELSE (
		ECHO.[u[3B   %RGB.RED%... Enemy's Turn ...[0m   
	)
)
EXIT /B 0
