import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/core/widgets/rating_badge.dart';

class CustomMovieCard extends StatelessWidget {
  final String image;
  final double rating;
  final VoidCallback? onTap;
  const CustomMovieCard({
    super.key,
    required this.image,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: Colors.red),
            ),
            Positioned(top: 8, left: 8, child: RatingBadge(rating: rating)),
          ],
        ),
      ),
    );
  }
}
