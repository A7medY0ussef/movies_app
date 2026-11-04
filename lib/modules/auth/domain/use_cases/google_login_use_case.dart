import '../entities/user_entity.dart';
import '../repo/repo.dart';

class GoogleLoginUseCase {
  final AuthRepository repository;

  GoogleLoginUseCase({
    required this.repository,
  });

  Future<UserEntity> call() async {
    return await repository.loginWithGoogle();
  }
}