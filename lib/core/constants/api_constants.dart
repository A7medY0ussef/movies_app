abstract final class ApiConstants {
  static const String baseUrl = 'https://movies-api.accel.li/api/v2/';

  // Endpoints
  static const String listMovies = 'list_movies.json';
  static const String movieDetails = 'movie_details.json';
  static const String movieSuggestions = 'movie_suggestions.json';

  // Query keys
  static const String limit = 'limit';
  static const String page = 'page';
  static const String genre = 'genre';
  static const String sortBy = 'sort_by';
  static const String queryTerm = 'query_term';
  // Movie Details
  static const String movieId = 'movie_id';
  static const String withImages = 'with_images';
  static const String withCast = 'with_cast';

}