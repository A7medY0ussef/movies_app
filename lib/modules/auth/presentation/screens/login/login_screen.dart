
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
import '../../widgets/custom_text_form_field.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess &&
                  state.messageType == AuthMessageType.loginSuccess) {
                CustomSnackBar.show(
                  context,
                  message: 'messages.login_success'.tr(),
                  type: SnackBarType.success,
                );
                context.go(RouteName.layout);
              }

              if (state is AuthSuccess &&
                  state.messageType == AuthMessageType.googleLoginSuccess) {
                CustomSnackBar.show(
                  context,
                  message: 'messages.google_login_success'.tr(),
                  type: SnackBarType.success,
                );
                context.go(RouteName.layout);
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
              final isLoginLoading = state is AuthLoading &&
                  state.type == AuthLoadingType.login;

              final isGoogleLoading = state is AuthLoading &&
                  state.type == AuthLoadingType.googleLogin;

              final isAnyLoginLoading =
                  isLoginLoading || isGoogleLoading;

              return Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 67),

                    Image.asset(Assets.appLogo),

                    const SizedBox(height: 70),

                    CustomTextFormField(
                      prefixIcon: Assets.emailIcon,
                      hintText: 'auth.email'.tr(),
                      isPassword: false,
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'validation.email_required'.tr();
                        }

                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value.trim())) {
                          return 'validation.email_invalid'.tr();
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    CustomTextFormField(
                      prefixIcon: Assets.passwordIcon,
                      hintText: 'auth.password'.tr(),
                      isPassword: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'validation.password_required'.tr();
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 5),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: isAnyLoginLoading
                            ? null
                            : () => context.push(
                         RouteName.forgetPassword,
                        ),
                        child: Text(
                          'auth.forget_password'.tr(),
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: AppText.s14w4.fontSize,
                            fontWeight: AppText.s14w4.fontWeight,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isAnyLoginLoading
                            ? null
                            : () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }

                          context.read<AuthCubit>().login(
                            email: emailController.text.trim(),
                            password: passwordController.text,
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
                        child: isLoginLoading
                            ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                            : Text(
                          'auth.login'.tr(),
                          style: AppText.s20w4,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'auth.dont_have_account'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppText.s14w4.fontSize,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.go(
                            RouteName.register,
                          ),
                          child: Text(
                            'auth.create_one'.tr(),
                            style: AppText.s14w4.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: AppColors.primary,
                            indent: 70,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'auth.or'.tr(),
                            style: const TextStyle(
                              color: Color(0xFFFFC107),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: AppColors.primary,
                            endIndent: 70,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 22),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isAnyLoginLoading
                            ? null
                            : () {
                          context.read<AuthCubit>().loginWithGoogle();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF6BD00),
                          foregroundColor: AppColors.grey,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: isGoogleLoading
                            ? const Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                        )
                            : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage(Assets.googleIcon),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'auth.login_with_google'.tr(),
                              style: AppText.s16w4,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 33),

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
    );
  }
}
