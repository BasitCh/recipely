import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Singleton {

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
  static final Singleton _singleton = Singleton._internal();
}

abstract class NavigationService {
  static const String splashRouteUri = '/';
  static const String loginRouteUri = 'login';
  static const String searchRouteUri = 'search';

  void navigateToNamed({
    required BuildContext context,
    required String uri,
    Object? data,
  });

  void replaceWithNamed({
    required BuildContext context,
    required String uri,
    Object? data,
  });

  void pushNamed({
    required BuildContext context,
    required String uri,
    Object? data,
    Map<String, String> params,
  });

  void navigateBack({required BuildContext context});

  void pushAndPopUntil({required BuildContext context, required String name});

//String? get currentRouteUriString;
}

class GoRouterNavigationService extends NavigationService {
  GoRouterNavigationService();

  @override
  void navigateToNamed({
    required BuildContext context,
    required String uri,
    Object? data,
  }) =>
      context.goNamed(
        uri,
        extra: data,
      );

  @override
  void replaceWithNamed({
    required BuildContext context,
    required String uri,
    Object? data,
  }) =>
      context.goNamed(uri, extra: data);

  @override
  void navigateBack({required BuildContext context}) => context.pop();

  @override
  void pushAndPopUntil({required BuildContext context, required String name}) =>
      context.pushReplacementNamed(name);

  @override
  void pushNamed(
      {required BuildContext context,
      required String uri,
      Object? data,
      Map<String, String> params = const <String, String>{},}) {
    context.pushNamed(uri, extra: data, pathParameters: params);
  }
}
