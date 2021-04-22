import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/routes/auto_router.gr.dart';

void main() async {
  await GetStorage.init();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        navigatorKey: StackedService.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppThemes.light,
        themeMode: ThemeMode.light,
        onGenerateRoute: AutoRouter(),
      ),
    );
  }
}
