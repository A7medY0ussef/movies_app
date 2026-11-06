import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routes/route_name.dart';
import 'package:movie_app/core/utils/size_config.dart';
import 'package:movie_app/modules/layout/home/domain/entities/movie_entity.dart';
import 'package:movie_app/modules/layout/home/presentation/widgets/movie_card.dart';

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
          .map(
            (movie) => MovieCard(
              onTap: () => context.push(RouteName.movieDetailsWithId(movie.id)),
              image: movie.image,
              rating: movie.rating,
            ),
          )
          .toList(),
    );
  }
}
