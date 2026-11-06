import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/routes/route_name.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';
import 'package:movie_app/core/widgets/custom_movie_card.dart';
import 'package:movie_app/core/widgets/loading_widget.dart';
import 'package:movie_app/modules/movie_details/presentation/manager/similar_movies_cubit.dart';

class SimilarMoviesSection extends StatelessWidget {
  final int movieId;
  const SimilarMoviesSection({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SimilarMoviesCubit>()..getSimilarMovies(movieId),
      child: BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
        builder: (context, state) {
          if (state is SimilarMoviesSuccess) {
            if (state.similarMovie.isEmpty) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'details.similar'.tr(),
                    style: AppText.s24w6.copyWith(color: AppColors.white),
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.similarMovie.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.75,
                        ),
                    itemBuilder: (context, index) {
                      final movie = state.similarMovie[index];
                      return CustomMovieCard(
                        onTap: () => context.push(
                          RouteName.movieDetailsWithId(movie.id),
                        ),
                        image: movie.image,
                        rating: movie.rating,
                      );
                    },
                  ),
                ],
              ),
            );
          }
          if (state is SimilarMoviesFailure) return const SizedBox.shrink();
          return const SizedBox(height: 200, child: LoadingWidget());
        },
      ),
    );
  }
}
