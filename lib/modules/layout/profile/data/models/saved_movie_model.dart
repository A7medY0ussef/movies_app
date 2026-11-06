import 'package:movie_app/modules/layout/profile/domain/entities/saved_movie_entity.dart';

class SavedMovieModel extends SavedMovieEntity {
  SavedMovieModel({
    required super.id,
    required super.title,
    required super.rating,
    required super.imageUrl,
    required super.savedAt,
  });

  factory SavedMovieModel.fromMap(Map<String, dynamic> map) {
    DateTime parsedDate;
    try {
      final val = map['savedAt'];
      if (val is int) {
        parsedDate = DateTime.fromMillisecondsSinceEpoch(val);
      } else if (val != null) {
        parsedDate = DateTime.tryParse(val.toString()) ?? DateTime.now();
      } else {
        parsedDate = DateTime.now();
      }
    } catch (_) {
      parsedDate = DateTime.now();
    }

    String img = map['imageUrl']?.toString() ?? '';

    if (img.contains('background.jpg')) {
      img = img.replaceAll('background.jpg', 'medium-cover.jpg');
    }

    return SavedMovieModel(
      id: map['id'] is int
          ? map['id'] as int
          : int.tryParse(map['id']?.toString() ?? '0') ?? 0,
      title: map['title']?.toString() ?? '',
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
      imageUrl: img,
      savedAt: parsedDate,
    );
  }

  Map<String, dynamic> toMap() {
    String img = imageUrl;
    if (img.contains('background.jpg')) {
      img = img.replaceAll('background.jpg', 'medium-cover.jpg');
    }
    return {
      'id': id,
      'title': title,
      'rating': rating,
      'imageUrl': img,
      'savedAt': savedAt.millisecondsSinceEpoch,
    };
  }
}
