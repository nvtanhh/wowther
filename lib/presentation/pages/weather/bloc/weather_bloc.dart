import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/params/no_params.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/params/weather/get_weather_by_location_params.dart';
import '../../../../domain/entities/weather.dart';
import '../../../../domain/usecases/weather/get_cached_weather.dart';
import '../../../../domain/usecases/weather/get_weather_by_city_name.dart';
import '../../../../domain/usecases/weather/get_weather_by_location.dart';
import '../../../../services/geolocation_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

/// WeatherBloc cases
/// 1. initBloc
///   a. get cached weather
///   b. Load weather by current location
///
/// 2. Load weather by city name (search)

@lazySingleton
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCachedWeather getCachedWeather;
  final GetWeatherByCityName getWeatherByCityName;
  final GetWeatherByLocation getWeatherByLocation;
  final GeolocatorService geolocatorService;

  WeatherBloc(
    this.getCachedWeather,
    this.getWeatherByCityName,
    this.getWeatherByLocation,
    this.geolocatorService,
  ) : super(WeatherInitial()) {
    on<WeatherInitialEvent>(_initWeatherBloc);
    on<GetWeatherByCityNameEvent>(_getWeatherByCityName);
  }

  Future<FutureOr<void>> _initWeatherBloc(
    WeatherInitialEvent event,
    Emitter<WeatherState> emit,
  ) async {
    // get cached weather -> if not null, emit WeatherLoaded
    final cachedWeather = await getCachedWeather(NoParams());
    if (cachedWeather != null) {
      emit(WeatherLoaded(cachedWeather));
      emit(const WeatherRefreshing());
    } else {
      emit(const WeatherLoading());
    }
    // refreshing weather by current location
    final Position position = await geolocatorService.getCurrentPosition();
    final weather = await getWeatherByLocation(
      GetWeatherByLocationParams(position.latitude, position.longitude),
    );
    emit(WeatherLoaded(weather));
  }

  FutureOr<void> _getWeatherByCityName(
    GetWeatherByCityNameEvent event,
    Emitter<WeatherState> emit,
  ) {
    throw UnimplementedError();
  }
}
