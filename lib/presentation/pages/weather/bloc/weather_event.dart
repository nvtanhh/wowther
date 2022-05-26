part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherInitialEvent extends WeatherEvent {
  const WeatherInitialEvent();
}

class GetWeatherByCityNameEvent extends WeatherEvent {
  final String cityName;

  const GetWeatherByCityNameEvent(this.cityName);

  @override
  List<Object> get props => [cityName];
}
