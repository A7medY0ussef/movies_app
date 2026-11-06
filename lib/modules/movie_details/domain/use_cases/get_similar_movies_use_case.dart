import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/modules/movie_details/domain/entities/similar_movie_entity.dart';
import 'package:movie_app/modules/movie_details/domain/repo/movie_details_repo.dart';

class GetSimilarMoviesUseCase {
  final MovieDetailsRepo movieDetailsRepo;
  const GetSimilarMoviesUseCase({required this.movieDetailsRepo});
  Future<Either<Failure, List<SimilarMovieEntity>>> call({
    required int movieId,
  }) {
    return movieDetailsRepo.getSimilarMovies(movieId: movieId);
  }
}
