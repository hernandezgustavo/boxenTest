#
# Windows Update on with auto-download but prompt to install critical and suggested
#
$autoUpdate = New-Object -ComObject "Microsoft.Update.AutoUpdate"
if ($autoUpdate.Settings.NotificationLevel -ne 3) {
    $autoUpdate.Settings.NotificationLevel = 3    # notify before installation
    $autoUpdate.Settings.IncludeRecommendedUpdates = 1
    $autoUpdate.Settings.Save()
}
