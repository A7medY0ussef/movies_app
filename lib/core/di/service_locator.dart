import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/modules/layout/browse/data/data_source/browse_remote_data_sources.dart';
import 'package:movie_app/modules/layout/browse/data/repo/browse_repo.dart';
import 'package:movie_app/modules/layout/browse/presentation/manager/browse_cubit.dart';
import 'package:movie_app/modules/layout/home/data/data_source/home_remote_data_source.dart';
import 'package:movie_app/modules/layout/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:movie_app/modules/layout/home/data/repo/home_repo_impl.dart';
import 'package:movie_app/modules/layout/home/domain/repo/home_repo.dart';
import 'package:movie_app/modules/layout/home/domain/use_cases/get_movies_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/modules/layout/home/presentation/manager/home_cubit.dart';
import 'package:movie_app/modules/layout/manager/layout_cubit.dart';
import 'package:movie_app/modules/movie_details/data/data_source/movie_details_remote_data_source.dart';
import 'package:movie_app/modules/movie_details/data/data_source/movie_details_remote_data_source_impl.dart';
import 'package:movie_app/modules/movie_details/data/repo/movie_details_repo_impl.dart';
import 'package:movie_app/modules/movie_details/domain/repo/movie_details_repo.dart';
import 'package:movie_app/modules/movie_details/domain/use_cases/get_similar_movies_use_case.dart';
import 'package:movie_app/modules/movie_details/domain/use_cases/movie_details_use_case.dart';
import 'package:movie_app/modules/movie_details/presentation/manager/movie_details_cubit.dart';
import 'package:movie_app/modules/movie_details/presentation/manager/similar_movies_cubit.dart';
import 'package:movie_app/modules/layout/search/data/data_source/search_remote_data_sources.dart';
import 'package:movie_app/modules/layout/search/data/repo/search_repo.dart';
import 'package:movie_app/modules/layout/search/presentation/manager/search_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  //Home
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

  // Movie Details
  getIt.registerLazySingleton<MovieDetailsRemoteDataSource>(
    () => MovieDetailsRemoteDataSourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<MovieDetailsRepo>(
    () => MovieDetailsRepoImpl(movieDetailsRemoteDataSource: getIt()),
  );
  getIt.registerLazySingleton<MovieDetailsUseCase>(
    () => MovieDetailsUseCase(movieDetailsRepo: getIt()),
  );
  getIt.registerFactory<MovieDetailsCubit>(
    () => MovieDetailsCubit(movieDetailsUseCase: getIt()),
  );

  // Similar Movies
  getIt.registerLazySingleton<GetSimilarMoviesUseCase>(
    () => GetSimilarMoviesUseCase(movieDetailsRepo: getIt()),
  );
  getIt.registerFactory<SimilarMoviesCubit>(
    () => SimilarMoviesCubit(getSimilarMoviesUseCase: getIt()),
  );

  // Search
  getIt.registerLazySingleton<SearchRemoteDataSource>(
        () => SearchRemoteDataSource(client: getIt()),
  );

  getIt.registerLazySingleton<SearchRepo>(
        () => SearchRepoImp(remoteDataSource: getIt()),
  );

  getIt.registerFactory<SearchCubit>(
        () => SearchCubit(getIt()),
  );
  getIt.registerFactory<LayoutCubit>(
        () => LayoutCubit(),
  );
  // Browse
  getIt.registerLazySingleton<BrowseRemoteDataSource>(
        () => BrowseRemoteDataSource(),
  );

  getIt.registerLazySingleton<BrowseRepo>(
        () => BrowseRepoImp(getIt<BrowseRemoteDataSource>()),
  );

  getIt.registerFactory<BrowseCubit>(
        () => BrowseCubit(getIt<BrowseRepo>()),
  );
}
