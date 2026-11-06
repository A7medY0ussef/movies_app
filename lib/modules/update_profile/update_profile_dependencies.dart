import 'data/data_source/update_profile_remote_data_source.dart';
import 'data/repo/repo.dart';
import 'domain/use_cases/delete_account_use_case.dart';
import 'domain/use_cases/get_user_data_use_case.dart';
import 'domain/use_cases/update_user_data_use_case.dart';
import 'presentation/manager/update_profile_cubit.dart';

UpdateProfileCubit createUpdateProfileCubit() {
  final remoteDataSource = UpdateProfileRemoteDataSource();
  final repository = UpdateProfileRepositoryImpl(remoteDataSource: remoteDataSource);

  return UpdateProfileCubit(
    getUserDataUseCase: GetUserDataUseCase(repository: repository),
    updateUserDataUseCase: UpdateUserDataUseCase(repository: repository),
    deleteAccountUseCase: DeleteAccountUseCase(repository: repository),
  );
}
