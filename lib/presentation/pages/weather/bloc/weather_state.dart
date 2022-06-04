part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  final Weather? weather;
  const WeatherState({this.weather});

  @override
  List<Object?> get props => [weather];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherRefreshing extends WeatherState {
  const WeatherRefreshing({super.weather});
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded({required Weather super.weather});
}

class WeatherErrorState extends WeatherState {
  final WeatherError? error;

  const WeatherErrorState({
    this.error,
    super.weather,
  });

  @override
  List<Object?> get props => [error, ...super.props];
}
