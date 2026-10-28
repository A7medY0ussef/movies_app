import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/modules/layout/home/data/data_source/home_remote_data_source.dart';
import 'package:movie_app/modules/layout/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:movie_app/modules/layout/home/data/repo/home_repo_impl.dart';
import 'package:movie_app/modules/layout/home/domain/repo/home_repo.dart';
import 'package:movie_app/modules/layout/home/domain/use_cases/get_movies_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/modules/layout/home/presentation/manager/home_cubit.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(remoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<GetMoviesUseCase>(
    () => GetMoviesUseCase(repo: getIt()),
  );
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getMoviesUseCase: getIt()));
}
