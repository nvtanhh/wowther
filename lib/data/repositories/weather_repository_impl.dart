import 'package:injectable/injectable.dart';

import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather/weather_local_datasource.dart';
import '../datasources/weather/weather_remote_datasource.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDatasource remoteDatasource;
  final WeatherLocalDatasource localDatasource;

  WeatherRepositoryImpl(
    this.remoteDatasource,
    this.localDatasource,
  );

  @override
  Future<Weather?> getCachedWeather() {
    return localDatasource.getWeather();
  }

  @override
  Future<Weather> getWeather(String cityName) {
    return remoteDatasource.getWeather(cityName);
  }
}
