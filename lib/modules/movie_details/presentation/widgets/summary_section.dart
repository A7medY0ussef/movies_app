import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';

class SummarySection extends StatelessWidget {
  final String summary;
  const SummarySection({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Summary',
            style: AppText.s24w6.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 8),
          Text(
            summary.isEmpty ? 'No summary Available' : summary,
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: AppText.s16w4.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
