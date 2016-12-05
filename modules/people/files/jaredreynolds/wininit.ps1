Update-CurrentProcessPsModulePath


#
# Add wininit-utils type
#
Write-BoxstarterMessage 'Add wininit-utils type'
$wininitPath = $env:BOXEN_PERSONAL_DIRECTORY
Write-BoxstarterMessage "$wininitPath"
Add-Type -Path (JOIN-PATH "$wininitPath" 'wininit-utils.cs')


#
# Autologon
#
Write-BoxstarterMessage 'Set Autologon'
$winlogonKeyPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'
if ((Get-ItemProperty -Path $winlogonKeyPath).AutoAdminLogon -ne 1) {
    Set-ItemProperty -Path $winlogonKeyPath -Name AutoAdminLogon -Value 1
    Set-ItemProperty -Path $winlogonKeyPath -Name DefaultUserName -Value "$env:COMPUTERNAME\Administrator"
    Set-ItemProperty -Path $winlogonKeyPath -Name DefaultPassword -Value 'only1secret4QA'
    Invoke-Reboot
}


#
# Re-arm Windows license
#
# Write-BoxstarterMessage 'Re-arm Windows license'
# $activationStatus = Get-CimInstance SoftwareLicensingProduct -Filter "ApplicationID = '55c92734-d682-4d71-983e-d6ec3f16059f' AND PartialProductKey is not null" -Property GracePeriodRemaining, LicenseStatus
# if ($activationStatus.LicenseStatus -ge 2 -and $activationStatus.GracePeriodRemaining -le 5) {
#     $slmgrPath = Join-Path (Join-Path $env:SystemRoot 'System32') 'slmgr.vbs'
#     cscript.exe $slmgrPath //Nologo /rearm
#     Invoke-Reboot
# }


#
# Windows updates
#
Enable-MicrosoftUpdate
Install-WindowsUpdate -getUpdatesFromMS -acceptEula -criteria "(IsHidden=0 AND IsInstalled=0 AND AutoSelectOnWebSites=1)"
if (Test-PendingReboot) {
    Invoke-Reboot
}


#
# Disable IE ESC
#
Disable-InternetExplorerESC


#
# Windows Update on with auto-download but prompt to install critical and suggested
#
# Write-BoxstarterMessage 'Windows Update'
# $autoUpdate = New-Object -ComObject "Microsoft.Update.AutoUpdate"
# if ($autoUpdate.Settings.NotificationLevel -ne 3) {
#     $autoUpdate.Settings.NotificationLevel = 3    # notify before installation
#     $autoUpdate.Settings.IncludeRecommendedUpdates = 1
#     $autoUpdate.Settings.Save()
#     Enable-MicrosoftUpdate
#     Invoke-Reboot
# }
# $autoUpdate.DetectNow()  # causes Windows Update Agent to update itself
# Install-WindowsUpdate -getUpdatesFromMS -acceptEula -criteria "(IsHidden=0 AND IsInstalled=0 AND AutoSelectOnWebSites=1)"


