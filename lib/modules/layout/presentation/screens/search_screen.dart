import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies_app/core/constants/assets.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/modules/layout/presentation/cubit/layout_cubit.dart';
import 'package:movies_app/modules/layout/presentation/cubit/layout_state.dart';
import 'package:movies_app/modules/layout/presentation/widgets/movie_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<LayoutCubit>(context);
        return Padding(
          padding: EdgeInsets.all(8.r),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  cubit.searchWithDebounce(value);
                },
                cursorColor: AppColors.white,
                style: TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  fillColor: AppColors.surface,
                  filled: true,

                  prefixIcon: Image.asset(Assets.icSearch),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: AppColors.white),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: .circular(16.r),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: .circular(16.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(child: _buildResults(state, cubit)),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildResults(LayoutState state, LayoutCubit cubit) {
  if (state is SearchStateLoading) {
    return Center(child: CircularProgressIndicator(color: AppColors.white));
  }
  if (state is SearchStateSuccess) {
    if (cubit.resultSearch.isEmpty) {
      return const Center(
        child: Text(
          'No movies found',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      );
    }
    return GridView.builder(
      itemCount: cubit.resultSearch.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final movie = cubit.resultSearch[index];
        return MovieCard(
          image: movie.mediumCoverImage ?? '',
          rating: movie.rating ?? 0.0,
        );
      },
    );
  }
  if (state is SearchStateError) {
    return Center(
      child: Text(state.message, style: TextStyle(color: AppColors.white)),
    );
  }
  return const SizedBox.shrink();
}
