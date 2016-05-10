Write-Host "Installing Chocolatey"
iex ((new-object net.webclient).DownloadString("https://chocolatey.org/install.ps1"))
$env:PATH += $env:ALLUSERSPROFILE + "\chocolatey\bin"

Write-Host "Installing Apps"
choco install console2

Write-Host "Updating configuration"
$consoleSettingsFolder = $env:USERPROFILE + "\AppData\Roaming\Console\"
$consoleSettingsFilePath = $consoleSettingsFolder + "\console.xml"
$consoleSourceSettingsFilePath = $env:BOXEN_SCRIPTS + "\console.xml"

Write-Host $consoleSettingsFilePath
Write-Host $env:BOXEN_SCRIPTS

new-item $consoleSettingsFolder -type directory -errorAction SilentlyContinue
copy-item $consoleSourceSettingsFilePath $consoleSettingsFilePath -force

Write-Host "Done!"