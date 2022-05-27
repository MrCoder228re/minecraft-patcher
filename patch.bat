@echo off
color 0a
chcp 866>nul
cd %~dp0
title Minecraft Patcher # By DiopinYT
echo.Closing processes that use the Microsoft Store DLL library...
start taskkill /f /im GameBarPresenceWriter.exe
start taskkill /f /im GameBarFTServer.exe
start taskkill /f /im gamingservices.exe
start taskkill /f /im WinStore.App.exe 
start taskkill /f /im XboxStub.exe 
start taskkill /f /im GameBar.exe 
start taskkill /f /im Minecraft.Windows.exe 
start taskkill /f /im RuntimeBroker.exe 
start taskkill /f /im explorer.exe
echo.Replacing Files...
timeout /t 3 /nobreak >nul
C:\minecraft-patcher\Unlocker\Unlocker.exe "C:\Windows\System32\Windows.ApplicationModel.Store.dll" -s -d
del "C:\Windows\System32\Windows.ApplicationModel.Store.dll" 
copy "C:\minecraft-patcher\dll\x64\System32\Windows.ApplicationModel.Store.dll" "C:\Windows\System32\Windows.ApplicationModel.Store.dll" 
C:\minecraft-patcher\Unlocker\Unlocker.exe "C:\Windows\SysWOW64\Windows.ApplicationModel.Store.dll" -s -d
del "C:\Windows\SysWOW64\Windows.ApplicationModel.Store.dll" 
copy "C:\minecraft-patcher\dll\x64\SysWOW64\Windows.ApplicationModel.Store.dll" "C:\Windows\SysWOW64\Windows.ApplicationModel.Store.dll" 
explorer C:\minecraft-patcher\explorer.lnk
echo ...done
timeout /t 1 /nobreak >nul
exit