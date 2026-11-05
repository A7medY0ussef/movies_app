import 'package:movie_app/modules/layout/profile/domain/entities/saved_movie_entity.dart';
import '../repo/repo.dart';

class GetHistoryUseCase {
  final ProfileRepository repository;

  GetHistoryUseCase({required this.repository});

  Future<List<SavedMovieEntity>> call() async {
    return await repository.getHistory();
  }
}
