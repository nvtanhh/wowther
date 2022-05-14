import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '/injector/injection.dart';
import 'routing/route.dart';
import 'shared_blocs/shared_bloc_index.dart';

class TodoApp extends StatelessWidget {
  TodoApp({Key? key}) : super(key: key);

  final _appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (_) => locator<UserCubit>(),
      child: BlocProvider(
        create: (_) => locator<LanguageCubit>(),
        child: BlocProvider<ThemeCubit>(
          create: (_) => locator<ThemeCubit>(),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, userState) {
              return BlocBuilder<LanguageCubit, Locale?>(
                builder: (context, locale) {
                  return BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, theme) {
                      return MaterialApp.router(
                        debugShowCheckedModeBanner: false,
                        // Localization
                        localizationsDelegates: const [
                          AppLocalizations.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        supportedLocales:
                            locator<LanguageCubit>().supportedLocales,
                        locale: locale,
                        localeResolutionCallback:
                            locator<LanguageCubit>().localeResolutionCallback,
                        // Theme
                        theme: theme.lightTheme,
                        darkTheme: theme.darkTheme,
                        // Route
                        routerDelegate: _appRouter.delegate(
                          initialRoutes: userState.isLoggedIn
                              ? [const TodoWrapperRoute()]
                              : [const SettingWrapperRoute()],
                        ),
                        routeInformationParser: _appRouter.defaultRouteParser(
                          includePrefixMatches: true,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
