import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';
import 'package:movie_app/core/widgets/custom_movie_card.dart';

class SimilarMoviesSection extends StatelessWidget {
  const SimilarMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar',
            style: AppText.s24w6.copyWith(color: AppColors.white),
          ),
          SizedBox(height: 12),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (context, index) => const CustomMovieCard(
              image: 'https://picsum.photos/300/450',
              rating: 5.2,
            ),
          ),
        ],
      ),
    );
  }
}
