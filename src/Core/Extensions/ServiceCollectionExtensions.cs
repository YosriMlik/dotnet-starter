namespace webapi.Core.Extensions;

public static class ServiceCollectionExtensions
{
    public static IServiceCollection AddFeatures(this IServiceCollection services)
    {
        // Register all feature dependencies here
        return services;
    }
}
