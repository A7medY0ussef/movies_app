import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.grey,
      title: const Text(
        'Delete Account',
        style: TextStyle(color: AppColors.white),
      ),
      content: const Text(
        'Are you sure you want to delete your account? This action cannot be undone.',
        style: TextStyle(color: AppColors.lightGrey),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(
            'Cancel',
            style: TextStyle(color: AppColors.lightGrey),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(
            'Delete',
            style: TextStyle(color: AppColors.red),
          ),
        ),
      ],
    );
  }
}
