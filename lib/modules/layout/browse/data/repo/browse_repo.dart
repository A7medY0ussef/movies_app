import 'package:injectable/injectable.dart';
import 'package:movie_app/modules/layout/browse/data/data_source/browse_remote_data_sources.dart';
import 'package:movie_app/modules/layout/data/model/movie.dart';
import 'package:movie_app/modules/layout/data/model/response.dart';


abstract class BrowseRepo {
  Future<List<Movie>?> getMoviesByGenre(String genre);
}

@Injectable(as: BrowseRepo)
class BrowseRepoImp implements BrowseRepo {
  BrowseRemoteDataSource remoteDataSource;
  BrowseRepoImp(this.remoteDataSource);

  @override
  Future<List<Movie>?> getMoviesByGenre(String genre) async {
    try {
      var response = await remoteDataSource.getMoviesByGenre(genre);
      if (response.statusCode == 200) {
        var respnseMovies = ResponseMovies.fromJson(response.data);
        return respnseMovies.data?.movies ?? [];
      } else {
        throw response.data['message'];
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}