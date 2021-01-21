@echo off
::	https://www.addictivetips.com/windows-tips/find-disk-and-volume-guid-windows-10/


powershell "GWMI -namespace root\cimv2 -class win32_volume | FL -property DriveLetter, DeviceID"