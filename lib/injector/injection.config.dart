// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../common/utils/logger.dart' as _i5;
import '../data/datasources/local/theme_local_datasource.dart' as _i6;
import '../data/repositories/theme_repository_impl.dart' as _i8;
import '../domain/repositories/theme_repository.dart' as _i7;
import '../domain/usecases/theme_usecase.dart' as _i9;
import '../presentation/routing/route.dart' as _i3;
import '../presentation/shared_blocs/shared_bloc_index.dart' as _i10;
import '../presentation/shared_blocs/theme_cubit/theme_cubit.dart' as _i11;
import '../services/services.index.dart' as _i4;
import 'register.module.dart' as _i12; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i6.ThemeLocalDataSource>(() => _i6.ThemeLocalDataSource());
  gh.factory<_i7.ThemeRepository>(
      () => _i8.ThemeRepositoryImpl(get<_i6.ThemeLocalDataSource>()));
  gh.factory<_i9.ThemeUseCase>(
      () => _i9.ThemeUseCase(get<_i7.ThemeRepository>()));
  gh.factory<_i10.UserCubit>(() => registerModule.userCubit);
  gh.lazySingleton<_i11.ThemeCubit>(
      () => _i11.ThemeCubit(get<_i7.ThemeRepository>()));
  return get;
}

class _$RegisterModule extends _i12.RegisterModule {}
