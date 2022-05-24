import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/storage_constants.dart';
import '../../models/weather_model.dart';

abstract class WeatherLocalDatasource {
  /// Get cached [WeatherModel] which was previously saved.
  Future<WeatherModel?> getWeather();

  /// Store [WeatherModel] to cache.
  Future<void> cacheWeather(WeatherModel weather);
}

class WeatherLocalDatasourceImpl implements WeatherLocalDatasource {
  final SharedPreferences _preferencesStorage;

  WeatherLocalDatasourceImpl(this._preferencesStorage);

  @override
  Future<WeatherModel?> getWeather() async {
    final storedData = _preferencesStorage.getString(StorageConstants.weather);
    if (storedData == null) return null;
    return WeatherModel.fromJson(
      jsonDecode(storedData) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> cacheWeather(WeatherModel weather) async {
    _preferencesStorage.setString(
      StorageConstants.weather,
      jsonEncode(
        WeatherModel.fromEntity(weather).toJson(),
      ),
    );
  }
}
