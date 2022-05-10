import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_resources/presentation/pages/setting/ui/setting_page.dart';
import 'package:flutter_resources/presentation/shared_blocs/shared_bloc_index.dart';

import '../common/injector/injection.dart';
import 'routing/route.dart';

class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);

  final _appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocProvider<UserCubit>(
        create: (_) => locator<UserCubit>(),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, userState) {
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, theme) {
                return MaterialApp.router(
                  theme: theme.lightTheme,
                  darkTheme: theme.darkTheme,
                  routerDelegate: _appRouter.delegate(
                    initialRoutes: userState.isLoggedIn
                        ? [const TodoWrapperRoute()]
                        : [const SettingWrapperRoute()],
                  ),
                  routeInformationParser:
                      _appRouter.defaultRouteParser(includePrefixMatches: true),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
