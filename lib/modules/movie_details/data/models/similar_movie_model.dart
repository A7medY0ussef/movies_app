import 'package:movie_app/modules/movie_details/domain/entities/similar_movie_entity.dart';

class SimilarMovieModel {
  SimilarMovieModel({this.id, this.rating, this.mediumCoverImage});

  SimilarMovieModel.fromJson(dynamic json) {
    id = json['id'];
    rating = (json['rating'] as num?)?.toDouble();
    mediumCoverImage = json['medium_cover_image'];
  }

  SimilarMovieEntity toEntity() {
    return SimilarMovieEntity(
      id: id ?? 0,
      image: mediumCoverImage ?? '',
      rating: rating ?? 0,
    );
  }

  int? id;
  double? rating;
  String? mediumCoverImage;
}