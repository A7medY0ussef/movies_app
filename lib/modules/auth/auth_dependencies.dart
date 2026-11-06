
import 'data/data_source/auth_remote_data_source.dart';
import 'data/repo/repo.dart';
import 'domain/use_cases/login_use_case.dart';
import 'domain/use_cases/register_use_case.dart';
import 'domain/use_cases/forget_password_use_case.dart';
import 'domain/use_cases/google_login_use_case.dart';
import 'presentation/manager/auth_cubit.dart';

AuthCubit createAuthCubit() {
  final remoteDataSource = AuthRemoteDataSource();

  final repository = AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );

  return AuthCubit(
    loginUseCase: LoginUseCase(repository: repository),
    registerUseCase: RegisterUseCase(repository: repository),
    forgetPasswordUseCase: ForgetPasswordUseCase(repository: repository),
    googleLoginUseCase: GoogleLoginUseCase(repository: repository),
  );
}
