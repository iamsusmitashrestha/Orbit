import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
