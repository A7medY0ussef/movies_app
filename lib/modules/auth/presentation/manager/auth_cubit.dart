import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/google_login_use_case.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/register_use_case.dart';
import '../../domain/use_cases/forget_password_use_case.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final GoogleLoginUseCase googleLoginUseCase;
  final RegisterUseCase registerUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.googleLoginUseCase,
    required this.registerUseCase,
    required this.forgetPasswordUseCase,
  }) : super(AuthInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading(AuthLoadingType.login));

    try {
      final user = await loginUseCase(
        email: email,
        password: password,
      );

      emit(
        AuthSuccess(
          user: user,
          messageType: AuthMessageType.loginSuccess,
        ),
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(AuthLoading(AuthLoadingType.googleLogin));

    try {
      final user = await googleLoginUseCase();

      emit(AuthSuccess(
        user: user,
        messageType: AuthMessageType.googleLoginSuccess,
      ));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String avatarPath,
  }) async {
    emit(AuthLoading(AuthLoadingType.register));

    try {
      final user = await registerUseCase(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        avatarPath: avatarPath,
      );
      debugPrint('Registration completed successfully');
      emit(
        AuthSuccess(
          user: user,
          messageType: AuthMessageType.registerSuccess,
        ),

      );
      debugPrint('AuthSuccess emitted');
    } catch (e) {
      emit(AuthFailure(e.toString()));

    }
  }

  Future<void> forgetPassword({
    required String email,
  }) async {
    emit(AuthLoading(AuthLoadingType.forgetPassword));

    try {
      await forgetPasswordUseCase(email: email);

      emit(
        AuthSuccess(
          messageType: AuthMessageType.forgetPasswordSuccess,
        ),
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
