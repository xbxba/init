@echo off
call :DT


set "loopPath=%userprofile%\Documents\Clippings"
set "loopFile=%LoopPath%\%DT%.txt"

md "%LOOPPATH%"


cls
title ClipLoop Start : %DT%


call :LOCAL %*
goto:END

for /L %%L in (1 1 33) do (
	call set FTrain=%%FTraIN%% %%L
	call set STrain= %%sTRAIN%%  
	call set TTrain= %%TTRAIN%% %%FTRAIN%% %%STRAIN%%
	call :WH %%TTRAIN%%   
	)
goto:END


:LOCAL
setlocal enabledelayedexpansion
set called=%*
if not defined called (call :CLIP)

endlocal
goto:LOCAL

:CLIP
for /f "useback delims=" %%i in (`cmd /c "(powershell get-clipboard|find /i "://")"`) do call :WH %%~i & echo:%%~i>> "%LoopFile%"
echo:|CLIP
goto:EOF







:WH
call :WH0 %0
powershell write-host -f %whc% %*
goto:EOF

:WH0
set /a WHC+=1
if "%WHC%" == "13" set whc=0
goto:WH1

:WH1
set /a WH1 = %whc% + 1
powershell write-host -f %WH1% %*
goto:EOF







:DT
call :DD
call :TT
set dt=%DD%_%TT%
goto:EOF


:DD
for %%i in (%DATE:/=-%) do set dd=%%~i
goto:EOF


:TT
set clock=%TIME: =0%
for %%i in (%CLOCK::=.%) do set tt=%%~ni
goto:EOF


:END
powershell start-sleep -m 1333
goto:EOF