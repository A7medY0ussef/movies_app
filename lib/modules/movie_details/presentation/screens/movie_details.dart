import 'package:flutter/material.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/cast_list/cast_list_section.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/genres_chips/genres_chips_section.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/movie_header/movie_header_section.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/screenshots/screenshots_section.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/similar_movies/similar_movies_section.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MovieHeaderSection(),
              ScreenshotsSection(),
              SizedBox(height: 16),
              SimilarMoviesSection(),
              SizedBox(height: 16),
              CastListSection(),
              SizedBox(height: 16),
              GenresChipsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
