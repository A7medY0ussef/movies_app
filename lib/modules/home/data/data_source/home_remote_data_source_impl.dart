import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/modules/home/data/data_source/home_remote_data_source.dart';
import 'package:movie_app/modules/home/data/models/movie_model.dart';
import 'package:movie_app/modules/home/data/models/movies_response_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient client;
  const HomeRemoteDataSourceImpl({required this.client});
  @override
  Future<List<MovieModel>> getMovies({String? genre, int? limit}) async {
    final response = await client.dio.get(
      ApiConstants.listMovies,
      queryParameters: {ApiConstants.genre: ?genre, ApiConstants.limit: ?limit},
    );
    final model = MoviesResponseModel.fromJson(response.data);
    return model.data?.movies ?? [];
  }
}
