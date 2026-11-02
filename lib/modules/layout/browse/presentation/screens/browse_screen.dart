import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/routes/route_name.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';
import 'package:movie_app/modules/layout/browse/presentation/manager/browse_cubit.dart';
import 'package:movie_app/modules/layout/browse/presentation/manager/browse_state.dart';
import 'package:movie_app/modules/layout/home/presentation/widgets/movie_card.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BrowseCubit>(),
      child: BlocBuilder<BrowseCubit, BrowseState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<BrowseCubit>(context);
          return Column(
            children: [
              DefaultTabController(
                length: cubit.genre.length,
                child: TabBar(
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  dragStartBehavior: DragStartBehavior.start,
                  tabAlignment: .start,
                  padding: .zero,
                  labelPadding: .symmetric(horizontal: 8),
                  labelColor: AppColors.background,
                  unselectedLabelColor: AppColors.primary,
                  onTap: cubit.onChangeGenre,
                  tabs: [
                    ...List.generate(cubit.genre.length, (index) {
                      bool isSelected = cubit.currentGenreIndex == index;
                      return Container(
                        margin: .symmetric(vertical: 16),
                        padding: .symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.background,
                          borderRadius: .circular(16),
                          border: BoxBorder.all(
                            color: AppColors.primary,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          cubit.genre[index],
                          style: AppText.s20wB.copyWith(fontWeight: .w700),
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(child: _buildResults(state, cubit)),
            ],
          );
        },
      ),
    );
  }
}

Widget _buildResults(BrowseState state, BrowseCubit cubit) {
  if (state is GenreStateLoading) {
    return Center(child: CircularProgressIndicator(color: AppColors.white));
  }
  if (state is GenreStateSuccess) {
    if (cubit.moviesOfGenre.isEmpty) {
      return const Center(child: Text('No movies found'));
    }
    return GridView.builder(
      itemCount: cubit.moviesOfGenre.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final movie = cubit.moviesOfGenre[index];
        return MovieCard(
          onTap: () {
            if (movie.id == null) return;
            context.push(RouteName.movieDetailsWithId(movie.id!));
          },
          image: movie.mediumCoverImage ?? '',
          rating: movie.rating ?? 0.0,
        );
      },
    );
  }
  if (state is GenreStateError) {
    return Center(
      child: Text(state.message, style: TextStyle(color: AppColors.white)),
    );
  }
  return const SizedBox.shrink();
}
