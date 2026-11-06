import 'package:flutter/material.dart';
import 'package:movie_app/modules/onboarding/presentation/onboarding_model.dart';

class BodyOnboarding extends StatelessWidget {
  const BodyOnboarding({super.key, required this.onboardingInfo});

  final OnboardingModel onboardingInfo;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(onboardingInfo.image),
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
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
      ],
    );
  }
}
