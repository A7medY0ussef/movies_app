import 'package:movie_app/modules/movie_details/data/models/movie_details_model.dart';
import 'package:movie_app/modules/movie_details/data/models/similar_movie_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailsModel> getMovieDetails({required int movieId});
  Future<List<SimilarMovieModel>> getSimilarMovies({required int movieId});
}
