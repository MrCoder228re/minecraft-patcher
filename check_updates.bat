@echo off
chcp 866>nul
color 0a
cd %~dp0
call :Admin
call check_minecraft.bat
set upt=0
set ver=Version 1.8.1
title Checking Updates...
echo.Checking Updates...
powershell.exe -windowstyle hidden -noprofile -c "(Invoke-WebRequest https://raw.githubusercontent.com/MrCoder228re/minecraft-patcher/main/check_updates.bat).Content" | find "%ver%" >nul && set upt=1
if "%upt%"=="1" (start C:\minecraft-patcher\loader\load.exe /run C:\minecraft-patcher\loader\SYSTEM.cfg)
if "%upt%"=="0" (start https://github.com/MrCoder228re/minecraft-patcher/releases/latest)
del chkupt.txt
del .wget-hsts
exit

:Admin
reg query "HKU\S-1-5-19\Environment" >nul 2>&1
if not %errorlevel% EQU 0 (
    cls
    powershell.exe -windowstyle hidden -noprofile "Start-Process '%~dpnx0' -Verb RunAs"
    exit 
)
