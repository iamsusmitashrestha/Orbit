import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:orbit/core/di/injection.dart';
import 'package:orbit/themes/app_themes.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/routes/auto_router.gr.dart';

void main() async {
  await GetStorage.init();
  configureDependencies();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1330),
      builder: () => OKToast(
        child: MaterialApp(
          navigatorKey: StackedService.navigatorKey,
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Orbit',
          theme: AppThemes.light,
          themeMode: ThemeMode.light,
          onGenerateRoute: AutoRouter(),
        ),
      ),
    );
  }
}
