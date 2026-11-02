import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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

  @override
  Future<Either<Failure, List<SimilarMovieEntity>>> getSimilarMovies({
    required int movieId,
  }) async {
    try {
      final model = await movieDetailsRemoteDataSource.getSimilarMovies(
        movieId: movieId,
      );
      return Right(model.map((m) => m.toEntity()).toList());
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
