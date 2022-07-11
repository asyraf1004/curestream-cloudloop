import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter/app/config.dart';
import 'package:flutter_starter/app/routes.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/login/home.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_starter/features/sign_in/home.dart';
import 'package:flutter_starter/features/splash_page/home.dart';
import 'package:flutter_starter/firebase_options.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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

// @override
// Widget build(BuildContext context) {
//   SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//       statusBarColor:
//           AppConfig.transparentStatusBar ? Colors.transparent : null,
//     ),
//   );

//   return MultiBlocProvider(
//     providers: [
//       BlocProvider(
//         create: (context) => GetIt.I<ThemeBloc>()..add(const ThemeStarted()),
//       ),
//       BlocProvider(
//         create: (context) =>
//             GetIt.I<LanguageBloc>()..add(const LanguageStarted()),
//       ),
//     ],
//     child: const _AppView(),
//   );
// }

// class _AppView extends StatelessWidget {
//   const _AppView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LanguageBloc, LanguageState>(
//       builder: (context, languageState) {
//         return BlocBuilder<ThemeBloc, ThemeState>(
//           builder: (context, themeState) {
//             return MaterialApp.router(
//               title: AppConfig.titleSiteWeb,
//               theme: themeState.theme.toTheme().data,
//               localizationsDelegates: const [
//                 AppLocalizations.delegate,
//                 GlobalMaterialLocalizations.delegate,
//                 GlobalCupertinoLocalizations.delegate,
//                 GlobalWidgetsLocalizations.delegate,
//               ],
//               locale: languageState.language != null
//                   ? Locale(languageState.language!.code)
//                   : null,
//               debugShowCheckedModeBanner: false,
//               supportedLocales: AppLocalizations.supportedLocales,
//               routerDelegate: AppRouter.router.routerDelegate,
//               routeInformationParser: AppRouter.router.routeInformationParser,
//             );
//           },
//         );
//       },
//     );
//   }
// }
