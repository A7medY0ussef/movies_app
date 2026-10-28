import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/genres_chips/custom_genres.dart';

class GenresChipsSection extends StatelessWidget {
  const GenresChipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Genres',
              style: AppText.s24w6.copyWith(color: AppColors.white),
            ),
            SizedBox(height: 4),
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 12,
                childAspectRatio: 122 / 36,
              ),
              itemBuilder: (context, index) =>  CustomGenres(
               genre: 'Action',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
