# Database Setup

This project uses SQLite with Entity Framework Core.

## Commands

```bash
# Create a new migration
dotnet ef migrations add InitialCreate

# Apply migrations to database
dotnet ef database update

# Remove last migration
dotnet ef migrations remove
```

## Usage in Features

Inject `AppDbContext` into your services:

```csharp
public class YourService
{
    private readonly AppDbContext _db;

    public YourService(AppDbContext db)
    {
        _db = db;
    }

    public async Task<List<YourEntity>> GetAll()
    {
        return await _db.YourEntities.ToListAsync();
    }
}
```

## Adding Entities

1. Create your entity class in the feature folder
2. Add DbSet to `AppDbContext.cs`
3. Configure in `OnModelCreating` if needed
4. Run migrations

Example:
```csharp
public DbSet<YourEntity> YourEntities { get; set; }
```
