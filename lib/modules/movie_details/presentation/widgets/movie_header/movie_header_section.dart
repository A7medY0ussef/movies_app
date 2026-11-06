import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movie_app/core/constants/assets.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';
import 'package:movie_app/core/widgets/custom_button.dart';
import 'package:movie_app/core/widgets/gradient_background_container.dart';
import 'package:movie_app/modules/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/movie_header/header_app_bar.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/movie_header/movie_stats_row.dart';

class MovieHeaderSection extends StatelessWidget {
  final MovieDetailsEntity movie;
  const MovieHeaderSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundContainer(
      image: CachedNetworkImageProvider(movie.backgroundImage),
      height: 645.h,
      beginGradient: 0.20,
      endGradient: 0.60,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              HeaderAppBar(movie: movie),
              Spacer(),
              Image.asset(Assets.startWatch),
              Spacer(),
              Text(
                movie.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppText.s24w6.copyWith(color: AppColors.white),
              ),
              SizedBox(height: 15),
              if (movie.year != 0)
                Text(
                  movie.year.toString(),
                  style: AppText.s20w6.copyWith(color: AppColors.lightGrey),
                ),
              SizedBox(height: 8),
              CustomButton(
                title: 'details.watch'.tr(),
                bgColor: AppColors.red,
                fgColor: AppColors.white,
              ),
              SizedBox(height: 16),
              MovieStatsRow(
                likeCount: movie.likeCount,
                runtime: movie.runtime,
                rating: movie.rating,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
