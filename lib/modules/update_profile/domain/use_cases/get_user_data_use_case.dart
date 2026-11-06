import 'package:movie_app/modules/auth/domain/entities/user_entity.dart';
import '../repo/repo.dart';

class GetUserDataUseCase {
  final UpdateProfileRepository repository;

  GetUserDataUseCase({required this.repository});

  Future<UserEntity> call() async {
    return await repository.getUserData();
  }
}
