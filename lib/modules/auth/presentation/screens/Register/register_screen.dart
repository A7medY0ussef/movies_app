
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routes/route_name.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/snack_bar_type.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';
import '../../widgets/carousel_slider.dart';
import '../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String? selectedAvatar;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        foregroundColor: const Color(0xffF6BD00),
        centerTitle: true,
        title: Text('auth.register'.tr(), style: AppText.s16w4),
        backgroundColor: AppColors.background,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: SingleChildScrollView(
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess &&
                    state.messageType == AuthMessageType.registerSuccess) {
                  CustomSnackBar.show(
                    context,
                    message: 'messages.register_success'.tr(),
                    type: SnackBarType.success,
                  ).closed.then((_) {
                    if (context.mounted) {
                      context.go(RouteName.layout);
                    }
                  });
                }

                if (state is AuthFailure) {
                  CustomSnackBar.show(
                    context,
                    message: state.message.tr(),
                    type: SnackBarType.error,
                  );
                }
              },
              builder: (context, state) {
                debugPrint('Current State: ${state.runtimeType}');
                final isLoading = state is AuthLoading;

                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AvatarCarousel(
                        onAvatarSelected: (avatar) {
                          selectedAvatar = avatar;
                        },
                      ),
                      const SizedBox(height: 12),

                      CustomTextFormField(
                        controller: nameController,
                        prefixIcon: Assets.nameIcon,
                        hintText: 'auth.name'.tr(),
                        isPassword: false,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'validation.name_required'.tr();
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      CustomTextFormField(
                        controller: emailController,
                        prefixIcon: Assets.emailIcon,
                        hintText: 'auth.email'.tr(),
                        isPassword: false,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'validation.email_required'.tr();
                          }

                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                              .hasMatch(value.trim())) {
                            return 'validation.email_invalid'.tr();
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      CustomTextFormField(
                        controller: passwordController,
                        prefixIcon: Assets.passwordIcon,
                        hintText: 'auth.password'.tr(),
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'validation.password_required'.tr();
                          }

                          if (value.length < 6) {
                            return 'validation.password_min'.tr();
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      CustomTextFormField(
                        controller: confirmPasswordController,
                        prefixIcon: Assets.passwordIcon,
                        hintText: 'auth.confirm_password'.tr(),
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'validation.confirm_password_required'.tr();
                          }

                          if (value != passwordController.text) {
                            return 'validation.passwords_not_match'.tr();
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      CustomTextFormField(
                        controller: phoneController,
                        prefixIcon: Assets.passwordIcon,
                        hintText: 'auth.phone_number'.tr(),
                        isPassword: false,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'validation.phone_required'.tr();
                          }

                          if (!RegExp(r'^\+?[0-9]{8,15}$')
                              .hasMatch(value.trim())) {
                            return 'validation.phone_invalid'.tr();
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }

                            if (selectedAvatar == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select an avatar'),
                                ),
                              );
                              return;
                            }

                            context.read<AuthCubit>().register(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              password: passwordController.text,
                              phoneNumber: phoneController.text.trim(),
                              avatarPath: selectedAvatar!,
                            );



                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffF6BD00),
                            foregroundColor: AppColors.grey,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                            child: isLoading
                                ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                                : Text(
                              'auth.create_account'.tr(),
                              style: AppText.s20w4,
                            ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'auth.already_have_account'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: AppText.s14w4.fontSize,
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () => context.go(RouteName.login),
                            child: Text(
                              'auth.login'.tr(),
                              style: AppText.s14w4.copyWith(
                                fontWeight: FontWeight.w900,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: const Color(0xffF6BD00),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.setLocale(const Locale('en'));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 2,
                                      color: const Color(0xffF6BD00),
                                    ),
                                    color: const Color(0xffF6BD00),
                                  ),
                                  child: Image.asset(Assets.americaIcon),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.setLocale(const Locale('ar'));
                                },
                                child: Image.asset(Assets.egyptIcon),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
