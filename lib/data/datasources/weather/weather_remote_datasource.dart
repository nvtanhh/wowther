import '../../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  /// Get [WeatherModel] from API by city name.
  Future<WeatherModel> getWeather(String cityName);
}
