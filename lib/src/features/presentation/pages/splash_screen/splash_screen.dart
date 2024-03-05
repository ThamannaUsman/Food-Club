import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:food_club/src/core/constants/asset.dart';
import 'package:food_club/src/core/constants/color.dart';
import 'package:food_club/src/features/presentation/pages/auth/login_page/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedSplashScreen(
      splash: ImageAssets.logo,
      splashIconSize: 250,
      nextScreen: const LoginPage(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: AppColors().blackColor,
      duration: 2000,
    );
  }
}
