import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/modules/layout/data/model/movie.dart';
import 'package:movies_app/modules/layout/data/repo/repo.dart';
import 'package:movies_app/modules/layout/presentation/cubit/layout_state.dart';

@injectable
class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit(this.repo) : super(LayoutInitial());

  Repo repo;
  int currentIndex = 0;
  int currentGenreIndex = 0;
  List<Movie> resultSearch = [];
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
    // emit(ChangeGenre());
  }

  void onChangeScreen(int index) {
    currentIndex = index;
    emit(ChangeScreen());
  }

  Future<void> getMoviesByGenre(String genre) async {
    emit(GenreStateLoading());
    try {
      moviesOfGenre = await repo.getMoviesByGenre(genre) ?? [];
      emit(GenreStateSuccess());
    } catch (e) {
      emit(GenreStateError(e.toString()));
    }
  }

  int _requestId = 0;

  Future<void> search(String query) async {
    final requestId = ++_requestId;

    emit(SearchStateLoading());

    try {
      final result = await repo.resultSearch(query) ?? [];

      if (requestId != _requestId) return;

      resultSearch = result;
      emit(SearchStateSuccess());
    } catch (e) {
      if (requestId != _requestId) return;

      emit(SearchStateError(e.toString()));
    }
  }

  Timer? _searchDebounce;

  void searchWithDebounce(String query) {
    _searchDebounce?.cancel();

    _requestId++;

    final value = query.trim();

    if (value.isEmpty) {
      resultSearch = [];
      emit(LayoutInitial());
      return;
    }

    _searchDebounce = Timer(const Duration(milliseconds: 400), () {
      search(value);
    });
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}
