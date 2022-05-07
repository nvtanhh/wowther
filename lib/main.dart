import 'package:flutter/material.dart';
import 'package:flutter_resources/presentation/app.dart';

import 'common/injector/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(TodoApp());
}
