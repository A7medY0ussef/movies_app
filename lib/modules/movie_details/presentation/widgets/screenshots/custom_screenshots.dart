import 'package:flutter/material.dart';

class CustomScreenshots extends StatelessWidget {
  final String screenShot;
  const CustomScreenshots({super.key, required this.screenShot});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 13),
      height: 167,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(screenShot),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
