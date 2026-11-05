import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/errors/error_mapper.dart';
import 'package:movie_app/modules/auth/domain/entities/user_entity.dart';
import 'package:movie_app/modules/layout/profile/data/data_source/profile_remote_data_source.dart';
import 'package:movie_app/modules/layout/profile/domain/entities/saved_movie_entity.dart';
import 'package:movie_app/modules/layout/profile/domain/use_cases/get_history_use_case.dart';
import 'package:movie_app/modules/layout/profile/domain/use_cases/get_watchlist_use_case.dart';
import 'package:movie_app/modules/layout/profile/presentation/manager/profile_state.dart';

import '../../domain/use_cases/get_profile_use_case.dart';
import '../../domain/use_cases/update_profile_use_case.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final GetHistoryUseCase? getHistoryUseCase;
  final GetWatchlistUseCase? getWatchlistUseCase;
  final ProfileRemoteDataSource remoteDataSource;

  StreamSubscription? _historySub;
  StreamSubscription? _watchlistSub;

  UserEntity? _currentUser;
  List<SavedMovieEntity> _history = [];
  List<SavedMovieEntity> _watchlist = [];

  ProfileCubit({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
    this.getHistoryUseCase,
    this.getWatchlistUseCase,
    ProfileRemoteDataSource? remoteDataSource,
  })  : remoteDataSource = remoteDataSource ?? ProfileRemoteDataSource(),
        super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());

    try {
      _currentUser = await getProfileUseCase.call();

      await _historySub?.cancel();
      await _watchlistSub?.cancel();


      _historySub = remoteDataSource.getHistoryStream().listen((history) {
        _history = history;
        if (_currentUser != null && !isClosed) {
          emit(ProfileLoaded(
            _currentUser!,
            history: _history,
            watchlist: _watchlist,
          ));
        }
      });


      _watchlistSub = remoteDataSource.getWatchlistStream().listen((watchlist) {
        _watchlist = watchlist;
        if (_currentUser != null && !isClosed) {
          emit(ProfileLoaded(
            _currentUser!,
            history: _history,
            watchlist: _watchlist,
          ));
        }
      });
    } catch (e) {
      emit(ProfileFailure(mapErrorToKey(e)));
    }
  }

  Future<void> updateProfile({
    required String name,
    required String phoneNumber,
    required String avatarPath,
  }) async {
    emit(ProfileUpdating());

    try {
      final user = await updateProfileUseCase.call(
        name: name,
        phoneNumber: phoneNumber,
        avatarPath: avatarPath,
      );

      _currentUser = user;
      emit(ProfileUpdated(user));
      emit(ProfileLoaded(
        user,
        history: _history,
        watchlist: _watchlist,
      ));
    } catch (e) {
      emit(ProfileFailure(mapErrorToKey(e)));
    }
  }

  @override
  Future<void> close() {
    _historySub?.cancel();
    _watchlistSub?.cancel();
    return super.close();
  }
}
