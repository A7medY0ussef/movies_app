import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_style.dart';
import 'package:movies_app/modules/onboarding/presentation/onboarding_model.dart';
import 'package:movies_app/modules/onboarding/presentation/screens/onboarding_screen.dart';

class BodyOnboarding extends StatelessWidget {
  const BodyOnboarding({
    super.key,
    required this.onboardingInfo,
    required this.index,
  });

  final OnboardingModel onboardingInfo;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(onboardingInfo.image),
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: onboardingInfo.gradient,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              padding: .all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    onboardingInfo.title,
                    style: AppText.s24wB.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 20.h),
                  if (onboardingInfo.desc != null)
                    Text(
                      onboardingInfo.desc!,
                      textAlign: TextAlign.center,
                      style: AppText.s20w4.copyWith(
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),

                  SizedBox(height: 24.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: .all(12.r),
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.background,
                      shape: RoundedRectangleBorder(
                        borderRadius: .circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingScreen(),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        index == 4 ? 'Finish' : 'Next',
                        style: AppText.s20w6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (index != 0)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: .all(12.r),
                        backgroundColor: AppColors.background,
                        foregroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: .circular(16),
                        ),
                        side: BorderSide(color: AppColors.primary),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnboardingScreen(),
                          ),
                        );
                      },
                      child: Center(child: Text('Back', style: AppText.s20w6)),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
