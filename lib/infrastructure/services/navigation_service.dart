import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}

abstract class NavigationService {
  static const String preSplashRouteUri = '/';
  static const String postSplashRouteUri = 'landing-page';
  static const String loginRouteUri = '/login'; // remove this forward slash ...
  static const String homeRouteUri = 'home';
  // static const String mainScreenRouteUri = 'mainScreen';
  static const String editRadiusRouteUri = 'editRadius';
  static const String wizardRouteUri = 'wizard';
  static const String personalInfoRouteUri = 'tell-us-about';
  static const String forgetPasswordRouteUri = 'forget-password';
  static const String newPasswordRouteUri = 'new-password';
  static const String signupRouteUri = 'signup';
  static const String calenderView = 'calender';
  static const String viewProfile = 'viewProfile';
  static const String editProfile = 'editProfile';
  static const String pointOfInterestRouteUri = 'point-of-interest';
  static const String myWalkDetail = 'myWalkDetail';
  static const String viewPointOfInterestRouteUri = 'view';
  static const String walkingInfoRouteUri = 'walking-info';
  static const String myWalksRouteUri = 'myWalks';
  static const String newWalkRouteUri = 'newWalk';
  static const String newPOIRouteUri = 'newPOI';

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
      Map<String, String> params = const <String, String>{}}) {
    context.pushNamed(uri, extra: data, pathParameters: params);
  }
}