#
# Notepad2 redirect
#
Write-BoxstarterMessage 'Notepad2 redirect'
$notepadRedirectKeyPath = 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\notepad.exe'
$notepad2Path = "`"" + (JOIN-PATH -Path $env:USERPROFILE -ChildPath 'Utils\Notepad2_x64.exe') + "`" /z"
New-Item -Path $notepadRedirectKeyPath -Force -ErrorAction SilentlyContinue
Set-ItemProperty -Path $notepadRedirectKeyPath -Name 'Debugger' -Value $notepad2Path


#
# Console settings
#
Write-BoxstarterMessage 'Console settings'
$consoleKeyPath = 'HKCU:\Console'
Set-ItemProperty -Path $consoleKeyPath -Name QuickEdit -Value 1
Set-ItemProperty -Path $consoleKeyPath -Name ScreenBufferSize -Value 0x270F0078
Set-ItemProperty -Path $consoleKeyPath -Name WindowSize -Value 0x00280078
Set-ItemProperty -Path $consoleKeyPath -Name FaceName -Value 'Consolas'
Set-ItemProperty -Path $consoleKeyPath -Name FontFamily -Value 54
Set-ItemProperty -Path $consoleKeyPath -Name FontSize -Value 1048576
Set-ItemProperty -Path $consoleKeyPath -Name FontWeight -Value 400


#
# Explorer settings
#
Write-BoxstarterMessage 'Explorer settings'
$explorerAdvancedKeyPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty -Path $explorerAdvancedKeyPath -Name Start_NotifyNewApps -Value 0
Set-ItemProperty -Path $explorerAdvancedKeyPath -Name StartMenuAdminTools -Value 1
Set-ItemProperty -Path $explorerAdvancedKeyPath -Name Start_ShowNetPlaces -Value 0
Set-ItemProperty -Path $explorerAdvancedKeyPath -Name Start_ShowDownloads -Value 1
Set-ItemProperty -Path $explorerAdvancedKeyPath -Name Start_ShowUser -Value 1
Set-ItemProperty -Path $explorerAdvancedKeyPath -Name Start_PowerButtonAction -Value 4
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions


#
# Power config
#
Write-BoxstarterMessage 'Power config'
$powercfg = JOIN-PATH $env:SystemRoot system32\powercfg.exe
& $powercfg -X -monitor-timeout-ac 0
& $powercfg -X -monitor-timeout-dc 30


#
# Disable shutdown Event Tracker
#
Write-BoxstarterMessage 'Disable shutdown Event Tracker'
$shutdownEventTrackerKeyPath = 'HKLM:\Software\Policies\Microsoft\Windows NT\Reliability'
New-Item -Path $shutdownEventTrackerKeyPath -ErrorAction Ignore
Set-ItemProperty -Path $shutdownEventTrackerKeyPath -Name ShutdownReasonOn -Value 0


#
# Password doesn't expire
#
Write-BoxstarterMessage "Password doesn't expire"
$user = [ADSI]'WinNT://localhost/administrator'
$user.UserFlags = $user.UserFlags.Value -bor 0x10000
$user.SetInfo()


#
# Apps
#
Write-BoxstarterMessage 'Apps'
$packagesConfigPath = "$(JOIN-PATH $wininitPath 'Packages.config')"
if (Test-Path $packagesConfigPath) {
    # read packages and fill in license templates
    [xml]$packagesConfig = Get-Content $packagesConfigPath
    $packagesConfig.packages.SelectNodes("package[contains(@installArguments, '{{license}}')]") | % {
        $licensePath = JOIN-PATH "$($env:USERPROFILE)\Box\Personal\Licenses" ($_.id + ".txt")
        if (Test-Path $licensePath) {
            $_.installArguments = $_.installArguments.Replace("{{license}}", $(Get-Content $licensePath))
        }
    }
    $tempFile = [System.IO.Path]::GetTempFileName()
    $tempConfigPath = [System.IO.Path]::ChangeExtension($tempFile, "config")
    try {
        Rename-Item $tempFile $tempConfigPath
        $packagesConfig.Save($tempConfigPath)
        choco.exe install "$tempConfigPath" -y
    } finally {
        Remove-Item $tempFile -ErrorAction Ignore
        Remove-Item $tempConfigPath -ErrorAction Ignore
        Update-CurrentProcessPsModulePath
    }
}


#
# Set up shared ConEmu config
#
Write-BoxstarterMessage 'Set up shared ConEmu config'
$conEmuConfigPath = Join-Path $env:APPDATA 'ConEmu.xml'
Remove-Item $conEmuConfigPath -ErrorAction SilentlyContinue
New-Symlink -LiteralPath $conEmuConfigPath -TargetPath "$($env:USERPROFILE)\Box\Work\ConEmu.xml"


#
# Switch to shared git config
#
Write-BoxstarterMessage 'Switch to shared git config'
$gitconfigPath = Join-Path $env:USERPROFILE ".gitconfig"
Remove-Item $gitconfigPath -ErrorAction SilentlyContinue
New-Symlink -LiteralPath $gitconfigPath -TargetPath "$($env:USERPROFILE)\Box\Work\Programming\shared.gitconfig"


#
# Set up git template
#
Write-BoxstarterMessage "Set up git template"
$gitTemplateTarget = Join-Path "$wininitPath" "git\template"
$gitTemplatePath = Join-Path $env:USERPROFILE ".git_template"
if (!(Test-Path $gitTemplatePath)) {
    New-Symlink -LiteralPath $gitTemplatePath -TargetPath $gitTemplateTarget
}
$ppmGitHooksToDelete = 'C:\src\ppm\.git\hooks\*'
if (Test-Path $ppmGitHooksToDelete) {
    Remove-Item $ppmGitHooksToDelete
}


#
# Download and reference NuGet packages
#
Write-BoxstarterMessage 'Download and reference NuGet packages'
$tempPackages = Join-Path $env:TEMP ((Get-Date).Ticks)
NuGet.exe install -x Newtonsoft.Json -OutputDirectory $tempPackages
Add-Type -Path (Join-Path $tempPackages 'Newtonsoft.Json\lib\net40\Newtonsoft.Json.dll')


#
# Install Visual Studio extensions
#
Write-BoxstarterMessage 'Install Visual Studio extensions'
$vsextensions =
    Get-Content (Join-Path "$wininitPath" 'wininit-vs-extensions.json') -Raw |
    ConvertFrom-Json
$vsixInstaller = Join-Path $env:VS140COMNTOOLS '..\IDE\VSIXInstaller.exe'
$downloads = Join-Path $HOME 'Downloads'
$webclient = New-Object System.Net.WebClient
$vsextensions.PSObject.Properties | ForEach-Object {
    $downloadLocation = Join-Path $downloads $_.Value.FileName
    $webclient.DownloadFile($_.Value.DownloadUrl, $downloadLocation)
    & $vsixInstaller /q $downloadLocation
}


#
# Install licenses
#
# Write-BoxstarterMessage 'Install licenses'
# $choicePath = JOIN-PATH $env:SystemRoot 'system32\choice.exe'
# & $choicePath /C YN /T 120 /D N /M 'Do you want to enter a decryption password for license keys?'
# if ($LASTEXITCODE -eq 1) {
#     $decryptionPassword = HOST-READ 'Enter decryption password' -AsSecureString


    #
    # Decrypt licenses
    #


    #
    # Install Resharper license
    #



    #
    # Install LinqPad license
    #
# }


#
# Update security settings for PPM
#
Write-BoxstarterMessage 'Update security settings for PPM'
$ppmDevDb = 'PPM6_Development'
if ((Invoke-Sqlcmd -ServerInstance $env:COMPUTERNAME -Database master -Query @"
    SELECT COUNT(*) PpmDevExists FROM sys.databases WHERE Name='$ppmDevDb'
"@).PpmDevExists) {
    $ppmDevEnterpriseTable = "$ppmDevDb.dbo.Enterprise"
    $passwordPolicy = [xml] `
        (Invoke-Sqlcmd `
            -Query "SELECT PasswordPolicy FROM $ppmDevEnterpriseTable" `
            -ServerInstance $env:COMPUTERNAME `
        ).PasswordPolicy
    $passwordPolicyNode = (Select-Xml $passwordPolicy -XPath '/passwordPolicy').Node
    $passwordPolicyNode.SetAttribute('maxage', 0)
    $passwordPolicyNode.SetAttribute('minage', 0)
    $passwordPolicyNode.SetAttribute('history', 1)
    $lockoutPolicyNode = (Select-Xml $passwordPolicy -XPath '/passwordPolicy/lockoutPolicy').Node
    $lockoutPolicyNode.SetAttribute('isEnabled', 'false')
    Invoke-Sqlcmd `
       -Query "UPDATE $ppmDevEnterpriseTable SET PasswordPolicy = '$($passwordPolicy.OuterXml)'" `
       -ServerInstance $env:COMPUTERNAME
}

#
# Add GetElsLog sproc
#
Write-BoxstarterMessage 'Add GetElsLog sproc'
if ((Invoke-Sqlcmd -ServerInstance $env:COMPUTERNAME -Database master -Query @"
    SELECT COUNT(*) ElsExists FROM sys.databases WHERE Name='ELS'
"@).ElsExists) {
    Invoke-Sqlcmd -ServerInstance $env:COMPUTERNAME -Database master -Query @"
        IF  EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetElsLog]') AND type in (N'P', N'PC'))
        DROP PROCEDURE [dbo].[GetElsLog]
"@
    Invoke-Sqlcmd -ServerInstance $env:COMPUTERNAME -Database master -Query @"
        CREATE PROCEDURE [dbo].[GetElsLog]
        AS
        BEGIN
            SET NOCOUNT ON;

            SELECT TOP 50
                 ErrorLogID
                ,EntryDate
                ,Message
                ,Exception
                ,RelativeUri
            FROM ELS.dbo.ErrorLog
            ORDER BY ErrorLogID DESC
        END
"@
}


#
# PS Help
#
Update-Help


#
# 'Final' reboot
#
#    Invoke-Reboot
