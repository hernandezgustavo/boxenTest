#-- Disable shutdown tracker
if ( -Not (Test-Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability'))
{
    New-Item -Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT' -Name Reliability -Force
}

#-- Set the ShutdownReasonOn value
Set-ItemProperty -Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability' -Name ShutdownReasonOn -Value 0

#-- Remove the ShutdownReasonUI value
if ( (Test-Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonUI'))
{
    Remove-ItemProperty -Path 'registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Reliability' -Name ShutdownReasonUI
}


#-- Import the boxstarter hook
Import-Module $env:AppData\Boxstarter\Boxstarter.Chocolatey -DisableNameChecking
#-- Start the Chocolatey package install

#-- win config
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar
Disable-InternetExplorerESC
Enable-RemoteDesktop
Disable-UAC
Set-TaskbarOptions -Size Small

#-- system
cinst powershell4

#-- utilities
#7zip is installed on the base image
cinst conemu
cinst curl
cinst ie11
cinst sysinternals
cinst sumatrapdf
cinst windirstat
cinst wireshark

#-- dev tools
cinst gitextensions
cinst dotpeek
cinst markdownpad2
cinst fiddler4
cinst linqpad4
cinst ilmerge
cinst nuget.commandline
cinst nugetpackageexplorer
cinst sublimetext3.app
cinst windbg


#-- task bar items
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\ConEmu\ConEmu64.exe"
Install-ChocolateyPinnedTaskBarItem "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe"


#-- Install sublime text packages and user settings
Copy-Item "c:\hosthome\src\configuration\sublime-text\Package Control.sublime-settings" "$Env:UserProfile\AppData\Roaming\Sublime Text 3\Packages\User\Package Control.sublime-settings"
Copy-Item "c:\hosthome\src\configuration\sublime-text\Preferences.sublime-settings" "$Env:UserProfile\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings"

#-- Install configuration files
Copy-Item c:\hosthome\src\configuration\changepoint\windows\.bashrc $Env:UserProfile\.bashrc
Copy-Item c:\hosthome\src\configuration\changepoint\windows\.gitconfig $Env:UserProfile\.gitconfig
