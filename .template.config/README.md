# Web API Feature Slice Template

A modern .NET Web API template with feature-based organization.

## Installation

```bash
# Install from this directory
dotnet new install .

# Or install from a NuGet package (after publishing)
dotnet new install WebAPI.FeatureSlice
```

## Usage

```bash
# Create a new project
dotnet new webapi-features -n MyApi

# Create without database
dotnet new webapi-features -n MyApi --EnableDatabase false
```

## Uninstall

```bash
dotnet new uninstall WebAPI.FeatureSlice
```

## Features

- Feature-based organization
- SQLite database with EF Core (optional)
- Global exception handling
- Request logging middleware
- Swagger/OpenAPI documentation
- Clean project structure (config at root, code in src/)
