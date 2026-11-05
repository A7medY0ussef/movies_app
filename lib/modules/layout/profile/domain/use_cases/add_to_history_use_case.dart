import '../repo/repo.dart';

class AddToHistoryUseCase {
  final ProfileRepository repository;

  AddToHistoryUseCase({required this.repository});

  Future<void> call({
    required int id,
    required String title,
    required double rating,
    required String imageUrl,
  }) async {
    return await repository.addToHistory(
      id: id,
      title: title,
      rating: rating,
      imageUrl: imageUrl,
    );
  }
}
