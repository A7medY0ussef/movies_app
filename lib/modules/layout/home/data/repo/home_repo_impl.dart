import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/error_handler.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/modules/layout/home/data/data_source/home_remote_data_source.dart';
import 'package:movie_app/modules/layout/home/domain/entities/movie_entity.dart';
import 'package:movie_app/modules/layout/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource remoteDataSource;

  const HomeRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> getMovies({
    String? genre,
    int? limit,
  }) async {
    try {
      final models = await remoteDataSource.getMovies(
        genre: genre,
        limit: limit,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(handleError(e));
    }
  }
}
