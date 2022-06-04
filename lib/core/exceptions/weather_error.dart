import 'package:equatable/equatable.dart';

abstract class WeatherError extends Equatable {
  final String message;

  const WeatherError(this.message);

  @override
  List<Object> get props => [message];
}

class CityNotFoundError extends WeatherError {
  const CityNotFoundError(super.message);
}
