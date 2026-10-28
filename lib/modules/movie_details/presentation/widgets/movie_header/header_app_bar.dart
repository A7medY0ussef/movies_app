import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/theme/app_colors.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_ios_outlined, color: AppColors.white, size: 30)),
        Spacer(),
        Icon(Icons.bookmark, color: AppColors.white, size: 30),
      ],
    );
  }
}
