import 'package:dio/dio.dart';
import 'package:movie_app/core/network/dio_client.dart';

class SearchRemoteDataSource {
  final DioClient client;

  SearchRemoteDataSource({required this.client});

  Future<Response<dynamic>> resultSearch(String query) {
    return client.dio.get(
      'list_movies.json',
      queryParameters: {'query_term': query},
    );
  }
}