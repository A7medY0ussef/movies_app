import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/error_handler.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/modules/movie_details/data/data_source/movie_details_remote_data_source.dart';
import 'package:movie_app/modules/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movie_app/modules/movie_details/domain/entities/similar_movie_entity.dart';
import 'package:movie_app/modules/movie_details/domain/repo/movie_details_repo.dart';

class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;
  const MovieDetailsRepoImpl({required this.movieDetailsRemoteDataSource});

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      final model = await movieDetailsRemoteDataSource.getMovieDetails(
        movieId: movieId,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(handleError(e));
    }
  }

  @override
  Future<Either<Failure, List<SimilarMovieEntity>>> getSimilarMovies({
    required int movieId,
  }) async {
    try {
      final model = await movieDetailsRemoteDataSource.getSimilarMovies(
        movieId: movieId,
      );
      return Right(model.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(handleError(e));
    }
  }
}
