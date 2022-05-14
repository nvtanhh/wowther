// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../common/utils/logger.dart' as _i5;
import '../data/datasources/local/language_local_datasource.dart' as _i17;
import '../data/datasources/local/theme_local_datasource.dart' as _i7;
import '../data/repositories/language_repository_impl.dart' as _i19;
import '../data/repositories/theme_repository_impl.dart' as _i9;
import '../domain/repositories/language_repository.dart' as _i18;
import '../domain/repositories/theme_repository.dart' as _i8;
import '../domain/usecases/langugae/get_default_locale.dart' as _i25;
import '../domain/usecases/langugae/get_stored_language_code.dart' as _i26;
import '../domain/usecases/langugae/get_supported_locales.dart' as _i27;
import '../domain/usecases/langugae/store_language_code.dart' as _i22;
import '../domain/usecases/theme/get_dark_mode_option.dart' as _i11;
import '../domain/usecases/theme/get_default_font.dart' as _i12;
import '../domain/usecases/theme/get_default_theme_color.dart' as _i13;
import '../domain/usecases/theme/get_supported_fonts.dart' as _i14;
import '../domain/usecases/theme/get_supported_theme_colors.dart' as _i15;
import '../domain/usecases/theme/get_theme_data.dart' as _i16;
import '../domain/usecases/theme/store_dark_mode_option.dart' as _i20;
import '../domain/usecases/theme/store_font.dart' as _i21;
import '../domain/usecases/theme/store_theme_color.dart' as _i23;
import '../presentation/routing/route.dart' as _i3;
import '../presentation/shared_blocs/language/language_cubit.dart' as _i28;
import '../presentation/shared_blocs/theme/theme_cubit.dart' as _i24;
import '../presentation/shared_blocs/user/user_cubit.dart' as _i10;
import '../services/services.index.dart' as _i4;
import 'register.module.dart' as _i29; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppRouter>(registerModule.appRouter);
  await gh.factoryAsync<_i4.FirebaseService>(() => registerModule.fireService,
      preResolve: true);
  gh.singleton<_i5.Logger>(_i5.Logger());
  await gh.factoryAsync<_i6.SharedPreferences>(
      () => registerModule.preferencesStorage,
      preResolve: true);
  gh.factory<_i7.ThemeLocalDataSource>(
      () => _i7.ThemeLocalDataSource(get<_i6.SharedPreferences>()));
  gh.factory<_i8.ThemeRepository>(
      () => _i9.ThemeRepositoryImpl(get<_i7.ThemeLocalDataSource>()));
  gh.singleton<_i10.UserCubit>(_i10.UserCubit());
  gh.factory<_i11.GetDarkModeOption>(
      () => _i11.GetDarkModeOption(get<_i8.ThemeRepository>()));
  gh.factory<_i12.GetStorageOrDefaultFont>(
      () => _i12.GetStorageOrDefaultFont(get<_i8.ThemeRepository>()));
  gh.factory<_i13.GetStorageOrDefaultThemeColor>(
      () => _i13.GetStorageOrDefaultThemeColor(get<_i8.ThemeRepository>()));
  gh.factory<_i14.GetSupportedFonts>(
      () => _i14.GetSupportedFonts(get<_i8.ThemeRepository>()));
  gh.factory<_i15.GetSupportedThemeColors>(
      () => _i15.GetSupportedThemeColors(get<_i8.ThemeRepository>()));
  gh.factory<_i16.GetThemeData>(
      () => _i16.GetThemeData(get<_i8.ThemeRepository>()));
  gh.factory<_i17.LanguageLocalDataSource>(
      () => _i17.LanguageLocalDataSource(get<_i6.SharedPreferences>()));
  gh.factory<_i18.LanguageRepository>(
      () => _i19.LanguageRepositoryImpl(get<_i17.LanguageLocalDataSource>()));
  gh.factory<_i20.StoreDarkModeOption>(
      () => _i20.StoreDarkModeOption(get<_i8.ThemeRepository>()));
  gh.factory<_i21.StoreFont>(() => _i21.StoreFont(get<_i8.ThemeRepository>()));
  gh.factory<_i22.StoreLanguageCode>(
      () => _i22.StoreLanguageCode(get<_i18.LanguageRepository>()));
  gh.factory<_i23.StoreThemeColor>(
      () => _i23.StoreThemeColor(get<_i8.ThemeRepository>()));
  gh.singleton<_i24.ThemeCubit>(_i24.ThemeCubit(
      get<_i12.GetStorageOrDefaultFont>(),
      get<_i14.GetSupportedFonts>(),
      get<_i13.GetStorageOrDefaultThemeColor>(),
      get<_i15.GetSupportedThemeColors>(),
      get<_i16.GetThemeData>(),
      get<_i11.GetDarkModeOption>(),
      get<_i23.StoreThemeColor>(),
      get<_i21.StoreFont>(),
      get<_i20.StoreDarkModeOption>()));
  gh.factory<_i25.GetDefaultLocale>(
      () => _i25.GetDefaultLocale(get<_i18.LanguageRepository>()));
  gh.factory<_i26.GetStoredLanguageCode>(
      () => _i26.GetStoredLanguageCode(get<_i18.LanguageRepository>()));
  gh.factory<_i27.GetSupportedLocales>(
      () => _i27.GetSupportedLocales(get<_i18.LanguageRepository>()));
  gh.singleton<_i28.LanguageCubit>(_i28.LanguageCubit(
      get<_i25.GetDefaultLocale>(),
      get<_i27.GetSupportedLocales>(),
      get<_i26.GetStoredLanguageCode>(),
      get<_i22.StoreLanguageCode>()));
  return get;
}

class _$RegisterModule extends _i29.RegisterModule {}
