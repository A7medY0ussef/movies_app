import 'package:go_router/go_router.dart';
import 'package:movie_app/modules/layout/home/presentation/screens/home_screen.dart';
import 'package:movie_app/modules/movie_details/presentation/screens/movie_details.dart';
import 'package:movie_app/modules/splash/presentation/screens/splash_screen.dart';
import 'route_name.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteName.movieDetails,
    routes: [
      GoRoute(
        path: RouteName.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteName.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteName.movieDetails,
        builder: (context, state) => const MovieDetails(),
      ),
    ],
  );
}
