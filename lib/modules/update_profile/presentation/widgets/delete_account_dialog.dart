import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.grey,
      title: Text(
        'update_profile.delete_account'.tr(),
        style: const TextStyle(color: AppColors.white),
      ),
      content: Text(
        'update_profile.delete_confirm_message'.tr(),
        style: const TextStyle(color: AppColors.lightGrey),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'update_profile.cancel'.tr(),
            style: const TextStyle(color: AppColors.lightGrey),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            'update_profile.delete'.tr(),
            style: const TextStyle(color: AppColors.red),
          ),
        ),
      ],
    );
  }
}
