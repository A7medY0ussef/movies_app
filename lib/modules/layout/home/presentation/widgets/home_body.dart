import 'package:flutter/material.dart';
import 'package:movie_app/modules/layout/home/domain/entities/movie_entity.dart';
import 'package:movie_app/modules/layout/home/presentation/widgets/movies_section.dart';
import 'package:movie_app/modules/layout/home/presentation/widgets/section_body.dart';

class HomeBody extends StatelessWidget {
  final List<MovieEntity> actionMovies;

  const HomeBody({super.key, required this.actionMovies});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionBody(),
        SizedBox(height: 12),
        MoviesSection(actionMovies: actionMovies),
      ],
    );
  }
}
