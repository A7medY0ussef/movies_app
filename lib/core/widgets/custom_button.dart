import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color fgColor;
  const CustomButton({
    super.key,
    required this.title,
    required this.bgColor,
    required this.fgColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 398,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {},
        child: Text(title, style: AppText.s20w6),
      ),
    );
  }
}
