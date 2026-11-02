import 'package:movie_app/modules/movie_details/data/models/similar_movie_model.dart';

class SimilarMoviesResponseModel {
  SimilarMoviesResponseModel({this.movies});

  SimilarMoviesResponseModel.fromJson(dynamic json) {
    final list = json['data']?['movies'] as List?;
    movies = list?.map((e) => SimilarMovieModel.fromJson(e)).toList();
  }

  List<SimilarMovieModel>? movies;
}