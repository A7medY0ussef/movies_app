import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/modules/home/data/data_source/home_remote_data_source.dart';
import 'package:movie_app/modules/home/domain/entities/movie_entity.dart';
import 'package:movie_app/modules/home/domain/repo/home_repo.dart';

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
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          return Left(NetworkFailure(message: 'Connection timed out'));
        case DioExceptionType.badResponse:
          return Left(
            ServerFailure(message: 'Server error: ${e.response?.statusCode}'),
          );
        default:
          return Left(UnknownFailure(message: 'Something went wrong'));
      }
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
