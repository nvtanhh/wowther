import '../entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather?> getCachedWeather();
  Future<Weather> getWeather(String cityName);
}
