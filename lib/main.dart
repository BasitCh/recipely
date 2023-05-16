// ignore_for_file: depend_on_referenced_packages


import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:recipely/firebase_options.dart';

import 'package:recipely/infrastructure/di/injectable.dart';
import 'package:recipely/receipely_app.dart';

import 'package:recipely/shared/screen_util/screen_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  registerServices();

  runApp(
    const ScreenUtilSetup(
      child: ReceipelyApp(),
    ),
  );
}
