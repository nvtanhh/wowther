import '../../models/weather_model.dart';

abstract class WeatherLocalDatasource {
  /// Get cached [WeatherModel] which was previously saved.
  Future<WeatherModel?> getWeather();
}
