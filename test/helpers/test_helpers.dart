import 'package:flutter_resources/data/datasources/weather/weather_local_datasource.dart';
import 'package:flutter_resources/data/datasources/weather/weather_remote_datasource.dart';
import 'package:flutter_resources/domain/repositories/weather_repository.dart';
import 'package:flutter_resources/domain/usecases/weather/get_cached_weather.dart';
import 'package:flutter_resources/domain/usecases/weather/get_weather_by_city_name.dart';
import 'package:flutter_resources/domain/usecases/weather/get_weather_by_location.dart';
import 'package:flutter_resources/services/geolocator_service.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  // Core
  SharedPreferences,
  Client,
  // Weather
  WeatherRepository,
  WeatherRemoteDatasource,
  WeatherLocalDatasource,
  GetCachedWeather,
  GetWeatherByCityName,
  GetWeatherByLocation,
  GeolocatorService,
])
void main() {}
