import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies_app/core/constants/assets.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_style.dart';
import 'package:movies_app/modules/onboarding/presentation/screens/onboarding_screen.dart';

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
                      'Find Your Next\nFavorite Movie Here',
                      textAlign: TextAlign.center,
                      style: AppText.s36w5.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 16.h),

                    Text(
                      'Get access to a huge library of movies to suit all tastes. You will surely like it.',
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OnboardingScreen()));
                },
                child: Center(child: Text('Explore Now', style: AppText.s20w6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
