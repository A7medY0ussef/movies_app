import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/modules/auth/presentation/screens/login/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Image.asset('assets/logo/Supervised by Mohamed Nabil.png'),
          ),
        ],

      ),
    );
  }
}
