@ECHO OFF
ECHO.[?25l

:RE

SET CAMERA_X=0

CALL :RENDER_BACKGROUND

SET POS_Y=1
SET POS_X=1

CALL :RENDER_PLAYER

:: Trees
(
	ECHO SET "map[3.10]=[83CW[5CA[5CT[5CE[5CR"
	ECHO SET "map[3.29]=[15C/\/\/\"
	ECHO SET "map[3.30]=[14C/\\/\//\"
	ECHO SET "map[3.31]=[13C/\ /\/\ /\[26C/\/\/\"
	ECHO SET "map[3.32]=[12C( //\/\/\\ )[24C/\\/\//\[43C/\/\/\/\"
	ECHO SET "map[3.33]=[12C(/ \/\/\/ \)[23C/\ /\/\ /\[41C/\ /\/\ /\"
	ECHO SET "map[3.34]=[13C\\ /\/\ //[23C( //\/\/\\ )[39C(/ \/\/\/ \)"
	ECHO SET "map[3.35]=[15C\:  :/[25C(/ \/\/\/ \)[40C\\ /\/\ //"
	ECHO SET "map[3.36]=[16C:  :[27C\\ /\/\ /[44C\:  :/"
	ECHO SET "map[3.37]=[16C:  :[29C\:  :/[46C:  :"
	ECHO SET "map[3.38]=[16C:  :[30C:  :[47C:  :"
	ECHO SET "map[3.39]=[16C:  :[30C:  :[47C:  :"
	ECHO SET "map[3.40]=[16C'  '[30C:  :[47C'  '"
	ECHO SET "map[3.41]=[50C:  :"
	ECHO SET "map[3.42]=[50C:  :"
	ECHO SET "map[3.43]=[50C'  '"
) > .\buffer_layer_3.cmd

:: Start the renderer
START /B "" CMD /C ".\coolrenderer.cmd" ^& EXIT


:CHOICE-RE
%CHOICE%
IF %CHOICE.INPUT%.==. (
	GOTO CHOICE-RE
)
IF /I %CHOICE.INPUT%==Q (
	DEL /Q ".\buffer_layer_1.cmd"
	DEL /Q ".\buffer_layer_2.cmd"
	DEL /Q ".\buffer_layer_3.cmd"
	TIMEOUT /T 0 /NOBREAK >NUL
	CALL ".\clear.cmd"
	EXIT /B 0
)
IF /I %CHOICE.INPUT%==R (
	DEL /Q ".\buffer_layer_1.cmd"
	TIMEOUT /T 0 /NOBREAK >NUL
	CLS
	GOTO RE
)
IF /I %CHOICE.INPUT%==W (
	SET /A POS_Y-=1
	CALL :RENDER_PLAYER
)
IF /I %CHOICE.INPUT%==S (
	SET /A POS_Y+=1
	CALL :RENDER_PLAYER
)
IF /I %CHOICE.INPUT%==D (
	SET /A POS_X+=2
	CALL :RENDER_PLAYER
)
IF /I %CHOICE.INPUT%==A (
	SET /A POS_X-=2
	CALL :RENDER_PLAYER
)
GOTO CHOICE-RE


:RENDER_PLAYER
SETLOCAL ENABLEDELAYEDEXPANSION
SET /A POS_Y_2=POS_Y+1
SET /A POS_Y_3=POS_Y+2
SET /A POS_Y_4=POS_Y+3
SET /A POS_Y_5=POS_Y+4
SET /A POS_Y_6=POS_Y+5
SET /A POS_Y_7=POS_Y+6
(
	ECHO SET "map[2.%POS_Y%]=[%POS_X%C[1CwW[4CWw"
	ECHO SET "map[2.%POS_Y_2%]=[%POS_X%C(O)\[2C/(O)"
	ECHO SET "map[2.%POS_Y_3%]=[%POS_X%C[1C`. \/ .'"
	ECHO SET "map[2.%POS_Y_4%]=[%POS_X%C[3C\  /"
	ECHO SET "map[2.%POS_Y_5%]=[%POS_X%C[3C/  \"
	ECHO SET "map[2.%POS_Y_6%]=[%POS_X%C[1C.' /\ `."
	ECHO SET "map[2.%POS_Y_7%]=[%POS_X%C(_.'[2C`._)"
) > .\buffer_layer_2.cmd
ENDLOCAL
EXIT /B 0

:RENDER_BACKGROUND
(
	ECHO SET "map[1.1]=A   \/     ~                          ~           '. '.   .  .    .   .  .     :  ,';.     ,';.          ,;.'       B"
	ECHO SET "map[1.2]=                    ~             \/               '. '.  .     .  .        . .:       ;.,'                ,;.'      "
	ECHO SET "map[1.3]=      ~     \/            ~                 ~       :  '.  .  .    .   .    .-'      ,.'           ',.         ,;.'  "
	ECHO SET "map[1.4]=  \/                              ~                 '. :'.  .  .  .       .-'   .,;.',;'       ',;.  ,';.       ,;.' "
	ECHO SET "map[1.5]=         \/                                           :  '.  .   .     .--'  ,';.                     ,;.'    ,.';   "
	ECHO SET "map[1.6]=  ~             ~         \/            ~      ~      '. :'.  .  . . .:', ; ;,           ,.'           ,;.'     ,;.' "
	ECHO SET "map[1.7]=                    ~                                   '. '.   . .  :   ,;      ,;.'     ';        ,';.         ,;.'"
	ECHO SET "map[1.8]=                                                         '. '. .   . :  ,';.        ',;.   ,;'                 ',;.,'"
	ECHO SET "map[1.9]=    \/                                ~                   '. '.  . . :   ,;.                ';,.       ,;.';',,.',.  "
	ECHO SET "map[1.10]=                           ~                               :  '. .  .:    ',;      W     A     T     E     R     ,';"
	ECHO SET "map[1.11]=        ~                                ___               '. :'.  . : ,;.',;.' ,,;.' ,;.' ;.'                  ,';."
	ECHO SET "map[1.12]=                 \/                     /   \      ~         '. '.   :   ';.';. ';.   ';.          ;.'    ;'.  ;.'  "
	ECHO SET "map[1.13]=                                    \/ /_____\                '. '.  '-.           ;.'  ;.'      ;.'     ;.'  ';.   "
	ECHO SET "map[1.14]=                                       :     :                 ': '..  :.;.;.'.'   ';.         ';.            ;.'  '"
	ECHO SET "map[1.15]=                     ~                 :..   :    _             '.  '.. '--. ';.      ;.'             ;.'  ';. '; ;'"
	ECHO SET "map[1.16]=     \/                                :::   :   ("^)              '. :'..  '-.       ';.  ;.';.'  ;.'       ;.'     "
	ECHO SET "map[1.17]=                             \/     ~            -^!-                '': '..  '-.'. .   ';,.        ';.           .--"
	ECHO SET "map[1.18]=              \/                                 /'\                  '.. '..  '-.  '    .,'      .,.'  .,' .---'  ."
	ECHO SET "map[1.19]=                                            \/            ~             ':  :'.. '--   ,;'      .;'    .; -' .....' "
	ECHO SET "map[1.20]=                                    \/                                    '.:.  '....,;.'    ',;.  ,;.'.....':      "
	ECHO SET "map[1.21]=   ~           ~                      ~                                    : ': :. : :',.   ,';.    ;.: :..:'       "
	ECHO SET "map[1.22]=                                                   \/                       :  ': : : ,'   ;,'     ;,' :'           "
	ECHO SET "map[1.23]=                       \/       ~                                            :  ':. '  ',  ,'     ,;':.'            "
	ECHO SET "map[1.24]=      \/     ~                              \/                    ~          :'. : .' ,'  ';.    ,;.: :             "
	ECHO SET "map[1.25]=                                 \/                 \/                       : :'.': ',   ;'     ,;:'.'             "
	ECHO SET "map[1.25]=                                 \/                 \/                       : :'.': ',   ;'     ,;:'.'             "
	ECHO SET "map[1.26]=        \/      ~    \/                       ~                              : .': : ;'  ' ;.   '; :':              "
	ECHO SET "map[1.27]=                                    \/                        ~               : '.' ;'   ,';.   ,';:'               "
	ECHO SET "map[1.28]=        ~   \/                                                                : :'  ;',   ',.   ',;:                "
	ECHO SET "map[1.29]=               /\/\/\        ~                \/    . - - - - .               : :  ,.;'   .;    ;',:                "
	ECHO SET "map[1.30]=    \/        /\\/\//\             \/               :  .      :    ~        :'::   ,';.   ;',  ,;.':                "
	ECHO SET "map[1.31]=  ~          /\ /\/\ /\    \/                    /\/\/\  ;,'  :            '.' : ,';.  ,';.   ,;.':                 "
	ECHO SET "map[1.32]=        \/  ( //\/\/\\ )                  . - - /\\/\//\  \/  :           .'..:  ,';   ,.    ',.:  /\/\/\/\         "
	ECHO SET "map[1.33]=  \/        (/ \/\/\/ \)                  :  ; /\ /\/\ /\  ; ':          '...:  ';.   ,;'   ,;.:  /\ /\/\ /\        "
	ECHO SET "map[1.34]=             \\ /\/\ //         \/        : . ( //\/\/\\ )'   :         .:'.: ,';.  ,';.  ,';.'  (/ \/\/\/ \)       "
	ECHO SET "map[1.35]= - - - - - - - \:  :/ - - - - - - - - - - '   (/ \/\/\/ \) ;. :         '.:   ,;.'   ,';.  ,';.   \\ /\/\ //        "
	ECHO SET "map[1.36]=' ; \.    .   , :  :    ;./;   ; ; /,  ; .  '  \\ /\/\ //;  ; :             ',;.'  ,;.'  ,;.'       \:  :/          "
	ECHO SET "map[1.37]= . ; ;,\ ; /.   :  :   \;.  .\/;. ; /            \:  :/    \/ :          ,;.'   ;.,' ,;.'            :  :           "
	ECHO SET "map[1.38]=  ; ' ;  ;\/    :  : ;.  ;./;    ;.  ;.\ \/ ;. '  :  :  ,  .  :        ,;.'  ,;.'   ,;.'             :  :           "
	ECHO SET "map[1.39]= ; ;,   ;  ;/;. :  :    ;,  ;,\/;.        ;  .    :  : .,.    :     ,;.'. ,;.'  ,;.'                 :  :           "
	ECHO SET "map[1.40]= ;. /./ / ;  \/.'  '\  /  ,  . /;   ,/ ;./    \   :  :   , '  :      ',;   ',;.  ',.                 '  '           "
	ECHO SET "map[1.41]=' . /' .\;. /. ; ,'; \/ '  ' ;  ;./ .   ; ' ;    ':  :  \/.   ' - - .,;.,  ,;.'  ',;.                               "
	ECHO SET "map[1.42]=./ . \/ . /  '  , , .,/  . ./, ,.\,./ ,.      ;   :  : .;   ;    '  :;.'  ',;.  ;. ,                                "
	ECHO SET "map[1.43]=.  ,\/; ./., \/., . /. ., \,. ;/ , ,. \/,. '.  ;  '  '  ;   ' ,.'  ;:,    ;.',  ,;.'                                "
	ECHO SET "map[1.44]=  \.,/  \. / ,'. \ ; , ' .\/  , .' \   .  ;  ;' .  ;  . ' ;\/ .,   .';- -'-;- - -;- - - - - - - - - - - - - - - - - "
	ECHO SET "map[1.45]=;. \/ .,    , \/   ;. \/ ; ;.\/. , ; .   ;'/. ,  ';  .,. ,  '; .  ;,.'   ,';.  ,';.                                 "
	ECHO SET "map[1.46]= ,. '  ; \/   ';  ,  / '   \;' ,  \/;'  ;  , \/  ;'  ,  ;  ,;  ' ,;.   ,';.     ,;.'                                "
	ECHO SET "map[1.47]=  ;/  . '   ; '.    \ '  .' ;  '  . \/ '  .   ' ; '\/ ;  .'     ,;.'   ,;.'      ,;.'                               "
	ECHO SET "map[1.48]=A. ;\/   \/',  ;'  .,  ;,\/     ;' ,   \/ ,;  '  ,    /  ;.   ,;.'     ,';.        ';.,                            B"
) > .\buffer_layer_1.cmd
EXIT /B 0