import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routes/route_name.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';
import 'package:movie_app/modules/auth/domain/entities/user_entity.dart';
import 'package:movie_app/modules/layout/profile/presentation/manager/profile_cubit.dart';

class ProfileHeaderSection extends StatelessWidget {
  final UserEntity user;
  final int wishListCount;
  final int historyCount;

  const ProfileHeaderSection({
    super.key,
    required this.user,
    required this.wishListCount,
    required this.historyCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.grey,
              backgroundImage: user.avatarPath.isNotEmpty
                  ? (user.avatarPath.startsWith('http')
                      ? NetworkImage(user.avatarPath) as ImageProvider
                      : AssetImage(user.avatarPath))
                  : const NetworkImage(
                      'https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png',
                    ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        wishListCount.toString(),
                        style: AppText.s36wB.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Wish List',
                        style: AppText.s24wB.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        historyCount.toString(),
                        style: AppText.s36wB.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'History',
                        style: AppText.s24wB.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          user.name,
          style: AppText.s20wB.copyWith(
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () async {
                  await context.push(RouteName.updateProfile);
                  if (context.mounted) {
                    context.read<ProfileCubit>().getProfile();
                  }
                },
                child:  Text(
                  'Edit Profile',
                  style: AppText.s20w4.copyWith(
                    color: AppColors.background
    )
                  ),
                ),
              ),

            const SizedBox(width: 12),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    context.go(RouteName.login);
                  }
                },
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Exit',
                      style: AppText.s20w4.copyWith(
                      color: AppColors.white
                      )
                      ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.exit_to_app,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
