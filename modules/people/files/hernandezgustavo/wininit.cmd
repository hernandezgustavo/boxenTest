SET BOXEN_PERSONAL_DIRECTORY="C:\src\our-boxen\modules\people\files\%1"
IF EXIST "%BOXEN_PERSONAL_DIRECTORY%" (
    SETX.EXE BOXEN_PERSONAL_DIRECTORY "C:\src\our-boxen\modules\people\files\%1"
)


@REM #
@REM # Add shared modules and create PS modules
@REM # dir if necessary (it's already in PSModules path)
@REM #
MD "%USERPROFILE%\Documents\WindowsPowerShell\Modules" 2> NUL
MKLINK /D "%USERPROFILE%\Documents\WindowsPowerShell\Modules\CurrentProcessPsModulePath" "C:\src\our-boxen\modules\daptiv\files\windows-init\powershell\CurrentProcessPsModulePath" 2> NUL


@REM #
@REM # let powershell execute scripts
@REM #
powershell.exe -Command "Set-ExecutionPolicy Unrestricted -Force"


@REM #
@REM # install chocolatey
@REM #
powershell.exe -NoProfile -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
@SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin


@REM #
@REM # install boxstarter
@REM #
%ProgramData%\chocolatey\bin\choco.exe install boxstarter


@REM #
@REM # continue setup via boxstarter and powershell
@REM #
IF EXIST "%BOXEN_PERSONAL_DIRECTORY%\wininit.ps1" (
    powershell.exe -Command "Update-CurrentProcessPsModulePath; Install-BoxstarterPackage -PackageName %BOXEN_PERSONAL_DIRECTORY%\wininit.ps1"
)
