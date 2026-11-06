import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/assets.dart';
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

  Widget _placeholder() => Image.asset(
    Assets.personInMovieDetails,
    width: 60,
    height: 70,
    fit: BoxFit.cover,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: image.isEmpty
              ? _placeholder()
              : CachedNetworkImage(
                  imageUrl: image,
                  width: 60,
                  height: 70,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => _placeholder(),
                  errorWidget: (context, url, error) => _placeholder(),
                ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'details.cast_name'.tr(args: [name]),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppText.s18w4.copyWith(color: AppColors.white),
              ),
              const SizedBox(height: 12),
              Text(
                'details.cast_character'.tr(args: [character]),
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
