SET "ERRORLEVEL="
SET "ERRORLVL="
IF %AUDIO.VALUE%==TRUE ( SET "ERRORLEVEL="&TASKLIST /FI "IMAGENAME eq wscript.exe*" 2>NUL|FIND /I /N "wscript.exe">NUL&SET "ERRORLVL=%ERRORLEVEL%" & TASKKILL /F /IM wscript.exe>NUL ) ELSE ( SET ERRORLVL=NUL & TASKKILL /F /IM wscript.exe*>NUL )
SET "TARGETAUDIO=%AUD.MENU%"
IF %AUDIO.VALUE%==TRUE (
	IF EXIST "%TARGETAUDIO%" (
		IF /I "%ERRORLVL%"=="0" (
			TASKKILL /F /FI "WINDOWTITLE eq wscript.exe" /T>NUL
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.settings.setMode "loop", True
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP_A%"
			START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP_A%"^&EXIT
		) ELSE IF /I "%ERRORLVL%"=="1" (
			(
				ECHO Set Sound = CreateObject^("WMPlayer.OCX.7"^)
				ECHO Sound.URL = "%TARGETAUDIO%"
				ECHO Sound.Controls.play
				ECHO Sound.settings.volume = %VOLUME%
				ECHO Sound.settings.setMode "loop", True
				ECHO Sound.Controls.play
				ECHO While Sound.playState ^<^> 1
				ECHO      WScript.Sleep 100
				ECHO Wend
			) > "%DATA_TMP_A%%\TMP_AUDIO.vbs"
			START /min "wscript.exe" cmd /c START /min /wait "" "%DATA_TMP_A%"^&DEL /Q "%DATA_TMP_A%"^&EXIT
		)
	)
)
EXIT /B 0