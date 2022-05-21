// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'route.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AppContainerRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AppContainer());
    },
    SignInWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignInWrapper());
    },
    LanguageSettingPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LanguageSettingPage());
    },
    SettingWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingWrapper());
    },
    ThemeColorSettingPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ThemeColorSettingPage());
    },
    FontSettingPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const FontSettingPage());
    },
    TodoWrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TodoWrapper());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(AppContainerRoute.name, path: '/'),
        RouteConfig(SignInWrapperRoute.name, path: '/sign-in'),
        RouteConfig(LanguageSettingPageRoute.name, path: '/setting/language'),
        RouteConfig(SettingWrapperRoute.name, path: '/setting'),
        RouteConfig(ThemeColorSettingPageRoute.name, path: '/setting/theme'),
        RouteConfig(FontSettingPageRoute.name, path: '/setting/font'),
        RouteConfig(TodoWrapperRoute.name, path: '/weather')
      ];
}

/// generated route for
/// [AppContainer]
class AppContainerRoute extends PageRouteInfo<void> {
  const AppContainerRoute() : super(AppContainerRoute.name, path: '/');

  static const String name = 'AppContainerRoute';
}

/// generated route for
/// [SignInWrapper]
class SignInWrapperRoute extends PageRouteInfo<void> {
  const SignInWrapperRoute() : super(SignInWrapperRoute.name, path: '/sign-in');

  static const String name = 'SignInWrapperRoute';
}

/// generated route for
/// [LanguageSettingPage]
class LanguageSettingPageRoute extends PageRouteInfo<void> {
  const LanguageSettingPageRoute()
      : super(LanguageSettingPageRoute.name, path: '/setting/language');

  static const String name = 'LanguageSettingPageRoute';
}

/// generated route for
/// [SettingWrapper]
class SettingWrapperRoute extends PageRouteInfo<void> {
  const SettingWrapperRoute()
      : super(SettingWrapperRoute.name, path: '/setting');

  static const String name = 'SettingWrapperRoute';
}

/// generated route for
/// [ThemeColorSettingPage]
class ThemeColorSettingPageRoute extends PageRouteInfo<void> {
  const ThemeColorSettingPageRoute()
      : super(ThemeColorSettingPageRoute.name, path: '/setting/theme');

  static const String name = 'ThemeColorSettingPageRoute';
}

/// generated route for
/// [FontSettingPage]
class FontSettingPageRoute extends PageRouteInfo<void> {
  const FontSettingPageRoute()
      : super(FontSettingPageRoute.name, path: '/setting/font');

  static const String name = 'FontSettingPageRoute';
}

/// generated route for
/// [TodoWrapper]
class TodoWrapperRoute extends PageRouteInfo<void> {
  const TodoWrapperRoute() : super(TodoWrapperRoute.name, path: '/weather');

  static const String name = 'TodoWrapperRoute';
}
