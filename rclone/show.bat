@echo off

if "%~1" == "" (call :CLIPSHOW) else call :SHOW %*

goto:EOF
:CLIPSHOW
for /f "useback delims=" %%i in (`rclone listremotes`) do (
	for /f "useback delims=" %%I in (`cmd /c "(for %%$ in (%%i) do @(powershell get-clipboard|find /i "%%$") )"`) do (
			call :SHOW "%%~I"
		)
	)
goto:EOF

			rclone config show "%*"

:SHOW
for %%i in (%*) do (
	set "remote=%%~i"
	call set "remote=%%REMOTE::=%%"
	call rclone config show "%%REMOTE%%:"
	)
goto:EOF


goto:EOF


:UPDATEDRIVE

call :UPDATE %*
goto:EOF

goto:EOF
:REMOVEDIRS
cd /D "%~dpnx1"
cls

if "%~1" == "" (call :CLIP) else for %%i in (%*) do (
				set "call=%%~i"
				call :RMDIRS1
				)

goto:END

call :LOCAL %*

goto:END

:RMDIRS1
for /D %%D in ("%CALL%\*") do (rclone rmdirs "%%~D")
	cd.. & rclone rmdirs "%CALL%" & goto:EOF
:RMDIRS2
for /D %%D in ("%CLIP%\*") do (rclone rmdirs "%%~D")
	cd.. & rclone rmdirs "%CLIP%" & goto:EOF



:CLIP
:LOCAL


for /f "useback delims=" %%i in (
`cmd /c "(for %%$ in (/ \ :) do @(powershell get-clipboard|find /i "%%$") )"`
) do set "clip=%%~i" & call :RMDIRS2
goto:EOF
		


:LIST
rclone listremotes --long
goto:EOF

:UPDATE
set "one=%~1" & set "two=%~2"
		set "tre=%*"
call set "tre=%%TRE:*%one%=%%"

rclone config update "%one%" team_drive %TRE%

			goto:EOF






:END
powershell start-sleep -m 1333
goto:EOF