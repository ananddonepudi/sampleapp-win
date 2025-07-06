Write-Output "Setting permissions for wwwroot..."
$path = "C:\inetpub\wwwroot"
icacls $path /grant "IIS_IUSRS:(OI)(CI)F" /T
Write-Output "Permissions set successfully."
