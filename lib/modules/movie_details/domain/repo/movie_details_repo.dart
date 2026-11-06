import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/modules/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movie_app/modules/movie_details/domain/entities/similar_movie_entity.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required int movieId,
  });
  Future<Either<Failure, List<SimilarMovieEntity>>> getSimilarMovies({
    required int movieId,
  });

}
