using Microsoft.AspNetCore.Mvc;

namespace webapi.Features.Weather;

[ApiController]
[Route("api/weather")]
[Tags("Weather")]
public class WeatherEndpoints : ControllerBase
{
    private readonly WeatherService _weatherService;
    private readonly ILogger<WeatherEndpoints> _logger;

    public WeatherEndpoints(WeatherService weatherService, ILogger<WeatherEndpoints> logger)
    {
        _weatherService = weatherService;
        _logger = logger;
    }

    [HttpGet]
    public ActionResult<IEnumerable<WeatherForecast>> GetForecast()
    {
        var forecast = _weatherService.GetForecast();
        return Ok(forecast);
    }
}
