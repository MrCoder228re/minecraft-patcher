@echo off
echo.Launching Minecraft!
echo.
echo.Please Wait...
cd %~dp0
set p=0
certutil -hashfile "C:\Windows\System32\Windows.ApplicationModel.Store.dll" sha1>>hashes.txt
certutil -hashfile "C:\Windows\SysWOW64\Windows.ApplicationModel.Store.dll" sha1>>hashes.txt
type hashes.txt | findstr /I /N "8e92ff0b8ff2d1b0c2fbe59bcbb1705febadcbfd 92f46f5e11d1635ad48fee5c3d1b1632fcb5f549" >nul && set p=1
del hashes.txt
if "%p%"=="1" (explorer mc.lnk)
if "%p%"=="0" (nhmb.exe -esc:~~ "Patch not found! Please open Minecraft Patcher and patch it." "Minecraft Patcher" error
exit)