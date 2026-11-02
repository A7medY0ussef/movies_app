abstract class RouteName {
  static const String splash = '/';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String movieDetails = '/movieDetails';

  // Movie details route
  static const String movieIdParam = 'id';
  static const String movieDetailsPath = '$movieDetails/:$movieIdParam';

  static String movieDetailsWithId(int id) => '$movieDetails/$id';
}