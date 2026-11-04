import 'dart:ui';

import 'package:movie_app/core/constants/assets.dart';

class OnboardingModel {
  final String image;
  final List<Color> gradient;
  final String title;
  String? desc;

  OnboardingModel({
    required this.image,
    required this.gradient,
    required this.title,
    this.desc,
  });

  static List<OnboardingModel> listOnboard = [
    OnboardingModel(
      image: Assets.bgOnboarding1,
      gradient: [
        const Color(0xff084250).withValues(alpha: 0),
        const Color(0xff084250),
      ],
      title: 'onboarding.discover_title',
      desc: 'onboarding.discover_desc',
    ),
    OnboardingModel(
      image: Assets.bgOnboarding2,
      gradient: [
        const Color(0xff85210E).withValues(alpha: 0),
        const Color(0xff85210E),
      ],
      title: 'onboarding.genres_title',
      desc: 'onboarding.genres_desc',
    ),
    OnboardingModel(
      image: Assets.bgOnboarding3,
      gradient: [
        const Color(0xff4C2471).withValues(alpha: 0),
        const Color(0xff4C2471),
      ],
      title: 'onboarding.watchlist_title',
      desc: 'onboarding.watchlist_desc',
    ),
    OnboardingModel(
      image: Assets.bgOnboarding4,
      gradient: [
        const Color(0xff601321).withValues(alpha: 0),
        const Color(0xff601321),
      ],
      title: 'onboarding.review_title',
      desc: 'onboarding.review_desc',
    ),
    OnboardingModel(
      image: Assets.bgOnboarding5,
      gradient: [
        const Color(0xff2A2C30).withValues(alpha: 0),
        const Color(0xff2A2C30),
      ],
      title: 'onboarding.start_title',
    ),
  ];
}
