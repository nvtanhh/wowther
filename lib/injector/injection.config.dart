// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../common/utils/logger.dart' as _i5;
import '../data/datasources/local/theme_local_datasource.dart' as _i8;
import '../data/repositories/theme_repository_impl.dart' as _i10;
import '../domain/repositories/theme_repository.dart' as _i9;
import '../domain/usecases/theme/get_default_font.dart' as _i12;
import '../domain/usecases/theme/get_default_theme.dart' as _i13;
import '../domain/usecases/theme/get_supported_fonts.dart' as _i14;
import '../domain/usecases/theme/get_supported_themes.dart' as _i15;
import '../domain/usecases/theme/get_theme.dart' as _i16;
import '../domain/usecases/theme/theme_usecase.index.dart' as _i7;
import '../presentation/routing/route.dart' as _i3;
import '../presentation/shared_blocs/shared_bloc_index.dart' as _i11;
import '../presentation/shared_blocs/theme_cubit/theme_cubit.dart' as _i6;
import '../services/services.index.dart' as _i4;
import 'register.module.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AppRouter>(() => registerModule.appRouter);
  await gh.factoryAsync<_i4.FirebaseService>(() => registerModule.fireService,
      preResolve: true);
  gh.singleton<_i5.Logger>(_i5.Logger());
  gh.lazySingleton<_i6.ThemeCubit>(() => _i6.ThemeCubit(
      get<_i7.GetDefaultFont>(),
      get<_i7.GetSupportedFonts>(),
      get<_i7.GetDefaultTheme>(),
      get<_i7.GetSupportedThemes>(),
      get<_i7.GetTheme>()));
  gh.factory<_i8.ThemeLocalDataSource>(() => _i8.ThemeLocalDataSource());
  gh.factory<_i9.ThemeRepository>(
      () => _i10.ThemeRepositoryImpl(get<_i8.ThemeLocalDataSource>()));
  gh.factory<_i11.UserCubit>(() => registerModule.userCubit);
  gh.factory<_i12.GetDefaultFont>(
      () => _i12.GetDefaultFont(get<_i9.ThemeRepository>()));
  gh.factory<_i13.GetDefaultTheme>(
      () => _i13.GetDefaultTheme(get<_i9.ThemeRepository>()));
  gh.factory<_i14.GetSupportedFonts>(
      () => _i14.GetSupportedFonts(get<_i9.ThemeRepository>()));
  gh.factory<_i15.GetSupportedThemes>(
      () => _i15.GetSupportedThemes(get<_i9.ThemeRepository>()));
  gh.factory<_i16.GetTheme>(() => _i16.GetTheme(get<_i9.ThemeRepository>()));
  return get;
}

class _$RegisterModule extends _i17.RegisterModule {}
