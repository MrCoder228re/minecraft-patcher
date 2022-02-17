

Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);'

[Console.Window]::ShowWindow([Console.Window]::GetConsoleWindow(), 0)
<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    patcher
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$win                             = New-Object system.Windows.Forms.Form
$win.ClientSize                  = New-Object System.Drawing.Point(490,340)
$win.text                        = "Minecraft Patcher # By DiopinYT"
$win.TopMost                     = $false
$win.icon                        = "C:\minecraft-patcher\icon.ico"

$BP                              = New-Object system.Windows.Forms.Button
$BP.text                         = "Patch!"
$BP.width                        = 150
$BP.height                       = 30
$BP.location                     = New-Object System.Drawing.Point(10,300)
$BP.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$SMB                             = New-Object system.Windows.Forms.Button
$SMB.text                        = "Start Minecraft!"
$SMB.width                       = 150
$SMB.height                      = 30
$SMB.location                    = New-Object System.Drawing.Point(170,300)
$SMB.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$img                             = New-Object system.Windows.Forms.PictureBox
$img.width                       = 470
$img.height                      = 280
$img.location                    = New-Object System.Drawing.Point(10,10)
$img.imageLocation               = "C:\minecraft-patcher\img.png"
$img.SizeMode                    = [System.Windows.Forms.PictureBoxSizeMode]::zoom
$SFB                             = New-Object system.Windows.Forms.Button
$SFB.text                        = "Start Fix MStore!"
$SFB.width                       = 150
$SFB.height                      = 30
$SFB.location                    = New-Object System.Drawing.Point(330,300)
$SFB.Font                        = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$aa                              = New-Object system.Windows.Forms.Label
$aa.AutoSize                     = $true
$aa.width                        = 1
$aa.height                       = 1
$aa.location                     = New-Object System.Drawing.Point(489,339)
$aa.Font                         = New-Object System.Drawing.Font('Microsoft Sans Serif',1)

$win.controls.AddRange(@($BP,$SMB,$img,$SFB,$aa))

$BP.Add_Click({ patch })
$SMB.Add_Click({ start_minecraft })
$SFB.Add_Click({ start_fix })
$win.Add_MaximumSizeChanged({ aa })
$win.Add_MinimumSizeChanged({ aa })

function start_fix { 
    Start-Process 'conhost.exe' -Args 'C:\minecraft-patcher\fix.bat' -Verb RunAs
}
function start_minecraft { 
    explorer.exe "C:\minecraft-patcher\minecraft.lnk"
}
function patch {
    Start-Process 'conhost.exe' -Args 'C:\minecraft-patcher\patch.bat' -Verb RunAs
}


#Write your logic code here
$win.AutoSize = $true
cmd /c del "C:\minecraft-patcher\Are you sure you want to continue.exe"
$uac = 0
if ( (Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System).EnableLUA -ne 1 ) {
$uac = 1
}
if ( (Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System).ConsentPromptBehaviorAdmin -ne 1 ) {
$uac = 1
}
if ( $uac -ne 0 ) {
    $wshell = New-Object -ComObject Wscript.Shell
    $Output = $wshell.Popup("Error: UACisDisabled
Please Open a Program Again!")
    Start-Process 'conhost.exe' -Args 'C:\minecraft-patcher\fix-uac.bat' -Verb RunAs
    exit
}
[void]$win.ShowDialog()