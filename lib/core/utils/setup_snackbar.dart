import 'package:flutter/material.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  // Registers a config to be used when calling showSnackbar
  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: PRIMARY_COLOR,
    messageColor: Colors.white,
  ));
}
