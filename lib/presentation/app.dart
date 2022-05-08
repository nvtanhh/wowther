import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/injector/injection.dart';
import 'routing/route.dart';
import 'shared_blocs/user_cubit/user_cubit.dart';

class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);

  final _appRouter = locator<AppRouter>();
  final userCubit = locator<UserCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (_) => userCubit,
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerDelegate: AutoRouterDelegate.declarative(
              _appRouter,
              routes: (_) => [
                if (userCubit.isLoggedIn)
                  const TodoRoute()
                else
                  const SignInRoute(),
              ],
            ),
            routeInformationParser:
                _appRouter.defaultRouteParser(includePrefixMatches: true),
          );
        },
      ),
    );
  }
}
