import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/routing/route.dart';
import '../services/services.index.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<FirebaseService> get fireService => FirebaseService.init();

  @preResolve
  Future<SharedPreferences> get preferencesStorage =>
      SharedPreferences.getInstance();

  @singleton
  AppRouter get appRouter => AppRouter();
}
