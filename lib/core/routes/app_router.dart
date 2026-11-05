import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/widgets/error_message_widget.dart';
import 'package:movie_app/modules/auth/presentation/screens/Register/register_screen.dart';
import 'package:movie_app/modules/auth/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:movie_app/modules/auth/presentation/screens/login/login_screen.dart';
import 'package:movie_app/modules/layout/browse/presentation/screens/browse_screen.dart';
import 'package:movie_app/modules/layout/home/presentation/screens/home_screen.dart';
import 'package:movie_app/modules/layout/layout_screen.dart';
import 'package:movie_app/modules/movie_details/presentation/screens/movie_details.dart';
import 'package:movie_app/modules/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:movie_app/modules/onboarding/presentation/screens/start_screen.dart';
import 'package:movie_app/modules/splash/presentation/screens/splash_screen.dart';
import 'package:movie_app/modules/update_profile/presentation/screens/update_profile_screen.dart';
import 'route_name.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteName.splash,
    routes: [
      GoRoute(
        path: RouteName.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteName.start,
        builder: (context, state) => const StartScreen(),
      ),
      GoRoute(
        path: RouteName.onBoarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteName.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteName.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: RouteName.forgetPassword,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: RouteName.layout,
        builder: (context, state) => const LayoutScreen(),
      ),
      GoRoute(
        path: RouteName.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteName.browse,
        builder: (context, state) => const BrowseScreen(),
      ),
      GoRoute(
        path: RouteName.movieDetailsPath,
        builder: (context, state) {
          final id = int.tryParse(
            state.pathParameters[RouteName.movieIdParam] ?? '',
          );
          if (id == null) {
            return const Scaffold(
              body: ErrorMessageWidget(errorMessage: 'Invalid movie id'),
            );
          }
          return MovieDetails(movieId: id);
        },
      ),
      GoRoute(
        path: RouteName.updateProfile,
        builder: (context, state) => const UpdateProfileScreen(),
      ),
    ],
  );
}
