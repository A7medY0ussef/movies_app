import 'movie_details_model.dart';

class DataOfMovie {
  DataOfMovie({
      this.movie,});

  DataOfMovie.fromJson(dynamic json) {
    movie = json['movie'] != null ? MovieDetailsModel.fromJson(json['movie']) : null;
  }
  MovieDetailsModel? movie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (movie != null) {
      map['movie'] = movie?.toJson();
    }
    return map;
  }

}