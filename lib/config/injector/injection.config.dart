// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../data/datasources/language/language_local_datasource.dart' as _i17;
import '../../data/datasources/theme/theme_local_datasource.dart' as _i10;
import '../../data/repositories/language_repository_impl.dart' as _i19;
import '../../data/repositories/theme_repository_impl.dart' as _i12;
import '../../domain/repositories/language_repository.dart' as _i18;
import '../../domain/repositories/theme_repository.dart' as _i11;
import '../../domain/repositories/weather_repository.dart' as _i6;
import '../../domain/usecases/langugae/get_stored_or_default_locale.dart'
    as _i23;
import '../../domain/usecases/langugae/get_supported_locales.dart' as _i24;
import '../../domain/usecases/langugae/store_locale.dart' as _i21;
import '../../domain/usecases/theme/get_stored_theme_data.dart' as _i14;
import '../../domain/usecases/theme/get_supported_color_themes.dart' as _i15;
import '../../domain/usecases/theme/get_supported_fonts.dart' as _i16;
import '../../domain/usecases/theme/store_app_theme.dart' as _i20;
import '../../domain/usecases/weather/get_cached_weather.dart' as _i5;
import '../../domain/usecases/weather/get_weather_by_city_name.dart' as _i7;
import '../../presentation/shared_blocs/language/language_cubit.dart' as _i25;
import '../../presentation/shared_blocs/theme/theme_cubit.dart' as _i22;
import '../../presentation/shared_blocs/user/user_cubit.dart' as _i13;
import '../../services/firebase_service.dart' as _i4;
import '../route/route.dart' as _i3;
import 'register.module.dart' as _i26; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppRouter>(registerModule.appRouter);
  await gh.factoryAsync<_i4.FirebaseService>(() => registerModule.fireService,
      preResolve: true);
  gh.factory<_i5.GetCachedWeather>(
      () => _i5.GetCachedWeather(get<_i6.WeatherRepository>()));
  gh.factory<_i7.GetWeatherByCityName>(
      () => _i7.GetWeatherByCityName(get<_i6.WeatherRepository>()));
  gh.singleton<_i8.Logger>(registerModule.logger);
  await gh.factoryAsync<_i9.SharedPreferences>(
      () => registerModule.preferencesStorage,
      preResolve: true);
  gh.factory<_i10.ThemeLocalDataSource>(
      () => _i10.ThemeLocalDataSourceImpl(get<_i9.SharedPreferences>()));
  gh.factory<_i11.ThemeRepository>(
      () => _i12.ThemeRepositoryImpl(get<_i10.ThemeLocalDataSource>()));
  gh.singleton<_i13.UserCubit>(_i13.UserCubit());
  gh.factory<_i14.GetStoredOrDefaultAppThemeData>(
      () => _i14.GetStoredOrDefaultAppThemeData(get<_i11.ThemeRepository>()));
  gh.factory<_i15.GetSupportedColorThemes>(
      () => _i15.GetSupportedColorThemes(get<_i11.ThemeRepository>()));
  gh.factory<_i16.GetSupportedFonts>(
      () => _i16.GetSupportedFonts(get<_i11.ThemeRepository>()));
  gh.factory<_i17.LanguageLocalDataSource>(
      () => _i17.LanguageLocalDataSourceImpl(get<_i9.SharedPreferences>()));
  gh.factory<_i18.LanguageRepository>(
      () => _i19.LanguageRepositoryImpl(get<_i17.LanguageLocalDataSource>()));
  gh.factory<_i20.StoreAppThemeData>(
      () => _i20.StoreAppThemeData(get<_i11.ThemeRepository>()));
  gh.factory<_i21.StoreLocale>(
      () => _i21.StoreLocale(get<_i18.LanguageRepository>()));
  gh.singleton<_i22.ThemeCubit>(_i22.ThemeCubit(
      get<_i16.GetSupportedFonts>(),
      get<_i15.GetSupportedColorThemes>(),
      get<_i14.GetStoredOrDefaultAppThemeData>(),
      get<_i20.StoreAppThemeData>()));
  gh.factory<_i23.GetStoredOrDefaultLocale>(
      () => _i23.GetStoredOrDefaultLocale(get<_i18.LanguageRepository>()));
  gh.factory<_i24.GetSupportedLocales>(
      () => _i24.GetSupportedLocales(get<_i18.LanguageRepository>()));
  gh.singleton<_i25.LanguageCubit>(_i25.LanguageCubit(
      get<_i23.GetStoredOrDefaultLocale>(),
      get<_i24.GetSupportedLocales>(),
      get<_i21.StoreLocale>()));
  return get;
}

class _$RegisterModule extends _i26.RegisterModule {}
