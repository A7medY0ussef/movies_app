import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/custom_movie_card.dart';


class MovieCard extends StatelessWidget {
  final String image;
  final double rating;
  const MovieCard({super.key, required this.image, required this.rating});

  @override
  Widget build(BuildContext context) {
    return CustomMovieCard(image: image, rating: rating);
  }
}
