import 'package:injectable/injectable.dart';
import 'package:movies_app/modules/layout/data/model/movie.dart';
import 'package:movies_app/modules/layout/data/model/response.dart';
import 'package:movies_app/modules/layout/data/remote_data_source/remote_data_source.dart';

abstract class Repo {
  Future<List<Movie>?> resultSearch(String query);
  Future<List<Movie>?> getMoviesByGenre(String genre);
}

@Injectable(as: Repo)
class RepoImp implements Repo {
  RemoteDataSource remoteDataSource;
  RepoImp(this.remoteDataSource);
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
      print(e.toString());
    }
    return null;
  }

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
