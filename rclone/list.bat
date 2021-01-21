@echo off
if "%~1" == "" (rclone listremotes) else rclone listremotes --long
goto:EOF