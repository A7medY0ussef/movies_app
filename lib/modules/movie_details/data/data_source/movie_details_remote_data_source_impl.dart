import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/modules/movie_details/data/data_source/movie_details_remote_data_source.dart';
import 'package:movie_app/modules/movie_details/data/models/movie_details_model.dart';
import 'package:movie_app/modules/movie_details/data/models/movie_details_response.dart';
import 'package:movie_app/modules/movie_details/data/models/similar_movie_model.dart';
import 'package:movie_app/modules/movie_details/data/models/similar_movies_response_model.dart';

class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final DioClient client;

  const MovieDetailsRemoteDataSourceImpl({required this.client});

  @override
  Future<MovieDetailsModel> getMovieDetails({required int movieId}) async {
    final response = await client.dio.get(
      ApiConstants.movieDetails,
      queryParameters: {
        ApiConstants.movieId: movieId,
        ApiConstants.withImages: true,
        ApiConstants.withCast: true,
      },
    );

    final model = MovieDetailsResponse.fromJson(response.data);
    final movie = model.data?.movie;

    if (movie == null) {
      throw Exception('Movie details not found');
    }
    return movie;
  }

  @override
  Future<List<SimilarMovieModel>> getSimilarMovies({required int movieId}) async {
    final response = await client.dio.get(
      ApiConstants.movieSuggestions,
      queryParameters: {ApiConstants.movieId: movieId},
    );
    final model = SimilarMoviesResponseModel.fromJson(response.data);
    return model.movies ?? [];
  }
}
