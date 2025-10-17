# Pre-Publish Checklist

Before pushing to GitHub and publishing to NuGet, complete these steps:

## 1. Update Personal Information

- [ ] `templatepack.csproj` - Update `<Authors>`, `<PackageProjectUrl>`, `<RepositoryUrl>`
- [ ] `LICENSE` - Update copyright with your name
- [ ] `README.md` - Update support links (Documentation, Issues, Discussions)
- [ ] `.template.config/template.json` - Update `author` field

## 2. Test Template Locally

```bash
# Install template
dotnet new install .

# Create test project
dotnet new webapi-features -n TestProject -o ../TestProject

# Test it works
cd ../TestProject
dotnet build
dotnet run

# Clean up
cd ../webapi
dotnet new uninstall .
rm -rf ../TestProject
```

- [ ] Template installs without errors
- [ ] Generated project builds successfully
- [ ] Generated project runs successfully
- [ ] Swagger UI works at http://localhost:5000/swagger
- [ ] No `.vscode` or IDE folders in generated project
- [ ] No `bin/obj` folders in generated project

## 3. Review Files to Exclude

Check `.template.config/template.json` excludes:
- [ ] `.vscode/`, `.vs/`, `.idea/`
- [ ] `bin/`, `obj/`
- [ ] `*.db`, `*.db-shm`, `*.db-wal`
- [ ] `.template.config/`
- [ ] `templatepack.csproj`
- [ ] `install-template.*`
- [ ] `*_README.md`, `*_GUIDE.md`, `CHECKLIST.md`

## 4. Create GitHub Repository

- [ ] Repository created on GitHub
- [ ] Repository is **Public** (required for NuGet.org)
- [ ] Repository name matches your preference
- [ ] Good description added

## 5. Setup GitHub Secrets

- [ ] NuGet API key created at https://www.nuget.org/account/apikeys
- [ ] `NUGET_API_KEY` secret added to GitHub repository

## 6. Push to GitHub

```bash
git init
git add .
git commit -m "Initial commit: Web API Feature Slice Template"
git remote add origin https://github.com/yourusername/webapi-feature-template.git
git branch -M main
git push -u origin main
```

- [ ] Code pushed to GitHub
- [ ] All files visible on GitHub
- [ ] README displays correctly

## 7. Create First Release

```bash
git tag v1.0.0
git push origin v1.0.0
```

- [ ] Tag created and pushed
- [ ] GitHub Actions workflow triggered
- [ ] Workflow completed successfully
- [ ] Package published to NuGet.org
- [ ] GitHub Release created

## 8. Verify Publication

- [ ] Package visible on NuGet.org: https://www.nuget.org/packages/WebAPI.FeatureSlice.Template
- [ ] Can search for template: `dotnet new search webapi-features`
- [ ] Can install template: `dotnet new install WebAPI.FeatureSlice.Template`
- [ ] Can create project: `dotnet new webapi-features -n TestProject`

## 9. Post-Publication

- [ ] Add repository topics: `dotnet`, `template`, `webapi`, `csharp`, `aspnetcore`
- [ ] Enable GitHub Discussions
- [ ] Create initial Wiki page
- [ ] Share on social media / dev communities
- [ ] Add package badge to README (auto-updates with version)

## 10. Optional Enhancements

- [ ] Add package icon (128x128 PNG)
- [ ] Create detailed Wiki documentation
- [ ] Add more template options (auth, docker, etc.)
- [ ] Create video tutorial
- [ ] Write blog post about the template

## Common Issues

**Template includes IDE folders**
- Check `.template.config/template.json` exclude list
- Reinstall template: `dotnet new uninstall . && dotnet new install .`

**GitHub Actions failing**
- Check Actions tab for logs
- Verify NUGET_API_KEY secret
- Ensure tag format is `v*.*.*`

**Package not on NuGet**
- Wait 10-15 minutes for indexing
- Check GitHub Actions completed successfully
- Verify API key has "Push" permissions

**Can't find template after install**
- Clear cache: `dotnet nuget locals all --clear`
- Reinstall: `dotnet new install WebAPI.FeatureSlice.Template --force`
