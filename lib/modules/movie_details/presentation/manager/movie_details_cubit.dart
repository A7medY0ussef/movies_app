import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/movie_details/domain/use_cases/movie_details_use_case.dart';
import 'package:movie_app/modules/movie_details/presentation/manager/movie_details_state.dart';


class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsUseCase movieDetailsUseCase;

  MovieDetailsCubit({required this.movieDetailsUseCase})
      : super(const MovieDetailsInitial());

  Future<void> getMovieDetails(int movieId) async {
    emit(const MovieDetailsLoading());

    final result = await movieDetailsUseCase(movieId: movieId);

    result.fold(
          (failure) => emit(MovieDetailsFailure(failure.message)),
          (movie) => emit(MovieDetailsSuccess(movie)),
    );
  }
}