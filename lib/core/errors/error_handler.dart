import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/core/errors/failures.dart';

Failure handleError(Object e) {
  if (e is DioException) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure(message: 'errors.network');
      case DioExceptionType.badResponse:
        debugPrint('Server error: ${e.response?.statusCode}');
        return const ServerFailure(message: 'errors.server');
      default:
        return const UnknownFailure(message: 'errors.unknown');
    }
  }
  debugPrint('Unknown error: $e');
  return const UnknownFailure(message: 'errors.unknown');
}