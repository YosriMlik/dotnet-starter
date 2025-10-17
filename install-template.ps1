# PowerShell script to install template locally
Write-Host "Installing Web API Feature Slice Template..." -ForegroundColor Green

# Uninstall if already exists
dotnet new uninstall . 2>$null

# Install from current directory
dotnet new install .

Write-Host "`nTemplate installed successfully!" -ForegroundColor Green
Write-Host "`nUsage:" -ForegroundColor Yellow
Write-Host "  dotnet new webapi-features -n MyApi" -ForegroundColor Cyan
Write-Host "  dotnet new webapi-features -n MyApi --EnableDatabase false" -ForegroundColor Cyan
Write-Host "`nTo uninstall:" -ForegroundColor Yellow
Write-Host "  dotnet new uninstall ." -ForegroundColor Cyan
