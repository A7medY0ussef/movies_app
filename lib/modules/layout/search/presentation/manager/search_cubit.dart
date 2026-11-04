import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/errors/error_handler.dart';
import 'package:movie_app/modules/layout/data/model/movie.dart';
import 'package:movie_app/modules/layout/search/data/repo/search_repo.dart';
import 'package:movie_app/modules/layout/search/presentation/manager/search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.repo) : super(SearchInitial());

  final SearchRepo repo;
  List<Movie> resultSearch = [];

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
      emit(SearchStateError(handleError(e).message));
    }
  }

  Timer? _searchDebounce;

  void searchWithDebounce(String query) {
    _searchDebounce?.cancel();

    _requestId++;

    final value = query.trim();

    if (value.isEmpty) {
      resultSearch = [];
      emit(SearchInitial());
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
