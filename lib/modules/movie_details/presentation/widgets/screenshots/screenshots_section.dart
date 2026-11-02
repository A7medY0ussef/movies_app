import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/screenshots/custom_screenshots.dart';

class ScreenshotsSection extends StatelessWidget {
  final List<String> screenshots;

  const ScreenshotsSection({super.key, required this.screenshots});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Screen Shots',
            style: AppText.s24w6.copyWith(color: AppColors.white),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: screenshots.length,
            itemBuilder: (context, index) =>
                CustomScreenshots(screenShot: screenshots[index]),
          ),
        ],
      ),
    );
  }
}
