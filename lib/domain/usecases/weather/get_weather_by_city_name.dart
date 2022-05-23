import '../../../core/params/weather/get_weather_by_city_name_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/weather.dart';
import '../../repositories/weather_repository.dart';

class GetWeatherByCityName
    implements UseCase<Weather, GetWeatherByCityNameParams> {
  final WeatherRepository repository;

  GetWeatherByCityName(this.repository);

  @override
  Future<Weather> call(GetWeatherByCityNameParams params) {
    return repository.getWeather(params.cityName);
  }
}
