import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/features/home/home.dart';
import 'package:flutter_starter/features/information/presentation/pages/PageA/page.dart';
import 'package:flutter_starter/features/login/presentation/pages/main/page.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_starter/features/splash_page/home.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  const AppRouter._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    routes: <GoRoute>[
      // Home Module
      GoRoute(
        path: '/main',
        builder: (context, state) => const MainPage(),
      ),

      // Settings Module
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),

      //splash page
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),

      //login page
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),

      //Information Page
      GoRoute(
        path: '/information',
        builder: (context, state) => const InformationA(),
      ),
    ],
    errorBuilder: (context, state) {
      return Text('Error Page : ${state.error}');
    },
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: kDebugMode,
  );
}
