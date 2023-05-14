import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipely/infrastructure/services/navigation_service.dart';
import 'package:recipely/presentation/login/login_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorKey = GlobalKey<NavigatorState>();

class GoRouterDelegate {
  static final GoRouter routerConfig = GoRouter(
    // initialLocation: NavigationService.preSplashRouteUri,
    initialLocation: NavigationService.loginRouteUri,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: NavigationService.loginRouteUri,
        builder: (context, routerState) {
          return const LoginScreen();
        },
      ),
    ],
  );
}
