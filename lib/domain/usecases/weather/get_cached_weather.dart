import 'package:injectable/injectable.dart';

import '../../../core/params/no_params.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/weather.dart';
import '../../repositories/weather_repository.dart';

@injectable
class GetCachedWeather implements UseCase<Weather?, NoParams> {
  final WeatherRepository repository;

  GetCachedWeather(this.repository);

  @override
  Future<Weather?> call(NoParams params) {
    return repository.getCachedWeather();
  }
}
