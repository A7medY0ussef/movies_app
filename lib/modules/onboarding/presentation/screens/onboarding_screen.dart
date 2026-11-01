import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies_app/core/constants/assets.dart';
import 'package:movies_app/core/theme/app_colors.dart';
import 'package:movies_app/core/theme/app_text_style.dart';
import 'package:movies_app/modules/onboarding/presentation/onboarding_model.dart';
import 'package:movies_app/modules/onboarding/presentation/widget/body_onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff084250),
      body: PageView.builder(
        itemCount: OnboardingModel.listOnboard.length,
        itemBuilder: (context, index) {
          return BodyOnboarding(
            index: index,
            onboardingInfo: OnboardingModel.listOnboard[index],
          );
        },
      ),
    );
  }
}


  // Container(
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           image: AssetImage(Assets.bgOnboarding1),
  //           alignment: Alignment.topCenter,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       child: Stack(
  //         children: [
  //           Positioned(
  //             top: 0,
  //             left: 0,
  //             right: 0,
  //             height: 700.r,

  //             child: Container(
  //               decoration: BoxDecoration(
  //                 gradient: LinearGradient(
  //                   begin: Alignment.topCenter,
  //                   end: Alignment.bottomCenter,
  //                   colors: [
  //                     const Color(0xff084250).withValues(alpha: 0),
  //                     const Color(0xff084250),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),

  //           Align(
  //             alignment: Alignment.bottomCenter,
  //             child: Container(
  //               width: double.infinity,
  //               decoration: BoxDecoration(
  //                 color: AppColors.background,
  //                 borderRadius: BorderRadius.only(
  //                   topLeft: Radius.circular(40.r),
  //                   topRight: Radius.circular(40.r),
  //                 ),
  //               ),
  //               padding: .all(16),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Text(
  //                     'Discover Movies',
  //                     style: AppText.s24wB.copyWith(color: Colors.white),
  //                   ),
  //                   SizedBox(height: 20.h),
  //                   Text(
  //                     'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
  //                     textAlign: TextAlign.center,
  //                     style: AppText.s20w4.copyWith(
  //                       color: Colors.white.withValues(alpha: 0.6),
  //                     ),
  //                   ),
                    
  //                   SizedBox(height: 24.h),
  //                   ElevatedButton(
  //                     style: ElevatedButton.styleFrom(
  //                       padding: .all(12.r),
  //                       backgroundColor: AppColors.primary,
  //                       foregroundColor: AppColors.background,
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: .circular(16),
  //                       ),
  //                     ),
  //                     onPressed: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                           builder: (context) => OnboardingScreen(),
  //                         ),
  //                       );
  //                     },
  //                     child: Center(child: Text('Next', style: AppText.s20w6)),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
   