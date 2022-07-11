import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_starter/app/flavor.dart';
import 'package:flutter_starter/app/locator.dart';
import 'package:flutter_starter/app/runner.dart';
import 'package:flutter_starter/features/login/presentation/pages/main/page.dart';
import 'package:flutter_starter/features/splash_page/presentation/pages/main/page.dart';
import 'package:flutter_starter/firebase_options.dart';
import 'package:provider/provider.dart';

import 'features/sign_in/presentation/pages/main/page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  F.flavor = Flavor.dev;

  await setupLocator();

  runZonedGuarded(
    runnerApp,
    (error, stackTrace) => log(
      error.toString(),
      name: 'ERROR',
      stackTrace: stackTrace,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return GoogleSignInProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/login': (context) => LoginPage(),
        },
      ),
    );
  }
}
