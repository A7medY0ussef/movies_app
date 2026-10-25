import 'package:movie_app/modules/home/data/models/movie_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieModel>> getMovies({String? genre, int? limit});
}
