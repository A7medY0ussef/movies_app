import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/core/routes/route_name.dart';

class BackButtonOverlay extends StatelessWidget {
  final Widget child;
  const BackButtonOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go(RouteName.home);
                  }
                },
                icon: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: AppColors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
