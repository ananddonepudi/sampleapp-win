Set-ExecutionPolicy RemoteSigned -Scope Process
cd C:/Script
.\InstallCodeDeploy.ps1
Get-Service -Name "codedeployagent"
#To enable the service to start automatically on boot
Set-Service -Name "codedeployagent" -StartupType Automatic
#uninstall CD agent
Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "AWS CodeDeploy Agent*" } | ForEach-Object { $_.Uninstall() }
