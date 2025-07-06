Write-Output "Stopping IIS Web Site..."
Import-Module WebAdministration
Stop-WebSite -Name "Default Web Site"
Write-Output "IIS Web Site stopped successfully."
# ASP.NET Core Hosting Bundle installer URL (adjust version if needed)
$installerUrl = "https://download.visualstudio.microsoft.com/download/pr/90d8e4e3-7b48-4727-8dc2-9315d1c1e099/fb3a5f3b4645e9a8cfced89b17c5c69a/dotnet-hosting-8.0.5-win.exe"

# Download path
$installerPath = "C:\temp\dotnet-hosting-installer.exe"

# Create download directory if it doesn't exist
if (-Not (Test-Path -Path "C:\temp")) {
    New-Item -Path "C:\temp" -ItemType Directory
}

# Download the Hosting Bundle installer
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Install it silently
Start-Process -FilePath $installerPath -ArgumentList "/quiet" -Wait

# Clean up installer
Remove-Item -Path $installerPath -Force

Write-Output "ASP.NET Core Hosting Bundle installed successfully."

