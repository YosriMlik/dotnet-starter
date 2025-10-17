# Publishing Your Template to NuGet.org

## Prerequisites

1. **NuGet.org Account**
   - Go to https://www.nuget.org
   - Sign up or sign in
   - Verify your email

2. **API Key**
   - Go to https://www.nuget.org/account/apikeys
   - Click "Create"
   - Name: "Template Publishing"
   - Glob Pattern: `*` (or `WebAPI.FeatureSlice.*`)
   - Select scopes: "Push" and "Push new packages and package versions"
   - Click "Create"
   - **Copy the key immediately** (you won't see it again!)

## Step 1: Update Template Metadata

Edit `templatepack.csproj`:

```xml
<PropertyGroup>
  <PackageVersion>1.0.0</PackageVersion>
  <PackageId>WebAPI.FeatureSlice.Template</PackageId>
  <Title>Web API Feature Slice Template</Title>
  <Authors>YourName</Authors>  <!-- Change this -->
  <Description>A modern .NET Web API template with feature-based organization</Description>
  <PackageTags>dotnet-new;templates;webapi;api;features;clean-architecture</PackageTags>
  <PackageProjectUrl>https://github.com/yourusername/webapi-template</PackageProjectUrl>  <!-- Change this -->
  <RepositoryUrl>https://github.com/yourusername/webapi-template</RepositoryUrl>  <!-- Change this -->
  <PackageLicenseExpression>MIT</PackageLicenseExpression>
  <PackageReadmeFile>README.md</PackageReadmeFile>
</PropertyGroup>

<!-- Add this to include README in package -->
<ItemGroup>
  <None Include="README.md" Pack="true" PackagePath="\" />
</ItemGroup>
```

## Step 2: Create Package

```bash
# Clean previous builds
dotnet clean
rm -rf bin obj

# Create the package
dotnet pack templatepack.csproj -c Release -o ./nupkg

# This creates: nupkg/WebAPI.FeatureSlice.Template.1.0.0.nupkg
```

## Step 3: Test Locally First

```bash
# Install from local package
dotnet new install ./nupkg/WebAPI.FeatureSlice.Template.1.0.0.nupkg

# Test it
dotnet new webapi-features -n TestProject

# If it works, uninstall
dotnet new uninstall WebAPI.FeatureSlice.Template
```

## Step 4: Publish to NuGet.org

```bash
# Push to NuGet
dotnet nuget push ./nupkg/WebAPI.FeatureSlice.Template.1.0.0.nupkg \
  --api-key YOUR_API_KEY_HERE \
  --source https://api.nuget.org/v3/index.json

# Wait 5-10 minutes for indexing
```

## Step 5: Verify & Use

```bash
# Search for your package
dotnet new search webapi-features

# Install it
dotnet new install WebAPI.FeatureSlice.Template

# Use it
dotnet new webapi-features -n MyNewApi
```

## Updating Your Template

When you make changes:

```bash
# 1. Update version in templatepack.csproj
<PackageVersion>1.0.1</PackageVersion>

# 2. Pack again
dotnet pack templatepack.csproj -c Release -o ./nupkg

# 3. Push new version
dotnet nuget push ./nupkg/WebAPI.FeatureSlice.Template.1.0.1.nupkg \
  --api-key YOUR_API_KEY \
  --source https://api.nuget.org/v3/index.json
```

## Alternative: GitHub Packages

If you want to keep it private or for your organization:

```bash
# Add GitHub as source
dotnet nuget add source https://nuget.pkg.github.com/YOURUSERNAME/index.json \
  --name github \
  --username YOURUSERNAME \
  --password YOUR_GITHUB_TOKEN

# Push to GitHub
dotnet nuget push ./nupkg/WebAPI.FeatureSlice.Template.1.0.0.nupkg \
  --api-key YOUR_GITHUB_TOKEN \
  --source github
```

## Troubleshooting

**"Package already exists"**
- You can't overwrite versions on NuGet.org
- Increment version number and push again

**"Invalid API key"**
- Regenerate key on nuget.org
- Make sure you copied it correctly

**"Package not showing in search"**
- Wait 10-15 minutes for indexing
- Check https://www.nuget.org/packages/WebAPI.FeatureSlice.Template

**Template not installing**
- Clear NuGet cache: `dotnet nuget locals all --clear`
- Try again: `dotnet new install WebAPI.FeatureSlice.Template`

## Best Practices

1. **Version properly**: Use semantic versioning (1.0.0, 1.0.1, 1.1.0, 2.0.0)
2. **Test locally first**: Always test before publishing
3. **Write good README**: Users will see it on NuGet.org
4. **Add icon**: Create a 128x128 PNG icon for your package
5. **Tag appropriately**: Use relevant tags for discoverability
6. **Keep it updated**: Maintain compatibility with latest .NET versions

## Example: Complete Publish Script

```bash
#!/bin/bash
# publish.sh

VERSION="1.0.0"
API_KEY="your-api-key-here"

echo "Building template package v$VERSION..."
dotnet pack templatepack.csproj -c Release -o ./nupkg

echo "Testing locally..."
dotnet new install ./nupkg/WebAPI.FeatureSlice.Template.$VERSION.nupkg
dotnet new webapi-features -n TestProject -o /tmp/TestProject
dotnet new uninstall WebAPI.FeatureSlice.Template

echo "Publishing to NuGet.org..."
dotnet nuget push ./nupkg/WebAPI.FeatureSlice.Template.$VERSION.nupkg \
  --api-key $API_KEY \
  --source https://api.nuget.org/v3/index.json

echo "Done! Check https://www.nuget.org/packages/WebAPI.FeatureSlice.Template"
```

Make it executable: `chmod +x publish.sh`
