import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_style.dart';
import 'package:movies_app/modules/layout/presentation/cubit/layout_cubit.dart';
import 'package:movies_app/modules/layout/presentation/cubit/layout_state.dart';
import 'package:movies_app/modules/layout/presentation/widgets/movie_card.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<LayoutCubit>(context);
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
    );
  }
}

Widget _buildResults(LayoutState state, LayoutCubit cubit) {
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
