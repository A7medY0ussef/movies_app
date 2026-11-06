import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';

class StatsData extends StatelessWidget {
  final String data;
  final String image;
  const StatsData({super.key, required this.data, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 47,
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, color: AppColors.yellow, width: 26),
          SizedBox(width: 14),
          Text(data, style: AppText.s24w6.copyWith(color: AppColors.white)),
        ],
      ),
    );
  }
}
