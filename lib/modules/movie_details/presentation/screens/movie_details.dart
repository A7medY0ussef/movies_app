import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/widgets/back_button_overlay.dart';
import 'package:movie_app/core/widgets/error_message_widget.dart';
import 'package:movie_app/core/widgets/loading_widget.dart';
import 'package:movie_app/modules/movie_details/presentation/manager/movie_details_cubit.dart';
import 'package:movie_app/modules/movie_details/presentation/manager/movie_details_state.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/cast_list/cast_list_section.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/genres_chips/genres_chips_section.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/movie_header/movie_header_section.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/screenshots/screenshots_section.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/similar_movies/similar_movies_section.dart';
import 'package:movie_app/modules/movie_details/presentation/widgets/summary_section.dart';

class MovieDetails extends StatelessWidget {
  final int movieId;
  const MovieDetails({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MovieDetailsCubit>()..getMovieDetails(movieId),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsSuccess) {
              return SafeArea(
                top: false,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MovieHeaderSection(movie: state.movie),
                      ScreenshotsSection(screenshots: state.movie.screenshots),
                      SizedBox(height: 16),
                      SimilarMoviesSection(movieId: movieId),
                      SizedBox(height: 16),
                      SummarySection(summary: state.movie.descriptionFull),
                      SizedBox(height: 16),
                      CastListSection(cast: state.movie.cast),
                      SizedBox(height: 16),
                      GenresChipsSection(genres: state.movie.genres),
                    ],
                  ),
                ),
              );
            }
            if (state is MovieDetailsFailure) {
              return BackButtonOverlay(
                child: ErrorMessageWidget(errorMessage: state.errorMessage),
              );
            }
            return const BackButtonOverlay(child: LoadingWidget());
          },
        ),
      ),
    );
  }
}
