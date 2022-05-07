import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/auth/auth_index.dart';
import '../pages/setting/setting_index.dart';
import '../pages/todo/todo_index.dart';

part 'route.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Wrapper,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SignInWrapper, initial: true, path: 'sign-in'),
    AutoRoute(page: SettingWrapper, path: 'setting'),
    AutoRoute(page: TodoWrapper, path: 'todo'),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}
