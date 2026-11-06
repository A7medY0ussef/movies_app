import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/cast_list/cast_data.dart';

class CastCard extends StatelessWidget {
  final String name;
  final String character;
  final String image;
  const CastCard({
    super.key,
    required this.name,
    required this.character,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      height: 92,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: CastData(image: image, name: name, character: character),
    );
  }
}