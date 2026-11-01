import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/modules/layout/presentation/screens/layout_screen.dart';
import 'package:movies_app/modules/onboarding/presentation/screens/start_screen.dart';

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
                  duration: Duration(seconds: 2),
                  child: Image.asset('assets/logo/app_logo.png'),
                ),
              ),
            ),
            FadeInUp(
              delay: Duration(seconds: 2),
              child: Image.asset('assets/logo/route_logo.png'),
            ),
            FadeInUp(
              delay: Duration(seconds: 2),
              onFinish: (direction) {
                Navigator.pushReplacement(
                  context,
                  // MaterialPageRoute(builder: (context) => LauoutScreen()),
                  MaterialPageRoute(builder: (context)=> StartScreen())
                );
              },
              child: Image.asset('assets/logo/Supervised by Mohamed Nabil.png'),
            ),
          ],
        ),
      ),
    );
  }
}
