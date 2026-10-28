import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/assets.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/cast_list/cast_data.dart';

class CastCard extends StatelessWidget {
  final String name;
  final String image;
  const CastCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      height: 92,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child:CastData(
          image: Assets.personInMovieDetails,
          name: name,
          character: image
      )
    );
  }
}
