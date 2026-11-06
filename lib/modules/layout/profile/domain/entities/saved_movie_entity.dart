class SavedMovieEntity {
  final int id;
  final String title;
  final double rating;
  final String imageUrl;
  final DateTime savedAt;

  SavedMovieEntity({
    required this.id,
    required this.title,
    required this.rating,
    required this.imageUrl,
    required this.savedAt,
  });
}
