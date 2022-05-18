// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../data/datasources/local/language_local_datasource.dart' as _i14;
import '../../data/datasources/local/theme_local_datasource.dart' as _i7;
import '../../data/repositories/language_repository_impl.dart' as _i16;
import '../../data/repositories/theme_repository_impl.dart' as _i9;
import '../../domain/repositories/language_repository.dart' as _i15;
import '../../domain/repositories/theme_repository.dart' as _i8;
import '../../domain/usecases/langugae/get_default_locale.dart' as _i20;
import '../../domain/usecases/langugae/get_stored_language_code.dart' as _i21;
import '../../domain/usecases/langugae/get_supported_locales.dart' as _i22;
import '../../domain/usecases/langugae/store_language_code.dart' as _i18;
import '../../domain/usecases/theme/get_stored_theme_data.dart' as _i11;
import '../../domain/usecases/theme/get_supported_color_themes.dart' as _i12;
import '../../domain/usecases/theme/get_supported_fonts.dart' as _i13;
import '../../domain/usecases/theme/store_app_theme.dart' as _i17;
import '../../presentation/shared_blocs/language/language_cubit.dart' as _i23;
import '../../presentation/shared_blocs/theme/theme_cubit.dart' as _i19;
import '../../presentation/shared_blocs/user/user_cubit.dart' as _i10;
import '../../services/firebase_service.dart' as _i4;
import '../route/route.dart' as _i3;
import 'register.module.dart' as _i24; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppRouter>(registerModule.appRouter);
  await gh.factoryAsync<_i4.FirebaseService>(() => registerModule.fireService,
      preResolve: true);
  gh.singleton<_i5.Logger>(registerModule.logger);
  await gh.factoryAsync<_i6.SharedPreferences>(
      () => registerModule.preferencesStorage,
      preResolve: true);
  gh.factory<_i7.ThemeLocalDataSource>(
      () => _i7.ThemeLocalDataSource(get<_i6.SharedPreferences>()));
  gh.factory<_i8.ThemeRepository>(
      () => _i9.ThemeRepositoryImpl(get<_i7.ThemeLocalDataSource>()));
  gh.singleton<_i10.UserCubit>(_i10.UserCubit());
  gh.factory<_i11.GetStoredOrDefaultAppThemeData>(
      () => _i11.GetStoredOrDefaultAppThemeData(get<_i8.ThemeRepository>()));
  gh.factory<_i12.GetSupportedColorThemes>(
      () => _i12.GetSupportedColorThemes(get<_i8.ThemeRepository>()));
  gh.factory<_i13.GetSupportedFonts>(
      () => _i13.GetSupportedFonts(get<_i8.ThemeRepository>()));
  gh.factory<_i14.LanguageLocalDataSource>(
      () => _i14.LanguageLocalDataSource(get<_i6.SharedPreferences>()));
  gh.factory<_i15.LanguageRepository>(
      () => _i16.LanguageRepositoryImpl(get<_i14.LanguageLocalDataSource>()));
  gh.factory<_i17.StoreAppThemeData>(
      () => _i17.StoreAppThemeData(get<_i8.ThemeRepository>()));
  gh.factory<_i18.StoreLanguageCode>(
      () => _i18.StoreLanguageCode(get<_i15.LanguageRepository>()));
  gh.singleton<_i19.ThemeCubit>(_i19.ThemeCubit(
      get<_i13.GetSupportedFonts>(),
      get<_i12.GetSupportedColorThemes>(),
      get<_i11.GetStoredOrDefaultAppThemeData>(),
      get<_i17.StoreAppThemeData>()));
  gh.factory<_i20.GetDefaultLocale>(
      () => _i20.GetDefaultLocale(get<_i15.LanguageRepository>()));
  gh.factory<_i21.GetStoredLanguageCode>(
      () => _i21.GetStoredLanguageCode(get<_i15.LanguageRepository>()));
  gh.factory<_i22.GetSupportedLocales>(
      () => _i22.GetSupportedLocales(get<_i15.LanguageRepository>()));
  gh.singleton<_i23.LanguageCubit>(_i23.LanguageCubit(
      get<_i20.GetDefaultLocale>(),
      get<_i22.GetSupportedLocales>(),
      get<_i21.GetStoredLanguageCode>(),
      get<_i18.StoreLanguageCode>()));
  return get;
}

class _$RegisterModule extends _i24.RegisterModule {}
