#!/bin/bash
# Bash script to install template locally

echo "Installing Web API Feature Slice Template..."

# Uninstall if already exists
dotnet new uninstall . 2>/dev/null

# Install from current directory
dotnet new install .

echo ""
echo "Template installed successfully!"
echo ""
echo "Usage:"
echo "  dotnet new webapi-features -n MyApi"
echo "  dotnet new webapi-features -n MyApi --EnableDatabase false"
echo ""
echo "To uninstall:"
echo "  dotnet new uninstall ."
