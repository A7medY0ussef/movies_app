import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';
import 'package:movie_app/modules/layout/manager/layout_cubit.dart';

class SectionBody extends StatelessWidget {
  const SectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Action', style: AppText.s20w4.copyWith(color: AppColors.white)),
          GestureDetector(
            onTap: () => context.read<LayoutCubit>().onChangeScreen(2),            child: Row(
              spacing: 4,
              children: [
                Text(
                  'See More',
                  style: AppText.s16w4.copyWith(color: AppColors.primary),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.primary,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
