// import 'package:baby_shop_hub/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:baby_shop_hub/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}
