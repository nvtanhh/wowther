import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    if (bloc is Cubit) {
      debugPrint('[CUBIT CHANGE] $bloc $change');
      super.onChange(bloc, change);
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('[BLOC EVENT] ${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('[BLOC ERROR] ${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('[BLOC TRANSITION] ${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }
}
