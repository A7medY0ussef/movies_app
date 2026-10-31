import 'package:flutter/material.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/theme/app_theme.dart';
import 'package:movies_app/modules/splash/presentation/screens/splash_screen.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.dark,
          home: SplashScreen(),
        );
      },
    );
  }
}
