import 'package:movie_app/modules/auth/domain/entities/user_entity.dart';
import '../repo/repo.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase({
    required this.repository,
  });

  Future<UserEntity> call({
    required String name,
    required String phoneNumber,
    required String avatarPath,
  }) async {
    return await repository.updateProfile(
      name: name,
      phoneNumber: phoneNumber,
      avatarPath: avatarPath,
    );
  }
}