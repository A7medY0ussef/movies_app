import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/modules/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movie_app/modules/movie_details/domain/repo/movie_details_repo.dart';

class MovieDetailsUseCase {
  final MovieDetailsRepo movieDetailsRepo;
  const MovieDetailsUseCase({required this.movieDetailsRepo});

  Future<Either<Failure, MovieDetailsEntity>> call({required int movieId}) {
    return movieDetailsRepo.getMovieDetails(movieId: movieId);
  }
}
