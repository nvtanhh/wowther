// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../data/datasources/language/language_local_datasource.dart' as _i23;
import '../../data/datasources/theme/theme_local_datasource.dart' as _i9;
import '../../data/datasources/weather/weather_local_datasource.dart' as _i13;
import '../../data/datasources/weather/weather_remote_datasource.dart' as _i14;
import '../../data/repositories/language_repository_impl.dart' as _i25;
import '../../data/repositories/theme_repository_impl.dart' as _i11;
import '../../data/repositories/weather_repository_impl.dart' as _i16;
import '../../domain/repositories/language_repository.dart' as _i24;
import '../../domain/repositories/theme_repository.dart' as _i10;
import '../../domain/repositories/weather_repository.dart' as _i15;
import '../../domain/usecases/langugae/get_stored_or_default_locale.dart'
    as _i29;
import '../../domain/usecases/langugae/get_supported_locales.dart' as _i30;
import '../../domain/usecases/langugae/store_locale.dart' as _i27;
import '../../domain/usecases/theme/get_stored_theme_data.dart' as _i18;
import '../../domain/usecases/theme/get_supported_color_themes.dart' as _i19;
import '../../domain/usecases/theme/get_supported_fonts.dart' as _i20;
import '../../domain/usecases/theme/store_app_theme.dart' as _i26;
import '../../domain/usecases/weather/get_cached_weather.dart' as _i17;
import '../../domain/usecases/weather/get_weather_by_city_name.dart' as _i21;
import '../../domain/usecases/weather/get_weather_by_location.dart' as _i22;
import '../../presentation/shared_blocs/language/language_cubit.dart' as _i31;
import '../../presentation/shared_blocs/theme/theme_cubit.dart' as _i28;
import '../../presentation/shared_blocs/user/user_cubit.dart' as _i12;
import '../../services/firebase_service.dart' as _i5;
import '../../services/geolocation_service.dart' as _i6;
import '../route/route.dart' as _i3;
import 'register.module.dart' as _i32; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i7.Logger>(registerModule.logger);
  await gh.factoryAsync<_i8.SharedPreferences>(
      () => registerModule.preferencesStorage,
      preResolve: true);
  gh.factory<_i9.ThemeLocalDatasource>(
      () => _i9.ThemeLocalDataSourceImpl(get<_i8.SharedPreferences>()));
  gh.factory<_i10.ThemeRepository>(
      () => _i11.ThemeRepositoryImpl(get<_i9.ThemeLocalDatasource>()));
  gh.singleton<_i12.UserCubit>(_i12.UserCubit());
  gh.factory<_i13.WeatherLocalDatasource>(
      () => _i13.WeatherLocalDatasourceImpl(get<_i8.SharedPreferences>()));
  gh.factory<_i14.WeatherRemoteDatasource>(
      () => _i14.WeatherRemoteDatasourceImpl(get<_i4.Client>()));
  gh.factory<_i15.WeatherRepository>(() => _i16.WeatherRepositoryImpl(
      get<_i14.WeatherRemoteDatasource>(), get<_i13.WeatherLocalDatasource>()));
  gh.factory<_i17.GetCachedWeather>(
      () => _i17.GetCachedWeather(get<_i15.WeatherRepository>()));
  gh.factory<_i18.GetStoredOrDefaultAppThemeData>(
      () => _i18.GetStoredOrDefaultAppThemeData(get<_i10.ThemeRepository>()));
  gh.factory<_i19.GetSupportedColorThemes>(
      () => _i19.GetSupportedColorThemes(get<_i10.ThemeRepository>()));
  gh.factory<_i20.GetSupportedFonts>(
      () => _i20.GetSupportedFonts(get<_i10.ThemeRepository>()));
  gh.factory<_i21.GetWeatherByCityName>(
      () => _i21.GetWeatherByCityName(get<_i15.WeatherRepository>()));
  gh.factory<_i22.GetWeatherByLocation>(
      () => _i22.GetWeatherByLocation(get<_i15.WeatherRepository>()));
  gh.factory<_i23.LanguageLocalDatasource>(
      () => _i23.LanguageLocalDataSourceImpl(get<_i8.SharedPreferences>()));
  gh.factory<_i24.LanguageRepository>(
      () => _i25.LanguageRepositoryImpl(get<_i23.LanguageLocalDatasource>()));
  gh.factory<_i26.StoreAppThemeData>(
      () => _i26.StoreAppThemeData(get<_i10.ThemeRepository>()));
  gh.factory<_i27.StoreLocale>(
      () => _i27.StoreLocale(get<_i24.LanguageRepository>()));
  gh.singleton<_i28.ThemeCubit>(_i28.ThemeCubit(
      get<_i20.GetSupportedFonts>(),
      get<_i19.GetSupportedColorThemes>(),
      get<_i18.GetStoredOrDefaultAppThemeData>(),
      get<_i26.StoreAppThemeData>()));
  gh.factory<_i29.GetStoredOrDefaultLocale>(
      () => _i29.GetStoredOrDefaultLocale(get<_i24.LanguageRepository>()));
  gh.factory<_i30.GetSupportedLocales>(
      () => _i30.GetSupportedLocales(get<_i24.LanguageRepository>()));
  gh.singleton<_i31.LanguageCubit>(_i31.LanguageCubit(
      get<_i29.GetStoredOrDefaultLocale>(),
      get<_i30.GetSupportedLocales>(),
      get<_i27.StoreLocale>()));
  return get;
}

class _$RegisterModule extends _i32.RegisterModule {}
