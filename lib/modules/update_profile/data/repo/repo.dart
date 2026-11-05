import 'package:movie_app/modules/auth/domain/entities/user_entity.dart';
import '../../domain/repo/repo.dart';
import '../data_source/update_profile_remote_data_source.dart';

class UpdateProfileRepositoryImpl implements UpdateProfileRepository {
  final UpdateProfileRemoteDataSource remoteDataSource;

  UpdateProfileRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<UserEntity> getUserData() async {
    return await remoteDataSource.getUserData();
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
  Future<void> deleteAccount() async {
    await remoteDataSource.deleteAccount();
  }
}
