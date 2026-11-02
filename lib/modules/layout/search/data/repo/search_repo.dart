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
    try {
      var respons = await remoteDataSource.resultSearch(query);
      if (respons.statusCode == 200) {
        var responsMovies = ResponseMovies.fromJson(respons.data);

        return responsMovies.data?.movies ?? [];
      } else {
        throw respons.data['message'];
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}