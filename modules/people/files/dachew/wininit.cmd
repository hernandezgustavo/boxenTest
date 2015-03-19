rem #-- let powershell execute scripts
powershell -Command "Set-ExecutionPolicy Unrestricted -Force"
SET chocolatey_bin_root=C:\ProgramData\chocolatey\stuff

rem #-- install chocolatey
powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
SET PATH=%PATH%;%chocolatey_bin_root%;C:\ProgramData\chocolatey\bin;

cinst -y boxstarter

powershell -ExecutionPolicy unrestricted -File "C:\hosthome\src\configuration\changepoint\windows\setup.ps1"
