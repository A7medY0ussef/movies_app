import '../../domain/entities/user_entity.dart';
import '../../domain/repo/repo.dart';
import '../data_source/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<UserEntity> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String avatarPath,
  }) async {
    final credential = await remoteDataSource.register(
      name: name,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      avatarPath: avatarPath,
    );

    return UserModel(
      uid: credential.user!.uid,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      avatarPath: avatarPath,
    );
  }

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    final userData = await remoteDataSource.login(
      email: email,
      password: password,
    );

    return UserModel.fromMap(
      userData,
      uid: userData['uid'],
    );
  }

  @override
  Future<UserEntity> loginWithGoogle() async {
    final data = await remoteDataSource.loginWithGoogle();

    return UserModel.fromMap(
      data,
      uid: data['uid'],
    );
  }

  @override
  Future<void> forgetPassword({
    required String email,
  }) async {
    await remoteDataSource.forgetPassword(email: email);
  }
}