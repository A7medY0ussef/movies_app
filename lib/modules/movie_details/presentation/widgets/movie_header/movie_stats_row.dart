import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/assets.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/movie_header/stats_data.dart';

class MovieStatsRow extends StatelessWidget {
  const MovieStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: StatsData(data: '15', image: Assets.heartIcon)),
        SizedBox(width: 10,),
        Expanded(child: StatsData(data: '90', image: Assets.timeIcon)),
        SizedBox(width: 10,),
        Expanded(child: StatsData(data: '7.6', image: Assets.starIcon)),
      ],
    );
  }
}
