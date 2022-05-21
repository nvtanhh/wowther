import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/constants/route_constants.dart';
import '../../presentation/pages/auth/ui/sign_in_wrapper.dart';
import '../../presentation/pages/setting/ui/font_setting/font_setting.dart';
import '../../presentation/pages/setting/ui/language_setting/language_setting.dart';
import '../../presentation/pages/setting/ui/setting_wrapper.dart';
import '../../presentation/pages/setting/ui/theme_setting/theme_color_setting.dart';
import '../../presentation/pages/todo/ui/todo_wrapper.dart';

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
