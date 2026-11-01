import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_style.dart';
import 'package:movies_app/modules/layout/presentation/screens/layout_screen.dart';
import 'package:movies_app/modules/onboarding/presentation/onboarding_model.dart';
import 'package:movies_app/modules/onboarding/presentation/widget/body_onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        onPageChanged: (value) {
          currentIndex = value;
          setState(() {});
        },
        itemCount: OnboardingModel.listOnboard.length,
        itemBuilder: (context, index) {
          return BodyOnboarding(
            onboardingInfo: OnboardingModel.listOnboard[index],
          );
        },
      ),

      bottomSheet: BottomSheet(
        showDragHandle: false,
        enableDrag: false,
        backgroundColor: AppColors.background,
        onClosing: () {},
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  OnboardingModel.listOnboard[currentIndex].title,
                  style: AppText.s24wB.copyWith(color: Colors.white),
                ),
                SizedBox(height: 20.h),
                if (OnboardingModel.listOnboard[currentIndex].desc != null)
                  Text(
                    OnboardingModel.listOnboard[currentIndex].desc!,
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
                    shape: RoundedRectangleBorder(borderRadius: .circular(16)),
                  ),
                  onPressed: () {
                    currentIndex == OnboardingModel.listOnboard.length - 1
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LayoutScreen();
                              },
                            ),
                          )
                        : controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                  },
                  child: Center(
                    child: Text(
                      currentIndex == OnboardingModel.listOnboard.length - 1
                          ? 'Finish'
                          : 'Next',
                      style: AppText.s20w6,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (currentIndex != 0)
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
                      controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Center(child: Text('Back', style: AppText.s20w6)),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
