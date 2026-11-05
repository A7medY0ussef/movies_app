import 'package:movie_app/modules/auth/domain/entities/user_entity.dart';

abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileLoaded extends UpdateProfileState {
  final UserEntity user;

  UpdateProfileLoaded(this.user);
}

class UpdateProfileSubmitting extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final UserEntity user;

  UpdateProfileSuccess(this.user);
}

class DeleteAccountSuccess extends UpdateProfileState {}

class UpdateProfileFailure extends UpdateProfileState {
  final String message;

  UpdateProfileFailure(this.message);
}
