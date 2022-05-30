# Init PowerShell GUI - ft. HTSoft: Test Form
Using Assembly System.Windows.Forms
Using NameSpace System.Windows.Forms
Using NameSpace System.Drawing
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Drawing
[reflection.assembly]::LoadWithPartialName("System.Windows.Forms")
[System.Windows.Forms.Application]::EnableVisualStyles();


# - - Scripts - - #
$iconPath = $env:TEMP + "\icon32hts.ico"
$TestIco = Test-Path -Path $iconPath
if($TestIco -like '*False*') {
    Invoke-WebRequest -Uri "https://htssoft.tk/images/icon32.ico" -OutFile $iconPath
}

[string]$DirLocation = Get-Location
$DirFolder = $DirLocation + "\BattlesOfBatch"
$DirZip = $DirLocation + "\BattlesOfBatch.zip"
$ChangeDir = {
    Function Get-Folder($initialDirectory="")
    {
        [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null

        $folderName = New-Object System.Windows.Forms.FolderBrowserDialog
        $folderName.Description = "Select a directory, this is where the game will be installed."
        $folderName.rootfolder = "Desktop"
        $folderName.SelectedPath = $initialDirectory

        if($folderName.ShowDialog() -eq "OK")
        {
            $DirLocation += $folderName.SelectedPath
        }
        return $DirLocation
    }
    $global:DirLocation = Get-Folder
    $global:DirFolder = $DirLocation + "\BattlesOfBatch"
    $global:DirZip = $DirLocation + "\BattlesOfBatch.zip"
    $WillDir.text = $DirFolder
}

# - - - - - - - - #

$Form = New-Object system.Windows.Forms.Form
$Form.FormBorderStyle = 'None'
$Form.StartPosition   = "CenterScreen"
$Form.ClientSize      = '500,300'
$Form.text            = "HTSoft-Studios : Battles of Batch - Wizard"
$Form.BackColor       = "white"
$Icon                 = New-Object system.drawing.icon ("$iconPath")
$Form.Icon            = $Icon
$Form.add_paint({$whitePen = New-Object System.Drawing.Pen([system.drawing.color]::gray, 6)
$_.graphics.drawrectangle($whitePen,$this.clientrectangle)
})
$UpperBorder = New-Object Drawing.Pen gray
$UpperBorder.width = 25
$FormGraphics = $Form.createGraphics()
$Form.add_paint({$FormGraphics.DrawLine($UpperBorder, 3, 15, 497, 15)})
$code = @"
[System.Runtime.InteropServices.DllImport("gdi32.dll")]
public static extern IntPtr CreateRoundRectRgn(int nLeftRect, int nTopRect,
    int nRightRect, int nBottomRect, int nWidthEllipse, int nHeightEllipse);
"@
$Win32Helpers = Add-Type -MemberDefinition $code -Name "Win32Helpers" -PassThru
$Form.add_Load({
    $hrgn = $Win32Helpers::CreateRoundRectRgn(0,0,$Form.Width, $Form.Height, 9,9)
    $Form.Region = [Region]::FromHrgn($hrgn)
})



$fileImg = (get-item $iconPath)
$img = [System.Drawing.Image]::Fromfile($fileImg);

$pictureBox           = new-object Windows.Forms.PictureBox
$pictureBox.Size      = New-Object System.Drawing.Size($img.Width,$img.Height)
$pictureBox.Image     = $img
$pictureBox.location  = New-Object System.Drawing.Point(6,0)
$pictureBox.BackColor = [System.Drawing.Color]::FromName("Gray")

$Fix          = New-Object system.Windows.Forms.Label
$Fix.width    = 50
$Fix.height   = 4
$Fix.location = New-Object System.Drawing.Point(3,28)
$Fix.BackColor = [System.Drawing.Color]::FromName("white")

$OrganizationName          = New-Object system.Windows.Forms.Label
$OrganizationName.text     = "HTSoft-Studios"
$OrganizationName.AutoSize = $true
$OrganizationName.location = New-Object System.Drawing.Point(39,7)
$OrganizationName.Font     = 'Microsoft Sans Serif,9,style=Bold'
$OrganizationName.BackColor = [System.Drawing.Color]::FromName("Gray")
$OrganizationName.ForeColor = [System.Drawing.Color]::FromName("White")

$Title          = New-Object system.Windows.Forms.Label
$Title.text     = "Welcome to the Wizard"
$Title.AutoSize = $true
$Title.location = New-Object System.Drawing.Point(20,30)
$Title.Font     = 'Microsoft Sans Serif,13'

$GuideU          = New-Object system.Windows.Forms.Label
$GuideU.text     = "We will guide you through the installation of Battles of Batch!"
$GuideU.AutoSize = $true
$GuideU.location = New-Object System.Drawing.Point(21,52)
$GuideU.Font     = 'Microsoft Sans Serif,8'

$Description          = New-Object system.Windows.Forms.Label
$Description.text     = "Battles of Batch is a game which runs on window's MS-DOS terminal. It's an RPG text game, where you fight enemies in various battles."
$Description.AutoSize = $false
$Description.width    = 450
$Description.height   = 50
$Description.location = New-Object System.Drawing.Point(20,100)
$Description.Font     = 'Microsoft Sans Serif,10'

$WillDir           = New-Object system.Windows.Forms.Label
$WillDir.text      = $DirLocation + "\BattlesOfBatch"
$WillDir.AutoSize  = $false
$WillDir.width     = 410
$WillDir.height    = 70
$WillDir.location  = New-Object System.Drawing.Point(80,160)
$WillDir.Font      = [System.Drawing.Font]::new("Microsoft Sans Serif", 10, [System.Drawing.FontStyle]::Underline)
$WillDir.ForeColor = [System.Drawing.Color]::FromName("black")
$willDir.Cursor    = 'Hand'
$WillDir.add_Click($ChangeDir)
$WillText          = New-Object system.Windows.Forms.Label
$WillText.text     = "Directory:"
$WillText.AutoSize = $false
$WillText.width    = 450
$WillText.height   = 50
$WillText.location = New-Object System.Drawing.Point(20,160)
$WillText.Font     = 'Microsoft Sans Serif,10'

$AboutMore           = New-Object system.Windows.Forms.Label
$AboutMore.text      = "Find More Projects"
$AboutMore.ForeColor = "BLUE"
$AboutMore.AutoSize  = $true
$AboutMore.location  = New-Object System.Drawing.Point(30,250)
$AboutMore.Font      = [System.Drawing.Font]::new("Microsoft Sans Serif", 9, [System.Drawing.FontStyle]::Underline)
$AboutMore.Cursor    = 'Hand'
$AboutMore.add_Click({[system.Diagnostics.Process]::start("https://htssoft.tk/")})

$nextBtn           = New-Object system.Windows.Forms.Button
$nextBtn.BackColor = "#ffffff"
$nextBtn.text      = "Install"
$nextBtn.width     = 90
$nextBtn.height    = 30
$nextBtn.location  = New-Object System.Drawing.Point(390,250)
$nextBtn.Font      = 'Microsoft Sans Serif,10'
$nextBtn.ForeColor = "#000"
Function InstallProcess {
    $Form.Controls.Add($InstallText);
    $Form.Controls.Add($progressBar);
    Start-Sleep(1)
    $ProgressBar.Value = 30
    Start-Sleep(1)
    try {
        Invoke-WebRequest -Uri "https://htssoft.tk/get-download/battlesofbatch-latest.zip" -OutFile $DirZip
        Get-Job | Wait-Job
        Expand-Archive $DirZip -DestinationPath $DirFolder
        Get-Job | Wait-Job
        Remove-Item $DirZip
        Get-Job | Wait-Job
        $ProgressBar.Value = 100
        Get-Job | Wait-Job
        $Form.Cursor = 'Arrow'
        $Form.Controls.Remove($InstallText);
        $Form.Controls.Remove($progressBar);
        $Form.Controls.Add($CompleteText);
        $Form.Controls.Add($InstalledAt);
        $Form.Controls.Add($InstalledDir);
    }
    catch {
        $Form.Cursor = 'Arrow'
        $Form.Controls.Remove($InstallText);
        $Form.Controls.Remove($progressBar);
        $Form.Controls.Add($Failed);
    }
}
Function ReinstallProcess{
    $Form.Controls.Remove($Exists);
    $Form.Controls.Remove($ReinstallBtn);
    Remove-Item -LiteralPath $DirFolder -Force -Recurse
}
$CmdSecondForm = {
    $Form.Cursor = 'AppStarting'
	$Form.Controls.Remove($AboutMore);
	$Form.Controls.Remove($nextBtn);
	$Form.Controls.Remove($AboutMore);
	$Form.Controls.Remove($Description);
	$Form.Controls.Remove($GuideU);
	$Form.Controls.Remove($Title);
    $Form.Controls.Remove($WillText);
    $Form.Controls.Remove($WillDir);
	$Form.Controls.Remove($AboutMore);
	$Form.Controls.Remove($nextBtn);
    $TestPath = Test-Path -Path $DirFolder
    if($TestPath -like '*True*') {
        $Form.Cursor = 'Arrow'
        $Form.Controls.Remove($InstallText);
        $Form.Controls.Remove($progressBar);
        $Form.Controls.Add($Exists);
        $Form.Controls.Add($ReinstallBtn);
    } else {
        InstallProcess
    }
}
$nextBtn.Add_Click($CmdSecondForm)

$closeBtn              = New-Object system.Windows.Forms.Button
$closeBtn.BackColor    = "#ffffff"
$closeBtn.text         = "Close"
$closeBtn.width        = 90
$closeBtn.height       = 30
$closeBtn.location     = New-Object System.Drawing.Point(290,250)
$closeBtn.Font         = 'Microsoft Sans Serif,10'
$closeBtn.ForeColor    = "#000"
$closeBtn.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$Form.CancelButton = $closeBtn

$Form.controls.AddRange(@($Title,$Fix,$Description,$OrganizationName,$AboutMore,$GuideU,$pictureBox,$nextBtn,$closeBtn,$WillDir,$WillText))


$InstallText          = New-Object system.Windows.Forms.Label
$InstallText.text     = "The installation is in process, please wait ..."
$InstallText.AutoSize = $true
$InstallText.location = New-Object System.Drawing.Point(20,30)
$InstallText.Font     = 'Microsoft Sans Serif,13'

$ProgressBar          = New-Object system.Windows.Forms.ProgressBar
$ProgressBar.width    = 400
$ProgressBar.height   = 35
$ProgressBar.location = New-Object System.Drawing.Point(50,125)
$ProgressBar.Maximum  = 100
$ProgressBar.Minimum  = 0
$ProgressBar.Style    = "Continuous"
$progressBar.Step     = 1

$CompleteText          = New-Object system.Windows.Forms.Label
$CompleteText.text     = "The installation was successful!"
$CompleteText.AutoSize = $true
$CompleteText.location = New-Object System.Drawing.Point(20,30)
$CompleteText.Font     = 'Microsoft Sans Serif,17'
$CompleteText.ForeColor = [System.Drawing.Color]::FromName("DarkGreen")

$InstalledAt           = New-Object system.Windows.Forms.Label
$InstalledAt.text      = "Click to open directory:"
$InstalledAt.AutoSize  = $true
$InstalledAt.location  = New-Object System.Drawing.Point(20,90)
$InstalledAt.Font      = 'Microsoft Sans Serif,15'
$InstalledAt.ForeColor = [System.Drawing.Color]::FromName("black")

$InstalledDir           = New-Object system.Windows.Forms.Label
$InstalledDir.text      = $DirFolder
$InstalledDir.AutoSize  = $false
$InstalledDir.width     = 420
$InstalledDir.height    = 70
$InstalledDir.location  = New-Object System.Drawing.Point(21,120)
$InstalledDir.Font      = [System.Drawing.Font]::new("Microsoft Sans Serif", 10, [System.Drawing.FontStyle]::Underline)
$InstalledDir.ForeColor = [System.Drawing.Color]::FromName("black")
$InstalledDir.Cursor    = 'Hand'
$InstalledDir.add_Click({[system.Diagnostics.Process]::start($DirFolder)})

$Failed          = New-Object system.Windows.Forms.Label
$Failed.text     = "Installation failed."
$Failed.AutoSize = $true
$Failed.location = New-Object System.Drawing.Point(20,90)
$Failed.Font     = 'Microsoft Sans Serif,15'
$Failed.ForeColor = [System.Drawing.Color]::FromName("DarkRed")

$Exists          = New-Object system.Windows.Forms.Label
$Exists.text     = "This product is already installed on the specified directory."
$Exists.AutoSize = $true
$Exists.location = New-Object System.Drawing.Point(20,90)
$Exists.Font     = 'Microsoft Sans Serif,13'
$Exists.ForeColor = [System.Drawing.Color]::FromName("DarkRed")

$ReinstallBtn           = New-Object system.Windows.Forms.Button
$ReinstallBtn.BackColor = "#ffffff"
$ReinstallBtn.text      = "Reinstall"
$ReinstallBtn.width     = 90
$ReinstallBtn.height    = 30
$ReinstallBtn.location  = New-Object System.Drawing.Point(390,250)
$ReinstallBtn.Font      = 'Microsoft Sans Serif,10'
$ReinstallBtn.ForeColor = "#d92418"
$ReinstallBtn.Add_Click({ReinstallProcess;InstallProcess})

[void]$Form.ShowDialog()