
mkdir C:/catfacts
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Excrement/CatFacts/master/facts.txt" -OutFile "C:/catfacts/facts.txt"
Invoke-WebRequest -Uri "https://github.com/Excrement/CatFacts/raw/master/catfacts.exe" -OutFile "C:/catfacts/catfacts.exe"

function killcat{
taskkill /IM "CatFacts.exe" /F
setLabelNot
}

function enableStartup {
Invoke-WebRequest -Uri "https://github.com/Excrement/CatFacts/raw/master/catfacts.exe" -OutFile "..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CatFacts.exe"
cd "..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
#start "\catfacts.exe"
startcat
}

function disableStartup {
killcat
Remove-Item -Path "\catfacts.exe" -Force
Remove-Item -Path "..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CatFacts.exe" -Force

Remove-Item -Path "..\..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CatFacts.exe" -Force
Remove-Item -Path "..\..\..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CatFacts.exe" -Force
Remove-Item -Path "..\..\..\..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CatFacts.exe" -Force
Remove-Item -Path "..\..\..\..\..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CatFacts.exe" -Force
Remove-Item -Path "..\..\..\..\..\..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CatFacts.exe" -Force
Remove-Item -Path "..\..\..\..\..\..\..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CatFacts.exe" -Force
Remove-Item -Path "..\..\..\..\..\..\..\..\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CatFacts.exe" -Force

rmdir "C:\catfacts" -Force -Recurse
}

function startcat {

start "C:\catfacts\catfacts.exe"
setLabelRunning
}

function setLabelRunning
{
$runninglabel.text               = "CatFacts is running."
$runninglabel.ForeColor          = "#417505"
}

function setLabelNot
{


$runninglabel.text               = "CatFacts is not running."
$runninglabel.ForeColor          = "#d0021b"

}
killCat

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = '190,263'
$Form.text                       = "CatFacts"
$Form.TopMost                    = $false

$runninglabel                    = New-Object system.Windows.Forms.Label
$runninglabel.text               = "CatFacts is not running."
$runninglabel.AutoSize           = $true
$runninglabel.width              = 25
$runninglabel.height             = 10
$runninglabel.location           = New-Object System.Drawing.Point(20,25)
$runninglabel.Font               = 'Microsoft Sans Serif,10,style=Bold'
$runninglabel.ForeColor          = "#d0021b"

$startupBtn                      = New-Object system.Windows.Forms.Button
$startupBtn.text                 = "Add to Startup"
$startupBtn.width                = 150
$startupBtn.height               = 30
$startupBtn.location             = New-Object System.Drawing.Point(20,45)
$startupBtn.Font                 = 'Microsoft Sans Serif,10'

$killBtn2                        = New-Object system.Windows.Forms.Button
$killBtn2.text                   = "Remove from Startup"
$killBtn2.width                  = 150
$killBtn2.height                 = 30
$killBtn2.location               = New-Object System.Drawing.Point(20,85)
$killBtn2.Font                   = 'Microsoft Sans Serif,10'

$runOnceBtn                      = New-Object system.Windows.Forms.Button
$runOnceBtn.text                 = "Run Once"
$runOnceBtn.width                = 150
$runOnceBtn.height               = 30
$runOnceBtn.location             = New-Object System.Drawing.Point(20,165)
$runOnceBtn.Font                 = 'Microsoft Sans Serif,10'

$killBtn                         = New-Object system.Windows.Forms.Button
$killBtn.text                    = "Kill"
$killBtn.width                   = 150
$killBtn.height                  = 30
$killBtn.location                = New-Object System.Drawing.Point(20,205)
$killBtn.Font                    = 'Microsoft Sans Serif,10'

$Form.controls.AddRange(@($runninglabel,$startupBtn,$killBtn2,$runOnceBtn,$killBtn))

$startupBtn.Add_Click({ enableStartup })
$killBtn2.Add_Click({ disableStartup })
$runOnceBtn.Add_Click({ startcat })
$killBtn.Add_Click({ killcat })



#Write your logic code here

[void]$Form.ShowDialog()
