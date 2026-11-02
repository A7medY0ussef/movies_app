import 'package:dio/dio.dart';
import 'package:movie_app/core/network/dio_client.dart';

class BrowseRemoteDataSource {
  final Dio dio = DioClient().dio;

  Future<Response<dynamic>> getMoviesByGenre(String genre) {
    return dio.get('list_movies.json', queryParameters: {'genre': genre});
  }
}