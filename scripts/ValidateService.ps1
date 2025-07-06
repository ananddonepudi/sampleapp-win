Write-Output "Validating web application..."
$response = Invoke-WebRequest -Uri "http://localhost" -UseBasicParsing
if ($response.StatusCode -eq 200) {
    Write-Output "Application is running successfully."
    exit 0
} else {
    Write-Output "Application validation failed with status code: $($response.StatusCode)"
    exit 1
}
