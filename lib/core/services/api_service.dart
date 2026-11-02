import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiService {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://movies-api.accel.li/api/v2/',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    ),
  );
}
