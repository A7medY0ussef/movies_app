
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firebase_options.dart';
import 'core/theme/app_theme.dart';
import 'modules/auth/auth_dependencies.dart';
import 'modules/auth/presentation/screens/forget_password/forget_password_screen.dart';
import 'modules/auth/presentation/screens/Register/register_screen.dart';
import 'modules/auth/presentation/screens/login/login_screen.dart';
import 'modules/onboarding/presentation/screens/onboarding_screen.dart';
import 'modules/splash/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GoogleSignIn.instance.initialize();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'onboarding',
          builder: (context, state) {
            return const OnboardingScreen();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'login',
              builder: (context, state) {
                return const LoginScreen();
              },
              routes: <RouteBase>[
                GoRoute(
                  path: 'register',
                  builder: (context, state) {
                    return const RegisterScreen();
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'forgetPassword',
                      builder: (context, state) {
                        return const ForgetPasswordScreen();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => createAuthCubit(),
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        routerConfig: _router,
      ),
    );
  }
}
