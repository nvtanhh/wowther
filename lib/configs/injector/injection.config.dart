// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes, require_trailing_commas

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../data/datasources/weather/weather_local_datasource.dart' as _i12;
import '../../data/datasources/weather/weather_remote_datasource.dart' as _i13;
import '../../data/repositories/weather_repository_impl.dart' as _i15;
import '../../domain/repositories/weather_repository.dart' as _i14;
import '../../domain/usecases/weather/get_cached_weather.dart' as _i16;
import '../../domain/usecases/weather/get_weather_by_city_name.dart' as _i17;
import '../../domain/usecases/weather/get_weather_by_location.dart' as _i18;
import '../../presentation/pages/weather/bloc/weather_bloc.dart' as _i19;
import '../../presentation/route/route.dart' as _i3;
import '../../presentation/shared_blocs/language/language_cubit.dart' as _i7;
import '../../presentation/shared_blocs/theme/theme_cubit.dart' as _i10;
import '../../presentation/shared_blocs/user/user_cubit.dart' as _i11;
import '../../services/firebase_service.dart' as _i5;
import '../../services/geolocator_service.dart' as _i6;
import 'register.module.dart' as _i20; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppRouter>(registerModule.appRouter);
  gh.singleton<_i4.Client>(registerModule.client);
  await gh.factoryAsync<_i5.FirebaseService>(() => registerModule.fireService,
      preResolve: true);
  gh.singleton<_i6.GeolocatorService>(_i6.GeolocatorService());
  gh.singleton<_i7.LanguageCubit>(_i7.LanguageCubit());
  gh.singleton<_i8.Logger>(registerModule.logger);
  await gh.factoryAsync<_i9.SharedPreferences>(
      () => registerModule.preferencesStorage,
      preResolve: true);
  gh.singleton<_i10.ThemeCubit>(_i10.ThemeCubit());
  gh.singleton<_i11.UserCubit>(_i11.UserCubit());
  gh.factory<_i12.WeatherLocalDatasource>(
      () => _i12.WeatherLocalDatasourceImpl(get<_i9.SharedPreferences>()));
  gh.factory<_i13.WeatherRemoteDatasource>(
      () => _i13.WeatherRemoteDatasourceImpl(get<_i4.Client>()));
  gh.factory<_i14.WeatherRepository>(() => _i15.WeatherRepositoryImpl(
      get<_i13.WeatherRemoteDatasource>(), get<_i12.WeatherLocalDatasource>()));
  gh.factory<_i16.GetCachedWeather>(
      () => _i16.GetCachedWeather(get<_i14.WeatherRepository>()));
  gh.factory<_i17.GetWeatherByCityName>(
      () => _i17.GetWeatherByCityName(get<_i14.WeatherRepository>()));
  gh.factory<_i18.GetWeatherByLocation>(
      () => _i18.GetWeatherByLocation(get<_i14.WeatherRepository>()));
  gh.lazySingleton<_i19.WeatherBloc>(() => _i19.WeatherBloc(
      get<_i16.GetCachedWeather>(),
      get<_i17.GetWeatherByCityName>(),
      get<_i18.GetWeatherByLocation>(),
      get<_i6.GeolocatorService>()));
  return get;
}

class _$RegisterModule extends _i20.RegisterModule {}
