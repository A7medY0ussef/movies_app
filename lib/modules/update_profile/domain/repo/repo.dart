import 'package:movie_app/modules/auth/domain/entities/user_entity.dart';

abstract class UpdateProfileRepository {
  Future<UserEntity> getUserData();

  Future<UserEntity> updateProfile({
    required String name,
    required String phoneNumber,
    required String avatarPath,
  });

  Future<void> deleteAccount();
}
