import 'package:easy_localization/easy_localization.dart';
import 'package:movie_app/modules/update_profile/presentation/widgets/delete_account_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routes/route_name.dart';
import 'package:movie_app/core/theme/app_text_style.dart';
import 'package:movie_app/modules/update_profile/presentation/manager/update_profile_cubit.dart';
import 'package:movie_app/modules/update_profile/presentation/manager/update_profile_state.dart';
import 'package:movie_app/modules/update_profile/presentation/widgets/avatar_picker_bottom_sheet.dart';
import 'package:movie_app/modules/update_profile/update_profile_dependencies.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../../../core/widgets/snack_bar_type.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  String _selectedAvatar = Assets.avatar2Icon;


  final List<String> _avatars = [
    Assets.avatar6Icon,
    Assets.avatar2Icon,
    Assets.avatar3Icon,
    Assets.avatar4Icon,
    Assets.avatar5Icon,
    Assets.avatar7Icon,
    Assets.avatar8Icon,
    Assets.avatar1Icon,
    Assets.avatar9Icon,
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _showAvatarBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (bottomSheetContext) {
        return AvatarPickerBottomSheet(
          selectedAvatar: _selectedAvatar,
          avatars: _avatars,
          onAvatarSelected: (avatar) {
            setState(() {
              _selectedAvatar = avatar;
            });
          },
        );
      },
    );
  }

  Future<void> _confirmDeleteAccount(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => const DeleteAccountDialog(),
    );

    if (confirmed == true && context.mounted) {
      context.read<UpdateProfileCubit>().deleteAccount();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => createUpdateProfileCubit()..getUserData(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.yellow),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'update_profile.title'.tr(),
            style: AppText.s16w6.copyWith(color: AppColors.yellow),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
          listener: (context, state) {
            if (state is UpdateProfileLoaded) {
              if (_nameController.text.isEmpty) {
                _nameController.text = state.user.name;
              }
              if (_phoneController.text.isEmpty) {
                _phoneController.text = state.user.phoneNumber;
              }
              if (state.user.avatarPath.isNotEmpty &&
                  !state.user.avatarPath.startsWith('http')) {
                setState(() {
                  _selectedAvatar = state.user.avatarPath;
                });
              }
            }

            if (state is UpdateProfileSuccess) {
              CustomSnackBar.show(
                context,
                message: 'update_profile.updated_success'.tr(),
                type: SnackBarType.success,
              );
              context.pop(true);
            }

            if (state is DeleteAccountSuccess) {
              CustomSnackBar.show(
                context,
                message: 'update_profile.deleted_success'.tr(),
                type: SnackBarType.info,
              );
              context.go(RouteName.login);
            }

            if (state is UpdateProfileFailure) {
              CustomSnackBar.show(
                context,
                message: state.message.tr(),
                type: SnackBarType.error,
              );
            }
          },
          builder: (context, state) {
            final isSubmitting = state is UpdateProfileSubmitting;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 12),


                    GestureDetector(
                      onTap: _showAvatarBottomSheet,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: AppColors.grey,
                        backgroundImage: AssetImage(_selectedAvatar),
                      ),
                    ),

                    const SizedBox(height: 32),


                    TextFormField(
                      controller: _nameController,
                      style: const TextStyle(color: AppColors.white),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'update_profile.name_required'.tr();
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'John Safwat',
                        hintStyle: TextStyle(
                          color: AppColors.white,
                          fontSize: AppText.s16w4.fontSize,
                          fontWeight: AppText.s16w4.fontWeight,
                        ),
                        prefixIcon: ImageIcon(
                          const AssetImage(Assets.nameIconProfile),
                          color: AppColors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColors.grey,
                            width: 1.5,
                          ),
                        ),
                        fillColor: AppColors.grey,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColors.grey,
                            width: 1.5,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColors.grey,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColors.grey,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(color: AppColors.white),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'update_profile.phone_required'.tr();
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: '01200000000',
                        hintStyle: TextStyle(
                          color: AppColors.white,
                          fontSize: AppText.s16w4.fontSize,
                          fontWeight: AppText.s16w4.fontWeight,
                        ),
                        prefixIcon: const ImageIcon(
                          AssetImage(Assets.phoneIconProfile),
                          color: AppColors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColors.grey,
                            width: 1.5,
                          ),
                        ),
                        fillColor: AppColors.grey,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColors.grey,
                            width: 1.5,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColors.grey,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: AppColors.grey,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),


                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          context.push(RouteName.forgetPassword);
                        },
                        child: Text(
                          'update_profile.reset_password'.tr(),
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),


                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: isSubmitting
                            ? null
                            : () => _confirmDeleteAccount(context),
                        child: Text(
                          'update_profile.delete_account'.tr(),
                          style: AppText.s16wB.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),


                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: isSubmitting
                            ? null
                            : () {
                                if (!_formKey.currentState!.validate()) return;
                                context.read<UpdateProfileCubit>().updateProfile(
                                      name: _nameController.text.trim(),
                                      phoneNumber:
                                          _phoneController.text.trim(),
                                      avatarPath: _selectedAvatar,
                                    );
                              },
                        child: isSubmitting
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.background,
                                ),
                              )
                            : Text(
                          'update_profile.update_data'.tr(),
                                style: AppText.s16wB.copyWith(
                                  color: AppColors.background,
                                ),
                              ),
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
