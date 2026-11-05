import '../repo/repo.dart';

class ToggleWatchlistUseCase {
  final ProfileRepository repository;

  ToggleWatchlistUseCase({required this.repository});

  Future<bool> call({
    required int id,
    required String title,
    required double rating,
    required String imageUrl,
  }) async {
    return await repository.toggleWatchlist(
      id: id,
      title: title,
      rating: rating,
      imageUrl: imageUrl,
    );
  }
}
