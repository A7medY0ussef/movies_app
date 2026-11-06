import 'package:movie_app/modules/auth/domain/entities/user_entity.dart';
import '../repo/repo.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase({
    required this.repository,
  });

  Future<UserEntity> call() async {
    return await repository.getProfile();
  }
}