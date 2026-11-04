import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movie_app/core/constants/assets.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/modules/layout/home/presentation/screens/home_screen.dart';
import 'package:movie_app/modules/layout/manager/layout_cubit.dart';
import 'package:movie_app/modules/layout/manager/layout_state.dart';
import 'package:movie_app/modules/layout/profile/presentation/screens/profile_screen.dart';
import 'package:movie_app/modules/layout/search/presentation/screens/search_screen.dart';

import 'browse/presentation/screens/browse_screen.dart';

List<Widget> listWidgets = [
  HomeScreen(),
  SearchScreen(),
  BrowseScreen(),
  ProfileScreen(),
];

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LayoutCubit>(),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<LayoutCubit>(context);
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  listWidgets[cubit.currentIndex],
                  Positioned(
                    left: 8.r,
                    right: 8.r,
                    bottom: 12.r,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: .circular(18.r),
                      ),
                      child: BottomNavigationBar(
                        backgroundColor: AppColors.grey, //todo
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        type: BottomNavigationBarType.fixed,
                        useLegacyColorScheme: true,
                        currentIndex: cubit.currentIndex,
                        onTap: cubit.onChangeScreen,
                        items: [
                          BottomNavigationBarItem(
                            icon: Image.asset(Assets.icHome),
                            label: 'nav.home'.tr(),
                            activeIcon: Image.asset(
                              Assets.icHome,
                              color: AppColors.primary,
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: Image.asset(Assets.icSearch),
                            label: 'nav.search'.tr(),
                            activeIcon: Image.asset(
                              Assets.icSearch,
                              color: AppColors.primary,
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: Image.asset(Assets.icBrowse),
                            label: 'nav.browse'.tr(),
                            activeIcon: Image.asset(
                              Assets.icBrowse,
                              color: AppColors.primary,
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: Image.asset(Assets.icProfile),
                            label: 'nav.profile'.tr(),
                            activeIcon: Image.asset(
                              Assets.icProfile,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
