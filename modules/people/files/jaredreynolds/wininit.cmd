NET USE Z: "\\vmware-host\Shared Folders" 2> NUL

SET BOXEN_PERSONAL_DIRECTORY=C:\src\our-boxen\modules\people\files\jaredreynolds
IF EXIST "%BOXEN_PERSONAL_DIRECTORY%" (
    SETX.EXE BOXEN_PERSONAL_DIRECTORY "C:\src\our-boxen\modules\people\files\jaredreynolds"
)


@REM #
@REM # create PS modules dir if necessary (it's already in PSModules path)
@REM #
MD "%USERPROFILE%\Documents\WindowsPowerShell\Modules" 2> NUL


@REM #
@REM # links to host
@REM #
SET USER_PS_MODULES=%USERPROFILE%\Documents\WindowsPowerShell\Modules
RD /Q "%USER_PS_MODULES%\CurrentProcessPsModulePath" 2> NUL & MKLINK /D "%USER_PS_MODULES%\CurrentProcessPsModulePath" "C:\src\our-boxen\modules\daptiv\files\windows-init\powershell\CurrentProcessPsModulePath"
RD /Q "%USERPROFILE%\Box" 2> NUL & MKLINK /D %USERPROFILE%\Box "Z:\-Box"
RD /Q "%USERPROFILE%\Utils" 2> NUL & MKLINK /D %USERPROFILE%\Utils "Z:\-Box\Utils"
RD /Q "C:\src\hostSrc" 2> NUL & MKLINK /D C:\src\hostSrc "C:\hosthome\src"
RD /Q "%USERPROFILE%\Downloads\HostDownloads" 2> NUL & MKLINK /D %USERPROFILE%\Downloads\HostDownloads "Z:\-Downloads"


@REM #
@REM # add paths and vars
@REM #
Z:\-Box\Utils\rapidee.exe -i -c PATH "%USERPROFILE%\Utils;"
Z:\-Box\Utils\rapidee.exe -i -c PATH %USERPROFILE%\AppData\Roaming\npm;
Z:\-Box\Utils\rapidee.exe -s -u DIRCMD /OGNE
Z:\-Box\Utils\rapidee.exe -s -u PROMPT $P$_$G


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
%ProgramData%\chocolatey\bin\choco.exe install boxstarter -y


@REM #
@REM # set secrets password
@REM #
@rem SETLOCAL ENABLEDELAYEDEXPANSION
@rem SET "options=-username:/ -option2:"" -option3:"three word default" -flag1: -flag2:"
@rem 
@rem for %%O in (%options%) do for /f "tokens=1,* delims=:" %%A in ("%%O") do set "%%A=%%~B"
@rem :loop
@rem if not "%~1"=="" (
@rem   set "test=!options:*%~1:=! "
@rem   if "!test!"=="!options! " (
@rem       echo Error: Invalid option %~1
@rem   ) else if "!test:~0,1!"==" " (
@rem       set "%~1=1"
@rem   ) else (
@rem       set "%~1=%~2"
@rem       shift /1
@rem   )
@rem   shift /1
@rem   goto :loop
@rem )
@rem set -


@REM #
@REM # enable windows updates
@REM #
powershell.exe -Command "%BOXEN_PERSONAL_DIRECTORY%\windows-updates.ps1"


@REM #
@REM # continue setup via boxstarter and powershell
@REM #
IF EXIST "%BOXEN_PERSONAL_DIRECTORY%\wininit.ps1" (
    powershell.exe -Command "Update-CurrentProcessPsModulePath; Import-Module Boxstarter.Chocolatey; Install-BoxstarterPackage -PackageName %BOXEN_PERSONAL_DIRECTORY%\wininit.ps1"
)
