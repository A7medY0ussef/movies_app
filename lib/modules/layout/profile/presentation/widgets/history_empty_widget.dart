import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class HistoryEmptyWidget extends StatelessWidget {
  const HistoryEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 80,
            color: AppColors.lightGrey,
          ),
          SizedBox(height: 12),
          Text(
            'No history yet',
            style: TextStyle(
              color: AppColors.lightGrey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
