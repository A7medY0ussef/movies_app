import '../entities/user_entity.dart';
import '../repo/repo.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});

  Future<UserEntity> call({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String avatarPath,
  }) {
    return repository.register(
      name: name,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      avatarPath: avatarPath,
    );
  }
}