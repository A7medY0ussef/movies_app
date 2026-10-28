import 'movie_model.dart';
class MoviesDataModel {
  MoviesDataModel({
      this.movieCount, 
      this.limit, 
      this.pageNumber, 
      this.movies,});

  MoviesDataModel.fromJson(dynamic json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(MovieModel.fromJson(v));
      });
    }
  }
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<MovieModel>? movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = movieCount;
    map['limit'] = limit;
    map['page_number'] = pageNumber;
    if (movies != null) {
      map['movies'] = movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}