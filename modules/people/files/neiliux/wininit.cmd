SET BOXEN_SCRIPTS=c:\src\our-boxen\modules\people\files\%1
IF EXIST "%BOXEN_SCRIPTS%" (
	setx.exe BOXEN_SCRIPTS "c:\src\our-boxen-modules\people\files\%1"
)

powershell.exe -Command "Set-ExecutionPolicy Unrestricted -Force"

powershell.exe -Command "%BOXEN_SCRIPTS%\wininit.ps1"