import '../repo/repo.dart';

class DeleteAccountUseCase {
  final UpdateProfileRepository repository;

  DeleteAccountUseCase({required this.repository});

  Future<void> call() async {
    return await repository.deleteAccount();
  }
}
