
import '../../domain/entities/user_entity.dart';

enum AuthMessageType {
  registerSuccess,
  loginSuccess,
  googleLoginSuccess,
  forgetPasswordSuccess,

}

enum AuthLoadingType {
  login,
  register,
  googleLogin,
  forgetPassword,
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  final AuthLoadingType type;

  AuthLoading(this.type);
}

class AuthSuccess extends AuthState {
  final UserEntity? user;
  final AuthMessageType messageType;

  AuthSuccess({
    this.user,
    required this.messageType,
  });
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}
