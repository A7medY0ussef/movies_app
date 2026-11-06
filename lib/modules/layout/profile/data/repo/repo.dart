import 'package:movie_app/modules/auth/domain/entities/user_entity.dart';
import 'package:movie_app/modules/layout/profile/domain/entities/saved_movie_entity.dart';
import 'package:movie_app/modules/layout/profile/domain/repo/repo.dart';
import '../data_source/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<UserEntity> getProfile() async {
    return await remoteDataSource.getProfile();
  }

  @override
  Future<UserEntity> updateProfile({
    required String name,
    required String phoneNumber,
    required String avatarPath,
  }) async {
    return await remoteDataSource.updateProfile(
      name: name,
      phoneNumber: phoneNumber,
      avatarPath: avatarPath,
    );
  }

  @override
  Future<List<SavedMovieEntity>> getHistory() async {
    return await remoteDataSource.getHistory();
  }

  @override
  Future<void> addToHistory({
    required int id,
    required String title,
    required double rating,
    required String imageUrl,
  }) async {
    await remoteDataSource.addToHistory(
      id: id,
      title: title,
      rating: rating,
      imageUrl: imageUrl,
    );
  }

  @override
  Future<List<SavedMovieEntity>> getWatchlist() async {
    return await remoteDataSource.getWatchlist();
  }

  @override
  Future<bool> isInWatchlist(int movieId) async {
    return await remoteDataSource.isInWatchlist(movieId);
  }

  @override
  Future<bool> toggleWatchlist({
    required int id,
    required String title,
    required double rating,
    required String imageUrl,
  }) async {
    return await remoteDataSource.toggleWatchlist(
      id: id,
      title: title,
      rating: rating,
      imageUrl: imageUrl,
    );
  }
}
