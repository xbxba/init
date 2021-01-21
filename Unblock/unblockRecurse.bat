@echo off

if "%~1" == "" (
	cmd /s /c "powershell dir "%userprofile%\Downloads" -recurse ^| unblock-file"
	) else cmd /s /c "for %%i in (%*) do (powershell dir "%%~dpnxi" -recurse ^| unblock-file)"

goto:EOF