import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/injector/injection.dart';
import 'common/utils/logger.dart';
import 'presentation/app.dart';

class AppBlocObserver extends BlocObserver {
  final _logger = locator<Logger>();

  @override
  void onChange(BlocBase bloc, Change change) {
    if (bloc is Cubit) {
      _logger.logInfo('CUBIT CHANGE: $bloc $change');
    }
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    _logger.logInfo('BLOC EVENT: ${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.logError('BLOC ERROR: ${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    _logger.logInfo('BLOC TRANSITION: ${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  await runZonedGuarded(
    () async => BlocOverrides.runZoned(
      () => runApp(TodoApp()),
      blocObserver: AppBlocObserver(),
    ),
    (_, __) => () {},
  );
}
