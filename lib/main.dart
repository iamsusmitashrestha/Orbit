import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/core/routes/auto_router.gr.dart';
import 'package:orbit/core/utils/setup_snackbar.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/stacked_widgets/custom_stacked_setup.dart';

void main() async {
  await GetStorage.init();
  configureDependencies();
  customStackedSetup();
  setupSnackbarUi();
  runApp(MyApp());
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MyApp(),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      title: 'Orbit',
      theme: AppThemes.light,
      themeMode: ThemeMode.light,
      onGenerateRoute: AutoRouter(),
    );
  }
}
