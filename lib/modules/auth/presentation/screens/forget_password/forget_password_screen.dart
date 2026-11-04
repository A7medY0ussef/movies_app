
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routes/route_name.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';

import '../../../../../core/constants/assets.dart';
import '../../../../../core/widgets/custom_snack_bar.dart';
import '../../../../../core/widgets/snack_bar_type.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xffF6BD00),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'auth.forget_password_for_app_Bar'.tr(),
          style: AppText.s16w4,
        ),
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess &&
                state.messageType ==
                    AuthMessageType.forgetPasswordSuccess) {
              CustomSnackBar.show(
                context,
                message: 'messages.reset_email_sent'.tr(),
                type: SnackBarType.success,
              );

              context.go(RouteName.login);
            }

            if (state is AuthFailure) {
              CustomSnackBar.show(
                context,
                message: state.message,
                type: SnackBarType.error,
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading &&
                state.type == AuthLoadingType.forgetPassword;

            return Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(Assets.forgetPassword),

                  const SizedBox(height: 20),

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

                        context.read<AuthCubit>().forgetPassword(
                          email: emailController.text.trim(),
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
                          : Text(
                        'auth.verify_email'.tr(),
                        style: AppText.s20w4,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
