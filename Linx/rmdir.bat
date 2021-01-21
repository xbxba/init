@echo off

if "%~1" == "" (
	for /f "useback delims=" %%i in (`cmd /s /c "(powershell get-clipboard)"`) do rmdir "%%~i"
	) else for %%i in (%*) do rmdir "%%~i"
goto:EOF




GOTO:EOF

:UNBLOCK_FILE
if "%~1" == "" (
	cmd /s /c "powershell dir "%userprofile%\Downloads" -recurse ^| unblock-file"
	) else cmd /s /c "for %%i in (%*) do (powershell dir "%%~dpnxi" -recurse ^| unblock-file)"

goto:EOF