# GitHub Repository Setup Guide

## Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `webapi-feature-template` (or your choice)
3. Description: "Modern .NET Web API template with feature-based organization"
4. Choose: **Public** (required for NuGet.org publishing)
5. **Don't** initialize with README (we already have one)
6. Click "Create repository"

## Step 2: Update Template Files

Before pushing, update these files with your info:

### `templatepack.csproj`
```xml
<Authors>YourName</Authors>
<PackageProjectUrl>https://github.com/yourusername/webapi-feature-template</PackageProjectUrl>
<RepositoryUrl>https://github.com/yourusername/webapi-feature-template</RepositoryUrl>
```

### `README.md`
Update the support links at the bottom:
```markdown
- 📖 [Documentation](https://github.com/yourusername/webapi-feature-template/wiki)
- 🐛 [Report Issues](https://github.com/yourusername/webapi-feature-template/issues)
- 💬 [Discussions](https://github.com/yourusername/webapi-feature-template/discussions)
```

### `LICENSE`
```
Copyright (c) 2025 [Your Name]
```

## Step 3: Push to GitHub

```bash
# Initialize git (if not already)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Web API Feature Slice Template"

# Add remote (replace with your URL)
git remote add origin https://github.com/yourusername/webapi-feature-template.git

# Push
git branch -M main
git push -u origin main
```

## Step 4: Setup GitHub Secrets (for Auto-Publishing)

1. Go to your repository on GitHub
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Name: `NUGET_API_KEY`
5. Value: Your NuGet API key (from https://www.nuget.org/account/apikeys)
6. Click **Add secret**

## Step 5: Create a Release (Triggers Auto-Publish)

### Option A: Via GitHub UI
1. Go to your repo → **Releases** → **Create a new release**
2. Click **Choose a tag** → Type `v1.0.0` → **Create new tag**
3. Release title: `v1.0.0`
4. Description: "Initial release"
5. Click **Publish release**

### Option B: Via Command Line
```bash
# Create and push tag
git tag v1.0.0
git push origin v1.0.0
```

The GitHub Action will automatically:
- Build the template package
- Publish to NuGet.org
- Create a GitHub release with the .nupkg file

## Step 6: Verify Publication

Wait 5-10 minutes, then check:

1. **NuGet.org**: https://www.nuget.org/packages/WebAPI.FeatureSlice.Template
2. **GitHub Releases**: https://github.com/yourusername/webapi-feature-template/releases

## Step 7: Test Installation

```bash
# Search for your template
dotnet new search webapi-features

# Install it
dotnet new install WebAPI.FeatureSlice.Template

# Use it
dotnet new webapi-features -n TestProject
```

## What Gets Excluded from Template

The `.gitignore` excludes:
- ✅ `bin/`, `obj/` - Build outputs
- ✅ `.vs/`, `.vscode/`, `.idea/` - IDE folders
- ✅ `*.db` - Database files
- ✅ `nupkg/` - NuGet packages
- ✅ Test projects

The template config (`.template.config/template.json`) also excludes:
- ✅ `.template.config/` itself
- ✅ `templatepack.csproj`
- ✅ `install-template.*` scripts
- ✅ `TEMPLATE_README.md`, `GITHUB_SETUP.md`, etc.

## Updating Your Template

When you make changes:

```bash
# 1. Make your changes
git add .
git commit -m "Add new feature"
git push

# 2. Create new version tag
git tag v1.0.1
git push origin v1.0.1

# GitHub Actions will auto-publish the new version
```

## Manual Publishing (Without GitHub Actions)

If you prefer manual control:

```bash
# 1. Update version in templatepack.csproj
<PackageVersion>1.0.1</PackageVersion>

# 2. Pack
dotnet pack templatepack.csproj -c Release -o ./nupkg

# 3. Publish
dotnet nuget push ./nupkg/WebAPI.FeatureSlice.Template.1.0.1.nupkg \
  --api-key YOUR_NUGET_KEY \
  --source https://api.nuget.org/v3/index.json
```

## Troubleshooting

**"remote: Repository not found"**
- Check your repository URL
- Make sure you have push access
- Use HTTPS or SSH correctly

**"GitHub Actions failing"**
- Check the Actions tab for error logs
- Verify NUGET_API_KEY secret is set correctly
- Ensure tag format is `v*.*.*` (e.g., v1.0.0)

**"Package not appearing on NuGet"**
- Wait 10-15 minutes for indexing
- Check for errors in GitHub Actions
- Verify your NuGet API key has "Push" permissions

## Best Practices

1. **Use semantic versioning**: v1.0.0, v1.0.1, v1.1.0, v2.0.0
2. **Write release notes**: Describe what changed in each version
3. **Test before tagging**: Make sure template works locally first
4. **Keep README updated**: Document new features and changes
5. **Respond to issues**: Help users who have problems

## Repository Structure

```
webapi-feature-template/
├── .github/
│   └── workflows/
│       ├── publish.yml      # Auto-publish on tag
│       └── test.yml         # Test on PR/push
├── .template.config/
│   ├── template.json        # Template configuration
│   └── README.md            # Template docs
├── src/                     # Template source code
├── templatepack.csproj      # Package configuration
├── .gitignore              # What to exclude
├── LICENSE                 # MIT license
├── README.md               # Main documentation
├── PUBLISH_GUIDE.md        # NuGet publishing guide
└── GITHUB_SETUP.md         # This file
```

## Next Steps

After publishing:
1. ⭐ Add topics to your repo: `dotnet`, `template`, `webapi`, `csharp`
2. 📝 Create a Wiki with detailed documentation
3. 🎨 Add a logo/icon for your package
4. 📢 Share on Twitter, Reddit, Dev.to
5. 💬 Enable Discussions for community support
