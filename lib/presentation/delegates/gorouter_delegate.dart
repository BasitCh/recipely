import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipely/infrastructure/services/navigation_service.dart';
import 'package:recipely/presentation/login/login_screen.dart';
import 'package:recipely/presentation/search/search_screen.dart';
import 'package:recipely/presentation/splash/splash_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class GoRouterDelegate {
  static final GoRouter routerConfig = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/',
        builder: (context, routerState) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        name: NavigationService.loginRouteUri,
        path: '/${NavigationService.loginRouteUri}',
        builder: (context, routerState) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/${NavigationService.searchRouteUri}',
        name: NavigationService.searchRouteUri,
        builder: (context, routerState) {
          return const SearchScreen();
        },
      ),
    ],
  );
}
