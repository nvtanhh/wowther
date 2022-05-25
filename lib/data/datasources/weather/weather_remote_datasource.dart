import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../../config/app_config.dart';
import '../../../core/exceptions/exceptions.index.dart';
import '../../models/weather_model.dart';

abstract class WeatherRemoteDatasource {
  /// Get [WeatherModel] from API by city name.
  Future<WeatherModel> getWeatherByCityName(String cityName);

  /// Get [WeatherModel] from API by location.
  Future<WeatherModel> getWeatherByLocation(double lat, double lon);
}

@Injectable(as: WeatherRemoteDatasource)
class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource {
  final Client client;

  WeatherRemoteDatasourceImpl(this.client);

  @override
  Future<WeatherModel> getWeatherByCityName(String cityName) async {
    final response = await client.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName,${Platform.localeName}&appid=${AppConfig.kApiKey}',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw ServerException(code: response.statusCode, message: response.body);
    }
  }

  @override
  Future<WeatherModel> getWeatherByLocation(double lat, double lon) async {
    final response = await client.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=lat={$lat}&lon={$lon},${Platform.localeName}&appid=${AppConfig.kApiKey}',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw ServerException(code: response.statusCode, message: response.body);
    }
  }
}
