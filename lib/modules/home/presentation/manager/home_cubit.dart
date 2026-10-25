import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/home/domain/entities/movie_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/modules/home/domain/use_cases/get_movies_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetMoviesUseCase getMoviesUseCase;
  HomeCubit({required this.getMoviesUseCase}) : super(const HomeInitial());

  Future<void> getMovies() async {
    emit(const HomeLoading());
    final results = await Future.wait([
      getMoviesUseCase(limit: 3),
      getMoviesUseCase(genre: 'Action', limit: 10),
    ]);
    final availableNowResult = results[0];
    final actionResult = results[1];
    availableNowResult.fold(
      (failure) => emit(HomeFailure(failure.message)),
      (availableNow) => actionResult.fold(
        (failure) => emit(HomeFailure(failure.message)),
        (action) =>
            emit(HomeSuccess(availableNow: availableNow, actionMovies: action)),
      ),
    );
  }
}
