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
    SignInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignInWrapper());
    },
    SettingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingWrapper());
    },
    TodoRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TodoWrapper());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: 'sign-in', fullMatch: true),
        RouteConfig(SignInRoute.name, path: 'sign-in'),
        RouteConfig(SettingRoute.name, path: 'setting'),
        RouteConfig(TodoRoute.name, path: 'todo')
      ];
}

/// generated route for
/// [SignInWrapper]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: 'sign-in');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [SettingWrapper]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: 'setting');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [TodoWrapper]
class TodoRoute extends PageRouteInfo<void> {
  const TodoRoute() : super(TodoRoute.name, path: 'todo');

  static const String name = 'TodoRoute';
}
