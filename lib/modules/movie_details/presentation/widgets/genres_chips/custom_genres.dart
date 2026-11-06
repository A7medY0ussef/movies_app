import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/app_genres.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';

class CustomGenres extends StatelessWidget {
  final String genre;
  const CustomGenres({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122,
      height: 36,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          AppGenres.label(genre),
          maxLines: 1,
          style: AppText.s16w5.copyWith(color: AppColors.white,
              overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
