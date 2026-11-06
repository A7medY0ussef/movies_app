import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/modules/layout/profile/presentation/manager/profile_cubit.dart';
import 'package:movie_app/modules/layout/profile/presentation/manager/profile_state.dart';
import 'package:movie_app/modules/layout/profile/presentation/widgets/history_empty_widget.dart';
import 'package:movie_app/modules/layout/profile/presentation/widgets/profile_header_section.dart';
import 'package:movie_app/modules/layout/profile/presentation/widgets/profile_movies_grid.dart';
import 'package:movie_app/modules/layout/profile/presentation/widgets/profile_tab_bar.dart';
import 'package:movie_app/modules/layout/profile/presentation/widgets/watch_list_empty_widget.dart';
import 'package:movie_app/modules/layout/profile/profile_dependencies.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => createProfileCubit()..getProfile(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                );
              } else if (state is ProfileFailure) {
                return Center(
                  child: Text(
                    state.message.tr(),
                    style: const TextStyle(color: AppColors.red),
                  ),
                );
              } else if (state is ProfileLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: 24,
                        right: 24,
                        top: selectedTabIndex == 0 ? 24 : 16,
                        bottom: selectedTabIndex == 0 ? 24 : 8,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.grey,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (selectedTabIndex == 0) ...[
                            ProfileHeaderSection(
                              user: state.user,
                              wishListCount: state.watchlist.length,
                              historyCount: state.history.length,
                            ),
                            const SizedBox(height: 20),
                          ],
                          ProfileTabBar(
                            selectedIndex: selectedTabIndex,
                            onTabSelected: (index) {
                              setState(() {
                                selectedTabIndex = index;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: selectedTabIndex == 0
                          ? (state.watchlist.isEmpty
                              ? const WatchListEmptyWidget()
                              : ProfileMoviesGrid(movies: state.watchlist))
                          : (state.history.isEmpty
                              ? const HistoryEmptyWidget()
                              : ProfileMoviesGrid(movies: state.history)),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
