import 'cast_entity.dart';

class MovieDetailsEntity {
  final int id;
  final String title;
  final String backgroundImage;
  final String posterImage;
  final double rating;
  final int runtime;
  final int likeCount;
  final int year;
  final String ytTrailerCode;
  final String descriptionFull;
  final List<String> screenshots;
  final List<String> genres;
  final List<CastEntity> cast;

  MovieDetailsEntity({
    required this.id,
    required this.title,
    required this.backgroundImage,
    this.posterImage = '',
    required this.rating,
    required this.runtime,
    required this.likeCount,
    required this.ytTrailerCode,
    required this.descriptionFull,
    required this.screenshots,
    required this.genres,
    required this.cast,
    required this.year,
  });
}
