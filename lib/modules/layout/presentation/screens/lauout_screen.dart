import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies_app/core/constants/assets.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/modules/layout/presentation/cubit/layout_cubit.dart';
import 'package:movies_app/modules/layout/presentation/cubit/layout_state.dart';
import 'package:movies_app/modules/layout/presentation/screens/browse_screen.dart';
import 'package:movies_app/modules/layout/presentation/screens/home_screen.dart';
import 'package:movies_app/modules/layout/presentation/screens/profile_screen.dart';
import 'package:movies_app/modules/layout/presentation/screens/search_screen.dart';

List<Widget> listWidgets = [
  HomeScreen(),
  SearchScreen(),
  BrowseScreen(),
  ProfileScreen(),
];

class LauoutScreen extends StatelessWidget {
  const LauoutScreen({super.key});

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
                        backgroundColor: AppColors.surface,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        type: BottomNavigationBarType.fixed,
                        useLegacyColorScheme: true,
                        currentIndex: cubit.currentIndex,
                        onTap: cubit.onChangeScreen,
                        items: [
                          BottomNavigationBarItem(
                            icon: Image.asset(Assets.icHome),
                            label: 'Home',
                            activeIcon: Image.asset(
                              Assets.icHome,
                              color: AppColors.primary,
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: Image.asset(Assets.icSearch),
                            label: 'Search',
                            activeIcon: Image.asset(
                              Assets.icSearch,
                              color: AppColors.primary,
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: Image.asset(Assets.icBrowse),
                            label: 'Browse',
                            activeIcon: Image.asset(
                              Assets.icBrowse,
                              color: AppColors.primary,
                            ),
                          ),
                          BottomNavigationBarItem(
                            icon: Image.asset(Assets.icProfile),
                            label: 'Profile',
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
