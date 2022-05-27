@echo off
chcp 866>nul
cd %~dp0
call :Admin
set uwp=0
mode 100,100
echo.Wait...
powershell.exe -command "Get-AppxPackage -AllUsers | Select Name, PackageFullName > uwp.log"
mode 18,1
timeout /t 1 /nobreak>nul
type uwp.log | find "Microsoft.MinecraftUWP" >nul && set uwp=1
del uwp.log
if "%uwp%"=="0" (nhmb.exe -esc:~~ "Minecraft for Windows not found." "Minecraft Patcher" error
start ms-windows-store://pdp/?ProductId=9NBLGGH2JHXJ)
if "%uwp%"=="1" (goto :eof)
exit

:Admin
reg query "HKU\S-1-5-19\Environment" >nul 2>&1
if not %errorlevel% EQU 0 (
    cls
    powershell.exe -windowstyle hidden -noprofile "Start-Process '%~dpnx0' -Verb RunAs"
    exit 
)