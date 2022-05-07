import 'package:injectable/injectable.dart';

import '../../presentation/routing/route.dart';
import '../../presentation/shared_blocs/shared_bloc_index.dart';
import '../services/firebase.service.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<FirebaseService> get fireService => FirebaseService.init();

  @injectable
  AppRouter get appRouter => AppRouter();

  @injectable
  UserCubit get userCubit => UserCubit();
}
