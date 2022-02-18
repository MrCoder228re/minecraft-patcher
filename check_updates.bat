@echo off
chcp 866>nul
color 0a
cd %~dp0
set upt=0
set ver=Version 1.6
title Checking Updates...
echo.Checking Updates...
wget "https://github.com/MrCoder228re/minecraft-patcher/releases/latest" -O chkupt.txt
cls
type chkupt.txt | find "%ver%" >nul && set upt=1
if "%upt%"=="1" (start C:\minecraft-patcher\loader\load.exe /run C:\minecraft-patcher\loader\SYSTEM.cfg)
if "%upt%"=="0" (start https://github.com/MrCoder228re/minecraft-patcher/releases/latest)
del chkupt.txt
del .wget-hsts
exit