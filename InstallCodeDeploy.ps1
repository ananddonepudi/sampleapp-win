# Define the region
$region = "ap-south-1"

# Set download URL for the CodeDeploy agent installer
$installerUrl = "https://aws-codedeploy-$region.s3.$region.amazonaws.com/latest/codedeploy-agent.msi"

# Set local path for the installer
$installerPath = "C:\temp\codedeploy-agent.msi"

# Create directory if it doesn't exist
if (-Not (Test-Path -Path "C:\temp")) {
    New-Item -Path "C:\temp" -ItemType Directory
}

# Download the installer
Write-Output "Downloading CodeDeploy agent installer..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Install the CodeDeploy agent using ArgumentList array (safe way)
Write-Output "Installing CodeDeploy agent..."
Start-Process -FilePath "msiexec.exe" -ArgumentList @("/i", $installerPath, "/quiet", "/l*v", "C:\temp\codedeploy-install.log") -Wait

# Start the CodeDeploy agent service
Write-Output "Starting CodeDeploy agent service..."
Start-Service -Name "codedeployagent"

# Check service status
Get-Service -Name "codedeployagent"

# Final success message
Write-Output "CodeDeploy agent installation completed successfully."
