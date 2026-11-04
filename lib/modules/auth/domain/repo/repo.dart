import '../entities/user_entity.dart';


abstract class AuthRepository {
  Future<UserEntity> login({
    required String email,
    required String password,
  });

  Future<UserEntity> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String avatarPath,
  });

  Future<UserEntity> loginWithGoogle();

  Future<void> forgetPassword({
    required String email,
  });
}