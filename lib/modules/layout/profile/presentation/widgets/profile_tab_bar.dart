import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/assets.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';

class ProfileTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const ProfileTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: InkWell(
            onTap: () => onTabSelected(0),
            child: Column(
              children: [
                const ImageIcon(
                  AssetImage(Assets.watchListIcon),
                  color: AppColors.yellow,
                  size: 30,
                ),
                const SizedBox(height: 4),
                Text(
                  'profile.watch_list'.tr(),
                  style: AppText.s20w4.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 2,
                  color: selectedIndex == 0
                      ? AppColors.primary
                      : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: () => onTabSelected(1),
            child: Column(
              children: [
                const ImageIcon(
                  AssetImage(Assets.historyIcon),
                  color: AppColors.yellow,
                  size: 30,
                ),
                const SizedBox(height: 4),
                Text(
                  'profile.history'.tr(),
                  style: AppText.s20w4.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 2,
                  color: selectedIndex == 1
                      ? AppColors.primary
                      : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
