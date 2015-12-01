rem #-- winit.cmd seems to be required for provisioning now.
powershell -Command "Set-ExecutionPolicy Unrestricted -Force"

@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
