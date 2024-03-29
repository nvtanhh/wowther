import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../configs/configs.index.dart';
import 'route/route.dart';
import 'shared_blocs/language/language_cubit.dart';
import 'shared_blocs/theme/theme_cubit.dart';
import 'shared_blocs/user/user_cubit.dart';

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
          create: (_) => locator<ThemeCubit>()..init(),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, userState) {
              return BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, languageState) {
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
                        supportedLocales: languageState.supportedLocales,
                        locale: languageState.locale,
                        localeResolutionCallback:
                            locator<LanguageCubit>().localeResolutionCallback,
                        // Theme
                        theme: theme.lightTheme,
                        darkTheme: theme.darkTheme,
                        // Route
                        routerDelegate: _appRouter.delegate(
                          initialRoutes: userState.isLoggedIn
                              ? [const AppContainerRoute()]
                              : [const SignInWrapperRoute()],
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
