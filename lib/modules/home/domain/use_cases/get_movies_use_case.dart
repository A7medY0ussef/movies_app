import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/modules/home/domain/entities/movie_entity.dart';
import 'package:movie_app/modules/home/domain/repo/home_repo.dart';

class GetMoviesUseCase {
  final HomeRepo repo;
  const GetMoviesUseCase({required this.repo});

  Future<Either<Failure, List<MovieEntity>>> call({
    String? genre,
    int? limit,
  }) {
    return repo.getMovies(genre: genre, limit: limit);
  }
}
