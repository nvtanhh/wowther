part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class WeatherInitialEvent extends WeatherEvent {
  final String? language;
  const WeatherInitialEvent({this.language});
}

class RefreshWeather extends WeatherEvent {
  final String? language;
  const RefreshWeather({this.language});

  @override
  List<Object?> get props => [language];
}

class GetWeatherByCityNameEvent extends WeatherEvent {
  final String cityName;
  final String? language;

  const GetWeatherByCityNameEvent(this.cityName, {this.language});

  @override
  List<Object?> get props => [cityName, language];
}
