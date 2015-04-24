$boxenHome = 'C:\src\our-boxen\modules\people\delta62\files'

#-- Windows Tweaks
Set-WindowsExplorerOptions -EnableShowFileExtensions
Disable-UAC
Set-TaskbarOptions -Size Small

#-- Chocolatey Installation
cinst -y cygwin
cinst -y cyg-get
cinst -y nuget.commandline
cinst -y nugetpackageexplorer

#-- Install configuration files
$configs = @(
    '.bash_profile',
    '.screenrc',
    '.vimrc'
)
foreach ($config in $configs)
{
    Copy-Item "$boxenHome\$config" $Env:UserProfile
}

#-- Install *nix tools under cygwin
cyg-get vim
cyg-get git
cyg-get screen

#-- Cygwin should use windows home folder
# /etc/nsswitch.conf db_home: windows

#-- Link to git completion scripts
# ln -s /etc/git/completion ~/.git_completion.sh
# ln -s /etc/git/prompt ~/.git_prompt.sh
