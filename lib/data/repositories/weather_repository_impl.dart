import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather/weather_local_datasource.dart';
import '../datasources/weather/weather_remote_datasource.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource remoteSource;
  final WeatherLocalDatasource localDatasource;

  WeatherRepositoryImpl(
    this.remoteSource,
    this.localDatasource,
  );

  @override
  Future<Weather> getCachedWeather() {
    throw UnimplementedError();
  }

  @override
  Future<Weather> getWeather(String cityName) async {
    // TODO: implement getWeather
    throw UnimplementedError();
  }
}
