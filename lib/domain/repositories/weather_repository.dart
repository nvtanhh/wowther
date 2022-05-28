import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather?> getCachedWeather();
  Future<Weather> getWeatherByCityName(String cityName, {String? language});
  Future<Weather> getWeatherByLocation(
    double lat,
    double lon, {
    String? language,
  });
}
