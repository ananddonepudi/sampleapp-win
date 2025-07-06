Write-Output "Stopping IIS Web Site..."
Import-Module WebAdministration
Stop-WebSite -Name "Default Web Site"
Write-Output "IIS Web Site stopped successfully."
