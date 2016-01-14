Write-Host "Installing Chocolatey"
iex ((new-object net.webclient).DownloadString("https://chocolatey.org/install.ps1"))
$env:PATH += $env:ALLUSERSPROFILE + "\chocolatey\bin"

Write-Host "Installing Apps"
choco install console2

Write-Host "Done!"