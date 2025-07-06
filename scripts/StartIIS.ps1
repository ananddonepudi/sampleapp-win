Write-Output "Starting IIS Web Site..."
Import-Module WebAdministration
Start-WebSite -Name "Default Web Site"
Write-Output "IIS Web Site started successfully."
