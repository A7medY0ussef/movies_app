import 'package:movie_app/modules/layout/profile/domain/entities/saved_movie_entity.dart';
import '../repo/repo.dart';

class GetWatchlistUseCase {
  final ProfileRepository repository;

  GetWatchlistUseCase({required this.repository});

  Future<List<SavedMovieEntity>> call() async {
    return await repository.getWatchlist();
  }
}
