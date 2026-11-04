
import '../repo/repo.dart';

class ForgetPasswordUseCase {
  final AuthRepository repository;

  ForgetPasswordUseCase({required this.repository});

  Future<void> call({
    required String email,
  }) {
    return repository.forgetPassword(email: email);
  }
}