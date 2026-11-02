import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/assets.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/movie_header/stats_data.dart';

class MovieStatsRow extends StatelessWidget {
  final int likeCount;
  final int runtime;
  final double rating;
  const MovieStatsRow({
    super.key,
    required this.likeCount,
    required this.runtime,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: StatsData(data: likeCount.toString(), image: Assets.heartIcon),
        ),
        SizedBox(width: 10),
        Expanded(
          child: StatsData(data: runtime.toString(), image: Assets.timeIcon),
        ),
        SizedBox(width: 10),
        Expanded(
          child: StatsData(data: rating.toString(), image: Assets.starIcon),
        ),
      ],
    );
  }
}
