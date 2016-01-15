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
@REM # install chocolatey
@REM #
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))"
@SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
