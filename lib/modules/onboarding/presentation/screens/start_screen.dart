import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/constants/assets.dart';
import 'package:movie_app/core/routes/route_name.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/theme/app_text_style.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.bgStartScreen),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.r),
                child: Column(
                  children: [
                    Text(
                      'start.title'.tr(),
                      textAlign: TextAlign.center,
                      style: AppText.s36w5.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 16.h),

                    Text(
                      'start.subtitle'.tr(),
                      style: AppText.s20w4.copyWith(
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: .all(16.r),
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.background,
                  shape: RoundedRectangleBorder(borderRadius: .circular(16)),
                ),
                onPressed: () {
                  context.go(RouteName.onBoarding);
                },
                child: Center(child: Text('start.explore_now'.tr(), style: AppText.s20w6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
