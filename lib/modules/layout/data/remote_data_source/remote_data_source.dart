import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/services/api_service.dart';

abstract class RemoteDataSource {
  Future<Response<dynamic>> resultSearch(String query);
  Future<Response<dynamic>> getMoviesByGenre(String genre);
}

@Injectable(as: RemoteDataSource)
class RemoteDataSourceImp implements RemoteDataSource {
  ApiService apiService;
  RemoteDataSourceImp(this.apiService);
  @override
  Future<Response<dynamic>> resultSearch(String query) {
    return apiService.dio.get(
      'list_movies.json',
      queryParameters: {'query_term': query},
    );
    
  }

  @override
  Future<Response<dynamic>> getMoviesByGenre(String genre) {
    return apiService.dio.get(
      'list_movies.json',
      queryParameters: {'genre': genre},
    );
  }
}
