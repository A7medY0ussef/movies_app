import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/delete_account_use_case.dart';
import '../../domain/use_cases/get_user_data_use_case.dart';
import '../../domain/use_cases/update_user_data_use_case.dart';
import 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final GetUserDataUseCase getUserDataUseCase;
  final UpdateUserDataUseCase updateUserDataUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;

  UpdateProfileCubit({
    required this.getUserDataUseCase,
    required this.updateUserDataUseCase,
    required this.deleteAccountUseCase,
  }) : super(UpdateProfileInitial());

  Future<void> getUserData() async {
    emit(UpdateProfileLoading());
    try {
      final user = await getUserDataUseCase.call();
      emit(UpdateProfileLoaded(user));
    } catch (e) {
      emit(UpdateProfileFailure(e.toString()));
    }
  }

  Future<void> updateProfile({
    required String name,
    required String phoneNumber,
    required String avatarPath,
  }) async {
    emit(UpdateProfileSubmitting());
    try {
      final user = await updateUserDataUseCase.call(
        name: name,
        phoneNumber: phoneNumber,
        avatarPath: avatarPath,
      );
      emit(UpdateProfileSuccess(user));
    } catch (e) {
      emit(UpdateProfileFailure(e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    emit(UpdateProfileSubmitting());
    try {
      await deleteAccountUseCase.call();
      emit(DeleteAccountSuccess());
    } catch (e) {
      emit(UpdateProfileFailure(e.toString()));
    }
  }
}
