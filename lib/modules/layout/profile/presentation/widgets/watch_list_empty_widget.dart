import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/assets.dart';

class WatchListEmptyWidget extends StatelessWidget {
  const WatchListEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.popcorn,
            width: 120,
            height: 120,
          ),
        ],
      ),
    );
  }
}
