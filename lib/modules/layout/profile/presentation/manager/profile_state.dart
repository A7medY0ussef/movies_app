import 'package:movie_app/modules/auth/domain/entities/user_entity.dart';
import 'package:movie_app/modules/layout/profile/domain/entities/saved_movie_entity.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserEntity user;
  final List<SavedMovieEntity> history;
  final List<SavedMovieEntity> watchlist;

  ProfileLoaded(
    this.user, {
    this.history = const [],
    this.watchlist = const [],
  });
}

class ProfileUpdating extends ProfileState {}

class ProfileUpdated extends ProfileState {
  final UserEntity user;

  ProfileUpdated(this.user);
}

class ProfileFailure extends ProfileState {
  final String message;

  ProfileFailure(this.message);
}
