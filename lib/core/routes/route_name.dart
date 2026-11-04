abstract class RouteName {
  static const String splash = '/';
  static const String start = '/start';
  static const String onBoarding = '/onBoarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgetPassword = '/forgetPassword';
  static const String layout = '/layout';
  static const String home = '/home';
  static const String browse = '/browse';
  static const String movieDetails = '/movieDetails';

  // Movie details route
  static const String movieIdParam = 'id';
  static const String movieDetailsPath = '$movieDetails/:$movieIdParam';

  static String movieDetailsWithId(int id) => '$movieDetails/$id';
}