import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/size_config.dart';
import 'package:movie_app/modules/home/domain/entities/movie_entity.dart';
import 'package:movie_app/modules/home/presentation/widgets/movie_card.dart';

class AvailableNowCarousel extends StatelessWidget {
  final List<MovieEntity> movies;
  final ValueChanged<int> onPageChanged;
  const AvailableNowCarousel({
    super.key,
    required this.movies,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: (index, reason) => onPageChanged(index),
        height: context.height * 0.4,
        viewportFraction: 0.55,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
      ),
      items: movies
          .map((movie) => MovieCard(image: movie.image, rating: movie.rating))
          .toList(),
    );
  }
}
