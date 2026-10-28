import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movie_app/core/constants/assets.dart';
import 'package:movie_app/core/widgets/gradient_background_container.dart';
import 'package:movie_app/modules/layout/home/domain/entities/movie_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'available_now_carousel.dart';

class HomeHeader extends StatefulWidget {
  final List<MovieEntity> availableNow;

  const HomeHeader({super.key, required this.availableNow});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final ImageProvider background = widget.availableNow.isEmpty
        ? const AssetImage(Assets.bgHome)
        : CachedNetworkImageProvider(widget.availableNow[currentIndex].image);
    return GradientBackgroundContainer(
      image: background,
      height: 0.75.sh,
      child: Column(
        children: [
          const SizedBox(height: 18),
          Image.asset(Assets.availableNowHome),
          const SizedBox(height: 20),
          AvailableNowCarousel(
            movies: widget.availableNow,
            onPageChanged: (int value) {
              setState(() => currentIndex = value);
            },
          ),
          const SizedBox(height: 20),
          Image.asset(Assets.watchNowHome),
        ],
      ),
    );
  }
}
