// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../modules/layout/data/remote_data_source/remote_data_source.dart'
    as _i711;
import '../../modules/layout/data/repo/repo.dart' as _i963;
import '../../modules/layout/presentation/cubit/layout_cubit.dart' as _i420;
import '../services/api_service.dart' as _i137;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i137.ApiService>(() => _i137.ApiService());
    gh.factory<_i711.RemoteDataSource>(
      () => _i711.RemoteDataSourceImp(gh<_i137.ApiService>()),
    );
    gh.factory<_i963.Repo>(() => _i963.RepoImp(gh<_i711.RemoteDataSource>()));
    gh.factory<_i420.LayoutCubit>(() => _i420.LayoutCubit(gh<_i963.Repo>()));
    return this;
  }
}
