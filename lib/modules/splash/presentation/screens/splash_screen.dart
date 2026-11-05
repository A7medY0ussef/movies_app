import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routes/route_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ElasticIn(
                  duration: const Duration(seconds: 2),
                  child: Image.asset('assets/logo/app_logo.png'),
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(seconds: 2),
              child: Image.asset('assets/logo/route_logo.png'),
            ),
            FadeInUp(
              delay: const Duration(seconds: 2),
              onFinish: (direction) {
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  context.go(RouteName.layout);
                } else {
                  context.go(RouteName.onBoarding);
                }
              },
              child: Image.asset('assets/logo/Supervised by Mohamed Nabil.png'),
            ),
          ],
        ),
      ),
    );
  }
}
