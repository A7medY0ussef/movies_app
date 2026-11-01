import 'dart:ui';

import 'package:movies_app/core/constants/assets.dart';

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
      title: 'Discover Movies',
      desc:
          'Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
    ),
    OnboardingModel(
      image: Assets.bgOnboarding2,
      gradient: [
        const Color(0xff85210E).withValues(alpha: 0),
        const Color(0xff85210E),
      ],
      title: 'Explore All Genres',
      desc:
          'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
    ),
    OnboardingModel(
      image: Assets.bgOnboarding3,
      gradient: [
        const Color(0xff4C2471).withValues(alpha: 0),
        const Color(0xff4C2471),
      ],
      title: 'Create Watchlists',
      desc:
          'Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.',
    ),
    OnboardingModel(
      image: Assets.bgOnboarding4,
      gradient: [
        const Color(0xff601321).withValues(alpha: 0),
        const Color(0xff601321),
      ],
      title: 'Rate, Review, and Learn',
      desc:
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    ),
    OnboardingModel(
      image: Assets.bgOnboarding5,
      gradient: [
        const Color(0xff2A2C30).withValues(alpha: 0),
        const Color(0xff2A2C30),
      ],
      title: 'Start Watching Now',
    ),
  ];
}
