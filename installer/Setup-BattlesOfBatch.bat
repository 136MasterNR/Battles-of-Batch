@ECHO OFF
IF NOT DEFINED IS_MINIMIZED SET IS_MINIMIZED=1 && START "" /MIN "%~DPNX0" %* && EXIT
POWERSHELL -EXECUTIONPOLICY BYPASS -FILE .\data.ps1
EXIT