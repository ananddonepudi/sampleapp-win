Set-ExecutionPolicy RemoteSigned -Scope Process
cd C:/Script
.\InstallCodeDeploy.ps1
Get-Service -Name "codedeployagent"
#To enable the service to start automatically on boot
Set-Service -Name "codedeployagent" -StartupType Automatic
#uninstall CD agent
Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "AWS CodeDeploy Agent*" } | ForEach-Object { $_.Uninstall() }

#additional installation
dism /online /enable-feature /featurename:IIS-WebServerRole /all
dism /online /enable-feature /featurename:IIS-WebServer /all
dism /online /enable-feature /featurename:IIS-WebServerManagementTools /all

Get-Service W3SVC


