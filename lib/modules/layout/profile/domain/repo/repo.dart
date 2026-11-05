import 'package:movie_app/modules/auth/domain/entities/user_entity.dart';
import 'package:movie_app/modules/layout/profile/domain/entities/saved_movie_entity.dart';

abstract class ProfileRepository {
  Future<UserEntity> getProfile();

  Future<UserEntity> updateProfile({
    required String name,
    required String phoneNumber,
    required String avatarPath,
  });

  Future<List<SavedMovieEntity>> getHistory();

  Future<void> addToHistory({
    required int id,
    required String title,
    required double rating,
    required String imageUrl,
  });

  Future<List<SavedMovieEntity>> getWatchlist();

  Future<bool> isInWatchlist(int movieId);

  Future<bool> toggleWatchlist({
    required int id,
    required String title,
    required double rating,
    required String imageUrl,
  });
}
