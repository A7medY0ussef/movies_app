import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/size_config.dart';
import 'package:movie_app/modules/layout/home/domain/entities/movie_entity.dart';
import 'package:movie_app/modules/layout/home/presentation/widgets/movie_card.dart';

class MoviesSection extends StatelessWidget {
  final List<MovieEntity> actionMovies;
  const MoviesSection({super.key, required this.actionMovies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.width * 0.5,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: actionMovies.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) => AspectRatio(
          aspectRatio: 2 / 3,
          child: MovieCard(
            image: actionMovies[index].image,
            rating: actionMovies[index].rating,
          ),
        ),
      ),
    );
  }
}
