import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:orbit/features/signup/views/role_selection_view.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image.asset("assets/images/logo.png"),
        splashTransition: SplashTransition.scaleTransition,
        splashIconSize: 200,
        duration: 2200,
        customTween: CurveTween(
          curve: Curves.bounceOut,
        ),
        animationDuration: Duration(seconds: 2),
        backgroundColor: Colors.white,
        nextScreen: RoleSelectionView(),
      ),
    );
  }
}
