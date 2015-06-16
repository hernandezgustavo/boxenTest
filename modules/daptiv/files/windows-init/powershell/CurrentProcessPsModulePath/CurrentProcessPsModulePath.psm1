function Update-CurrentProcessPsModulePath {
    $machinePSModulePath = [Environment]::GetEnvironmentVariable("PSModulePath", "Machine")
    $userPSModulePath = [Environment]::GetEnvironmentVariable("PSModulePath", "User")
    [Environment]::SetEnvironmentVariable("PSModulePath", $machinePSModulePath + ";" + $userPSModulePath, "Process")
}

export-modulemember -function Update-CurrentProcessPsModulePath
