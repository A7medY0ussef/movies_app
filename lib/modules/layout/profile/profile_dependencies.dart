import 'data/data_source/profile_remote_data_source.dart';
import 'data/repo/repo.dart';
import 'domain/use_cases/get_history_use_case.dart';
import 'domain/use_cases/get_profile_use_case.dart';
import 'domain/use_cases/get_watchlist_use_case.dart';
import 'domain/use_cases/update_profile_use_case.dart';
import 'presentation/manager/profile_cubit.dart';

ProfileCubit createProfileCubit() {
  final remoteDataSource = ProfileRemoteDataSource();

  final repository = ProfileRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );

  return ProfileCubit(
    getProfileUseCase: GetProfileUseCase(repository: repository),
    updateProfileUseCase: UpdateProfileUseCase(repository: repository),
    getHistoryUseCase: GetHistoryUseCase(repository: repository),
    getWatchlistUseCase: GetWatchlistUseCase(repository: repository),
  );
}
