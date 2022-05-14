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
    ThemeSettingPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ThemeSettingPage());
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
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/sign-in', fullMatch: true),
        RouteConfig(SignInWrapperRoute.name, path: '/sign-in'),
        RouteConfig(LanguageSettingPageRoute.name, path: '/setting/language'),
        RouteConfig(SettingWrapperRoute.name, path: '/setting'),
        RouteConfig(ThemeSettingPageRoute.name, path: '/setting/theme'),
        RouteConfig(FontSettingPageRoute.name, path: '/setting/font'),
        RouteConfig(TodoWrapperRoute.name, path: '/todo')
      ];
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
/// [ThemeSettingPage]
class ThemeSettingPageRoute extends PageRouteInfo<void> {
  const ThemeSettingPageRoute()
      : super(ThemeSettingPageRoute.name, path: '/setting/theme');

  static const String name = 'ThemeSettingPageRoute';
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
  const TodoWrapperRoute() : super(TodoWrapperRoute.name, path: '/todo');

  static const String name = 'TodoWrapperRoute';
}
