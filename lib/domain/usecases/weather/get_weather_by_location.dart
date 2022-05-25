import 'package:injectable/injectable.dart';

import '../../../core/params/weather/get_weather_by_location_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/weather.dart';
import '../../repositories/weather_repository.dart';

@injectable
class GetWeatherByLocation
    implements UseCase<Weather, GetWeatherByLocationParams> {
  final WeatherRepository repository;

  GetWeatherByLocation(this.repository);

  @override
  Future<Weather> call(GetWeatherByLocationParams params) {
    return repository.getWeatherByLocation(params.lat, params.long);
  }
}
