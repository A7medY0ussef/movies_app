import 'package:injectable/injectable.dart';
import 'package:movie_app/modules/layout/data/model/movie.dart';
import 'package:movie_app/modules/layout/data/model/response.dart';
import 'package:movie_app/modules/layout/search/data/data_source/search_remote_data_sources.dart';

abstract class SearchRepo {
  Future<List<Movie>?> resultSearch(String query);
}

@Injectable(as: SearchRepo)
class SearchRepoImp implements SearchRepo {
  SearchRemoteDataSource remoteDataSource;

  SearchRepoImp({required this.remoteDataSource});

  @override
  Future<List<Movie>?> resultSearch(String query) async {
    final response = await remoteDataSource.resultSearch(query);
    if (response.statusCode == 200) {
      final responseMovies = ResponseMovies.fromJson(response.data);
      return responseMovies.data?.movies ?? [];
    }
    throw response.data['message'];
  }
}
