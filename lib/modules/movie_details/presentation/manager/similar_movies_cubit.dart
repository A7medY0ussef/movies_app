import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/modules/movie_details/domain/entities/similar_movie_entity.dart';
import 'package:movie_app/modules/movie_details/domain/use_cases/get_similar_movies_use_case.dart';

part 'similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  SimilarMoviesCubit({required this.getSimilarMoviesUseCase})
    : super(const SimilarMoviesInitial());

  Future<void> getSimilarMovies(int movieId) async {
    emit(const SimilarMoviesLoading());
    final result = await getSimilarMoviesUseCase(movieId: movieId);

    result.fold(
      (failure) => emit(SimilarMoviesFailure(failure.message)),
      (movie) => emit(SimilarMoviesSuccess(movie)),
    );
  }
}
