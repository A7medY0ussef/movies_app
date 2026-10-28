import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';

class CastData extends StatelessWidget {
  final String image;
  final String name;
  final String character;
  const CastData({
    super.key,
    required this.image,
    required this.name,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(image, width: 60, height: 70, fit: BoxFit.cover),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: $name',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppText.s18w4.copyWith(color: AppColors.white),
              ),
              SizedBox(height: 12),
              Text(
                'Character: $character',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppText.s18w4.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
