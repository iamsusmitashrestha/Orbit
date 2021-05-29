import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:orbit/common/constants/logo_image.dart';
import 'splash_vm.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => locator<SplashViewModel>(),
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Image.asset(
            logo_image,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
