import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/error_handler.dart';
import 'package:movie_app/modules/layout/browse/data/repo/browse_repo.dart';
import 'package:movie_app/modules/layout/browse/presentation/manager/browse_state.dart';
import 'package:movie_app/modules/layout/data/model/movie.dart';


@injectable
class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit(this.repo) : super(BrowseInitial());

  BrowseRepo repo;
  int currentGenreIndex = 0;
  List<Movie> moviesOfGenre = [];

  final List<String> genre = const [
    "Action",
    "Adventure",
    "Animation",
    "Biography",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Fantasy",
    "Film-Noir",
    "Game-Show",
    "History",
    "Horror",
    "Music",
    "Musical",
    "Mystery",
    "News",
    "Reality-TV",
    "Romance",
    "Sci-Fi",
    "Short",
    "Sport",
    "Talk-Show",
    "Thriller",
    "War",
    "Western",
  ];

  void onChangeGenre(int index) async {
    currentGenreIndex = index;
    await getMoviesByGenre(genre[index]);
  }

  Future<void> getMoviesByGenre(String genre) async {
    emit(GenreStateLoading());
    try {
      moviesOfGenre = await repo.getMoviesByGenre(genre) ?? [];
      emit(GenreStateSuccess());
    } catch (e) {
      emit(GenreStateError(handleError(e).message));
    }
  }
}