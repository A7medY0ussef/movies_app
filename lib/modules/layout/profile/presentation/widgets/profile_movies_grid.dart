import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routes/route_name.dart';
import 'package:movie_app/core/widgets/custom_movie_card.dart';
import 'package:movie_app/modules/layout/profile/domain/entities/saved_movie_entity.dart';

class ProfileMoviesGrid extends StatelessWidget {
  final List<SavedMovieEntity> movies;

  const ProfileMoviesGrid({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2 / 3,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return CustomMovieCard(
          image: movie.imageUrl,
          rating: movie.rating,
          onTap: () {
            context.push(RouteName.movieDetailsWithId(movie.id));
          },
        );
      },
    );
  }
}
