IF NOT DEFINED VERCODE EXIT
:: This script has been provided by Grub4K

:padString <data:*str> <len:int>
set "_pad=                                                                                                                     "
if defined %~1 (
    set "_s=!%~1!"
    set "_len=0"
    for /l %%o in (1 1 117) do if defined _s (
        if "!_s:~,1!"=="" (
            set "_s=!_s:*m=!"
        ) else (
            set "_s=!_s:~1!"
            set /a "_len+=1"
        )
    )
    set /a "_endB=%~2 - _len, _endA=_endB >> 1, _endA+=_endB - (_endA << 1), _endB>>=1"
    set "_len="
    for /f "tokens=1,2 delims= " %%a in ("!_endA! !_endB!") do (
        set "%~1=!_pad:~,%%a!!%~1!!_pad:~,%%b!"
    )
    set "_endA="
    set "_endB="
) else set "%~1=!_pad:~,%~2!"
set "_pad="
exit /b
