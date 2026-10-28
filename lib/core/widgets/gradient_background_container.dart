import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class GradientBackgroundContainer extends StatelessWidget {
  final ImageProvider image;
  final double height;
  final Widget child;
  final double beginGradient;
  final double endGradient;
  const GradientBackgroundContainer({
    super.key,
    required this.image,
    required this.height,
    required this.child,
    this.beginGradient = 0.80 ,
    this.endGradient = 0.60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.background.withValues(alpha: beginGradient),
              AppColors.background.withValues(alpha: endGradient),
              AppColors.background,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
