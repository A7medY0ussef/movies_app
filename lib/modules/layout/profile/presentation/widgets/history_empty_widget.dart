import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class HistoryEmptyWidget extends StatelessWidget {
  const HistoryEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.history, size: 80, color: AppColors.lightGrey),
          const SizedBox(height: 12),
          Text(
            'profile.no_history'.tr(),
            style: const TextStyle(color: AppColors.lightGrey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
