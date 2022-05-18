import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constants.index.dart';
import '../../presentation/pages/auth/auth_index.dart';
import '../../presentation/pages/setting/setting_index.dart';
import '../../presentation/pages/todo/todo_index.dart';

part 'route.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // authentication
    AutoRoute(page: SignInWrapper, initial: true, path: RouteConstants.signIn),
    // setting
    AutoRoute(page: LanguageSettingPage, path: RouteConstants.languageSetting),
    AutoRoute(page: SettingWrapper, path: RouteConstants.setting),
    AutoRoute(page: ThemeColorSettingPage, path: RouteConstants.themeSetting),
    AutoRoute(page: FontSettingPage, path: RouteConstants.fontSetting),
    // todo
    AutoRoute(page: TodoWrapper, path: RouteConstants.todo),
  ],
)
class AppRouter extends _$AppRouter {}
