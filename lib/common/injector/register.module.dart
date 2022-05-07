import 'package:injectable/injectable.dart';

import '../services/firebase.service.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<FirebaseService> get fireService => FirebaseService.init();
}
