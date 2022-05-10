import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/injector/injection.dart';
import 'routing/route.dart';
import 'shared_blocs/shared_bloc_index.dart';

class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);

  final _appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => locator<ThemeCubit>(),
      child: BlocProvider<UserCubit>(
        create: (_) => locator<UserCubit>(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, theme) {
            return BlocBuilder<UserCubit, UserState>(
              builder: (context, userState) {
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
