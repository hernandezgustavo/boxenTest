rem #-- let powershell execute scripts
powershell -Command "Set-ExecutionPolicy Unrestricted -Force"
SET chocolatey_bin_root=c:\chocolatey\bin

rem #-- install chocolatey
powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
SET PATH=%PATH%;%chocolatey_bin_root%

rem #-- install boxstarter
cinst boxstarter

powershell -ExecutionPolicy unrestricted -Command "Install-BoxstarterPackage -PackageName C:\hosthome\src\setup-windows\changepoint\setup.ps1"
