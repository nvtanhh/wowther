import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/routing/route.dart';
import '../../presentation/shared_blocs/shared_bloc_index.dart';
import '../services/services.index.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<FirebaseService> get fireService => FirebaseService.init();

  @injectable
  AppRouter get appRouter => AppRouter();

  @injectable
  UserCubit get userCubit => UserCubit();

  @singleton
  Future<SharedPreferences> get preferencesStorage =>
      SharedPreferences.getInstance();
}
