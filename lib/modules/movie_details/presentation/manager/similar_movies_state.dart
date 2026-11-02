part of 'similar_movies_cubit.dart';

@immutable
sealed class SimilarMoviesState {
  const SimilarMoviesState();
}

final class SimilarMoviesInitial extends SimilarMoviesState {
  const SimilarMoviesInitial();
}
final class SimilarMoviesLoading extends SimilarMoviesState {
  const SimilarMoviesLoading();
}


final class SimilarMoviesSuccess extends SimilarMoviesState {
  final List<SimilarMovieEntity> similarMovie;

  const SimilarMoviesSuccess(this.similarMovie);
}

final class SimilarMoviesFailure extends SimilarMoviesState {
  final String errorMessage;
  const SimilarMoviesFailure(this.errorMessage);
}
