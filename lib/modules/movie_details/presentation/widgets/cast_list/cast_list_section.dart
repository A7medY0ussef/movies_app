import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/assets.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/cast_list/cast_card.dart';

class CastListSection extends StatelessWidget {
  const CastListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cast', style: AppText.s24w6.copyWith(color: AppColors.white)),
          const SizedBox(height: 4),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) =>
                CastCard(image: Assets.personInMovieDetails, name: 'ahmed'),
          ),
        ],
      ),
    );
  }
}
