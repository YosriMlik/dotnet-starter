# How to Use This Template

## Option 1: Install Locally (Quick Test)

```bash
# From this directory
dotnet new install .

# Create a new project
dotnet new webapi-features -n MyNewApi

# Navigate and run
cd MyNewApi
dotnet run
```

## Option 2: Create NuGet Package (Share with Team)

```bash
# Pack the template
dotnet pack templatepack.csproj -o .

# Install from the package
dotnet new install WebAPI.FeatureSlice.Template.1.0.0.nupkg

# Use it
dotnet new webapi-features -n MyNewApi
```

## Option 3: Publish to NuGet.org (Public)

```bash
# Pack
dotnet pack templatepack.csproj

# Push to NuGet (requires API key)
dotnet nuget push WebAPI.FeatureSlice.Template.1.0.0.nupkg --api-key YOUR_API_KEY --source https://api.nuget.org/v3/index.json

# Anyone can install
dotnet new install WebAPI.FeatureSlice.Template
```

## Template Options

```bash
# With database (default)
dotnet new webapi-features -n MyApi

# Without database
dotnet new webapi-features -n MyApi --EnableDatabase false

# Show help
dotnet new webapi-features --help
```

## Uninstall Template

```bash
# If installed locally
dotnet new uninstall .

# If installed from package
dotnet new uninstall WebAPI.FeatureSlice.Template
```

## What Gets Created

```
MyNewApi/
├── webapi.sln
├── webapi.csproj
├── Directory.Build.props
├── appsettings.json
├── appsettings.Development.json
├── .gitignore
└── src/
    ├── Program.cs
    ├── Core/
    │   ├── Filters/
    │   ├── Middleware/
    │   ├── Extensions/
    │   ├── Validation/
    │   └── Attributes/
    ├── Features/
    │   └── Weather/
    └── Shared/
        ├── Database/
        ├── Auth/
        └── Common/
```

## Next Steps After Creating Project

```bash
cd MyNewApi

# Install EF tools (if using database)
dotnet tool install --global dotnet-ef

# Create first migration
dotnet ef migrations add InitialCreate

# Run the app
dotnet run

# Visit Swagger
# http://localhost:5000/swagger
```
