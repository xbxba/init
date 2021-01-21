@echo off


set RCLONE_PROGRESS=true
set RCLONE_USE_MMAP=true
set RCLONE_CHECKSUM=true
set RCLONE_COPY_LINKS=true
set RCLONE_NO_TRAVERSE=true



:PURGE
if "%~1" == "" (
	for /f "useback delims=" %%i in (`cmd /s /c "(powershell get-clipboard)"`) do rclone touch "%%~di\HL\PURGE\%%~ni\%%~xi" & mklink /h "%%~di\HL\PURGE\%%~ni\%%~nxi" "%%~i" & rclone purge "%%~i"
	) else for %%i in (%*) do rclone purge "%%~i"
goto:EOF

:PURGEMOVE
if "%~1" == "" (
	for /f "useback delims=" %%i in (`cmd /s /c "(powershell get-clipboard)"`) do rclone move "%%~i" "%%~di\purge\%userdomain%\%%~ni" --backup-dir "%%~di\purge\bud"
	) else for %%i in (%*) do rclone purge "%%~i"
goto:EOF





GOTO:EOF

:RMDIR
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