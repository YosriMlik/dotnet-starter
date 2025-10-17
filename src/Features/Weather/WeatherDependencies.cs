namespace webapi.Features.Weather;

public static class WeatherDependencies
{
    public static IServiceCollection AddWeatherFeature(this IServiceCollection services)
    {
        services.AddScoped<WeatherService>();
        return services;
    }
}
