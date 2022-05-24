// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../data/datasources/language/language_local_datasource.dart' as _i21;
import '../../data/datasources/theme/theme_local_datasource.dart' as _i8;
import '../../data/datasources/weather/weather_local_datasource.dart' as _i15;
import '../../data/datasources/weather/weather_remote_datasource.dart' as _i12;
import '../../data/repositories/language_repository_impl.dart' as _i23;
import '../../data/repositories/theme_repository_impl.dart' as _i10;
import '../../data/repositories/weather_repository_impl.dart' as _i14;
import '../../domain/repositories/language_repository.dart' as _i22;
import '../../domain/repositories/theme_repository.dart' as _i9;
import '../../domain/repositories/weather_repository.dart' as _i13;
import '../../domain/usecases/langugae/get_stored_or_default_locale.dart'
    as _i27;
import '../../domain/usecases/langugae/get_supported_locales.dart' as _i28;
import '../../domain/usecases/langugae/store_locale.dart' as _i25;
import '../../domain/usecases/theme/get_stored_theme_data.dart' as _i17;
import '../../domain/usecases/theme/get_supported_color_themes.dart' as _i18;
import '../../domain/usecases/theme/get_supported_fonts.dart' as _i19;
import '../../domain/usecases/theme/store_app_theme.dart' as _i24;
import '../../domain/usecases/weather/get_cached_weather.dart' as _i16;
import '../../domain/usecases/weather/get_weather_by_city_name.dart' as _i20;
import '../../presentation/shared_blocs/language/language_cubit.dart' as _i29;
import '../../presentation/shared_blocs/theme/theme_cubit.dart' as _i26;
import '../../presentation/shared_blocs/user/user_cubit.dart' as _i11;
import '../../services/firebase_service.dart' as _i5;
import '../route/route.dart' as _i3;
import 'register.module.dart' as _i30; // ignore_for_file: unnecessary_lambdas

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
  gh.singleton<_i6.Logger>(registerModule.logger);
  await gh.factoryAsync<_i7.SharedPreferences>(
      () => registerModule.preferencesStorage,
      preResolve: true);
  gh.factory<_i8.ThemeLocalDatasource>(
      () => _i8.ThemeLocalDataSourceImpl(get<_i7.SharedPreferences>()));
  gh.factory<_i9.ThemeRepository>(
      () => _i10.ThemeRepositoryImpl(get<_i8.ThemeLocalDatasource>()));
  gh.singleton<_i11.UserCubit>(_i11.UserCubit());
  gh.factory<_i12.WeatherRemoteDatasource>(
      () => _i12.WeatherRemoteDatasourceImpl(get<_i4.Client>()));
  gh.factory<_i13.WeatherRepository>(() => _i14.WeatherRepositoryImpl(
      get<_i12.WeatherRemoteDatasource>(), get<_i15.WeatherLocalDatasource>()));
  gh.factory<_i16.GetCachedWeather>(
      () => _i16.GetCachedWeather(get<_i13.WeatherRepository>()));
  gh.factory<_i17.GetStoredOrDefaultAppThemeData>(
      () => _i17.GetStoredOrDefaultAppThemeData(get<_i9.ThemeRepository>()));
  gh.factory<_i18.GetSupportedColorThemes>(
      () => _i18.GetSupportedColorThemes(get<_i9.ThemeRepository>()));
  gh.factory<_i19.GetSupportedFonts>(
      () => _i19.GetSupportedFonts(get<_i9.ThemeRepository>()));
  gh.factory<_i20.GetWeatherByCityName>(
      () => _i20.GetWeatherByCityName(get<_i13.WeatherRepository>()));
  gh.factory<_i21.LanguageLocalDatasource>(
      () => _i21.LanguageLocalDataSourceImpl(get<_i7.SharedPreferences>()));
  gh.factory<_i22.LanguageRepository>(
      () => _i23.LanguageRepositoryImpl(get<_i21.LanguageLocalDatasource>()));
  gh.factory<_i24.StoreAppThemeData>(
      () => _i24.StoreAppThemeData(get<_i9.ThemeRepository>()));
  gh.factory<_i25.StoreLocale>(
      () => _i25.StoreLocale(get<_i22.LanguageRepository>()));
  gh.singleton<_i26.ThemeCubit>(_i26.ThemeCubit(
      get<_i19.GetSupportedFonts>(),
      get<_i18.GetSupportedColorThemes>(),
      get<_i17.GetStoredOrDefaultAppThemeData>(),
      get<_i24.StoreAppThemeData>()));
  gh.factory<_i27.GetStoredOrDefaultLocale>(
      () => _i27.GetStoredOrDefaultLocale(get<_i22.LanguageRepository>()));
  gh.factory<_i28.GetSupportedLocales>(
      () => _i28.GetSupportedLocales(get<_i22.LanguageRepository>()));
  gh.singleton<_i29.LanguageCubit>(_i29.LanguageCubit(
      get<_i27.GetStoredOrDefaultLocale>(),
      get<_i28.GetSupportedLocales>(),
      get<_i25.StoreLocale>()));
  return get;
}

class _$RegisterModule extends _i30.RegisterModule {}
